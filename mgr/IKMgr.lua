pg = pg or {}

local var_0_0 = singletonClass("IKMgr")

pg.IKMgr = var_0_0

function var_0_0.Ctor(arg_1_0)
	arg_1_0.activeIKLayers = {}
	arg_1_0.holdingStatus = {}
	arg_1_0.cacheIKInfos = {}
end

function var_0_0.RegisterEnv(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.ladyIKRoot = arg_2_1
	arg_2_0.ladyBoneMaps = arg_2_2

	arg_2_0:CreateUpdate()
end

function var_0_0.RegisterOnIKLayerActive(arg_3_0, arg_3_1)
	arg_3_0.onIKLayerActive = arg_3_1
end

function var_0_0.RegisterOnIKLayerDeactive(arg_4_0, arg_4_1)
	arg_4_0.onIKLayerDeactive = arg_4_1
end

function var_0_0.RegisterOnIKLayerDrag(arg_5_0, arg_5_1)
	arg_5_0.onIKLayerDrag = arg_5_1
end

function var_0_0.RegisterOnIKLayerAction(arg_6_0, arg_6_1)
	arg_6_0.onIKLayerAction = arg_6_1
end

function var_0_0.UnregisterEnv(arg_7_0)
	arg_7_0.onIKLayerActive = nil
	arg_7_0.onIKLayerDeactive = nil
	arg_7_0.onIKLayerDrag = nil
	arg_7_0.onIKLayerAction = nil

	arg_7_0:ExitIKStatus()

	arg_7_0.ladyIKRoot = nil
	arg_7_0.ladyBoneMaps = nil

	arg_7_0:DisposeUpdate()
end

function var_0_0.CreateUpdate(arg_8_0)
	if arg_8_0.updateHandler then
		return
	end

	arg_8_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_8_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_8_0.updateHandler)
end

function var_0_0.DisposeUpdate(arg_12_0)
	if not arg_12_0.updateHandler then
		return
	end

	UpdateBeat:RemoveListener(arg_12_0.updateHandler)

	arg_12_0.updateHandler = nil
end

