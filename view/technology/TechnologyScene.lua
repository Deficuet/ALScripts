local var_0_0 = class("TechnologyScene", import("..base.BaseUI"))

var_0_0.PageBase = 1
var_0_0.PageQueue = 2
var_0_0.rarityColor = {
	["1"] = {
		"#4B7BC6FF",
		{
			0.06274509803921569,
			0.29411764705882354,
			0.8745098039215686,
			0.6705882352941176
		}
	},
	["2"] = {
		"#776AB0FF",
		{
			0.29411764705882354,
			0.23529411764705882,
			0.5764705882352941,
			0.6705882352941176
		}
	},
	["3"] = {
		"#B76642FF",
		{
			0.7490196078431373,
			0.28627450980392155,
			0.06274509803921569,
			0.6705882352941176
		}
	},
	["4"] = {
		"#368B78FF",
		{
			0.12941176470588237,
			0.4980392156862745,
			0.5019607843137255,
			0.6705882352941176
		}
	}
}

function var_0_0.getUIName(arg_1_0)
	return "TechnologyUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/technologyui",
		"technologycard",
		"ui/TechnologyUI_atlas",
		"ui/iconcolorful",
		"ui/technologysettingsui_atlas",
		"ui/TechnologySettingsUI"
	}

	local function var_2_1()
		local var_3_0 = {}
		local var_3_1 = pg.activity_event_blueprint_catchup.all

		for iter_3_0, iter_3_1 in ipairs(var_3_1) do
			local var_3_2 = pg.activity_event_blueprint_catchup[iter_3_1].char_choice

			table.insert(var_3_0, "TecCatchup/QChar" .. var_3_2)
		end

		return var_3_0
	end

	local function var_2_2()
		local var_4_0 = getProxy(TechnologyProxy)
		local var_4_1 = var_4_0:getTechnologys()
		local var_4_2 = var_4_0:getPlanningTechnologys()
		local var_4_3 = {}

		local function var_4_4(arg_5_0)
			for iter_5_0, iter_5_1 in ipairs(arg_5_0:getConfig("drop_client")) do
				if iter_5_1 ~= nil then
					local var_5_0 = Drop.Create(iter_5_1):getIcon()

					table.insert(var_4_3, var_5_0)
				end
			end

			for iter_5_2, iter_5_3 in ipairs(arg_5_0:getConfig("consume")) do
				if iter_5_3 ~= nil then
					local var_5_1 = Drop.Create(iter_5_3):getIcon()

					table.insert(var_4_3, var_5_1)
				end
			end
		end

		for iter_4_0, iter_4_1 in ipairs(var_4_1) do
			local var_4_5 = "technologyshipicon/" .. iter_4_1:getConfig("bg_icon")

			var_4_4(iter_4_1)
			table.insert(var_4_3, var_4_5)
		end

		for iter_4_2, iter_4_3 in ipairs(var_4_2) do
			local var_4_6 = "technologyshipicon/" .. iter_4_3:getConfig("bg_icon")

			var_4_4(iter_4_3)
			table.insert(var_4_3, var_4_6)
		end

		return var_4_3
	end

	local var_2_3 = var_2_1()
	local var_2_4 = var_2_2()

	return ResPathSupport.MergeLuaArr(var_2_0, var_2_3, var_2_4, technologySetting)
end

function var_0_0.onBackPressed(arg_6_0)
	if arg_6_0.contextData.selectedIndex then
		arg_6_0:cancelSelected()

		return
	end

	if arg_6_0.contextData.page == var_0_0.PageQueue then
		arg_6_0:setPage(var_0_0.PageBase)

		return
	end

	var_0_0.super.onBackPressed(arg_6_0)
end

function var_0_0.ResUISettings(arg_7_0)
	return true
end

