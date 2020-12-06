
require "ISUI/ISPanel"
require "ISUI/ISButton"

local oldISWOCMcreateMenu = ISWorldObjectContextMenu.createMenu;

ISWorldObjectContextMenu.createMenu = function(player, worldobjects, x, y, test)
  context = oldISWOCMcreateMenu(player,worldobjects, x, y, test);
  
  if clickedSquare then
    local clickX = clickedSquare:getX();
    local clickY = clickedSquare:getY();
    local clickZ = clickedSquare:getZ();
    local text = "";
    local t, i;
    local zones = getWorld():getMetaGrid():getZonesAt(clickX, clickY, clickZ);
    if zones then
      for i=0,zones:size()-1 do
        t = zones:get(i):getType();
        if 0 == i then
          text = "Zone(s): " .. t
        else
          text = text .. ", " .. t;
        end
      end
    end
    if text == "" then text = "Zone(s): None" end;
    -- (x, y, width, height, title, clicktarget, onclick, onmousedown, allowMouseUpProcessing)
    button = ISButton:new(0, -17, getTextWidth(text), 17, text, nil, nil);
    context:addChild(button);
  end
  
  return context;
  
end 