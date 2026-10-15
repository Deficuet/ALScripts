local var_0_0 = class("DailyLevelScene", import("..base.BaseUI"))
local var_0_1 = 3
local var_0_2 = 4
local var_0_3 = 101

function var_0_0.getUIName(arg_1_0)
	return "DailyLevelUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"weaponframes",
		"cue/level.b"
	}
	local var_2_1 = {}

	local function var_2_2(arg_3_0)
		if noEmptyStr(arg_3_0) and not var_2_1[arg_3_0] then
			var_2_1[arg_3_0] = true

			table.insert(var_2_0, arg_3_0)
		end
	end

	local var_2_3 = pg.expedition_daily_template

	for iter_2_0, iter_2_1 in ipairs(var_2_3.all or {}) do
		local var_2_4 = var_2_3[iter_2_1]

		if var_2_4 then
			var_2_2("dailyui/" .. var_2_4.pic)

			for iter_2_2, iter_2_3 in ipairs(var_2_4.expedition_and_lv_limit_list or {}) do
				local var_2_5 = pg.expedition_data_template[iter_2_3[1]]

				if var_2_5 then
					for iter_2_4, iter_2_5 in ipairs(var_2_5.award_display or {}) do
						var_2_2(Drop.Create(iter_2_5):getIcon())
					end
				end
			end
		end
	end

	if arg_2_0.bonusActivity and not arg_2_0.bonusActivity:isEnd() then
		for iter_2_6, iter_2_7 in ipairs(arg_2_0.bonusActivity:getConfig("config_data") or {}) do
			local var_2_6 = iter_2_7[2]

			if var_2_6 then
				var_2_2(Drop.Create(var_2_6):getIcon())
			end
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.ResUISettings(arg_4_0)
	return true
end

function var_0_0.init(arg_5_0)
	arg_5_0.blurPanel = arg_5_0._tf:Find("blur_panel")
	arg_5_0.topPanel = arg_5_0._tf:Find("blur_panel/adapt/top")
	arg_5_0.backBtn = arg_5_0.topPanel:Find("back_btn")
	arg_5_0.listPanel = arg_5_0._tf:Find("list_panel")
	arg_5_0.content = arg_5_0.listPanel:Find("list")

	setActive(arg_5_0.content, true)

	arg_5_0.dailylevelTpl = arg_5_0:getTpl("list_panel/list/captertpl")
	arg_5_0.descPanel = arg_5_0._tf:Find("desc_panel")
	arg_5_0.selectedPanel = arg_5_0.descPanel:Find("selected")
	arg_5_0.descMain = arg_5_0.descPanel:Find("main_mask/main")
	arg_5_0.stageTpl = arg_5_0:getTpl("scrollview/content/stagetpl", arg_5_0.descMain)
	arg_5_0.stageScrollRect = arg_5_0.descMain:Find("scrollview"):GetComponent(typeof(ScrollRect))
	arg_5_0.stageContain = arg_5_0.descMain:Find("scrollview/content")
	arg_5_0.arrows = arg_5_0._tf:Find("arrows")
	arg_5_0.itemTpl = arg_5_0:getTpl("item_tpl")
	arg_5_0.selStageTF = arg_5_0.selectedPanel:Find("stagetpl/info")
	arg_5_0.selQuicklyTF = arg_5_0.selStageTF.parent:Find("quickly/bg")
	arg_5_0.selQuicklyTFSizeDeltaY = arg_5_0.selQuicklyTF.sizeDelta.y
	arg_5_0.descChallengeNum = arg_5_0.descMain:Find("challenge_count")
	arg_5_0.descChallengeText = arg_5_0.descChallengeNum:Find("Text")
	arg_5_0.challengeQuotaDaily = arg_5_0.descMain:Find("challenge_count/label")
	arg_5_0.challengeQuotaWeekly = arg_5_0.descMain:Find("challenge_count/week_label")
	arg_5_0.fleetEditView = arg_5_0._tf:Find("fleet_edit")
	arg_5_0.resource = arg_5_0._tf:Find("resource")
	arg_5_0.rightBtn = arg_5_0._tf:Find("arrows/arrow1")
	arg_5_0.leftBtn = arg_5_0._tf:Find("arrows/arrow2")

	arg_5_0:initItems()
end

function var_0_0.getWeek()
	return (pg.TimeMgr.GetInstance():GetServerWeek())
end

