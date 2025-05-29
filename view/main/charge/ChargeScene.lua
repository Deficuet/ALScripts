local var_0_0 = class("ChargeScene", import("...base.BaseUI"))

var_0_0.TYPE_DIAMOND = 1
var_0_0.TYPE_GIFT = 2
var_0_0.TYPE_ITEM = 3
var_0_0.TYPE_PICK = 4

function var_0_0.getUIName(arg_1_0)
	return "ChargeShopUI"
end

function var_0_0.onBackPressed(arg_2_0)
	arg_2_0:closeView()
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(ShopsProxy)

	local function var_3_1()
		local var_4_0 = var_3_0:getFirstChargeList()
		local var_4_1 = var_3_0:getChargedList()
		local var_4_2 = var_3_0:GetNormalList()
		local var_4_3 = var_3_0:GetNormalGroupList()

		if var_4_0 then
			arg_3_0:setFirstChargeIds(var_4_0)
		end

		if var_4_1 then
			arg_3_0:setChargedList(var_4_1)
		end

		if var_4_2 then
			arg_3_0:setNormalList(var_4_2)
		end

		if var_4_3 then
			arg_3_0:setNormalGroupList(var_4_3)
		end

		arg_3_1()
	end

	if var_3_0:ShouldRefreshChargeList() then
		pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
			callback = var_3_1
		})
	else
		var_3_1()
	end
end

function var_0_0.setPlayer(arg_5_0, arg_5_1)
	arg_5_0.player = arg_5_1
end

function var_0_0.setFirstChargeIds(arg_6_0, arg_6_1)
	arg_6_0.firstChargeIds = arg_6_1
end

function var_0_0.setChargedList(arg_7_0, arg_7_1)
	arg_7_0.chargedList = arg_7_1
end

function var_0_0.setNormalList(arg_8_0, arg_8_1)
	arg_8_0.normalList = arg_8_1
end

function var_0_0.setNormalGroupList(arg_9_0, arg_9_1)
	arg_9_0.normalGroupList = arg_9_1

	arg_9_0:addRefreshTimer(GetZeroTime())
end

function var_0_0.ResUISettings(arg_10_0)
	return true
end

