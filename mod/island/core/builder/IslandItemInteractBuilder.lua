local var_0_0 = class("IslandItemInteractBuilder", import(".IslandGenericBuilder"))

function var_0_0.GetModule(arg_1_0, arg_1_1, arg_1_2)
	return IslandInteractUnit.New(arg_1_1, arg_1_2)
end

function var_0_0.Load(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {}
	local var_2_1

	table.insert(var_2_0, function(arg_3_0)
		arg_2_0:LoadAsset(arg_2_1, function(arg_4_0)
			var_2_1 = arg_4_0

			arg_3_0()
		end)
	end)
	table.insert(var_2_0, function(arg_5_0)
		arg_2_0:SetupBT(var_2_1, arg_2_1, arg_5_0)
	end)
	table.insert(var_2_0, function(arg_6_0)
		arg_2_0:SetupSubBT(var_2_1, arg_2_1, arg_6_0)
	end)
	seriesAsync(var_2_0, function()
		arg_2_2(var_2_1)
	end)
end

function var_0_0.AddComponents(arg_8_0, arg_8_1, arg_8_2)
	GetOrAddComponent(arg_8_1, "DftCommonSignalReceiver")
end

function var_0_0.SetupSubBT(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_3()
end

function var_0_0.LoadTimeline(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	if not arg_10_3:HasTimeline() then
		arg_10_4()

		return
	end

	local var_10_0 = arg_10_3:GetTimeline()
	local var_10_1 = {}
	local var_10_2 = {}

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		table.insert(var_10_1, function(arg_11_0)
			ResourceMgr.Inst:getAssetAsync(iter_10_1.name, "", typeof(UnityEngine.Playables.PlayableAsset), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_12_0)
				local var_12_0 = Object.Instantiate(arg_12_0)

				var_10_2[iter_10_0] = var_12_0

				arg_11_0()
			end), true, true)
		end)
	end

	parallelAsync(var_10_1, function()
		local var_13_0 = GetOrAddComponent(arg_10_1, typeof(UnityEngine.Playables.PlayableDirector))

		var_13_0.playableAsset = var_10_2[1]

		var_13_0:Stop()

		var_13_0.playOnAwake = false

		arg_10_2:SetTimelineDic(var_10_2)
		arg_10_4()
	end)
end

return var_0_0
