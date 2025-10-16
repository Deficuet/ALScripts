local var_0_0 = class("VoteEntranceScene", import("view.base.BaseUI"))

var_0_0.MAIN_STAGE_CLOSE = 0
var_0_0.MAIN_STAGE_OPEN = 1
var_0_0.MAIN_STAGE_FINAL = 2
var_0_0.MAIN_STAGE_END = 3
var_0_0.SUB_STAGE_CLOSE = 0
var_0_0.SUB_STAGE_META = 1
var_0_0.SUB_STAGE_KID = 2
var_0_0.SUB_STAGE_SIREN = 3
var_0_0.EXCHANGE_STAGE_CLOSE = 0
var_0_0.EXCHANGE_STAGE_OPEN = 1
var_0_0.BILLBOARD_STAGE_NORMAL = 0
var_0_0.BILLBOARD_STAGE_FINAL = 1

function var_0_0.getUIName(arg_1_0)
	return "VoteEntranceUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("frame/back")
	arg_2_0.homeBtn = arg_2_0._tf:Find("frame/home")
	arg_2_0.helpBtn = arg_2_0._tf:Find("frame/help")
	arg_2_0.votesTr = arg_2_0._tf:Find("frame/votes")
	arg_2_0.votesTxt = arg_2_0._tf:Find("frame/votes/Text"):GetComponent(typeof(Text))
	arg_2_0.scheduleTr = arg_2_0._tf:Find("frame/schedule")
	arg_2_0.scheduleTxt = arg_2_0.scheduleTr:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.scheduleImg = arg_2_0.scheduleTr:GetComponent(typeof(Image))
	arg_2_0.awardBtn = arg_2_0._tf:Find("frame/award")
	arg_2_0.mainTr = arg_2_0._tf:Find("bg/main"):GetComponent(typeof(Image))
	arg_2_0.mainTip = arg_2_0.mainTr.gameObject.transform:Find("tip")
	arg_2_0.mainTitle = arg_2_0.mainTr.gameObject.transform:Find("title")
	arg_2_0.awardItem = arg_2_0._tf:Find("bg/main/item")
	arg_2_0.dropTr = arg_2_0.awardItem:Find("Award")
	arg_2_0.dropGetTr = arg_2_0.awardItem:Find("get")
	arg_2_0.dropGotTr = arg_2_0.awardItem:Find("got")
	arg_2_0.subTr = arg_2_0._tf:Find("bg/sub"):GetComponent(typeof(Image))
	arg_2_0.subTip = arg_2_0.subTr.gameObject.transform:Find("tip")
	arg_2_0.subTitle = arg_2_0.subTr.gameObject.transform:Find("title")
	arg_2_0.exchangeTr = arg_2_0._tf:Find("bg/exchange"):GetComponent(typeof(Image))
	arg_2_0.exchangeTip = arg_2_0.exchangeTr.gameObject.transform:Find("tip")
	arg_2_0.exchangeTitle = arg_2_0.exchangeTr.gameObject.transform:Find("title")
	arg_2_0.billboardTr = arg_2_0._tf:Find("bg/billboard"):GetComponent(typeof(Image))
	arg_2_0.billboardTip = arg_2_0.billboardTr.gameObject.transform:Find("tip")
	arg_2_0.honorTr = arg_2_0._tf:Find("bg/honor"):GetComponent(typeof(Image))
	arg_2_0.honorTip = arg_2_0.honorTr.gameObject.transform:Find("tip")
	arg_2_0.awardWindowPage = VoteAwardWindowPage.New(arg_2_0._tf, arg_2_0.event)

	VoteStoryUtil.Notify(VoteStoryUtil.ENTER_SCENE)
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.homeBtn, function()
		arg_3_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.vote_help_2023.tip
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.awardBtn, function()
		arg_3_0.awardWindowPage:ExecuteAction("Show")
	end, SFX_PANEL)

	arg_3_0.voteActivity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_VOTE)

	arg_3_0:FlushAll()
end

function var_0_0.FlushAll(arg_8_0)
	arg_8_0.allPreheatStoriesPlayed = VoteStoryUtil.AllPreheatStoriesPlayed()

	arg_8_0:UpdateSchedule()
	arg_8_0:UpdateVotes()
	arg_8_0:UpdateMainEntrance()
	arg_8_0:UpdateSubEntrance()
	arg_8_0:UpdateExchangeEntrance()
	arg_8_0:UpdateBillboardEntrance()
	arg_8_0:UpdateHonorEntrance()