function var_0_0.setTechnologys(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.technologyVOs = arg_8_1
	arg_8_0.technologyQueue = arg_8_2
end

function var_0_0.setRefreshFlag(arg_9_0, arg_9_1)
	arg_9_0.flag = arg_9_1
end

function var_0_0.setPlayer(arg_10_0, arg_10_1)
	arg_10_0.player = arg_10_1
end

function var_0_0.init(arg_11_0)
	arg_11_0.backBtn = arg_11_0._tf:Find("blur_panel/adapt/top/back")
	arg_11_0.basePage = arg_11_0._tf:Find("main/base_page")
	arg_11_0.srcollView = arg_11_0.basePage:Find("srcoll_rect/content")
	arg_11_0.srcollViewCG = arg_11_0.srcollView:GetComponent(typeof(CanvasGroup))
	arg_11_0.helpBtn = arg_11_0.basePage:Find("help_btn")
	arg_11_0.refreshBtn = arg_11_0.basePage:Find("refresh_btn")

	setText(arg_11_0.refreshBtn:Find("Text"), i18n("technology_daily_refresh"))

	arg_11_0.settingsBtn = arg_11_0.basePage:Find("settings_btn")
	arg_11_0.selectetPanel = arg_11_0.basePage:Find("selecte_panel")

	setActive(arg_11_0.selectetPanel, false)
	setText(arg_11_0.selectetPanel:Find("consume_panel/bg/label/Text"), i18n("technology_consume"))
	setText(arg_11_0.selectetPanel:Find("consume_panel/bg/task_panel/label/Text"), i18n("technology_request"))

	arg_11_0.arrLeftBtn = arg_11_0.selectetPanel:Find("left_arr_btn")
	arg_11_0.arrRightBtn = arg_11_0.selectetPanel:Find("right_arr_btn")
	arg_11_0.technologyTpl = arg_11_0.selectetPanel:Find("technology_card")
	arg_11_0.descTxt = arg_11_0.selectetPanel:Find("desc/bg/Text"):GetComponent(typeof(Text))
	arg_11_0.timerTxt = arg_11_0.selectetPanel:Find("timer/bg/Text"):GetComponent(typeof(Text))
	arg_11_0.itemContainer = arg_11_0.selectetPanel:Find("consume_panel/bg/container")
	arg_11_0.itemTpl = arg_11_0.itemContainer:Find("item_tpl")
	arg_11_0.emptyTF = arg_11_0.selectetPanel:Find("consume_panel/bg/empty")
	arg_11_0.taskPanel = arg_11_0.selectetPanel:Find("consume_panel/bg/task_panel")
	arg_11_0.taskSlider = arg_11_0.taskPanel:Find("slider"):GetComponent(typeof(Slider))
	arg_11_0.taskDesc = arg_11_0.taskPanel:Find("slider/Text"):GetComponent(typeof(Text))
	arg_11_0.descBG = arg_11_0.selectetPanel:Find("desc/bg"):GetComponent(typeof(Image))
	arg_11_0.queuePage = arg_11_0._tf:Find("main/queue_page")
	arg_11_0.queueView = arg_11_0.queuePage:Find("queue_rect/content")

	local var_11_0 = arg_11_0._tf:Find("blur_panel/adapt/right")

	arg_11_0.btnAwardQueue = var_11_0:Find("btn_award")

	setText(arg_11_0.btnAwardQueue:Find("Text"), i18n("technology_queue_getaward"))

	arg_11_0.btnAwardQueueDisable = var_11_0:Find("btn_award_disable")

	setText(arg_11_0.btnAwardQueueDisable:Find("Text"), i18n("technology_queue_getaward"))

	arg_11_0.btnQueue = arg_11_0._tf:Find("blur_panel/adapt/left/btn_queue")
	arg_11_0.cardtimer = {}
	arg_11_0.queueTimer = {}
	arg_11_0.queueCardTimer = {}
end

function var_0_0.updateSettingsBtn(arg_12_0)
	local var_12_0 = arg_12_0.settingsBtn:Find("RedPoint")
	local var_12_1 = arg_12_0.settingsBtn:Find("TipText")

	setText(var_12_1, i18n("tec_settings_btn_word"))

	local var_12_2 = arg_12_0.settingsBtn:Find("TargetCatchup")
	local var_12_3 = var_12_2:Find("Selected")
	local var_12_4 = arg_12_0.settingsBtn:Find("ActCatchup")

	arg_12_0:updateSettingBtnVersion()

	local var_12_5 = false
	local var_12_6 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLUEPRINT_CATCHUP)

	if var_12_6 and not var_12_6:isEnd() then
		local var_12_7 = var_12_6.data1
		local var_12_8 = var_12_6:getConfig("config_id")
		local var_12_9 = pg.activity_event_blueprint_catchup[var_12_8].char_choice
		local var_12_10 = pg.activity_event_blueprint_catchup[var_12_8].obtain_max

		if var_12_7 < var_12_10 then
			local var_12_11 = var_12_4:Find("Selected/CharImg")

			setImageSprite(var_12_11, LoadSprite("TecCatchup/QChar" .. var_12_9, tostring(var_12_9)))

			local var_12_12 = var_12_4:Find("Selected/ProgressText")

			setText(var_12_12, var_12_7 .. "/" .. var_12_10)

			local var_12_13 = var_12_6.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

			if arg_12_0.actCatchupTimer then
				arg_12_0.actCatchupTimer:Stop()

				arg_12_0.actCatchupTimer = nil
			end

			local var_12_14 = var_12_4:Find("TimeLeft/Day")
			local var_12_15 = var_12_4:Find("TimeLeft/Hour")
			local var_12_16 = var_12_4:Find("TimeLeft/Min")
			local var_12_17 = var_12_4:Find("TimeLeft/NumText")

			local function var_12_18()
				local var_13_0, var_13_1, var_13_2, var_13_3 = pg.TimeMgr.GetInstance():parseTimeFrom(var_12_13)

				var_12_13 = var_12_13 - 1

				if var_13_0 >= 1 then
					setActive(var_12_14, true)
					setActive(var_12_15, false)
					setActive(var_12_16, false)
					setText(var_12_17, var_13_0)
				elseif var_13_0 <= 0 and var_13_1 > 0 then
					setActive(var_12_14, false)
					setActive(var_12_15, true)
					setActive(var_12_16, false)
					setText(var_12_17, var_13_1)
				elseif var_13_0 <= 0 and var_13_1 <= 0 and (var_13_2 > 0 or var_13_3 > 0) then
					setActive(var_12_14, false)
					setActive(var_12_15, false)
					setActive(var_12_16, true)
					setText(var_12_17, math.max(var_13_2, 1))
				elseif var_13_0 <= 0 and var_13_1 <= 0 and var_13_2 <= 0 and var_13_3 <= 0 and arg_12_0.actCatchupTimer then
					arg_12_0.actCatchupTimer:Stop()

					arg_12_0.actCatchupTimer = nil

					setActive(var_12_4, false)
				end
			end

			arg_12_0.actCatchupTimer = Timer.New(var_12_18, 1, -1, 1)

			arg_12_0.actCatchupTimer:Start()
			arg_12_0.actCatchupTimer.func()

			var_12_5 = true
		end
	end

	setActive(var_12_4, var_12_5)
	setActive(var_12_2, true)

	local var_12_19 = getProxy(TechnologyProxy)
	local var_12_20 = var_12_19:isOpenTargetCatchup()
	local var_12_21 = var_12_19:isOnCatchup()

	if var_12_20 then
		if not var_12_21 then
			setActive(var_12_3, false)
			setActive(var_12_0, true)
		else
			local var_12_22 = var_12_19:getCurCatchupTecInfo()
			local var_12_23 = var_12_22.tecID
			local var_12_24 = var_12_22.groupID
			local var_12_25 = var_12_22.printNum
			local var_12_26 = var_12_19:getCatchupData(var_12_23):isUr(var_12_24) and pg.technology_catchup_template[var_12_23].obtain_max_per_ur or pg.technology_catchup_template[var_12_23].obtain_max

			if var_12_26 <= var_12_25 then
				setActive(var_12_3, false)
				setActive(var_12_0, false)
			else
				setActive(var_12_3, true)
				setActive(var_12_0, false)

				local var_12_27 = var_12_3:Find("CharImg")

				setImageSprite(var_12_27, LoadSprite("TecCatchup/QChar" .. var_12_24, tostring(var_12_24)))

				local var_12_28 = var_12_3:Find("ProgressText")

				setText(var_12_28, var_12_25 .. "/" .. var_12_26)
			end
		end
	else
		setActive(var_12_3, false)
		setActive(var_12_0, false)
	end
