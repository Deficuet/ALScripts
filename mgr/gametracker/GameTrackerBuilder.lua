local var_0_0 = class("GameTrackerBuilder")
local var_0_1 = ";"
local var_0_2 = "`"

function var_0_0.SerializedItem(arg_1_0)
	local var_1_0 = table.concat(arg_1_0.int_args or {}, var_0_2)
	local var_1_1 = table.concat(arg_1_0.str_args or {}, var_0_2)

	return table.concat({
		arg_1_0.track_typ or "",
		arg_1_0.track_time or "",
		var_1_0 or "",
		var_1_1 or ""
	}, var_0_1)
end

function var_0_0.DeSerializedItem(arg_2_0)
	local var_2_0 = string.split(arg_2_0, var_0_1)

	if #var_2_0 < 2 then
		return false
	end

	local var_2_1 = tonumber(var_2_0[1] or "")
	local var_2_2 = tonumber(var_2_0[2] or "")

	if var_2_1 == nil or var_2_2 == nil then
		return false
	end

	local var_2_3 = var_2_0[3] or ""
	local var_2_4 = string.split(var_2_3, var_0_2)
	local var_2_5 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_4) do
		local var_2_6 = tonumber(iter_2_1)

		if var_2_6 then
			table.insert(var_2_5, var_2_6)
		end
	end

	local var_2_7 = var_2_0[4] or ""
	local var_2_8 = string.split(var_2_7, var_0_2)

	return {
		track_typ = var_2_1,
		track_time = var_2_2,
		int_args = var_2_5,
		str_args = var_2_8
	}
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {}
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		table.insert(var_3_0, tonumber(iter_3_1 .. ""))
	end

	for iter_3_2, iter_3_3 in ipairs(arg_3_2) do
		table.insert(var_3_1, tostring(iter_3_3))
	end

	local var_3_2 = pg.TimeMgr.GetInstance():GetServerTime()

	return {
		track_typ = arg_3_0,
		track_time = var_3_2,
		int_args = var_3_0,
		str_args = var_3_1
	}
end

function var_0_0.BuildStoryStart(arg_4_0, arg_4_1)
	return var_0_3(18, {
		1,
		arg_4_0,
		arg_4_1
	}, {})
end

function var_0_0.BuildStorySkip(arg_5_0, arg_5_1)
	return var_0_3(18, {
		2,
		arg_5_0,
		arg_5_1
	}, {})
end

function var_0_0.BuildNotice(arg_6_0)
	return var_0_3(19, {}, {
		arg_6_0
	})
end

function var_0_0.BuildStoryOption(arg_7_0, arg_7_1)
	return var_0_3(20, {
		arg_7_0
	}, {
		arg_7_1
	})
end

function var_0_0.BuildEmoji(arg_8_0)
	local var_8_0 = "777#(%d+)#777"
	local var_8_1 = arg_8_0:match(var_8_0)
	local var_8_2 = tonumber(var_8_1)

	if var_8_2 and var_8_2 > 0 then
		return var_0_3(21, {
			var_8_2
		}, {})
	else
		return var_0_3(21, {
			0
		}, {})
	end
end

function var_0_0.BuildExitSilentView(arg_9_0, arg_9_1, arg_9_2)
	return var_0_3(22, {
		arg_9_0,
		arg_9_1
	}, {
		arg_9_2
	})
end

function var_0_0.BuildTouchBanner(arg_10_0)
	return var_0_3(23, {}, {
		arg_10_0
	})
end

function var_0_0.BuildSwitchPainting(arg_11_0, arg_11_1)
	return var_0_3(24, {
		arg_11_0,
		arg_11_1
	}, {})
end

function var_0_0.BuildHubGames(arg_12_0, arg_12_1, arg_12_2)
	return var_0_3(25, {
		arg_12_0,
		arg_12_1
	}, {
		arg_12_2
	})
end

function var_0_0.BuildUrRedeem(arg_13_0, arg_13_1)
	return var_0_3(26, {
		arg_13_0
	}, {
		arg_13_1
	})
end

function var_0_0.BuildUrJump(arg_14_0)
	return var_0_3(27, {}, {
		arg_14_0
	})
end

function var_0_0.BuildDorm3d(arg_15_0)
	return var_0_3(arg_15_0.track_typ, arg_15_0.int_args, arg_15_0.str_args)
end

function var_0_0.BuildNewEducate(arg_16_0)
	return var_0_3(arg_16_0.track_typ, arg_16_0.int_args, arg_16_0.str_args)
end

function var_0_0.BuildNewMainUI(arg_17_0)
	return var_0_3(28, {
		arg_17_0.isNewMainUI,
		arg_17_0.isLogin
	}, {})
end

function var_0_0.BuildGuide(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	if arg_18_0 then
		return var_0_3(30, {
			arg_18_1,
			arg_18_2,
			arg_18_3
		}, {
			arg_18_4
		})
	else
		return var_0_3(29, {
			arg_18_1,
			arg_18_2,
			arg_18_3
		}, {
			arg_18_4
		})
	end
end

function var_0_0.BuildPhantom(arg_19_0)
	return var_0_3(31, {
		arg_19_0
	}, {})
end

function var_0_0.BuildFushunAdventure()
	return var_0_3(35, {}, {})
end

function var_0_0.BuildAllCollection(arg_21_0, arg_21_1)
	return var_0_3(arg_21_0, {
		arg_21_1
	}, {})
end

return var_0_0
