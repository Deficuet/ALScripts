TimelineSupport = {}

local var_0_0 = TimelineSupport

function var_0_0.InitTimeline(arg_1_0)
	var_0_0.DynamicBinding(arg_1_0)
	var_0_0.InitHXGroup(arg_1_0)
end

function var_0_0.EachDirector(arg_2_0, arg_2_1)
	arg_2_1(arg_2_0)
	eachChild(arg_2_0, function(arg_3_0)
		local var_3_0 = arg_3_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if var_3_0 then
			var_0_0.EachDirector(var_3_0, arg_2_1)
		end
	end)
end

function var_0_0.EachTrack(arg_4_0, arg_4_1)
	table.IpairsCArray(TimelineHelper.GetTimelineTracks(arg_4_0), function(arg_5_0, arg_5_1)
		arg_4_1(arg_5_0, arg_5_1)
	end)
end

function var_0_0.EachGroupTrack(arg_6_0, arg_6_1)
	table.IpairsCArray(TimelineHelper.GetGroupTracks(arg_6_0), function(arg_7_0, arg_7_1)
		arg_6_1(arg_7_0, arg_7_1)
	end)
end

function var_0_0.DynamicBinding(arg_8_0)
	local var_8_0 = _.reduce(pg.dorm3d_timeline_dynamic_binding, {}, function(arg_9_0, arg_9_1)
		if arg_9_1.track_name then
			arg_9_0[arg_9_1.track_name] = arg_9_1.object_name
		end

		return arg_9_0
	end)

	var_0_0.EachDirector(arg_8_0, function(arg_10_0)
		var_0_0.EachTrack(arg_10_0, function(arg_11_0, arg_11_1)
			if var_8_0[arg_11_1.name] then
				local var_11_0 = GameObject.Find(var_8_0[arg_11_1.name])

				if var_11_0 then
					TimelineHelper.SetAutoBinding(arg_10_0, arg_11_1, var_11_0)
				else
					warning(string.format("轨道%s需要绑定的物体%s不存在", arg_11_1.name, var_8_0[arg_11_1.name]))
				end
			end
		end)
	end)
end

function var_0_0.InitSubtitle(arg_12_0, arg_12_1)
	local var_12_0 = GameObject.Find("[subtitle]")

	if var_12_0 then
		var_12_0:GetComponent(typeof(Canvas)).worldCamera = pg.UIMgr.GetInstance().overlayCameraComp
	end

	local function var_12_1(arg_13_0)
		local var_13_0 = tonumber(arg_13_0)

		if not var_13_0 then
			return arg_13_0
		end

		local var_13_1 = pg.dorm3d_subtitle[var_13_0].subtitle

		return (HXSet.hxLan(string.gsub(var_13_1, "$dorm3d", arg_12_1)))
	end

	BLHXTimeline.SubtitleMixer.func = var_12_1
end

function var_0_0.DisablePlayOnAwake(arg_14_0)
	var_0_0.EachDirector(arg_14_0, function(arg_15_0)
		arg_15_0.playOnAwake = false
	end)
end

function var_0_0.InitHXGroup(arg_16_0)
	var_0_0.EachDirector(arg_16_0, function(arg_17_0)
		local var_17_0 = false

		var_0_0.EachGroupTrack(arg_17_0, function(arg_18_0, arg_18_1)
			if arg_18_1.name == "HXGroup" and arg_18_1.muted ~= not HXSet.isHx() then
				arg_18_1.muted = not HXSet.isHx()
				var_17_0 = true
			end
		end)

		if var_17_0 then
			arg_17_0:RebuildGraph()
		end
	end)
end
