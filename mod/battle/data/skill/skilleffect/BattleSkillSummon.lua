ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleFormulas

var_0_0.Battle.BattleSkillSummon = class("BattleSkillSummon", var_0_0.Battle.BattleSkillEffect)
var_0_0.Battle.BattleSkillSummon.__name = "BattleSkillSummon"

local var_0_3 = var_0_0.Battle.BattleSkillSummon

function var_0_3.Ctor(arg_1_0, arg_1_1)
	var_0_3.super.Ctor(arg_1_0, arg_1_1, lv)

	arg_1_0._spawnData = arg_1_0._tempData.arg_list.spawnData
end

function var_0_3.DoDataEffectWithoutTarget(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:DoSummon(arg_2_1, arg_2_2)
end

function var_0_3.DoDataEffect(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_0:DoSummon(arg_3_1, arg_3_3)
end

function var_0_3.DoSummon(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = var_0_0.Battle.BattleDataProxy.GetInstance()
	local var_4_1 = arg_4_1:GetIFF()
	local var_4_2

	if arg_4_1:GetUnitType() == var_0_1.UnitType.PLAYER_UNIT then
		var_4_2 = var_4_0:SpawnNPC(arg_4_0._spawnData, arg_4_1)
	else
		local var_4_3 = arg_4_1:GetWaveIndex()

		var_4_2 = var_4_0:SpawnMonster(arg_4_0._spawnData, var_4_3, var_0_1.UnitType.ENEMY_UNIT, var_4_1)

		var_4_2:SetMaster(arg_4_1)

		if arg_4_0._spawnData.relativeCorrdinate then
			local var_4_4 = arg_4_1:GetPosition()
			local var_4_5 = var_0_2.RandomPos(arg_4_0._spawnData.relativeCorrdinate)

			var_4_5.x = var_4_5.x + var_4_4.x
			var_4_5.y = var_4_5.y + var_4_4.y
			var_4_5.z = var_4_5.z + var_4_4.z

			var_4_2:SetPosition(var_4_5)
		end
	end

	if arg_4_0._spawnData.damageSrcWarp then
		var_0_0.Battle.BattleAttr.SetCurrent(var_4_2, "id", nil)
	end
end