end

function var_0_0.updateSettingBtnVersion(arg_14_0)
	local var_14_0 = getProxy(TechnologyProxy):getTendency(2)
	local var_14_1 = arg_14_0.settingsBtn:Find("tag")

	setActive(var_14_1, var_14_0 > 0)

	if var_14_0 > 0 then
		GetImageSpriteFromAtlasAsync("technologycard", "version_" .. var_14_0, var_14_1:Find("Image"), true)
	end
end

function var_0_0.setPage(arg_15_0, arg_15_1)
	arg_15_0.contextData.page = arg_15_1

	setActive(arg_15_0.basePage, arg_15_1 == var_0_0.PageBase)
	setActive(arg_15_0.queuePage, arg_15_1 == var_0_0.PageQueue)
	setActive(arg_15_0._tf:Find("blur_panel/adapt/top/title"), arg_15_1 == var_0_0.PageBase)
	setActive(arg_15_0._tf:Find("blur_panel/adapt/left"), arg_15_1 == var_0_0.PageBase)
	setActive(arg_15_0._tf:Find("blur_panel/adapt/top/title_queue"), arg_15_1 == var_0_0.PageQueue)
	setActive(arg_15_0._tf:Find("blur_panel/adapt/right"), arg_15_1 == var_0_0.PageQueue)

	if arg_15_1 == var_0_0.PageBase then
		for iter_15_0, iter_15_1 in ipairs(arg_15_0.technologyVOs) do
			if iter_15_1:isActivate() then
				if arg_15_0.enhancelTimer then
					arg_15_0.enhancelTimer:Stop()
				end

				arg_15_0.enhancelTimer = Timer.New(function()
					arg_15_0.srcollView:GetComponent("EnhancelScrollView"):SetHorizontalTargetItemIndex(arg_15_0.technologyCards[iter_15_0]:GetComponent("EnhanceItem").scrollViewItemIndex)

					arg_15_0.enhancelTimer = nil
				end, 0.35, 1)

				arg_15_0.enhancelTimer:Start()

				break
			end
		end
	end
end

function var_0_0.didEnter(arg_17_0)
	arg_17_0:initTechnologys()
	arg_17_0:initQueue()
	arg_17_0:setPage(arg_17_0.contextData.page or var_0_0.PageBase)
	onButton(arg_17_0, arg_17_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.technology_help_text.tip
		})
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.refreshBtn, function()
		if tobool(getProxy(TechnologyProxy):getActivateTechnology()) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("technology_canot_refresh")
			})

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("technology_refresh_tip"),
			onYes = function()
				arg_17_0:emit(TechnologyMediator.ON_REFRESH)
			end
		})
	end, SFX_PANEL)

	local var_17_0 = getProxy(TechnologyProxy):getConfigMaxVersion()

	onButton(arg_17_0, arg_17_0.settingsBtn, function()
		arg_17_0:emit(TechnologyMediator.ON_CLICK_SETTINGS_BTN)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.backBtn, function()
		arg_17_0:onBackPressed()
	end, SOUND_BACK)
	onButton(arg_17_0, arg_17_0.selectetPanel, function()
		arg_17_0:cancelSelected()
	end, SFX_PANEL)
	arg_17_0:updateRefreshBtn(arg_17_0.flag)
	arg_17_0:updateSettingsBtn()
end

