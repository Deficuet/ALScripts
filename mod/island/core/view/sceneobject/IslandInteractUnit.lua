local var_0_0 = class("IslandInteractUnit", import(".IslandSceneUnit"))

function var_0_0.OnAttach(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1 or arg_1_0._go

	arg_1_0.signalReceiver = GetOrAddComponent(var_1_0, "DftCommonSignalReceiver")

	arg_1_0.signalReceiver:SetCommonEvent(function(arg_2_0)
		if arg_1_0.ignoreSignal then
			return
		end

		switch(arg_2_0.stringParameter, {
			TimelineEnd = function()
				arg_1_0:Op("WorldObjectInterActionEnd", arg_1_0.id, arg_1_0.view.player.id)
			end
		})
	end)

	arg_1_0.director = GetOrAddComponent(var_1_0, typeof(UnityEngine.Playables.PlayableDirector))
	arg_1_0.cachePlayerTransformInfoDic = {}
end

function var_0_0.SetTimelineDic(arg_4_0, arg_4_1)
	arg_4_0.timelineDic = arg_4_1
end

function var_0_0.GetTargetRoot(arg_5_0)
	return arg_5_0._go.transform
end

function var_0_0.GetPlayerParent(arg_6_0, arg_6_1)
	return arg_6_0:GetTargetRoot()
end

function var_0_0.StartInteract(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
	local var_7_0 = arg_7_0.data:GetTimeline()[arg_7_3]
	local var_7_1 = arg_7_0.data:GetBlackboardParam()[arg_7_3]

	if arg_7_4 then
		arg_7_0.director:Stop()
	end

	arg_7_1:ActiveOrDisactive(false)

	if arg_7_5 then
		arg_7_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", true)

		arg_7_0.ignoreSignal = false
	else
		arg_7_0.ignoreSignal = true
	end

	arg_7_0:SetPlayerTransform(arg_7_1, arg_7_0:GetPlayerParent(arg_7_2))

	if var_7_1 and #var_7_1 > 1 then
		arg_7_0.behaviourTreeOwner.graph.blackboard:SetVariableValue(var_7_1[1], var_7_1[2])
	end

	arg_7_0.director.playableAsset = arg_7_0.timelineDic[arg_7_3]
	arg_7_0.director.extrapolationMode = var_7_0.is_loop == 1 and UnityEngine.Playables.DirectorWrapMode.Loop or UnityEngine.Playables.DirectorWrapMode.None

	arg_7_0:BindPlayer(arg_7_2, arg_7_1)
	arg_7_0:BindSelf(var_7_0)

	arg_7_0.director.enabled = true

	arg_7_0.director:Play()
end

function var_0_0.EndInteract(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	if arg_8_3 then
		arg_8_0.director.time = arg_8_0.director.extrapolationMode == UnityEngine.Playables.DirectorWrapMode.None and arg_8_0.director.duration or 0

		arg_8_0.director:Evaluate()
		arg_8_0.director:Stop()

		arg_8_0.director.enabled = false
	end

	arg_8_0:BindPlayer(arg_8_2, nil)

	if arg_8_1 then
		arg_8_1:ActiveOrDisactive(true)
	end

	if arg_8_4 then
		arg_8_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", false)
	end

	arg_8_0:RevertPlayerTransform(arg_8_1)
end

function var_0_0.InitStatus(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if arg_9_3 and #arg_9_3 > 1 then
		arg_9_0.behaviourTreeOwner.graph.blackboard:SetVariableValue(arg_9_3[1], arg_9_3[2])
	end

	arg_9_0.director.playableAsset = arg_9_0.timelineDic[arg_9_1]

	arg_9_0:BindSelf(arg_9_2)

	arg_9_0.ignoreSignal = true
	arg_9_0.director.enabled = true

	arg_9_0.director:Play()

	arg_9_0.director.time = arg_9_0.director.duration

	arg_9_0.director:Evaluate()
	arg_9_0.director:Stop()
end

function var_0_0.BindSelf(arg_10_0, arg_10_1)
	local var_10_0 = TimelineHelper.GetGroupTracks(arg_10_0.director):ToTable()

	if #var_10_0 > 0 then
		local var_10_1 = TimelineHelper.GetChildTracks(var_10_0[1]):ToTable()

		for iter_10_0, iter_10_1 in ipairs(var_10_1) do
			local var_10_2, var_10_3 = table.Find(arg_10_1.binding_track, function(arg_11_0, arg_11_1)
				return arg_11_1 == iter_10_0
			end)

			if var_10_3 ~= nil then
				local var_10_4 = arg_10_1.binding_path[var_10_3]
				local var_10_5 = var_10_4 == "" and arg_10_0:GetTargetRoot() or arg_10_0:GetTargetRoot():Find(var_10_4)

				if var_10_5 then
					TimelineHelper.SetAutoBinding(arg_10_0.director, iter_10_1, go(var_10_5))
				end
			end
		end

		for iter_10_2, iter_10_3 in ipairs(arg_10_1.control_binding or {}) do
			local var_10_6 = iter_10_3[1]
			local var_10_7 = iter_10_3[2]
			local var_10_8 = iter_10_3[3] or ""
			local var_10_9 = var_10_1[var_10_6]

			if var_10_9 and var_10_7 and var_10_7 > 0 then
				local var_10_10 = var_10_8 == "" and arg_10_0:GetTargetRoot() or arg_10_0:GetTargetRoot():Find(var_10_8)

				if var_10_10 then
					TimelineHelper.SetControlBinding(arg_10_0.director, var_10_9, var_10_7 - 1, go(var_10_10))
				end
			end
		end
	end
end

function var_0_0.BindPlayer(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0:BindCharacterTracks(arg_12_0:GetRootGroup(var_0_0.ROOT_GROUP_COMMANDER), arg_12_1, arg_12_2)
end

var_0_0.ROOT_GROUP_ITEM = 1
var_0_0.ROOT_GROUP_COMMANDER = 2
var_0_0.ROOT_GROUP_EXTROVERT = 3
var_0_0.ROOT_GROUP_INTROVERT = 4

function var_0_0.GetRootGroup(arg_13_0, arg_13_1)
	local var_13_0 = TimelineHelper.GetGroupTracks(arg_13_0.director):ToTable()[arg_13_1]

	if not var_13_0 then
		warning(string.format("timeline missing root group index=%d (unit=%s)", arg_13_1, tostring(arg_13_0.id)))
	end

	return var_13_0
end

function var_0_0.BindCharacterTracks(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if not arg_14_1 then
		return
	end

	local var_14_0 = TimelineHelper.GetChildTracks(arg_14_1):ToTable()[arg_14_2]

	if not var_14_0 then
		return
	end

	local var_14_1 = TimelineHelper.GetChildTracks(var_14_0):ToTable()
	local var_14_2 = arg_14_3 and arg_14_3._go
	local var_14_3 = arg_14_3 and go(arg_14_3._go.transform:GetChild(0))

	for iter_14_0, iter_14_1 in ipairs(var_14_1) do
		if iter_14_0 == 1 then
			TimelineHelper.SetAutoBinding(arg_14_0.director, iter_14_1, var_14_2)
		else
			TimelineHelper.SetAutoBinding(arg_14_0.director, iter_14_1, var_14_3)
		end
	end
end

function var_0_0.SetShipTransform(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.cacheShipTransformInfoDic = arg_15_0.cacheShipTransformInfoDic or {}
	arg_15_0.cacheShipTransformInfoDic[arg_15_1.id] = {
		position = arg_15_1._tf.position,
		rotation = arg_15_1._tf.rotation
	}

	setParent(arg_15_1._tf, arg_15_0:GetPlayerParent(arg_15_2))

	arg_15_1._tf.localPosition = Vector3.zero
	arg_15_1._tf.localRotation = Quaternion.identity
end

function var_0_0.RevertShipTransform(arg_16_0, arg_16_1)
	if not arg_16_0.view or not arg_16_1 or not arg_16_1._tf then
		return
	end

	local var_16_0 = arg_16_0.cacheShipTransformInfoDic and arg_16_0.cacheShipTransformInfoDic[arg_16_1.id]

	if not var_16_0 then
		return
	end

	setParent(arg_16_1._tf, arg_16_0.view.root)

	arg_16_1._tf.position = var_16_0.position
	arg_16_1._tf.rotation = var_16_0.rotation
	arg_16_0.cacheShipTransformInfoDic[arg_16_1.id] = nil
end

function var_0_0.StartShipInteract(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = arg_17_0.data:GetTimeline()[arg_17_3]
	local var_17_1 = arg_17_0.data:GetBlackboardParam()[arg_17_3]

	arg_17_1:ActiveOrDisactive(false)

	if arg_17_4 then
		arg_17_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", true)

		arg_17_0.ignoreSignal = false
	else
		arg_17_0.ignoreSignal = true
	end

	arg_17_0:SetPlayerTransform(arg_17_1, arg_17_0:GetPlayerParent(1))

	for iter_17_0, iter_17_1 in ipairs(arg_17_2) do
		iter_17_1:ActiveOrDisactive(false)
		iter_17_1:PauseBt()
		arg_17_0:SetShipTransform(iter_17_1, iter_17_0 + 1)
	end

	if var_17_1 and #var_17_1 > 1 then
		arg_17_0.behaviourTreeOwner.graph.blackboard:SetVariableValue(var_17_1[1], var_17_1[2])
	end

	arg_17_0.director.playableAsset = arg_17_0.timelineDic[arg_17_3]
	arg_17_0.director.extrapolationMode = var_17_0.is_loop == 1 and UnityEngine.Playables.DirectorWrapMode.Loop or UnityEngine.Playables.DirectorWrapMode.None

	arg_17_0:BindCharacterTracks(arg_17_0:GetRootGroup(var_0_0.ROOT_GROUP_COMMANDER), 1, arg_17_1)

	for iter_17_2, iter_17_3 in ipairs(arg_17_2) do
		local var_17_2 = iter_17_3.data:GetPersonality()
		local var_17_3 = var_17_2 == 1 and var_0_0.ROOT_GROUP_EXTROVERT or var_17_2 == 2 and var_0_0.ROOT_GROUP_INTROVERT

		assert(var_17_3, "ship personality invalid: " .. tostring(var_17_2))
		arg_17_0:BindCharacterTracks(arg_17_0:GetRootGroup(var_17_3), iter_17_2 + 1, iter_17_3)
	end

	arg_17_0:BindSelf(var_17_0)

	arg_17_0.director.enabled = true

	arg_17_0.director:Play()
end

function var_0_0.EndShipInteract(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	if arg_18_3 then
		arg_18_0.director.time = arg_18_0.director.extrapolationMode == UnityEngine.Playables.DirectorWrapMode.None and arg_18_0.director.duration or 0

		arg_18_0.director:Evaluate()
		arg_18_0.director:Stop()

		arg_18_0.director.enabled = false
	end

	arg_18_0:BindCharacterTracks(arg_18_0:GetRootGroup(var_0_0.ROOT_GROUP_COMMANDER), 1, nil)

	for iter_18_0, iter_18_1 in ipairs(arg_18_2) do
		local var_18_0 = iter_18_1.data and iter_18_1.data.GetPersonality and iter_18_1.data:GetPersonality()
		local var_18_1 = var_18_0 == 1 and var_0_0.ROOT_GROUP_EXTROVERT or var_18_0 == 2 and var_0_0.ROOT_GROUP_INTROVERT

		if var_18_1 then
			arg_18_0:BindCharacterTracks(arg_18_0:GetRootGroup(var_18_1), iter_18_0 + 1, nil)
		end

		iter_18_1:ActiveOrDisactive(true)
		iter_18_1:RestartBt()
		arg_18_0:RevertShipTransform(iter_18_1)
	end

	arg_18_1:ActiveOrDisactive(true)

	if arg_18_4 then
		arg_18_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", false)
	end

	arg_18_0:RevertPlayerTransform(arg_18_1)
end

function var_0_0.SetPlayerTransform(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.cachePlayerTransformInfoDic[arg_19_1.id] = {
		position = arg_19_1._tf.position,
		rotation = arg_19_1._tf.rotation
	}

	setParent(arg_19_1._tf, arg_19_2)

	arg_19_1._tf.localPosition = Vector3.zero
	arg_19_1._tf.localRotation = Quaternion.identity
	GetOrAddComponent(arg_19_1._go, typeof(UnityEngine.Animator)).enabled = true
end

function var_0_0.RevertPlayerTransform(arg_20_0, arg_20_1)
	if not arg_20_0.view or not arg_20_1 or not arg_20_1._tf or not arg_20_0.cachePlayerTransformInfoDic[arg_20_1.id] then
		return
	end

	setParent(arg_20_1._tf, arg_20_0.view.root)

	arg_20_1._tf.position = arg_20_0.cachePlayerTransformInfoDic[arg_20_1.id].position
	arg_20_1._tf.rotation = arg_20_0.cachePlayerTransformInfoDic[arg_20_1.id].rotation
	GetOrAddComponent(arg_20_1._go, typeof(UnityEngine.Animator)).enabled = false
	arg_20_0.cachePlayerTransformInfoDic[arg_20_1.id] = nil
end

return var_0_0
