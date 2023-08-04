--sine and cosine wave animation
local prevRad = 0
local radx = 0
events.TICK:register(function ()
	prevRad = radx
	radx = radx + 1
end)

--sine and cosine wave animation
events.RENDER:register(function (delta, context)
	local value = math.lerp(prevRad, radx, delta)
	models.player_model.all.pipa.chestPlate.sinFloat:setPos(0, math.sin(value/10), 0)
end)
