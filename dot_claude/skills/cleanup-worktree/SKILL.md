---
name: cleanup-worktree
description: Tear down the current git worktree and its branch when a work stream is done — either because it merged, or because the idea is being abandoned. Use when the user says things like "clean up this worktree", "merged it, clean up", "wipe this worktree", "abandon this", "scrap this branch", or asks to tear down/remove the worktree they're currently in.
---

# Cleanup worktree

Tears down the worktree the current session is in, plus its branch (local
and remote), for two different situations. Always figure out which one
applies before touching anything — the safety checks differ.

## Step 0: Confirm we're actually in a worktree

Run `git rev-parse --show-toplevel` and check whether the path contains
`.claude/worktrees/`. If not, stop and tell the user there's no worktree
to clean up here (don't touch the main checkout's branch).

## Step 1: Figure out which case this is

Ask (via AskUserQuestion, unless the user's own wording already made it
obvious — e.g. "I merged it" or "scrap this / abandon this") whether the
work merged or is being abandoned. The two paths have different guardrails
below.

## Case A: Merged

1. Find the PR for the current branch: `gh pr view --json state,mergeCommit,baseRefName,headRefName`.
2. If `state` isn't `MERGED`, stop and tell the user — don't take their word
   for it over what GitHub actually shows. Squash/rebase merges mean the
   local commit SHA will *not* be an ancestor of the base branch even
   though it's merged — don't use `git merge-base --is-ancestor` as the
   check; trust the PR `state` field instead.
3. Confirm the merge commit's diff on the base branch actually matches
   (spot-check via `git show <mergeCommit.oid> --stat`) — cheap sanity
   check that this is really the same work, not a same-named stale PR.
4. `git status --short` — if there's uncommitted work, stop and ask the
   user what to do with it (it wouldn't be covered by the merge).
5. `ExitWorktree` with `action: "remove"`, `discard_changes: true` (safe —
   step 2/3 already confirmed the commits are captured elsewhere).
6. Delete the remote branch without asking (`git push origin --delete
   <branch>`) — the merge confirmation in steps 2/3 is enough authorization,
   since the work is already captured on the base branch. GitHub sometimes
   auto-deletes it on merge already, so check `git branch -a` first and
   skip gracefully if it's already gone.
7. Report what was removed.

## Case B: Abandoning (no merge, idea scrapped)

This is destructive and unrecoverable once done — treat it accordingly.

1. `git status --short` and `git log <base-branch>..HEAD --oneline` (or
   the equivalent for whatever the worktree branched from) to show the
   user exactly what will be lost: uncommitted changes and every commit
   that only exists on this branch.
2. If there's anything there, show it to the user and explicitly confirm
   they want to discard it — don't infer consent from "abandon this" alone
   once you can see there's real work on the line; a one-line summary
   ("this will discard 3 commits and 2 uncommitted files") plus a yes/no
   is enough, doesn't need to be a big production.
3. Check for an open PR on this branch (`gh pr view --json state,url`). If
   one exists and is open, ask whether to close it (`gh pr close`) rather
   than leaving a dangling PR against a branch that's about to disappear.
4. `ExitWorktree` with `action: "remove"`, `discard_changes: true`.
5. If the branch was pushed to origin, ask before deleting it there too
   (`git push origin --delete <branch>`).
6. Report what was removed.

## Notes

- Never skip the confirmation in Case B just because the user said
  "abandon"/"scrap"/"wipe" — that phrasing tells you *which path*, not
  that they've already seen what's being thrown away.
- Local branch cleanup happens automatically as part of `ExitWorktree`'s
  removal — no separate `git branch -d` needed.
- If `gh` isn't authenticated or the repo has no remote, skip the PR/remote
  branch steps rather than failing the whole cleanup.
