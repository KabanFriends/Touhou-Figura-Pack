--setup models
model.all.setPos({0,-2,0})

vec = {0,18.5,0}
for key, value in pairs(model.all) do
	if (type(value) == "table") then
		value.setPos(vec)
	end
end

vec = {0,-5.5,0}
model.all.Head.setPos(vec)

prevRad = 0
radx = 0
function tick()
	prevRad = radx
	radx = radx + 1
end

--sine wave animation
function render(delta)
	value = lerp(prevRad, radx, delta)
	model.all.sinFloat.setPos({0,18.5 + math.sin(value/10),0})
end

--mathematic functions
function lerp(a,b,x)
    return a+(b-a)*x
end