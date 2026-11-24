local var_0_0 = class("ChapterAutoDetailPanelTypeRush", import(".ChapterAutoDetailPanel"))

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoDetailPanelTypeRush"
end

function var_0_0.Enter(arg_2_0, arg_2_1)
	arg_2_0.seriesId = arg_2_1
	arg_2_0.config = pg.activity_series_enemy[arg_2_0.seriesId]

	local var_2_0 = arg_2_0.config.boss_icon

	if var_2_0 and var_2_0[1] then
		setActive(arg_2_0.uiHeadTF, true)
		setImageSprite(arg_2_0.uiHeadTF:Find("Image"), LoadSprite("qicon/" .. var_2_0[1][1]))
	else
		setActive(arg_2_0.uiHeadTF, false)
	end

	setText(arg_2_0.uiNameText, arg_2_0.config.name)

	local var_2_1 = getProxy(ChapterAutoProxy)

	arg_2_0.finishTime = var_2_1:GetFinishAllCommissionTime()

	local var_2_2 = var_2_1:GetCommissionList()

	arg_2_0.proficiencyOnce = var_2_2[1]:GetClassExpAward()

	setText(arg_2_0.uiProficiencyText, arg_2_0.proficiencyOnce)

	arg_2_0.awards = var_0_0.GetAwards(arg_2_0.seriesId)

	arg_2_0.awardUIList:align(#arg_2_0.awards)

	local var_2_3 = underscore.any(var_2_2, function(arg_3_0)
		return arg_3_0:UsedTicket()
	end)

	setActive(arg_2_0.uiDropFrameTF:Find("scroll"), var_2_3)
	setActive(arg_2_0.uiDropFrameTF:Find("empty"), not var_2_3)

	if pg.TimeMgr.GetInstance():GetServerTime() < arg_2_0.finishTime then
		arg_2_0:StartTimer()
	else
		arg_2_0:UpdateContent()
	end

	arg_2_0:Show()
end

function var_0_0.UpdateAwardTpl(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.awards[arg_4_1 + 1]
	local var_4_1 = Drop.Create(var_4_0)

	updateDrop(arg_4_2, var_4_1)
	onButton(arg_4_0, arg_4_2, function()
		arg_4_0:emit(BaseUI.ON_DROP, var_4_1)
	end, SFX_PANEL)
end

function var_0_0.GetAwards(arg_6_0)
	return ChapterAutoPanelTypeRush.GetAwards(arg_6_0)
end

return var_0_0
