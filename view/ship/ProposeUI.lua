local var_0_0 = class("ProposeUI", import("..base.BaseUI"))
local var_0_1 = {
	1,
	2,
	3,
	4,
	4,
	5,
	5,
	7,
	7,
	7,
	7,
	6,
	7
}

var_0_0.nationSpriteIndex = {
	cn = 5,
	de = 4,
	cm = 0,
	jp = 3,
	np = 9,
	sn = 6,
	en = 2,
	um = 11,
	mnf = 8,
	bili = 10,
	ff = 7,
	us = 1
}

function var_0_0.getUIName(arg_1_0)
	return "ProposeUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = arg_2_0.contextData
	local var_2_1 = {}
	local var_2_2

	if var_2_0.shipId then
		var_2_2 = getProxy(BayProxy):getShipById(var_2_0.shipId):getConfigTable().nationality
	elseif var_2_0.group then
		var_2_2 = var_2_0.group:getNation()
	elseif var_2_0.skinId then
		local var_2_3 = pg.ship_skin_template[var_2_0.skinId]

		var_2_2 = ShipGroup.getDefaultShipConfig(var_2_3.ship_group).nationality
	end

	if var_2_2 then
		table.insert(var_2_1, string.lower("ui/Propose" .. Nation.Nation2Side(var_2_2) .. "UI"))
	end

	return table.insertto(var_2_1, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.setShip(arg_3_0, arg_3_1)
	arg_3_0.shipVO = arg_3_1
	arg_3_0.proposeType = arg_3_0.shipVO:getProposeType()

	arg_3_0:setShipGroupID(arg_3_0.shipVO:getGroupId())
end

function var_0_0.setShipGroupID(arg_4_0, arg_4_1)
	arg_4_0.shipGroupID = arg_4_1
end

function var_0_0.setWeddingReviewSkinID(arg_5_0, arg_5_1)
	arg_5_0.reviewSkinID = arg_5_1
end

function var_0_0.setBagProxy(arg_6_0, arg_6_1)
	arg_6_0.bagProxy = arg_6_1
end

function var_0_0.setPlayer(arg_7_0, arg_7_1)
	arg_7_0.player = arg_7_1
end

function var_0_0.init(arg_8_0)
	arg_8_0.storybg = arg_8_0._tf:Find("close/bg")
	arg_8_0.bgAdd = arg_8_0._tf:Find("add")

	setActive(arg_8_0.storybg, false)
	setActive(arg_8_0.bgAdd, false)

	arg_8_0.targetActorTF = arg_8_0._tf:Find("actor_middle")
	arg_8_0.maskTF = arg_8_0._tf:Find("mask")
	arg_8_0.skipBtn = arg_8_0._tf:Find("skip_button")
	arg_8_0.actorPainting = nil
	arg_8_0.materialFace = arg_8_0._tf:Find("Resource/face"):GetComponent(typeof(Image)).material
	arg_8_0.materialPaint = arg_8_0._tf:Find("Resource/paint"):GetComponent(typeof(Image)).material
	arg_8_0.finishCallback = arg_8_0.contextData.finishCallback
	arg_8_0.commonTF = GameObject.Find("OverlayCamera/Overlay/UIMain/common")
	arg_8_0.exchangePanel = arg_8_0._tf:Find("exchange_panel")

	local var_8_0 = arg_8_0.exchangePanel:Find("window/msg_panel/content")

	setText(var_8_0:Find("text"), i18n("word_propose_cost_tip2"))

	local var_8_1 = pg.gameset.vow_prop_conversion.description

	for iter_8_0, iter_8_1 in ipairs(var_8_1) do
		local var_8_2 = Drop.New({
			count = 1,
			type = DROP_TYPE_ITEM,
			id = iter_8_1
		})

		updateDrop(var_8_0:Find("icon_" .. iter_8_0), var_8_2)
		onButton(arg_8_0, var_8_0:Find("icon_" .. iter_8_0), function()
			arg_8_0:emit(BaseUI.ON_DROP, var_8_2)
		end, SFX_PANEL)
	end

	onButton(arg_8_0, arg_8_0.exchangePanel:Find("bg"), function()
		arg_8_0:hideExchangePanel()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.exchangePanel:Find("window/top/btnBack"), function()
		arg_8_0:hideExchangePanel()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.exchangePanel:Find("window/button_container/cancel"), function()
		arg_8_0:hideExchangePanel()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.exchangePanel:Find("window/button_container/confirm"), function()
		if getProxy(BagProxy):getItemCountById(ITEM_ID_FOR_PROPOSE) > 0 then
			arg_8_0:emit(ProposeMediator.EXCHANGE_TIARA)
		else
			ItemTipPanel.ShowRingBuyTip()
		end

		arg_8_0:hideExchangePanel()
	end, SFX_CONFIRM)

	arg_8_0.tweenList = {}
end

function var_0_0.didEnter(arg_14_0)
	arg_14_0:emit(ProposeMediator.HIDE_SHIP_MAIN_WORD)

	if arg_14_0.commonTF then
		setActive(arg_14_0.commonTF, false)
	end

	if arg_14_0.contextData.review then
		arg_14_0.weddingReview = true
		arg_14_0.proposeType = arg_14_0.contextData.group:getProposeType()

		local var_14_0 = arg_14_0.contextData.group:getNation()

		arg_14_0.bgName = Nation.Nation2BG(var_14_0) or Nation.Nation2BG(0)

		onButton(arg_14_0, arg_14_0.skipBtn, function()
			arg_14_0:closeView()
		end, SFX_CANCEL)
		pg.UIMgr.GetInstance():BlurPanel(arg_14_0._tf)
		arg_14_0:doPlay()
	else
		arg_14_0:doMain()
	end
end

function var_0_0.doPlay(arg_16_0)
	setActive(arg_16_0.skipBtn, arg_16_0.weddingReview)
	arg_16_0:setMask(true)
	pg.BgmMgr.GetInstance():TempPlay("wedding")
	arg_16_0:showProposePanel()
end

function var_0_0.doMain(arg_17_0)
	onButton(arg_17_0, arg_17_0.skipBtn, function()
		arg_17_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_17_0, arg_17_0._tf:Find("close0"), function()
		if arg_17_0.proposeEndFlag then
			arg_17_0:DisplayRenamePanel()
		else
			arg_17_0:closeView()
		end
	end, SFX_CANCEL)
	onButton(arg_17_0, arg_17_0._tf:Find("close_end"), function()
		if arg_17_0.proposeEndFlag then
			arg_17_0:DisplayRenamePanel()
		else
			arg_17_0:closeView()
		end
	end, SFX_CANCEL)

	local var_17_0 = arg_17_0.shipVO:getConfigTable().nationality
	local var_17_1 = "Propose" .. Nation.Nation2Side(var_17_0) .. "UI"

	arg_17_0.bgName = Nation.Nation2BG(var_17_0) or Nation.Nation2BG(0)

	PoolMgr.GetInstance():GetUI(var_17_1, true, function(arg_21_0)
		if arg_17_0.exited then
			PoolMgr.GetInstance():ReturnUI(var_17_1, arg_21_0)

			return
		end

		arg_17_0.window = tf(arg_21_0)

		setParent(tf(arg_21_0), arg_17_0._tf:Find("window"))

		arg_17_0.intimacyTF = arg_17_0.window:Find("intimacy/icon")
		arg_17_0.intimacyValueTF = arg_17_0.window:Find("intimacy/value")
		arg_17_0.button = arg_17_0.window:Find("button")
		arg_17_0.giftButton = arg_17_0.window:Find("giftBtn")
		arg_17_0.intimacyDesc = arg_17_0.window:Find("desc")
		arg_17_0.intimacydescTime = arg_17_0.window:Find("descPic/desc_time")
		arg_17_0.intimacyDescPic = arg_17_0.window:Find("descPic")
		arg_17_0.intimacyBuffDesc = arg_17_0.window:Find("desc_buff")
		arg_17_0._paintingTF = arg_17_0.window:Find("paintMask/paint")
		arg_17_0.intimacyAchieved = arg_17_0.window:Find("intimacy/achieved")
		arg_17_0.intimacyNoAchieved = arg_17_0.window:Find("intimacy/no_achieved")
		arg_17_0.ringAchieved = arg_17_0.window:Find("ringCount/achieved")
		arg_17_0.ringNoAchieved = arg_17_0.window:Find("ringCount/no_achieved")
		arg_17_0.ringValue = arg_17_0.window:Find("ringCount/value")
		arg_17_0.nameTF = arg_17_0.window:Find("title1/Text")
		arg_17_0.shipNameTF = arg_17_0.window:Find("title2/Text")
		arg_17_0.campTF = arg_17_0.window:Find("Camp")
		arg_17_0.doneTF = arg_17_0.window:Find("done")
		arg_17_0.CampSprite = arg_17_0.window:Find("CampSprite")

		setActive(arg_17_0.window, true)
		setText(arg_17_0.nameTF, arg_17_0.player.name)
		setText(arg_17_0.shipNameTF, arg_17_0.shipVO:getName())

		if arg_17_0.CampSprite then
			local var_21_0 = getImageSprite(arg_17_0.CampSprite:Find(Nation.Nation2Print(var_17_0)))

			if not var_21_0 then
				warning("找不到印花, shipConfigId: " .. arg_17_0.shipVO.configId)
				setActive(arg_17_0.campTF, false)
			else
				setImageSprite(arg_17_0.campTF, var_21_0, false)
				setActive(arg_17_0.campTF, true)
			end
		end

		setIntimacyIcon(arg_17_0.intimacyTF, arg_17_0.shipVO:getIntimacyIcon())

		local var_21_1, var_21_2 = arg_17_0.shipVO:getIntimacyDetail()

		setText(arg_17_0.intimacyValueTF, i18n("propose_intimacy_tip", var_21_2))

		if var_21_2 >= 100 then
			setTextColor(arg_17_0.intimacyValueTF, Color.white)
		else
			setTextColor(arg_17_0.intimacyValueTF, Color.New(0.5843137254901961, 0.5215686274509804, 0.40784313725490196))
		end

		setActive(arg_17_0.intimacyAchieved, arg_17_0.shipVO.propose or var_21_2 >= 100)
		setActive(arg_17_0.intimacyNoAchieved, var_21_2 < 100 and not arg_17_0.shipVO.propose)
		arg_17_0:onUpdateItemCount()
		setActive(arg_17_0.doneTF, arg_17_0.shipVO.propose)

		local var_21_3, var_21_4 = arg_17_0.shipVO:getIntimacyInfo()

		if arg_17_0.shipVO.propose then
			if arg_17_0.intimacyDescPic then
				setActive(arg_17_0.intimacyDescPic, true)
				arg_17_0:onUpdateIntimacydescTime(arg_17_0.shipVO.proposeTime)
			end

			if arg_17_0.intimacyDesc then
				setActive(arg_17_0.intimacyDesc, not arg_17_0.intimacyDescPic)

				local var_21_5 = arg_17_0:getProposeText()

				setText(arg_17_0.intimacyDesc, var_21_5)
			end
		else
			if arg_17_0.intimacyDesc and GetComponent(arg_17_0.intimacyDesc, "VerticalText") then
				GetComponent(arg_17_0.intimacyDesc, "VerticalText").enabled = false
			end

			if arg_17_0.intimacyDescPic then
				setActive(arg_17_0.intimacyDescPic, false)
			end

			if arg_17_0.intimacyDesc then
				setActive(arg_17_0.intimacyDesc, true)
				setText(arg_17_0.intimacyDesc, i18n(var_21_4, arg_17_0.shipVO.name))
			end
		end

		setText(arg_17_0.intimacyBuffDesc, "*" .. i18n(var_21_4 .. "_buff"))
		arg_17_0:loadChar()
		pg.UIMgr.GetInstance():BlurPanel(arg_17_0._tf)
		setActive(arg_17_0.button, not arg_17_0.shipVO:ShowPropose())

		local var_21_6 = not arg_17_0.shipVO.propose and var_21_1 <= var_21_2
		local var_21_7 = arg_17_0.shipVO.propose and not arg_17_0.shipVO:ShowPropose()

		arg_17_0.button:GetComponent(typeof(Button)).interactable = var_21_6 or var_21_7

		onButton(arg_17_0, arg_17_0.button, function()
			if var_21_6 then
				local var_22_0 = arg_17_0.bagProxy:getItemCountById(arg_17_0:getProposeItemId())

				if var_22_0 < 1 then
					if arg_17_0.proposeType == "imas" then
						arg_17_0:showExchangePanel()
					else
						ItemTipPanel.ShowRingBuyTip()
					end

					return
				end

				local var_22_1, var_22_2 = ShipStatus.ShipStatusCheck("onPropose", arg_17_0.shipVO)

				if not var_22_1 then
					pg.TipsMgr.GetInstance():ShowTips(var_22_2)

					return
				end

				arg_17_0:checkPaintingRes(arg_17_0.shipVO, function()
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("word_propose_cost_tip" .. (arg_17_0.proposeType == "imas" and "1" or ""), var_22_0),
						onYes = function()
							if arg_17_0.intimacydescTime then
								arg_17_0:onUpdateIntimacydescTime(pg.TimeMgr.GetInstance():GetServerTime())
							end

							arg_17_0:hideWindow()
							setActive(arg_17_0.window, false)
							arg_17_0:doPlay()
						end
					})
				end)
			elseif var_21_7 then
				function arg_17_0.afterRegisterCall()
					arg_17_0.afterRegisterCall = nil

					pg.TipsMgr.GetInstance():ShowTips(i18n("word_propose_switch_tip"))
					arg_17_0:closeView()
				end

				arg_17_0:emit(ProposeMediator.REGISTER_SHIP, arg_17_0.shipVO.id)
			else
				arg_17_0:closeView()
			end
		end, SFX_PANEL)
		setActive(arg_17_0.giftButton, not LOCK_SHIP_GIFT)
		onButton(arg_17_0, arg_17_0.giftButton, function()
			if LOCK_SHIP_GIFT then
				return
			end

			arg_17_0:emit(ProposeMediator.GIFT_SHIP, arg_17_0.shipVO.id)
		end, SFX_PANEL)
	end)
