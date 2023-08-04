--[[ BLINK ]]
--init
models.player_model.all.Body.blink:setVisible(true)

--blinking animation
local blinkTimer = 0
local endValue = math.random(5,80)

events.TICK:register(function()
	if (models.player_model.all.Body.blink:getVisible() == false) then
		models.player_model.all.Body.blink:setVisible(true)
	end
	
	blinkTimer = blinkTimer + 1
	
	if (blinkTimer >= endValue) then
		blinkTimer = 0
		endValue = math.random(5,80)
		
		models.player_model.all.Body.blink:setVisible(false)
	end
end)

--[[ SCRIPT ]]
--hide the chestPlate bones when offhand item exists
events.RENDER:register(function (delta, context)
	if (player:isLeftHanded() == true) then
		if (player:getHeldItem(false).id ~= "minecraft:air") then
			models.player_model.all.LeftArm.chestPlate:setVisible(false)
		else
			models.player_model.all.LeftArm.chestPlate:setVisible(true)
		end
	else
		if (player:getHeldItem(true).id ~= "minecraft:air") then
			models.player_model.all.LeftArm.chestPlate:setVisible(false)
		else
			models.player_model.all.LeftArm.chestPlate:setVisible(true)
		end
	end
end)
