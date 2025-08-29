local var_0_0 = class("IslandBaseController")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.core = arg_1_1
	arg_1_0.island = arg_1_2
	arg_1_0.__callbacks = {}

	arg_1_0:Init()
end

function var_0_0.GetIsland(arg_2_0)
	return arg_2_0.island
end

function var_0_0.IsSelfIsland(arg_3_0)
	return getProxy(IslandProxy):GetIsland().id == arg_3_0.island.id
end

function var_0_0.GetCore(arg_4_0)
	return arg_4_0.core
end

function var_0_0.GetView(arg_5_0)
	return arg_5_0.core:GetView()
end

function var_0_0.OnCoreStateChanged(arg_6_0, arg_6_1)
	if arg_6_1 == IslandCore.STATE_INIT_FINISH then
		arg_6_0:AddListeners()
		arg_6_0:OnCoreInitFinish()
	end
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0:RemoveListeners()
	arg_7_0:OnDispose()
end

function var_0_0.AddIslandListener(arg_8_0, arg_8_1, arg_8_2)
	local function var_8_0(arg_9_0, ...)
		arg_8_2(arg_8_0, ...)
	end

	assert(arg_8_0.__callbacks[arg_8_2] == nil, "This method has been monitored. Please use another one" .. arg_8_1)

	arg_8_0.__callbacks[arg_8_2] = var_8_0

	arg_8_0.island:AddListener(arg_8_1, var_8_0)
end

function var_0_0.RemoveIslandListener(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.__callbacks[arg_10_2]

	if var_10_0 then
		arg_10_0.island:RemoveListener(arg_10_1, var_10_0)

		arg_10_0.__callbacks[var_10_0] = nil
	end
end

function var_0_0.NotifiyCore(arg_11_0, arg_11_1, ...)
	arg_11_0.core:DispatchEvent(arg_11_1, ...)
end

function var_0_0.NotifiyIsland(arg_12_0, arg_12_1, ...)
	arg_12_0.island:DispatchEvent(arg_12_1, ...)
end

function var_0_0.NotifiyMeditor(arg_13_0, arg_13_1, ...)
	arg_13_0:NotifiyIsland(ISLAND_EX_EVT.EMIT, arg_13_1, ...)
end

function var_0_0.Receive(arg_14_0, arg_14_1, ...)
	if arg_14_0[arg_14_1] then
		arg_14_0[arg_14_1](arg_14_0, ...)
	end
end

function var_0_0.AddListeners(arg_15_0)
	return
end

function var_0_0.RemoveListeners(arg_16_0)
	return
end

function var_0_0.Init(arg_17_0)
	return
end

function var_0_0.SetUp(arg_18_0)
	return
end

function var_0_0.OnCoreInitFinish(arg_19_0)
	return
end

function var_0_0.Update(arg_20_0)
	return
end

function var_0_0.LateUpdate(arg_21_0)
	return
end

function var_0_0.OnDispose(arg_22_0)
	return
end

return var_0_0
