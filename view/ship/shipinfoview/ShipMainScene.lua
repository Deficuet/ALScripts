local var_0_0 = class("ShipMainScene", import("...base.BaseUI"))
local var_0_1 = 0
local var_0_2 = 0.2
local var_0_3 = 0.3
local var_0_4 = 3
local var_0_5 = 0.5
local var_0_6 = 11

function var_0_0.getUIName(arg_1_0)
	return "ShipMainScene"
end

function var_0_0.ResUISettings(arg_2_0)
	return true
end

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(BayProxy):getShipById(arg_3_1.shipId)
	local var_3_1 = {
		"ui/ShipDetailView",
		"bg/star_level_bg_" .. var_3_0:rarity2bgPrintForGet(),
		"ui/star_level_bg_" .. var_3_0:rarity2bgPrintForGet()
	}
	local var_3_2 = var_3_0:getRarity()
	local var_3_3 = pg.ship_skin_template[var_3_0:getSkinId()]
	local var_3_4 = var_3_3.rarity_bg and var_3_3.rarity_bg ~= ""

	if var_3_2 > 2 and not var_3_4 then
		table.insert(var_3_1, "ui/al_bg02_" .. var_3_2 - 1)
	end

	return table.insertto(var_3_1, var_0_0.super.getResource(arg_3_0, arg_3_1))
end

function var_0_0.preload(arg_4_0, arg_4_1)
	local var_4_0 = getProxy(BayProxy):getShipById(arg_4_0.contextData.shipId)

	parallelAsync({
		function(arg_5_0)
			GetSpriteFromAtlasAsync("bg/star_level_bg_" .. var_4_0:rarity2bgPrintForGet(), "", arg_5_0)
		end,
		function(arg_6_0)
			if arg_4_0.exited then
				return
			end

			PoolMgr.GetInstance():PreloadUI("ShipDetailView", arg_6_0)
		end
	}, arg_4_1)
end

function var_0_0.setPlayer(arg_7_0, arg_7_1)
	arg_7_0.player = arg_7_1

	arg_7_0:GetShareData():SetPlayer(arg_7_1)
end

function var_0_0.setShipList(arg_8_0, arg_8_1)
	arg_8_0.shipList = arg_8_1
end

function var_0_0.setShip(arg_9_0, arg_9_1)
	arg_9_0:GetShareData():SetShipVO(arg_9_1)

	local var_9_0 = false

	if arg_9_0.shipVO and arg_9_0.shipVO.id ~= arg_9_1.id then
		arg_9_0:StopPreVoice()

		var_9_0 = true
	end

	arg_9_0.shipVO = arg_9_1

	SplitPackConst.DownloadByLuaArr(ResPathSupport.GetShipAllRes(arg_9_1), function()
		if arg_9_0.exited or arg_9_0.shipVO ~= arg_9_1 then
			return
		end

		setActive(arg_9_0.npcFlagTF, arg_9_1:isActivityNpc())
		arg_9_0:setToggleEnable()

		local var_10_0 = pg.ship_skin_template[arg_9_0.shipVO:getSkinId()]

		arg_9_0.isSpBg = var_10_0.rarity_bg and var_10_0.rarity_bg ~= ""

		arg_9_0:updatePreference(arg_9_1)
		arg_9_0.shipDetailView:ActionInvokeExclusive("UpdateUI")
		arg_9_0.shipFashionView:ActionInvokeExclusive("UpdateUI")
		arg_9_0.shipEquipView:ActionInvokeExclusive("UpdateUI")

		if var_9_0 and not arg_9_0:checkToggleActive(ShipViewConst.currentPage) then
			triggerToggle(arg_9_0.detailToggle, true)
		end
	end)
end

function var_0_0.equipmentChange(arg_11_0)
	if arg_11_0.shipDetailView then
		arg_11_0.shipDetailView:ActionInvoke("UpdateUI")
	end
end

function var_0_0.setToggleEnable(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.togglesList) do
		setActive(iter_12_1, arg_12_0:checkToggleActive(iter_12_0))
	end

	setActive(arg_12_0.technologyToggle, arg_12_0.shipVO:isBluePrintShip())
	SetActive(arg_12_0.metaToggle, arg_12_0.shipVO:isMetaShip())
end

function var_0_0.checkToggleActive(arg_13_0, arg_13_1)
	if arg_13_1 == ShipViewConst.PAGE.DETAIL then
		return true
	elseif arg_13_1 == ShipViewConst.PAGE.EQUIPMENT then
		return true
	elseif arg_13_1 == ShipViewConst.PAGE.INTENSIFY then
		return not arg_13_0.shipVO:isTestShip() and not arg_13_0.shipVO:isBluePrintShip() and not arg_13_0.shipVO:isMetaShip()
	elseif arg_13_1 == ShipViewConst.PAGE.UPGRADE then
		return not arg_13_0.shipVO:isTestShip() and not arg_13_0.shipVO:isBluePrintShip() and not arg_13_0.shipVO:isMetaShip()
	elseif arg_13_1 == ShipViewConst.PAGE.REMOULD then
		return not arg_13_0.shipVO:isTestShip() and not arg_13_0.shipVO:isBluePrintShip() and pg.ship_data_trans[arg_13_0.shipVO.groupId] and not arg_13_0.shipVO:isMetaShip()
	elseif arg_13_1 == ShipViewConst.PAGE.FASHION then
		if not arg_13_0:hasFashion() then
			return false
		else
			local var_13_0
			local var_13_1

			if not PaintingGroupConst.IsPaintingNeedCheck() then
				var_13_1 = false
			else
				local var_13_2 = PaintingGroupConst.GetPaintingNameListByShipVO(arg_13_0.shipVO)

				var_13_1 = PaintingGroupConst.CalcPaintingListSize(var_13_2) > 0
			end

			return not var_13_1
		end
	else
		return false
	end
end

function var_0_0.setSkinList(arg_14_0, arg_14_1)
	arg_14_0.shipFashionView:ActionInvoke("SetSkinList", arg_14_1)
end

function var_0_0.updateLock(arg_15_0)
	arg_15_0.shipDetailView:ActionInvoke("UpdateLock")
end

function var_0_0.updatePreferenceTag(arg_16_0)
	arg_16_0.shipDetailView:ActionInvoke("UpdatePreferenceTag")
end

function var_0_0.updateFashionTag(arg_17_0)
	arg_17_0.shipDetailView:ActionInvoke("UpdateFashionTag")
end

function var_0_0.closeRecordPanel(arg_18_0)
	arg_18_0.shipDetailView:ActionInvoke("CloseRecordPanel")
end

function var_0_0.updateRecordEquipments(arg_19_0, arg_19_1)
	arg_19_0.shipDetailView:UpdateRecordEquipments(arg_19_1)
	arg_19_0.shipDetailView:UpdateRecordSpWeapons(arg_19_1)
end

function var_0_0.setModPanel(arg_20_0, arg_20_1)
	arg_20_0.modPanel = arg_20_1
end

function var_0_0.setMaxLevelHelpFlag(arg_21_0, arg_21_1)
	arg_21_0.maxLevelHelpFlag = arg_21_1
end

function var_0_0.checkMaxLevelHelp(arg_22_0)
	if not arg_22_0.maxLevelHelpFlag and arg_22_0.shipVO and arg_22_0.shipVO:isReachNextMaxLevel() then
		arg_22_0:openHelpPage()

		arg_22_0.maxLevelHelpFlag = true

		getProxy(SettingsProxy):setMaxLevelHelp(true)
	end
end

