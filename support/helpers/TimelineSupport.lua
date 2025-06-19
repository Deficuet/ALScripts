TimelineSupport = {}

local var_0_0 = TimelineSupport

function var_0_0.InitTimeline(arg_1_0)
	var_0_0.DynamicBinding(arg_1_0)
end

function var_0_0.EachSubDirector(arg_2_0, arg_2_1)
	eachChild(arg_2_0, function(arg_3_0)
		local var_3_0 = arg_3_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if not var_3_0 then
			return
		end

		table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_3_0), function(arg_4_0, arg_4_1)
			arg_2_1(arg_4_0, arg_4_1, var_3_0)
		end)
		var_0_0.EachSubDirector(var_3_0, arg_2_1)
	end)
end

function var_0_0.DynamicBinding(arg_5_0)
	local var_5_0 = _.reduce(pg.dorm3d_timeline_dynamic_binding, {}, function(arg_6_0, arg_6_1)
		if arg_6_1.track_name then
			arg_6_0[arg_6_1.track_name] = arg_6_1.object_name
		end

		return arg_6_0
	end)

	var_0_0.EachSubDirector(arg_5_0, function(arg_7_0, arg_7_1, arg_7_2)
		if var_5_0[arg_7_1.name] then
			local var_7_0 = GameObject.Find(var_5_0[arg_7_1.name])

			if var_7_0 then
				TimelineHelper.SetSceneBinding(arg_7_2, arg_7_1, var_7_0)
			else
				warning(string.format("轨道%s需要绑定的物体%s不存在", arg_7_1.name, var_5_0[arg_7_1.name]))
			end
		end
	end)
end

function var_0_0.InitSubtitle(arg_8_0, arg_8_1)
	local var_8_0 = GameObject.Find("[subtitle]")

	if var_8_0 then
		var_8_0:GetComponent(typeof(Canvas)).worldCamera = pg.UIMgr.GetInstance().overlayCameraComp
	end

	local function var_8_1(arg_9_0)
		local var_9_0 = tonumber(arg_9_0)

		if not var_9_0 then
			return arg_9_0
		end

		local var_9_1 = pg.dorm3d_subtitle[var_9_0].subtitle

		return (HXSet.hxLan(string.gsub(var_9_1, "$dorm3d", arg_8_1)))
	end

	BLHXTimeline.SubtitleMixer.func = var_8_1
end

function var_0_0.CheckTrackType(arg_10_0, arg_10_1)
	return tostring(arg_10_0:GetType()) == arg_10_1
end

function var_0_0.InitCriAtomTrack(arg_11_0)
	var_0_0.EachSubDirector(arg_11_0, function(arg_12_0, arg_12_1)
		if var_0_0.CheckTrackType(arg_12_1, "BLHXTimeline.BLHXCriAtomTrack") then
			local var_12_0 = ReflectionHelp.RefCallMethod(typeof("BLHXTimeline.BLHXCriAtomTrack"), "GetClips", arg_12_1)

			table.IpairsCArray(var_12_0, function(arg_13_0, arg_13_1)
				local var_13_0 = ReflectionHelp.RefGetProperty(arg_13_1:GetType(), "asset", arg_13_1)
				local var_13_1 = ReflectionHelp.RefGetField(typeof("BLHXTimeline.BLHXCriAtomClip"), "cueSheet", var_13_0)

				pg.CriMgr.GetInstance():LoadCueSheet(var_13_1, nil, true)
			end)
		end
	end)
end

function var_0_0.UnloadPlayable(arg_14_0)
	var_0_0.UnloadCriAtomTrack(arg_14_0)
end

function var_0_0.UnloadCriAtomTrack(arg_15_0)
	var_0_0.EachSubDirector(arg_15_0, function(arg_16_0, arg_16_1)
		if var_0_0.CheckTrackType(arg_16_1, "BLHXTimeline.BLHXCriAtomTrack") then
			local var_16_0 = ReflectionHelp.RefCallMethod(typeof("BLHXTimeline.BLHXCriAtomTrack"), "GetClips", arg_16_1)

			table.IpairsCArray(var_16_0, function(arg_17_0, arg_17_1)
				local var_17_0 = ReflectionHelp.RefGetProperty(arg_17_1:GetType(), "asset", arg_17_1)
				local var_17_1 = ReflectionHelp.RefGetField(typeof("BLHXTimeline.BLHXCriAtomClip"), "cueSheet", var_17_0)

				pg.CriMgr.GetInstance():UnloadCueSheet(var_17_1)
			end)
		end
	end)
end