end

function var_0_0.getProposeText(arg_27_0)
	local var_27_0 = ""

	if PLATFORM_CODE == PLATFORM_CH or PLATFORM_CODE == PLATFORM_CHT then
		var_27_0 = i18n("intimacy_desc_propose", pg.TimeMgr.GetInstance():ChieseDescTime(arg_27_0.shipVO.proposeTime, true))

		if not IsNil(GetComponent(arg_27_0.intimacyDesc, "VerticalText")) then
			GetComponent(arg_27_0.intimacyDesc, "VerticalText").enabled = true
			var_27_0 = i18n("intimacy_desc_propose_vertical", pg.TimeMgr.GetInstance():ChieseDescTime(arg_27_0.shipVO.proposeTime, true))
		end
	elseif PLATFORM_CODE == PLATFORM_KR then
		var_27_0 = i18n("intimacy_desc_propose", pg.TimeMgr.GetInstance():STimeDescS(arg_27_0.shipVO.proposeTime, "%Y년%m월%d일", true))

		if not IsNil(GetComponent(arg_27_0.intimacyDesc, "VerticalText")) then
			GetComponent(arg_27_0.intimacyDesc, "VerticalText").enabled = true
			var_27_0 = i18n("intimacy_desc_propose_vertical", pg.TimeMgr.GetInstance():STimeDescS(arg_27_0.shipVO.proposeTime, "%Y년%m월%d일"))
		end
	else
		var_27_0 = i18n("intimacy_desc_propose", pg.TimeMgr.GetInstance():STimeDescS(arg_27_0.shipVO.proposeTime, "%Y/%m/%d", true))

		if not IsNil(GetComponent(arg_27_0.intimacyDesc, "VerticalText")) then
			GetComponent(arg_27_0.intimacyDesc, "VerticalText").enabled = true
			var_27_0 = i18n("intimacy_desc_propose_vertical", pg.TimeMgr.GetInstance():STimeDescS(arg_27_0.shipVO.proposeTime, "%Y/%m/%d"))
		end
	end

	return var_27_0
