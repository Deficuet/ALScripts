local var_0_0 = class("TecSpeedUpLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "TecSpeedUpUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
	arg_2_0:initTaskPanel()
	arg_2_0:initItem()
	setText(arg_2_0.useCountText, 0)
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
	arg_3_0:tryPlayGuide()
end

function var_0_0.willExit(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)

	if arg_4_0.minusTimer then
		arg_4_0.minusTimer:Stop()
	end

	if arg_4_0.addTimer then
		arg_4_0.addTimer:Stop(0)
	end
end

function var_0_0.tryPlayGuide(arg_5_0)
	pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0021")
end

function var_0_0.initData(arg_6_0)
	arg_6_0.technologyProxy = getProxy(TechnologyProxy)
	arg_6_0.taskProxy = getProxy(TaskProxy)
	arg_6_0.bagProxy = getProxy(BagProxy)
	arg_6_0.shipBluePrintOnDev = nil

	local var_6_0 = arg_6_0.technologyProxy:getBluePrints()

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		if iter_6_1:isDeving() then
			arg_6_0.shipBluePrintOnDev = iter_6_1

			break
		end
	end

	local var_6_1 = arg_6_0.shipBluePrintOnDev:getTaskIds()
	local var_6_2 = arg_6_0.shipBluePrintOnDev:getTaskStateById(var_6_1[1])
	local var_6_3 = arg_6_0.shipBluePrintOnDev:getTaskStateById(var_6_1[4])

	arg_6_0.expTaskID = nil

	if var_6_2 == ShipBluePrint.TASK_STATE_START then
		arg_6_0.expTaskID = var_6_1[1]
	elseif var_6_3 == ShipBluePrint.TASK_STATE_START then
		arg_6_0.expTaskID = var_6_1[4]
	end

	arg_6_0.expTaskVO = arg_6_0.taskProxy:getTaskVO(arg_6_0.expTaskID)
	arg_6_0.bluePrintVersion = arg_6_0.shipBluePrintOnDev:getConfig("blueprint_version")
	arg_6_0.itemID = pg.gameset.technology_catchup_itemid.description[arg_6_0.bluePrintVersion][1]
	arg_6_0.itemExp = pg.gameset.technology_catchup_itemid.description[arg_6_0.bluePrintVersion][2]
	arg_6_0.curUseNum = 0

	local var_6_4 = arg_6_0.expTaskVO:getProgress()
	local var_6_5 = arg_6_0.expTaskVO:getConfig("target_num") - var_6_4
	local var_6_6 = math.ceil(var_6_5 / arg_6_0.itemExp)
	local var_6_7 = arg_6_0.bagProxy:getItemCountById(arg_6_0.itemID)

	arg_6_0.maxUseNum = math.min(var_6_6, var_6_7)
end

function var_0_0.findUI(arg_7_0)
	local var_7_0 = arg_7_0:findTF("Window/top/bg/obtain/title")

	setText(var_7_0, i18n("tec_speedup_title"))

	local var_7_1 = arg_7_0:findTF("Window")

	arg_7_0.backBtn = arg_7_0:findTF("top/btnBack", var_7_1)
	arg_7_0.bg = arg_7_0:findTF("BG")

	local var_7_2 = arg_7_0:findTF("Panel", var_7_1)
	local var_7_3 = arg_7_0:findTF("Task", var_7_2)

	arg_7_0.taskNameText = arg_7_0:findTF("Name/Text", var_7_3)
	arg_7_0.expProgressText = arg_7_0:findTF("ExpProgressText", var_7_3)
	arg_7_0.expProgressSlider = arg_7_0:findTF("Slider", var_7_3)
	arg_7_0.taskText = arg_7_0:findTF("TaskText", var_7_3)
	arg_7_0.progressNumText = arg_7_0:findTF("ProgressNumText", var_7_3)

	local var_7_4 = arg_7_0:findTF("ItemPanel", var_7_2)

	arg_7_0.itemIcon = arg_7_0:findTF("Item/Icon", var_7_4)
	arg_7_0.itemCountText = arg_7_0:findTF("Item/CountText", var_7_4)
	arg_7_0.itemNameText = arg_7_0:findTF("NameText", var_7_4)
	arg_7_0.minusBtn = arg_7_0:findTF("UsePanel/MinusBtn", var_7_4)
	arg_7_0.addBtn = arg_7_0:findTF("UsePanel/AddBtn", var_7_4)
	arg_7_0.maxBtn = arg_7_0:findTF("UsePanel/MaxBtn", var_7_4)
	arg_7_0.useCountText = arg_7_0:findTF("UsePanel/UseCountText", var_7_4)
	arg_7_0.confirmBtn = arg_7_0:findTF("ConfirmBtn", var_7_1)
	arg_7_0.helpBtn = arg_7_0:findTF("HelpBtn", var_7_1)
	arg_7_0.helpPanel = arg_7_0:findTF("HelpPanel", var_7_1)
	arg_7_0.helpText = arg_7_0:findTF("Text", arg_7_0.helpPanel)

	setText(arg_7_0.helpText, pg.gametip.tec_speedup_help_tip.tip)
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.backBtn, function()
		arg_8_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.bg, function()
		arg_8_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.confirmBtn, function()
		if arg_8_0.curUseNum == 0 then
			return
		end

		local var_11_0, var_11_1 = arg_8_0:isExpOverFlow()

		if arg_8_0:isExpOverFlow() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("tec_speedup_overflow", var_11_1),
				onYes = function()
					pg.m02:sendNotification(GAME.USE_TEC_SPEEDUP_ITEM, {
						blueprintid = arg_8_0.shipBluePrintOnDev.id,
						itemid = arg_8_0.itemID,
						number = arg_8_0.curUseNum,
						taskID = arg_8_0.expTaskID
					})
				end
			})
		else
			pg.m02:sendNotification(GAME.USE_TEC_SPEEDUP_ITEM, {
				blueprintid = arg_8_0.shipBluePrintOnDev.id,
				itemid = arg_8_0.itemID,
				number = arg_8_0.curUseNum,
				taskID = arg_8_0.expTaskID
			})
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.helpBtn, function()
		if isActive(arg_8_0.helpPanel) then
			setActive(arg_8_0.helpPanel, false)
		else
			setActive(arg_8_0.helpPanel, true)
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.maxBtn, function()
		if arg_8_0.curUseNum ~= arg_8_0.maxUseNum then
			arg_8_0.curUseNum = arg_8_0.maxUseNum

			setText(arg_8_0.useCountText, arg_8_0.curUseNum)
			arg_8_0:updateTaskPanel(arg_8_0.curUseNum)
		end
	end, SFX_PANEL)

	local var_8_0 = 0

	local function var_8_1()
		if arg_8_0.curUseNum > 0 then
			arg_8_0.curUseNum = arg_8_0.curUseNum - 1

			setText(arg_8_0.useCountText, arg_8_0.curUseNum)
			arg_8_0:updateTaskPanel(arg_8_0.curUseNum)
		end
	end

	onButton(arg_8_0, arg_8_0.minusBtn, var_8_1, SFX_PANEL)

	local var_8_2 = GetOrAddComponent(arg_8_0.minusBtn, typeof(EventTriggerListener))

	var_8_2:AddPointDownFunc(function(arg_16_0, arg_16_1)
		if not arg_8_0.minusTimer then
			arg_8_0.minusTimer = Timer.New(function()
				if var_8_0 < 1 then
					var_8_0 = var_8_0 + 0.2
				else
					var_8_1()
				end
			end, 0.2, -1, 1)
		end

		arg_8_0.minusTimer:Start()
	end)
	var_8_2:AddPointUpFunc(function(arg_18_0, arg_18_1)
		if arg_8_0.minusTimer then
			var_8_0 = 0

			arg_8_0.minusTimer:Stop()
		end
	end)

	local function var_8_3()
		if arg_8_0.curUseNum < arg_8_0.maxUseNum then
			arg_8_0.curUseNum = arg_8_0.curUseNum + 1

			setText(arg_8_0.useCountText, arg_8_0.curUseNum)
			arg_8_0:updateTaskPanel(arg_8_0.curUseNum)
		end
	end

	onButton(arg_8_0, arg_8_0.addBtn, var_8_3, SFX_PANEL)

	local var_8_4 = GetOrAddComponent(arg_8_0.addBtn, typeof(EventTriggerListener))

	var_8_4:AddPointDownFunc(function(arg_20_0, arg_20_1)
		if not arg_8_0.addTimer then
			arg_8_0.addTimer = Timer.New(function()
				if var_8_0 < 1 then
					var_8_0 = var_8_0 + 0.2
				else
					var_8_3()
				end
			end, 0.2, -1, 1)
		end

		arg_8_0.addTimer:Start()
	end)
	var_8_4:AddPointUpFunc(function(arg_22_0, arg_22_1)
		if arg_8_0.addTimer then
			var_8_0 = 0

			arg_8_0.addTimer:Stop()
		end
	end)
