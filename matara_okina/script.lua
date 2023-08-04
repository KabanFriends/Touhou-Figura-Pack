--sine and cosine wave animation
local prevRad = 0
local radx = 0
events.TICK:register(function ()
	prevRad = radx
	radx = radx + 1
end)

events.RENDER:register(function (delta, context)
	local value = math.lerp(prevRad, radx, delta)
	models.player_model.all.sinFloat:setPos(0, math.sin(value/10), 0)
	models.player_model.all._sinFloat:setPos(0, -math.sin(value/10), 0)
	models.player_model.all.cosFloat:setPos(0, math.cos(value/10), 0)
	models.player_model.all._cosFloat:setPos(0, -math.cos(value/10), 0)
end)

--action pings
function pings.enableDoors() models.player_model.all.helmet:setVisible(true) end
function pings.disableDoors() models.player_model.all.helmet:setVisible(false) end

pings.disableDoors()

--action wheel
local wheel = action_wheel:newPage()
action_wheel:setPage(wheel)

local action = wheel:newAction()
action:setItem("minecraft:iron_door")
action:setTitle("Toggle Back Doors")
action:onToggle(function(state, self)
	if (state == true) then
		pings.enableDoors()
	else
		pings.disableDoors()
	end
end)