--sitting animation
events.RENDER:register(function(delta, ctx)
	models.player_model.all.Head:setPos(0, 0, 0)
	if (player:getVehicle() ~= nil) then
		models.player_model.all.Body.sittingRotationSkirt:setRot(25, 0, 0)
	else
		models.player_model.all.Body.sittingRotationSkirt:setRot(0, 0, 0)
	end
end)