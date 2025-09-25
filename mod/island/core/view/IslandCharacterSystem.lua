local var_0_0 = class("IslandCharacterSystem", import("Mod.Island.Core.View.SceneObject.IslandSceneUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.scheduleList = {}
	arg_1_0.workerCnt = arg_1_0.data:GetWorkerCnt()
end

function var_0_0.OnStart(arg_2_0)
	if arg_2_0.behaviourTreeOwner then
		LuaHelper.NodeCanvasSetIntVariableValue(arg_2_0.behaviourTreeOwner, "worker", arg_2_0.workerCnt)

		local var_2_0 = {
			IslandProductConst.FarmlandPlaceId,
			IslandProductConst.OrchardPlaceId,
			IslandProductConst.GardenPlaceId
		}
		local var_2_1 = arg_2_0.data:GetWorkerList() or {}

		for iter_2_0, iter_2_1 in ipairs(var_2_1) do
			iter_2_1.nextIn = table.contains(var_2_0, arg_2_0.data.id)

			arg_2_0:StartDelegation(iter_2_1)
		end
	end
end

function var_0_0.StartDelegation(arg_3_0, arg_3_1)
	if not arg_3_0.behaviourTreeOwner then
		return
	end

	table.insert(arg_3_0.scheduleList, arg_3_1)
end

function var_0_0.ExecuteDelegation(arg_4_0, arg_4_1)
	arg_4_0.workerCnt = arg_4_0.workerCnt + 1

	local var_4_0 = arg_4_0.data:GetUnitShipIdBySlotId(arg_4_1.ship_id, arg_4_1.area_id)
	local var_4_1 = arg_4_0:GetView():GetSystemUnitModule(var_4_0)
	local var_4_2 = arg_4_0.data:GetperformanceObjidList(arg_4_1.area_id)
	local var_4_3 = System.Collections.Generic.List_IslandUnitNode()

	if var_4_1 then
		local var_4_4 = IslandUnitNode.New()

		var_4_4.unitId = var_4_0
		var_4_4.unitType = IslandConst.UNIT_LIST_DELEGATION

		var_4_3:Add(var_4_4)
	end

	for iter_4_0, iter_4_1 in ipairs(var_4_2) do
		local var_4_5 = IslandUnitNode.New()

		var_4_5.unitId = iter_4_1.unitId
		var_4_5.unitType = iter_4_1.unitType

		var_4_3:Add(var_4_5)
	end

	if arg_4_1.nextIn then
		arg_4_0.behaviourTreeOwner:SendEvent("system_unit_add_nextIn", var_4_3, nil)
	else
		arg_4_0.behaviourTreeOwner:SendEvent("system_unit_add", var_4_3, nil)
	end
end

function var_0_0.EndDelegation(arg_5_0, arg_5_1)
	if not arg_5_0.behaviourTreeOwner then
		return
	end

	arg_5_0.workerCnt = arg_5_0.workerCnt - 1

	LuaHelper.NodeCanvasSetIntVariableValue(arg_5_0.behaviourTreeOwner, "worker", arg_5_0.workerCnt)

	local var_5_0 = IslandUnitNode.New()

	var_5_0.unitId = arg_5_1.ship_id
	var_5_0.unitType = IslandConst.UNIT_LIST_DELEGATION

	arg_5_0.behaviourTreeOwner:SendEvent("system_unit_remove", var_5_0, nil)
end

function var_0_0.OnUpdate(arg_6_0)
	if #arg_6_0.scheduleList <= 0 then
		return
	end

	if not arg_6_0:GetView():IsLoaded() then
		return
	end

	if not arg_6_0._go:GetComponent(typeof(ParadoxNotion.Services.EventRouter)) then
		return
	end

	local var_6_0 = table.remove(arg_6_0.scheduleList, 1)

	arg_6_0:ExecuteDelegation(var_6_0)
end

function var_0_0.OnDestroy(arg_7_0)
	table.clear(arg_7_0.scheduleList)
end

return var_0_0
