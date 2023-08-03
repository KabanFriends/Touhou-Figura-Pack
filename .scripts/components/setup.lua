--hide default player skin
vanilla_model.PLAYER:setVisible(false)

--setup models
models.player_model:scale(1.3, 1.3, 1.3)

models.player_model.all.RightArm:setRot(0, 0, 0)
models.player_model.all.LeftArm:setRot(0, 0, 0)

--setup skull
local part = models.player_model.all.Head:copy("SkullModel")
part:setParentType("None")
part:setPos(0, -18, 0)
part:removeChild(part.blink)
models.skull.Skull:addChild(part)
