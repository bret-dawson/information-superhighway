function super_harrison() 
   local jj = xml.parse{data='<tag><inner_tag>\nFRIENDLY CONTENT</inner_tag></tag>'}
   local Val = jj.tag.inner_tag[1]:nodeValue()
   Val = kindness() .. Val .. generosity()
   
   return Val .. ': ' .. sha1.hex(Val) .. " \nThis is pretty good"

end