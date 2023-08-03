--hide default player skin
vanilla_model.PLAYER:setVisible(false)

--setup models
models:scale(1.3, 1.3, 1.3)

models.player_model.all.RightArm:setRot(0, 0, 0)
models.player_model.all.LeftArm:setRot(0, 0, 0)

models.player_model.all.Head.blink:setVisible(false)

vec = vectors.vec3(0, 18.5, 0)
for key, value in pairs(models.player_model.all:getChildren()) do
	if (type(value) == "table") then
		value:setPos(vec)
	end
end

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
	if (player:getVehicle() ~= nil) then
		models.player_model.all.Body.sittingRotationSkirt:setRot(25, 0, 0)
	else
		models.player_model.all.Body.sittingRotationSkirt:setRot(0, 0, 0)
	end
end)
