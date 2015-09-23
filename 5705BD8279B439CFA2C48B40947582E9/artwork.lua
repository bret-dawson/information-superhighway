local ArtIsOurPal = function() 

   local Html1 = '<!DOCTYPE html><html><head><title>Art Is Our Pal</title></head><body style="margin: 30px; background-color:purple;">'
   local Html2 = '</body></html>'
   local Drawer = {}
   Drawer.makeArt = function(Urls)
      math.randomseed(os.ts.time())
      math.random()
      math.random()
      local PicNumber = math.random(#Urls)
      local Art = '<img src="https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/1/005/06a/0bc/2b38fc4.jpg" style="padding: 10px;">'
      local ImgTags = '<img src="' .. Urls[PicNumber] .. '">'
      return Html1 .. Art .. ImgTags .. Art .. Html2
   end
   return Drawer
end

return ArtIsOurPal()