function var_0_0.initTechnologys(arg_24_0)
	arg_24_0.technologyCards = {}
	arg_24_0.lastButtonListener = arg_24_0.lastButtonListener or {}

	if not arg_24_0.itemList then
		arg_24_0.itemList = UIItemList.New(arg_24_0.srcollView, arg_24_0.srcollView:GetChild(0))

		arg_24_0.itemList:make(function(arg_25_0, arg_25_1, arg_25_2)
			arg_25_1 = arg_25_1 + 1

			if arg_25_0 == UIItemList.EventUpdate then
				arg_25_2.name = arg_25_1
				arg_24_0.technologyCards[arg_25_1] = arg_25_2

				arg_24_0:updateTechnologyTF(arg_25_2, arg_25_1, "base")

				local var_25_0 = GetOrAddComponent(arg_25_2, typeof(Button)).onClick

				if arg_24_0.lastButtonListener[arg_25_2] then
					var_25_0:RemoveListener(arg_24_0.lastButtonListener[arg_25_2])
				end

				arg_24_0.lastButtonListener[arg_25_2] = function()
					pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)

					if arg_24_0.technologyVOs[arg_25_1]:isCompleted() then
						arg_24_0:emit(TechnologyMediator.ON_FINISHED, {
							id = arg_24_0.technologyVOs[arg_25_1].id,
							pool_id = arg_24_0.technologyVOs[arg_25_1].poolId
						})
					else
						arg_24_0:onSelected(arg_25_2, arg_25_1)
					end
				end

				var_25_0:AddListener(arg_24_0.lastButtonListener[arg_25_2])
			end
		end)
	end

	arg_24_0.itemList:align(#arg_24_0.technologyVOs)
	setActive(arg_24_0.srcollView, true)
end

function var_0_0.initQueue(arg_27_0)
	if not arg_27_0.queueItemList then
		arg_27_0.queueItemList = UIItemList.New(arg_27_0.btnQueue, arg_27_0.btnQueue:GetChild(0))

		arg_27_0.queueItemList:make(function(arg_28_0, arg_28_1, arg_28_2)
			arg_28_1 = arg_28_1 + 1

			if arg_28_0 == UIItemList.EventUpdate then
				arg_28_2.name = arg_28_1

				if arg_27_0.queueTimer[arg_28_1] then
					arg_27_0.queueTimer[arg_28_1]:Stop()

					arg_27_0.queueTimer[arg_28_1] = nil
				end

				local var_28_0 = {}
				local var_28_1 = arg_27_0.technologyQueue[arg_28_1]

				if not var_28_1 then
					var_28_0.empty = true
				else
					local var_28_2 = pg.TimeMgr.GetInstance():GetServerTime()
					local var_28_3 = var_28_1.time
					local var_28_4 = var_28_1:getConfig("time")

					if var_28_2 < var_28_3 - var_28_4 then
						var_28_0.waiting = true
					elseif var_28_2 < var_28_3 then
						var_28_0.doing = true
						arg_27_0.queueTimer[arg_28_1] = Timer.New(function()
							local var_29_0 = pg.TimeMgr.GetInstance():GetServerTime()

							if var_29_0 < var_28_3 then
								setSlider(arg_28_2:Find("doing"), 0, var_28_4, var_28_4 - var_28_3 + var_29_0)
							else
								arg_27_0:updateQueueChange()
							end
						end, 1, -1)

						arg_27_0.queueTimer[arg_28_1]:Start()
						arg_27_0.queueTimer[arg_28_1].func()
					else
						var_28_0.complete = true
					end
				end

				eachChild(arg_28_2, function(arg_30_0)
					setActive(arg_30_0, var_28_0[arg_30_0.name])
				end)
			end
		end)
	end

	arg_27_0.queueItemList:align(TechnologyConst.QUEUE_TOTAL_COUNT)
	onButton(arg_27_0, arg_27_0.btnQueue, function()
		arg_27_0:setPage(var_0_0.PageQueue)
	end, SFX_PANEL)

	if not arg_27_0.queueCardItemList then
		arg_27_0.queueCardItemList = UIItemList.New(arg_27_0.queueView, arg_27_0.queueView:GetChild(0))

		arg_27_0.queueCardItemList:make(function(arg_32_0, arg_32_1, arg_32_2)
			arg_32_1 = arg_32_1 + 1

			if arg_32_0 == UIItemList.EventUpdate then
				arg_32_2.name = arg_32_1

				arg_27_0:updateTechnologyTF(arg_32_2, arg_32_1, "queue")
			end
		end)
	end

	arg_27_0.queueCardItemList:align(TechnologyConst.QUEUE_TOTAL_COUNT)
	onButton(arg_27_0, arg_27_0.btnAwardQueue, function()
		if arg_27_0.technologyQueue[1] and arg_27_0.technologyQueue[1]:isCompleted() then
			arg_27_0:emit(TechnologyMediator.ON_FINISH_QUEUE)
		end
	end, SFX_CONFIRM)
	setActive(arg_27_0.btnAwardQueue, arg_27_0.technologyQueue[1] and arg_27_0.technologyQueue[1]:isCompleted())
	setActive(arg_27_0.btnAwardQueueDisable, not isActive(arg_27_0.btnAwardQueue))
end

function var_0_0.updateRefreshBtn(arg_34_0, arg_34_1)
	setButtonEnabled(arg_34_0.refreshBtn, arg_34_1 == 0)
end

function var_0_0.onSelected(arg_35_0, arg_35_1, arg_35_2)
	if not arg_35_2 then
		return
	end

	if not arg_35_0.technologyVOs[arg_35_2] then
		return
	end

	arg_35_0.contextData.selectedIndex = arg_35_2

	arg_35_0:updateTechnologyTF(arg_35_0.technologyTpl, arg_35_2, "desc")

	arg_35_0.srcollViewCG.alpha = 0.3

	setActive(arg_35_1, false)
	setActive(arg_35_0.selectetPanel, true)

	local var_35_0 = {}

	eachChild(arg_35_0.srcollView, function(arg_36_0)
		var_35_0[tonumber(arg_36_0.name)] = arg_36_0
	end)

	local function var_35_1(arg_37_0, arg_37_1)
		local var_37_0 = {}
		local var_37_1 = arg_37_0
		local var_37_2 = var_35_0[arg_37_0].localPosition.x

		for iter_37_0, iter_37_1 in ipairs(var_35_0) do
			var_37_0[iter_37_0] = var_35_0[iter_37_0].localPosition.x - var_37_2
		end

		for iter_37_2, iter_37_3 in ipairs(var_37_0) do
			if iter_37_3 ~= 0 and (var_37_0[var_37_1] == 0 or arg_37_1 and (iter_37_3 > 0 and var_37_0[var_37_1] > 0 and iter_37_3 > var_37_0[var_37_1] or iter_37_3 < 0 and (var_37_0[var_37_1] > 0 or iter_37_3 > var_37_0[var_37_1])) or not arg_37_1 and (iter_37_3 < 0 and var_37_0[var_37_1] < 0 and iter_37_3 < var_37_0[var_37_1] or iter_37_3 > 0 and (var_37_0[var_37_1] < 0 or iter_37_3 < var_37_0[var_37_1]))) then
				var_37_1 = iter_37_2
			end
		end

		return var_35_0[var_37_1]
	end

	onButton(arg_35_0, arg_35_0.arrLeftBtn, function()
		if arg_35_0.inAnim then
			return
		end

		arg_35_0:cancelSelected()
		triggerButton(var_35_1(arg_35_2, true))
	end, SFX_PANEL)
	onButton(arg_35_0, arg_35_0.arrRightBtn, function()
		if arg_35_0.inAnim then
			return
		end

		arg_35_0:cancelSelected()
		triggerButton(var_35_1(arg_35_2, false))
	end, SFX_PANEL)
end

function var_0_0.cancelSelected(arg_40_0)
	if not arg_40_0.technologyVOs[arg_40_0.contextData.selectedIndex or 0] then
		return
	end

	local var_40_0 = arg_40_0.technologyCards[arg_40_0.contextData.selectedIndex]

	arg_40_0.contextData.selectedIndex = nil

	setActive(var_40_0, true)
	removeOnButton(arg_40_0.arrLeftBtn)
	removeOnButton(arg_40_0.arrRightBtn)
	setActive(arg_40_0.selectetPanel, false)

	arg_40_0.srcollViewCG.alpha = 1
	arg_40_0.inAnim = true

	if arg_40_0.timer then
		arg_40_0.timer:Stop()

		arg_40_0.timer = nil
	end

	arg_40_0.timer = Timer.New(function()
		arg_40_0.inAnim = nil
	end, 0.2, 1)

	arg_40_0.timer:Start()

	if arg_40_0.extraTimer then
		arg_40_0.extraTimer:Stop()

		arg_40_0.extraTimer = nil
	end
end

function var_0_0.updateTechnology(arg_42_0, arg_42_1)
	local var_42_0

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.technologyVOs) do
		if iter_42_1.id == arg_42_1.id then
			arg_42_0.technologyVOs[iter_42_0] = arg_42_1
			var_42_0 = iter_42_0

			break
		end
	end

	local var_42_1 = arg_42_0.technologyCards[var_42_0]

	arg_42_0:updateTechnologyTF(var_42_1, var_42_0, "base")

	if arg_42_0.contextData.selectedIndex and arg_42_0.technologyVOs[arg_42_0.contextData.selectedIndex].id == arg_42_1.id then
		arg_42_0:updateTechnologyTF(arg_42_0.technologyTpl, var_42_0, "desc")
	end