end

function var_0_0.initTaskPanel(arg_23_0)
	local var_23_0 = arg_23_0.expTaskVO:getConfig("name")

	setText(arg_23_0.taskNameText, var_23_0)

	local var_23_1 = arg_23_0.expTaskVO:getConfig("desc")

	setText(arg_23_0.taskText, string.split(var_23_1, i18n("tech_catchup_sentence_pauses"))[2])

	local var_23_2 = arg_23_0.expTaskVO:getProgress()
	local var_23_3 = arg_23_0.expTaskVO:getConfig("target_num")

	setText(arg_23_0.expProgressText, i18n("tec_speedup_progress", math.floor(var_23_2 / 10000), math.floor(var_23_3 / 10000)))

	local var_23_4 = var_23_2 / var_23_3

	setSlider(arg_23_0.expProgressSlider, 0, 1, var_23_4)
	setText(arg_23_0.progressNumText, math.floor(var_23_4 * 100) .. "%")
end

function var_0_0.updateTaskPanel(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.curUseNum * arg_24_0.itemExp
	local var_24_1 = arg_24_0.expTaskVO:getProgress()
	local var_24_2 = arg_24_0.expTaskVO:getConfig("target_num")
	local var_24_3 = var_24_1 + var_24_0

	setText(arg_24_0.expProgressText, i18n("tec_speedup_progress", math.floor(var_24_3 / 10000), math.floor(var_24_2 / 10000)))

	local var_24_4 = var_24_3 / var_24_2

	setSlider(arg_24_0.expProgressSlider, 0, 1, var_24_4)
	setText(arg_24_0.progressNumText, math.floor(var_24_4 * 100) .. "%")
end

function var_0_0.initItem(arg_25_0)
	local var_25_0 = Item.getConfigData(arg_25_0.itemID)

	GetImageSpriteFromAtlasAsync(var_25_0.icon, "", arg_25_0.itemIcon)
	setText(arg_25_0.itemCountText, arg_25_0.bagProxy:getItemCountById(arg_25_0.itemID))
	setText(arg_25_0.itemNameText, var_25_0.name)
end

function var_0_0.isExpOverFlow(arg_26_0)
	local var_26_0 = arg_26_0.curUseNum * arg_26_0.itemExp
	local var_26_1 = arg_26_0.expTaskVO:getProgress()
	local var_26_2 = arg_26_0.expTaskVO:getConfig("target_num")
	local var_26_3 = var_26_1 + var_26_0
	local var_26_4 = var_26_2 < var_26_3
	local var_26_5 = var_26_3 - var_26_2

	return var_26_4, var_26_5
end

return var_0_0