end

function var_0_0.getProposeItemId(arg_28_0)
	if arg_28_0.proposeType == "imas" then
		return ITEM_ID_FOR_PROPOSE_IMAS
	else
		return ITEM_ID_FOR_PROPOSE
	end
end

function var_0_0.onUpdateItemCount(arg_29_0)
	local var_29_0 = arg_29_0.bagProxy:getItemCountById(arg_29_0:getProposeItemId())

	setActive(arg_29_0.ringAchieved, arg_29_0.shipVO.propose or var_29_0 > 0)
	setActive(arg_29_0.ringNoAchieved, var_29_0 <= 0 and not arg_29_0.shipVO.propose)
	setText(arg_29_0.ringValue, i18n(arg_29_0.proposeType == "imas" and "intimacy_desc_tiara" or "intimacy_desc_ring"))

	if arg_29_0.shipVO.propose or var_29_0 > 0 then
		setTextColor(arg_29_0.ringValue, Color.white)
	else
		setTextColor(arg_29_0.ringValue, Color.New(0.5843137254901961, 0.5215686274509804, 0.40784313725490196))
	end

	if arg_29_0.proposeType == "imas" then
		local var_29_1 = not arg_29_0.shipVO.propose and var_29_0 == 0

		setActive(arg_29_0.window:Find("ringCount/bg_exchange"), var_29_1)
		setActive(arg_29_0.window:Find("ringCount/icon/btn_exchange"), var_29_1)
		onButton(arg_29_0, arg_29_0.window:Find("ringCount/icon/btn_exchange"), function()
			arg_29_0:showExchangePanel()
		end, SFX_PANEL)
	else
		setActive(arg_29_0.window:Find("ringCount/icon/base"), PLATFORM_CODE ~= PLATFORM_CH)
		setActive(arg_29_0.window:Find("ringCount/icon/hx"), PLATFORM_CODE == PLATFORM_CH)
	end
end

function var_0_0.onUpdateIntimacydescTime(arg_31_0, arg_31_1)
	local var_31_0

	if PLATFORM_CODE == PLATFORM_JP then
		if arg_31_0.proposeType == "imas" then
			var_31_0 = "%Y.%m.%d"
		else
			var_31_0 = "%B.%d,    %y"
		end
	elseif PLATFORM_CODE == PLATFORM_US then
		var_31_0 = "%B %d, %Y"
	elseif arg_31_0.proposeType == "imas" then
		var_31_0 = i18n("intimacy_desc_day") .. " %Y.%m.%d"
	else
		var_31_0 = "%B.%d,    %y"
	end

	setText(arg_31_0.intimacydescTime, pg.TimeMgr.GetInstance():STimeDescS(arg_31_1, var_31_0))
end

function var_0_0.onBackPressed(arg_32_0)
	if isActive(arg_32_0.exchangePanel) then
		arg_32_0:hideExchangePanel()

		return
	end

	if arg_32_0.window and isActive(arg_32_0.window) then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		triggerButton(arg_32_0._tf:Find("close_end"))
	end
end

function var_0_0.willExit(arg_33_0)
	if arg_33_0._currentVoice then
		arg_33_0._currentVoice:PlaybackStop()
	end

	arg_33_0._currentVoice = nil

	pg.BgmMgr.GetInstance():ContinuePlay()

	if not IsNil(arg_33_0.actorPainting) then
		local var_33_0 = tf(arg_33_0.actorPainting)

		if var_33_0:Find("temp_mask") then
			Destroy(var_33_0:Find("temp_mask"))
		end

		var_33_0:GetComponent(typeof(Image)).material = nil

		PoolMgr.GetInstance():ReturnPainting(arg_33_0.paintingName, arg_33_0.actorPainting)

		arg_33_0.actorPainting = nil
	end

	if arg_33_0.delayTId then
		LeanTween.cancel(arg_33_0.delayTId)
	end

	if arg_33_0.commonTF then
		setActive(arg_33_0.commonTF, true)
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_33_0._tf)

	if arg_33_0.l2dChar then
		arg_33_0.l2dChar:ClearPics()

		arg_33_0.l2dChar = nil
	end

	if arg_33_0.live2dRequestId then
		pg.Live2DMgr.GetInstance():StopLoadingLive2d(arg_33_0.live2dRequestId)

		arg_33_0.live2dRequestId = nil
	end

	if arg_33_0._delayVoiceTweenID then
		LeanTween.cancel(arg_33_0._delayVoiceTweenID)

		arg_33_0._delayVoiceTweenID = nil
	end

	if arg_33_0.tweenList then
		cancelTweens(arg_33_0.tweenList)

		arg_33_0.tweenList = nil
	end

	if arg_33_0.contextData.callback then
		arg_33_0.contextData.callback()
	end

	if arg_33_0.finishCallback then
		arg_33_0.finishCallback()

		arg_33_0.finishCallback = nil
	end
end

function var_0_0.setMask(arg_34_0, arg_34_1)
	setActive(arg_34_0.maskTF, arg_34_1)
end

function var_0_0.bgAddAnimation(arg_35_0, arg_35_1)
	setActive(arg_35_0.storybg, true)
	arg_35_0:showbgAdd(true, arg_35_1)
end