end

function var_0_0.UpdateSchedule(arg_9_0)
	if not arg_9_0.allPreheatStoriesPlayed then
		setActive(arg_9_0.scheduleTr, false)

		return
	end

	local var_9_0 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup() or getProxy(VoteProxy):GetOpeningFunVoteGroup()

	setActive(arg_9_0.scheduleTr, var_9_0 ~= nil)

	if var_9_0 then
		arg_9_0.scheduleTxt.text = var_9_0:getConfig("name")
	end

	local var_9_1 = "schedule_bg"

	if var_9_0 and var_9_0:isFinalsRace() then
		var_9_1 = "schedule_bg_finals"
	elseif var_9_0 and var_9_0:isResurrectionRace() then
		var_9_1 = "schedule_bg_resurrection"
	elseif var_9_0 and var_9_0:IsFunMetaRace() then
		var_9_1 = "schedule_bg_meta"
	elseif var_9_0 and var_9_0:IsFunSireRace() then
		var_9_1 = "schedule_bg_sire"
	elseif var_9_0 and var_9_0:IsFunKidRace() then
		var_9_1 = "schedule_bg_kid"
	end

	arg_9_0.scheduleImg.sprite = GetSpriteFromAtlas("ui/Vote2023MainUI_atlas", var_9_1)
end

function var_0_0.UpdateVotes(arg_10_0)
	if not arg_10_0.allPreheatStoriesPlayed then
		setActive(arg_10_0.votesTr, false)
		setActive(arg_10_0.awardBtn, false)

		return
	end

	setActive(arg_10_0.awardBtn, not getProxy(VoteProxy):IsAllRaceEnd())

	local var_10_0 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup() or getProxy(VoteProxy):GetOpeningFunVoteGroup()

	setActive(arg_10_0.votesTr, var_10_0 ~= nil)

	if var_10_0 and var_10_0:IsFunRace() then
		arg_10_0.votesTxt.text = arg_10_0:GetSubVotes()
	else
		arg_10_0.votesTxt.text = arg_10_0:GetVotes()
	end
end

function var_0_0.UpdateMainEntrance(arg_11_0)
	local var_11_0 = arg_11_0:GetMainStageState()
	local var_11_1 = GetSpriteFromAtlas("ui/Vote2023MainUI_atlas", "icon_main_" .. var_11_0)

	arg_11_0.mainTr.sprite = var_11_1

	onButton(arg_11_0, arg_11_0.mainTr.gameObject, function()
		local var_12_0 = arg_11_0:ShouldPlayMainStory()

		VoteStoryUtil.Notify(VoteStoryUtil.ENTER_MAIN_STAGE)

		if var_12_0 then
			return
		end

		if not arg_11_0:CheckPreheatStories() then
			return
		end

		arg_11_0:MarkMainRaceNonNew()

		if arg_11_0:ExistMainStageAward() then
			arg_11_0:emit(VoteEntranceMediator.SUBMIT_TASK)

			return
		end

		arg_11_0:emit(VoteEntranceMediator.ON_VOTE)
	end, SFX_PANEL)
	arg_11_0:UpdateMainAward()

	local var_11_2 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup()
	local var_11_3 = var_11_2 and var_11_2:IsOpening() or arg_11_0:ExistMainStageAward() or arg_11_0:ShouldPlayMainStory()

	setGray(arg_11_0.mainTitle, not var_11_3, true)
	arg_11_0:UpdateMainStageTip()
end

function var_0_0.UpdateMainAward(arg_13_0)
	local var_13_0 = arg_13_0:GetMainStageState() == var_0_0.MAIN_STAGE_END
	local var_13_1 = false

	if var_13_0 then
		local var_13_2 = getProxy(ActivityProxy):getActivityById(ActivityConst.VOTE_ENTRANCE_ACT_ID):getConfig("config_client")[2] or -1
		local var_13_3 = pg.task_data_template[var_13_2].award_display

		updateDrop(arg_13_0.dropTr, {
			type = var_13_3[1][1],
			id = var_13_3[1][2],
			count = var_13_3[1][3]
		})

		local var_13_4 = getProxy(TaskProxy):getTaskById(var_13_2) or getProxy(TaskProxy):getFinishTaskById(var_13_2)

		var_13_1 = var_13_4 and var_13_4:isFinish()

		setActive(arg_13_0.dropGetTr, var_13_4 and var_13_4:isFinish() and not var_13_4:isReceive())
		setActive(arg_13_0.dropGotTr, var_13_4 and var_13_4:isFinish() and var_13_4:isReceive())
	end

	setActive(arg_13_0.awardItem, var_13_0 and var_13_1)
