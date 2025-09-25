local var_0_0 = class("IslandBaseView")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.core = arg_1_1
	arg_1_0.callbacks = {}
	arg_1_0.unitRegister = {}
	arg_1_0.registerIndex = 0
	arg_1_0.baseContainer = arg_1_2
end

function var_0_0.SetUp(arg_2_0)
	arg_2_0.poolMgr = arg_2_0.core:GetPoolMgr()
	arg_2_0.layer1Container = arg_2_0.baseContainer:Find("layer1")
	arg_2_0.layer1ContainerCg = GetOrAddComponent(arg_2_0.layer1Container, typeof(CanvasGroup))
	arg_2_0.topContainer = arg_2_0.baseContainer:Find("layer1/top")
	arg_2_0.opContainer = arg_2_0.baseContainer:Find("layer1/op")
	arg_2_0.interactionContainer = arg_2_0.baseContainer:Find("layer1/interaction")
	arg_2_0.hudContainer = arg_2_0.baseContainer:Find("layer1/hud")
	arg_2_0.pageContianer = arg_2_0.baseContainer:Find("layer1/page")
	arg_2_0.layer2UIContianer = arg_2_0.baseContainer:Find("layer2/ui")
	arg_2_0.root = arg_2_0:CreateRoot()

	arg_2_0:Init()
	arg_2_0:AddListeners()
end

function var_0_0.UnBlockLayer1Event(arg_3_0, arg_3_1)
	arg_3_0.layer1ContainerCg.blocksRaycasts = arg_3_1
end

function var_0_0.SetBgm(arg_4_0, arg_4_1)
	arg_4_0.bgm = arg_4_1
end

function var_0_0.ShowOrHideContainer(arg_5_0, arg_5_1)
	setActive(arg_5_0.opContainer, arg_5_1)
	setActive(arg_5_0.pageContianer, arg_5_1)
end

function var_0_0.RegisterUnitList(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1 or arg_6_0.registerIndex + 1

	if not arg_6_1 then
		arg_6_0.registerIndex = var_6_0
	end

	assert(arg_6_0.unitRegister[var_6_0] == nil, "UnitList already exist")

	arg_6_0.unitRegister[var_6_0] = {}

	return arg_6_0.unitRegister[var_6_0]
end

function var_0_0.GetUnitListRegitser(arg_7_0)
	return arg_7_0.unitRegister
end

function var_0_0.GetUnitListByKey(arg_8_0, arg_8_1)
	assert(arg_8_1 and arg_8_0.unitRegister[arg_8_1], "key should be exist>>>." .. arg_8_1)

	return arg_8_0.unitRegister[arg_8_1] or {}
end

function var_0_0.AddUnit(arg_9_0, arg_9_1)
	assert(isa(arg_9_1, IslandSceneUnit), "unit should be IslandSceneUnit")

	local var_9_0 = arg_9_0:GetUnitListByKey(arg_9_1:GetUnitType())

	table.insert(var_9_0, arg_9_1)
end

function var_0_0.RemoveUnit(arg_10_0, arg_10_1)
	assert(isa(arg_10_1, IslandSceneUnit), "unit should be IslandSceneUnit")

	local var_10_0 = arg_10_0:GetUnitListByKey(arg_10_1:GetUnitType())

	table.removebyvalue(var_10_0, arg_10_1)
end

function var_0_0.GetPoolMgr(arg_11_0)
	return arg_11_0.poolMgr
end

function var_0_0.CreateRoot(arg_12_0)
	return GameObject.New("Root")
end

function var_0_0.OnCoreStateChanged(arg_13_0, arg_13_1)
	if arg_13_1 == IslandCore.STATE_INIT_FINISH then
		pg.BgmMgr.GetInstance():Push("IslandScene", arg_13_0.bgm)
	end
end

function var_0_0.NotifiyCore(arg_14_0, arg_14_1, ...)
	arg_14_0:Op("NotifiyCore", arg_14_1, unpack({
		...
	}))
end

function var_0_0.NotifiyIsland(arg_15_0, ...)
	arg_15_0:Op("NotifiyIsland", ...)
end

function var_0_0.NotifiyMeditor(arg_16_0, arg_16_1, ...)
	arg_16_0:Op("NotifiyMeditor", arg_16_1, ...)
end

function var_0_0.Op(arg_17_0, arg_17_1, ...)
	arg_17_0:GetCore():GetController():Receive(arg_17_1, ...)
end

function var_0_0.IsSelfIsland(arg_18_0)
	return arg_18_0:GetCore():GetController():IsSelfIsland()
end

function var_0_0.GetIsland(arg_19_0)
	return arg_19_0:GetCore():GetController():GetIsland()
end

function var_0_0.GetController(arg_20_0)
	return arg_20_0.core:GetController()
end

function var_0_0.ShowMsgbox(arg_21_0, arg_21_1)
	arg_21_0:NotifiyIsland(ISLAND_EX_EVT.SHOW_MSG, arg_21_1)
end

function var_0_0.GetCore(arg_22_0)
	return arg_22_0.core
end

function var_0_0.InMap(arg_23_0, arg_23_1)
	return arg_23_0:GetCore():GetMapId() == arg_23_1
end

function var_0_0.AddListener(arg_24_0, arg_24_1, arg_24_2)
	local function var_24_0(arg_25_0, ...)
		arg_24_2(arg_24_0, ...)
	end

	assert(arg_24_0.callbacks[arg_24_2] == nil, "This method has been monitored. Please use another one" .. arg_24_1)

	arg_24_0.callbacks[arg_24_2] = var_24_0

	arg_24_0.core:AddListener(arg_24_1, var_24_0)
end

function var_0_0.RemoveListener(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.callbacks[arg_26_2]

	if var_26_0 then
		arg_26_0.core:RemoveListener(arg_26_1, var_26_0)

		arg_26_0.callbacks[var_26_0] = nil
	end
end

function var_0_0.Dispose(arg_27_0)
	pg.BgmMgr.GetInstance():StopPlay()
	arg_27_0:RemoveListeners()
	arg_27_0:OnDispose()

	arg_27_0.callbacks = nil
	arg_27_0.unitRegister = nil
	arg_27_0.registerIndex = 0
end

function var_0_0.Init(arg_28_0)
	return
end

function var_0_0.Update(arg_29_0)
	return
end

function var_0_0.LateUpdate(arg_30_0)
	return
end

function var_0_0.AddListeners(arg_31_0)
	return
end

function var_0_0.RemoveListeners(arg_32_0)
	return
end

function var_0_0.OnDispose(arg_33_0)
	return
end

return var_0_0