function var_0_0.showbgChurch(arg_36_0)
	table.insert(arg_36_0.tweenList, LeanTween.scale(arg_36_0.storybg, Vector3(1, 1, 1), 6).uniqueId)
	setActive(arg_36_0.churchLight, true)
	table.insert(arg_36_0.tweenList, LeanTween.delayedCall(6, System.Action(function()
		setActive(arg_36_0.churchLight, false)
	end)).uniqueId)
end

function var_0_0.showbgAdd(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_1 and 1 or 0
	local var_38_1 = arg_38_1 and 0 or 1
	local var_38_2 = GetOrAddComponent(arg_38_0.bgAdd, typeof(CanvasGroup))

	table.insert(arg_38_0.tweenList, LeanTween.alphaCanvas(var_38_2, var_38_1, arg_38_2):setFrom(var_38_0).uniqueId)
	setActive(arg_38_0.bgAdd, true)
end

function var_0_0.showBlackBG(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = arg_39_1 and 1 or 0
	local var_39_1 = arg_39_1 and 0 or 1
	local var_39_2 = GetOrAddComponent(arg_39_0.blackBG, typeof(CanvasGroup))

	setActive(arg_39_0.blackBG, true)
	table.insert(arg_39_0.tweenList, LeanTween.alphaCanvas(var_39_2, var_39_1, arg_39_2):setFrom(var_39_0):setOnComplete(System.Action(function()
		if arg_39_1 then
			setActive(arg_39_0.blackBG, false)
		end

		if arg_39_3 then
			arg_39_3()
		end
	end)).uniqueId)
end

function var_0_0.showPainting(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0 = {}

	if arg_41_1 then
		table.insert(var_41_0, function(arg_42_0)
			arg_41_0:loadChar(arg_41_0.targetActorTF, "duihua", arg_42_0)
		end)
	end

	seriesAsync(var_41_0, function()
		local var_43_0 = arg_41_1 and 0 or 1
		local var_43_1 = arg_41_1 and 1 or 0
		local var_43_2 = GetOrAddComponent(arg_41_0.targetActorTF, typeof(CanvasGroup))

		table.insert(arg_41_0.tweenList, LeanTween.alphaCanvas(var_43_2, var_43_1, arg_41_2):setFrom(var_43_0):setOnComplete(System.Action(function()
			if arg_41_3 then
				arg_41_3()
			end
		end)).uniqueId)
	end)
end

var_0_0.Live2DProposeDelayTime = 2

function var_0_0.showLive2D(arg_45_0, arg_45_1)
	setActive(arg_45_0.targetActorTF:Find("fitter"), false)
	setActive(arg_45_0.targetActorTF:Find("live2d"), true)

	local var_45_0 = GetOrAddComponent(arg_45_0.targetActorTF, typeof(CanvasGroup))

	table.insert(arg_45_0.tweenList, LeanTween.alphaCanvas(var_45_0, 1, var_0_0.Live2DProposeDelayTime):setFrom(0):setOnComplete(System.Action(function()
		arg_45_0:changeParamaterValue("Paramring", 1)
		arg_45_0.l2dChar:SetAction(pg.AssistantInfo.action2Id[arg_45_1])
	end)).uniqueId)
end

function var_0_0.changeParamaterValue(arg_47_0, arg_47_1, arg_47_2)
	if not arg_47_1 or string.len(arg_47_1) == 0 then
		return
	end

	local var_47_0 = arg_47_0.l2dChar:GetCubismParameter(arg_47_1)

	if not var_47_0 then
		return
	end

	arg_47_0.l2dChar:AddParameterValue(var_47_0, arg_47_2, CubismParameterBlendMode.Override)
end

function var_0_0.hideWindow(arg_48_0)
	local var_48_0 = GetOrAddComponent(arg_48_0.window, typeof(CanvasGroup))

	var_48_0.interactable = false

	table.insert(arg_48_0.tweenList, LeanTween.alphaCanvas(var_48_0, 0, 0.2):setFrom(1):setOnComplete(System.Action(function()
		var_48_0.interactable = true
	end)).uniqueId)
end

function var_0_0.stampWindow(arg_50_0)
	arg_50_0.proposeEndFlag = true

	arg_50_0:loadChar(nil, nil, function()
		return
	end)
	setActive(arg_50_0.window, true)
	setActive(arg_50_0.button, false)
	setActive(arg_50_0.giftButton, false)
	setActive(arg_50_0.targetActorTF:Find("live2d"), false)

	local var_50_0

	if arg_50_0.intimacyDescPic then
		setActive(arg_50_0.intimacyDescPic, true)

		var_50_0 = GetOrAddComponent(arg_50_0.intimacyDescPic, typeof(CanvasGroup))
	end

	if arg_50_0.intimacyDesc then
		setActive(arg_50_0.intimacyDesc, not arg_50_0.intimacyDescPic)

		local var_50_1 = arg_50_0:getProposeText()

		setText(arg_50_0.intimacyDesc, var_50_1)

		var_50_0 = GetOrAddComponent(arg_50_0.intimacyDesc, typeof(CanvasGroup))
	end

	setText(arg_50_0.intimacyBuffDesc, "")
	setActive(arg_50_0.doneTF, false)

	var_50_0.alpha = 0

	local var_50_2 = GetOrAddComponent(arg_50_0.window, typeof(CanvasGroup))

	var_50_2.interactable = false

	table.insert(arg_50_0.tweenList, LeanTween.alphaCanvas(var_50_2, 1, 0.8):setFrom(0).uniqueId)
	table.insert(arg_50_0.tweenList, LeanTween.delayedCall(1.5, System.Action(function()
		table.insert(arg_50_0.tweenList, LeanTween.alphaCanvas(var_50_0, 1, 2):setFrom(0).uniqueId)
	end)).uniqueId)

	arg_50_0.delayTId = LeanTween.delayedCall(5, System.Action(function()
		if not var_50_2 then
			return
		end

		var_50_2.interactable = true

		setActive(arg_50_0.doneTF, true)
		arg_50_0:setMask(false)
		setActive(arg_50_0._tf:Find("close_end"), true)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_SEAL)
	end)).id
end

function var_0_0.showProposePanel(arg_54_0)
	local var_54_0 = {}

	arg_54_0.proposeSkin = ShipGroup.getProposeSkin(arg_54_0.shipGroupID)

	if arg_54_0.proposeSkin and arg_54_0.actorPainting then
		local var_54_1 = tf(arg_54_0.actorPainting)

		if var_54_1:Find("temp_mask") then
			Destroy(var_54_1:Find("temp_mask"))
		end

		var_54_1:GetComponent(typeof(Image)).material = nil

		PoolMgr.GetInstance():ReturnPainting(arg_54_0.paintingName, arg_54_0.actorPainting)

		arg_54_0.actorPainting = nil
	end

	if not arg_54_0.proposePanel then
		table.insert(var_54_0, function(arg_55_0)
			local var_55_0 = "ProposeRingUI"

			PoolMgr.GetInstance():GetUI(var_55_0, true, function(arg_56_0)
				if arg_54_0.exited then
					PoolMgr.GetInstance():ReturnUI(var_55_0, arg_56_0)

					return
				end

				arg_54_0.proposePanel = tf(arg_56_0)

				setParent(tf(arg_56_0), arg_54_0._tf:Find("contain"))
				eachChild(arg_54_0.proposePanel:Find("ringBox"), function(arg_57_0)
					setActive(arg_57_0, arg_57_0.name == arg_54_0.proposeType)

					if arg_57_0.name == arg_54_0.proposeType then
						arg_54_0.ringBoxTF = arg_57_0
					end
				end)

				arg_54_0.ringBoxCG = GetOrAddComponent(arg_54_0.ringBoxTF, typeof(CanvasGroup))
				arg_54_0.ringBoxFull = arg_54_0.ringBoxTF:Find("full")
				arg_54_0.churchBefore = arg_54_0.proposePanel:Find("before")
				arg_54_0.churchLight = arg_54_0.churchBefore:Find("light")

				setParent(arg_54_0.churchLight, arg_54_0._tf)
				arg_54_0.churchLight:SetSiblingIndex(2)

				arg_54_0.blackBG = arg_54_0.churchBefore:Find("blackbg")
				arg_54_0.doorLightBG = arg_54_0.churchBefore:Find("door_light")
				arg_54_0.door = arg_54_0.churchBefore:Find("door")
				arg_54_0.doorAni = GetOrAddComponent(arg_54_0.door, "SpineAnimUI")

				setParent(arg_54_0.churchBefore, arg_54_0._tf:Find("contain"))

				arg_54_0.ringTipTF = arg_54_0.proposePanel:Find("tip")
				arg_54_0.ringTipCG = GetOrAddComponent(arg_54_0.ringTipTF, typeof(CanvasGroup))

				setText(arg_54_0.ringTipTF:Find("Text"), i18n(arg_54_0.proposeType == "imas" and "word_propose_tiara_tip" or "word_propose_ring_tip"))
				setActive(arg_54_0.ringTipTF:Find("finger"), false)
				LoadImageSpriteAsync(arg_54_0.bgName, arg_54_0.storybg)

				arg_54_0.storybg.localScale = Vector3(1.2, 1.2, 1.2)

				local var_56_0 = arg_54_0.weddingReview and arg_54_0.reviewSkinID or arg_54_0.shipVO:getSkinId()

				arg_54_0.handId = pg.ship_skin_template[var_56_0].hand_id

				local var_56_1 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y%m%d", true)

				if SPECIAL_PROPOSE and SPECIAL_PROPOSE[1] == var_56_1 then
					for iter_56_0, iter_56_1 in ipairs(SPECIAL_PROPOSE[2]) do
						if iter_56_1[1] == var_56_0 then
							arg_54_0.handId = iter_56_1[2]
						end
					end
				end

				local var_56_2 = ({
					default = "",
					meta = "Meta_",
					imas = "Imas_"
				})[arg_54_0.proposeType] .. "ProposeHand_" .. arg_54_0.handId

				arg_54_0.handName = var_56_2

				PoolMgr.GetInstance():GetUI(var_56_2, true, function(arg_58_0)
					if arg_54_0.exited then
						PoolMgr.GetInstance():ReturnUI(var_56_2, arg_58_0)

						return
					end

					arg_54_0.transHand = tf(arg_58_0)

					setActive(arg_54_0.transHand, false)
					setParent(arg_54_0.transHand, arg_54_0.proposePanel)
					arg_54_0.transHand:SetAsFirstSibling()

					arg_54_0.handTF = arg_54_0.transHand:Find("hand")
					arg_54_0.ringTF = arg_54_0.transHand:Find("ring")
					arg_54_0.ringCG = GetOrAddComponent(arg_54_0.ringTF, typeof(CanvasGroup))
					arg_54_0.ringAnim = arg_54_0.ringTF:GetComponent(typeof(Animator))
					arg_54_0.ringAnim.enabled = false
					arg_54_0.ringLight = arg_54_0.ringTF:Find("ring_light")
					arg_54_0.ringLightCG = GetOrAddComponent(arg_54_0.ringLight, typeof(CanvasGroup))

					arg_55_0()
				end)
			end)
		end)
	end

	table.insert(var_54_0, function(arg_59_0)
		table.insert(arg_54_0.tweenList, LeanTween.scale(arg_54_0.door, Vector3(2.1, 2.1, 2.1), 4).uniqueId)
		arg_54_0.doorAni:SetActionCallBack(function(arg_60_0)
			if arg_60_0 == "FINISH" then
				arg_54_0.doorAni:SetActionCallBack(nil)
				setActive(arg_54_0.door, false)
				arg_54_0:showBlackBG(true, 0.1)
				setActive(arg_54_0.doorLightBG, false)
				arg_59_0()
			end
		end)
		table.insert(arg_54_0.tweenList, LeanTween.delayedCall(2, System.Action(function()
			arg_54_0:showbgAdd(false, 2)
		end)).uniqueId)
		table.insert(arg_54_0.tweenList, LeanTween.alpha(rtf(arg_54_0.doorLightBG), 1, 2):setFrom(0).uniqueId)
		arg_54_0:showBlackBG(false, 0.1)
		arg_54_0.doorAni:SetAction("OPEN", 0)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOOR)
	end)
	table.insert(var_54_0, function(arg_62_0)
		arg_54_0.handTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 0)

		arg_54_0:bgAddAnimation(2)
		table.insert(arg_54_0.tweenList, LeanTween.delayedCall(2, System.Action(function()
			arg_54_0:showPainting(true, 1.5, function()
				table.insert(arg_54_0.tweenList, LeanTween.delayedCall(1.5, System.Action(arg_62_0)).uniqueId)
			end)
		end)).uniqueId)
	end)
	table.insert(var_54_0, function(arg_65_0)
		arg_54_0:showBlackBG(false, 1.2, function()
			arg_54_0:showBlackBG(true, 1.2)
		end)
		arg_54_0:showPainting(false, 1, arg_65_0)
	end)
	table.insert(var_54_0, function(arg_67_0)
		setAnchoredPosition(arg_54_0.handTF, {
			y = arg_54_0.handTF.rect.height
		})
		setAnchoredPosition(arg_54_0.ringTF, {
			y = 0
		})
		setActive(arg_54_0.proposePanel, true)
		setActive(arg_54_0.transHand, true)

		arg_54_0.ringBoxCG.alpha = 0
		arg_54_0.ringCG.alpha = 0

		arg_67_0()
	end)

	if arg_54_0.proposeType ~= "imas" then
		table.insert(var_54_0, function(arg_68_0)
			table.insert(arg_54_0.tweenList, LeanTween.alpha(rtf(arg_54_0.handTF), 1, 1.2).uniqueId)
			table.insert(arg_54_0.tweenList, LeanTween.moveY(rtf(arg_54_0.handTF), 0, 2):setOnComplete(System.Action(function()
				table.insert(arg_54_0.tweenList, LeanTween.alphaCanvas(arg_54_0.ringBoxCG, 1, 1.5):setFrom(0):setOnComplete(System.Action(arg_68_0)).uniqueId)
			end)).uniqueId)
		end)
		table.insert(var_54_0, function(arg_70_0)
			table.insert(arg_54_0.tweenList, LeanTween.alpha(rtf(arg_54_0.ringBoxFull), 0, 0.6):setOnComplete(System.Action(arg_70_0)).uniqueId)
			table.insert(arg_54_0.tweenList, LeanTween.alphaCanvas(arg_54_0.ringCG, 1, 0.6).uniqueId)
		end)
	end

	table.insert(var_54_0, function(arg_71_0)
		arg_54_0.ringCG.alpha = 1

		arg_54_0:setMask(false)
		table.insert(arg_54_0.tweenList, LeanTween.delayedCall(0.1, System.Action(arg_71_0)).uniqueId)
	end)
	table.insert(var_54_0, function(arg_72_0)
		arg_54_0.ringAnim.enabled = true

		arg_54_0.ringAnim:Play("movein")

		local var_72_0 = arg_54_0.proposeType == "imas" and 1 or 0.5

		table.insert(arg_54_0.tweenList, LeanTween.delayedCall(var_72_0, System.Action(arg_72_0)).uniqueId)
	end)
	seriesAsync(var_54_0, function()
		arg_54_0.ringAnim:Play("blink")
		table.insert(arg_54_0.tweenList, LeanTween.alphaCanvas(arg_54_0.ringTipCG, 1, 1.5):setFrom(0):setOnComplete(System.Action(function()
			setActive(arg_54_0.ringTipTF:Find("finger"), true)
			arg_54_0:enableRingDrag(true)
		end)).uniqueId)
	end)
