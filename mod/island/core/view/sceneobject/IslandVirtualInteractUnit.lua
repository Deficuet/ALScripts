local var_0_0 = class("IslandVirtualInteractUnit", import(".IslandInteractUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.attach = "AgoraMainStage/furniture/" .. math.floor(arg_1_2.id / 10) .. "/" .. arg_1_2.config.attach
end

function var_0_0.StartInteract(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6, arg_2_7)
	if arg_2_6 then
		arg_2_0.director:Stop()
	end

	arg_2_0.attachGo = arg_2_0.attachGo or GameObject.Find(arg_2_0.attach)

	arg_2_1:ActiveOrDisactive(false)

	if arg_2_7 then
		arg_2_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", true)
		arg_2_0:SetPlayerTransform(arg_2_1, arg_2_0.attachGo.transform.parent)
	else
		arg_2_0:SetVisitorTransform(arg_2_1, arg_2_0.attachGo.transform.parent)
	end

	if arg_2_5 and #arg_2_5 > 1 then
		arg_2_0.behaviourTreeOwner.graph.blackboard:SetVariableValue(arg_2_5[1], arg_2_5[2])
	end

	arg_2_0.director.playableAsset = arg_2_0.timelineDic[arg_2_3]
	arg_2_0.director.extrapolationMode = arg_2_4.is_loop and UnityEngine.Playables.DirectorWrapMode.Loop or UnityEngine.Playables.DirectorWrapMode.None

	arg_2_0:BindPlayer(arg_2_2, arg_2_1)
	arg_2_0:BindSelf(arg_2_4)

	arg_2_0.director.enabled = true

	arg_2_0.director:Play()
end

function var_0_0.BindSelf(arg_3_0, arg_3_1)
	if not arg_3_0.attachGo then
		return
	end

	local var_3_0 = TimelineHelper.GetGroupTracks(arg_3_0.director):ToTable()

	if #var_3_0 > 0 then
		local var_3_1 = TimelineHelper.GetChildTracks(var_3_0[1]):ToTable()

		for iter_3_0, iter_3_1 in ipairs(var_3_1) do
			local var_3_2, var_3_3 = table.Find(arg_3_1.binding_track, function(arg_4_0, arg_4_1)
				return arg_4_1 == iter_3_0
			end)

			if var_3_3 ~= nil then
				local var_3_4 = arg_3_1.binding_path[var_3_3]
				local var_3_5 = var_3_4 == "" and arg_3_0.attachGo.transform or arg_3_0.attachGo.transform:Find(var_3_4)

				if var_3_5 then
					TimelineHelper.SetAutoBinding(arg_3_0.director, iter_3_1, go(var_3_5))
				end
			end
		end
	end
end

return var_0_0
