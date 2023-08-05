--hide the book when offhand item exists (also change the arm rotation)
events.RENDER:register(function (delta, context)
	if (player:isLeftHanded() == true) then
		if (player:getHeldItem(false).id ~= "minecraft:air") then
			models.player_model.all.LeftArm.chestPlateLeft:setVisible(false)
			models.player_model.all.LeftArm:setRot(0, 0, -7)
		else
			models.player_model.all.LeftArm.chestPlateLeft:setVisible(true)
			models.player_model.all.LeftArm:setRot(0, 0, -13)
		end
	else
		if (player:getHeldItem(true).id ~= "minecraft:air") then
			models.player_model.all.LeftArm.chestPlateLeft:setVisible(false)
			models.player_model.all.LeftArm:setRot(0, 0, -7)
		else
			models.player_model.all.LeftArm.chestPlateLeft:setVisible(true)
			models.player_model.all.LeftArm:setRot(0, 0, -13)
		end
	end
end)
