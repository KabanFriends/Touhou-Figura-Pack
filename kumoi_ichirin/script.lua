--sine and cosine wave animation
local prevRad = 0
local radx = 0
events.TICK:register(function ()
	prevRad = radx
	radx = radx + 1
end)

events.RENDER:register(function (delta, context)
	local value = math.lerp(prevRad, radx, delta)
	models.player_model.all.LeftArm.chestPlateLeft.sinFloat:setPos(0, math.sin(value/10), 0)
	models.player_model.all.RightArm.chestPlateRight.cosFloat:setPos(0, math.cos(value/10), 0)
end)

--action pings
function pings.enableUnzan()
	models.player_model.all.Head.chestPlate:setVisible(true)
	models.player_model.all.RightArm.chestPlateRight:setVisible(true)
	models.player_model.all.LeftArm.chestPlateLeft:setVisible(true)
end

function pings.disableUnzan()
	models.player_model.all.Head.chestPlate:setVisible(false)
	models.player_model.all.RightArm.chestPlateRight:setVisible(false)
	models.player_model.all.LeftArm.chestPlateLeft:setVisible(false)
end

pings.disableUnzan()

local wheel = action_wheel:newPage()
action_wheel:setPage(wheel)

local action = wheel:newAction()
action:setItem("minecraft:pink_wool")
action:setTitle("Toggle Unzan")
action:onToggle(function (state, self)
	if (state == true) then
		pings.enableUnzan()
	else
		pings.disableUnzan()
	end
end)