function var_0_0.init(arg_11_0)
	arg_11_0.blurPanel = arg_11_0:findTF("blur_panel")
	arg_11_0.top = arg_11_0:findTF("adapt/top", arg_11_0.blurPanel)
	arg_11_0.frame = arg_11_0:findTF("frame")
	arg_11_0.viewContainer = arg_11_0:findTF("viewContainer")
	arg_11_0.bg = arg_11_0:findTF("viewContainer/bg")
	arg_11_0.painting = arg_11_0:findTF("frame/painting")
	arg_11_0.chat = arg_11_0:findTF("viewContainer/chat")
	arg_11_0.chatText = arg_11_0:findTF("Text", arg_11_0.chat)
	arg_11_0.switchBtn = arg_11_0:findTF("blur_panel/adapt/switch_btn")
	arg_11_0.skinShopBtn = arg_11_0:findTF("blur_panel/adapt/skin_btn")

	local var_11_0 = LOCK_SKIN_SHOP_ENTER and getProxy(PlayerProxy):getData().level < LOCK_SKIN_SHOP_ENTER_LEVEL

	setActive(arg_11_0.skinShopBtn, not var_11_0)

	arg_11_0.itemToggle = arg_11_0:findTF("toggle_list/item_toggle", arg_11_0.viewContainer)
	arg_11_0.giftToggle = arg_11_0:findTF("toggle_list/gift_toggle", arg_11_0.viewContainer)
	arg_11_0.diamondToggle = arg_11_0:findTF("toggle_list/diamond_toggle", arg_11_0.viewContainer)
	arg_11_0.giftTip = arg_11_0:findTF("tip", arg_11_0.giftToggle)
	arg_11_0.pickToggle = arg_11_0:findTF("toggle_list/pick_toggle", arg_11_0.viewContainer)
	arg_11_0.pickTip = arg_11_0:findTF("tip", arg_11_0.pickToggle)
	arg_11_0.chargeTipWindow = ChargeTipWindow.New(arg_11_0._tf, arg_11_0.event)

	local var_11_1 = arg_11_0:findTF("light/title", arg_11_0.diamondToggle)
	local var_11_2 = arg_11_0:findTF("dark/title", arg_11_0.diamondToggle)
	local var_11_3 = arg_11_0:findTF("light/title", arg_11_0.giftToggle)
	local var_11_4 = arg_11_0:findTF("dark/title", arg_11_0.giftToggle)
	local var_11_5 = arg_11_0:findTF("light/title", arg_11_0.itemToggle)
	local var_11_6 = arg_11_0:findTF("dark/title", arg_11_0.itemToggle)
	local var_11_7 = arg_11_0:findTF("light/title", arg_11_0.pickToggle)
	local var_11_8 = arg_11_0:findTF("dark/title", arg_11_0.pickToggle)

	setText(var_11_1, i18n("shop_diamond_title"))
	setText(var_11_2, i18n("shop_diamond_title"))
	setText(var_11_3, i18n("shop_gift_title"))
	setText(var_11_4, i18n("shop_gift_title"))
	setText(var_11_5, i18n("shop_item_title"))
	setText(var_11_6, i18n("shop_item_title"))
	setText(var_11_7, i18n("shop_akashi_pick_title"))
	setText(var_11_8, i18n("shop_akashi_pick_title"))

	arg_11_0.linkTitle = {
		arg_11_0:findTF("title/title_diamond", arg_11_0.top),
		arg_11_0:findTF("title/title_gift", arg_11_0.top),
		arg_11_0:findTF("title/title_item", arg_11_0.top),
		arg_11_0:findTF("title/title_pick", arg_11_0.top)
	}
	arg_11_0.toggleList = {
		arg_11_0.diamondToggle,
		arg_11_0.giftToggle,
		arg_11_0.itemToggle,
		arg_11_0.pickToggle
	}

	arg_11_0:createLive2D()

	arg_11_0.live2dTimer = Timer.New(function()
		local var_12_0 = pg.ChargeShipTalkInfo.Actions
		local var_12_1 = var_12_0[math.random(#var_12_0)]

		if arg_11_0:checkBuyDone(var_12_1.action) then
			arg_11_0:displayShipWord(nil, false, var_12_1.dialog_index)
		end
	end, 20, -1)

	arg_11_0.live2dTimer:Start()
	arg_11_0:jpUIInit()
	arg_11_0:blurView()
	arg_11_0:initSubView()
end

function var_0_0.didEnter(arg_13_0)
	setActive(arg_13_0.chat, false)
	onButton(arg_13_0, arg_13_0:findTF("back_button", arg_13_0.top), function()
		arg_13_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0.painting, function()
		arg_13_0:displayShipWord()
		arg_13_0:emit(ChargeMediator.CLICK_MING_SHI)
	end, SFX_PANEL)

	for iter_13_0 = 1, #arg_13_0.toggleList do
		local var_13_0 = arg_13_0.toggleList[iter_13_0]

		onToggle(arg_13_0, var_13_0, function(arg_16_0)
			local var_16_0 = arg_13_0:findTF("dark", var_13_0)

			setActive(var_16_0, not arg_16_0)

			if arg_16_0 then
				arg_13_0:switchSubView(iter_13_0)
			end
		end, SFX_PANEL)
	end

	onButton(arg_13_0, arg_13_0.switchBtn, function()
		arg_13_0:emit(ChargeMediator.SWITCH_TO_SHOP, {
			warp = NewShopsScene.TYPE_SHOP_STREET
		})
		arg_13_0:stopCV()
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.skinShopBtn, function()
		arg_13_0:emit(ChargeMediator.ON_SKIN_SHOP)
	end, SFX_PANEL)
	arg_13_0:updateNoRes()

	if arg_13_0.contextData.wrap ~= nil then
		arg_13_0:switchSubViewByTogger(arg_13_0.contextData.wrap)

		arg_13_0.contextData.wrap = nil
	else
		arg_13_0:switchSubViewByTogger(ChargeScene.TYPE_DIAMOND)
	end

	arg_13_0:jpUIEnter()
end

function var_0_0.OnChargeSuccess(arg_19_0, arg_19_1)
	arg_19_0.chargeTipWindow:ExecuteAction("Show", arg_19_1)
end

function var_0_0.willExit(arg_20_0)
	arg_20_0:unBlurView()

	if arg_20_0.chargeTipWindow then
		arg_20_0.chargeTipWindow:Destroy()

		arg_20_0.chargeTipWindow = nil
	end

	if arg_20_0.heartsTimer then
		arg_20_0.heartsTimer:Stop()

		arg_20_0.heartsTimer = nil
	end

	if arg_20_0.live2dChar then
		arg_20_0.live2dChar:Dispose()
	end

	if arg_20_0.live2dTimer then
		arg_20_0.live2dTimer:Stop()

		arg_20_0.live2dTimer = nil
	end

	if arg_20_0.giftShopView then
		arg_20_0.giftShopView:OnDestroy()
	end

	arg_20_0:stopCV()
end

function var_0_0.initSubView(arg_21_0)
	arg_21_0.subViewContainer = arg_21_0:findTF("SubView", arg_21_0.viewContainer)
	arg_21_0.diamondShopView = ChargeDiamondShopView.New(arg_21_0.subViewContainer, arg_21_0.event, arg_21_0.contextData)
	arg_21_0.giftShopView = ChargeGiftShopView.New(arg_21_0.subViewContainer, arg_21_0.event, arg_21_0.contextData)
	arg_21_0.itemShopView = ChargeItemShopView.New(arg_21_0.subViewContainer, arg_21_0.event, arg_21_0.contextData)
	arg_21_0.pickShopView = ChargePickShopView.New(arg_21_0.subViewContainer, arg_21_0.event, arg_21_0.contextData)
	arg_21_0.curSubViewNum = 0
	arg_21_0.subViewList = {
		[ChargeScene.TYPE_DIAMOND] = arg_21_0.diamondShopView,
		[ChargeScene.TYPE_GIFT] = arg_21_0.giftShopView,
		[ChargeScene.TYPE_ITEM] = arg_21_0.itemShopView,
		[ChargeScene.TYPE_PICK] = arg_21_0.pickShopView
	}
end

function var_0_0.switchSubView(arg_22_0, arg_22_1)
	if arg_22_1 == arg_22_0.curSubViewNum then
		return
	end

	arg_22_0.subViewList[arg_22_1]:setGoodData(arg_22_0.firstChargeIds, arg_22_0.chargedList, arg_22_0.normalList, arg_22_0.normalGroupList)
	arg_22_0.subViewList[arg_22_1]:Reset()
	arg_22_0.subViewList[arg_22_1]:Load()

	local var_22_0 = arg_22_0.subViewList[arg_22_0.curSubViewNum]

	if var_22_0 then
		var_22_0:Destroy()
	end

	arg_22_0.curSubViewNum = arg_22_1

	if PLATFORM_CODE == PLATFORM_JP then
		setActive(arg_22_0.userAgreeBtn3, arg_22_1 == var_0_0.TYPE_DIAMOND)
		setActive(arg_22_0.userAgreeBtn4, arg_22_1 == var_0_0.TYPE_DIAMOND)
	end

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.linkTitle) do
		setActive(iter_22_1, iter_22_0 == arg_22_1)
	end
end

function var_0_0.switchSubViewByTogger(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.toggleList[arg_23_1]

	triggerToggle(var_23_0, true)
end

function var_0_0.updateCurSubView(arg_24_0)
	local var_24_0 = arg_24_0.subViewList[arg_24_0.curSubViewNum]

	var_24_0:setGoodData(arg_24_0.firstChargeIds, arg_24_0.chargedList, arg_24_0.normalList, arg_24_0.normalGroupList)
	var_24_0:reUpdateAll()
end

function var_0_0.updateNoRes(arg_25_0, arg_25_1)
	if not arg_25_1 then
		arg_25_1 = arg_25_0.contextData.noRes
	else
		arg_25_0.contextData.noRes = arg_25_1
	end

	if not arg_25_1 or #arg_25_1 <= 0 then
		return
	end

	arg_25_0.contextData.noRes = {}

	local var_25_0 = getProxy(BagProxy):getData()
	local var_25_1 = ""

	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		if iter_25_1[2] > 0 then
			if iter_25_1[1] == 59001 then
				arg_25_1[iter_25_0][2] = iter_25_1[3] - arg_25_0.player.gold
			else
				arg_25_1[iter_25_0][2] = iter_25_1[3] - (var_25_0[iter_25_1[1]] and var_25_0[iter_25_1[1]].count or 0)
			end
		end

		if arg_25_1[iter_25_0][2] > 0 then
			table.insert(arg_25_0.contextData.noRes, arg_25_1[iter_25_0])
		end
	end

	for iter_25_2, iter_25_3 in ipairs(arg_25_0.contextData.noRes) do
		local var_25_2 = Item.getConfigData(iter_25_3[1]).name

		var_25_1 = var_25_1 .. i18n(iter_25_3[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_25_2, iter_25_3[2])

		if iter_25_2 < #arg_25_0.contextData.noRes then
			var_25_1 = var_25_1 .. i18n("text_noRes_info_tip_link")
		end
	end

	if var_25_1 == "" then
		arg_25_0:displayShipWord(i18n("text_shop_enoughRes_tip"), false)
	else
		arg_25_0:displayShipWord(i18n("text_shop_noRes_tip", var_25_1), true)
	end
end

function var_0_0.displayShipWord(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	if not arg_26_0.chatFlag then
		if not arg_26_1 and arg_26_0.contextData.noRes and #arg_26_0.contextData.noRes > 0 then
			setActive(arg_26_0.chat, false)

			arg_26_0.chat.transform.localScale = Vector3(0, 0, 1)
		end

		arg_26_0.chatFlag = true

		if not arg_26_0.isInitChatPosition then
			arg_26_0.isInitChatPosition = true

			arg_26_0:InitChatPosition()
		end

		setActive(arg_26_0.chat, true)

		local var_26_0 = arg_26_0.player:getChargeLevel()
		local var_26_1 = arg_26_3 or math.random(1, var_26_0)
		local var_26_2

		if arg_26_3 then
			var_26_2 = pg.pay_level_award[var_26_1].dialog
		else
			var_26_2 = arg_26_1 or pg.pay_level_award[var_26_1].dialog
		end

		if not arg_26_1 then
			arg_26_0:playCV(var_26_1)
		end

		setText(arg_26_0.chatText, var_26_2)

		local var_26_3 = arg_26_0.chatText:GetComponent(typeof(Text))

		if #var_26_3.text > CHAT_POP_STR_LEN_SHORT then
			var_26_3.alignment = TextAnchor.MiddleLeft
		else
			var_26_3.alignment = TextAnchor.MiddleCenter
		end

		;(function()
			local var_27_0 = 3
			local var_27_1 = 0.3

			LeanTween.scale(rtf(arg_26_0.chat.gameObject), Vector3.New(1, 1, 1), var_27_1):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
				if not arg_26_2 then
					LeanTween.scale(rtf(arg_26_0.chat.gameObject), Vector3.New(0, 0, 1), var_27_1):setEase(LeanTweenType.easeInBack):setDelay(var_27_1 + var_27_0):setOnComplete(System.Action(function()
						arg_26_0.chatFlag = nil

						setActive(arg_26_0.chat, false)

						if arg_26_0.contextData.noRes and #arg_26_0.contextData.noRes > 0 then
							arg_26_0:updateNoRes()
						end
					end))
				else
					arg_26_0.chatFlag = nil
				end
			end))
		end)()
	end
end

function var_0_0.InitChatPosition(arg_30_0)
	local var_30_0 = arg_30_0.painting.localPosition + Vector3(-21, -176, 0)
	local var_30_1 = arg_30_0.painting.parent:TransformPoint(var_30_0)
	local var_30_2 = arg_30_0.chat.parent:InverseTransformPoint(var_30_1)

	arg_30_0.chat.localPosition = Vector3(var_30_2.x, var_30_2.y, 0)
end

function var_0_0.playHeartEffect(arg_31_0)
	if arg_31_0.heartsTimer then
		arg_31_0.heartsTimer:Stop()
	end

	local var_31_0 = arg_31_0.painting:Find("heartsfly")

	setActive(var_31_0, true)

	arg_31_0.heartsTimer = Timer.New(function()
		setActive(var_31_0, false)
	end, 1, 1)

	arg_31_0.heartsTimer:Start()
end

function var_0_0.createLive2D(arg_33_0)
	local var_33_0 = Live2D.GenerateData({
		ship = Ship.New({
			configId = 312011
		}),
		scale = Vector3(75, 75, 75),
		position = Vector3(0, 0, 0),
		parent = arg_33_0:findTF("frame/painting/live2d")
	})

	arg_33_0.live2dChar = Live2D.New(var_33_0, function(arg_34_0)
		arg_34_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
	end)
end

function var_0_0.checkBuyDone(arg_35_0, arg_35_1)
	if not arg_35_0.live2dChar or arg_35_0.live2dChar:IsLoaded() then
		return
	end

	local var_35_0

	if type(arg_35_1) == "string" then
		if arg_35_1 == "damonds" then
			var_35_0 = "diamond"
		else
			var_35_0 = arg_35_1
		end
	else
		local var_35_1 = pg.shop_template[arg_35_1]

		if var_35_1 and var_35_1.effect_args and type(var_35_1.effect_args) == "table" then
			for iter_35_0, iter_35_1 in ipairs(var_35_1.effect_args) do
				if iter_35_1 == 1 then
					var_35_0 = "gold"
				end
			end
		end
	end

	local var_35_2 = arg_35_0.preAniName == "gold" or arg_35_0.preAniName == "diamond"
	local var_35_3 = var_35_0 == "gold" or var_35_0 == "diamond"
	local var_35_4 = var_35_2 and var_35_3 or not var_35_2

	var_35_4 = var_35_0 and arg_35_0.preAniName ~= var_35_0 and var_35_4

	if var_35_4 then
		arg_35_0.preAniName = var_35_0

		arg_35_0.live2dChar:TriggerAction(var_35_0, nil, true)
	end

	return var_35_4
end

function var_0_0.playCV(arg_36_0, arg_36_1)
	local var_36_0 = pg.pay_level_award[arg_36_1]
	local var_36_1

	if var_36_0 and var_36_0.cv_key ~= "" then
		var_36_1 = "event:/cv/chargeShop/" .. var_36_0.cv_key
	end

	if var_36_1 then
		arg_36_0:stopCV()

		arg_36_0._currentVoice = var_36_1

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_36_1)
	end
end

function var_0_0.stopCV(arg_37_0)
	if arg_37_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_37_0._currentVoice)
	end

	arg_37_0._currentVoice = nil
