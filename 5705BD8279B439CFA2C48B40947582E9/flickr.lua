local Tank = require 'store'
local Flickr = function()
   local Params = {
      method       = 'flickr.photos.search',
      tag_mode     = 'all',
      content_type = '1',
      media        = 'photos'
   }
   
   function get(P)
      local Resp = net.http.get{
         url = "https://api.flickr.com/services/rest/",
         parameters = P,
         live = true
      }
      return Resp
   end 
   
   function checkCache(P) 
      local Time = os.ts.time()
      local Key = json.serialize{data=P}
      if Tank.get(Key .. '_time') 
         and Time - Tank.get(Key .. '_time') < 400000 then
         return Tank.get(Key)
      end
      local Goods = get(P)
      Tank.put(Key, Goods)
      Tank.put(Key .. '_time', os.ts.time())
      return Goods
   end

   local F = {}
   function F:urls(LocalParms, Tag) 
      local Urls = {}
      for k,v in pairs(LocalParms) do Params[k] = v end
      if Tag then Params.tags = Tag end
      trace(Params)
      local Chart = xml.parse{data=checkCache(Params)}
      for i=1, Chart.rsp:child('photos'):childCount('photo') do
         local Pic = Chart.rsp.photos:child('photo', i)
         Urls[i] = 'https://farm' .. Pic.farm .. '.staticflickr.com/' 
                    .. Pic.server .. '/' .. Pic.id .. '_' .. Pic.secret .. '.jpg'
      end
      return Urls
   end
   return F
end

return Flickr()
