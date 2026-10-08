local var_0_0 = class("LimitChallengeScene", import("..base.BaseUI"))
local var_0_1 = LimitChallengeConst

function var_0_0.getUIName(arg_1_0)
	return "LimitChallengeUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"weaponframes"
	}

	table.insertto(var_2_0, arg_2_0:getLimitChallengeResList())

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.getLimitChallengeResList(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = pg.constellation_challenge_month and var_0_1.GetCurMonthConfig()

	if not var_3_1 then
		return var_3_0
	end

	for iter_3_0, iter_3_1 in ipairs(var_3_1.stage or {}) do
		local var_3_2 = pg.expedition_constellation_challenge_template[iter_3_1]

		if var_3_2 then
			table.insert(var_3_0, "limitchallenge/boss/" .. var_3_2.painting)
			table.insert(var_3_0, "limitchallenge/name/" .. var_3_2.information_icon)
			table.insert(var_3_0, "limitchallenge/btn/" .. var_3_2.button_style .. "_btn_start")

			for iter_3_2 = 1, 3 do
				local var_3_3 = string.format("%d_level_%d_selected", var_3_2.button_style, iter_3_2)

				table.insert(var_3_0, "limitchallenge/btn/" .. var_3_3)
			end

			for iter_3_3, iter_3_4 in ipairs(var_3_2.description or {}) do
				if iter_3_4 then
					local var_3_4 = arg_3_0:getBuffIconPath(iter_3_1, iter_3_3)

					table.insert(var_3_0, var_3_4)
				end
			end

			table.insertto(var_3_0, arg_3_0:getAwardResList(var_3_2.award_display and var_3_2.award_display[1]))
		end
	end

	return var_3_0
end

function var_0_0.getAwardResList(arg_4_0, arg_4_1)
	local var_4_0 = {}

	if not arg_4_1 or #arg_4_1 == 0 then
		return var_4_0
	end

	local var_4_1 = arg_4_1[1]

	if var_4_1 == DROP_TYPE_ICON_FRAME then
		table.insert(var_4_0, "Props/icon_frame")
	elseif var_4_1 == DROP_TYPE_CHAT_FRAME then
		table.insert(var_4_0, "Props/chat_frame")
	end

	return var_4_0
end

function var_0_0.init(arg_5_0)
	arg_5_0:initData()
	arg_5_0:findUI()
	arg_5_0:addListener()
end

function var_0_0.didEnter(arg_6_0)
	var_0_1.SetRedPointMonth()
	arg_6_0:updateLeftTime()
	arg_6_0:updateToggleList()
	arg_6_0:trigeHigestUnlockLevel()
end

function var_0_0.onBackPressed(arg_7_0)
	arg_7_0:closeView()
end

function var_0_0.willExit(arg_8_0)
	if arg_8_0.leftTimer then
		arg_8_0.leftTimer:Stop()

		arg_8_0.leftTimer = nil
	end
end

function var_0_0.initData(arg_9_0)
	arg_9_0.proxy = getProxy(LimitChallengeProxy)
	arg_9_0.levelList = {
		1,
		2,
		3
	}
	arg_9_0.curMonth = var_0_1.GetCurMonth()
	arg_9_0.descList = {}
	arg_9_0.nextMonthTS = LimitChallengeConst.GetNextMonthTS()
	arg_9_0.curLevel = 0
end

function var_0_0.findUI(arg_10_0)
	arg_10_0.blurPanel = arg_10_0._tf:Find("blur_panel")
	arg_10_0.homeBtn = arg_10_0.blurPanel:Find("adapt/top/option")
	arg_10_0.backBtn = arg_10_0.blurPanel:Find("adapt/top/back_button")
	arg_10_0.helpBtn = arg_10_0.blurPanel:Find("adapt/top/HelpBtn")
	arg_10_0.shareBtn = arg_10_0.blurPanel:Find("adapt/top/ShareBtn")
	arg_10_0.levelPanel = arg_10_0._tf:Find("Adapt/LevelPanel")
	arg_10_0.levelToggleList = {}
	arg_10_0.levelToggleLockList = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.levelList) do
		local var_10_0 = "Level_" .. iter_10_1
		local var_10_1 = arg_10_0.levelPanel:Find(var_10_0)
		local var_10_2 = var_10_1:Find("Toggle")
		local var_10_3 = var_10_1:Find("Lock")

		arg_10_0.levelToggleList[iter_10_1] = var_10_2
		arg_10_0.levelToggleLockList[iter_10_1] = var_10_3
	end

	arg_10_0.timePanel = arg_10_0._tf:Find("Adapt/TimePanel")

	local var_10_4 = arg_10_0.timePanel:Find("Left/LeftTime")

	arg_10_0.leftTipText = var_10_4:Find("LeftTip")
	arg_10_0.leftDayTipText = var_10_4:Find("DayTip")
	arg_10_0.leftDayValueText = var_10_4:Find("DayValue")
	arg_10_0.leftTimeValueText = var_10_4:Find("TimeValue")
	arg_10_0.passTimeValueText = arg_10_0.timePanel:Find("Challenge/Value")

	setText(arg_10_0.leftTipText, i18n("time_remaining_tip"))
	setText(arg_10_0.leftDayTipText, i18n("word_date"))

	arg_10_0.iconContainer = arg_10_0._tf:Find("Adapt/DescPanel/ScrollView/Viewport/Container")
	arg_10_0.iconTpl = arg_10_0._tf:Find("Adapt/DescPanel/IconTpl")

	local var_10_5 = arg_10_0._tf:Find("Adapt/Award")

	arg_10_0.awardIconTF = var_10_5:Find("IconTpl")
	arg_10_0.awardGotTF = var_10_5:Find("Got")
	arg_10_0.startBtn = arg_10_0._tf:Find("Adapt/StartBtn")
	arg_10_0.bgImg = arg_10_0._tf:Find("BG")
	arg_10_0.nameImg = arg_10_0.timePanel:Find("Left")
	arg_10_0.debugPanel = arg_10_0._tf:Find("Adapt/Debug")
	arg_10_0.debugText = arg_10_0.debugPanel:Find("Text")