end

function var_0_0.ringOn(arg_75_0)
	if arg_75_0.isRingOn then
		return
	end

	setActive(arg_75_0.ringTipTF, false)

	arg_75_0.isRingOn = true

	arg_75_0.ringTF:GetComponent("DftAniEvent"):SetEndEvent(function(arg_76_0)
		arg_75_0.ringAnim.enabled = false
		arg_75_0.isRingOn = false

		if not arg_75_0.weddingReview then
			arg_75_0:emit(ProposeMediator.ON_PROPOSE, arg_75_0.shipVO.id)
		else
			arg_75_0:RingFadeout()
		end
	end)

	arg_75_0.ringAnim.enabled = true

	arg_75_0.ringAnim:Play("wear")

	if arg_75_0.handId == "101" then
		local var_75_0 = GetOrAddComponent(arg_75_0.handTF, typeof(CanvasGroup))

		table.insert(arg_75_0.tweenList, LeanTween.alphaCanvas(var_75_0, 0, 2).uniqueId)
	end
end

function var_0_0.enableRingDrag(arg_77_0, arg_77_1)
	if not arg_77_0.press then
		arg_77_0:addRingDragListenter()
	end

	arg_77_0.press.enabled = arg_77_1
end

function var_0_0.addRingDragListenter(arg_78_0)
	arg_78_0.press = GetOrAddComponent(arg_78_0.proposePanel, "EventTriggerListener")

	local var_78_0

	arg_78_0.press:AddBeginDragFunc(function()
		return
	end)
	arg_78_0.press:AddDragFunc(function(arg_80_0, arg_80_1)
		local var_80_0 = arg_80_1.position

		if not var_78_0 then
			var_78_0 = var_80_0
		end

		if var_80_0.y - var_78_0.y > 100 then
			arg_78_0:setMask(true)
			arg_78_0:ringOn()
			arg_78_0:enableRingDrag(false)
		end
	end)
	arg_78_0.press:AddDragEndFunc(function(arg_81_0, arg_81_1)
		return
	end)