end

function var_0_0.UpdateMainStageTip(arg_14_0)
	setActive(arg_14_0.mainTip, arg_14_0:ShouldTipMainStage())
end

function var_0_0.UpdateSubEntrance(arg_15_0)
	local var_15_0 = arg_15_0:GetSubStageState()
	local var_15_1 = GetSpriteFromAtlas("ui/Vote2023MainUI_atlas", "icon_sub_" .. var_15_0)

	arg_15_0.subTr.sprite = var_15_1

	arg_15_0:UpdateSubStageTip()
	onButton(arg_15_0, arg_15_0.subTr.gameObject, function()
		local var_16_0 = arg_15_0:ShouldPlaySubStory()

		VoteStoryUtil.Notify(VoteStoryUtil.ENTER_SUB_STAGE)

		if var_16_0 then
			return
		end

		if not arg_15_0:CheckPreheatStories() then
			return
		end

		arg_15_0:MarkSubRaceNonNew()
		arg_15_0:emit(VoteEntranceMediator.ON_FUN_VOTE)
	end, SFX_PANEL)

	local var_15_2 = getProxy(VoteProxy):GetOpeningFunVoteGroup()
	local var_15_3 = var_15_2 and var_15_2:IsOpening() or arg_15_0:ShouldPlaySubStory()

	setGray(arg_15_0.subTitle, not var_15_3, true)
end

function var_0_0.UpdateSubStageTip(arg_17_0)
	setActive(arg_17_0.subTip, arg_17_0:ShouldTipSubStage())
end

function var_0_0.UpdateExchangeEntrance(arg_18_0)
	local var_18_0 = arg_18_0:GetExchangeState()
	local var_18_1 = GetSpriteFromAtlas("ui/Vote2023MainUI_atlas", "icon_exchange_" .. var_18_0)

	arg_18_0.exchangeTr.sprite = var_18_1

	arg_18_0:UpdateExchangeTip()
	onButton(arg_18_0, arg_18_0.exchangeTr.gameObject, function()
		local var_19_0 = arg_18_0:ShouldPlayExchangeStory()

		VoteStoryUtil.Notify(VoteStoryUtil.ENTER_EXCHANGE)

		if var_19_0 then
			return
		end

		if not arg_18_0:CheckPreheatStories() then
			return
		end

		if getProxy(PlayerProxy):getRawData().level < 25 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("vote_tip_level_limit"))

			return
		end

		arg_18_0:emit(VoteEntranceMediator.ON_EXCHANGE)
	end, SFX_PANEL)

	local var_18_2 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup()
	local var_18_3 = var_18_2 and var_18_2:IsOpening() or arg_18_0:ShouldPlayExchangeStory()

	setGray(arg_18_0.exchangeTitle, not var_18_3, true)
end

function var_0_0.UpdateExchangeTip(arg_20_0)
	setActive(arg_20_0.exchangeTip, arg_20_0:ShouldTipExchange())
end

function var_0_0.UpdateBillboardEntrance(arg_21_0)
	local var_21_0 = arg_21_0:GetBillboardState()
	local var_21_1 = GetSpriteFromAtlas("ui/Vote2023MainUI_atlas", "icon_billboard_" .. var_21_0)

	arg_21_0.billboardTr.sprite = var_21_1

	arg_21_0:UpdateBillboardTip()
	onButton(arg_21_0, arg_21_0.billboardTr.gameObject, function()
		local var_22_0 = arg_21_0:ShouldPlayBillboardStory()

		VoteStoryUtil.Notify(VoteStoryUtil.ENTER_SCHEDULE)

		if var_22_0 then
			return
		end

		if not arg_21_0:CheckPreheatStories() then
			return
		end

		arg_21_0:emit(VoteEntranceMediator.ON_SCHEDULE)
	end, SFX_PANEL)
