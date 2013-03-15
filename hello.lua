-- Load the http library
local HTTP = require("http")
local env = require("env")
local port = env.get("PORT")

if not port then
  port = 8080
end

-- Create a simple nodeJS style hello-world server
HTTP.createServer(function (req, res)
  local body = "Hello from Luvit!\n"
  res:writeHead(200, {
    ["Content-Type"] = "text/plain",
    ["Content-Length"] = #body
  })
  res:finish(body)
end):listen(port)

-- Give a friendly message
print("Server listening at http://0.0.0.0:" .. port)