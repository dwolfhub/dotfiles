from urllib.parse import urlsplit, parse_qs
from json import dumps
from sys import argv
from subprocess import check_output
from pygments import highlight
from pygments.lexers import JsonBareObjectLexer
from pygments.formatters import TerminalFormatter

url = argv[1]
spliturl = urlsplit(url)
parsedqs = parse_qs(spliturl.query)
json = dumps({
    "scheme": spliturl.scheme,
    "host": spliturl.netloc,
    "path": spliturl.path,
    "query": parsedqs,
    "fragment": spliturl.fragment,
}, indent=4)
print(
    highlight(json, JsonBareObjectLexer(), TerminalFormatter())
)





# 'https://login.microsoftonline.com/yusaauthdev.onmicrosoft.com/oauth2/v2.0/authorize?p=b2c_1_signinup&client_id=7f5de07b-3d7b-41ee-bd88-534da48ba8df&redirect_uri=https%3A%2F%2Flocalhost%3A8080%2Fsignin-oidc&response_type=id_token&scope=openid%20profile&response_mode=form_post&nonce=636947371025935110.ZWYxNzA0ZDEtMzY2Mi00MzUwLWIwZDEtNTc4ZjdhNGQ2YmI2MmNkY2ZiYmQtMzZhYy00NmM1LWI5MDEtY2YwNGY0YmQ5ZmQy&state=CfDJ8EbXJswJaapGt3GJyG9CzKaLP2XlckRyDnjgb3Sv6V_QEORJuk3CptGNTRuYCRbXZJXCx4enMuamccQsWzxlycNfW7qh3n4vpAzSPwKg-7TIYf0y0v-QVfv7Vj0R4mNaHpx75ahXb7MpViJwXr4DX0U54M27sWy_UOy9XYXE9zJjtRHmBdpnS28VwDKIy4diYWcizTd6x3wgyDOtueS-6vBL1rNfQEO7kVt8qBfX54rKgvLduhqjlMBKIFR-IizY5rZlPo_no33DQ8Kqq7oQtysm8SnVXvVbKz6_TulMw5pMBBmpz8N5_EI3nutfcEfNDg&x-client-SKU=ID_NETSTANDARD2_0&x-client-ver=5.4.0.0'