function var_0_0.GetShareData(arg_23_0)
	if not arg_23_0.shareData then
		arg_23_0.shareData = ShipViewShareData.New(arg_23_0.contextData)

		arg_23_0.shipDetailView:SetShareData(arg_23_0.shareData)
		arg_23_0.shipFashionView:SetShareData(arg_23_0.shareData)
		arg_23_0.shipEquipView:SetShareData(arg_23_0.shareData)
		arg_23_0.shipEquipView:ActionInvoke("InitEvent")
		arg_23_0.shipHuntingRangeView:SetShareData(arg_23_0.shareData)
		arg_23_0.shipCustomMsgBox:SetShareData(arg_23_0.shareData)
		arg_23_0.shipChangeNameView:SetShareData(arg_23_0.shareData)
	end

	return arg_23_0.shareData
end

function var_0_0.hasFashion(arg_24_0)
	return arg_24_0.shareData:HasFashion()
end

function var_0_0.DisplayRenamePanel(arg_25_0, arg_25_1)
	arg_25_0.shipChangeNameView:Load()
	arg_25_0.shipChangeNameView:ActionInvoke("DisplayRenamePanel", arg_25_1)
end

function var_0_0.init(arg_26_0)
	arg_26_0:initShip()
	arg_26_0:initPages()
	arg_26_0:initEvents()

	arg_26_0.bgEffect = arg_26_0.bgEffect or {}
	arg_26_0.mainCanvasGroup = arg_26_0._tf:GetComponent(typeof(CanvasGroup))
	arg_26_0.commonCanvasGroup = arg_26_0._tf:Find("blur_panel/adapt"):GetComponent(typeof(CanvasGroup))
	Input.multiTouchEnabled = false
end

function var_0_0.initShip(arg_27_0)
	arg_27_0.shipInfo = arg_27_0._tf:Find("main/character")

	setActive(arg_27_0.shipInfo, true)

	arg_27_0.tablePainting = {
		arg_27_0.shipInfo:Find("painting"),
		arg_27_0.shipInfo:Find("painting2")
	}
	arg_27_0.nowPainting = nil
	arg_27_0.isRight = true
	arg_27_0.blurPanel = arg_27_0._tf:Find("blur_panel")
	arg_27_0.common = arg_27_0.blurPanel:Find("adapt")
	arg_27_0.npcFlagTF = arg_27_0.common:Find("name/npc")
	arg_27_0.shipName = arg_27_0.common:Find("name")
	arg_27_0.shipInfoStarTpl = arg_27_0.shipName:Find("star_tpl")
	arg_27_0.nameEditFlag = arg_27_0.shipName:Find("nameRect/editFlag")

	setActive(arg_27_0.shipName, true)
	setActive(arg_27_0.shipInfoStarTpl, false)
	setActive(arg_27_0.nameEditFlag, false)

	arg_27_0.energyTF = arg_27_0.shipName:Find("energy")
	arg_27_0.energyDescTF = arg_27_0.energyTF:Find("desc")
	arg_27_0.energyText = arg_27_0.energyTF:Find("desc/desc")

	setActive(arg_27_0.energyDescTF, false)

	arg_27_0.character = arg_27_0._tf:Find("main/character")
	arg_27_0.chat = arg_27_0._tf:Find("main/character/chat")
	arg_27_0.chatBg = arg_27_0._tf:Find("main/character/chat/chatbgtop")
	arg_27_0.chatText = arg_27_0.chat:Find("Text")
	rtf(arg_27_0.chat).localScale = Vector3.New(0, 0, 1)
	arg_27_0.initChatBgH = arg_27_0.chatBg.sizeDelta.y
	arg_27_0.initChatTextH = arg_27_0.chatText.sizeDelta.y
	arg_27_0.initfontSize = arg_27_0.chatText:GetComponent(typeof(Text)).fontSize
end

