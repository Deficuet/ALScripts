ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleEffectBulletUnit", var_0_0.Battle.BattleBulletUnit)

var_0_0.Battle.BattleEffectBulletUnit = var_0_1
var_0_1.__name = "BattleEffectBulletUnit"

function var_0_1.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_1.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
end

function var_0_1.Update(arg_2_0, arg_2_1)
	var_0_1.super.Update(arg_2_0, arg_2_1)

	if arg_2_0._flare then
		arg_2_0._flare:SetPosition(pg.Tool.FilterY(arg_2_0:GetPosition():Clone()))
	end
end

function var_0_1.IsFlare(arg_3_0)
	return arg_3_0:GetTemplate().attach_buff[1].flare
end

function var_0_1.OutRange(arg_4_0)
	var_0_1.super.OutRange(arg_4_0)

	if arg_4_0._flare then
		arg_4_0._flare:SetActiveFlag(false)

		arg_4_0._flare = nil
	end
end

function var_0_1.spawnArea(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0:GetTemplate()
	local var_5_1 = var_5_0.hit_type
	local var_5_2 = var_5_0.attach_buff[1]
	local var_5_3 = var_5_2.buff_id
	local var_5_4 = var_5_2.buff_level or 1

	local function var_5_5(arg_6_0)
		for iter_6_0, iter_6_1 in ipairs(arg_6_0) do
			if iter_6_1.Active then
				local var_6_0 = arg_5_0._battleProxy:GetUnitList()[iter_6_1.UID]
				local var_6_1 = var_0_0.Battle.BattleBuffUnit.New(var_5_3, var_5_4)

				var_6_0:AddBuff(var_6_1, true)
			end
		end
	end

	local function var_5_6(arg_7_0)
		if arg_7_0.Active then
			arg_5_0._battleProxy:GetUnitList()[arg_7_0.UID]:RemoveBuff(var_5_3, true)
		end
	end

	time = var_5_1.time

	local var_5_7

	if var_5_0.extra_param.ellipse_range then
		var_5_7 = arg_5_0._battleProxy:SpawnLastingEllipseArea(arg_5_0:GetEffectField(), arg_5_0:GetIFF(), pg.Tool.FilterY(arg_5_0:GetPosition():Clone()), var_5_1.range, var_5_0.extra_param.ellipse_range, time, var_5_5, var_5_6, var_5_2.friendly, var_5_2.effect_id)
	else
		var_5_7 = arg_5_0._battleProxy:SpawnLastingColumnArea(arg_5_0:GetEffectField(), arg_5_0:GetIFF(), pg.Tool.FilterY(arg_5_0:GetPosition():Clone()), var_5_1.range, time, var_5_5, var_5_6, var_5_2.friendly, var_5_2.effect_id)
	end

	if arg_5_1 then
		arg_5_0._flare = var_5_7
	end

	var_5_7:SetSource(var_5_7.SOURCE_BULLET_9)

	return var_5_7
end

function var_0_1.GetExplodePostion(arg_8_0)
	return arg_8_0._explodePos
end

function var_0_1.SetExplodePosition(arg_9_0, arg_9_1)
	arg_9_0._explodePos = arg_9_1
end
