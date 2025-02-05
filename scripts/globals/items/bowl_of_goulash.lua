-----------------------------------
-- ID: 5750
-- Item: bowl_of_goulash
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- VIT +3
-- INT -2
-- Accuracy +10% (cap 54)
-- DEF +10% (cap 30)
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if
        target:hasStatusEffect(xi.effect.FOOD) or
        target:hasStatusEffect(xi.effect.FIELD_SUPPORT_FOOD)
    then
        result = xi.msg.basic.IS_FULL
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 5750)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.VIT, 3)
    target:addMod(xi.mod.INT, -2)
    target:addMod(xi.mod.FOOD_ACCP, 10)
    target:addMod(xi.mod.FOOD_ACC_CAP, 54)
    target:addMod(xi.mod.FOOD_DEFP, 10)
    target:addMod(xi.mod.FOOD_DEF_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.VIT, 3)
    target:delMod(xi.mod.INT, -2)
    target:delMod(xi.mod.FOOD_ACCP, 10)
    target:delMod(xi.mod.FOOD_ACC_CAP, 54)
    target:delMod(xi.mod.FOOD_DEFP, 10)
    target:delMod(xi.mod.FOOD_DEF_CAP, 30)
end

return itemObject