function var_0_0.initPages(arg_28_0)
	ShipViewConst.currentPage = nil
	arg_28_0.background = arg_28_0._tf:Find("background")

	setActive(arg_28_0.background, true)

	arg_28_0.main = arg_28_0._tf:Find("main")
	arg_28_0.mainMask = arg_28_0.main:GetComponent(typeof(RectMask2D))
	arg_28_0.toggles = arg_28_0.common:Find("left_length/frame/root")
	arg_28_0.detailToggle = arg_28_0.toggles:Find("detail_toggle")
	arg_28_0.equipmentToggle = arg_28_0.toggles:Find("equpiment_toggle")
	arg_28_0.intensifyToggle = arg_28_0.toggles:Find("intensify_toggle")
	arg_28_0.upgradeToggle = arg_28_0.toggles:Find("upgrade_toggle")
	arg_28_0.remouldToggle = arg_28_0.toggles:Find("remould_toggle")
	arg_28_0.technologyToggle = arg_28_0.toggles:Find("technology_toggle")
	arg_28_0.metaToggle = arg_28_0.toggles:Find("meta_toggle")
	arg_28_0.togglesList = {}
	arg_28_0.togglesList[ShipViewConst.PAGE.DETAIL] = arg_28_0.detailToggle
	arg_28_0.togglesList[ShipViewConst.PAGE.EQUIPMENT] = arg_28_0.equipmentToggle
	arg_28_0.togglesList[ShipViewConst.PAGE.INTENSIFY] = arg_28_0.intensifyToggle
	arg_28_0.togglesList[ShipViewConst.PAGE.UPGRADE] = arg_28_0.upgradeToggle
	arg_28_0.togglesList[ShipViewConst.PAGE.REMOULD] = arg_28_0.remouldToggle
	arg_28_0.detailContainer = arg_28_0.main:Find("detail_container")

	setAnchoredPosition(arg_28_0.detailContainer, {
		x = 1300
	})

	arg_28_0.fashionContainer = arg_28_0.main:Find("fashion_container")

	setAnchoredPosition(arg_28_0.fashionContainer, {
		x = 900
	})

	arg_28_0.equipContainer = arg_28_0.main:Find("equip_container")
	arg_28_0.equipLCon = arg_28_0.equipContainer:Find("equipment_l_container")
	arg_28_0.equipRCon = arg_28_0.equipContainer:Find("equipment_r_container")
	arg_28_0.equipBCon = arg_28_0.equipContainer:Find("equipment_b_container")

	setAnchoredPosition(arg_28_0.equipRCon, {
		x = 750
	})
	setAnchoredPosition(arg_28_0.equipLCon, {
		x = -700
	})
	setAnchoredPosition(arg_28_0.equipBCon, {
		y = -540
	})

	arg_28_0.shipDetailView = ShipDetailView.New(arg_28_0.detailContainer, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.shipFashionView = ShipFashionView.New(arg_28_0.fashionContainer, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.shipEquipView = ShipEquipView.New(arg_28_0.equipContainer, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.shipHuntingRangeView = ShipHuntingRangeView.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.shipCustomMsgBox = ShipCustomMsgBox.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.shipChangeNameView = ShipChangeNameView.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.expItemUsagePage = ShipExpItemUsagePage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)

	for iter_28_0, iter_28_1 in ipairs({
		arg_28_0.shipDetailView,
		arg_28_0.shipFashionView,
		arg_28_0.shipEquipView,
		arg_28_0.shipHuntingRangeView,
		arg_28_0.shipCustomMsgBox,
		arg_28_0.shipChangeNameView,
		arg_28_0.expItemUsagePage
	}) do
		iter_28_1:RegisterView(arg_28_0)
	end

	arg_28_0.viewList = {}
	arg_28_0.viewList[ShipViewConst.PAGE.DETAIL] = arg_28_0.shipDetailView
	arg_28_0.viewList[ShipViewConst.PAGE.FASHION] = arg_28_0.shipFashionView
	arg_28_0.viewList[ShipViewConst.PAGE.EQUIPMENT] = arg_28_0.shipEquipView

	onButton(arg_28_0, arg_28_0.shipName, function()
		if arg_28_0.shipVO.propose and not arg_28_0.shipVO:IsXIdol() then
			if not pg.PushNotificationMgr.GetInstance():isEnableShipName() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_rename_switch_tip"))

				return
			end

			local var_29_0 = arg_28_0.shipVO.renameTime + 2592000 - pg.TimeMgr.GetInstance():GetServerTime()

			if var_29_0 > 0 then
				local var_29_1 = math.floor(var_29_0 / 60 / 60 / 24)

				if var_29_1 < 1 then
					var_29_1 = 1
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("word_rename_time_tip", var_29_1))
			else
				arg_28_0:DisplayRenamePanel(true)
			end
		end
	end, SFX_PANEL)
end

function var_0_0.initEvents(arg_30_0)
	arg_30_0:bind(ShipViewConst.SWITCH_TO_PAGE, function(arg_31_0, arg_31_1)
		arg_30_0:gotoPage(arg_31_1)
	end)
	arg_30_0:bind(ShipViewConst.LOAD_PAINTING, function(arg_32_0, arg_32_1, arg_32_2)
		arg_30_0:loadPainting(arg_32_1, arg_32_2)
	end)
	arg_30_0:bind(ShipViewConst.LOAD_PAINTING_BG, function(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
		arg_30_0:loadSkinBg(arg_33_1, arg_33_2, arg_33_3, arg_30_0.isSpBg)
	end)
	arg_30_0:bind(ShipViewConst.HIDE_SHIP_WORD, function(arg_34_0)
		arg_30_0:hideShipWord()
	end)
	arg_30_0:bind(ShipViewConst.SET_CLICK_ENABLE, function(arg_35_0, arg_35_1)
		arg_30_0.mainCanvasGroup.blocksRaycasts = arg_35_1
		arg_30_0.commonCanvasGroup.blocksRaycasts = arg_35_1
		GetOrAddComponent(arg_30_0.detailContainer, "CanvasGroup").blocksRaycasts = arg_35_1
	end)
	arg_30_0:bind(ShipViewConst.SHOW_CUSTOM_MSG, function(arg_36_0, arg_36_1)
		arg_30_0.shipCustomMsgBox:Load()
		arg_30_0.shipCustomMsgBox:ActionInvoke("showCustomMsgBox", arg_36_1)
	end)
	arg_30_0:bind(ShipViewConst.HIDE_CUSTOM_MSG, function(arg_37_0)
		arg_30_0.shipCustomMsgBox:ActionInvoke("hideCustomMsgBox")
	end)
	arg_30_0:bind(ShipViewConst.DISPLAY_HUNTING_RANGE, function(arg_38_0, arg_38_1)
		if arg_38_1 then
			arg_30_0.shipHuntingRangeView:Load()
			arg_30_0.shipHuntingRangeView:ActionInvoke("DisplayHuntingRange")
		else
			arg_30_0.shipHuntingRangeView:HideHuntingRange()
		end
	end)
	arg_30_0:bind(ShipViewConst.PAINT_VIEW, function(arg_39_0, arg_39_1)
		if arg_39_1 then
			arg_30_0:paintView()
		else
			arg_30_0:hidePaintView(true)
		end
	end)
	arg_30_0:bind(ShipViewConst.SHOW_EXP_ITEM_USAGE, function(arg_40_0, arg_40_1)
		arg_30_0.expItemUsagePage:ExecuteAction("Show", arg_40_1)
	end)
end

function var_0_0.didEnter(arg_41_0)
	arg_41_0:addRingDragListenter()
	onButton(arg_41_0, arg_41_0.common:Find("top/back_btn"), function()
		GetOrAddComponent(arg_41_0._tf, typeof(CanvasGroup)).interactable = false

		if not arg_41_0.everTriggerBack then
			LeanTween.delayedCall(0.3, System.Action(function()
				arg_41_0:closeView()
			end))

			arg_41_0.everTriggerBack = true
		end
	end, SFX_CANCEL)
	onButton(arg_41_0, arg_41_0.npcFlagTF, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_actnpc.tip
		})
	end, SFX_PANEL)

	arg_41_0.helpBtn = arg_41_0.common:Find("help_btn")

	onButton(arg_41_0, arg_41_0.helpBtn, function()
		arg_41_0:openHelpPage(ShipViewConst.currentPage)
	end, SFX_PANEL)

	for iter_41_0, iter_41_1 in pairs(arg_41_0.togglesList) do
		if iter_41_1 == arg_41_0.upgradeToggle or iter_41_1 == arg_41_0.remouldToggle or iter_41_1 == arg_41_0.equipmentToggle then
			onToggle(arg_41_0, iter_41_1, function(arg_46_0)
				if arg_46_0 then
					if LeanTween.isTweening(go(arg_41_0.chat)) then
						LeanTween.cancel(go(arg_41_0.chat))
					end

					rtf(arg_41_0.chat).localScale = Vector3.New(0, 0, 1)
					arg_41_0.chatFlag = false

					arg_41_0:switchToPage(iter_41_0)
				end
			end, SFX_PANEL)
		else
			onToggle(arg_41_0, iter_41_1, function(arg_47_0)
				if arg_47_0 then
					arg_41_0:switchToPage(iter_41_0)
				end
			end, SFX_PANEL)
		end
	end

	onButton(arg_41_0, arg_41_0.technologyToggle, function()
		arg_41_0:emit(ShipMainMediator.ON_TECHNOLOGY, arg_41_0.shipVO)
	end, SFX_PANEL)
	onButton(arg_41_0, arg_41_0.metaToggle, function()
		arg_41_0:emit(ShipMainMediator.ON_META, arg_41_0.shipVO)
	end, SFX_PANEL)
	onButton(arg_41_0, tf(arg_41_0.character), function()
		if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
			arg_41_0:displayShipWord("detail")
		end
	end)
	onButton(arg_41_0, arg_41_0.energyTF, function()
		arg_41_0:showEnergyDesc()
		getProxy(CommanderManualProxy):TaskProgressAdd(2022, 1)
	end)
	arg_41_0:OverlayPanel(arg_41_0.chat, {
		groupDelta = 1
	})
	arg_41_0:OverlayPanel(arg_41_0.blurPanel)

	local var_41_0 = arg_41_0:checkToggleActive(arg_41_0.contextData.page) and arg_41_0.contextData.page or ShipViewConst.PAGE.DETAIL

	arg_41_0:gotoPage(var_41_0)

	if ShipViewConst.currentPage == ShipViewConst.PAGE.DETAIL or var_41_0 == ShipViewConst.PAGE.DETAIL then
		arg_41_0:displayShipWord(arg_41_0:getInitmacyWords())
		arg_41_0:checkMaxLevelHelp()
	end

	arg_41_0:changePaintingSortLayer(true)
end

function var_0_0.openHelpPage(arg_52_0, arg_52_1)
	if arg_52_1 == ShipViewConst.PAGE.EQUIPMENT then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_equip.tip
		})
	elseif arg_52_1 == ShipViewConst.PAGE.DETAIL then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_detail.tip
		})
	elseif arg_52_1 == ShipViewConst.PAGE.INTENSIFY then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_intensify.tip
		})
	elseif arg_52_1 == ShipViewConst.PAGE.UPGRADE then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_upgrate.tip
		})
	elseif arg_52_1 == ShipViewConst.PAGE.FASHION then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_fashion.tip
		})
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_maxlevel.tip
		})
	end
end

