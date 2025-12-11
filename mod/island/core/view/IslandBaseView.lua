local var_0_0 = class("IslandBaseView")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.core = arg_1_1
	arg_1_0.callbacks = {}
	arg_1_0.unitRegister = {}
	arg_1_0.registerIndex = 0
	arg_1_0.opCount = arg_1_2 or 1
end

function var_0_0.GetCacheOpCount(arg_2_0)
	return arg_2_0.opCount
end

function var_0_0.SetUp(arg_3_0)
	local var_3_0 = pg.UIMgr.GetInstance().UIMain:Find("UIIsland")

	arg_3_0.poolMgr = arg_3_0.core:GetPoolMgr()
	arg_3_0.layer1Container = var_3_0:Find("layer1")
	arg_3_0.layer1ContainerCg = GetOrAddComponent(arg_3_0.layer1Container, typeof(CanvasGroup))
	arg_3_0.topContainer = var_3_0:Find("layer1/top")
	arg_3_0.opContainer = var_3_0:Find("layer1/op")
	arg_3_0.interactionContainer = var_3_0:Find("layer1/interaction")
	arg_3_0.hudContainer = var_3_0:Find("layer1/hud")
	arg_3_0.pageContianer = var_3_0:Find("layer1/page")
	arg_3_0.layer2UIContianer = var_3_0:Find("layer2/ui")
	arg_3_0.layer2OpContianer = var_3_0:Find("layer2/op")
	arg_3_0.root = arg_3_0:CreateRoot()

	arg_3_0:Init()
	arg_3_0:AddListeners()
end

function var_0_0.Enter(arg_4_0)
	arg_4_0:DoEnter()
end

function var_0_0.UnBlockLayer1Event(arg_5_0, arg_5_1)
	arg_5_0.layer1ContainerCg.blocksRaycasts = arg_5_1
end

function var_0_0.SetBgm(arg_6_0, arg_6_1)
	arg_6_0.bgm = arg_6_1
end

function var_0_0.ShowOrHideContainer(arg_7_0, arg_7_1)
	setActive(arg_7_0.opContainer, arg_7_1)
	setActive(arg_7_0.pageContianer, arg_7_1)
end

function var_0_0.RegisterUnitList(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1 or arg_8_0.registerIndex + 1

	if not arg_8_1 then
		arg_8_0.registerIndex = var_8_0
	end

	assert(arg_8_0.unitRegister[var_8_0] == nil, "UnitList already exist")

	arg_8_0.unitRegister[var_8_0] = {}

	return arg_8_0.unitRegister[var_8_0]
end

function var_0_0.GetUnitListRegitser(arg_9_0)
	return arg_9_0.unitRegister
end

function var_0_0.GetUnitListByKey(arg_10_0, arg_10_1)
	assert(arg_10_1 and arg_10_0.unitRegister[arg_10_1], "key should be exist>>>." .. arg_10_1)

	return arg_10_0.unitRegister[arg_10_1] or {}
end

function var_0_0.AddUnit(arg_11_0, arg_11_1)
	assert(isa(arg_11_1, IslandSceneUnit), "unit should be IslandSceneUnit")

	local var_11_0 = arg_11_0:GetUnitListByKey(arg_11_1:GetUnitType())

	table.insert(var_11_0, arg_11_1)
end

function var_0_0.RemoveUnit(arg_12_0, arg_12_1)
	assert(isa(arg_12_1, IslandSceneUnit), "unit should be IslandSceneUnit")

	local var_12_0 = arg_12_0:GetUnitListByKey(arg_12_1:GetUnitType())

	table.removebyvalue(var_12_0, arg_12_1)
end

function var_0_0.GetPoolMgr(arg_13_0)
	return arg_13_0.poolMgr
end

function var_0_0.CreateRoot(arg_14_0)
	return GameObject.New("Root")
end

function var_0_0.OnCoreStateChanged(arg_15_0, arg_15_1)
	if arg_15_1 == IslandCore.STATE_INIT_FINISH then
		pg.BgmMgr.GetInstance():Push("IslandScene", arg_15_0.bgm)
	end
end

function var_0_0.NotifiyCore(arg_16_0, arg_16_1, ...)
	arg_16_0:Op("NotifiyCore", arg_16_1, unpack({
		...
	}))
end

function var_0_0.NotifiyIsland(arg_17_0, ...)
	arg_17_0:Op("NotifiyIsland", ...)
end

function var_0_0.NotifiyMeditor(arg_18_0, arg_18_1, ...)
	arg_18_0:Op("NotifiyMeditor", arg_18_1, ...)
end

function var_0_0.Op(arg_19_0, arg_19_1, ...)
	arg_19_0:GetCore():GetController():Receive(arg_19_1, ...)
end

function var_0_0.IsSelfIsland(arg_20_0)
	return arg_20_0:GetCore():GetController():IsSelfIsland()
end

function var_0_0.GetIsland(arg_21_0)
	return arg_21_0:GetCore():GetController():GetIsland()
end

function var_0_0.GetSelfIsland(arg_22_0)
	return getProxy(IslandProxy):GetIsland()
end

function var_0_0.GetController(arg_23_0)
	return arg_23_0.core:GetController()
end

function var_0_0.ShowMsgbox(arg_24_0, arg_24_1)
	arg_24_0:NotifiyIsland(ISLAND_EX_EVT.SHOW_MSG, arg_24_1)
end

function var_0_0.GetCore(arg_25_0)
	return arg_25_0.core
end

function var_0_0.InMap(arg_26_0, arg_26_1)
	return arg_26_0:GetCore():GetMapId() == arg_26_1
end

function var_0_0.GetMapId(arg_27_0)
	return arg_27_0:GetCore():GetMapId()
end

function var_0_0.AddListener(arg_28_0, arg_28_1, arg_28_2)
	local function var_28_0(arg_29_0, ...)
		arg_28_2(arg_28_0, ...)
	end

	assert(arg_28_0.callbacks[arg_28_2] == nil, "This method has been monitored. Please use another one" .. arg_28_1)

	arg_28_0.callbacks[arg_28_2] = var_28_0

	arg_28_0.core:AddListener(arg_28_1, var_28_0)
end

function var_0_0.RemoveListener(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_0.callbacks[arg_30_2]

	if var_30_0 then
		arg_30_0.core:RemoveListener(arg_30_1, var_30_0)

		arg_30_0.callbacks[var_30_0] = nil
	end
end

function var_0_0.Dispose(arg_31_0)
	pg.BgmMgr.GetInstance():StopPlay()
	arg_31_0:RemoveListeners()
	arg_31_0:OnDispose()

	arg_31_0.callbacks = nil
	arg_31_0.unitRegister = nil
	arg_31_0.registerIndex = 0
end

function var_0_0.Init(arg_32_0)
	return
end

function var_0_0.DoEnter(arg_33_0)
	return
end

function var_0_0.Update(arg_34_0)
	return
end

function var_0_0.LateUpdate(arg_35_0)
	return
end

function var_0_0.AddListeners(arg_36_0)
	return
end

function var_0_0.RemoveListeners(arg_37_0)
	return
end

function var_0_0.OnDispose(arg_38_0)
	return
end

return var_0_0
