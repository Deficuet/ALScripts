local var_0_0 = class("ActivitySpStoryNode", import("model.vo.BaseVO"))

function var_0_0.bindConfigTable(arg_1_0)
	return pg.activity_sp_story
end

var_0_0.NODE_TYPE = {
	UNRELEASED = 99,
	STORY = 1,
	BATTLE = 2
}

function var_0_0.GetType(arg_2_0)
	return arg_2_0:getConfig("story_type")
end

function var_0_0.GetStoryName(arg_3_0)
	return arg_3_0:getConfig("story")
end

function var_0_0.GetDisplayName(arg_4_0)
	return arg_4_0:getConfig("name")
end

function var_0_0.GetPreNodes(arg_5_0)
	local var_5_0 = arg_5_0:getConfig("pre_event")

	if type(var_5_0) ~= "table" then
		return {}
	end

	return var_5_0
end

function var_0_0.GetPreEvent(arg_6_0)
	local var_6_0 = arg_6_0:GetUnlockConditions()
	local var_6_1 = _.detect(var_6_0, function(arg_7_0)
		return arg_7_0[1] == var_0_0.CONDITION.PRE_PASSED
	end)

	if var_6_1 and var_6_1[2] and var_6_1[2] > 0 then
		return var_6_1[2]
	end

	return 0
end

var_0_0.CONDITION = {
	PRE_PASSED = 4,
	PT = 3,
	TIME = 1,
	PASSCHAPTER = 2
}

function var_0_0.GetUnlockConditions(arg_8_0)
	local var_8_0 = arg_8_0:getConfig("lock")

	if type(var_8_0) ~= "table" then
		return {}
	end

	return var_8_0
end

function var_0_0.GetUnlockDesc(arg_9_0)
	return arg_9_0:getConfig("unlock_conditions")
end

function var_0_0.GetCleanBG(arg_10_0)
	return arg_10_0:getConfig("change_background")
end

function var_0_0.GetCleanBGM(arg_11_0)
	return arg_11_0:getConfig("change_bgm")
end

function var_0_0.GetCleanAnimator(arg_12_0)
	local var_12_0 = arg_12_0:getConfig("change_prefab")

	if var_12_0 == "" then
		var_12_0 = nil
	end

	return var_12_0
end

return var_0_0
