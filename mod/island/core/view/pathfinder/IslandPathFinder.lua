local var_0_0 = class("IslandPathFinder", import("..IslandBaseUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.unitList = arg_1_0:GetView():GetAllUnits()
	arg_1_0.starting = false

	arg_1_0:Init()
end

function var_0_0.Start(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = BuildVector3(arg_2_1.position)
	local var_2_1 = arg_2_1.unitId or 0
	local var_2_2 = arg_2_1.speed or 1.5
	local var_2_3 = arg_2_1.unitType or IslandConst.UNIT_LIST_OBJ

	arg_2_0.hideFlag = defaultValue(arg_2_1.hide, false)

	local var_2_4 = arg_2_0:FindUnit(var_2_1, var_2_3)

	var_2_4:Enable()
	assert(var_2_4, "unit is nil" .. var_2_1)

	arg_2_0.unit = var_2_4
	arg_2_0.callback = arg_2_2

	var_2_4:SetNavAgentStopDistance(0.001)
	var_2_4:SetDestination(var_2_0, var_2_2)

	arg_2_0.starting = true
end

function var_0_0.FindUnit(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_1 == 0 then
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.unitList) do
			if isa(iter_3_1, IslandPlayerUnit) then
				return iter_3_1
			end
		end
	end

	for iter_3_2, iter_3_3 in ipairs(arg_3_0.unitList) do
		if iter_3_3:GetUnitType() == arg_3_2 and iter_3_3.id == arg_3_1 then
			return iter_3_3
		end
	end

	return nil
end

function var_0_0.OnUpdate(arg_4_0)
	if not arg_4_0.starting then
		return
	end

	local var_4_0 = arg_4_0.unit.agent

	if not var_4_0.pathPending and var_4_0.remainingDistance <= var_4_0.stoppingDistance then
		arg_4_0:EndAction()
	end
end

function var_0_0.EndAction(arg_5_0)
	arg_5_0.unit:SetNavAgentStopDistance(2)
	arg_5_0.unit:StopMove()

	if arg_5_0.hideFlag then
		arg_5_0.unit:Disable()
	end

	arg_5_0.callback()

	arg_5_0.starting = false
end

function var_0_0.OnDispose(arg_6_0)
	arg_6_0.starting = nil
	arg_6_0.callback = nil
	arg_6_0.unitList = nil
end

return var_0_0