end

function var_0_0.UpdateBillboardTip(arg_23_0)
	setActive(arg_23_0.billboardTip, arg_23_0:ShouldTipBillboard())
end

function var_0_0.UpdateHonorEntrance(arg_24_0)
	arg_24_0:UpdateHonorTip()
	onButton(arg_24_0, arg_24_0.honorTr.gameObject, function()
		local var_25_0 = arg_24_0:ShouldPlayHonorStory()

		VoteStoryUtil.Notify(VoteStoryUtil.ENTER_HALL)

		if var_25_0 then
			return
		end

		if not arg_24_0:CheckPreheatStories() then
			return
		end

		arg_24_0:emit(VoteEntranceMediator.GO_HALL)
	end, SFX_PANEL)
end

function var_0_0.UpdateHonorTip(arg_26_0)
	setActive(arg_26_0.honorTip, arg_26_0:ShouldTipHonor())
end

function var_0_0.onBackPressed(arg_27_0)
	if arg_27_0.awardWindowPage and arg_27_0.awardWindowPage:GetLoaded() and arg_27_0.awardWindowPage:isShowing() then
		arg_27_0.awardWindowPage:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_27_0)
end

function var_0_0.willExit(arg_28_0)
	if arg_28_0.awardWindowPage then
		arg_28_0.awardWindowPage:Destroy()

		arg_28_0.awardWindowPage = nil
	end
end

function var_0_0.ExistMainStageAward(arg_29_0)
	local var_29_0 = getProxy(TaskProxy)
	local var_29_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.VOTE_ENTRANCE_ACT_ID)

	if not var_29_1 or var_29_1:isEnd() then
		return false
	end

	local var_29_2 = var_29_1:getConfig("config_client")[2] or -1
	local var_29_3 = var_29_0:getTaskById(var_29_2) or var_29_0:getFinishTaskById(var_29_2)

	return var_29_3 and var_29_3:isFinish() and not var_29_3:isReceive()
end

function var_0_0.GetMainStageState(arg_30_0)
	if not arg_30_0.allPreheatStoriesPlayed then
		return var_0_0.MAIN_STAGE_CLOSE
	end

	local var_30_0 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup()
	local var_30_1 = not var_30_0

	if getProxy(VoteProxy):IsAllRaceEnd() then
		return var_0_0.MAIN_STAGE_END
	elseif var_30_0 then
		if var_30_0:isFinalsRace() then
			return var_0_0.MAIN_STAGE_FINAL
		else
			return var_0_0.MAIN_STAGE_OPEN
		end
	else
		return var_0_0.MAIN_STAGE_CLOSE
	end
end

function var_0_0.ShouldTipMainStage(arg_31_0)
	if not arg_31_0.allPreheatStoriesPlayed then
		return arg_31_0:ShouldPlayMainStory()
	else
		return arg_31_0:GetVotes() > 0 or arg_31_0:IsNewMainRace() or arg_31_0:ShouldPlayMainStory() or isActive(arg_31_0.dropGetTr)
	end
end

function var_0_0.ShouldPlayMainStory(arg_32_0)
	local var_32_0 = VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_MAIN_STAGE)

	return arg_32_0.voteActivity and not arg_32_0.voteActivity:isEnd() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_32_0)
end

function var_0_0.IsNewMainRace(arg_33_0)
	local var_33_0 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup()

	return getProxy(VoteProxy):IsNewRace(var_33_0)
end

function var_0_0.MarkMainRaceNonNew(arg_34_0)
	local var_34_0 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup()

	getProxy(VoteProxy):MarkRaceNonNew(var_34_0)
end

function var_0_0.GetSubStageState(arg_35_0)
	if not arg_35_0.allPreheatStoriesPlayed then
		return var_0_0.SUB_STAGE_CLOSE
	end

	local var_35_0 = getProxy(VoteProxy):GetOpeningFunVoteGroup()

	if var_35_0 then
		if var_35_0:IsFunSireRace() then
			return var_0_0.SUB_STAGE_SIREN
		elseif var_35_0:IsFunMetaRace() then
			return var_0_0.SUB_STAGE_META
		elseif var_35_0:IsFunKidRace() then
			return var_0_0.SUB_STAGE_KID
		else
			assert(false)
		end
	else
		return var_0_0.SUB_STAGE_CLOSE
	end
