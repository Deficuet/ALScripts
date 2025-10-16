local var_0_0 = class("IslandBaseView")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.core = arg_1_1
	arg_1_0.callbacks = {}
	arg_1_0.unitRegister = {}
	arg_1_0.registerIndex = 0
	arg_1_0.opCount = arg_1_3 or 1
	arg_1_0.baseContainer = arg_1_2
end

function var_0_0.GetCacheOpCount(arg_2_0)
	return arg_2_0.opCount
end

function var_0_0.SetUp(arg_3_0)
	arg_3_0.poolMgr = arg_3_0.core:GetPoolMgr()
	arg_3_0.layer1Container = arg_3_0.baseContainer:Find("layer1")
	arg_3_0.layer1ContainerCg = GetOrAddComponent(arg_3_0.layer1Container, typeof(CanvasGroup))
	arg_3_0.topContainer = arg_3_0.baseContainer:Find("layer1/top")
	arg_3_0.opContainer = arg_3_0.baseContainer:Find("layer1/op")
	arg_3_0.interactionContainer = arg_3_0.baseContainer:Find("layer1/interaction")
	arg_3_0.hudContainer = arg_3_0.baseContainer:Find("layer1/hud")
	arg_3_0.pageContianer = arg_3_0.baseContainer:Find("layer1/page")
	arg_3_0.layer2UIContianer = arg_3_0.baseContainer:Find("layer2/ui")
	arg_3_0.layer2OpContianer = arg_3_0.baseContainer:Find("layer2/op")
	arg_3_0.root = arg_3_0:CreateRoot()

	arg_3_0:Init()
	arg_3_0:AddListeners()
end

function var_0_0.UnBlockLayer1Event(arg_4_0, arg_4_1)
	arg_4_0.layer1ContainerCg.blocksRaycasts = arg_4_1
end

function var_0_0.SetBgm(arg_5_0, arg_5_1)
	arg_5_0.bgm = arg_5_1
end

function var_0_0.ShowOrHideContainer(arg_6_0, arg_6_1)
	setActive(arg_6_0.opContainer, arg_6_1)
	setActive(arg_6_0.pageContianer, arg_6_1)
end

function var_0_0.RegisterUnitList(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1 or arg_7_0.registerIndex + 1

	if not arg_7_1 then
		arg_7_0.registerIndex = var_7_0
	end

	assert(arg_7_0.unitRegister[var_7_0] == nil, "UnitList already exist")

	arg_7_0.unitRegister[var_7_0] = {}

	return arg_7_0.unitRegister[var_7_0]
end

function var_0_0.GetUnitListRegitser(arg_8_0)
	return arg_8_0.unitRegister
end

function var_0_0.GetUnitListByKey(arg_9_0, arg_9_1)
	assert(arg_9_1 and arg_9_0.unitRegister[arg_9_1], "key should be exist>>>." .. arg_9_1)

	return arg_9_0.unitRegister[arg_9_1] or {}
end

function var_0_0.AddUnit(arg_10_0, arg_10_1)
	assert(isa(arg_10_1, IslandSceneUnit), "unit should be IslandSceneUnit")

	local var_10_0 = arg_10_0:GetUnitListByKey(arg_10_1:GetUnitType())

	table.insert(var_10_0, arg_10_1)
end

function var_0_0.RemoveUnit(arg_11_0, arg_11_1)
	assert(isa(arg_11_1, IslandSceneUnit), "unit should be IslandSceneUnit")

	local var_11_0 = arg_11_0:GetUnitListByKey(arg_11_1:GetUnitType())

	table.removebyvalue(var_11_0, arg_11_1)
end

function var_0_0.GetPoolMgr(arg_12_0)
	return arg_12_0.poolMgr
end

function var_0_0.CreateRoot(arg_13_0)
	return GameObject.New("Root")
end

function var_0_0.OnCoreStateChanged(arg_14_0, arg_14_1)
	if arg_14_1 == IslandCore.STATE_INIT_FINISH then
		pg.BgmMgr.GetInstance():Push("IslandScene", arg_14_0.bgm)
	end
end

function var_0_0.NotifiyCore(arg_15_0, arg_15_1, ...)
	arg_15_0:Op("NotifiyCore", arg_15_1, unpack({
		...
	}))
end

function var_0_0.NotifiyIsland(arg_16_0, ...)
	arg_16_0:Op("NotifiyIsland", ...)
end

function var_0_0.NotifiyMeditor(arg_17_0, arg_17_1, ...)
	arg_17_0:Op("NotifiyMeditor", arg_17_1, ...)
end

function var_0_0.Op(arg_18_0, arg_18_1, ...)
	arg_18_0:GetCore():GetController():Receive(arg_18_1, ...)
end

function var_0_0.IsSelfIsland(arg_19_0)
	return arg_19_0:GetCore():GetController():IsSelfIsland()
end

function var_0_0.GetIsland(arg_20_0)
	return arg_20_0:GetCore():GetController():GetIsland()
end

function var_0_0.GetController(arg_21_0)
	return arg_21_0.core:GetController()
end

function var_0_0.ShowMsgbox(arg_22_0, arg_22_1)
	arg_22_0:NotifiyIsland(ISLAND_EX_EVT.SHOW_MSG, arg_22_1)
end

function var_0_0.GetCore(arg_23_0)
	return arg_23_0.core
end

function var_0_0.InMap(arg_24_0, arg_24_1)
	return arg_24_0:GetCore():GetMapId() == arg_24_1
end

function var_0_0.GetMapId(arg_25_0)
	return arg_25_0:GetCore():GetMapId()
end

function var_0_0.AddListener(arg_26_0, arg_26_1, arg_26_2)
	local function var_26_0(arg_27_0, ...)
		arg_26_2(arg_26_0, ...)
	end

	assert(arg_26_0.callbacks[arg_26_2] == nil, "This method has been monitored. Please use another one" .. arg_26_1)

	arg_26_0.callbacks[arg_26_2] = var_26_0

	arg_26_0.core:AddListener(arg_26_1, var_26_0)
end

function var_0_0.RemoveListener(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.callbacks[arg_28_2]

	if var_28_0 then
		arg_28_0.core:RemoveListener(arg_28_1, var_28_0)

		arg_28_0.callbacks[var_28_0] = nil
	end
end

function var_0_0.Dispose(arg_29_0)
	pg.BgmMgr.GetInstance():StopPlay()
	arg_29_0:RemoveListeners()
	arg_29_0:OnDispose()

	arg_29_0.callbacks = nil
	arg_29_0.unitRegister = nil
	arg_29_0.registerIndex = 0
end

function var_0_0.Init(arg_30_0)
	return
end

function var_0_0.Update(arg_31_0)
	return
end

function var_0_0.LateUpdate(arg_32_0)
	return
end

function var_0_0.AddListeners(arg_33_0)
	return
end

function var_0_0.RemoveListeners(arg_34_0)
	return
end

function var_0_0.OnDispose(arg_35_0)
	return
end

return var_0_0