end

function var_0_0.RingFadeout(arg_82_0)
	local var_82_0 = {}

	if arg_82_0.proposeType == "imas" then
		table.insert(var_82_0, function(arg_83_0)
			local var_83_0 = arg_82_0.ringLight:GetChild(0)

			setActive(var_83_0, true)
			table.insert(arg_82_0.tweenList, LeanTween.delayedCall(3.5, System.Action(function()
				setActive(var_83_0, false)
				arg_83_0()
			end)).uniqueId)
		end)
	else
		table.insert(var_82_0, function(arg_85_0)
			table.insert(arg_82_0.tweenList, LeanTween.alphaCanvas(arg_82_0.ringLightCG, 0.7, 0.5):setFrom(0).uniqueId)
			table.insert(arg_82_0.tweenList, LeanTween.scale(arg_82_0.ringLight, Vector3(8, 8, 8), 1).uniqueId)
			table.insert(arg_82_0.tweenList, LeanTween.rotate(arg_82_0.ringLight, 90, 3):setOnComplete(System.Action(arg_85_0)).uniqueId)
		end)
		table.insert(var_82_0, function(arg_86_0)
			table.insert(arg_82_0.tweenList, LeanTween.delayedCall(0.5, System.Action(arg_86_0)).uniqueId)
		end)
	end

	seriesAsync(var_82_0, function()
		arg_82_0:displayShipWord("propose")
	end)
	table.insert(arg_82_0.tweenList, LeanTween.delayedCall(1.2, System.Action(function()
		arg_82_0:showbgAdd(false, 1.8)
	end)).uniqueId)
	table.insert(arg_82_0.tweenList, LeanTween.delayedCall(3.2, System.Action(function()
		setActive(arg_82_0.proposePanel, false)
		arg_82_0:showbgAdd(true, 2)
	end)).uniqueId)
end

function var_0_0.displayShipWord(arg_90_0, arg_90_1)
	local var_90_0 = ShipGroup.getDefaultSkin(arg_90_0.shipGroupID)
	local var_90_1, var_90_2, var_90_3 = ShipWordHelper.GetWordAndCV(var_90_0.id, arg_90_1)
	local var_90_4

	if arg_90_0.reviewSkinID then
		var_90_4 = arg_90_0.reviewSkinID
	elseif arg_90_0.proposeSkin then
		var_90_4 = arg_90_0.proposeSkin.id
	else
		var_90_4 = arg_90_0.shipVO:getSkinId()
	end

	local var_90_5 = ShipWordHelper.GetL2dCvCalibrate(var_90_4, arg_90_1)

	arg_90_0:showStoryUI(var_90_3)

	if var_90_2 then
		local function var_90_6()
			if arg_90_0._currentVoice then
				arg_90_0._currentVoice:PlaybackStop()
			end

			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_90_2, function(arg_92_0)
				arg_90_0._currentVoice = arg_92_0
			end)
		end

		local var_90_7 = var_0_0.Live2DProposeDelayTime

		if not arg_90_0:useL2dOrPainting() then
			var_90_7 = 0
		end

		table.insert(arg_90_0.tweenList, LeanTween.delayedCall(var_90_7, System.Action(function()
			if arg_90_0.l2dChar and var_90_5 and var_90_5 ~= 0 then
				arg_90_0._delayVoiceTweenID = LeanTween.delayedCall(var_90_5, System.Action(function()
					var_90_6()

					arg_90_0._delayVoiceTweenID = nil
				end)).uniqueId
			else
				var_90_6()
			end
		end)).uniqueId)
	end
end

function var_0_0.useL2dOrPainting(arg_95_0)
	return checkABExist("live2d/" .. string.lower(arg_95_0.paintingName))
end