function var_0_0.setDailyCounts(arg_7_0, arg_7_1)
	arg_7_0.dailyCounts = arg_7_1
end

function var_0_0.setActivity(arg_8_0, arg_8_1)
	arg_8_0.bonusActivity = arg_8_1
end

function var_0_0.setShips(arg_9_0, arg_9_1)
	arg_9_0.shipVOs = arg_9_1
end

function var_0_0.updateRes(arg_10_0, arg_10_1)
	arg_10_0.player = arg_10_1
end

function var_0_0.didEnter(arg_11_0)
	onButton(arg_11_0, arg_11_0._tf:Find("help_btn"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_daily_task.tip
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.backBtn, function()
		if arg_11_0.descMode then
			if LeanTween.isTweening(go(arg_11_0.stageContain)) or LeanTween.isTweening(go(arg_11_0.selQuicklyTF)) then
				return
			end

			arg_11_0:enableDescMode(false)
		else
			arg_11_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.leftBtn, function()
		arg_11_0:flipToSpecificCard(arg_11_0:getNextCardId(true))
	end)
	onButton(arg_11_0, arg_11_0.rightBtn, function()
		arg_11_0:flipToSpecificCard(arg_11_0:getNextCardId(false))
	end)
	arg_11_0:displayDailyLevels()

	if arg_11_0.contextData.dailyLevelId then
		arg_11_0:tryOpenDesc(arg_11_0.contextData.dailyLevelId)
	else
		arg_11_0:enableDescMode(false)
	end

	arg_11_0:tryPlayGuide()
	arg_11_0:ShowGuildTaskTip()
end

function var_0_0.initItems(arg_16_0)
	local var_16_0 = getProxy(DailyLevelProxy)

	var_16_0:setDailyTip(false)

	arg_16_0.dailyCounts = var_16_0:getRawData()

	local var_16_1 = pg.expedition_daily_template

	arg_16_0.dailyLevelTFs = {}
	arg_16_0.dailyList = _.reverse(Clone(var_16_1.all))

	for iter_16_0 = #arg_16_0.dailyList, 1, -1 do
		local var_16_2 = var_16_1[arg_16_0.dailyList[iter_16_0]].limit_period
		local var_16_3 = var_16_1[arg_16_0.dailyList[iter_16_0]].insert_daily

		if var_16_2 and type(var_16_2) == "table" then
			if not pg.TimeMgr.GetInstance():inTime(var_16_2) then
				table.remove(arg_16_0.dailyList, iter_16_0)
			end
		elseif var_16_3 == 1 then
			table.remove(arg_16_0.dailyList, iter_16_0)
		end
	end

	arg_16_0:sortDailyList()
	arg_16_0:updateShowCenter()

	if arg_16_0.contextData.dailyLevelId then
		local var_16_4 = arg_16_0.contextData.dailyLevelId

		table.removebyvalue(arg_16_0.dailyList, var_16_4)
		table.insert(arg_16_0.dailyList, math.ceil(#var_16_1.all / 2), var_16_4)
	end

	for iter_16_1, iter_16_2 in pairs(arg_16_0.dailyList) do
		arg_16_0.dailyLevelTFs[iter_16_2] = cloneTplTo(arg_16_0.dailylevelTpl, arg_16_0.content, iter_16_2)
	end
end

function var_0_0.sortDailyList(arg_17_0)
	if #arg_17_0.dailyList % 2 ~= 1 then
		table.insert(arg_17_0.dailyList, var_0_3)
	end

	table.sort(arg_17_0.dailyList, function(arg_18_0, arg_18_1)
		return tonumber(pg.expedition_daily_template[arg_18_0].sort) > tonumber(pg.expedition_daily_template[arg_18_1].sort)
	end)
end

function var_0_0.updateShowCenter(arg_19_0)
	if not arg_19_0.dailyList or #arg_19_0.dailyList == 0 then
		return
	end

	local var_19_0 = #arg_19_0.dailyList
	local var_19_1 = pg.expedition_daily_template
	local var_19_2 = math.ceil(var_19_0 / 2)
	local var_19_3

	for iter_19_0 = 1, var_19_0 do
		local var_19_4 = var_19_1[arg_19_0.dailyList[iter_19_0]]

		if var_19_4.show_with_count and var_19_4.show_with_count == 1 then
			local var_19_5 = var_19_4.id
			local var_19_6 = arg_19_0.dailyCounts and arg_19_0.dailyCounts[var_19_5] or 0

			if var_19_4.limit_time - var_19_6 > 0 then
				var_19_3 = var_19_3 or iter_19_0
			end
		end
	end

	if var_19_3 then
		local var_19_7 = var_19_2 - var_19_3 < 0 and true or false
		local var_19_8 = math.abs(var_19_2 - var_19_3)

		for iter_19_1 = 1, var_19_8 do
			local var_19_9

			if var_19_7 then
				local var_19_10 = table.remove(arg_19_0.dailyList, 1)

				table.insert(arg_19_0.dailyList, var_19_10)
			else
				local var_19_11 = table.remove(arg_19_0.dailyList, #arg_19_0.dailyList)

				table.insert(arg_19_0.dailyList, 1, var_19_11)
			end
		end
	end
end

function var_0_0.displayDailyLevels(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.dailyLevelTFs) do
		arg_20_0:initDailyLevel(iter_20_0)
	end

	arg_20_0.content:GetComponent(typeof(EnhancelScrollView)).onCenterClick = function(arg_21_0)
		arg_20_0:tryOpenDesc(tonumber(arg_21_0.name))
	end
	arg_20_0.centerAniItem = nil
	arg_20_0.centerCardId = nil
	arg_20_0.checkAniTimer = Timer.New(function()
		if not arg_20_0.descMode then
			local var_22_0
			local var_22_1

			for iter_22_0, iter_22_1 in pairs(arg_20_0.dailyLevelTFs) do
				GetComponent(iter_22_1, typeof(CanvasGroup)).alpha = 1

				if not var_22_0 and not var_22_1 then
					var_22_0 = iter_22_1
					var_22_1 = iter_22_1
				elseif iter_22_1.anchoredPosition.x < var_22_0.anchoredPosition.x then
					var_22_0 = iter_22_1
				elseif iter_22_1.anchoredPosition.x > var_22_1.anchoredPosition.x then
					var_22_1 = iter_22_1
				end
			end

			GetComponent(var_22_0, typeof(CanvasGroup)).alpha = 0.5
			GetComponent(var_22_1, typeof(CanvasGroup)).alpha = 0.5
		end

		for iter_22_2, iter_22_3 in pairs(arg_20_0.dailyLevelTFs) do
			local var_22_2 = iter_22_3.localScale.x >= 0.98

			if arg_20_0.centerAniItem == iter_22_3 and var_22_2 then
				return
			else
				if var_22_2 then
					arg_20_0.centerAniItem = iter_22_3
					arg_20_0.centerCardId = iter_22_2
				end

				local var_22_3 = iter_22_3:Find("icon/card")

				if var_22_3 then
					local var_22_4 = var_22_3:Find("mask/char"):GetComponent(typeof(Animator))
					local var_22_5 = var_22_3:Find("effect")

					setActive(var_22_5, var_22_2)

					if var_22_4 then
						var_22_4.speed = var_22_2 and 1 or 0
					end
				end
			end
		end
	end, 0.1, -1)

	arg_20_0.checkAniTimer:Start()
end

function var_0_0.tryOpenDesc(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.dailyLevelTFs[arg_23_1]
	local var_23_1 = pg.expedition_daily_template[arg_23_1]

	if table.contains(var_23_1.weekday, tonumber(arg_23_0:getWeek())) then
		arg_23_0:openDailyDesc(arg_23_1)
	else
		pg.TipsMgr.GetInstance():ShowTips(var_23_1.tips)
	end
end

function var_0_0.CanOpenDailyLevel(arg_24_0)
	local var_24_0 = pg.expedition_daily_template[arg_24_0]
	local var_24_1 = false

	if table.contains(var_24_0.weekday, tonumber(var_0_0.getWeek())) then
		var_24_1 = true
	end

	return var_24_1, var_24_0.tips
end

function var_0_0.getNextCardId(arg_25_0, arg_25_1)
	local var_25_0 = table.indexof(arg_25_0.dailyList, arg_25_0.centerCardId)

	if arg_25_1 then
		var_25_0 = var_25_0 - 1

		if var_25_0 <= 0 then
			var_25_0 = #arg_25_0.dailyList or var_25_0
		end
	else
		var_25_0 = var_25_0 + 1
		var_25_0 = var_25_0 > #arg_25_0.dailyList and 1 or var_25_0
	end

	return arg_25_0.dailyList[var_25_0]
end

function var_0_0.initDailyLevel(arg_26_0, arg_26_1)
	local var_26_0 = pg.expedition_daily_template[arg_26_1]
	local var_26_1 = arg_26_0.dailyLevelTFs[arg_26_1]
	local var_26_2 = table.contains(var_26_0.weekday, tonumber(arg_26_0:getWeek()))

	if var_26_2 then
		arg_26_0.index = arg_26_1
	end

	setActive(findTF(var_26_1, "lock"), not var_26_2 and not table.isEmpty(var_26_0.weekday))
	setText(findTF(var_26_1, "name"), var_26_0.title)
	setActive(findTF(var_26_1, "time"), false)

	if arg_26_0.bonusActivity and not arg_26_0.bonusActivity:isEnd() then
		local var_26_3 = checkExist(underscore.detect(arg_26_0.bonusActivity:getConfig("config_data"), function(arg_27_0)
			return arg_27_0[1] == arg_26_1
		end), {
			2
		})

		setText(var_26_1:Find("bonus/Text"), i18n("dailyLevel_bonus_activity"))
		setActive(var_26_1:Find("bonus"), tobool(var_26_3))

		if var_26_3 then
			updateDrop(var_26_1:Find("bonus/IconTpl"), Drop.Create(var_26_3))
		end
	else
		setActive(var_26_1:Find("bonus"), false)
	end

	local var_26_4 = findTF(var_26_1, "icon")

	PoolMgr.GetInstance():GetPrefab("dailyui/" .. var_26_0.pic, "", true, function(arg_28_0)
		arg_28_0 = tf(arg_28_0)

		arg_28_0:SetParent(var_26_4, false)

		arg_28_0.localPosition = Vector3.zero
		arg_28_0.name = "card"
	end)
	setText(findTF(var_26_1, "Text"), "")
	setActive(findTF(var_26_1, "lastTime"), false)

	local var_26_5 = Clone(var_26_0.limit_period)
	local var_26_6

	if var_26_5 and type(var_26_5) == "table" and pg.TimeMgr.GetInstance():inTime(var_26_5) then
		local var_26_7 = pg.TimeMgr.GetInstance():GetServerTime()

		var_26_6 = pg.TimeMgr.GetInstance():Table2ServerTime({
			year = var_26_5[2][1][1],
			month = var_26_5[2][1][2],
			day = var_26_5[2][1][3],
			hour = var_26_5[2][2][1],
			min = var_26_5[2][2][2],
			sec = var_26_5[2][2][3]
		}) - var_26_7
	end

	if var_26_6 then
		local var_26_8 = ""
		local var_26_9 = ""

		if var_26_6 > 86400 then
			var_26_8 = math.floor(tonumber(var_26_6) / 86400)
			var_26_9 = i18n("word_date")
		elseif var_26_6 >= 3600 then
			var_26_8 = math.floor(tonumber(var_26_6) / 3600)
			var_26_9 = i18n("word_hour")
		elseif var_26_6 > 0 then
			var_26_8 = math.floor(tonumber(var_26_6) / 60)
			var_26_9 = i18n("word_minute")
		end

		setText(findTF(var_26_1, "lastTime/content/text"), tostring(var_26_8) .. " ")
		setText(findTF(var_26_1, "lastTime/content/word"), tostring(var_26_9))
		setActive(findTF(var_26_1, "lastTime"), true)
	end

	arg_26_0:UpdateDailyLevelCnt(arg_26_1)
end

function var_0_0.UpdateDailyLevelCnt(arg_29_0, arg_29_1)
	local var_29_0 = pg.expedition_daily_template[arg_29_1]
	local var_29_1 = arg_29_0.dailyLevelTFs[arg_29_1]
	local var_29_2 = findTF(var_29_1, "count")
	local var_29_3 = arg_29_0.dailyCounts[arg_29_1] or 0

	if var_29_0.limit_time == 0 then
		setText(var_29_2, "N/A")
	else
		setText(var_29_2, string.format("%d/%d", var_29_0.limit_time - var_29_3, var_29_0.limit_time))
	end

	setActive(var_29_2, var_29_0.limit_time > 0)
end

function var_0_0.openDailyDesc(arg_30_0, arg_30_1)
	arg_30_0.curId = arg_30_1

	arg_30_0:enableDescMode(true)
	arg_30_0:displayStageList(arg_30_1)
end

function var_0_0.UpdateDailyLevelCntForDescPanel(arg_31_0, arg_31_1)
	local var_31_0 = pg.expedition_daily_template[arg_31_1]
	local var_31_1 = arg_31_0.dailyCounts[arg_31_1] or 0

	if var_31_0.limit_time == 0 then
		setText(arg_31_0.descChallengeText, i18n("challenge_count_unlimit"))
	else
		setText(arg_31_0.descChallengeText, string.format("%d/%d", var_31_0.limit_time - var_31_1, var_31_0.limit_time))
	end
end

function var_0_0.displayStageList(arg_32_0, arg_32_1)
	arg_32_0.dailyLevelId = arg_32_1
	arg_32_0.contextData.dailyLevelId = arg_32_0.dailyLevelId

	local var_32_0 = pg.expedition_daily_template[arg_32_1]

	arg_32_0:UpdateDailyLevelCntForDescPanel(arg_32_1)
	setActive(arg_32_0.challengeQuotaDaily, var_32_0.limit_type == 1)
	setActive(arg_32_0.challengeQuotaWeekly, var_32_0.limit_type == 2)
	removeAllChildren(arg_32_0.stageContain)

	arg_32_0.stageTFs = {}

	local var_32_1 = _.sort(var_32_0.expedition_and_lv_limit_list, function(arg_33_0, arg_33_1)
		local var_33_0 = arg_33_0[2] <= arg_32_0.player.level and 1 or 0
		local var_33_1 = arg_33_1[2] <= arg_32_0.player.level and 1 or 0

		if arg_33_0[2] == arg_33_1[2] then
			return arg_33_0[1] < arg_33_1[1]
		end

		if var_33_0 == var_33_1 then
			if var_33_0 == 1 then
				return arg_33_0[2] > arg_33_1[2]
			else
				return arg_33_0[2] < arg_33_1[2]
			end
		else
			return var_33_1 < var_33_0
		end
	end)

	for iter_32_0, iter_32_1 in ipairs(var_32_1) do
		local var_32_2 = iter_32_1[1]
		local var_32_3 = iter_32_1[2]

		arg_32_0.stageTFs[var_32_2] = cloneTplTo(arg_32_0.stageTpl, arg_32_0.stageContain)

		local var_32_4 = {
			id = var_32_2,
			level = var_32_3
		}

		arg_32_0:updateStage(var_32_4)
	end
end

function var_0_0.updateStageTF(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = pg.expedition_data_template[arg_34_2.id]

	setText(findTF(arg_34_1, "left_panel/name"), var_34_0.name)
	setText(findTF(arg_34_1, "left_panel/lv/Text"), "Lv." .. arg_34_2.level)

	local var_34_1 = arg_34_1:Find("mask")

	setActive(var_34_1, arg_34_2.level > arg_34_0.player.level)

	if arg_34_2.level > arg_34_0.player.level then
		setText(var_34_1:Find("msg/msg_contain/Text"), "Lv." .. arg_34_2.level .. " ")

		if PLATFORM_CODE == PLATFORM_US then
			var_34_1:Find("msg/msg_contain/Text"):SetAsLastSibling()
		end
	end

	local var_34_2 = UIItemList.New(arg_34_1:Find("scrollView/right_panel"), arg_34_0.itemTpl)

	var_34_2:make(function(arg_35_0, arg_35_1, arg_35_2)
		if arg_35_0 == UIItemList.EventUpdate then
			local var_35_0 = var_34_0.award_display[arg_35_1 + 1]

			updateDrop(arg_35_2, {
				type = var_35_0[1],
				id = var_35_0[2],
				count = var_35_0[3]
			})
			setActive(arg_35_2, arg_35_1 <= 3)
		end
	end)
	var_34_2:align(#var_34_0.award_display)
	setImageSprite(arg_34_1, getImageSprite(findTF(arg_34_0.resource, "normal_bg")))
	setActive(findTF(arg_34_1, "score"), false)
	onButton(arg_34_0, var_34_1, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("dailyLevel_unopened"))
	end, SFX_PANEL)
end

function var_0_0.updateStage(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.stageTFs[arg_37_1.id]:Find("info")

	arg_37_0:updateStageTF(var_37_0, arg_37_1)
	onButton(arg_37_0, var_37_0, function()
		if getProxy(DailyLevelProxy):CanQuickBattle(arg_37_1.id) then
			local var_38_0 = pg.expedition_daily_template[arg_37_0.dailyLevelId]

			if (arg_37_0.dailyCounts[arg_37_0.dailyLevelId] or 0) >= var_38_0.limit_time then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dailyLevel_restCount_notEnough"))

				return
			end

			if LeanTween.isTweening(go(arg_37_0.descMain)) or LeanTween.isTweening(go(arg_37_0.listPanel)) then
				return
			end

			arg_37_0:OnSelectStage(arg_37_1)
		else
			arg_37_0:OnOpenPreCombat(arg_37_1)
		end
	end, SFX_PANEL)
end

function var_0_0.OnOpenPreCombat(arg_39_0, arg_39_1)
	local var_39_0 = pg.expedition_daily_template[arg_39_0.dailyLevelId]

	if (arg_39_0.dailyCounts[arg_39_0.dailyLevelId] or 0) >= var_39_0.limit_time then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dailyLevel_restCount_notEnough"))

		return
	end

	setActive(arg_39_0.blurPanel, false)
	arg_39_0:emit(DailyLevelMediator.ON_STAGE, arg_39_1)
end

function var_0_0.OnSelectStage(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0.selectedPanel:Find("stagetpl/info")

	onButton(arg_40_0, var_40_0, function()
		arg_40_0:EnableOrDisable(arg_40_1, false)
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.selectedPanel, function()
		arg_40_0:EnableOrDisable(arg_40_1, false)
	end, SFX_PANEL)
	arg_40_0:EnableOrDisable(arg_40_1, true)
end

function var_0_0.EnableOrDisable(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0.stageTFs[arg_43_1.id]:Find("quickly")

	if LeanTween.isTweening(go(arg_43_0.stageContain)) or LeanTween.isTweening(go(arg_43_0.selQuicklyTF)) then
		return
	end

	local var_43_1 = arg_43_0.stageContain:GetComponent(typeof(VerticalLayoutGroup)).padding.top
	local var_43_2 = arg_43_0.stageContain.parent:InverseTransformPoint(var_43_0.parent.position)
	local var_43_3 = -1 * var_43_1 - var_43_2.y

	if arg_43_2 then
		arg_43_0:updateStageTF(arg_43_0.selStageTF, arg_43_1)
		arg_43_0:UpdateBattleBtn(arg_43_1)
		arg_43_0:DoSelectedAnimation(var_43_0, var_43_3, function()
			arg_43_0.selectedStage = arg_43_1
		end)
	else
		arg_43_0:DoUnselectAnimtion(var_43_0, function()
			arg_43_0.selectedStage = nil
		end)
	end
end

function var_0_0.DoSelectedAnimation(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = math.abs(arg_46_2) / 2000

	seriesAsync({
		function(arg_47_0)
			arg_46_0.stageScrollRect.enabled = false

			pg.UIMgr.GetInstance():BlurPanel(arg_46_0.selectedPanel)

			arg_46_1.sizeDelta = Vector2(arg_46_1.sizeDelta.x, 0)

			setActive(arg_46_1, true)

			local var_47_0 = arg_46_0.stageContain.anchoredPosition

			arg_46_0.stageContainLposY = var_47_0.y
			arg_46_0.offsetY = arg_46_2

			LeanTween.value(go(arg_46_0.stageContain), var_47_0.y, var_47_0.y + arg_46_2, var_46_0):setOnUpdate(System.Action_float(function(arg_48_0)
				arg_46_0.stageContain.anchoredPosition = Vector3(var_47_0.x, arg_48_0, 0)

				local var_48_0 = arg_46_0.selectedPanel:InverseTransformPoint(arg_46_1.parent.position)

				arg_46_0.selStageTF.parent.localPosition = Vector3(var_48_0.x, var_48_0.y, 0)
				arg_46_0.selQuicklyTF.sizeDelta = Vector2(arg_46_0.selQuicklyTF.sizeDelta.x, 0)

				setActive(arg_46_0.selectedPanel, true)
			end)):setEase(LeanTweenType.easeInOutCirc):setOnComplete(System.Action(arg_47_0))
		end,
		function(arg_49_0)
			local var_49_0 = arg_46_1:GetComponent(typeof(LayoutElement))

			LeanTween.value(go(arg_46_0.selQuicklyTF), 0, arg_46_0.selQuicklyTFSizeDeltaY, 0.1):setOnUpdate(System.Action_float(function(arg_50_0)
				var_49_0.preferredHeight = arg_50_0
				arg_46_0.selQuicklyTF.sizeDelta = Vector2(arg_46_0.selQuicklyTF.sizeDelta.x, arg_50_0)
			end)):setEase(LeanTweenType.easeInOutCirc):setOnComplete(System.Action(arg_49_0))
		end
	}, arg_46_3)
end

function var_0_0.DoUnselectAnimtion(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_0.stageContain.anchoredPosition

	seriesAsync({
		function(arg_52_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_51_0.selectedPanel, arg_51_0._tf)
			setActive(arg_51_0.selectedPanel, false)

			local var_52_0 = arg_51_1:GetComponent(typeof(LayoutElement))

			LeanTween.value(go(arg_51_0.selQuicklyTF), arg_51_0.selQuicklyTFSizeDeltaY, 0, 0.1):setOnUpdate(System.Action_float(function(arg_53_0)
				var_52_0.preferredHeight = arg_53_0
				arg_51_0.selQuicklyTF.sizeDelta = Vector2(arg_51_0.selQuicklyTF.sizeDelta.x, arg_53_0)
			end)):setEase(LeanTweenType.easeInOutCirc):setOnComplete(System.Action(arg_52_0))
		end,
		function(arg_54_0)
			local var_54_0 = var_51_0.y - arg_51_0.offsetY
			local var_54_1 = var_54_0 / 2000

			LeanTween.value(go(arg_51_0.stageContain), var_51_0.y, var_54_0, 0.15):setOnUpdate(System.Action_float(function(arg_55_0)
				arg_51_0.stageContain.anchoredPosition = Vector3(var_51_0.x, arg_55_0, 0)
			end)):setDelay(0.1):setEase(LeanTweenType.easeInOutCirc):setOnComplete(System.Action(arg_54_0))
		end
	}, function()
		arg_51_0.stageScrollRect.enabled = true

		arg_51_2()
	end)
end

function var_0_0.UpdateBattleBtn(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0.selectedPanel:Find("stagetpl/info").parent:Find("quickly/bg")
	local var_57_1 = pg.expedition_daily_template[arg_57_0.dailyLevelId].limit_time - (arg_57_0.dailyCounts[arg_57_0.dailyLevelId] or 0)
	local var_57_2 = var_57_0:Find("challenge")

	onButton(arg_57_0, var_57_2, function()
		arg_57_0:OnOpenPreCombat(arg_57_1)
	end, SFX_PANEL)
	setText(var_57_2:Find("Text"), i18n("daily_level_quick_battle_label2"))

	local var_57_3 = var_57_0:Find("mult")

	onButton(arg_57_0, var_57_3, function()
		arg_57_0:OnQuickBattle(arg_57_1, var_57_1)
	end, SFX_PANEL)

	local var_57_4 = var_57_0:Find("once")

	onButton(arg_57_0, var_57_4, function()
		arg_57_0:OnQuickBattle(arg_57_1, 1)
	end, SFX_PANEL)
	setText(var_57_3:Find("label"), i18n("daily_level_quick_battle_label1", "   ", COLOR_WHITE))
	setText(var_57_3:Find("Text"), "<color=" .. COLOR_GREEN .. ">" .. math.max(1, var_57_1) .. "</color>")
	setText(var_57_4:Find("label"), i18n("daily_level_quick_battle_label3"))
	setText(var_57_4:Find("Text"), "")

	if var_57_1 == 0 then
		arg_57_0:EnableOrDisable(arg_57_1, false)
	end
end

function var_0_0.OnQuickBattle(arg_61_0, arg_61_1, arg_61_2)
	if arg_61_2 <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dailyLevel_restCount_notEnough"))

		return
	end

	if PlayerPrefs.GetInt("daily_level_quick_battle_tip", 0) == 0 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("dailyLevel_quickfinish"),
			onYes = function()
				arg_61_0:emit(DailyLevelMediator.ON_QUICK_BATTLE, arg_61_0.dailyLevelId, arg_61_1.id, arg_61_2)
			end
		})
		PlayerPrefs.SetInt("daily_level_quick_battle_tip", 1)
		PlayerPrefs.Save()
	else
		arg_61_0:emit(DailyLevelMediator.ON_QUICK_BATTLE, arg_61_0.dailyLevelId, arg_61_1.id, arg_61_2)
	end
end

function var_0_0.enableDescMode(arg_63_0, arg_63_1, arg_63_2)
	arg_63_0.descMode = arg_63_1

	setActive(arg_63_0._tf:Find("help_btn"), not arg_63_1)

	local function var_63_0(arg_64_0, arg_64_1, arg_64_2)
		if LeanTween.isTweening(go(arg_64_0)) then
			LeanTween.cancel(go(arg_64_0))
		end

		LeanTween.moveX(rtf(arg_64_0), arg_64_1, 0.3):setEase(LeanTweenType.linear):setOnComplete(System.Action(function()
			if arg_64_2 then
				arg_64_2()
			end
		end))
	end

	local function var_63_1()
		for iter_66_0, iter_66_1 in pairs(arg_63_0.dailyLevelTFs) do
			setButtonEnabled(iter_66_1, not arg_63_1)

			if iter_66_0 ~= arg_63_0.curId then
				if LeanTween.isTweening(go(iter_66_1)) then
					LeanTween.cancel(go(iter_66_1))
				end

				local var_66_0 = GetComponent(iter_66_1, typeof(CanvasGroup))

				if arg_63_1 then
					LeanTween.value(go(iter_66_1), 1, 0, 0.3):setOnUpdate(System.Action_float(function(arg_67_0)
						var_66_0.alpha = arg_67_0
					end))
				else
					LeanTween.value(go(iter_66_1), 0, 1, 0.3):setOnUpdate(System.Action_float(function(arg_68_0)
						var_66_0.alpha = arg_68_0
					end))
				end
			end
		end
	end

	local function var_63_2()
		setActive(arg_63_0.listPanel, true)
		setActive(arg_63_0.content, true)
		setActive(arg_63_0.descPanel, arg_63_1)
		setActive(arg_63_0.arrows, not arg_63_1)
	end

	if arg_63_1 then
		var_63_2()
		var_63_1()
		var_63_0(arg_63_0.listPanel, -622, function()
			var_63_0(arg_63_0.descMain, 0, arg_63_2)
		end)
	else
		if arg_63_0.selectedStage then
			arg_63_0:EnableOrDisable(arg_63_0.selectedStage, false)
		end

		var_63_2()
		var_63_1()
		var_63_0(arg_63_0.listPanel, 0)
		var_63_0(arg_63_0.descMain, -1342, arg_63_2)
	end
end

function var_0_0.flipToSpecificCard(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0.content:GetComponent(typeof(EnhancelScrollView))

	for iter_71_0, iter_71_1 in pairs(arg_71_0.dailyLevelTFs) do
		if arg_71_1 == iter_71_0 then
			local var_71_1 = iter_71_1:GetComponent(typeof(EnhanceItem))

			var_71_0:SetHorizontalTargetItemIndex(var_71_1.scrollViewItemIndex)
		end
	end
end

function var_0_0.tryPlayGuide(arg_72_0)
	pg.SystemGuideMgr.GetInstance():PlayDailyLevel(function()
		triggerButton(arg_72_0._tf:Find("help_btn"))
	end)
end

function var_0_0.ShowGuildTaskTip(arg_74_0)
	pg.GuildMsgBoxMgr.GetInstance():NotificationForDailyBattle()
end

function var_0_0.clearTween(arg_75_0)
	if arg_75_0.tweens then
		cancelTweens(arg_75_0.tweens)
	end

	local function var_75_0(arg_76_0)
		if LeanTween.isTweening(go(arg_76_0)) then
			LeanTween.cancel(go(arg_76_0))
		end
	end

	for iter_75_0, iter_75_1 in pairs(arg_75_0.dailyLevelTFs) do
		var_75_0(iter_75_1)
	end

	var_75_0(arg_75_0.listPanel)
	var_75_0(arg_75_0.descMain)
end

function var_0_0.onBackPressed(arg_77_0)
	if arg_77_0.descMode then
		if LeanTween.isTweening(go(arg_77_0.stageContain)) or LeanTween.isTweening(go(arg_77_0.selQuicklyTF)) then
			return
		end

		arg_77_0:enableDescMode(false)

		return
	end

	var_0_0.super.onBackPressed(arg_77_0)
end

function var_0_0.willExit(arg_78_0)
	if arg_78_0.selectedStage then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_78_0.selectedPanel, arg_78_0._tf)
	end

	arg_78_0:clearTween()

	if arg_78_0.checkAniTimer then
		arg_78_0.checkAniTimer:Stop()

		arg_78_0.checkAniTimer = nil
	end
end

return var_0_0
