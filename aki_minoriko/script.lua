--hide default player skin
vanilla_model.PLAYER:setVisible(false)

--setup models
models.player_model:scale(1.3, 1.3, 1.3)

models.player_model.all.RightArm:setRot(0, 0, 0)
models.player_model.all.LeftArm:setRot(0, 0, 0)

models.player_model.all.Head.blink:setVisible(false)

--setup skull
local part = models.player_model.all.Head:copy("SkullModel")
part:setParentType("None")
part:setPos(0, -18, 0)
part:removeChild(part.blink)
models.skull.Skull:addChild(part)

--blinking animation
local blinkTimer = 0
local endValue = math.random(5,80)

events.TICK:register(function()
	if (models.player_model.all.Head.blink:getVisible() == true) then
		models.player_model.all.Head.blink:setVisible(false)
	end
	
	blinkTimer = blinkTimer + 1
	
	if (blinkTimer >= endValue) then
		blinkTimer = 0
		endValue = math.random(5,80)
		
		models.player_model.all.Head.blink:setVisible(true)
	end
end)

--sitting animation
events.RENDER:register(function(delta, ctx)
	models.player_model.all.Head:setPos(0, 0, 0)
	if (player:getVehicle() ~= nil) then
		models.player_model.all.Body.sittingRotationSkirt:setRot(25, 0, 0)
	else
		models.player_model.all.Body.sittingRotationSkirt:setRot(0, 0, 0)
	end
end)