end

function var_0_0.addListener(arg_11_0)
	onButton(arg_11_0, arg_11_0.homeBtn, function()
		arg_11_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	print("-----------", tostring(arg_11_0.backBtn))
	onButton(arg_11_0, arg_11_0.backBtn, function()
		arg_11_0:closeView()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.challenge_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.shareBtn, function()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeChallenge)
	end, SFX_PANEL)

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.levelToggleList) do
		onToggle(arg_11_0, iter_11_1, function()
			arg_11_0.curLevel = iter_11_0

			arg_11_0:updatePassTime()
			arg_11_0:updateAward()
			arg_11_0:updateDescPanel()
			arg_11_0:updateBossImg()
			arg_11_0:updateDebug()
		end, SFX_CONFIRM, SFX_CANCEL)
	end

	onButton(arg_11_0, arg_11_0.startBtn, function()
		local var_17_0 = var_0_1.GetStageIDByLevel(arg_11_0.curLevel)

		arg_11_0:emit(var_0_1.OPEN_PRE_COMBAT_LAYER, {
			stageID = var_17_0
		})
	end, SFX_PANEL)

	arg_11_0.iconUIItemList = UIItemList.New(arg_11_0.iconContainer, arg_11_0.iconTpl)

	arg_11_0.iconUIItemList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = arg_18_2:Find("Icon")

			arg_18_1 = arg_18_1 + 1

			if arg_11_0.descList[arg_18_1] ~= false then
				local var_18_1 = var_0_1.GetChallengeIDByLevel(arg_11_0.curLevel)
				local var_18_2, var_18_3 = arg_11_0:getBuffIconPath(var_18_1, arg_18_1)

				setImageSprite(var_18_0, LoadSprite(var_18_2, var_18_3))

				local var_18_4 = arg_11_0.descList[arg_18_1][1]
				local var_18_5 = arg_11_0.descList[arg_18_1][2]
				local var_18_6 = {}

				table.insert(var_18_6, {
					info = var_18_4
				})
				table.insert(var_18_6, {
					info = var_18_5
				})
				onButton(arg_11_0, var_18_0, function()
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						hideNo = true,
						type = MSGBOX_TYPE_DROP_ITEM,
						name = var_18_4,
						content = var_18_5,
						iconPath = {
							var_18_2,
							var_18_3
						}
					})
				end, SFX_PANEL)
			end
		end
	end)
