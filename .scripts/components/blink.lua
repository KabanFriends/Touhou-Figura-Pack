--init
models.player_model.all.Head.blink:setVisible(false)

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
