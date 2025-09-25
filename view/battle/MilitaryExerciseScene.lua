local var_0_0 = class("MilitaryExerciseScene", import("..base.BaseUI"))

var_0_0.TYPE_SHOP = 1

function var_0_0.getUIName(arg_1_0)
	return "MilitaryExerciseUI"
end

function var_0_0.ResUISettings(arg_2_0)
	return true
end

function var_0_0.setShips(arg_3_0, arg_3_1)
	arg_3_0.ships = arg_3_1
end

function var_0_0.setFleet(arg_4_0, arg_4_1)
	arg_4_0.fleet = arg_4_1
end

function var_0_0.setRivals(arg_5_0, arg_5_1)
	table.sort(arg_5_1, function(arg_6_0, arg_6_1)
		return arg_6_0.rank < arg_6_1.rank
	end)

	arg_5_0.rivalVOs = arg_5_1
end

function var_0_0.setExerciseCount(arg_7_0, arg_7_1)
	arg_7_0.exerciseCount = arg_7_1
end

function var_0_0.setSeasonTime(arg_8_0, arg_8_1)
	arg_8_0.seasonTime = arg_8_1
end

function var_0_0.setRecoverTime(arg_9_0, arg_9_1)
	arg_9_0.recoverTime = arg_9_1
end

function var_0_0.setActivity(arg_10_0, arg_10_1)
	arg_10_0.activity = arg_10_1

	arg_10_0:setSeasonTime(arg_10_1.stopTime)
end

function var_0_0.updateSeaInfoVO(arg_11_0, arg_11_1)
	arg_11_0.seasonInfo = arg_11_1

	arg_11_0:setFleet(arg_11_1.fleet)
	arg_11_0:setRivals(arg_11_1.rivals)
	arg_11_0:setExerciseCount(arg_11_1.fightCount)
	arg_11_0:setRecoverTime(arg_11_1.resetTime)
end

function var_0_0.setSeasonInfo(arg_12_0, arg_12_1)
	arg_12_0:updateSeaInfoVO(arg_12_1)
	arg_12_0:setFleet(arg_12_1.fleet)
	arg_12_0:setRivals(arg_12_1.rivals)
	arg_12_0:setExerciseCount(arg_12_1.fightCount)
	arg_12_0:setRecoverTime(arg_12_1.resetTime)
	arg_12_0:updateSeasonTime()
	arg_12_0:initPlayerFleet()
	arg_12_0:initPlayerInfo()
	arg_12_0:updateRivals()
end

function var_0_0.init(arg_13_0)
	arg_13_0.backBtn = arg_13_0:findTF("blur_panel/adapt/top/backBtn")
	arg_13_0._normalUIMain = pg.UIMgr.GetInstance().UIMain
	arg_13_0._overlayUIMain = pg.UIMgr.GetInstance().OverlayMain
	arg_13_0.top = findTF(arg_13_0._tf, "blur_panel/adapt/top")
	arg_13_0.awardPanel = arg_13_0:findTF("award_info_panel")

	setActive(arg_13_0.awardPanel, false)

	arg_13_0.rivalList = arg_13_0:findTF("center/rival_list")
	arg_13_0.bottomPanel = arg_13_0:findTF("bottom")
	arg_13_0.shipTpl = arg_13_0:getTpl("fleet_info/shiptpl", arg_13_0.bottomPanel)
	arg_13_0.emptyTpl = arg_13_0:getTpl("fleet_info/emptytpl", arg_13_0.bottomPanel)
	arg_13_0.mainContainer = arg_13_0:findTF("fleet_info/main", arg_13_0.bottomPanel)
	arg_13_0.vanguardContainer = arg_13_0:findTF("fleet_info/vanguard", arg_13_0.bottomPanel)
	arg_13_0.rankCfg = pg.arena_data_rank

	arg_13_0:uiStartAnimating()
end

function var_0_0.updatePlayer(arg_14_0, arg_14_1)
	arg_14_0.player = arg_14_1

	setText(findTF(arg_14_0:findTF("bottom/player_info"), "statistics_panel/exploit_bg/score"), arg_14_1.exploit)
