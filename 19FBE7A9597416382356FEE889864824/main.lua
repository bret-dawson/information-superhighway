local SayHi = require 'well_hello_there'
require 'node'

function main(Data)   
   local Request = net.http.parseRequest{data=Data}
   trace(Request)
   net.http.respond{body="Well well well well"}
end
