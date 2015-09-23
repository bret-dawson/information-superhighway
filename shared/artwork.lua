local ArtIsOurPal = function() 

   local Html1 = '<!DOCTYPE html><html><head><title>Why Not Enjoy Pictures?</title></head><body style="margin: 30px; background-color:wheat;">'
   local Html2 = '</body></html>'
   local Drawer = {}
   Drawer.makeArt = function(Urls)
      math.randomseed(os.ts.time())
      math.random()
      math.random()
      local PicNumber = math.random(#Urls)
      local ImgTag = '<img src="' .. Urls[PicNumber] .. '">'
      return Html1 .. ImgTag .. Html2
   end
   return Drawer
end

return ArtIsOurPal()
