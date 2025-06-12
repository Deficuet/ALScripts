pg = pg or {}

local var_0_0 = pg

var_0_0.NodeCanvasMgr = singletonClass("NodeCanvasMgr")

local var_0_1 = var_0_0.NodeCanvasMgr

function var_0_1.Ctor(arg_1_0)
	arg_1_0:Clear()
end

function var_0_1.Init(arg_2_0, arg_2_1)
	print("initializing NodeCanvas manager...")
	existCall(arg_2_1)
end

function var_0_1.Active(arg_3_0, arg_3_1)
	assert(not arg_3_0.functionDic)

	arg_3_0.functionDic = {}

	if arg_3_1 then
		arg_3_0:SetOwner(arg_3_1)
	end
end

function var_0_1.SetOwner(arg_4_0, arg_4_1)
	arg_4_0.mainOwner = GetComponent(arg_4_1, "GraphOwner")
	arg_4_0.mainBlackboard = GetComponent(arg_4_1, "Blackboard")
end

function var_0_1.SetBlackboradValue(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_3 = arg_5_3 or arg_5_0.mainBlackboard

	if arg_5_2 == nil then
		arg_5_3:RemoveVariable(arg_5_1)
	else
		arg_5_3:SetVariableValue(arg_5_1, arg_5_2)
	end
end

function var_0_1.GetBlackboradValue(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2 = arg_6_2 or arg_6_0.mainBlackboard

	return arg_6_2:GetVariable(arg_6_1).value
end

function var_0_1.CopyAllBlackBoardValue(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = ReflectionHelp.RefGetProperty(typeof("NodeCanvas.Framework.IBlackboard"), "variables", arg_7_1):GetEnumerator()

	while var_7_0:MoveNext() do
		local var_7_1 = var_7_0.Current
		local var_7_2 = var_7_1.Key
		local var_7_3 = var_7_1.Value.value

		if type(var_7_3) == "number" then
			-- block empty
		else
			arg_7_0:SetBlackboradValue(var_7_2, var_7_3, arg_7_2)
		end
	end
end

function var_0_1.SendEvent(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	arg_8_3 = arg_8_3 or arg_8_0.mainOwner

	if arg_8_2 == nil then
		arg_8_3:SendEvent(arg_8_1)
	else
		arg_8_3:SendEvent(arg_8_1, arg_8_2, nil)
	end
end

function var_0_1.SendGlobalEvent(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.mainOwner.graph:SendGlobalEvent(arg_9_1, arg_9_2, nil)
end

function var_0_1.RegisterFunc(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.functionDic[arg_10_1] = arg_10_2
end

function var_0_1.UnregisterFunc(arg_11_0, arg_11_1)
	if arg_11_0.functionDic[arg_11_1] then
		arg_11_0.functionDic[arg_11_1] = nil
	else
		warning("NodeCanvasMgr UnregisterFunc not found:" .. arg_11_1)
	end
end

function var_0_1.CallFunc(arg_12_0, arg_12_1, ...)
	assert(arg_12_0.functionDic[arg_12_1], "with out register call:" .. arg_12_1)
	arg_12_0.functionDic[arg_12_1](...)
end

function var_0_1.Clear(arg_13_0)
	arg_13_0.functionDic = nil
	arg_13_0.mainOwner = nil
	arg_13_0.mainBlackboard = nil
end

function LuaActionTaskCall(arg_14_0, ...)
	local var_14_0 = var_0_0.NodeCanvasMgr.GetInstance()

	assert(var_14_0 and var_14_0.functionDic)
	var_14_0:CallFunc(arg_14_0, ...)
end
