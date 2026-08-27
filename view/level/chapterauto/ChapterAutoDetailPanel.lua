local var_0_0 = class("ChapterAutoDetailPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoDetailPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0.uiTitleText, i18n("auto_battle_headline"))
	setText(arg_2_0.uiCommonHeaderText, i18n("auto_battle_ing_base_loot"))
	setText(arg_2_0.uiExtraHeaderText, i18n("auto_battle_extra_loot"))
	setText(arg_2_0.uiProficiencyHeaderText, i18n("auto_battle_class_exp_head"))
	setText(arg_2_0.uiStopBtnText, i18n("auto_battle_ing_stop"))
	setText(arg_2_0.uiGetBtnText, i18n("auto_battle_ing_finish"))

	arg_2_0.awardUIList = UIItemList.New(arg_2_0.uiAwardTF, arg_2_0.uiAwardTF:Find("item"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.awardUIList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateAwardTpl(arg_4_1, arg_4_2)
		end
	end)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.uiCloseBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.uiStopBtn, function()
		arg_3_0:OnClickBtn()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.uiGetBtn, function()
		arg_3_0:OnClickBtn()
	end, SFX_PANEL)
end

function var_0_0.OnClickBtn(arg_9_0)
	local var_9_0 = getProxy(ChapterAutoProxy):GetFinishedCnt()

	pg.m02:sendNotification(GAME.END_CHAPTER_AUTO, {
		num = var_9_0
	})
	arg_9_0:Hide()
end

function var_0_0.Show(arg_10_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf)
	var_0_0.super.Show(arg_10_0)
end

function var_0_0.Enter(arg_11_0, arg_11_1)
	arg_11_0.chapter = arg_11_1

	local var_11_0 = arg_11_0.chapter:getConfig("icon")

	if var_11_0 and var_11_0[1] then
		setActive(arg_11_0.uiHeadTF, true)
		setImageSprite(arg_11_0.uiHeadTF:Find("Image"), LoadSprite("qicon/" .. var_11_0[1]))
	else
		setActive(arg_11_0.uiHeadTF, false)
	end

	setText(arg_11_0.uiNameText, arg_11_0.chapter:getConfig("name"))

	local var_11_1 = getProxy(ChapterAutoProxy)

	arg_11_0.finishTime = var_11_1:GetFinishAllCommissionTime()

	local var_11_2 = var_11_1:GetCommissionList()

	arg_11_0.proficiencyOnce = var_11_2[1]:GetClassExpAward()

	setText(arg_11_0.uiProficiencyText, arg_11_0.proficiencyOnce)

	arg_11_0.awards = var_0_0.GetAwards(arg_11_0.chapter)

	arg_11_0.awardUIList:align(#arg_11_0.awards)

	local var_11_3 = underscore.any(var_11_2, function(arg_12_0)
		return arg_12_0:UsedTicket()
	end)

	setActive(arg_11_0.uiDropFrameTF:Find("scroll"), var_11_3)
	setActive(arg_11_0.uiDropFrameTF:Find("empty"), not var_11_3)

	if pg.TimeMgr.GetInstance():GetServerTime() < arg_11_0.finishTime then
		arg_11_0:StartTimer()
	else
		arg_11_0:UpdateContent()
	end

	arg_11_0:Show()
end

function var_0_0.StartTimer(arg_13_0)
	arg_13_0:StopTimer()

	arg_13_0.timer = Timer.New(function()
		arg_13_0:UpdateContent()
	end, 1, -1)

	arg_13_0.timer:Start()
	arg_13_0.timer.func()
end

function var_0_0.UpdateContent(arg_15_0)
	local var_15_0 = pg.TimeMgr.GetInstance()
	local var_15_1 = arg_15_0.finishTime - var_15_0:GetServerTime()

	setText(arg_15_0.uiTimeText, i18n("auto_battle_ing_time", var_15_1 > 0 and var_15_0:DescCDTime(var_15_1) or "00:00:00"))

	local var_15_2, var_15_3 = getProxy(ChapterAutoProxy):GetCntInfo()

	setText(arg_15_0.uiCountText, i18n("auto_battle_ing_cnt", var_15_2, var_15_3))
	setActive(arg_15_0.uiStopBtn, var_15_2 < var_15_3)
	setActive(arg_15_0.uiGetBtn, var_15_2 == var_15_3)
end

function var_0_0.StopTimer(arg_16_0)
	if arg_16_0.timer then
		arg_16_0.timer:Stop()

		arg_16_0.timer = nil
	end
end

function var_0_0.UpdateAwardTpl(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.awards[arg_17_1 + 1]
	local var_17_1 = Drop.Create(var_17_0)

	updateDrop(arg_17_2, var_17_1)
	onButton(arg_17_0, arg_17_2, function()
		if ({
			[99] = true
		})[var_17_1:getConfig("type")] then
			local function var_18_0(arg_19_0)
				local var_19_0 = var_17_1:getConfig("display_icon")
				local var_19_1 = {}

				for iter_19_0, iter_19_1 in ipairs(var_19_0) do
					local var_19_2 = iter_19_1[1]
					local var_19_3 = iter_19_1[2]
					local var_19_4 = var_19_2 == DROP_TYPE_SHIP and not table.contains(arg_19_0, var_19_3)

					var_19_1[#var_19_1 + 1] = {
						type = var_19_2,
						id = var_19_3,
						anonymous = var_19_4
					}
				end

				arg_17_0:emit(BaseUI.ON_DROP_LIST, {
					item2Row = true,
					itemList = var_19_1,
					content = var_17_1:getConfig("display")
				})
			end

			arg_17_0:emit(LevelMediator2.GET_CHAPTER_DROP_SHIP_LIST, arg_17_0.chapter.id, var_18_0)
		else
			arg_17_0:emit(BaseUI.ON_DROP, var_17_1)
		end
	end, SFX_PANEL)
end

function var_0_0.Hide(arg_20_0)
	arg_20_0:StopTimer()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_20_0._tf, arg_20_0._parentTf)
	var_0_0.super.Hide(arg_20_0)
end

function var_0_0.OnDestroy(arg_21_0)
	arg_21_0:StopTimer()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0._tf, arg_21_0._parentTf)
end

function var_0_0.GetAwards(arg_22_0)
	local var_22_0 = LevelInfoView.getChapterAwards(arg_22_0)
	local var_22_1 = pg.chapter_auto_statistics[arg_22_0.id].drop_display_extra

	if type(var_22_1) == "table" then
		for iter_22_0, iter_22_1 in ipairs(var_22_1) do
			table.insert(var_22_0, {
				iter_22_1[1],
				iter_22_1[2]
			})
		end
	end

	return var_22_0
end

return var_0_0