end

function var_0_0.updateQueueChange(arg_43_0)
	arg_43_0.queueItemList:align(#arg_43_0.technologyQueue)
	arg_43_0.queueCardItemList:align(TechnologyConst.QUEUE_TOTAL_COUNT)
	setActive(arg_43_0.btnAwardQueue, arg_43_0.technologyQueue[1] and arg_43_0.technologyQueue[1]:isCompleted())
	setActive(arg_43_0.btnAwardQueueDisable, not isActive(arg_43_0.btnAwardQueue))

	local var_43_0 = getProxy(TechnologyProxy):getActivateTechnology()

	if var_43_0 then
		arg_43_0:updateTechnology(var_43_0)
	end
end

function var_0_0.updateTechnologyTF(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0

	if arg_44_3 == "queue" then
		var_44_0 = arg_44_0.technologyQueue[arg_44_2]

		local var_44_1 = not tobool(var_44_0)

		setActive(arg_44_1:Find("frame"), not var_44_1)
		setActive(arg_44_1:Find("empty"), var_44_1)

		if var_44_1 then
			return
		end
	else
		var_44_0 = arg_44_0.technologyVOs[arg_44_2]
	end

	arg_44_0:updateInfo(arg_44_1, var_44_0, arg_44_3)
	arg_44_0:updateInfoVersionPickUp(arg_44_1, var_44_0)

	local var_44_2 = var_44_0:getConfig("time")
	local var_44_3 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_44_4 = var_44_0.time

	switch(arg_44_3, {
		base = function()
			if arg_44_0.cardtimer[arg_44_2] then
				arg_44_0.cardtimer[arg_44_2]:Stop()

				arg_44_0.cardtimer[arg_44_2] = nil
			end

			local var_45_0 = arg_44_1:Find("frame/marks/time")
			local var_45_1 = arg_44_1:Find("frame/marks/Text")
			local var_45_2 = var_0_0.rarityColor[var_44_0:getConfig("bg")]

			GetComponent(var_45_0, "Shadow").effectColor = Color.New(unpack(var_45_2[2]))

			local var_45_3 = {}

			if var_44_4 <= 0 then
				var_45_3.blue = true

				setText(var_45_1, setColorStr(i18n("technology_detail"), var_45_2[1]))
				setText(var_45_0, pg.TimeMgr.GetInstance():DescCDTime(var_44_0:getConfig("time")))
			elseif var_44_3 < var_44_4 - var_44_2 then
				var_45_3.blue = true

				setText(var_45_1, setColorStr(i18n("technology_queue_waiting"), var_45_2[1]))
				setText(var_45_0, pg.TimeMgr.GetInstance():DescCDTime(var_44_0:getConfig("time")))

				arg_44_0.cardtimer[arg_44_2] = Timer.New(function()
					arg_44_0:updateTechnology(var_44_0)
				end, var_44_4 - var_44_2 - var_44_3)

				arg_44_0.cardtimer[arg_44_2]:Start()
			elseif var_44_3 < var_44_4 then
				var_45_3.blue = true

				setText(var_45_1, setColorStr(i18n("technology_queue_processing"), var_45_2[1]))

				arg_44_0.cardtimer[arg_44_2] = Timer.New(function()
					local var_47_0 = var_44_0.time
					local var_47_1 = pg.TimeMgr.GetInstance():GetServerTime()

					if var_47_1 < var_47_0 then
						setText(var_45_0, pg.TimeMgr.GetInstance():DescCDTime(var_47_0 - var_47_1))
					else
						arg_44_0:updateTechnology(var_44_0)
					end
				end, 1, -1)

				arg_44_0.cardtimer[arg_44_2]:Start()
				arg_44_0.cardtimer[arg_44_2].func()
			else
				var_45_3.green = true

				if var_44_0:isCompleted() then
					setText(var_45_1, setColorStr(i18n("technology_queue_complete"), var_45_2[1]))
				else
					setText(var_45_1, setColorStr(i18n("technology_mission_unfinish"), var_45_2[1]))
				end

				setText(var_45_0, "00:00:00")
			end

			eachChild(arg_44_1:Find("frame/marks/line"), function(arg_48_0)
				setActive(arg_48_0, var_45_3[arg_48_0.name])
			end)
		end,
		queue = function()
			if arg_44_0.queueCardTimer[arg_44_2] then
				arg_44_0.queueCardTimer[arg_44_2]:Stop()

				arg_44_0.queueCardTimer[arg_44_2] = nil
			end

			local var_49_0 = arg_44_1:Find("frame/marks/time")
			local var_49_1 = arg_44_1:Find("frame/marks/Text")
			local var_49_2 = var_0_0.rarityColor[var_44_0:getConfig("bg")]

			GetComponent(var_49_0, "Shadow").effectColor = Color.New(unpack(var_49_2[2]))

			local var_49_3 = {}

			if var_44_4 <= 0 then
				assert(false, "error queue")
			elseif var_44_3 < var_44_4 - var_44_2 then
				var_49_3.blue = true

				setText(var_49_1, setColorStr(i18n("technology_queue_waiting"), var_49_2[1]))
				setText(var_49_0, pg.TimeMgr.GetInstance():DescCDTime(var_44_0:getConfig("time")))
			elseif var_44_3 < var_44_4 then
				var_49_3.blue = true

				setText(var_49_1, setColorStr(i18n("technology_queue_processing"), var_49_2[1]))

				arg_44_0.queueCardTimer[arg_44_2] = Timer.New(function()
					local var_50_0 = var_44_0.time
					local var_50_1 = pg.TimeMgr.GetInstance():GetServerTime()

					if var_50_1 < var_50_0 then
						setText(var_49_0, pg.TimeMgr.GetInstance():DescCDTime(var_50_0 - var_50_1))
					end
				end, 1, -1)

				arg_44_0.queueCardTimer[arg_44_2]:Start()
				arg_44_0.queueCardTimer[arg_44_2].func()
			else
				var_49_3.green = true

				setText(var_49_1, setColorStr(i18n("technology_queue_complete"), var_49_2[1]))
				setText(var_49_0, "00:00:00")
			end

			eachChild(arg_44_1:Find("frame/marks/line"), function(arg_51_0)
				setActive(arg_51_0, var_49_3[arg_51_0.name])
			end)
			setActive(arg_44_1:Find("frame/mask"), var_44_4 > 0 and var_44_3 < var_44_4 - var_44_2)
		end,
		desc = function()
			arg_44_0.descTxt.text = var_44_0:getConfig("desc")
			arg_44_0.descBG.sprite = GetSpriteFromAtlas("ui/TechnologyUI_atlas", var_44_0:getConfig("rarity"))

			local var_52_0 = var_44_0:getConfig("consume")
			local var_52_1 = UIItemList.New(arg_44_0.itemContainer, arg_44_0.itemTpl)

			var_52_1:make(function(arg_53_0, arg_53_1, arg_53_2)
				arg_53_1 = arg_53_1 + 1

				if arg_53_0 == UIItemList.EventUpdate then
					arg_44_0:updateItem(arg_53_2, var_44_0, var_52_0[arg_53_1])
					setActive(arg_53_2:Find("check"), var_44_0:isActivate())
					setActive(arg_53_2:Find("icon_bg/count"), not var_44_0:isActivate())
				end
			end)
			var_52_1:align(#var_52_0)
			setActive(arg_44_0.emptyTF, not var_52_0 or #var_52_0 <= 0)

			local var_52_2 = var_44_0:getConfig("condition")

			if var_52_2 > 0 then
				local var_52_3 = getProxy(TaskProxy):getTaskById(var_52_2) or Task.New({
					id = var_52_2
				})

				arg_44_0.taskSlider.value = var_52_3.progress / var_52_3:getConfig("target_num")
				arg_44_0.taskDesc.text = var_52_3:getConfig("desc") .. "(" .. var_52_3.progress .. "/" .. var_52_3:getConfig("target_num") .. ")"
			else
				arg_44_0.taskDesc.text = i18n("technology_task_none_tip")
				arg_44_0.taskSlider.value = 0
			end

			if arg_44_0.extraTimer then
				arg_44_0.extraTimer:Stop()

				arg_44_0.extraTimer = nil
			end

			local var_52_4 = {}

			if var_44_4 <= 0 then
				var_52_4.start_btn = true
				arg_44_0.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_44_2)
			elseif var_44_3 < var_44_4 - var_44_2 then
				var_52_4.stop_btn = true
				var_52_4.join_btn = var_44_0:finishCondition()
				var_52_4.lock_join_btn = not var_52_4.join_btn
				arg_44_0.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_44_2)
			elseif var_44_3 < var_44_4 then
				var_52_4.stop_btn = true
				var_52_4.join_btn = var_44_0:finishCondition()
				var_52_4.lock_join_btn = not var_52_4.join_btn
				arg_44_0.extraTimer = Timer.New(function()
					local var_54_0 = pg.TimeMgr.GetInstance():GetServerTime()

					if var_54_0 < var_44_4 then
						arg_44_0.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_44_4 - var_54_0)
					end
				end, 1, -1)

				arg_44_0.extraTimer:Start()
				arg_44_0.extraTimer.func()
			else
				if var_44_0:isCompleted() then
					var_52_4.finish_btn = true
				else
					var_52_4.stop_btn = true
					var_52_4.lock_join_btn = true
				end

				arg_44_0.timerTxt.text = "00:00:00"
			end

			eachChild(arg_44_1:Find("frame/btns"), function(arg_55_0)
				setActive(arg_55_0, var_52_4[arg_55_0.name])
			end)

			local var_52_5 = arg_44_1:Find("frame/btns/start_btn")

			onButton(arg_44_0, var_52_5, function()
				if getProxy(TechnologyProxy):getActivateTechnology() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("technology_is_actived"))

					return
				end

				local var_56_0 = var_44_0:getConfig("consume")

				if #var_56_0 > 0 then
					local var_56_1 = getDropInfo(var_56_0)

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("technology_task_build_tip", var_56_1),
						onYes = function()
							arg_44_0:emit(TechnologyMediator.ON_START, {
								id = var_44_0.id,
								pool_id = var_44_0.poolId
							})
						end
					})
				else
					arg_44_0:emit(TechnologyMediator.ON_START, {
						id = var_44_0.id,
						pool_id = var_44_0.poolId
					})
				end
			end, SFX_PANEL)
			setButtonEnabled(var_52_5, var_44_0:hasResToStart())

			local var_52_6 = arg_44_1:Find("frame/btns/stop_btn")

			onButton(arg_44_0, var_52_6, function()
				if not var_44_0:isActivate() then
					return
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("technology_stop_tip"),
					onYes = function()
						arg_44_0:emit(TechnologyMediator.ON_STOP, {
							id = var_44_0.id,
							pool_id = var_44_0.poolId
						})
					end
				})
			end, SFX_PANEL)

			local var_52_7 = arg_44_1:Find("frame/btns/join_btn")

			onButton(arg_44_0, var_52_7, function()
				if #arg_44_0.technologyQueue == TechnologyConst.QUEUE_TOTAL_COUNT then
					pg.TipsMgr.GetInstance():ShowTips(i18n("technology_queue_full"))

					return
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("technology_queue_in_doublecheck"),
					onYes = function()
						arg_44_0:emit(TechnologyMediator.ON_JOIN_QUEUE, {
							id = var_44_0.id,
							pool_id = var_44_0.poolId
						})
					end
				})
			end, SFX_PANEL)

			local var_52_8 = arg_44_1:Find("frame/btns/lock_join_btn")

			onButton(arg_44_0, var_52_8, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("technology_queue_in_mission_incomplete"))
			end, SFX_PANEL)

			local var_52_9 = arg_44_1:Find("frame/btns/finish_btn")

			onButton(arg_44_0, var_52_9, function()
				arg_44_0:emit(TechnologyMediator.ON_FINISHED, {
					id = var_44_0.id,
					pool_id = var_44_0.poolId
				})
			end, SFX_PANEL)
		end
	})