function var_0_0.showStoryUI(arg_96_0, arg_96_1)
	local var_96_0 = {}

	if not arg_96_0.storyTF then
		table.insert(var_96_0, function(arg_97_0)
			local var_97_0 = "ProposeStoryUI"

			PoolMgr.GetInstance():GetUI(var_97_0, true, function(arg_98_0)
				if arg_96_0.exited then
					PoolMgr.GetInstance():ReturnUI(var_97_0, arg_98_0)

					return
				end

				arg_96_0.storyTF = tf(arg_98_0)

				setParent(tf(arg_98_0), arg_96_0._tf:Find("contain"))

				arg_96_0.storyCG = GetOrAddComponent(arg_96_0.storyTF, typeof(CanvasGroup))
				arg_96_0.storyContent = arg_96_0.storyTF:Find("dialogue/content")
				arg_96_0.typeWriter = arg_96_0.storyContent:GetComponent(typeof(Typewriter))
				arg_96_0.targetNameTF = arg_96_0.storyTF:Find("dialogue/content/name")
				arg_96_0._renamePanel = arg_96_0.storyTF:Find("changeName_panel")

				setText(findTF(arg_96_0._renamePanel, "frame/name_field/Placeholder"), i18n("rename_input"))
				setActive(arg_96_0._renamePanel, false)
				onButton(arg_96_0, arg_96_0.storyTF, function()
					if arg_96_0.inTypeWritter then
						arg_96_0.typeWriter:setSpeed(arg_96_0.typeWritterSpeedUp)

						return
					end

					if not arg_96_0.initStory then
						return
					end

					table.insert(arg_96_0.tweenList, LeanTween.alphaCanvas(arg_96_0.storyCG, 0, 1):setFrom(1):setOnComplete(System.Action(function()
						setActive(arg_96_0.storyTF, false)
					end)).uniqueId)

					if arg_96_0._currentVoice then
						arg_96_0._currentVoice:PlaybackStop()
					end

					arg_96_0._currentVoice = nil

					arg_96_0:setMask(true)
					table.insert(arg_96_0.tweenList, LeanTween.delayedCall(0.5, System.Action(function()
						if arg_96_0.weddingReview then
							arg_96_0:closeView()
						else
							arg_96_0:initChangeNamePanel()
							arg_96_0:stampWindow()
						end
					end)).uniqueId)
				end)
				arg_97_0()
			end)
		end)
	end

	seriesAsync(var_96_0, function()
		if arg_96_0:useL2dOrPainting() then
			arg_96_0:showLive2D("wedding")
		else
			arg_96_0:showPainting(true, 2)
		end

		local var_102_0 = ShipGroup.getDefaultShipNameByGroupID(arg_96_0.shipGroupID)

		setText(arg_96_0.targetNameTF:Find("Text"), var_102_0)
		setText(arg_96_0.storyContent, "")

		arg_96_0.storyCG.alpha = 0

		setActive(arg_96_0.storyTF, true)

		arg_96_0.initStory = false

		table.insert(arg_96_0.tweenList, LeanTween.alphaCanvas(arg_96_0.storyCG, 1, 1):setFrom(0):setDelay(1):setOnComplete(System.Action(function()
			if findTF(arg_96_0.targetActorTF, "fitter").childCount > 0 then
				ShipExpressionHelper.SetExpression(findTF(arg_96_0.targetActorTF, "fitter"):GetChild(0), arg_96_0.paintingName, "propose")
			end

			setText(arg_96_0.storyContent, arg_96_1)

			arg_96_0.onWords = true

			if arg_96_1 and arg_96_1 ~= "" then
				arg_96_0:TypeWriter()
			end

			arg_96_0.initStory = true

			arg_96_0:setMask(false)

			if not arg_96_0.weddingReview then
				arg_96_0:showTip()
			end
		end)).uniqueId)
	end)
end

function var_0_0.TypeWriter(arg_104_0)
	local var_104_0 = 0.1

	arg_104_0.inTypeWritter = true
	arg_104_0.typeWritterSpeedUp = 0.01

	arg_104_0.typeWriter:setSpeed(var_104_0)
	arg_104_0.typeWriter:Play()

	function arg_104_0.typeWriter.endFunc()
		arg_104_0.inTypeWritter = false
		arg_104_0.typeWritterSpeedUp = nil
	end
end

function var_0_0.loadChar(arg_106_0, arg_106_1, arg_106_2, arg_106_3)
	arg_106_1 = arg_106_1 or arg_106_0._paintingTF
	arg_106_2 = arg_106_2 or "wedding"

	local var_106_0 = {}

	if not arg_106_0.actorPainting then
		table.insert(var_106_0, function(arg_107_0)
			if arg_106_0.reviewSkinID then
				arg_106_0.paintingName = pg.ship_skin_template[arg_106_0.reviewSkinID].painting
			elseif arg_106_0.proposeSkin then
				arg_106_0.paintingName = arg_106_0.proposeSkin.painting
			else
				arg_106_0.paintingName = arg_106_0.shipVO:getPainting()
			end

			local var_107_0 = arg_106_0.paintingName

			if checkABExist("painting/" .. var_107_0 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. var_107_0, 0) ~= 0 then
				var_107_0 = var_107_0 .. "_n"
			end

			PoolMgr.GetInstance():GetPainting(var_107_0, true, function(arg_108_0)
				local var_108_0 = findTF(arg_108_0, "Touch")

				if not IsNil(var_108_0) then
					setActive(var_108_0, false)
				end

				arg_106_0.actorPainting = arg_108_0

				local var_108_1 = (arg_106_0.weddingReview or arg_106_0.shipVO and arg_106_0.shipVO.propose) and "propose" or nil

				ShipExpressionHelper.SetExpression(arg_106_0.actorPainting, arg_106_0.paintingName, var_108_1)
				arg_107_0()
			end)

			if checkABExist("live2d/" .. string.lower(arg_106_0.paintingName)) then
				arg_106_0:createLive2D(arg_106_0.paintingName)
			end
		end)
	end

	seriesAsync(var_106_0, function()
		if not IsNil(arg_106_1) then
			local var_109_0 = findTF(arg_106_1, "fitter")

			assert(var_109_0, "请添加子物体fitter")

			local var_109_1 = GetOrAddComponent(var_109_0, "PaintingScaler")

			var_109_1.FrameName = arg_106_2
			var_109_1.Tween = 1

			setParent(arg_106_0.actorPainting, var_109_0)
		end

		if arg_106_3 then
			arg_106_3()
		end
	end)
end

