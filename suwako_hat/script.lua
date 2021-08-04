--setup models
model.all.setScale({1.1,1.1,1.1})
model.all.Head.blink.setEnabled(false)

vec = {0,18.5,0}
for key, value in pairs(model.all) do
	if (type(value) == "table") then
		value.setPos(vec)
	end
end

vec = {0,-6,0}
model.all.Head.setPos(vec)

--blinking animation
blinkTimer = 0
endValue = math.random(5,80)
function tick()
	if (model.all.Head.blink.getEnabled() == true) then
		model.all.Head.blink.setEnabled(false)
	end
	
	blinkTimer = blinkTimer + 1
	
	if (blinkTimer >= endValue) then
		blinkTimer = 0
		endValue = math.random(5,80)
		
		model.all.Head.blink.setEnabled(true)
	end
end