ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleConfig
local var_0_3 = class("BattleEnvironmentBehaviourForce", var_0_0.Battle.BattleEnvironmentBehaviour)

var_0_0.Battle.BattleEnvironmentBehaviourForce = var_0_3
var_0_3.__name = "BattleEnvironmentBehaviourForce"

function var_0_3.Ctor(arg_1_0)
	arg_1_0._moveEndTime = nil
	arg_1_0._lastSpeed = nil
	arg_1_0._speed = Vector3.zero
	arg_1_0._targetIndex = 0

	var_0_3.super.Ctor(arg_1_0)
end

function var_0_3.SetTemplate(arg_2_0, arg_2_1)
	var_0_3.super.SetTemplate(arg_2_0, arg_2_1)

	arg_2_0._route = arg_2_1.route or {}
	arg_2_0._moveEndTime = pg.TimeMgr.GetInstance():GetCombatTime()

	local var_2_0 = arg_2_0._unit:GetTemplate()
	local var_2_1
	local var_2_2

	if #var_2_0.cld_data == 1 then
		var_2_1 = var_2_0.cld_data[1]
		var_2_2 = var_2_1
	elseif #var_2_0.cld_data == 2 then
		var_2_1, var_2_2 = unpack(var_2_0.cld_data)
	end

	local var_2_3 = {
		var_0_0.Battle.BattleDataProxy.GetInstance():GetTotalBounds()
	}

	var_2_3[3] = var_2_3[3] + var_2_1
	var_2_3[4] = var_2_3[4] - var_2_1
	var_2_3[2] = var_2_3[2] + var_2_2
	var_2_3[1] = var_2_3[1] - var_2_2
	arg_2_0._bounds = var_2_3
end

function var_0_3.doBehaviour(arg_3_0)
	local var_3_0 = pg.TimeMgr.GetInstance():GetCombatTime()

	if arg_3_0._moveEndTime and var_3_0 >= arg_3_0._moveEndTime then
		arg_3_0._targetIndex = arg_3_0._targetIndex + 1
		arg_3_0._moveEndTime = nil

		if arg_3_0._lastSpeed then
			arg_3_0._speed:Add(arg_3_0._lastSpeed)

			arg_3_0._lastSpeed = nil
		end

		local var_3_1 = arg_3_0._route[arg_3_0._targetIndex]

		if var_3_1 then
			arg_3_0._lastSpeed = Vector3(unpack(var_3_1)):Normalize() * var_3_1[4]
			arg_3_0._moveEndTime = var_3_0 + var_3_1[5]
		end
	end

	local var_3_2 = arg_3_0._unit._aoeData:GetPosition()
	local var_3_3 = arg_3_0:UpdateAndRestrictPosition(var_3_2)

	arg_3_0._unit._aoeData:SetPosition(var_3_3)
	var_0_3.super.doBehaviour(arg_3_0)
end

function var_0_3.UpdateAndRestrictPosition(arg_4_0, arg_4_1)
	if arg_4_0._speed:SqrMagnitude() < 0.01 then
		return arg_4_1
	end

	local var_4_0 = arg_4_0._bounds
	local var_4_1 = arg_4_1 + arg_4_0._speed

	if var_4_1.x < var_4_0[3] then
		arg_4_0._speed.x = math.abs(arg_4_0._speed.x)
		var_4_1.x = var_4_0[3] + math.abs(var_4_1.x - var_4_0[3])
	elseif var_4_0[4] < var_4_1.x then
		arg_4_0._speed.x = -math.abs(arg_4_0._speed.x)
		var_4_1.x = var_4_0[4] - math.abs(var_4_1.x - var_4_0[4])
	end

	if var_4_1.z < var_4_0[2] then
		arg_4_0._speed.z = math.abs(arg_4_0._speed.z)
		var_4_1.z = var_4_0[2] + math.abs(var_4_1.z - var_4_0[2])
	elseif var_4_0[1] < var_4_1.z then
		arg_4_0._speed.z = -math.abs(arg_4_0._speed.z)
		var_4_1.z = var_4_0[1] - math.abs(var_4_1.z - var_4_0[1])
	end

	return var_4_1
end

function var_0_3.Dispose(arg_5_0)
	var_0_3.super.Dispose(arg_5_0)
	table.clear(arg_5_0)
end
