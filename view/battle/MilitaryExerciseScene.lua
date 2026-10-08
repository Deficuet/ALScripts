local var_0_0 = class("MilitaryExerciseScene", import("..base.BaseUI"))

var_0_0.TYPE_SHOP = 1

function var_0_0.getUIName(arg_1_0)
	return "MilitaryExerciseUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"weaponframes",
		"shiptype",
		"bg/star_level_card_1",
		"bg/star_level_card_2",
		"bg/star_level_card_3",
		"bg/star_level_card_3_1",
		"bg/star_level_card_4",
		"bg/star_level_card_4_0",
		"bg/star_level_card_4_1",
		"bg/star_level_card_5",
		"bg/star_level_card_5_0",
		"bg/star_level_card_5_1"
	}

	local function var_2_1(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	local function var_2_2(arg_4_0, arg_4_1)
		local var_4_0 = SeasonInfo.getEmblem(arg_4_0, arg_4_1)

		if noEmptyStr(var_4_0) then
			var_2_1("emblem/" .. var_4_0)
			var_2_1("emblem/n_" .. var_4_0)
		end
	end

	local var_2_3 = getProxy(MilitaryExerciseProxy):RawGetSeasonInfo()

	if var_2_3 then
		var_2_2(var_2_3.score, var_2_3.rank)

		local var_2_4 = getProxy(BayProxy)

		local function var_2_5(arg_5_0)
			for iter_5_0, iter_5_1 in ipairs(arg_5_0 or {}) do
				local var_5_0 = var_2_4:RawGetShipById(iter_5_1)

				if var_5_0 then
					var_2_1("SquareIcon/" .. var_5_0:getPainting())
				end
			end
		end

		var_2_5(checkExist(var_2_3, {
			"fleet",
			"mainShips"
		}))
		var_2_5(checkExist(var_2_3, {
			"fleet",
			"vanguardShips"
		}))

		for iter_2_0, iter_2_1 in ipairs(var_2_3.rivals or {}) do
			var_2_2(iter_2_1.score, iter_2_1.rank)

			local var_2_6 = checkExist(pg.ship_skin_template, {
				iter_2_1.skinId,
				"painting"
			})

			if var_2_6 then
				var_2_1("SquareIcon/" .. var_2_6.painting)
			end
		end
	end

	for iter_2_2, iter_2_3 in ipairs(pg.arena_data_rank.all or {}) do
		for iter_2_4, iter_2_5 in ipairs(pg.arena_data_rank[iter_2_3].award_list or {}) do
			if iter_2_5[1] ~= nil then
				local var_2_7 = Drop.Create(iter_2_5)

				var_2_1(var_2_7:getIcon())
			end
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.ResUISettings(arg_6_0)
	return true
end

function var_0_0.setShips(arg_7_0, arg_7_1)
	arg_7_0.ships = arg_7_1
end

function var_0_0.setFleet(arg_8_0, arg_8_1)
	arg_8_0.fleet = arg_8_1
end

function var_0_0.setRivals(arg_9_0, arg_9_1)
	table.sort(arg_9_1, function(arg_10_0, arg_10_1)
		return arg_10_0.rank < arg_10_1.rank
	end)

	arg_9_0.rivalVOs = arg_9_1
end

function var_0_0.setExerciseCount(arg_11_0, arg_11_1)
	arg_11_0.exerciseCount = arg_11_1
end

function var_0_0.setSeasonTime(arg_12_0, arg_12_1)
	arg_12_0.seasonTime = arg_12_1
end

function var_0_0.setRecoverTime(arg_13_0, arg_13_1)
	arg_13_0.recoverTime = arg_13_1
end

function var_0_0.setActivity(arg_14_0, arg_14_1)
	arg_14_0.activity = arg_14_1

	arg_14_0:setSeasonTime(arg_14_1.stopTime)
end

function var_0_0.updateSeaInfoVO(arg_15_0, arg_15_1)
	arg_15_0.seasonInfo = arg_15_1

	arg_15_0:setFleet(arg_15_1.fleet)
	arg_15_0:setRivals(arg_15_1.rivals)
	arg_15_0:setExerciseCount(arg_15_1.fightCount)
	arg_15_0:setRecoverTime(arg_15_1.resetTime)
end

function var_0_0.setSeasonInfo(arg_16_0, arg_16_1)
	arg_16_0:updateSeaInfoVO(arg_16_1)
	arg_16_0:setFleet(arg_16_1.fleet)
	arg_16_0:setRivals(arg_16_1.rivals)
	arg_16_0:setExerciseCount(arg_16_1.fightCount)
	arg_16_0:setRecoverTime(arg_16_1.resetTime)
	arg_16_0:updateSeasonTime()
	arg_16_0:initPlayerFleet()
	arg_16_0:initPlayerInfo()
	arg_16_0:updateRivals()
end

function var_0_0.init(arg_17_0)
	arg_17_0.backBtn = arg_17_0._tf:Find("blur_panel/adapt/top/backBtn")
	arg_17_0._normalUIMain = pg.UIMgr.GetInstance().UIMain
	arg_17_0._overlayUIMain = pg.UIMgr.GetInstance().OverlayMain
	arg_17_0.top = findTF(arg_17_0._tf, "blur_panel/adapt/top")
	arg_17_0.awardPanel = arg_17_0._tf:Find("award_info_panel")

	setActive(arg_17_0.awardPanel, false)

	arg_17_0.rivalList = arg_17_0._tf:Find("center/rival_list")
	arg_17_0.bottomPanel = arg_17_0._tf:Find("bottom")
	arg_17_0.shipTpl = arg_17_0:getTpl("fleet_info/shiptpl", arg_17_0.bottomPanel)
	arg_17_0.emptyTpl = arg_17_0:getTpl("fleet_info/emptytpl", arg_17_0.bottomPanel)
	arg_17_0.mainContainer = arg_17_0.bottomPanel:Find("fleet_info/main")
	arg_17_0.vanguardContainer = arg_17_0.bottomPanel:Find("fleet_info/vanguard")
	arg_17_0.rankCfg = pg.arena_data_rank

	arg_17_0:uiStartAnimating()
end

function var_0_0.updatePlayer(arg_18_0, arg_18_1)
	arg_18_0.player = arg_18_1

	setText(findTF(arg_18_0._tf:Find("bottom/player_info"), "statistics_panel/exploit_bg/score"), arg_18_1.exploit)
end

function var_0_0.uiStartAnimating(arg_19_0)
	local var_19_0 = 0
	local var_19_1 = arg_19_0.bottomPanel.localPosition.y

	setAnchoredPosition(arg_19_0.bottomPanel, {
		y = var_19_1 - 308
	})
	shiftPanel(arg_19_0.bottomPanel, nil, var_19_1, 0.3, var_19_0, true, true)
end

function var_0_0.uiExitAnimating(arg_20_0)
	local var_20_0 = 0
	local var_20_1 = arg_20_0.bottomPanel.localPosition.y

	shiftPanel(arg_20_0.bottomPanel, nil, var_20_1 - 308, 0.3, var_20_0, true, true)
end

function var_0_0.didEnter(arg_21_0)
	onButton(arg_21_0, arg_21_0.backBtn, function()
		if arg_21_0.isOpenRivalInfoPanel then
			arg_21_0:closeRivalInfoPanel()
		else
			arg_21_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	setActive(arg_21_0._tf:Find("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(arg_21_0._tf:Find("stamp"), false)
	end

	onButton(arg_21_0, arg_21_0._tf:Find("stamp"), function()
		getProxy(TaskProxy):dealMingshiTouchFlag(10)
	end, SFX_CONFIRM)
	onButton(arg_21_0, arg_21_0._tf:Find("bottom/buttons/rank_btn"), function()
		arg_21_0:emit(MilitaryExerciseMediator.OPEN_RANK)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0._tf:Find("bottom/buttons/shop_btn"), function()
		arg_21_0:emit(MilitaryExerciseMediator.OPEN_SHOP)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0._tf:Find("bottom/buttons/award_btn"), function()
		arg_21_0.isOpenAwards = true

		pg.UIMgr.GetInstance():BlurPanel(arg_21_0.awardPanel)

		if not arg_21_0.isInitAward then
			arg_21_0:initAwards()

			arg_21_0.isInitAward = true
		else
			setActive(arg_21_0.awardPanel, true)
		end
	end, SFX_PANEL)
	onButton(arg_21_0, findTF(arg_21_0._tf, "center/replace_rival_btn"), function()
		arg_21_0:emit(MilitaryExerciseMediator.REPLACE_RIVALS)
	end, SFX_PANEL)

	if arg_21_0.contextData.mode == var_0_0.TYPE_SHOP then
		triggerToggle(arg_21_0.shopBtn, true)
	end
end

function var_0_0.updateSeasonTime(arg_28_0)
	arg_28_0.seasonInfoPanel = arg_28_0._tf:Find("center/season_info")

	arg_28_0:updateSeasonLeftTime(arg_28_0.seasonTime)
	arg_28_0:updateRecoverTime(arg_28_0.recoverTime)
	arg_28_0:updateExerciseCount()
end

function var_0_0.updateExerciseCount(arg_29_0)
	setText(findTF(arg_29_0.seasonInfoPanel, "count"), math.max(arg_29_0.exerciseCount or 0, 0) .. "/" .. SeasonInfo.MAX_FIGHTCOUNT)
end

function var_0_0.updateSeasonLeftTime(arg_30_0, arg_30_1)
	if arg_30_0.leftTimeTimer then
		arg_30_0.leftTimeTimer:Stop()

		arg_30_0.leftTimeTimer = nil
	end

	local var_30_0 = findTF(arg_30_0.seasonInfoPanel, "left_time_container/day")
	local var_30_1 = findTF(arg_30_0.seasonInfoPanel, "left_time_container/time")

	arg_30_0.leftTimeTimer = Timer.New(function()
		local var_31_0 = arg_30_1 - pg.TimeMgr.GetInstance():GetServerTime()

		if var_31_0 > 0 then
			local var_31_1, var_31_2, var_31_3, var_31_4 = pg.TimeMgr.GetInstance():parseTimeFrom(var_31_0)

			setText(var_30_0, var_31_1)
			setText(var_30_1, string.format("%02d:%02d:%02d", var_31_2, var_31_3, var_31_4))
		else
			setText(var_30_0, 0)
			setText(var_30_1, string.format("%02d:%02d:%02d", 0, 0, 0))
			arg_30_0.leftTimeTimer:Stop()

			arg_30_0.leftTimeTimer = nil
		end
	end, 1, -1)

	arg_30_0.leftTimeTimer:Start()
	arg_30_0.leftTimeTimer.func()
end

function var_0_0.updateRecoverTime(arg_32_0, arg_32_1)
	if arg_32_0.recoverTimer then
		arg_32_0.recoverTimer:Stop()

		arg_32_0.recoverTimer = nil
	end

	local var_32_0 = findTF(arg_32_0.seasonInfoPanel, "recover_container/time")

	if arg_32_1 == 0 then
		setText(var_32_0, "")

		return
	end

	arg_32_0.recoverTimer = Timer.New(function()
		local var_33_0 = arg_32_1 - pg.TimeMgr.GetInstance():GetServerTime()

		if var_33_0 > 0 then
			setText(var_32_0, i18n("exercise_count_recover_tip", pg.TimeMgr.GetInstance():DescCDTime(var_33_0)))
		else
			arg_32_0.recoverTimer:Stop()

			arg_32_0.recoverTimer = nil
		end
	end, 1, -1)

	arg_32_0.recoverTimer:Start()
	arg_32_0.recoverTimer.func()
end

function var_0_0.initPlayerFleet(arg_34_0)
	local function var_34_0(arg_35_0, arg_35_1, arg_35_2)
		local var_35_0 = cloneTplTo(arg_34_0.shipTpl, arg_35_1)
		local var_35_1 = arg_35_0.configId
		local var_35_2 = arg_35_0.skinId

		updateShip(var_35_0, arg_35_0, {
			initStar = true
		})
		setText(findTF(var_35_0, "icon_bg/lv/Text"), arg_35_0.level)
		onButton(arg_34_0, var_35_0, function()
			arg_34_0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, arg_35_2, arg_35_0.id)
		end, SFX_PANEL)
	end

	removeAllChildren(arg_34_0.mainContainer)
	removeAllChildren(arg_34_0.vanguardContainer)

	for iter_34_0 = 1, 3 do
		local var_34_1 = arg_34_0.fleet.mainShips[iter_34_0]

		if var_34_1 then
			local var_34_2 = arg_34_0.ships[var_34_1]

			if var_34_2 then
				var_34_0(var_34_2, arg_34_0.mainContainer, TeamType.Main)
			end
		else
			local var_34_3 = cloneTplTo(arg_34_0.emptyTpl, arg_34_0.mainContainer)

			onButton(arg_34_0, findTF(var_34_3, "icon_bg"), function()
				arg_34_0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, TeamType.Main, 0)
			end, SFX_PANEL)
		end
	end

	for iter_34_1 = 1, 3 do
		local var_34_4 = arg_34_0.fleet.vanguardShips[iter_34_1]

		if var_34_4 then
			local var_34_5 = arg_34_0.ships[var_34_4]

			if var_34_5 then
				var_34_0(var_34_5, arg_34_0.vanguardContainer, TeamType.Vanguard)
			end
		else
			local var_34_6 = cloneTplTo(arg_34_0.emptyTpl, arg_34_0.vanguardContainer)

			onButton(arg_34_0, findTF(var_34_6, "icon_bg"), function()
				arg_34_0:emit(MilitaryExerciseMediator.OPEN_DOCKYARD, TeamType.Vanguard, 0)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.initPlayerInfo(arg_39_0)
	local var_39_0 = arg_39_0.seasonInfo.score
	local var_39_1 = arg_39_0._tf:Find("bottom/player_info")

	setText(findTF(var_39_1, "statistics_panel/score_bg/score"), var_39_0)
	setText(findTF(var_39_1, "statistics_panel/rank_bg/score"), arg_39_0.seasonInfo.rank)

	local var_39_2 = findTF(var_39_1, "upgrade_tip/level")
	local var_39_3 = findTF(var_39_1, "upgrade_rank_tip/level")
	local var_39_4 = findTF(var_39_1, "upgrade_score_tip/level")
	local var_39_5 = SeasonInfo.getMilitaryRank(var_39_0, arg_39_0.seasonInfo.rank)

	assert(var_39_5, ">>>" .. var_39_0 .. "--" .. arg_39_0.seasonInfo.rank)

	local var_39_6 = SeasonInfo.getEmblem(var_39_0, arg_39_0.seasonInfo.rank)

	LoadImageSpriteAsync("emblem/" .. var_39_6, findTF(var_39_1, "medal_bg/medal"), true)
	LoadImageSpriteAsync("emblem/n_" .. var_39_6, findTF(var_39_1, "medal_bg/Text"), true)

	local var_39_7 = findTF(var_39_1, "exp_slider"):GetComponent("Slider")
	local var_39_8, var_39_9, var_39_10 = SeasonInfo.getNextMilitaryRank(var_39_0, arg_39_0.seasonInfo.rank)
	local var_39_11 = math.min(var_39_9, var_39_0)

	setText(var_39_2, var_39_8)
	setText(var_39_4, var_39_9)
	setText(var_39_3, var_39_10 > 0 and var_39_10 or "-")

	var_39_7.value = var_39_11 / var_39_9
end

function var_0_0.updateRivals(arg_40_0)
	arg_40_0.rivalTFs = {}

	for iter_40_0 = 1, 4 do
		table.insert(arg_40_0.rivalTFs, arg_40_0.rivalList:GetChild(iter_40_0 - 1))
	end

	for iter_40_1 = 1, 4 do
		local var_40_0 = arg_40_0.rivalTFs[iter_40_1]

		setActive(var_40_0, iter_40_1 <= #arg_40_0.rivalVOs)

		if iter_40_1 <= #arg_40_0.rivalVOs then
			arg_40_0:updateRival(iter_40_1)
		end
	end
end

function var_0_0.updateRival(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0.rivalTFs[arg_41_1]
	local var_41_1 = arg_41_0.rivalVOs[arg_41_1]
	local var_41_2 = SeasonInfo.getMilitaryRank(var_41_1.score, var_41_1.rank)

	assert(var_41_2, ">>>" .. var_41_1.score .. "--" .. var_41_1.rank)

	local var_41_3 = findTF(var_41_0, "shiptpl")
	local var_41_4 = SeasonInfo.getEmblem(var_41_1.score, var_41_1.rank)

	LoadImageSpriteAsync("emblem/" .. var_41_4, findTF(var_41_0, "medal"), true)
	LoadImageSpriteAsync("emblem/n_" .. var_41_4, findTF(var_41_0, "Text"), true)
	updateDrop(var_41_3, {
		type = DROP_TYPE_SHIP,
		id = var_41_1.icon,
		skinId = var_41_1.skinId,
		propose = var_41_1.proposeTime,
		remoulded = var_41_1.remoulded
	}, {
		initStar = true
	})
	setActive(findTF(var_41_3, "icon_bg/lv"), false)
	setText(findTF(var_41_0, "rank_bg/rank_container/name"), var_41_1.rank)
	setText(findTF(var_41_0, "name_container/name"), var_41_1.name)
	setText(findTF(var_41_0, "name_container/lv"), "Lv." .. var_41_1.level)
	setText(findTF(var_41_0, "comprehensive_panel/comprehensive/main_fleet/value"), var_41_1:GetGearScoreSum(TeamType.Main))
	setText(findTF(var_41_0, "comprehensive_panel/comprehensive/vanguard_fleet/value"), var_41_1:GetGearScoreSum(TeamType.Vanguard))
	onButton(arg_41_0, var_41_0, function()
		arg_41_0:emit(MilitaryExerciseMediator.OPEN_RIVAL_INFO, var_41_1)
	end, SFX_PANEL)
end

function var_0_0.initAwards(arg_43_0)
	assert(not arg_43_0.isInitAward, "已经初始化奖励列表")
	setActive(arg_43_0.awardPanel, true)
	onButton(arg_43_0, arg_43_0.awardPanel:Find("top/btnBack"), function()
		arg_43_0:closeAwards()
	end, SFX_CANCEL)

	local var_43_0 = arg_43_0.awardPanel:Find("bg/frame/content/time_panel/Text")

	setText(var_43_0, i18n("exercise_time_tip", "   " .. os.date("%Y.%m.%d", arg_43_0.activity.data1) .. " — " .. os.date("%Y.%m.%d", arg_43_0.activity.stopTime)))

	local var_43_1 = arg_43_0.awardPanel:Find("bg/frame/content/desc_panel/Text")

	setText(var_43_1, i18n("exercise_rule_tip"))

	local var_43_2 = arg_43_0.awardPanel:Find("bg/frame/content/award_panel/award_list")
	local var_43_3 = arg_43_0:getTpl("awardtpl", var_43_2)
	local var_43_4 = arg_43_0:getTpl("awards/equipmenttpl", var_43_3)
	local var_43_5 = var_43_2:Find("linetpl")
	local var_43_6 = arg_43_0.awardPanel:Find("bg/frame/content/award_panel/Text")

	setText(var_43_6, i18n("exercise_award_tip"))

	local function var_43_7(arg_45_0, arg_45_1)
		local var_45_0 = arg_45_0:Find("awards")
		local var_45_1 = arg_43_0.rankCfg[arg_45_1]

		setText(findTF(arg_45_0, "Text"), var_45_1.name .. ":")

		for iter_45_0, iter_45_1 in ipairs(var_45_1.award_list) do
			local var_45_2 = cloneTplTo(var_43_4, var_45_0)

			updateDrop(var_45_2, {
				type = iter_45_1[1],
				id = iter_45_1[2],
				count = iter_45_1[3]
			})
			onButton(arg_43_0, var_45_2:Find("icon_bg"), function()
				arg_43_0:emit(BaseUI.ON_ITEM, iter_45_1[1] == 1 and id2ItemId(iter_45_1[2]) or iter_45_1[2])
			end, SFX_PANEL)
		end

		setText(findTF(arg_45_0, "upgrade_score_tip/level"), var_45_1.point)
		setText(findTF(arg_45_0, "upgrade_rank_tip/level"), var_45_1.order > 0 and var_45_1.order or "-")
	end

	for iter_43_0 = #arg_43_0.rankCfg.all, 1, -1 do
		local var_43_8 = arg_43_0.rankCfg.all[iter_43_0]

		if #arg_43_0.rankCfg[var_43_8].award_list > 0 then
			var_43_7(cloneTplTo(var_43_3, var_43_2), var_43_8)
			cloneTplTo(var_43_5, var_43_2)
		end
	end
end

function var_0_0.closeAwards(arg_47_0)
	if arg_47_0.isOpenAwards then
		setActive(arg_47_0.awardPanel, false)

		arg_47_0.isOpenAwards = false

		pg.UIMgr.GetInstance():UnOverlayPanel(arg_47_0.awardPanel, arg_47_0._tf)
	end
end

function var_0_0.onBackPressed(arg_48_0)
	if arg_48_0.isOpenAwards then
		arg_48_0:closeAwards()
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		arg_48_0:emit(var_0_0.ON_BACK)
	end
end

function var_0_0.willExit(arg_49_0)
	if arg_49_0.tweens then
		cancelTweens(arg_49_0.tweens)
	end

	if arg_49_0.leftTimeTimer then
		arg_49_0.leftTimeTimer:Stop()

		arg_49_0.leftTimeTimer = nil
	end

	if arg_49_0.recoverTimer then
		arg_49_0.recoverTimer:Stop()

		arg_49_0.recoverTimer = nil
	end

	arg_49_0:closeAwards()
end

return var_0_0
