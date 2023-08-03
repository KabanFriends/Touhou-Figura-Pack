--sine wave animation
local prevRad = 0
local radx = 0

events.TICK:register(function ()
	prevRad = radx
	radx = radx + 1
end)

events.RENDER:register(function (delta, context)
	local value = math.lerp(prevRad, radx, delta)
	models.player_model.all.sinFloat:setPos(0, math.sin(value/10), 0)
end)

--action pings
function pings.enableCommunism()
	models.player_model.all.Head.helmet:setVisible(true)
	models.player_model.all.Body.chestPlateMiddle:setVisible(true)
	models.player_model.all.RightArm.chestPlateRight:setVisible(true)
	models.player_model.all.LeftArm.chestPlateLeft:setVisible(true)
	models.player_model.all.RightLeg.leggingsRight:setVisible(true)
	models.player_model.all.LeftLeg.leggingsLeft:setVisible(true)
	
	models.player_model.all.Head._helmet:setVisible(false)
	models.player_model.all.Body._chestPlateMiddle:setVisible(false)
	models.player_model.all.RightArm._chestPlateRight:setVisible(false)
	models.player_model.all.LeftArm._chestPlateLeft:setVisible(false)
	models.player_model.all.RightLeg._leggingsRight:setVisible(false)
	models.player_model.all.LeftLeg._leggingsLeft:setVisible(false)
end

function pings.disableCommunism()
	models.player_model.all.Head.helmet:setVisible(false)
	models.player_model.all.Body.chestPlateMiddle:setVisible(false)
	models.player_model.all.RightArm.chestPlateRight:setVisible(false)
	models.player_model.all.LeftArm.chestPlateLeft:setVisible(false)
	models.player_model.all.RightLeg.leggingsRight:setVisible(false)
	models.player_model.all.LeftLeg.leggingsLeft:setVisible(false)
	
	models.player_model.all.Head._helmet:setVisible(true)
	models.player_model.all.Body._chestPlateMiddle:setVisible(true)
	models.player_model.all.RightArm._chestPlateRight:setVisible(true)
	models.player_model.all.LeftArm._chestPlateLeft:setVisible(true)
	models.player_model.all.RightLeg._leggingsRight:setVisible(true)
	models.player_model.all.LeftLeg._leggingsLeft:setVisible(true)
end

pings.disableCommunism()

--action wheel
local wheel = action_wheel:newPage()
action_wheel:setPage(wheel)

local action = wheel:newAction()

action:setItem("minecraft:golden_pickaxe")
action:setTitle("Toggle Communism")
action:onToggle(function (state, self)
	if (state == true) then
		pings.enableCommunism()
	else
		pings.disableCommunism()
	end
end)
