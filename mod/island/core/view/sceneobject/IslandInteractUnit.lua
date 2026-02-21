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

function var_0_0.StartInteract(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
	if arg_6_6 then
		arg_6_0.director:Stop()
	end

	arg_6_1:ActiveOrDisactive(false)

	if arg_6_7 then
		arg_6_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", true)

		arg_6_0.ignoreSignal = false
	else
		arg_6_0.ignoreSignal = true
	end

	arg_6_0:SetPlayerTransform(arg_6_1, arg_6_0:GetTargetRoot())

	if arg_6_5 and #arg_6_5 > 1 then
		arg_6_0.behaviourTreeOwner.graph.blackboard:SetVariableValue(arg_6_5[1], arg_6_5[2])
	end

	arg_6_0.director.playableAsset = arg_6_0.timelineDic[arg_6_3]
	arg_6_0.director.extrapolationMode = arg_6_4.is_loop == 1 and UnityEngine.Playables.DirectorWrapMode.Loop or UnityEngine.Playables.DirectorWrapMode.None

	arg_6_0:BindPlayer(arg_6_2, arg_6_1)
	arg_6_0:BindSelf(arg_6_4)

	arg_6_0.director.enabled = true

	arg_6_0.director:Play()
end

function var_0_0.EndInteract(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	if arg_7_3 then
		arg_7_0.director.time = arg_7_0.director.extrapolationMode == UnityEngine.Playables.DirectorWrapMode.None and arg_7_0.director.duration or 0

		arg_7_0.director:Evaluate()
		arg_7_0.director:Stop()

		arg_7_0.director.enabled = false
	end

	arg_7_0:BindPlayer(arg_7_2, nil)

	if arg_7_1 then
		arg_7_1:ActiveOrDisactive(true)
	end

	if arg_7_4 then
		arg_7_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", false)
		onNextTick(function()
			arg_7_0:RevertPlayerTransform(arg_7_1)
		end)
	else
		arg_7_0:RevertPlayerTransform(arg_7_1)
	end
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
	end
end

function var_0_0.BindPlayer(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = TimelineHelper.GetGroupTracks(arg_12_0.director):ToTable()
	local var_12_1 = arg_12_2 and go(arg_12_2._go.transform:GetChild(0))
	local var_12_2 = arg_12_2 and arg_12_2._go

	if arg_12_1 < #var_12_0 then
		local var_12_3 = TimelineHelper.GetChildTracks(var_12_0[arg_12_1 + 1]):ToTable()

		for iter_12_0, iter_12_1 in ipairs(var_12_3) do
			if iter_12_0 == 1 then
				TimelineHelper.SetAutoBinding(arg_12_0.director, iter_12_1, var_12_2)
			else
				TimelineHelper.SetAutoBinding(arg_12_0.director, iter_12_1, var_12_1)
			end
		end
	end
end

function var_0_0.SetPlayerTransform(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.cachePlayerTransformInfoDic[arg_13_1.id] = {
		position = arg_13_1._tf.position,
		rotation = arg_13_1._tf.rotation
	}

	setParent(arg_13_1._tf, arg_13_2)

	arg_13_1._tf.localPosition = Vector3.zero
	arg_13_1._tf.localRotation = Quaternion.identity
	GetOrAddComponent(arg_13_1._go, typeof(UnityEngine.Animator)).enabled = true
end

function var_0_0.RevertPlayerTransform(arg_14_0, arg_14_1)
	if not arg_14_1 or not arg_14_0.cachePlayerTransformInfoDic[arg_14_1.id] then
		return
	end

	setParent(arg_14_1._tf, arg_14_0.view.root)

	arg_14_1._tf.position = arg_14_0.cachePlayerTransformInfoDic[arg_14_1.id].position
	arg_14_1._tf.rotation = arg_14_0.cachePlayerTransformInfoDic[arg_14_1.id].rotation
	GetOrAddComponent(arg_14_1._go, typeof(UnityEngine.Animator)).enabled = false
	arg_14_0.cachePlayerTransformInfoDic[arg_14_1.id] = nil
end

return var_0_0