function var_0_0.showAwakenCompleteAni(arg_53_0, arg_53_1)
	local function var_53_0()
		arg_53_0.awakenAni:SetActive(true)

		arg_53_0.awakenPlay = true

		onButton(arg_53_0, arg_53_0.awakenAni, function()
			arg_53_0.awakenAni:GetComponent("Animator"):SetBool("endFlag", true)
		end)

		local var_54_0 = tf(arg_53_0.awakenAni)

		pg.UIMgr.GetInstance():BlurPanel(var_54_0)
		setText(var_54_0:Find("window/desc"), arg_53_1)
		var_54_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_56_0)
			arg_53_0.awakenAni:GetComponent("Animator"):SetBool("endFlag", false)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_54_0, arg_53_0.common)
			arg_53_0.awakenAni:SetActive(false)

			arg_53_0.awakenPlay = false
		end)
	end

	local var_53_1 = arg_53_0._tf:Find("AwakenCompleteWindows(Clone)")

	if var_53_1 then
		arg_53_0.awakenAni = go(var_53_1)
	end

	if not arg_53_0.awakenAni then
		PoolMgr.GetInstance():GetUI("AwakenCompleteWindows", true, function(arg_57_0)
			arg_57_0:SetActive(true)

			arg_53_0.awakenAni = arg_57_0

			var_53_0()
		end)
	else
		var_53_0()
	end
end

function var_0_0.updatePreference(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_1:getConfigTable()
	local var_58_1 = arg_58_0.shipVO:getName()

	setScrollText(arg_58_0.shipName:Find("nameRect/name_mask/Text"), var_58_1)
	setText(arg_58_0.shipName:Find("english_name"), var_58_0.english_name)
	setActive(arg_58_0.nameEditFlag, arg_58_1.propose and not arg_58_1:IsXIdol())

	local var_58_2 = GetSpriteFromAtlas("energy", arg_58_1:getEnergyPrint())

	if not var_58_2 then
		warning("找不到疲劳")
	end

	setImageSprite(arg_58_0.energyTF, var_58_2, true)
	setActive(arg_58_0.energyTF, true)

	local var_58_3 = arg_58_0.shipName:Find("stars")

	removeAllChildren(var_58_3)

	local var_58_4 = arg_58_1:getStar()
	local var_58_5 = arg_58_1:getMaxStar()

	for iter_58_0 = 1, var_58_5 do
		local var_58_6 = cloneTplTo(arg_58_0.shipInfoStarTpl, var_58_3, "star_" .. iter_58_0)

		setActive(var_58_6:Find("star_tpl"), iter_58_0 <= var_58_4)
		setActive(var_58_6:Find("empty_star_tpl"), true)
	end

	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
		arg_58_0:loadPainting(arg_58_0.shipVO:getPainting())
		arg_58_0:loadSkinBg(arg_58_0.shipVO:rarity2bgPrintForGet(), arg_58_0.shipVO:isBluePrintShip(), arg_58_0.shipVO:isMetaShip(), arg_58_0.isSpBg)
	end

	local var_58_7 = GetSpriteFromAtlas("shiptype", arg_58_1:getShipType())

	if not var_58_7 then
		warning("找不到船形, shipConfigId: " .. arg_58_1.configId)
	end

	setImageSprite(arg_58_0.shipName:Find("type"), var_58_7, true)
end

function var_0_0.doUpgradeMaxLeveAnim(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	arg_59_0.inUpgradeAnim = true

	arg_59_0.shipDetailView:DoLeveUpAnim(arg_59_1, arg_59_2, function()
		if arg_59_3 then
			arg_59_3()
		end

		arg_59_0.inUpgradeAnim = nil
	end)
end

function var_0_0.addRingDragListenter(arg_61_0)
	local var_61_0 = GetOrAddComponent(arg_61_0._tf, "EventTriggerListener")
	local var_61_1
	local var_61_2 = 0
	local var_61_3

	var_61_0:AddBeginDragFunc(function()
		var_61_2 = 0
		var_61_1 = nil
	end)
	var_61_0:AddDragFunc(function(arg_63_0, arg_63_1)
		if not arg_61_0.inPaintingView then
			local var_63_0 = arg_63_1.position

			if not var_61_1 then
				var_61_1 = var_63_0
			end

			var_61_2 = var_63_0.x - var_61_1.x
		end
	end)
	var_61_0:AddDragEndFunc(function(arg_64_0, arg_64_1)
		if not arg_61_0.inPaintingView then
			if var_61_2 < -50 then
				if not arg_61_0.isLoading then
					arg_61_0:emit(ShipMainMediator.NEXTSHIP, -1)
				end
			elseif var_61_2 > 50 and not arg_61_0.isLoading then
				arg_61_0:emit(ShipMainMediator.NEXTSHIP)
			end
		end
	end)
end

function var_0_0.showEnergyDesc(arg_65_0)
	if arg_65_0.energyTimer then
		return
	end

	setActive(arg_65_0.energyDescTF, true)

	local var_65_0, var_65_1 = arg_65_0.shipVO:getEnergyPrint()

	setText(arg_65_0.energyText, i18n(var_65_1))

	arg_65_0.energyTimer = Timer.New(function()
		setActive(arg_65_0.energyDescTF, false)
		arg_65_0.energyTimer:Stop()

		arg_65_0.energyTimer = nil
	end, 2, 1)

	arg_65_0.energyTimer:Start()
end

function var_0_0.displayShipWord(arg_67_0, arg_67_1, arg_67_2)
	if ShipViewConst.currentPage == ShipViewConst.PAGE.EQUIPMENT or ShipViewConst.currentPage == ShipViewConst.PAGE.UPGRADE then
		rtf(arg_67_0.chat).localScale = Vector3.New(0, 0, 1)

		return
	end

	if arg_67_2 or not arg_67_0.chatFlag then
		arg_67_0.chatFlag = true
		arg_67_0.chat.localScale = Vector3.zero

		setActive(arg_67_0.chat, true)

		arg_67_0.chat.localPosition = Vector3(arg_67_0.character.localPosition.x + 100, arg_67_0.chat.localPosition.y, 0)

		local var_67_0 = arg_67_0.shipVO:getCVIntimacy()

		if findTF(arg_67_0.nowPainting, "fitter").childCount > 0 then
			ShipExpressionHelper.SetExpression(findTF(arg_67_0.nowPainting, "fitter"):GetChild(0), arg_67_0.paintingCode, arg_67_1, var_67_0)
		end

		local var_67_1, var_67_2, var_67_3 = ShipWordHelper.GetWordAndCV(arg_67_0.shipVO:getSkinId(), arg_67_1, nil, nil, var_67_0)
		local var_67_4 = arg_67_0.chatText:GetComponent(typeof(Text))

		if PLATFORM_CODE ~= PLATFORM_US then
			setText(arg_67_0.chatText, SwitchSpecialChar(var_67_3))
		else
			var_67_4.fontSize = arg_67_0.initfontSize

			setTextEN(arg_67_0.chatText, var_67_3)

			while var_67_4.preferredHeight > arg_67_0.initChatTextH do
				var_67_4.fontSize = var_67_4.fontSize - 2

				setTextEN(arg_67_0.chatText, var_67_3)

				if var_67_4.fontSize < 20 then
					break
				end
			end
		end

		if #var_67_4.text > CHAT_POP_STR_LEN then
			var_67_4.alignment = TextAnchor.MiddleLeft
		else
			var_67_4.alignment = TextAnchor.MiddleCenter
		end

		local var_67_5 = var_67_4.preferredHeight + 120

		if var_67_5 > arg_67_0.initChatBgH then
			arg_67_0.chatBg.sizeDelta = Vector2.New(arg_67_0.chatBg.sizeDelta.x, var_67_5)
		else
			arg_67_0.chatBg.sizeDelta = Vector2.New(arg_67_0.chatBg.sizeDelta.x, arg_67_0.initChatBgH)
		end

		local var_67_6 = var_0_4

		local function var_67_7()
			if arg_67_0.chatFlag then
				if arg_67_0.chatani1Id then
					LeanTween.cancel(arg_67_0.chatani1Id)
				end

				if arg_67_0.chatani2Id then
					LeanTween.cancel(arg_67_0.chatani2Id)
				end
			end

			arg_67_0.chatani1Id = LeanTween.scale(rtf(arg_67_0.chat.gameObject), Vector3.New(1, 1, 1), var_0_3):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
				arg_67_0.chatani2Id = LeanTween.scale(rtf(arg_67_0.chat.gameObject), Vector3.New(0, 0, 1), var_0_3):setEase(LeanTweenType.easeInBack):setDelay(var_0_3 + var_67_6):setOnComplete(System.Action(function()
					arg_67_0.chatFlag = nil
				end)).uniqueId
			end)).uniqueId
		end

		if var_67_2 then
			arg_67_0:StopPreVoice()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_67_2, function(arg_71_0)
				if arg_71_0 then
					var_67_6 = arg_71_0:GetLength() * 0.001
				end

				var_67_7()
			end)

			arg_67_0.preVoiceContent = var_67_2
		else
			var_67_7()
		end
	end