end

function var_0_0.updateDebug(arg_20_0)
	local var_20_0 = arg_20_0.curMonth
	local var_20_1 = arg_20_0.curLevel
	local var_20_2 = var_0_1.GetChallengeIDByLevel(arg_20_0.curLevel)
	local var_20_3 = var_0_1.GetStageIDByLevel(arg_20_0.curLevel)
	local var_20_4 = string.format(" 月份: %s \n 选择难度: %s \n 选择挑战ID: %s \n 选择关卡ID: %s \n", tostring(var_20_0), tostring(var_20_1), tostring(var_20_2), tostring(var_20_3))

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.levelList) do
		local var_20_5 = LimitChallengeConst.GetChallengeIDByLevel(iter_20_1)
		local var_20_6 = arg_20_0.proxy:isAwardedByChallengeID(var_20_5)
		local var_20_7 = " 难度" .. iter_20_1 .. "奖励:" .. (var_20_6 and "已领取" or "未领取") .. "\n"

		var_20_4 = var_20_4 .. var_20_7
	end

	for iter_20_2, iter_20_3 in ipairs(arg_20_0.levelList) do
		local var_20_8 = LimitChallengeConst.GetChallengeIDByLevel(iter_20_3)
		local var_20_9 = arg_20_0.proxy:getPassTimeByChallengeID(var_20_8)
		local var_20_10 = " 难度" .. iter_20_3 .. "时间:" .. (var_20_9 and var_20_9 or "没有记录") .. "\n"

		var_20_4 = var_20_4 .. var_20_10
	end

	setText(arg_20_0.debugText, var_20_4)
end

function var_0_0.updateToggleList(arg_21_0)
	local var_21_0 = arg_21_0:getHigestUnlockLevel()

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.levelToggleLockList) do
		local var_21_1 = var_21_0 < iter_21_0

		setActive(iter_21_1, var_21_1)

		local var_21_2 = arg_21_0.levelToggleList[iter_21_0]

		setActive(var_21_2, not var_21_1)
	end
end

function var_0_0.updateLeftTime(arg_22_0)
	if arg_22_0.leftTimer then
		arg_22_0.leftTimer:Stop()

		arg_22_0.leftTimer = nil
	end

	local var_22_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_22_1 = arg_22_0.nextMonthTS - var_22_0

	if var_22_1 > 0 then
		if arg_22_0.leftTimer then
			arg_22_0.leftTimer:Stop()

			arg_22_0.leftTimer = nil
		end

		local function var_22_2()
			if var_22_1 <= 0 and arg_22_0.leftTimer then
				arg_22_0.leftTimer:Stop()

				arg_22_0.leftTimer = nil
			end

			local var_23_0, var_23_1, var_23_2, var_23_3 = pg.TimeMgr.GetInstance():parseTimeFrom(var_22_1)

			setText(arg_22_0.leftDayValueText, var_23_0)
			setText(arg_22_0.leftTimeValueText, string.format("%02d:%02d:%02d", var_23_1, var_23_2, var_23_3))

			var_22_1 = var_22_1 - 1
		end

		arg_22_0.leftTimer = Timer.New(var_22_2, 1, -1)

		arg_22_0.leftTimer:Start()
		var_22_2()
	end
end