end

function var_0_0.ShouldTipSubStage(arg_36_0)
	if not arg_36_0.allPreheatStoriesPlayed then
		return arg_36_0:ShouldPlaySubStory()
	else
		return arg_36_0:GetSubVotes() > 0 or arg_36_0:IsNewSubRace() or arg_36_0:ShouldPlaySubStory()
	end
end

function var_0_0.ShouldPlaySubStory(arg_37_0)
	local var_37_0 = VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_SUB_STAGE)

	return arg_37_0.voteActivity and not arg_37_0.voteActivity:isEnd() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_37_0)
end

function var_0_0.IsNewSubRace(arg_38_0)
	local var_38_0 = getProxy(VoteProxy):GetOpeningFunVoteGroup()

	return getProxy(VoteProxy):IsNewRace(var_38_0)
end

function var_0_0.MarkSubRaceNonNew(arg_39_0)
	local var_39_0 = getProxy(VoteProxy):GetOpeningFunVoteGroup()

	getProxy(VoteProxy):MarkRaceNonNew(var_39_0)
end

function var_0_0.GetExchangeState(arg_40_0)
	if not arg_40_0.allPreheatStoriesPlayed then
		return var_0_0.EXCHANGE_STAGE_CLOSE
	end

	if getProxy(VoteProxy):GetOpeningNonFunVoteGroup() then
		return var_0_0.EXCHANGE_STAGE_OPEN
	else
		return var_0_0.EXCHANGE_STAGE_CLOSE
	end
end

function var_0_0.ShouldTipExchange(arg_41_0)
	return arg_41_0:ShouldPlayExchangeStory()
end

function var_0_0.ShouldPlayExchangeStory(arg_42_0)
	local var_42_0 = VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_EXCHANGE)

	return arg_42_0.voteActivity and not arg_42_0.voteActivity:isEnd() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_42_0)
end

function var_0_0.GetBillboardState(arg_43_0)
	if not arg_43_0.allPreheatStoriesPlayed then
		return var_0_0.BILLBOARD_STAGE_NORMAL
	end

	local var_43_0 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup()

	if var_43_0 and var_43_0:isFinalsRace() then
		return var_0_0.BILLBOARD_STAGE_FINAL
	else
		return var_0_0.BILLBOARD_STAGE_NORMAL
	end
end

function var_0_0.ShouldTipBillboard(arg_44_0)
	return arg_44_0:ShouldPlayBillboardStory()
end

function var_0_0.ShouldPlayBillboardStory(arg_45_0)
	local var_45_0 = VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_SCHEDULE)

	return arg_45_0.voteActivity and not arg_45_0.voteActivity:isEnd() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_45_0)
end

function var_0_0.ShouldTipHonor(arg_46_0)
	if not arg_46_0.allPreheatStoriesPlayed then
		return arg_46_0:ShouldPlayHonorStory()
	else
		return getProxy(VoteProxy):ExistPastVoteAward() or arg_46_0:ShouldPlayHonorStory()
	end
end

function var_0_0.ShouldPlayHonorStory(arg_47_0)
	local var_47_0 = VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_HALL)

	return arg_47_0.voteActivity and not arg_47_0.voteActivity:isEnd() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_47_0)
end

function var_0_0.GetVotes(arg_48_0)
	local var_48_0 = arg_48_0:GetMainStageState()

	if var_48_0 == var_0_0.MAIN_STAGE_OPEN or var_48_0 == var_0_0.MAIN_STAGE_FINAL then
		local var_48_1 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup()

		return var_48_1 and getProxy(VoteProxy):GetVotesByConfigId(var_48_1.configId) or 0
	end

	return 0
end

function var_0_0.GetSubVotes(arg_49_0)
	if var_0_0.SUB_STAGE_CLOSE ~= arg_49_0:GetSubStageState() then
		local var_49_0 = getProxy(VoteProxy):GetOpeningFunVoteGroup()

		return var_49_0 and getProxy(VoteProxy):GetVotesByConfigId(var_49_0.configId) or 0
	else
		return 0
	end
end

function var_0_0.CheckPreheatStories(arg_50_0)
	if not arg_50_0.allPreheatStoriesPlayed then
		pg.NewGuideMgr.GetInstance():Play("NG0043")

		return false
	end

	return true
end

return var_0_0