end

function var_0_0.StopPreVoice(arg_72_0)
	if arg_72_0.preVoiceContent ~= nil then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_72_0.preVoiceContent)
	end
end

function var_0_0.startChatTimer(arg_73_0)
	if arg_73_0.chatFlag then
		return
	end

	if arg_73_0.chatTimer then
		arg_73_0.chatTimer:Stop()

		arg_73_0.chatTimer = nil
	end

	arg_73_0.chatTimer = Timer.New(function()
		arg_73_0:displayShipWord(arg_73_0:getInitmacyWords())
	end, var_0_6, 1)

	arg_73_0.chatTimer:Start()
end

function var_0_0.hideShipWord(arg_75_0)
	if arg_75_0.chatFlag then
		if arg_75_0.chatani1Id then
			LeanTween.cancel(arg_75_0.chatani1Id)
		end

		if arg_75_0.chatani2Id then
			LeanTween.cancel(arg_75_0.chatani2Id)
		end

		LeanTween.scale(rtf(arg_75_0.chat.gameObject), Vector3.New(0, 0, 1), var_0_3):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function()
			arg_75_0.chatFlag = nil
		end))
	end

	arg_75_0:StopPreVoice()
end

function var_0_0.gotoPage(arg_77_0, arg_77_1)
	if arg_77_1 == ShipViewConst.PAGE.FASHION then
		local function var_77_0()
			arg_77_0:switchToPage(arg_77_1)
		end

		arg_77_0:checkPaintingRes(var_77_0)
	else
		triggerToggle(arg_77_0.togglesList[arg_77_1], true)
	end
end

function var_0_0.switchToPage(arg_79_0, arg_79_1, arg_79_2)
	local function var_79_0(arg_80_0, arg_80_1)
		setActive(arg_79_0.detailContainer, false)

		if arg_80_0 == ShipViewConst.PAGE.DETAIL then
			setActive(arg_79_0.detailContainer, arg_80_1)

			local var_80_0 = arg_80_1 and {
				arg_79_0.detailContainer.rect.width + 200,
				0
			} or {
				0,
				arg_79_0.detailContainer.rect.width + 200
			}

			shiftPanel(arg_79_0.detailContainer, var_80_0[2], 0, var_0_2, 0):setFrom(var_80_0[1])
		elseif arg_80_0 == ShipViewConst.PAGE.EQUIPMENT then
			local var_80_1 = {
				-(arg_79_0.equipLCon.rect.width + 190),
				190
			}
			local var_80_2 = {
				arg_79_0.equipRCon.rect.width,
				10
			}
			local var_80_3 = {
				-arg_79_0.equipBCon.rect.height,
				0
			}
			local var_80_4 = arg_80_1 and 1 or 2
			local var_80_5 = arg_80_1 and 2 or 1

			shiftPanel(arg_79_0.equipLCon, var_80_1[var_80_5], 0, var_0_2, 0):setFrom(var_80_1[var_80_4])
			shiftPanel(arg_79_0.equipRCon, var_80_2[var_80_5], 0, var_0_2, 0):setFrom(var_80_2[var_80_4])
			shiftPanel(arg_79_0.equipBCon, 0, var_80_3[var_80_5], var_0_2, 0):setFrom(var_80_3[var_80_4])
		elseif arg_80_0 == ShipViewConst.PAGE.FASHION then
			local var_80_6 = arg_80_1 and {
				arg_79_0.fashionContainer.rect.width + 150,
				0
			} or {
				0,
				arg_79_0.fashionContainer.rect.width + 150
			}

			shiftPanel(arg_79_0.fashionContainer, var_80_6[2], 0, var_0_2, 0):setFrom(var_80_6[1])

			if arg_80_1 then
				arg_79_0.shipFashionView:ActionInvoke("UpdateFashion")
			end
		elseif arg_80_0 == ShipViewConst.PAGE.INTENSIFY then
			if arg_80_1 then
				arg_79_0:emit(ShipMainMediator.OPEN_INTENSIFY)
			else
				arg_79_0:emit(ShipMainMediator.CLOSE_INTENSIFY)
			end
		elseif arg_80_0 == ShipViewConst.PAGE.UPGRADE then
			if arg_80_1 then
				arg_79_0:emit(ShipMainMediator.ON_UPGRADE)
			else
				arg_79_0:emit(ShipMainMediator.CLOSE_UPGRADE)
			end
		elseif arg_80_0 == ShipViewConst.PAGE.REMOULD then
			if arg_80_1 then
				arg_79_0:emit(ShipMainMediator.OPEN_REMOULD)
			else
				arg_79_0:emit(ShipMainMediator.CLOSE_REMOULD)
			end
		end

		arg_79_0:blurPage(arg_80_0, arg_80_1)

		if arg_80_0 ~= ShipViewConst.PAGE.FASHION then
			arg_79_0.fashionSkinId = arg_79_0.shipVO:getSkinId()

			arg_79_0:loadPainting(arg_79_0.shipVO:getPainting())
		end

		local var_80_7 = not ShipViewConst.IsSubLayerPage(arg_80_0)
		local var_80_8 = arg_79_0.bgEffect and arg_79_0.bgEffect[arg_79_0.shipVO:getRarity()]

		if var_80_8 then
			setActive(var_80_8, arg_80_0 ~= ShipViewConst.PAGE.REMOULD and arg_79_0.shipVO.bluePrintFlag and arg_79_0.shipVO.bluePrintFlag == 0)
			arg_79_0:changePaintingSortLayer(true)
		end

		setActive(arg_79_0.helpBtn, var_80_7)
	end

	function switchHandler()
		if arg_79_1 == ShipViewConst.currentPage and arg_79_2 then
			var_79_0(arg_79_1, true)
		elseif arg_79_1 ~= ShipViewConst.currentPage then
			if ShipViewConst.currentPage then
				var_79_0(ShipViewConst.currentPage, false)
			end

			ShipViewConst.currentPage = arg_79_1
			arg_79_0.contextData.page = arg_79_1

			var_79_0(arg_79_1, true)
			arg_79_0:switchPainting()
		end
	end

	if arg_79_0.viewList[arg_79_1] ~= nil then
		local var_79_1 = arg_79_0.viewList[arg_79_1]

		if not var_79_1:GetLoaded() then
			var_79_1:Load()
			var_79_1:CallbackInvoke(switchHandler)
		else
			switchHandler()
		end
	else
		switchHandler()
	end
