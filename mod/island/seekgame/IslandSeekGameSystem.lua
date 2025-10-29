local var_0_0 = class("IslandSeekGameSystem", import("Mod.Island.Core.View.SceneObject.IslandSceneUnit"))

function var_0_0.OnSceneInitEnd(arg_1_0)
	arg_1_0.MONITOR_LIST = arg_1_0.data:GetInteractiveObjects()

	for iter_1_0, iter_1_1 in ipairs(arg_1_0:GetObjUnitList()) do
		if iter_1_1.behaviourTreeOwner then
			LuaHelper.NodeCanvasSetIntVariableValue(iter_1_1.behaviourTreeOwner, "systemId", arg_1_0.id)
		end
	end

	if arg_1_0.behaviourTreeOwner then
		LuaHelper.NodeCanvasSetIntVariableValue(arg_1_0.behaviourTreeOwner, "step", 0)
	end

	arg_1_0:Start()
end

function var_0_0.StartGame(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0:GetObjUnitList()) do
		iter_2_1:Start()
	end
end

function var_0_0.OnLateUpdate(arg_3_0)
	return
end

function var_0_0.StopGame(arg_4_0)
	if arg_4_0.behaviourTreeOwner then
		arg_4_0:StopBt()
	end

	local var_4_0 = arg_4_0:GetObjUnitList()

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		if table.contains(arg_4_0.MONITOR_LIST, iter_4_1.id) then
			iter_4_1:StopBt()
		end
	end
end

function var_0_0.RestartGame(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0:GetObjUnitList()) do
		if iter_5_1.behaviourTreeOwner then
			LuaHelper.NodeCanvasSetIntVariableValue(iter_5_1.behaviourTreeOwner, "step", 0)
		end

		iter_5_1:RestartBt()
	end

	if arg_5_0.behaviourTreeOwner then
		LuaHelper.NodeCanvasSetIntVariableValue(arg_5_0.behaviourTreeOwner, "step", 0)
		arg_5_0:RestartBt()
	end
end

function var_0_0.GetObjUnitList(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = arg_6_0:GetView():GetUnitListByKey(IslandConst.UNIT_LIST_OBJ)

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		table.insert(var_6_0, iter_6_1)
	end

	table.insert(var_6_0, arg_6_0:GetView().player)

	return var_6_0
end

function var_0_0.GetUnitById(arg_7_0, arg_7_1)
	return arg_7_0:GetView():GetUnitModule(arg_7_1)
end

return var_0_0