end

function var_0_0.blurView(arg_38_0)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_38_0.viewContainer, {
		pbList = {
			arg_38_0:findTF("blurBg", arg_38_0.viewContainer)
		}
	})
end

function var_0_0.unBlurView(arg_39_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_39_0.viewContainer, arg_39_0.frame)
end

function var_0_0.jpUIInit(arg_40_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	arg_40_0.userAgreeBtn3 = arg_40_0:findTF("frame/raw1Btn")
	arg_40_0.userAgreeBtn4 = arg_40_0:findTF("frame/raw2Btn")
end

function var_0_0.jpUIEnter(arg_41_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	onButton(arg_41_0, arg_41_0.userAgreeBtn3, function()
		local var_42_0 = require("ShareCfg.UserAgreement3")

		arg_41_0:emit(ChargeMediator.OPEN_USER_AGREE, var_42_0 or "")
	end, SFX_PANEL)
	onButton(arg_41_0, arg_41_0.userAgreeBtn4, function()
		local var_43_0 = require("ShareCfg.UserAgreement4")

		arg_41_0:emit(ChargeMediator.OPEN_USER_AGREE, var_43_0 or "")
	end, SFX_PANEL)
end

function var_0_0.addRefreshTimer(arg_44_0, arg_44_1)
	local function var_44_0()
		if arg_44_0.refreshTimer then
			arg_44_0.refreshTimer:Stop()

			arg_44_0.refreshTimer = nil
		end
	end

	var_44_0()

	arg_44_0.refreshTimer = Timer.New(function()
		local var_46_0 = arg_44_1 + 1 - pg.TimeMgr.GetInstance():GetServerTime()

		if var_46_0 <= 0 then
			var_44_0()
			arg_44_0:emit(ChargeMediator.GET_CHARGE_LIST)
		else
			local var_46_1 = pg.TimeMgr.GetInstance():DescCDTime(var_46_0)
		end
	end, 1, -1)

	arg_44_0.refreshTimer:Start()
	arg_44_0.refreshTimer.func()
end

function var_0_0.checkFreeGiftTag(arg_47_0)
	TagTipHelper.FreeGiftTag({
		arg_47_0.giftTip
	})
end

return var_0_0