function var_0_0.createLive2D(arg_110_0, arg_110_1)
	arg_110_0.live2dRequestId = pg.Live2DMgr.GetInstance():GetLive2DModelAsync(arg_110_1, function(arg_111_0)
		local var_111_0 = arg_111_0.transform

		GetOrAddComponent(var_111_0, typeof(DftAniEvent))

		local var_111_1 = arg_110_0.targetActorTF:Find("live2d")

		HotfixHelper.SetLayerRecursively(arg_111_0, LayerMask.NameToLayer("UI"))
		var_111_0:SetParent(var_111_1, true)

		local var_111_2

		if arg_110_0.reviewSkinID then
			var_111_2 = arg_110_0.reviewSkinID
		elseif arg_110_0.proposeSkin then
			var_111_2 = arg_110_0.proposeSkin.id
		else
			var_111_2 = arg_110_0.shipVO:getSkinId()
		end

		Live2DPainting.SetL2dSortingLayer(arg_111_0, LayerWeightConst.L2D_DEFAULT_LAYER)

		var_111_0.localPosition = BuildVector3(pg.ship_skin_template[var_111_2].live2d_offset) + Vector3(0, 0, 100)

		local var_111_3 = 52

		if pg.ship_skin_template[var_111_2].live2d_offset and #pg.ship_skin_template[var_111_2].live2d_offset >= 4 then
			var_111_3 = pg.ship_skin_template[var_111_2].live2d_offset[4]
		end

		var_111_0.localScale = Vector3(var_111_3, var_111_3, var_111_3)
		arg_110_0.l2dChar = GetComponent(arg_111_0, "Live2dChar")
		arg_110_0.l2dChar.name = arg_110_1

		local var_111_4 = pg.AssistantInfo.action2Id.idle

		function arg_110_0.l2dChar.FinishAction(arg_112_0)
			if var_111_4 ~= arg_112_0 then
				arg_110_0.l2dChar:SetAction(var_111_4)
			end
		end

		arg_110_0.l2dChar:SetAction(var_111_4)

		local var_111_5 = pg.ship_skin_template[var_111_2]
		local var_111_6 = var_111_5.lip_sync_gain
		local var_111_7 = var_111_5.lip_smoothing

		if var_111_6 and var_111_6 ~= 0 then
			var_111_1:GetChild(0):GetComponent("CubismCriSrcMouthInput").Gain = var_111_6
		end

		if arg_110_1 == "mojiaduoer_4" then
			arg_110_0.l2dChar:AddParameterValue(arg_110_0.l2dChar:GetCubismParameter("ParamAngleX1"), 3, CubismParameterBlendMode.Override)
			arg_110_0.l2dChar:AddParameterValue(arg_110_0.l2dChar:GetCubismParameter("touch_drag45"), 7, CubismParameterBlendMode.Override)
		end

		local var_111_8 = arg_110_0.l2dChar:GetCubismParameter("l2d_hx")

		if var_111_8 then
			if HXSet.isHx() then
				arg_110_0.l2dChar:AddParameterValue(var_111_8, 1, CubismParameterBlendMode.Override)
			else
				arg_110_0.l2dChar:AddParameterValue(var_111_8, 0, CubismParameterBlendMode.Override)
			end
		end

		if var_111_7 and var_111_7 ~= 0 then
			var_111_1:GetChild(0):GetComponent("CubismCriSrcMouthInput").Smoothing = var_111_7
		end
	end)
end

function var_0_0.showTip(arg_113_0)
	local var_113_0 = arg_113_0.proposeSkin

	if not var_113_0 then
		return
	end

	local var_113_1 = arg_113_0.storyTF:Find("tip")
	local var_113_2 = var_113_1:Find("Image_bg/Text")

	setText(var_113_2, i18n("achieve_propose_tip", var_113_0.name))
	eachChild(var_113_1:Find("Image_bg/Image"), function(arg_114_0)
		setActive(arg_114_0, arg_114_0.name == arg_113_0.proposeType)
	end)

	local var_113_3 = GetOrAddComponent(var_113_1, typeof(CanvasGroup))

	setActive(var_113_1, true)
	table.insert(arg_113_0.tweenList, LeanTween.alphaCanvas(var_113_3, 1, 0.01):setFrom(0).uniqueId)
	table.insert(arg_113_0.tweenList, LeanTween.alphaCanvas(var_113_3, 0, 1.5):setFrom(1):setDelay(4).uniqueId)
end

function var_0_0.initChangeNamePanel(arg_115_0)
	setText(arg_115_0._renamePanel:Find("frame/border/title"), i18n("word_propose_changename_title", arg_115_0.shipVO:getName()))
	setText(arg_115_0._renamePanel:Find("frame/setting_ship_name/text"), i18n("word_propose_changename_tip1"))
	setText(arg_115_0._renamePanel:Find("frame/text"), i18n("word_propose_changename_tip2"))

	arg_115_0._renameConfirmBtn = arg_115_0._renamePanel:Find("frame/queren")
	arg_115_0._renameCancelBtn = arg_115_0._renamePanel:Find("frame/cancel")
	arg_115_0._renameToggle = findTF(arg_115_0._renamePanel, "frame/setting_ship_name"):GetComponent(typeof(Toggle))
	arg_115_0._renameRevert = arg_115_0._renamePanel:Find("frame/revert_button")
	arg_115_0._closeBtn = arg_115_0._renamePanel:Find("frame/close_btn")

	onButton(arg_115_0, arg_115_0._renameConfirmBtn, function()
		local var_116_0 = getInputText(findTF(arg_115_0._renamePanel, "frame/name_field"))

		pg.PushNotificationMgr.GetInstance():setSwitchShipName(arg_115_0._renameToggle.isOn)
		arg_115_0:emit(ProposeMediator.RENAME_SHIP, arg_115_0.shipVO.id, var_116_0)
	end, SFX_CONFIRM)
	onButton(arg_115_0, arg_115_0._renameRevert, function()
		local var_117_0 = arg_115_0.shipVO:isRemoulded() and pg.ship_skin_template[arg_115_0.shipVO:getRemouldSkinId()].name or pg.ship_data_statistics[arg_115_0.shipVO.configId].name

		setInputText(findTF(arg_115_0._renamePanel, "frame/name_field"), var_117_0)
	end, SFX_PANEL)
	onButton(arg_115_0, arg_115_0._renameCancelBtn, function()
		arg_115_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_115_0, arg_115_0._closeBtn, function()
		arg_115_0:closeView()
	end, SFX_CANCEL)
end

function var_0_0.DisplayRenamePanel(arg_120_0)
	if arg_120_0.shipVO:IsXIdol() then
		arg_120_0:closeView()
	else
		setParent(arg_120_0._renamePanel, arg_120_0._tf)
		setActive(arg_120_0._renamePanel, true)

		local var_120_0 = arg_120_0.shipVO:getName()

		setInputText(findTF(arg_120_0._renamePanel, "frame/name_field"), var_120_0)
		setIntimacyIcon(arg_120_0.intimacyTF, arg_120_0.shipVO:getIntimacyIcon())
	end
end

function var_0_0.showExchangePanel(arg_121_0)
	setActive(arg_121_0.exchangePanel, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_121_0.exchangePanel)
end

function var_0_0.hideExchangePanel(arg_122_0)
	setActive(arg_122_0.exchangePanel, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_122_0.exchangePanel, arg_122_0._tf)
end

function var_0_0.checkPaintingRes(arg_123_0, arg_123_1, arg_123_2)
	local var_123_0 = {}
	local var_123_1 = arg_123_1:getProposeSkin()

	if var_123_1 and var_123_1.id > 0 then
		local var_123_2 = var_123_1.id

		PaintingGroupConst.AddPaintingNameBySkinID(var_123_0, var_123_2)
	end

	local var_123_3 = {
		isShowBox = true,
		paintingNameList = var_123_0,
		finishFunc = arg_123_2
	}

	PaintingGroupConst.PaintingDownload(var_123_3)
end

return var_0_0
