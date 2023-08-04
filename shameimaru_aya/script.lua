--hide the fan when offhand item exists
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