end

function var_0_0.dfs(arg_64_0, arg_64_1, arg_64_2)
	if arg_64_1.name ~= "item_tpl" then
		for iter_64_0 = 1, arg_64_1.childCount do
			arg_64_0:dfs(arg_64_1:GetChild(iter_64_0 - 1), arg_64_2)
		end
	else
		arg_64_2(arg_64_1)
	end
end

local var_0_1 = {
	tag_red = "F15F34FF",
	tag_blue = "2541E3FF"
}

function var_0_0.updateInfo(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	setImageSprite(arg_65_1:Find("frame"), GetSpriteFromAtlas("technologycard", arg_65_2:getConfig("bg") .. (arg_65_3 == "desc" and "_l" or "")))
	setImageSprite(arg_65_1:Find("frame/icon_mask/icon"), GetSpriteFromAtlas("technologyshipicon/" .. arg_65_2:getConfig("bg_icon"), arg_65_2:getConfig("bg_icon")), true)
	setImageSprite(arg_65_1:Find("frame/top/label"), GetSpriteFromAtlas("technologycard", arg_65_2:getConfig("label")))
	setImageSprite(arg_65_1:Find("frame/top/label/text"), GetSpriteFromAtlas("technologycard", arg_65_2:getConfig("label_color")), true)
	setImageSprite(arg_65_1:Find("frame/top/label/version"), GetSpriteFromAtlas("technologycard", "version_" .. arg_65_2:getConfig("blueprint_version")), true)
	setImageColor(arg_65_1:Find("frame/top/pick_up"), Color.NewHex(var_0_1[arg_65_2:getConfig("label")]))
	setText(arg_65_1:Find("frame/name_bg/Text"), arg_65_2:getConfig("name"))
	setText(arg_65_1:Find("frame/sub_name"), arg_65_2:getConfig("sub_name") or "")

	local var_65_0 = arg_65_2:getConfig("drop_client")
	local var_65_1 = arg_65_1:Find("frame/item_container")
	local var_65_2 = 0

	arg_65_0:dfs(var_65_1, function(arg_66_0)
		var_65_2 = var_65_2 + 1

		setActive(arg_66_0, var_65_2 <= #var_65_0)

		if var_65_2 <= #var_65_0 then
			arg_65_0:updateItem(arg_66_0, arg_65_2, var_65_0[var_65_2])
		end
	end)
	switch(arg_65_3, {
		desc = function()
			return
		end
	}, function()
		setActive(var_65_1:GetChild(1), #var_65_0 > 2)

		var_65_1:GetChild(0):GetComponent("HorizontalLayoutGroup").padding.right = #var_65_0 == 4 and 25 or 0
		var_65_1:GetChild(1):GetComponent("HorizontalLayoutGroup").padding.left = #var_65_0 == 4 and 25 or 0
	end)
end

function var_0_0.updateInfoVersionPickUp(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = getProxy(TechnologyProxy):getTendency(2)

	setActive(arg_69_1:Find("frame/top/pick_up"), var_69_0 == arg_69_2:getConfig("blueprint_version"))
end

function var_0_0.updateItem(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
	local var_70_0 = Drop.Create(arg_70_3)

	updateDrop(arg_70_1, setmetatable({
		count = 0
	}, {
		__index = var_70_0
	}))

	local var_70_1 = arg_70_1:Find("icon_bg/count")

	if not IsNil(var_70_1) then
		setColorCount(var_70_1, var_70_0:getOwnedCount(), var_70_0.count)
	end

	onButton(arg_70_0, arg_70_1, function()
		local var_71_0 = var_70_0:getConfig("display_icon") or {}

		if #var_71_0 > 0 then
			local var_71_1 = {
				type = MSGBOX_TYPE_ITEM_BOX,
				items = _.map(var_71_0, function(arg_72_0)
					return {
						type = arg_72_0[1],
						id = arg_72_0[2]
					}
				end),
				content = var_70_0:getConfig("display")
			}

			function var_71_1.itemFunc(arg_73_0)
				arg_70_0:emit(var_0_0.ON_DROP, arg_73_0, function()
					pg.MsgboxMgr.GetInstance():ShowMsgBox(var_71_1)
				end)
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox(var_71_1)
		else
			arg_70_0:emit(var_0_0.ON_DROP, var_70_0)
		end
	end, SFX_PANEL)
end

function var_0_0.updatePickUpVersionChange(arg_75_0)
	arg_75_0:updateSettingBtnVersion()

	for iter_75_0, iter_75_1 in ipairs(arg_75_0.technologyCards) do
		arg_75_0:updateInfoVersionPickUp(iter_75_1, arg_75_0.technologyVOs[iter_75_0])
	end

	for iter_75_2, iter_75_3 in ipairs(arg_75_0.technologyQueue) do
		arg_75_0:updateInfoVersionPickUp(arg_75_0.queueCardItemList.container:GetChild(iter_75_2 - 1), iter_75_3)
	end
end

function var_0_0.clearTimer(arg_76_0, ...)
	if arg_76_0.timer then
		arg_76_0.timer:Stop()

		arg_76_0.timer = nil
	end

	if arg_76_0.extraTimer then
		arg_76_0.extraTimer:Stop()

		arg_76_0.extraTimer = nil
	end

	if arg_76_0.enhancelTimer then
		arg_76_0.enhancelTimer:Stop()

		arg_76_0.enhancelTimer = nil
	end

	for iter_76_0, iter_76_1 in pairs(arg_76_0.cardtimer) do
		iter_76_1:Stop()
	end

	arg_76_0.cardtimer = {}

	for iter_76_2, iter_76_3 in pairs(arg_76_0.queueTimer) do
		iter_76_3:Stop()
	end

	arg_76_0.queueTimer = {}

	for iter_76_4, iter_76_5 in pairs(arg_76_0.queueCardTimer) do
		iter_76_5:Stop()
	end

	arg_76_0.queueCardTimer = {}

	if arg_76_0.actCatchupTimer then
		arg_76_0.actCatchupTimer:Stop()

		arg_76_0.actCatchupTimer = nil
	end
end

function var_0_0.willExit(arg_77_0)
	arg_77_0:clearTimer()

	arg_77_0.cardtimer = nil
	arg_77_0.queueTimer = nil
	arg_77_0.queueCardTimer = nil
end

return var_0_0
