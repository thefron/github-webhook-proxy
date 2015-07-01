http = require('http')
httpProxy = require('http-proxy')
httpProxy.createServer (req, res, proxy) ->
  proxy.proxyRequest(req, res, { host: 'hooks.slack.com', port: 443 })
.listen(8000)