end

function var_0_0.uiStartAnimating(arg_15_0)
	local var_15_0 = 0
	local var_15_1 = arg_15_0.bottomPanel.localPosition.y

	setAnchoredPosition(arg_15_0.bottomPanel, {
		y = var_15_1 - 308
	})
	shiftPanel(arg_15_0.bottomPanel, nil, var_15_1, 0.3, var_15_0, true, true)
end

function var_0_0.uiExitAnimating(arg_16_0)
	local var_16_0 = 0
	local var_16_1 = arg_16_0.bottomPanel.localPosition.y

	shiftPanel(arg_16_0.bottomPanel, nil, var_16_1 - 308, 0.3, var_16_0, true, true)
end

function var_0_0.didEnter(arg_17_0)
	onButton(arg_17_0, arg_17_0.backBtn, function()
		if arg_17_0.isOpenRivalInfoPanel then
			arg_17_0:closeRivalInfoPanel()
		else
			arg_17_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	setActive(arg_17_0:findTF("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(arg_17_0:findTF("stamp"), false)
	end

	onButton(arg_17_0, arg_17_0:findTF("stamp"), function()
		getProxy(TaskProxy):dealMingshiTouchFlag(10)
	end, SFX_CONFIRM)
	onButton(arg_17_0, arg_17_0:findTF("bottom/buttons/rank_btn"), function()
		arg_17_0:emit(MilitaryExerciseMediator.OPEN_RANK)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0:findTF("bottom/buttons/shop_btn"), function()
		arg_17_0:emit(MilitaryExerciseMediator.OPEN_SHOP)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0:findTF("bottom/buttons/award_btn"), function()
		arg_17_0.isOpenAwards = true

		pg.UIMgr.GetInstance():BlurPanel(arg_17_0.awardPanel)

		if not arg_17_0.isInitAward then
			arg_17_0:initAwards()

			arg_17_0.isInitAward = true
		else
			setActive(arg_17_0.awardPanel, true)
		end
	end, SFX_PANEL)
	onButton(arg_17_0, findTF(arg_17_0._tf, "center/replace_rival_btn"), function()
		arg_17_0:emit(MilitaryExerciseMediator.REPLACE_RIVALS)
	end, SFX_PANEL)

	if arg_17_0.contextData.mode == var_0_0.TYPE_SHOP then
		triggerToggle(arg_17_0.shopBtn, true)
	end
end

function var_0_0.updateSeasonTime(arg_24_0)
	arg_24_0.seasonInfoPanel = arg_24_0:findTF("center/season_info")

	arg_24_0:updateSeasonLeftTime(arg_24_0.seasonTime)
	arg_24_0:updateRecoverTime(arg_24_0.recoverTime)
	arg_24_0:updateExerciseCount()
end

function var_0_0.updateExerciseCount(arg_25_0)
	setText(findTF(arg_25_0.seasonInfoPanel, "count"), math.max(arg_25_0.exerciseCount or 0, 0) .. "/" .. SeasonInfo.MAX_FIGHTCOUNT)
end

function var_0_0.updateSeasonLeftTime(arg_26_0, arg_26_1)
	if arg_26_0.leftTimeTimer then
		arg_26_0.leftTimeTimer:Stop()

		arg_26_0.leftTimeTimer = nil
	end

	local var_26_0 = findTF(arg_26_0.seasonInfoPanel, "left_time_container/day")
	local var_26_1 = findTF(arg_26_0.seasonInfoPanel, "left_time_container/time")

	arg_26_0.leftTimeTimer = Timer.New(function()
		local var_27_0 = arg_26_1 - pg.TimeMgr.GetInstance():GetServerTime()

		if var_27_0 > 0 then
			local var_27_1, var_27_2, var_27_3, var_27_4 = pg.TimeMgr.GetInstance():parseTimeFrom(var_27_0)

			setText(var_26_0, var_27_1)
			setText(var_26_1, string.format("%02d:%02d:%02d", var_27_2, var_27_3, var_27_4))
		else
			setText(var_26_0, 0)
			setText(var_26_1, string.format("%02d:%02d:%02d", 0, 0, 0))
			arg_26_0.leftTimeTimer:Stop()

			arg_26_0.leftTimeTimer = nil
		end
	end, 1, -1)

	arg_26_0.leftTimeTimer:Start()
	arg_26_0.leftTimeTimer.func()
end

function var_0_0.updateRecoverTime(arg_28_0, arg_28_1)
	if arg_28_0.recoverTimer then
		arg_28_0.recoverTimer:Stop()

		arg_28_0.recoverTimer = nil
	end

	local var_28_0 = findTF(arg_28_0.seasonInfoPanel, "recover_container/time")

	if arg_28_1 == 0 then
		setText(var_28_0, "")

		return
	end

	arg_28_0.recoverTimer = Timer.New(function()
		local var_29_0 = arg_28_1 - pg.TimeMgr.GetInstance():GetServerTime()

		if var_29_0 > 0 then
			setText(var_28_0, i18n("exercise_count_recover_tip", pg.TimeMgr.GetInstance():DescCDTime(var_29_0)))
		else
			arg_28_0.recoverTimer:Stop()

			arg_28_0.recoverTimer = nil
		end
	end, 1, -1)

	arg_28_0.recoverTimer:Start()
	arg_28_0.recoverTimer.func()
end

function var_0_0.initPlayerFleet(arg_30_0)
	local function var_30_0(arg_31_0, arg_31_1, arg_31_2)
		local var_31_0 = cloneTplTo(arg_30_0.shipTpl, arg_31_1)
		local var_31_1 = arg_31_0.configId
		local var_31_2 = arg_31_0.skinId

		updateShip(var_31_0, arg_31_0, {
			initStar = true
		})
		setText(findTF(var_31_0, "icon_bg/lv/Text"), arg_31_0.level)
		onButton(arg_30_0, var_31_0, function()
			arg_30_0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, arg_31_2, arg_31_0.id)
		end, SFX_PANEL)
	end

	removeAllChildren(arg_30_0.mainContainer)
	removeAllChildren(arg_30_0.vanguardContainer)

	for iter_30_0 = 1, 3 do
		local var_30_1 = arg_30_0.fleet.mainShips[iter_30_0]

		if var_30_1 then
			local var_30_2 = arg_30_0.ships[var_30_1]

			if var_30_2 then
				var_30_0(var_30_2, arg_30_0.mainContainer, TeamType.Main)
			end
		else
			local var_30_3 = cloneTplTo(arg_30_0.emptyTpl, arg_30_0.mainContainer)

			onButton(arg_30_0, findTF(var_30_3, "icon_bg"), function()
				arg_30_0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, TeamType.Main, 0)
			end, SFX_PANEL)
		end
	end

	for iter_30_1 = 1, 3 do
		local var_30_4 = arg_30_0.fleet.vanguardShips[iter_30_1]

		if var_30_4 then
			local var_30_5 = arg_30_0.ships[var_30_4]

			if var_30_5 then
				var_30_0(var_30_5, arg_30_0.vanguardContainer, TeamType.Vanguard)
			end
		else
			local var_30_6 = cloneTplTo(arg_30_0.emptyTpl, arg_30_0.vanguardContainer)

			onButton(arg_30_0, findTF(var_30_6, "icon_bg"), function()
				arg_30_0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, TeamType.Vanguard, 0)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.initPlayerInfo(arg_35_0)
	local var_35_0 = arg_35_0.seasonInfo.score
	local var_35_1 = arg_35_0:findTF("bottom/player_info")

	setText(findTF(var_35_1, "statistics_panel/score_bg/score"), var_35_0)
	setText(findTF(var_35_1, "statistics_panel/rank_bg/score"), arg_35_0.seasonInfo.rank)

	local var_35_2 = findTF(var_35_1, "upgrade_tip/level")
	local var_35_3 = findTF(var_35_1, "upgrade_rank_tip/level")
	local var_35_4 = findTF(var_35_1, "upgrade_score_tip/level")
	local var_35_5 = SeasonInfo.getMilitaryRank(var_35_0, arg_35_0.seasonInfo.rank)

	assert(var_35_5, ">>>" .. var_35_0 .. "--" .. arg_35_0.seasonInfo.rank)

	local var_35_6 = SeasonInfo.getEmblem(var_35_0, arg_35_0.seasonInfo.rank)

	LoadImageSpriteAsync("emblem/" .. var_35_6, findTF(var_35_1, "medal_bg/medal"), true)
	LoadImageSpriteAsync("emblem/n_" .. var_35_6, findTF(var_35_1, "medal_bg/Text"), true)

	local var_35_7 = findTF(var_35_1, "exp_slider"):GetComponent("Slider")
	local var_35_8, var_35_9, var_35_10 = SeasonInfo.getNextMilitaryRank(var_35_0, arg_35_0.seasonInfo.rank)
	local var_35_11 = math.min(var_35_9, var_35_0)

	setText(var_35_2, var_35_8)
	setText(var_35_4, var_35_9)
	setText(var_35_3, var_35_10 > 0 and var_35_10 or "-")

	var_35_7.value = var_35_11 / var_35_9
end

function var_0_0.updateRivals(arg_36_0)
	arg_36_0.rivalTFs = {}

	for iter_36_0 = 1, 4 do
		table.insert(arg_36_0.rivalTFs, arg_36_0.rivalList:GetChild(iter_36_0 - 1))
	end

	for iter_36_1 = 1, 4 do
		local var_36_0 = arg_36_0.rivalTFs[iter_36_1]

		setActive(var_36_0, iter_36_1 <= #arg_36_0.rivalVOs)

		if iter_36_1 <= #arg_36_0.rivalVOs then
			arg_36_0:updateRival(iter_36_1)
		end
	end
end

function var_0_0.updateRival(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.rivalTFs[arg_37_1]
	local var_37_1 = arg_37_0.rivalVOs[arg_37_1]
	local var_37_2 = SeasonInfo.getMilitaryRank(var_37_1.score, var_37_1.rank)

	assert(var_37_2, ">>>" .. var_37_1.score .. "--" .. var_37_1.rank)

	local var_37_3 = findTF(var_37_0, "shiptpl")
	local var_37_4 = SeasonInfo.getEmblem(var_37_1.score, var_37_1.rank)

	LoadImageSpriteAsync("emblem/" .. var_37_4, findTF(var_37_0, "medal"), true)
	LoadImageSpriteAsync("emblem/n_" .. var_37_4, findTF(var_37_0, "Text"), true)
	updateDrop(var_37_3, {
		type = DROP_TYPE_SHIP,
		id = var_37_1.icon,
		skinId = var_37_1.skinId,
		propose = var_37_1.proposeTime,
		remoulded = var_37_1.remoulded
	}, {
		initStar = true
	})
	setActive(findTF(var_37_3, "icon_bg/lv"), false)
	setText(findTF(var_37_0, "rank_bg/rank_container/name"), var_37_1.rank)
	setText(findTF(var_37_0, "name_container/name"), var_37_1.name)
	setText(findTF(var_37_0, "name_container/lv"), "Lv." .. var_37_1.level)
	setText(findTF(var_37_0, "comprehensive_panel/comprehensive/main_fleet/value"), var_37_1:GetGearScoreSum(TeamType.Main))
	setText(findTF(var_37_0, "comprehensive_panel/comprehensive/vanguard_fleet/value"), var_37_1:GetGearScoreSum(TeamType.Vanguard))
	onButton(arg_37_0, var_37_0, function()
		arg_37_0:emit(MilitaryExerciseMediator.OPEN_RIVAL_INFO, var_37_1)
	end, SFX_PANEL)
end

function var_0_0.initAwards(arg_39_0)
	assert(not arg_39_0.isInitAward, "已经初始化奖励列表")
	setActive(arg_39_0.awardPanel, true)
	onButton(arg_39_0, arg_39_0:findTF("top/btnBack", arg_39_0.awardPanel), function()
		arg_39_0:closeAwards()
	end, SFX_CANCEL)

	local var_39_0 = arg_39_0:findTF("bg/frame/content/time_panel/Text", arg_39_0.awardPanel)

	setText(var_39_0, i18n("exercise_time_tip", "   " .. os.date("%Y.%m.%d", arg_39_0.activity.data1) .. " — " .. os.date("%Y.%m.%d", arg_39_0.activity.stopTime)))

	local var_39_1 = arg_39_0:findTF("bg/frame/content/desc_panel/Text", arg_39_0.awardPanel)

	setText(var_39_1, i18n("exercise_rule_tip"))

	local var_39_2 = arg_39_0:findTF("bg/frame/content/award_panel/award_list", arg_39_0.awardPanel)
	local var_39_3 = arg_39_0:getTpl("awardtpl", var_39_2)
	local var_39_4 = arg_39_0:getTpl("awards/equipmenttpl", var_39_3)
	local var_39_5 = arg_39_0:findTF("linetpl", var_39_2)
	local var_39_6 = arg_39_0:findTF("bg/frame/content/award_panel/Text", arg_39_0.awardPanel)

	setText(var_39_6, i18n("exercise_award_tip"))

	local function var_39_7(arg_41_0, arg_41_1)
		local var_41_0 = arg_39_0:findTF("awards", arg_41_0)
		local var_41_1 = arg_39_0.rankCfg[arg_41_1]

		setText(findTF(arg_41_0, "Text"), var_41_1.name .. ":")

		for iter_41_0, iter_41_1 in ipairs(var_41_1.award_list) do
			local var_41_2 = cloneTplTo(var_39_4, var_41_0)

			updateDrop(var_41_2, {
				type = iter_41_1[1],
				id = iter_41_1[2],
				count = iter_41_1[3]
			})
			onButton(arg_39_0, var_41_2:Find("icon_bg"), function()
				arg_39_0:emit(BaseUI.ON_ITEM, iter_41_1[1] == 1 and id2ItemId(iter_41_1[2]) or iter_41_1[2])
			end, SFX_PANEL)
		end

		setText(findTF(arg_41_0, "upgrade_score_tip/level"), var_41_1.point)
		setText(findTF(arg_41_0, "upgrade_rank_tip/level"), var_41_1.order > 0 and var_41_1.order or "-")
	end

	for iter_39_0 = #arg_39_0.rankCfg.all, 1, -1 do
		local var_39_8 = arg_39_0.rankCfg.all[iter_39_0]

		if #arg_39_0.rankCfg[var_39_8].award_list > 0 then
			var_39_7(cloneTplTo(var_39_3, var_39_2), var_39_8)
			cloneTplTo(var_39_5, var_39_2)
		end
	end
end

function var_0_0.closeAwards(arg_43_0)
	if arg_43_0.isOpenAwards then
		setActive(arg_43_0.awardPanel, false)

		arg_43_0.isOpenAwards = false

		pg.UIMgr.GetInstance():UnOverlayPanel(arg_43_0.awardPanel, arg_43_0._tf)
	end
end

function var_0_0.onBackPressed(arg_44_0)
	if arg_44_0.isOpenAwards then
		arg_44_0:closeAwards()
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		arg_44_0:emit(var_0_0.ON_BACK)
	end
end

function var_0_0.willExit(arg_45_0)
	if arg_45_0.tweens then
		cancelTweens(arg_45_0.tweens)
	end

	if arg_45_0.leftTimeTimer then
		arg_45_0.leftTimeTimer:Stop()

		arg_45_0.leftTimeTimer = nil
	end

	if arg_45_0.recoverTimer then
		arg_45_0.recoverTimer:Stop()

		arg_45_0.recoverTimer = nil
	end

	arg_45_0:closeAwards()
end

return var_0_0
