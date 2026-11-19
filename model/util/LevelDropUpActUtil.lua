local var_0_0 = class("LevelDropUpActUtil")
local var_0_1 = "#-LevelDropUpActUtil-#"

function var_0_0.EixstLevelDropUpAct()
	local var_1_0 = getProxy(ActivityProxy)
	local var_1_1 = pg.expedition_data_template_act.get_id_list_by_act_id

	for iter_1_0, iter_1_1 in pairs(var_1_1) do
		local var_1_2 = var_1_0:RawGetActivityById(iter_1_0)

		if var_1_2 and not var_1_2:isEnd() then
			return true
		end
	end

	return false
end

function var_0_0.IsDropUpChapter(arg_2_0)
	local var_2_0 = getProxy(ActivityProxy)
	local var_2_1 = pg.expedition_data_template_act.get_id_list_by_chapter_id[arg_2_0] or {}

	local function var_2_2(arg_3_0)
		local var_3_0 = var_2_0:RawGetActivityById(arg_3_0)

		if var_3_0 and not var_3_0:isEnd() then
			return true
		end

		return false
	end

	return var_2_1 and #var_2_1 > 0 and var_2_2(pg.expedition_data_template_act[var_2_1[1]].act_id)
end

function var_0_0.IsLevelDropUpAct(arg_4_0)
	local var_4_0 = pg.expedition_data_template_act.get_id_list_by_act_id

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		if iter_4_0 == arg_4_0 then
			return true
		end
	end

	return false
end

function var_0_0.ShouldTipLevelDropUpAct(arg_5_0)
	local var_5_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_5_0 .. var_0_1 .. arg_5_0, 0) == 0
end

function var_0_0.MarkTipLevelDropUpAct(arg_6_0)
	if var_0_0.ShouldTipLevelDropUpAct(arg_6_0) then
		local var_6_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt(var_6_0 .. var_0_1 .. arg_6_0, 1)
		PlayerPrefs.Save()
		getProxy(ActivityProxy):updateActivity(getProxy(ActivityProxy):RawGetActivityById(arg_6_0))
	end
end

return var_0_0
