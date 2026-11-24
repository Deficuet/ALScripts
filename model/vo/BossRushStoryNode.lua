local var_0_0 = class("BossRushStoryNode", import("model.vo.BaseVO"))

var_0_0.TRIGGER_TYPE = {
	HIDE_READED = 4,
	ANY_STORY_READED = 6,
	STORY_READED = 3,
	SERIES_PASSED = 2,
	PT_GOT = 1,
	STORY_BRANCH = 5
}
var_0_0.NODE_TYPE = {
	NORMAL = 1,
	EVENT = 2,
	LOCATION = 4,
	BATTLE = 3
}
var_0_0.REPEATABLE_KEY = "repeatable"

function var_0_0.bindConfigTable(arg_1_0)
	return pg.activity_series_enemy_story
end

function var_0_0.Ctor(arg_2_0, arg_2_1, ...)
	var_0_0.super.Ctor(arg_2_0, arg_2_1, ...)

	arg_2_0.configId = arg_2_0.id
end

function var_0_0.GetTriggers(arg_3_0)
	local function var_3_0(arg_4_0)
		if type(arg_4_0) ~= "table" then
			return {}
		end

		return arg_4_0
	end

	local var_3_1 = var_3_0(arg_3_0:getConfig("trigger_type"))
	local var_3_2 = var_3_0(arg_3_0:getConfig("trigger_value"))
	local var_3_3 = {}

	for iter_3_0 = 1, #var_3_1 do
		table.insert(var_3_3, {
			type = var_3_1[iter_3_0],
			value = var_3_2[iter_3_0]
		})
	end

	return var_3_3
end

function var_0_0.IsActive(arg_5_0, arg_5_1, arg_5_2)
	return underscore.all(arg_5_0:GetTriggers(), function(arg_6_0)
		return arg_5_0:_IsActive(arg_5_1, arg_5_2, arg_6_0)
	end)
end

function var_0_0._IsActive(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	return switch(arg_7_3.type, {
		[var_0_0.TRIGGER_TYPE.PT_GOT] = function()
			return arg_7_2.data1 >= arg_7_3.value
		end,
		[var_0_0.TRIGGER_TYPE.SERIES_PASSED] = function()
			return BossRushSeriesData.New({
				id = arg_7_3.value,
				actId = arg_7_1.id
			}):IsUnlock(arg_7_1)
		end,
		[var_0_0.TRIGGER_TYPE.STORY_READED] = function()
			return var_0_0.New({
				id = arg_7_3.value
			}):IsReaded()
		end,
		[var_0_0.TRIGGER_TYPE.HIDE_READED] = function()
			return not var_0_0.New({
				id = arg_7_3.value
			}):IsReaded()
		end,
		[var_0_0.TRIGGER_TYPE.STORY_BRANCH] = function()
			return arg_7_0:IsActiveBranchType(arg_7_1.id, arg_7_3.value)
		end,
		[var_0_0.TRIGGER_TYPE.ANY_STORY_READED] = function()
			return underscore.any(arg_7_3.value, function(arg_14_0)
				return var_0_0.New({
					id = arg_14_0
				}):IsReaded()
			end)
		end
	}, function()
		return false
	end)
end

function var_0_0.IsReaded(arg_16_0)
	local var_16_0 = arg_16_0:GetStory()

	if var_16_0 and var_16_0 ~= "" then
		return tobool(pg.NewStoryMgr.GetInstance():IsPlayed(var_16_0))
	else
		return true
	end
end

function var_0_0.IsActiveBranchType(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_2[1]
	local var_17_1 = arg_17_2[2]
	local var_17_2 = arg_17_2[3]

	if not var_0_0.New({
		id = var_17_0
	}):IsReaded() then
		return false
	end

	if underscore.any(var_17_2, function(arg_18_0)
		return not var_0_0.New({
			id = arg_18_0
		}):IsReaded()
	end) then
		return true
	end

	local var_17_3 = var_0_0.GetLocalBranchFlag(arg_17_1, var_17_0)

	return var_17_3 == 0 or var_17_3 == var_17_1
end

function var_0_0.IsLockBranchType(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0:GetTriggers()

	if underscore.all(var_19_0, function(arg_20_0)
		return arg_20_0.type ~= var_0_0.TRIGGER_TYPE.STORY_BRANCH
	end) then
		return false
	end

	return underscore.all(var_19_0, function(arg_21_0)
		if arg_21_0.type == var_0_0.TRIGGER_TYPE.STORY_BRANCH then
			if not var_0_0.New({
				id = arg_21_0.value[1]
			}):IsReaded() then
				return false
			end

			return not var_0_0:IsActiveBranchType(arg_19_1.id, arg_21_0.value)
		else
			return arg_19_0:_IsActive(arg_19_1, arg_19_2, arg_21_0)
		end
	end)
end

function var_0_0.GetType(arg_22_0)
	return arg_22_0:getConfig("type")
end

function var_0_0.GetName(arg_23_0)
	return arg_23_0:getConfig("name")
end

function var_0_0.GetIconName(arg_24_0)
	return arg_24_0:getConfig("icon")
end

function var_0_0.GetStory(arg_25_0)
	return arg_25_0:getConfig("story")
end

function var_0_0.GetActiveLink(arg_26_0)
	return arg_26_0:getConfig("line")
end

function var_0_0.GetCleanBG(arg_27_0)
	return noEmptyStr(arg_27_0:getConfig("change_background"))
end

function var_0_0.GetCleanBGM(arg_28_0)
	return noEmptyStr(arg_28_0:getConfig("change_bgm"))
end

function var_0_0.GetCleanAnimator(arg_29_0)
	return noEmptyStr(arg_29_0:getConfig("change_prefab"))
end

function var_0_0.GetParams(arg_30_0, arg_30_1)
	local var_30_0 = noEmptyStr(arg_30_0:getConfig("params"))

	if not var_30_0 then
		return nil
	end

	for iter_30_0, iter_30_1 in ipairs(var_30_0) do
		if iter_30_1[1] == arg_30_1 then
			return iter_30_1
		end
	end

	return nil
end

function var_0_0.IsRecrew(arg_31_0)
	local var_31_0 = arg_31_0:getConfig("label_key")

	if type(var_31_0) ~= "table" then
		return nil
	end

	local var_31_1 = StoryStep.GetGlobalFlagKey(var_31_0.flagID) .. var_31_0.flagIndex

	if not PlayerPrefs.HasKey(var_31_1) then
		return nil
	end

	return PlayerPrefs.GetInt(var_31_1) > 0
end

function var_0_0.GetBranchFlagKey(arg_32_0, arg_32_1)
	local var_32_0 = getProxy(PlayerProxy):getRawData().id

	return string.format("BossRushStoryNode_BranchSel_%s_%s_%s", var_32_0, arg_32_0, arg_32_1)
end

function var_0_0.GetLocalBranchFlag(arg_33_0, arg_33_1)
	return PlayerPrefs.GetInt(var_0_0.GetBranchFlagKey(arg_33_0, arg_33_1), 0)
end

function var_0_0.SetLocalBranchFlag(arg_34_0, arg_34_1, arg_34_2)
	PlayerPrefs.SetInt(var_0_0.GetBranchFlagKey(arg_34_0, arg_34_1), arg_34_2)
	PlayerPrefs.Save()
end

return var_0_0
