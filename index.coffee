http = require('http')
httpProxy = require('http-proxy')

proxy = httpProxy.createProxyServer({ autoRewrite: true, protocolRewrite: true, secure: false })

proxy.on 'proxyReq', (proxyReq, req, res, options) ->
  proxyReq.setHeader('Host', 'hooks.slack.com:443')
  yes

proxy.on 'proxyRes', (proxyRes, req, res) ->
  yes

http.createServer((req, res) ->
  proxy.web(req, res, target: 'https://hooks.slack.com')
).listen(8000)