end

function var_0_0.blurPage(arg_82_0, arg_82_1, arg_82_2)
	if arg_82_1 == ShipViewConst.PAGE.DETAIL then
		arg_82_0.shipDetailView:ActionInvoke("OnSelected", arg_82_2)
	elseif arg_82_1 == ShipViewConst.PAGE.EQUIPMENT then
		arg_82_0.shipEquipView:ActionInvoke("OnSelected", arg_82_2)
	elseif arg_82_1 == ShipViewConst.PAGE.FASHION then
		arg_82_0.shipFashionView:ActionInvoke("OnSelected", arg_82_2)
	elseif arg_82_1 == ShipViewConst.PAGE.INTENSIFY then
		-- block empty
	elseif arg_82_1 == ShipViewConst.PAGE.UPGRADE then
		-- block empty
	elseif arg_82_1 == ShipViewConst.PAGE.REMOULD then
		-- block empty
	end
end

function var_0_0.switchPainting(arg_83_0)
	setActive(arg_83_0.shipInfo, not ShipViewConst.IsSubLayerPage(ShipViewConst.currentPage))
	setActive(arg_83_0.shipName, not ShipViewConst.IsSubLayerPage(ShipViewConst.currentPage))

	if ShipViewConst.currentPage == ShipViewConst.PAGE.EQUIPMENT then
		shiftPanel(arg_83_0.shipInfo, -20, 0, var_0_2, 0)

		arg_83_0.paintingFrameName = "zhuangbei"
	else
		shiftPanel(arg_83_0.shipInfo, -460, 0, var_0_2, 0)

		arg_83_0.paintingFrameName = "chuanwu"
	end

	local var_83_0 = GetOrAddComponent(findTF(arg_83_0.nowPainting, "fitter"), "PaintingScaler")

	var_83_0:Snapshoot()

	var_83_0.FrameName = arg_83_0.paintingFrameName

	local var_83_1 = LeanTween.value(go(arg_83_0.nowPainting), 0, 1, var_0_2):setOnUpdate(System.Action_float(function(arg_84_0)
		var_83_0.Tween = arg_84_0
		arg_83_0.chat.localPosition = Vector3(arg_83_0.character.localPosition.x + 100, arg_83_0.chat.localPosition.y, 0)
	end)):setEase(LeanTweenType.easeInOutSine)
end

function var_0_0.setPreOrNext(arg_85_0, arg_85_1, arg_85_2)
	if arg_85_1 then
		arg_85_0.isRight = true
	else
		arg_85_0.isRight = false
	end

	if arg_85_0.shipVO:getGroupId() ~= arg_85_2:getGroupId() then
		arg_85_0.switchCnt = (arg_85_0.switchCnt or 0) + 1
	end

	if arg_85_0.switchCnt and arg_85_0.switchCnt >= 10 then
		gcAll()

		arg_85_0.switchCnt = 0
	end
end

function var_0_0.loadPainting(arg_86_0, arg_86_1, arg_86_2)
	local var_86_0 = arg_86_1

	arg_86_1 = MainMeshImagePainting.StaticGetPaintingName(var_86_0)

	if arg_86_0.isLoading == true then
		return
	end

	for iter_86_0, iter_86_1 in pairs(arg_86_0.tablePainting) do
		iter_86_1.localScale = Vector3(1, 1, 1)
	end

	if arg_86_0.LoadShipVOId and not arg_86_2 and arg_86_0.LoadShipVOId == arg_86_0.shipVO.id and arg_86_0.LoadPaintingCode == arg_86_1 and not arg_86_2 then
		return
	end

	local var_86_1 = 0
	local var_86_2 = arg_86_0.isRight and 1800 or -1800
	local var_86_3 = arg_86_0:getPaintingFromTable(false)

	arg_86_0.isLoading = true

	local var_86_4 = arg_86_0.paintingCode
	local var_86_5 = {}

	if var_86_3 then
		table.insert(var_86_5, function(arg_87_0)
			local var_87_0 = var_86_3:GetComponent(typeof(RectTransform))
			local var_87_1 = var_86_3:GetComponent(typeof(CanvasGroup))

			LeanTween.cancel(go(var_87_1))
			LeanTween.alphaCanvas(var_87_1, 0, 0.3):setFrom(1):setUseEstimatedTime(true)
			LeanTween.moveX(var_87_0, -var_86_2, 0.3):setFrom(0):setOnComplete(System.Action(function()
				retPaintingPrefab(var_86_3, var_86_4)
				arg_87_0()
			end))
		end)
	end

	local var_86_6 = arg_86_0:getPaintingFromTable(true)

	arg_86_0.paintingCode = arg_86_1

	if arg_86_0.paintingCode and var_86_6 then
		local var_86_7 = var_86_6:GetComponent(typeof(RectTransform))

		table.insert(var_86_5, function(arg_89_0)
			arg_86_0.nowPainting = var_86_6

			LoadPaintingPrefabAsync(var_86_6, var_86_0, arg_86_0.paintingCode, arg_86_0.paintingFrameName or "chuanwu", function()
				local var_90_0 = arg_86_0.shipVO:getCVIntimacy()
				local var_90_1 = arg_86_0:getInitmacyWords()

				ShipExpressionHelper.SetExpression(findTF(var_86_6, "fitter"):GetChild(0), arg_86_0.paintingCode, var_90_1, var_90_0)
				arg_89_0()
			end)
		end)
		table.insert(var_86_5, function(arg_91_0)
			LeanTween.cancel(go(var_86_7))
			LeanTween.moveX(var_86_7, 0, 0.3):setFrom(var_86_2):setOnComplete(System.Action(arg_91_0))

			local var_91_0 = var_86_6:GetComponent(typeof(CanvasGroup))

			LeanTween.alphaCanvas(var_91_0, 1, 0.3):setFrom(0):setUseEstimatedTime(true)
		end)
	end

	parallelAsync(var_86_5, function()
		arg_86_0.LoadShipVOId = arg_86_0.shipVO.id
		arg_86_0.LoadPaintingCode = arg_86_1
		arg_86_0.isLoading = false
	end)
end

function var_0_0.getPaintingFromTable(arg_93_0, arg_93_1)
	if arg_93_0.tablePainting == nil then
		print("self.tablePainting为空")

		return
	end

	for iter_93_0 = 1, #arg_93_0.tablePainting do
		if findTF(arg_93_0.tablePainting[iter_93_0], "fitter").childCount == 0 then
			if arg_93_1 == true and arg_93_0.tablePainting[iter_93_0] then
				return arg_93_0.tablePainting[iter_93_0]
			end
		elseif arg_93_1 == false and arg_93_0.tablePainting[iter_93_0] then
			return arg_93_0.tablePainting[iter_93_0]
		end
	end
end