function var_0_0.SetIKStatus(arg_13_0, arg_13_1)
	arg_13_0.readyIKLayers = arg_13_1

	table.Foreach(arg_13_1, function(arg_14_0, arg_14_1)
		arg_13_0.cacheIKInfos[arg_14_1] = {}

		local var_14_0 = arg_14_1:GetControllerPath()
		local var_14_1 = arg_13_0.ladyIKRoot:Find(var_14_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
		local var_14_2 = {}

		table.IpairsCArray(var_14_1.IKComponents, function(arg_15_0, arg_15_1)
			var_14_2[arg_15_0 + 1] = arg_15_1:GetIKSolver()
		end)

		arg_13_0.cacheIKInfos[arg_14_1].solvers = var_14_2

		local var_14_3 = _.map(var_14_2, function(arg_16_0)
			return arg_16_0.IKPositionWeight
		end)

		arg_13_0.cacheIKInfos[arg_14_1].weights = var_14_3

		local var_14_4 = tf(var_14_1):Find("Container/SubTargets")
		local var_14_5 = arg_14_1:GetSubTargets()

		table.Foreach(var_14_5, function(arg_17_0, arg_17_1)
			local var_17_0 = var_14_4:Find(arg_17_1.name .. "/Plane")

			var_17_0.localRotation = arg_17_1.planeRot
			var_17_0.localScale = arg_17_1.planeScale
		end)
	end)
end

function var_0_0.ExitIKStatus(arg_18_0)
	arg_18_0:ResetAllIKLayers()

	arg_18_0.readyIKLayers = nil
	arg_18_0.ikHandler = nil
	arg_18_0.ikRevertHandler = nil

	table.clear(arg_18_0.activeIKLayers)
	table.clear(arg_18_0.cacheIKInfos)
	table.clear(arg_18_0.holdingStatus)
end

function var_0_0.Update(arg_19_0)
	(function()
		if not arg_19_0.ikHandler then
			return
		end

		if not arg_19_0.ikHandler.targetScreenOffset then
			return
		end

		local var_20_0 = arg_19_0.ikHandler.rect
		local var_20_1 = var_20_0:PointToNormalized(Vector2.zero)
		local var_20_2 = var_20_0:PointToNormalized(arg_19_0.ikHandler.targetScreenOffset) - var_20_1

		_.each(arg_19_0.ikHandler.subPlanes, function(arg_21_0)
			local var_21_0 = arg_21_0.target
			local var_21_1 = arg_21_0.planeData

			var_21_0.position = var_0_0.GetPostionByRatio(var_21_1, var_20_2)
		end)
	end)()

	if arg_19_0.ikRevertHandler then
		arg_19_0.ikRevertHandler()
	end
end

function var_0_0.OnDragBegin(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = _.detect(arg_22_0.readyIKLayers, function(arg_23_0)
		return arg_23_0:GetTriggerName() == arg_22_1
	end)

	if not var_22_0 then
		return
	end

	if not arg_22_3 and var_22_0:IsIgnoreDrag() then
		return
	end

	warning("ENABLEIK", var_22_0:GetControllerPath())

	local var_22_1 = var_22_0:GetControllerPath()
	local var_22_2 = arg_22_0.ladyIKRoot:Find(var_22_1):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
	local var_22_3 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect

	arg_22_2 = Vector2.New(arg_22_2.x / Screen.width * var_22_3.width, arg_22_2.y / Screen.height * var_22_3.height)

	local var_22_4 = {
		ikData = var_22_0,
		list = var_22_2
	}

	if not arg_22_0.holdingStatus[var_22_0] then
		var_22_4.rect = var_22_0:GetControlRect()

		local var_22_5 = var_22_0:GetActionType()

		if var_22_5 == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET or var_22_5 == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET then
			var_22_4.triggerRect = var_22_0:GetActionRect()
		end

		var_22_4.originScreenPosition = arg_22_2

		local var_22_6 = tf(var_22_2):Find("Container/SubTargets")
		local var_22_7 = {}

		assert(var_22_6)

		local var_22_8 = var_22_0:GetSubTargets()

		_.each(var_22_8, function(arg_24_0)
			local var_24_0 = var_22_6:Find(arg_24_0.name)
			local var_24_1 = var_24_0:Find("Plane")
			local var_24_2 = var_24_0:Find("Target")
			local var_24_3 = var_0_0.TransformMesh(var_24_1:GetComponent(typeof(UnityEngine.MeshCollider)))
			local var_24_4 = arg_22_0.ladyBoneMaps[arg_24_0.name]

			var_24_3.origin = var_24_4.position

			local var_24_5 = var_22_4.rect
			local var_24_6 = Vector2.New(var_24_5.center.x / var_24_5.width, var_24_5.center.y / var_24_5.height)

			var_24_1.position = var_0_0.GetPostionByRatio(var_24_3, var_24_6)
			var_24_2.position = var_24_4.position

			local var_24_7 = {
				planeData = var_24_3,
				target = var_24_2
			}

			table.insert(var_22_7, var_24_7)
		end)

		var_22_4.subPlanes = var_22_7

		setActive(var_22_2, true)
	else
		var_22_4 = arg_22_0.holdingStatus[var_22_0].ikHandler

		local var_22_9 = arg_22_2 - var_22_4.screenPosition

		var_22_4.originScreenPosition = var_22_4.originScreenPosition + var_22_9
		arg_22_0.holdingStatus[var_22_0] = nil
	end

	arg_22_0.ikHandler = var_22_4

	existCall(arg_22_0.onIKLayerActive, var_22_4)
end

function var_0_0.HandleBodyDrag(arg_25_0, arg_25_1)
	if not arg_25_0.ikHandler then
		return
	end

	local var_25_0 = arg_25_0.ikHandler
	local var_25_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect

	arg_25_1 = Vector2.New(arg_25_1.x / Screen.width * var_25_1.width, arg_25_1.y / Screen.height * var_25_1.height)
	var_25_0.screenPosition = arg_25_1

	local var_25_2 = arg_25_1 - var_25_0.originScreenPosition
	local var_25_3 = var_25_0.ikData
	local var_25_4 = var_25_0.rect
	local var_25_5 = var_25_4:Contains(var_25_2)
	local var_25_6 = var_25_0.triggerRect and var_25_0.triggerRect:Contains(var_25_2)

	if not var_25_5 and var_25_3:GetActionType() == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET and var_25_6 then
		arg_25_0.ikHandler = nil

		existCall(arg_25_0.onIKLayerDeactive, var_25_0, true)
		table.insert(arg_25_0.activeIKLayers, var_25_3)
		arg_25_0:PlayIKAction(var_25_0)

		return
	end

	local function var_25_7()
		if var_25_5 then
			return var_25_2
		end

		local var_26_0 = var_25_2
		local var_26_1 = var_25_4.center
		local var_26_2 = {
			{
				Vector2.New(var_25_4.xMin, var_25_4.yMin),
				Vector2.New(var_25_4.xMin, var_25_4.yMax)
			},
			{
				Vector2.New(var_25_4.xMin, var_25_4.yMax),
				Vector2.New(var_25_4.xMax, var_25_4.yMax)
			},
			{
				Vector2.New(var_25_4.xMax, var_25_4.yMax),
				Vector2.New(var_25_4.xMax, var_25_4.yMin)
			},
			{
				Vector2.New(var_25_4.xMax, var_25_4.yMin),
				Vector2.New(var_25_4.xMin, var_25_4.yMin)
			}
		}

		for iter_26_0 = 1, 4 do
			local var_26_3, var_26_4 = SegmentUtil.GetCrossPoint(var_26_1, var_26_0, unpack(var_26_2[iter_26_0]))

			if var_26_3 then
				return var_26_4
			end
		end

		assert(false)

		return var_26_0
	end

	arg_25_0.ikHandler.targetScreenOffset = var_25_7()

	existCall(arg_25_0.onIKLayerDrag, arg_25_0.ikHandler)
end

function var_0_0.ReleaseDrag(arg_27_0)
	if not arg_27_0.ikHandler then
		return
	end

	local var_27_0 = arg_27_0.ikHandler
	local var_27_1 = var_27_0.ikData
	local var_27_2
	local var_27_3 = var_27_1:GetActionType()

	if var_27_3 == Dorm3dIK.ACTION_TRIGGER.RELEASE then
		var_27_2 = true
	elseif var_27_3 == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET then
		local var_27_4 = var_27_0.screenPosition - var_27_0.originScreenPosition

		if var_27_0.triggerRect and var_27_0.triggerRect:Contains(var_27_4) then
			var_27_2 = true
		end
	end

	arg_27_0.ikHandler = nil

	existCall(arg_27_0.onIKLayerDeactive, var_27_0, var_27_2)

	if var_27_2 then
		table.insert(arg_27_0.activeIKLayers, var_27_1)
		arg_27_0:PlayIKAction(var_27_0)

		return
	end

	local var_27_5 = var_27_1:GetBackTime()

	if var_27_5 < 999 then
		table.insert(arg_27_0.activeIKLayers, var_27_1)
		arg_27_0:PlayIKRevert(var_27_5)
	else
		arg_27_0.holdingStatus[var_27_1] = {
			ikHandler = var_27_0
		}
	end
end

function var_0_0.PlayIKRevert(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = Time.time

	function arg_28_0.ikRevertHandler()
		local var_29_0 = Time.time - var_28_0

		_.each(arg_28_0.activeIKLayers, function(arg_30_0)
			local var_30_0 = 1

			if arg_28_1 > 0 then
				var_30_0 = var_29_0 / arg_28_1
			end

			local var_30_1 = arg_28_0.cacheIKInfos[arg_30_0].solvers
			local var_30_2 = arg_28_0.cacheIKInfos[arg_30_0].weights

			table.Foreach(var_30_1, function(arg_31_0, arg_31_1)
				arg_31_1.IKPositionWeight = math.lerp(var_30_2[arg_31_0], 0, var_30_0)
			end)
		end)

		if var_29_0 >= arg_28_1 then
			arg_28_0:ResetActiveIKs()

			arg_28_0.ikRevertHandler = nil

			existCall(arg_28_2)
		end
	end

	arg_28_0.ikRevertHandler()
end

function var_0_0.ResetIK(arg_32_0, arg_32_1)
	local var_32_0 = _.detect(arg_32_0.readyIKLayers, function(arg_33_0)
		return arg_33_0:GetTriggerName() == arg_32_1
	end)

	if not var_32_0 then
		return
	end

	local var_32_1 = var_32_0:GetControllerPath()
	local var_32_2 = arg_32_0.ladyIKRoot:Find(var_32_1):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

	setActive(var_32_2, false)

	local var_32_3 = arg_32_0.cacheIKInfos[var_32_0].solvers
	local var_32_4 = arg_32_0.cacheIKInfos[var_32_0].weights

	table.Foreach(var_32_3, function(arg_34_0, arg_34_1)
		arg_34_1.IKPositionWeight = var_32_4[arg_34_0]

		arg_34_1:FixTransforms()
	end)

	arg_32_0.holdingStatus[var_32_0] = nil

	if arg_32_0.moveTimer then
		arg_32_0.moveTimer:Stop()

		arg_32_0.moveTimer = nil
	end
end

function var_0_0.ResetIKLayers(arg_35_0, arg_35_1)
	local var_35_0 = {}

	_.each(arg_35_1 or {}, function(arg_36_0)
		if not arg_36_0 or var_35_0[arg_36_0] then
			return
		end

		var_35_0[arg_36_0] = true

		local var_36_0 = arg_36_0:GetControllerPath()
		local var_36_1 = arg_35_0.ladyIKRoot and arg_35_0.ladyIKRoot:Find(var_36_0)

		if var_36_1 and not IsNil(var_36_1) then
			setActive(var_36_1, false)
		end

		local var_36_2 = arg_35_0.cacheIKInfos[arg_36_0]

		if var_36_2 then
			local var_36_3 = var_36_2.solvers
			local var_36_4 = var_36_2.weights

			table.Foreach(var_36_3, function(arg_37_0, arg_37_1)
				arg_37_1.IKPositionWeight = var_36_4[arg_37_0]
			end)
		end
	end)
end

function var_0_0.ResetAllIKLayers(arg_38_0)
	local var_38_0 = {}

	local function var_38_1(arg_39_0)
		if not arg_39_0 then
			return
		end

		table.insert(var_38_0, arg_39_0)
	end

	_.each(arg_38_0.readyIKLayers or {}, var_38_1)
	_.each(arg_38_0.activeIKLayers or {}, var_38_1)
	_.each(_.keys(arg_38_0.holdingStatus), var_38_1)

	if arg_38_0.ikHandler then
		var_38_1(arg_38_0.ikHandler.ikData)
	end

	arg_38_0:ResetIKLayers(var_38_0)
	table.clear(arg_38_0.activeIKLayers)
	table.clear(arg_38_0.holdingStatus)

	arg_38_0.ikHandler = nil
	arg_38_0.ikRevertHandler = nil

	if arg_38_0.moveTimer then
		arg_38_0.moveTimer:Stop()

		arg_38_0.moveTimer = nil
	end
end

function var_0_0.ResetActiveIKs(arg_40_0)
	table.insertto(arg_40_0.activeIKLayers, _.keys(arg_40_0.holdingStatus))
	table.clear(arg_40_0.holdingStatus)
	arg_40_0:ResetIKLayers(arg_40_0.activeIKLayers)
	table.clear(arg_40_0.activeIKLayers)

	if arg_40_0.moveTimer then
		arg_40_0.moveTimer:Stop()

		arg_40_0.moveTimer = nil
	end
end

function var_0_0.PlayIKAction(arg_41_0, arg_41_1)
	warning("Trigger IK", arg_41_1.ikData:GetControllerPath())
	seriesAsync({
		function(arg_42_0)
			table.insertto(arg_41_0.activeIKLayers, _.keys(arg_41_0.holdingStatus))
			table.clear(arg_41_0.holdingStatus)
			arg_41_0:PlayIKRevert(arg_41_1.ikData:GetActionRevertTime(), arg_42_0)
		end,
		function(arg_43_0)
			existCall(arg_41_0.onIKLayerAction, arg_41_1)
		end
	})
end

function var_0_0.PlayIKMove(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5, arg_44_6)
	if arg_44_0.moveTimer then
		arg_44_0.moveTimer:Stop()

		arg_44_0.moveTimer = nil
	end

	arg_44_0.ikRevertHandler = nil

	local var_44_0 = _.detect(arg_44_0.readyIKLayers, function(arg_45_0)
		return arg_45_0:GetTriggerName() == arg_44_2
	end)

	if not var_44_0 then
		existCall(arg_44_6)

		return
	end

	warning("PLAY IKMOVE", var_44_0:GetControllerPath())
	arg_44_0:OnDragBegin(arg_44_2, arg_44_1, true)

	if not arg_44_0.ikHandler then
		existCall(arg_44_6)

		return
	end

	local var_44_1 = Time.time + arg_44_5
	local var_44_2 = arg_44_1
	local var_44_3 = arg_44_0.ikHandler.originScreenPosition + arg_44_0.ikHandler.rect:NormalizedToPoint(arg_44_3) * arg_44_4

	local function var_44_4()
		if not arg_44_0.ikHandler or Time.time > var_44_1 then
			arg_44_0:ReleaseDrag()

			if arg_44_0.moveTimer then
				arg_44_0.moveTimer:Stop()

				arg_44_0.moveTimer = nil
			end

			existCall(arg_44_6)

			return
		end

		local var_46_0 = math.max(0, var_44_1 - Time.time) / arg_44_5
		local var_46_1 = Vector2.Lerp(var_44_3, var_44_2, var_46_0)
		local var_46_2 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
		local var_46_3 = Vector2.New(var_46_1.x / var_46_2.width * Screen.width, var_46_1.y / var_46_2.height * Screen.height)

		arg_44_0:HandleBodyDrag(var_46_3)
	end

	arg_44_0.moveTimer = FrameTimer.New(var_44_4, 1, -1)

	arg_44_0.moveTimer:Start()
	var_44_4()
end

function var_0_0.TransformMesh(arg_47_0)
	local var_47_0 = arg_47_0.sharedMesh
	local var_47_1 = {}
	local var_47_2 = arg_47_0.transform:TransformPoint(var_47_0.vertices[0])
	local var_47_3 = arg_47_0.transform:TransformPoint(var_47_0.vertices[1])
	local var_47_4 = arg_47_0.transform:TransformPoint(var_47_0.vertices[2])

	var_47_1.horizontal = var_47_3 - var_47_2
	var_47_1.verticle = var_47_4 - var_47_2
	var_47_1.origin = var_47_2

	return var_47_1
end

function var_0_0.GetPostionByRatio(arg_48_0, arg_48_1)
	return arg_48_0.horizontal * arg_48_1.x + arg_48_0.verticle * arg_48_1.y + arg_48_0.origin
end
