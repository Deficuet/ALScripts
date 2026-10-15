ResList = ResList or {}
ResList.LevelStageViewResConst = {}

local var_0_0 = ResList.LevelStageViewResConst

function var_0_0.GetResource(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = arg_1_0 and arg_1_0.chapterVO

	table.insertto(var_1_0, ResList.ChapterResConst.GetStrategyResList(var_1_1))
	table.insertto(var_1_0, ResList.ChapterResConst.GetCommanderSkillResList(var_1_1))
	table.insertto(var_1_0, ResList.ChapterResConst.GetFleetIconResList(var_1_1))

	return var_1_0
end

return var_0_0