function var_0_0.loadSkinBg(arg_94_0, arg_94_1, arg_94_2, arg_94_3, arg_94_4)
	if not arg_94_0.bgEffect then
		arg_94_0.bgEffect = {}
	end

	if arg_94_0.shipSkinBg ~= arg_94_1 or arg_94_0.isDesign ~= arg_94_2 or arg_94_0.isMeta ~= arg_94_3 then
		arg_94_0.shipSkinBg = arg_94_1
		arg_94_0.isDesign = arg_94_2
		arg_94_0.isMeta = arg_94_3

		if arg_94_0.isDesign then
			if arg_94_0.metaBg then
				setActive(arg_94_0.metaBg, false)
			end

			if arg_94_0.bgEffect then
				for iter_94_0, iter_94_1 in pairs(arg_94_0.bgEffect) do
					setActive(iter_94_1, false)
				end
			end

			if arg_94_0.designBg and arg_94_0.designName ~= "raritydesign" .. arg_94_0.shipVO:getRarity() then
				PoolMgr.GetInstance():ReturnUI(arg_94_0.designName, arg_94_0.designBg)

				arg_94_0.designBg = nil
			end

			if not arg_94_0.designBg then
				PoolMgr.GetInstance():GetUI("raritydesign" .. arg_94_0.shipVO:getRarity(), true, function(arg_95_0)
					arg_94_0.designBg = arg_95_0
					arg_94_0.designName = "raritydesign" .. arg_94_0.shipVO:getRarity()

					arg_95_0.transform:SetParent(arg_94_0._tf, false)

					arg_95_0.transform.localPosition = Vector3(1, 1, 1)
					arg_95_0.transform.localScale = Vector3(1, 1, 1)

					arg_95_0.transform:SetSiblingIndex(1)
					setActive(arg_95_0, true)
				end)
			else
				setActive(arg_94_0.designBg, true)
			end
		elseif arg_94_0.isMeta then
			if arg_94_0.designBg then
				setActive(arg_94_0.designBg, false)
			end

			if arg_94_0.metaBg and arg_94_0.metaName ~= "raritymeta" .. arg_94_0.shipVO:getRarity() then
				PoolMgr.GetInstance():ReturnUI(arg_94_0.metaName, arg_94_0.metaBg)

				arg_94_0.metaBg = nil
			end

			if not arg_94_0.metaBg then
				PoolMgr.GetInstance():GetUI("raritymeta" .. arg_94_0.shipVO:getRarity(), true, function(arg_96_0)
					arg_94_0.metaBg = arg_96_0
					arg_94_0.metaName = "raritymeta" .. arg_94_0.shipVO:getRarity()

					arg_96_0.transform:SetParent(arg_94_0._tf, false)

					arg_96_0.transform.localPosition = Vector3(1, 1, 1)
					arg_96_0.transform.localScale = Vector3(1, 1, 1)

					arg_96_0.transform:SetSiblingIndex(1)
					setActive(arg_96_0, true)
				end)
			else
				setActive(arg_94_0.metaBg, true)
			end
		else
			if arg_94_0.designBg then
				setActive(arg_94_0.designBg, false)
			end

			if arg_94_0.metaBg then
				setActive(arg_94_0.metaBg, false)
			end

			for iter_94_2 = 1, 5 do
				local var_94_0 = arg_94_0.shipVO:getRarity()

				if arg_94_0.bgEffect[iter_94_2] then
					setActive(arg_94_0.bgEffect[iter_94_2], iter_94_2 == var_94_0 and ShipViewConst.currentPage ~= ShipViewConst.PAGE.REMOULD and not arg_94_4)
				elseif var_94_0 > 2 and var_94_0 == iter_94_2 and not arg_94_4 then
					PoolMgr.GetInstance():GetUI("al_bg02_" .. var_94_0 - 1, true, function(arg_97_0)
						arg_94_0.bgEffect[iter_94_2] = arg_97_0

						arg_97_0.transform:SetParent(arg_94_0._tf, false)

						arg_97_0.transform.localPosition = Vector3(0, 0, 0)
						arg_97_0.transform.localScale = Vector3(1, 1, 1)

						arg_97_0.transform:SetSiblingIndex(1)
						setActive(arg_97_0, not ShipViewConst.IsSubLayerPage(ShipViewConst.currentPage))
					end)
				end

				arg_94_0:changePaintingSortLayer(true)
			end
		end

		GetSpriteFromAtlasAsync("bg/star_level_bg_" .. arg_94_1, "", function(arg_98_0)
			if not arg_94_0.exited and arg_94_0.shipSkinBg == arg_94_1 then
				setImageSprite(arg_94_0.background, arg_98_0)
			end
		end)
	end
end

function var_0_0.changePaintingSortLayer(arg_99_0, arg_99_1)
	local var_99_0
	local var_99_1 = arg_99_1 and 12 or -1

	for iter_99_0, iter_99_1 in ipairs(arg_99_0.tablePainting) do
		GetComponent(iter_99_1, typeof(Canvas)).sortingOrder = var_99_1
	end

	if arg_99_1 then
		local var_99_2 = arg_99_0.shipVO:getRarity()

		if arg_99_0.isDesign and arg_99_0.designBg then
			setActive(arg_99_0.designBg, true)
		elseif arg_99_0.bgEffect and var_99_2 and arg_99_0.bgEffect[var_99_2] then
			setActive(arg_99_0.bgEffect[var_99_2], true)
		end
	else
		if arg_99_0.designBg then
			setActive(arg_99_0.designBg, false)
		end

		if arg_99_0.bgEffect then
			for iter_99_2, iter_99_3 in pairs(arg_99_0.bgEffect) do
				setActive(iter_99_3, false)
			end
		end
	end
end

function var_0_0.getInitmacyWords(arg_100_0)
	local var_100_0 = arg_100_0.shipVO:getIntimacyLevel()
	local var_100_1 = Mathf.Clamp(var_100_0, 1, 5)

	return "feeling" .. var_100_1
end

