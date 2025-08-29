local var_0_0 = class("IslandBaseView")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.core = arg_1_1
	arg_1_0.callbacks = {}
	arg_1_0.unitRegister = {}
	arg_1_0.registerIndex = 0
end

function var_0_0.SetUp(arg_2_0)
	arg_2_0.poolMgr = arg_2_0.core:GetPoolMgr()
	arg_2_0.topContainer = pg.UIMgr.GetInstance().UICanvas:Find("UIIsland/top")
	arg_2_0.opContainer = pg.UIMgr.GetInstance().UICanvas:Find("UIIsland/op")
	arg_2_0.pageContianer = pg.UIMgr.GetInstance().UICanvas:Find("UIIsland/page")
	arg_2_0.root = arg_2_0:CreateRoot()

	arg_2_0:Init()
	arg_2_0:AddListeners()
end

function var_0_0.SetBgm(arg_3_0, arg_3_1)
	arg_3_0.bgm = arg_3_1
end

function var_0_0.ShowOrHideContainer(arg_4_0, arg_4_1)
	setActive(arg_4_0.opContainer, arg_4_1)
	setActive(arg_4_0.pageContianer, arg_4_1)
end

function var_0_0.RegisterUnitList(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1 or arg_5_0.registerIndex + 1

	if not arg_5_1 then
		arg_5_0.registerIndex = var_5_0
	end

	assert(arg_5_0.unitRegister[var_5_0] == nil, "UnitList already exist")

	arg_5_0.unitRegister[var_5_0] = {}

	return arg_5_0.unitRegister[var_5_0]
end

function var_0_0.GetUnitListRegitser(arg_6_0)
	return arg_6_0.unitRegister
end

function var_0_0.GetUnitListByKey(arg_7_0, arg_7_1)
	assert(arg_7_1 and arg_7_0.unitRegister[arg_7_1], "key should be exist>>>." .. arg_7_1)

	return arg_7_0.unitRegister[arg_7_1] or {}
end

function var_0_0.AddUnit(arg_8_0, arg_8_1)
	assert(isa(arg_8_1, IslandSceneUnit), "unit should be IslandSceneUnit")

	local var_8_0 = arg_8_0:GetUnitListByKey(arg_8_1:GetUnitType())

	table.insert(var_8_0, arg_8_1)
end

function var_0_0.RemoveUnit(arg_9_0, arg_9_1)
	assert(isa(arg_9_1, IslandSceneUnit), "unit should be IslandSceneUnit")

	local var_9_0 = arg_9_0:GetUnitListByKey(arg_9_1:GetUnitType())

	table.removebyvalue(var_9_0, arg_9_1)
end

function var_0_0.GetPoolMgr(arg_10_0)
	return arg_10_0.poolMgr
end

function var_0_0.CreateRoot(arg_11_0)
	return GameObject.New("Root")
end

function var_0_0.OnCoreStateChanged(arg_12_0, arg_12_1)
	if arg_12_1 == IslandCore.STATE_INIT_FINISH then
		pg.BgmMgr.GetInstance():Push("IslandScene", arg_12_0.bgm)
	end
end

function var_0_0.Emit(arg_13_0, arg_13_1, ...)
	arg_13_0:Op("NotifiyCore", arg_13_1, unpack({
		...
	}))
end

function var_0_0.NotifiyIsland(arg_14_0, ...)
	arg_14_0:Op("NotifiyIsland", ...)
end

function var_0_0.NotifiyMeditor(arg_15_0, arg_15_1, ...)
	arg_15_0:Op("NotifiyMeditor", arg_15_1, ...)
end

function var_0_0.Op(arg_16_0, arg_16_1, ...)
	arg_16_0:GetCore():GetController():Receive(arg_16_1, ...)
end

function var_0_0.IsSelfIsland(arg_17_0)
	return arg_17_0:GetCore():GetController():IsSelfIsland()
end

function var_0_0.GetIsland(arg_18_0)
	return arg_18_0:GetCore():GetController():GetIsland()
end

function var_0_0.GetController(arg_19_0)
	return arg_19_0.core:GetController()
end

function var_0_0.ShowMsgbox(arg_20_0, arg_20_1)
	arg_20_0:NotifiyIsland(ISLAND_EX_EVT.SHOW_MSG, arg_20_1)
end

function var_0_0.GetCore(arg_21_0)
	return arg_21_0.core
end

function var_0_0.InMap(arg_22_0, arg_22_1)
	return arg_22_0:GetCore():GetMapId() == arg_22_1
end

function var_0_0.AddListener(arg_23_0, arg_23_1, arg_23_2)
	local function var_23_0(arg_24_0, ...)
		arg_23_2(arg_23_0, ...)
	end

	assert(arg_23_0.callbacks[arg_23_2] == nil, "This method has been monitored. Please use another one" .. arg_23_1)

	arg_23_0.callbacks[arg_23_2] = var_23_0

	arg_23_0.core:AddListener(arg_23_1, var_23_0)
end

function var_0_0.RemoveListener(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.callbacks[arg_25_2]

	if var_25_0 then
		arg_25_0.core:RemoveListener(arg_25_1, var_25_0)

		arg_25_0.callbacks[var_25_0] = nil
	end
end

function var_0_0.Dispose(arg_26_0)
	pg.BgmMgr.GetInstance():StopPlay()
	arg_26_0:RemoveListeners()
	arg_26_0:OnDispose()

	arg_26_0.callbacks = nil
	arg_26_0.unitRegister = nil
	arg_26_0.registerIndex = 0
end

function var_0_0.Init(arg_27_0)
	return
end

function var_0_0.Update(arg_28_0)
	return
end

function var_0_0.LateUpdate(arg_29_0)
	return
end

function var_0_0.AddListeners(arg_30_0)
	return
end

function var_0_0.RemoveListeners(arg_31_0)
	return
end

function var_0_0.OnDispose(arg_32_0)
	return
end

return var_0_0