function var_0_0.updateBossImg(arg_24_0)
	local var_24_0 = var_0_1.GetChallengeIDByLevel(arg_24_0.curLevel)
	local var_24_1 = pg.expedition_constellation_challenge_template[var_24_0]
	local var_24_2 = var_24_1.painting
	local var_24_3 = var_24_1.information_icon
	local var_24_4 = "limitchallenge/boss/" .. var_24_2

	setImageSprite(arg_24_0.bgImg, LoadSprite(var_24_4, var_24_2))

	local var_24_5 = "limitchallenge/name/" .. var_24_3

	setImageSprite(arg_24_0.nameImg, LoadSprite(var_24_5, var_24_3), true)

	local var_24_6 = var_24_1.button_style .. "_btn_start"
	local var_24_7 = "limitchallenge/btn/" .. var_24_6

	setImageSprite(arg_24_0.startBtn, LoadSprite(var_24_7, var_24_6), true)

	local var_24_8 = "%d_level_%d_selected"

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.levelList) do
		local var_24_9 = string.format(var_24_8, var_24_1.button_style, iter_24_1)
		local var_24_10 = "limitchallenge/btn/" .. var_24_9
		local var_24_11 = arg_24_0.levelToggleList[iter_24_1]:Find("Selected")

		setImageSprite(var_24_11, LoadSprite(var_24_10, var_24_9), true)
	end
end

function var_0_0.updateDescPanel(arg_25_0)
	arg_25_0.descList = {}

	local var_25_0 = var_0_1.GetChallengeIDByLevel(arg_25_0.curLevel)

	arg_25_0.descList = pg.expedition_constellation_challenge_template[var_25_0].description

	local var_25_1 = 3 - #arg_25_0.descList

	if var_25_1 > 0 then
		for iter_25_0 = 1, var_25_1 do
			table.insert(arg_25_0.descList, false)
		end
	end

	arg_25_0.iconUIItemList:align(#arg_25_0.descList)
end

function var_0_0.updatePassTime(arg_26_0)
	local var_26_0 = LimitChallengeConst.GetChallengeIDByLevel(arg_26_0.curLevel)
	local var_26_1 = arg_26_0.proxy:getPassTimeByChallengeID(var_26_0) or 0
	local var_26_2 = math.floor(var_26_1 / 60)
	local var_26_3 = math.floor(var_26_1 % 60)
	local var_26_4 = string.format("%02d:%02d", var_26_2, var_26_3)

	setText(arg_26_0.passTimeValueText, var_26_4)
end

function var_0_0.updateAward(arg_27_0)
	local var_27_0 = LimitChallengeConst.GetChallengeIDByLevel(arg_27_0.curLevel)
	local var_27_1 = pg.expedition_constellation_challenge_template[var_27_0].award_display[1]
	local var_27_2 = arg_27_0.proxy:isAwardedByChallengeID(var_27_0)

	setActive(arg_27_0.awardGotTF, var_27_2)

	if var_27_1 and #var_27_1 > 0 then
		local var_27_3 = {
			type = var_27_1[1],
			id = var_27_1[2],
			count = var_27_1[3] or 1
		}

		updateDrop(arg_27_0.awardIconTF, var_27_3)
		onButton(arg_27_0, arg_27_0.awardIconTF, function()
			arg_27_0:emit(BaseUI.ON_DROP, var_27_3)
		end, SFX_PANEL)
		setActive(arg_27_0.awardIconTF, true)
	else
		setActive(arg_27_0.awardIconTF, false)
	end
end

function var_0_0.trigeHigestUnlockLevel(arg_29_0)
	local var_29_0 = arg_29_0:getHigestUnlockLevel()

	triggerToggle(arg_29_0.levelToggleList[var_29_0], true)
end

function var_0_0.onReqInfo(arg_30_0)
	arg_30_0:initData()
	arg_30_0:updateLeftTime()
	arg_30_0:updateToggleList()
	arg_30_0:trigeHigestUnlockLevel()
end

function var_0_0.getHigestUnlockLevel(arg_31_0)
	for iter_31_0 = #arg_31_0.levelList, 1, -1 do
		local var_31_0 = arg_31_0.levelList[iter_31_0]

		if arg_31_0.proxy:isLevelUnlock(var_31_0) then
			return var_31_0
		end
	end
end

function var_0_0.getBuffIconPath(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = pg.expedition_constellation_challenge_template[arg_32_1]
	local var_32_1 = string.format("%s_%d", var_32_0.painting, arg_32_2)

	return "limitchallenge/icon/" .. var_32_1, var_32_1
end

return var_0_0
