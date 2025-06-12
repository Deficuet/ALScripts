local var_0_0 = class("SlideExtraSystem")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.event = arg_1_1
	arg_1_0.scene = arg_1_2
end

function var_0_0.InitScene(arg_2_0)
	arg_2_0.sceneSlideConfigs = GameObject.Find("SlideConfigs").transform
	arg_2_0.movePointsTf = arg_2_0.sceneSlideConfigs:Find("MovePoints")
	arg_2_0.ladyMovePointsDic = {}

	eachChild(arg_2_0.movePointsTf, function(arg_3_0)
		local var_3_0 = tonumber(arg_3_0.name)

		arg_2_0.ladyMovePointsDic[var_3_0] = {}

		eachChild(arg_3_0, function(arg_4_0)
			arg_2_0.ladyMovePointsDic[var_3_0][arg_4_0.name] = {}

			for iter_4_0 = 1, arg_4_0.childCount do
				table.insert(arg_2_0.ladyMovePointsDic[var_3_0][arg_4_0.name], arg_4_0:GetChild(iter_4_0 - 1))
			end
		end)
	end)
end

function var_0_0.InitSlide(arg_5_0)
	if not arg_5_0.scene.doneFirstSlotFresh or arg_5_0.slideInited then
		return
	end

	arg_5_0.slideInited = true
	arg_5_0.slideGo = arg_5_0.scene:GetSceneItem("FurnitureSlots/140101/Slide(Clone)")

	assert(arg_5_0.slideGo, "Furniture Slide not found in scene")

	local var_5_0 = GetOrAddComponent(arg_5_0.slideGo, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	var_5_0.graph.blackboard:AddVariable("_player", go(arg_5_0.scene.player))

	var_5_0.enabled = true

	local var_5_1 = GetOrAddComponent(arg_5_0.slideGo:Find("performance_interact_point"), typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	var_5_1.graph.blackboard:AddVariable("_player", go(arg_5_0.scene.player))

	var_5_1.enabled = true
end

function var_0_0.Init(arg_6_0)
	arg_6_0:InitData()
	arg_6_0:InitScene()
	arg_6_0:InitSlide()

	arg_6_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_6_0:OnUpdate()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_6_0.updateHandler)

	arg_6_0.pickTimer = Timer.New(function()
		return
	end, SlideConst.TIMER_INTERVAL)

	arg_6_0.pickTimer:Start()
end

function var_0_0.InitData(arg_11_0)
	arg_11_0.inviteList = getProxy(ApartmentProxy):GetSlideInviteList()
	arg_11_0.randomList = Clone(arg_11_0.inviteList)
	arg_11_0.ladyDic = {}

	_.each(arg_11_0.inviteList, function(arg_12_0)
		local var_12_0 = arg_11_0.scene.ladyDict[arg_12_0]

		arg_11_0.ladyDic[arg_12_0] = LadySlide.New(var_12_0)
	end)
end

function var_0_0.RamdomPick(arg_13_0)
	if not arg_13_0.randomList or #arg_13_0.randomList == 0 then
		arg_13_0.randomList = Clone(arg_13_0.inviteList)
	end

	local var_13_0 = math.random(1, #arg_13_0.randomList)
	local var_13_1 = arg_13_0.randomList[var_13_0]

	table.remove(arg_13_0.randomList, var_13_0)

	return var_13_1
end

function var_0_0.UpdateSlideInviteList(arg_14_0, arg_14_1, arg_14_2)
	if table.contains(arg_14_2, arg_14_0.currentGroupId) then
		-- block empty
	end

	_.each(arg_14_2, function(arg_15_0)
		table.removebyvalue(arg_14_0.inviteList, arg_15_0)
		table.removebyvalue(arg_14_0.randomList, arg_15_0)
	end)
	_.each(arg_14_1, function(arg_16_0)
		if not table.contains(arg_14_0.inviteList, arg_16_0) then
			table.insert(arg_14_0.inviteList, arg_16_0)

			local var_16_0 = arg_14_0.scene.ladyDict[arg_16_0]

			arg_14_0.ladyDic[arg_16_0] = LadySlide.New(var_16_0)
		end

		if not table.contains(arg_14_0.randomList, arg_16_0) then
			table.insert(arg_14_0.randomList, arg_16_0)
		end
	end)
end

function var_0_0.OnUpdate(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.ladyDic) do
		iter_17_1:OnUpdate()
	end
end

function var_0_0.Dispose(arg_18_0)
	UpdateBeat:RemoveListener(arg_18_0.updateHandler)
	arg_18_0.pickTimer:Stop()
end

function var_0_0.IsOpen(arg_19_0)
	return false
end

return var_0_0
