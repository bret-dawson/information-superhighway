local Art    = require 'artwork'
local Flickr = require 'flickr'
local Config = require 'config'
local Hi     = require 'well_hello_there'


function main(Request)
   local ReqTag
   --if (iguana.isTest()) then
      local Ask = net.http.parseRequest{data=Request}
      ReqTag = Ask.params.pic or nil
   --end 
	local Pics = Flickr:urls(Config, ReqTag)
   trace(Pics)
   trace(#Pics)
	net.http.respond{body=Art.makeArt(Pics)}
end

