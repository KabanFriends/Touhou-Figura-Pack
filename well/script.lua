--hide default player skin
for key, value in pairs(vanilla_model) do
	value.setEnabled(false)
end

--setup models
vec = {0,25,0}
for key, value in pairs(model) do
	value.setPos(vec)
end
