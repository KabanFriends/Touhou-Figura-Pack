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
