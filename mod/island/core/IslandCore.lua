local var_0_0 = class("IslandCore", import("..IslandDispatcher"))

var_0_0.STATE_LOAD = 1
var_0_0.STATE_INIT = 2
var_0_0.STATE_INIT_FINISH = 3
var_0_0.STATE_DISPOSE = 4

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.poolMgr = arg_1_1

	local var_1_0, var_1_1 = arg_1_0:GetViewAndController(arg_1_2, arg_1_3)

	arg_1_0.view = var_1_0
	arg_1_0.controller = var_1_1
	arg_1_0.sceneLoader = IslandSceneLoader.New()

	arg_1_0:UpdateState(var_0_0.STATE_LOAD)

	local var_1_2, var_1_3, var_1_4 = IslandDataConvertor.Island2SceneName(arg_1_2)

	arg_1_0.view:SetBgm(var_1_4)
	arg_1_0.sceneLoader:Load(var_1_2, var_1_3, {
		function(arg_2_0)
			arg_1_0:SetUp(arg_2_0)
		end,
		function(arg_3_0)
			onNextTick(arg_3_0)
		end,
		function(arg_4_0)
			arg_1_0:Init(arg_4_0)
		end,
		function(arg_5_0)
			arg_1_0:UpdateState(var_0_0.STATE_INIT_FINISH)
			arg_5_0()
		end
	})

	arg_1_0.enterTime = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetPoolMgr(arg_6_0)
	return arg_6_0.poolMgr
end

function var_0_0.UpdateState(arg_7_0, arg_7_1)
	arg_7_0.state = arg_7_1

	arg_7_0.view:OnCoreStateChanged(arg_7_1)
	arg_7_0.controller:OnCoreStateChanged(arg_7_1)
	pg.m02:sendNotification(GAME.ISLAND_CORE_STATE_CHANGED, arg_7_1)
end

function var_0_0.SetUp(arg_8_0, arg_8_1)
	arg_8_0:UpdateState(var_0_0.STATE_INIT)
	arg_8_0.view:SetUp()
	arg_8_0.controller:SetUp()

	if not arg_8_0.handle then
		arg_8_0.handle = UpdateBeat:CreateListener(arg_8_0.Update, arg_8_0)
	end

	UpdateBeat:AddListener(arg_8_0.handle)

	if not arg_8_0.lateUpdateluHandle then
		arg_8_0.lateUpdateluHandle = LateUpdateBeat:CreateListener(arg_8_0.LateUpdate, arg_8_0)

		LateUpdateBeat:AddListener(arg_8_0.lateUpdateluHandle)
	end

	arg_8_0.callback = arg_8_1
end

function var_0_0.Init(arg_9_0, arg_9_1)
	arg_9_0.view:Enter()

	arg_9_0.initCallback = arg_9_1
end

function var_0_0.GetMapId(arg_10_0)
	return arg_10_0:GetController():GetMapID()
end

function var_0_0.IsInit(arg_11_0)
	return arg_11_0.state == var_0_0.STATE_INIT or arg_11_0.state == var_0_0.STATE_INIT_FINISH
end

function var_0_0.Update(arg_12_0)
	if not arg_12_0:IsInit() then
		return
	end

	arg_12_0.controller:Update()
	arg_12_0.view:Update()

	if arg_12_0.callback and arg_12_0.view:IsLoaded() then
		arg_12_0.callback()

		arg_12_0.callback = nil
	end

	if arg_12_0.initCallback and arg_12_0.view:IsInit() then
		arg_12_0.initCallback()

		arg_12_0.initCallback = nil
	end
end

function var_0_0.LateUpdate(arg_13_0)
	if not arg_13_0:IsInit() then
		return
	end

	arg_13_0.controller:LateUpdate()
	arg_13_0.view:LateUpdate()
end

function var_0_0.GetView(arg_14_0)
	return arg_14_0.view
end

function var_0_0.GetController(arg_15_0)
	return arg_15_0.controller
end

function var_0_0.Link(arg_16_0, arg_16_1, ...)
	arg_16_0:GetController():NotifiyCore(arg_16_1, ...)
end

function var_0_0.Dispose(arg_17_0, arg_17_1)
	local var_17_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_17_0.enterTime

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildMapExit(arg_17_0.controller.mapId, var_17_0))
	arg_17_0:UpdateState(var_0_0.STATE_DISPOSE)

	if arg_17_0.handle then
		UpdateBeat:RemoveListener(arg_17_0.handle)
	end

	if arg_17_0.lateUpdateluHandle then
		LateUpdateBeat:RemoveListener(arg_17_0.lateUpdateluHandle)
	end

	setActive(IslandCameraMgr.instance.gameObject, false)

	if arg_17_0.view then
		arg_17_0.view:Dispose()

		arg_17_0.view = nil
	end

	if arg_17_0.controller then
		arg_17_0.controller:Dispose()

		arg_17_0.controller = nil
	end

	if arg_17_0.sceneLoader then
		arg_17_0.sceneLoader:Dispose(arg_17_1)

		arg_17_0.sceneLoader = nil
	end
end

function var_0_0.GetViewAndController(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0
	local var_18_1
	local var_18_2 = arg_18_1:GetMapId()
	local var_18_3 = pg.island_map[var_18_2]

	if var_18_2 == IslandConst.AGORA_MAP_ID then
		var_18_1 = AgoraController.New(arg_18_0, arg_18_1)

		local var_18_4 = var_18_1:GetAgora()

		var_18_0 = AgoraView.New(arg_18_0, var_18_4, arg_18_2)
	elseif var_18_3.minigame_id > 0 then
		var_18_0 = IslandSeekGameView.New(arg_18_0, arg_18_2)
		var_18_1 = IslandController.New(arg_18_0, arg_18_1)
	else
		var_18_1 = IslandController.New(arg_18_0, arg_18_1)
		var_18_0 = IslandView.New(arg_18_0, arg_18_2)
	end

	return var_18_0, var_18_1
end

return var_0_0
