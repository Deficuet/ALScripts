local var_0_0 = class("IslandInteractUnit", import(".IslandSceneUnit"))

function var_0_0.OnAttach(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1 or arg_1_0._go

	arg_1_0.signalReceiver = GetOrAddComponent(var_1_0, "DftCommonSignalReceiver")

	arg_1_0.signalReceiver:SetCommonEvent(function(arg_2_0)
		if arg_1_0.ignoreSignal then
			arg_1_0.ignoreSignal = false

			return
		end

		switch(arg_2_0.stringParameter, {
			TimelineEnd = function()
				arg_1_0:Op("WorldObjectInterActionEnd", arg_1_0.id, arg_1_0.view.player.id)
			end
		})
	end)

	arg_1_0.director = GetOrAddComponent(var_1_0, typeof(UnityEngine.Playables.PlayableDirector))
end

function var_0_0.SetTimelineDic(arg_4_0, arg_4_1)
	arg_4_0.timelineDic = arg_4_1
end

function var_0_0.OnUpdate(arg_5_0)
	return
end

function var_0_0.StartInteract(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
	if arg_6_6 then
		arg_6_0.director:Stop()
	end

	if arg_6_7 then
		arg_6_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", true)
	end

	if arg_6_5 and #arg_6_5 > 1 then
		arg_6_0.behaviourTreeOwner.graph.blackboard:SetVariableValue(arg_6_5[1], arg_6_5[2])
	end

	arg_6_0.director.playableAsset = arg_6_0.timelineDic[arg_6_3]
	arg_6_0.director.extrapolationMode = arg_6_4.is_loop and UnityEngine.Playables.DirectorWrapMode.Loop or UnityEngine.Playables.DirectorWrapMode.None

	arg_6_0:SetPlayerTransform(arg_6_1, arg_6_0._go.transform)
	arg_6_0:BindPlayer(arg_6_2, arg_6_1)
	arg_6_0:BindSelf(arg_6_4)

	arg_6_0.director.enabled = true

	arg_6_0.director:Play()
end

function var_0_0.EndInteract(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	if arg_7_3 then
		arg_7_0.director:Stop()

		arg_7_0.director.enabled = true
	end

	if arg_7_4 then
		arg_7_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", false)
	end

	arg_7_0:BindPlayer(arg_7_2, nil)
	onNextTick(function()
		arg_7_0:RevertPlayerTransform(arg_7_1)
	end)
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
	local var_10_0 = TimelineHelper.GetGroupTracks(arg_10_0.director)

	if var_10_0.Length > 0 and arg_10_0._go.transform.childCount > 0 then
		local var_10_1 = TimelineHelper.GetChildTracks(var_10_0[0])

		for iter_10_0 = 0, var_10_1.Length - 1 do
			local var_10_2, var_10_3 = table.Find(arg_10_1.binding_track, function(arg_11_0, arg_11_1)
				return arg_11_1 == var_10_1[iter_10_0].name
			end)

			if var_10_3 ~= nil then
				local var_10_4 = arg_10_1.binding_path[var_10_3]
				local var_10_5 = string.find(var_10_4, "/")

				if var_10_5 then
					local var_10_6 = string.sub(var_10_4, 1, var_10_5 - 1)
					local var_10_7 = string.sub(var_10_4, var_10_5)

					var_10_4 = var_10_6 .. "(Clone)" .. var_10_7
				else
					var_10_4 = var_10_4 .. "(Clone)"
				end

				local var_10_8 = go(arg_10_0._go.transform:Find(var_10_4))

				TimelineHelper.SetAutoBinding(arg_10_0.director, var_10_1[iter_10_0], var_10_8)
			end
		end
	end
end

function var_0_0.BindPlayer(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = TimelineHelper.GetGroupTracks(arg_12_0.director)
	local var_12_1 = arg_12_2 and go(arg_12_2._go.transform:GetChild(0))

	if arg_12_1 < var_12_0.Length then
		local var_12_2 = TimelineHelper.GetChildTracks(var_12_0[arg_12_1])

		for iter_12_0 = 0, var_12_2.Length - 1 do
			TimelineHelper.SetAutoBinding(arg_12_0.director, var_12_2[iter_12_0], var_12_1)
		end
	end
end

function var_0_0.SetPlayerTransform(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.cachePlayerTransformInfo = {
		position = arg_13_1._tf.position,
		rotation = arg_13_1._tf.rotation
	}
	arg_13_1._tf.position = arg_13_2.position

	arg_13_1:SetTargetRotation(arg_13_2.rotation)
end

function var_0_0.RevertPlayerTransform(arg_14_0, arg_14_1)
	if not arg_14_0.cachePlayerTransformInfo then
		return
	end

	arg_14_1._tf.position = arg_14_0.cachePlayerTransformInfo.position

	arg_14_1:SetTargetRotation(arg_14_0.cachePlayerTransformInfo.rotation)

	arg_14_0.cachePlayerTransformInfo = nil
end

return var_0_0
