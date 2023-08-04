--setup models
models.player_model:scale(1.2, 1.2, 1.2)

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