function var_0_0.paintView(arg_101_0)
	if LeanTween.isTweening(arg_101_0.chat.gameObject) then
		LeanTween.cancel(arg_101_0.chat.gameObject)

		arg_101_0.chat.localScale = Vector3(0, 0, 0)
		arg_101_0.chatFlag = nil
	end

	arg_101_0.character:GetComponent("Image").enabled = false
	arg_101_0.inPaintingView = true

	local var_101_0 = {}
	local var_101_1 = arg_101_0._tf.childCount
	local var_101_2 = 0

	while var_101_2 < var_101_1 do
		local var_101_3 = arg_101_0._tf:GetChild(var_101_2)

		if var_101_3.gameObject.activeSelf and var_101_3 ~= arg_101_0.main and var_101_3 ~= arg_101_0.background then
			var_101_0[#var_101_0 + 1] = var_101_3

			setActive(var_101_3, false)
		end

		var_101_2 = var_101_2 + 1
	end

	local var_101_4 = arg_101_0.main.childCount
	local var_101_5 = 0

	while var_101_5 < var_101_4 do
		local var_101_6 = arg_101_0.main:GetChild(var_101_5)

		if var_101_6.gameObject.activeSelf and var_101_6 ~= arg_101_0.shipInfo then
			var_101_0[#var_101_0 + 1] = var_101_6

			setActive(var_101_6, false)
		end

		var_101_5 = var_101_5 + 1
	end

	arg_101_0.shipDetailView:Hide()
	setActive(arg_101_0.blurPanel, false)
	setActive(pg.playerResUI._go, false)

	var_101_0[#var_101_0 + 1] = arg_101_0.chat

	openPortrait()
	setActive(arg_101_0.common, false)

	arg_101_0.mainMask.enabled = false

	arg_101_0.mainMask:PerformClipping()

	local var_101_7 = arg_101_0.nowPainting
	local var_101_8 = var_101_7.anchoredPosition.x
	local var_101_9 = var_101_7.anchoredPosition.y
	local var_101_10 = var_101_7.rect.width
	local var_101_11 = var_101_7.rect.height
	local var_101_12 = arg_101_0._tf.rect.width / UnityEngine.Screen.width
	local var_101_13 = arg_101_0._tf.rect.height / UnityEngine.Screen.height
	local var_101_14 = var_101_10 / 2
	local var_101_15 = var_101_11 / 2
	local var_101_16
	local var_101_17
	local var_101_18 = GetOrAddComponent(arg_101_0.background, "PinchZoom")
	local var_101_19 = GetOrAddComponent(arg_101_0.background, "EventTriggerListener")
	local var_101_20 = true
	local var_101_21 = false

	var_101_19:AddPointDownFunc(function(arg_102_0)
		if Input.touchCount == 1 or IsUnityEditor then
			var_101_21 = true
			var_101_20 = true
		elseif Input.touchCount >= 2 then
			var_101_20 = false
			var_101_21 = false
		end
	end)
	var_101_19:AddPointUpFunc(function(arg_103_0)
		if Input.touchCount <= 2 then
			var_101_20 = true
		end
	end)
	var_101_19:AddBeginDragFunc(function(arg_104_0, arg_104_1)
		var_101_21 = false
		var_101_16 = arg_104_1.position.x * var_101_12 - var_101_14 - tf(arg_101_0.nowPainting).localPosition.x
		var_101_17 = arg_104_1.position.y * var_101_13 - var_101_15 - tf(arg_101_0.nowPainting).localPosition.y
	end)
	var_101_19:AddDragFunc(function(arg_105_0, arg_105_1)
		if var_101_18.processing then
			return
		end

		if var_101_20 then
			local var_105_0 = tf(arg_101_0.nowPainting).localPosition

			tf(arg_101_0.nowPainting).localPosition = Vector3(arg_105_1.position.x * var_101_12 - var_101_14 - var_101_16, arg_105_1.position.y * var_101_13 - var_101_15 - var_101_17, -22)
		end
	end)
	onButton(arg_101_0, arg_101_0.background, function()
		arg_101_0:hidePaintView()
	end, SFX_CANCEL)

	function var_0_0.hidePaintView(arg_107_0, arg_107_1)
		if not arg_107_1 and not var_101_21 then
			return
		end

		arg_107_0.character:GetComponent("Image").enabled = true
		Input.multiTouchEnabled = false

		setActive(arg_107_0.common, true)
		SwitchPanel(arg_107_0.shipInfo, -460, nil, var_0_2 * 2)

		var_101_19.enabled = false
		var_101_18.enabled = false
		arg_107_0.character.localScale = Vector3.one

		arg_107_0.shipDetailView:Show()
		setActive(arg_107_0.blurPanel, true)
		setActive(pg.playerResUI._go, true)

		for iter_107_0, iter_107_1 in ipairs(var_101_0) do
			setActive(iter_107_1, true)
		end

		closePortrait()

		arg_107_0.nowPainting.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(arg_107_0.nowPainting, {
			x = var_101_8,
			y = var_101_9
		})

		arg_107_0.background:GetComponent("Button").enabled = false
		arg_107_0.nowPainting:GetComponent("CanvasGroup").blocksRaycasts = true
		arg_107_0.mainMask.enabled = true

		arg_107_0.mainMask:PerformClipping()

		arg_107_0.inPaintingView = false
	end

	SwitchPanel(arg_101_0.shipInfo, var_0_1, nil, var_0_2 * 2):setOnComplete(System.Action(function()
		var_101_18.enabled = true
		var_101_19.enabled = true
		arg_101_0.background:GetComponent("Button").enabled = true
		arg_101_0.nowPainting:GetComponent("CanvasGroup").blocksRaycasts = false
	end))
end

function var_0_0.onBackPressed(arg_109_0)
	if arg_109_0.inUpgradeAnim then
		return
	end

	if arg_109_0.awakenPlay then
		return
	end

	if arg_109_0.shipChangeNameView.isOpenRenamePanel then
		arg_109_0.shipChangeNameView:ActionInvoke("DisplayRenamePanel", false)

		return
	end

	if arg_109_0.shipCustomMsgBox.isShowCustomMsgBox then
		arg_109_0.shipCustomMsgBox:ActionInvoke("hideCustomMsgBox")

		return
	end

	if arg_109_0.shipHuntingRangeView.onSelected then
		arg_109_0.shipHuntingRangeView:ActionInvoke("HideHuntingRange")

		return
	end

	if arg_109_0.inPaintingView then
		arg_109_0:hidePaintView(true)

		return
	end

	if arg_109_0.expItemUsagePage and arg_109_0.expItemUsagePage:GetLoaded() and arg_109_0.expItemUsagePage:isShowing() then
		arg_109_0.expItemUsagePage:Hide()

		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_109_0.common:Find("top/back_btn"))
end

function var_0_0.willExit(arg_110_0)
	Input.multiTouchEnabled = true

	arg_110_0:UnOverlayPanel(arg_110_0.chat, arg_110_0.character)
	arg_110_0:blurPage(ShipViewConst.currentPage)
	setActive(arg_110_0.background, false)

	if arg_110_0.designBg then
		PoolMgr.GetInstance():ReturnUI(arg_110_0.designName, arg_110_0.designBg)
	end

	if arg_110_0.metaBg then
		PoolMgr.GetInstance():ReturnUI(arg_110_0.metaName, arg_110_0.metaBg)
	end

	arg_110_0.intensifyToggle:GetComponent("Toggle").onValueChanged:RemoveAllListeners()
	arg_110_0.upgradeToggle:GetComponent("Toggle").onValueChanged:RemoveAllListeners()
	LeanTween.cancel(arg_110_0.chat.gameObject)

	if arg_110_0.paintingCode then
		for iter_110_0 = 1, #arg_110_0.tablePainting do
			local var_110_0 = go(arg_110_0.tablePainting[iter_110_0])

			if LeanTween.isTweening(var_110_0) then
				LeanTween.cancel(go(var_110_0))
			end
		end

		retPaintingPrefab(arg_110_0.nowPainting, arg_110_0.paintingCode)
	end

	arg_110_0.shipDetailView:Destroy()
	arg_110_0.shipFashionView:Destroy()
	arg_110_0.shipEquipView:Destroy()
	arg_110_0.shipHuntingRangeView:Destroy()
	arg_110_0.shipCustomMsgBox:Destroy()
	arg_110_0.shipChangeNameView:Destroy()
	clearImageSprite(arg_110_0.background)

	if arg_110_0.energyTimer then
		arg_110_0.energyTimer:Stop()

		arg_110_0.energyTimer = nil
	end

	if arg_110_0.chatTimer then
		arg_110_0.chatTimer:Stop()

		arg_110_0.chatTimer = nil
	end

	arg_110_0:StopPreVoice()
	cameraPaintViewAdjust(false)

	if arg_110_0.tweens then
		cancelTweens(arg_110_0.tweens)
	end

	arg_110_0:UnOverlayPanel(arg_110_0.blurPanel, arg_110_0._tf)

	arg_110_0.shareData = nil
end

function var_0_0.RefreshShipExpItemUsagePage(arg_111_0)
	if arg_111_0.expItemUsagePage and arg_111_0.expItemUsagePage:GetLoaded() and arg_111_0.expItemUsagePage:isShowing() then
		arg_111_0.expItemUsagePage:Flush(arg_111_0.shipVO)
	end
end

function var_0_0.OnWillLogout(arg_112_0)
	if arg_112_0.inPaintingView then
		arg_112_0:hidePaintView(true)
	end
end

function var_0_0.checkPaintingRes(arg_113_0, arg_113_1)
	local var_113_0 = PaintingGroupConst.GetPaintingNameListByShipVO(arg_113_0.shipVO)
	local var_113_1 = {
		isShowBox = true,
		paintingNameList = var_113_0,
		finishFunc = arg_113_1
	}

	PaintingGroupConst.PaintingDownload(var_113_1)
end

return var_0_0
