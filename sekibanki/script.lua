--[[ SETUP ]]
--hide default player skin
vanilla_model.PLAYER:setVisible(false)

--setup models
models.player_model:scale(1.3, 1.3, 1.3)

models.player_model.all.RightArm:setRot(0, 0, 7)
models.player_model.all.LeftArm:setRot(0, 0, -7)

--setup skull
local skullmodel = models.player_model.all.Head:copy("SkullModel")
skullmodel:setParentType("None")
skullmodel:setPos(0, -20.5, 0)
skullmodel:removeChild(skullmodel.blink)
models.skull.Skull:addChild(skullmodel)

--setup tablist portrait
local portmodel = models.player_model.all.Head:copy("SkullModel")
portmodel:setParentType("None")
portmodel:setPos(0, -20.5, 0)
portmodel:removeChild(portmodel.blink)
models.skull.Portrait:addChild(portmodel)
