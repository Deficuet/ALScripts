local var_0_0 = class("NewSkinShopMainView", import("view.base.BaseEventLogic"))

var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW = "NewSkinShopMainView:EVT_SHOW_OR_HIDE_PURCHASE_VIEW"
var_0_0.EVT_ON_PURCHASE = "NewSkinShopMainView:EVT_ON_PURCHASE"

local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 1
local var_0_5 = 2
local var_0_6 = 3
local var_0_7 = 4
local var_0_8 = 5
local var_0_9 = 6
local var_0_10 = 7
local var_0_11 = 8

local function var_0_12(arg_1_0)
	if not var_0_0.obtainBtnSpriteNames then
		var_0_0.obtainBtnSpriteNames = {
			[var_0_4] = "yigoumai_butten",
			[var_0_5] = "goumai_butten",
			[var_0_6] = "qianwanghuoqu_butten",
			[var_0_7] = "item_buy",
			[var_0_8] = "furniture_shop",
			[var_0_9] = "tiyan_btn",
			[var_0_10] = "item_buy",
			[var_0_11] = "buy_with_gift"
		}
	end

	return var_0_0.obtainBtnSpriteNames[arg_1_0]
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	pg.DelegateInfo.New(arg_2_0)
	var_0_0.super.Ctor(arg_2_0, arg_2_2)

	arg_2_0.contextData = arg_2_3
	arg_2_0._go = arg_2_1.gameObject
	arg_2_0._tf = arg_2_1
	arg_2_0.overlay = arg_2_0._tf:Find("overlay")
	arg_2_0.titleTr = arg_2_0._tf:Find("overlay/title")
	arg_2_0.skinNameTxt = arg_2_0._tf:Find("overlay/title/skin_name"):GetComponent(typeof(Text))
	arg_2_0.shipNameTxt = arg_2_0._tf:Find("overlay/title/name"):GetComponent(typeof(Text))
	arg_2_0.timeLimitTr = arg_2_0._tf:Find("overlay/title/limit_time")
	arg_2_0.timeLimitTxt = arg_2_0.timeLimitTr:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.changeSkinUI = arg_2_0._tf:Find("overlay/left/change_skin")
	arg_2_0.changeSkinToggle = ChangeSkinToggle.New(findTF(arg_2_0.changeSkinUI, "toggle_ui"))
	arg_2_0.rightTr = arg_2_0._tf:Find("overlay/right")
	arg_2_0.uiTagList = UIItemList.New(arg_2_0._tf:Find("overlay/right/container/tags_container/tags"), arg_2_0._tf:Find("overlay/right/container/tags_container/tags/tpl"))
	arg_2_0.charContainer = arg_2_0._tf:Find("overlay/right/container/char_container")
	arg_2_0.charTf = arg_2_0._tf:Find("overlay/right/container/char_container/char")
	arg_2_0.furnitureContainer = arg_2_0._tf:Find("overlay/right/fur")
	arg_2_0.charBg = arg_2_0._tf:Find("overlay/right/container/char_container/bg/char")
	arg_2_0.furnitureBg = arg_2_0._tf:Find("overlay/right/container/char_container/bg/furn")
	arg_2_0.switchPreviewBtn = arg_2_0._tf:Find("overlay/right/switch")
	arg_2_0.obtainBtn = arg_2_0._tf:Find("overlay/right/price/btn")
	arg_2_0.obtainBtnImg = arg_2_0.obtainBtn:GetComponent(typeof(Image))
	arg_2_0.giftTag = arg_2_0.obtainBtn:Find("tag")
	arg_2_0.giftItem = arg_2_0.obtainBtn:Find("item")
	arg_2_0.giftText = arg_2_0._tf:Find("overlay/right/price/btn/Text"):GetComponent(typeof(Text))
	arg_2_0.consumeTr = arg_2_0._tf:Find("overlay/right/price/consume")
	arg_2_0.consumeRealPriceTxt = arg_2_0.consumeTr:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.consumePriceTxt = arg_2_0.consumeTr:Find("originalprice/Text"):GetComponent(typeof(Text))
	arg_2_0.experienceTr = arg_2_0._tf:Find("overlay/right/price/timelimt")
	arg_2_0.experienceTxt = arg_2_0.experienceTr:Find("consume/Text"):GetComponent(typeof(Text))

	setText(arg_2_0.consumeTr:Find("originalprice/label"), i18n("skin_original_price"))

	arg_2_0.dynamicToggle = arg_2_0._tf:Find("overlay/right/toggles/l2d_preview")
	arg_2_0.showBgToggle = arg_2_0._tf:Find("overlay/right/toggles/hideObjToggle")
	arg_2_0.dynamicResToggle = arg_2_0._tf:Find("overlay/right/toggles/l2d_res_state")
	arg_2_0.dynamicResDownaload = arg_2_0._tf:Find("overlay/right/toggles/l2d_res_state/downloaded")
	arg_2_0.dynamicResUnDownaload = arg_2_0._tf:Find("overlay/right/toggles/l2d_res_state/undownload")
	arg_2_0.paintingTF = arg_2_0._tf:Find("painting/paint")
	arg_2_0.defaultPaintingPosition = arg_2_0.paintingTF.anchoredPosition
	arg_2_0.live2dContainer = arg_2_0._tf:Find("painting/paint/live2d")
	arg_2_0.spTF = arg_2_0._tf:Find("painting/paint/spinePainting")
	arg_2_0.spBg = arg_2_0._tf:Find("painting/paintBg/spinePainting")
	arg_2_0.bgsGo = arg_2_0._tf:Find("bgs").gameObject
	arg_2_0.diffBg = arg_2_0._tf:Find("bgs/diffBg/bg")
	arg_2_0.defaultBg = arg_2_0._tf:Find("bgs/default")
	arg_2_0.downloads = {}
	arg_2_0.obtainBtnSprites = {}
	arg_2_0.isToggleDynamic = false
	arg_2_0.isToggleShowBg = true
	arg_2_0.isPreviewFurniture = false
	arg_2_0.interactionPreview = BackYardInteractionPreview.New(arg_2_0.furnitureContainer, Vector3(0, 0, 0))
	arg_2_0.voucherMsgBox = SkinVoucherMsgBox.New(pg.UIMgr.GetInstance().OverlayMain)
	arg_2_0.purchaseView = NewSkinShopPurchaseView.New(arg_2_0._tf, arg_2_2)

	arg_2_0:RegisterEvent()
end

function var_0_0.RegisterEvent(arg_3_0)
	arg_3_0:bind(var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW, function(arg_4_0, arg_4_1)
		arg_3_0:AdjustPainting(arg_4_1)
		setActive(arg_3_0.overlay, not arg_4_1)
	end)
	arg_3_0:bind(var_0_0.EVT_ON_PURCHASE, function(arg_5_0, arg_5_1)
		local var_5_0 = arg_3_0:GetObtainBtnState(arg_5_1)

		arg_3_0:OnClickBtn(var_5_0, arg_5_1)
	end)
	onButton(arg_3_0, arg_3_0.changeSkinUI, function()
		if ShipSkin.IsChangeSkin(arg_3_0.skinId) then
			arg_3_0.changeSkinId = ShipSkin.GetChangeSkinNextId(arg_3_0.skinId)

			arg_3_0:Flush(arg_3_0.commodity)
		end
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_7_0, arg_7_1)
	if not arg_7_1 then
		arg_7_0:FlushStyle(true)

		return
	end

	arg_7_0:FlushStyle(false)

	local var_7_0 = arg_7_0.commodity and arg_7_0.commodity.id == arg_7_1.id

	arg_7_0.skinId = arg_7_1:getSkinId()

	local var_7_1 = ShipSkin.IsChangeSkin(arg_7_0.skinId)

	arg_7_0:FlushChangeSkin(arg_7_1)

	if not var_7_0 then
		arg_7_0:FlushName(arg_7_1)
		arg_7_0:FlushPreviewBtn(arg_7_1)
		arg_7_0:FlushTimeline(arg_7_1)
		arg_7_0:FlushTag(arg_7_1)
		arg_7_0:SwitchPreview(arg_7_1, arg_7_0.isPreviewFurniture, false)
		arg_7_0:FlushPaintingToggle(arg_7_1)
		arg_7_0:FlushBG(arg_7_1)
		arg_7_0:FlushPainting(arg_7_1)
	elseif var_7_1 then
		arg_7_0:FlushBG(arg_7_1)
		arg_7_0:FlushPainting(arg_7_1)
		arg_7_0:FlushTag(arg_7_1)
		arg_7_0:SwitchPreview(arg_7_1, arg_7_0.isPreviewFurniture, false)
	else
		arg_7_0:FlushBG(arg_7_1)
		arg_7_0:FlushPainting(arg_7_1)
	end

	arg_7_0:FlushPrice(arg_7_1)
	arg_7_0:FlushObtainBtn(arg_7_1)

	arg_7_0.commodity = arg_7_1
end

function var_0_0.FlushChangeSkin(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.skinId
	local var_8_1 = ShipSkin.IsChangeSkin(var_8_0)

	setActive(arg_8_0.changeSkinUI, var_8_1 and true or false)

	if var_8_1 then
		local var_8_2 = ShipSkin.GetChangeSkinGroupId(var_8_0)

		if not arg_8_0.changeSkinId then
			arg_8_0.changeSkinId = var_8_0
		elseif ShipSkin.GetChangeSkinGroupId(arg_8_0.changeSkinId) == var_8_2 then
			arg_8_0.skinId = arg_8_0.changeSkinId
		else
			arg_8_0.changeSkinId = arg_8_0.skinId
		end

		arg_8_0.changeSkinToggle:setSkinData(arg_8_0.skinId)
	end
end

function var_0_0.FlushStyle(arg_9_0, arg_9_1)
	setActive(arg_9_0.paintingTF.parent, not arg_9_1)
	setActive(arg_9_0.defaultBg, arg_9_1)
	setActive(arg_9_0.diffBg.parent, not arg_9_1)
	setActive(arg_9_0.titleTr, not arg_9_1)
	setActive(arg_9_0.rightTr, not arg_9_1)
end

function var_0_0.getUIName(arg_10_0)
	return "NewSkinShopMainView"
end

function var_0_0.FlushBgWithAnim(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0._tf:GetComponent(typeof(CanvasGroup))

	var_11_0.blocksRaycasts = false

	parallelAsync({
		function(arg_12_0)
			arg_11_0:DoSwitchBgAnim(1, 0.3, 0.8, LeanTweenType.linear, arg_12_0)
		end,
		function(arg_13_0)
			arg_11_0:FlushBG(arg_11_1, arg_13_0)
		end
	}, function()
		arg_11_0:DoSwitchBgAnim(1, 1, 0.01, LeanTweenType.linear, function()
			var_11_0.blocksRaycasts = true
		end)
	end)
end

function var_0_0.DoSwitchBgAnim(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4, arg_16_5)
	arg_16_0:ClearSwitchBgAnim()

	local var_16_0 = GetOrAddComponent(arg_16_0.bgsGo, typeof(CanvasGroup))

	var_16_0.alpha = arg_16_1

	LeanTween.value(arg_16_0.bgsGo, arg_16_1, arg_16_2, arg_16_3):setOnUpdate(System.Action_float(function(arg_17_0)
		var_16_0.alpha = arg_17_0
	end)):setEase(arg_16_4):setOnComplete(System.Action(arg_16_5))
end

function var_0_0.ClearSwitchBgAnim(arg_18_0)
	if LeanTween.isTweening(arg_18_0.bgsGo) then
		LeanTween.cancel(arg_18_0.bgsGo)
	end

	GetOrAddComponent(arg_18_0.bgsGo, typeof(CanvasGroup)).alpha = 1
end

function var_0_0.FlushBG(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.skinId
	local var_19_1 = pg.ship_skin_template[var_19_0]
	local var_19_2

	if var_19_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		var_19_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_19_0))
	else
		local var_19_3 = ShipGroup.getDefaultShipConfig(var_19_1.ship_group)

		var_19_2 = Ship.New({
			id = 999,
			configId = var_19_3.id,
			skin_id = var_19_0
		})
	end

	local var_19_4 = var_19_2:getShipBgPrint(true)
	local var_19_5 = pg.ship_skin_template[var_19_0].painting

	if (arg_19_0.isToggleShowBg or not checkABExist("painting/" .. var_19_5 .. "_n")) and var_19_1.bg_sp ~= "" then
		var_19_4 = var_19_1.bg_sp
	end

	local var_19_6 = var_19_4 ~= var_19_2:rarity2bgPrintForGet()

	if var_19_6 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_19_0, var_19_4, arg_19_0.diffBg.parent, arg_19_0.diffBg, function(arg_20_0)
			if arg_19_2 then
				arg_19_2()
			end
		end, function(arg_21_0)
			if arg_19_2 then
				arg_19_2()
			end
		end)
	else
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_19_0:getUIName())

		if arg_19_2 then
			arg_19_2()
		end
	end

	setActive(arg_19_0.diffBg, var_19_6)
	setActive(arg_19_0.defaultBg, not var_19_6)
end

function var_0_0.FlushName(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.skinId
	local var_22_1 = pg.ship_skin_template[var_22_0]

	arg_22_0.skinNameTxt.text = SwitchSpecialChar(var_22_1.name, true)

	if var_22_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		arg_22_0.shipNameTxt.text = NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(var_22_0))
	else
		local var_22_2 = ShipGroup.getDefaultShipConfig(var_22_1.ship_group)

		arg_22_0.shipNameTxt.text = var_22_2.name
	end
end

function var_0_0.FlushPaintingToggle(arg_23_0, arg_23_1)
	removeOnToggle(arg_23_0.dynamicToggle)
	removeOnToggle(arg_23_0.showBgToggle)

	local var_23_0 = ShipSkin.New({
		id = arg_23_0.skinId
	})
	local var_23_1 = checkABExist("painting/" .. var_23_0:getConfig("painting") .. "_n")

	if arg_23_0.isToggleShowBg and not var_23_1 then
		triggerToggle(arg_23_0.showBgToggle, false)

		arg_23_0.isToggleShowBg = false
	elseif var_23_1 then
		triggerToggle(arg_23_0.showBgToggle, true)

		arg_23_0.isToggleShowBg = true
	end

	local var_23_2 = var_23_0:IsSpine() or var_23_0:IsLive2d()

	if LOCK_SKIN_SHOP_ANIM_PREVIEW then
		var_23_2 = false
	end

	if var_23_2 and PlayerPrefs.GetInt("skinShop#l2dPreViewToggle" .. getProxy(PlayerProxy):getRawData().id, 0) == 1 then
		arg_23_0.isToggleDynamic = true
	end

	if arg_23_0.isToggleDynamic and not var_23_2 then
		triggerToggle(arg_23_0.dynamicToggle, false)

		arg_23_0.isToggleDynamic = false
	elseif arg_23_0.isToggleDynamic and not arg_23_0.dynamicToggle:GetComponent(typeof(Toggle)).isOn then
		if var_23_0:IsLive2d() and Live2dConst.GetLive2DArm32MatchAble() then
			arg_23_0.isToggleDynamic = false

			local var_23_3 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_23_3, 0)
			PlayerPrefs.Save()
			triggerToggle(arg_23_0.dynamicToggle, false)
		else
			triggerToggle(arg_23_0.dynamicToggle, true)

			arg_23_0.isToggleDynamic = true
		end
	end

	if var_23_1 then
		onToggle(arg_23_0, arg_23_0.showBgToggle, function(arg_24_0)
			arg_23_0.isToggleShowBg = arg_24_0

			arg_23_0:FlushPainting(arg_23_1)
			arg_23_0:FlushBG(arg_23_1)
		end, SFX_PANEL)
	end

	if var_23_0:IsSpine() or var_23_0:IsLive2d() then
		onToggle(arg_23_0, arg_23_0.dynamicToggle, function(arg_25_0)
			if arg_25_0 and Live2dConst.GetLive2DArm32MatchAble() and var_23_0:IsLive2d() then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_23_0.dynamicToggle, false)

				return
			end

			arg_23_0.isToggleDynamic = arg_25_0

			setActive(arg_23_0.dynamicResToggle, arg_25_0)
			setActive(arg_23_0.showBgToggle, not arg_25_0 and var_23_1)
			arg_23_0:FlushPainting(arg_23_1)
			arg_23_0:FlushDynamicPaintingResState(arg_23_1)
			arg_23_0:RecordFlag(arg_25_0)
		end, SFX_PANEL)
	end

	if arg_23_0.isToggleDynamic then
		arg_23_0:FlushDynamicPaintingResState(arg_23_1)
	end

	setActive(arg_23_0.dynamicToggle, var_23_2)
	setActive(arg_23_0.dynamicResToggle, arg_23_0.isToggleDynamic)
	setActive(arg_23_0.showBgToggle, not arg_23_0.isToggleDynamic and var_23_1)
end

function var_0_0.RecordFlag(arg_26_0, arg_26_1)
	local var_26_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_26_0, arg_26_1 and 1 or 0)
	PlayerPrefs.Save()
	arg_26_0:emit(NewSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN, arg_26_1)
end

function var_0_0.ExistL2dRes(arg_27_0, arg_27_1)
	local var_27_0 = "live2d/" .. string.lower(arg_27_1)
	local var_27_1 = HXSet.autoHxShiftPath(var_27_0, nil, true)

	return checkABExist(var_27_1), var_27_1
end

function var_0_0.ExistSpineRes(arg_28_0, arg_28_1)
	local var_28_0 = "SpinePainting/" .. string.lower(arg_28_1)
	local var_28_1 = HXSet.autoHxShiftPath(var_28_0, nil, true)

	return checkABExist(var_28_1), var_28_1
end

function var_0_0.FlushDynamicPaintingResState(arg_29_0, arg_29_1)
	if not arg_29_0.isToggleDynamic then
		return
	end

	local var_29_0 = arg_29_0:GetPaintingState(arg_29_1)
	local var_29_1 = false
	local var_29_2 = ""
	local var_29_3 = pg.ship_skin_template[arg_29_0.skinId].painting

	if var_0_2 == var_29_0 then
		var_29_1, var_29_2 = arg_29_0:ExistL2dRes(var_29_3)
	elseif var_0_3 == var_29_0 then
		var_29_1, var_29_2 = arg_29_0:ExistSpineRes(var_29_3)
	end

	setActive(arg_29_0.dynamicResDownaload, var_29_1)
	setActive(arg_29_0.dynamicResUnDownaload, not var_29_1)
	removeOnButton(arg_29_0.dynamicResUnDownaload)

	if not var_29_1 and var_29_2 ~= "" then
		onButton(arg_29_0, arg_29_0.dynamicResUnDownaload, function()
			arg_29_0:DownloadDynamicPainting(var_29_2, arg_29_1)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadDynamicPainting(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0.skinId

	if arg_31_0.downloads[var_31_0] then
		return
	end

	local var_31_1 = SkinShopDownloadRequest.New()

	arg_31_0.downloads[var_31_0] = var_31_1

	var_31_1:Start(arg_31_1, function(arg_32_0)
		if arg_32_0 and arg_31_0.paintingState and arg_31_0.paintingState.id == arg_31_2.id then
			arg_31_0:FlushPainting(arg_31_2)
			arg_31_0:FlushDynamicPaintingResState(arg_31_2)
		end

		var_31_1:Dispose()

		arg_31_0.downloads[var_31_0] = nil
	end)
end

function var_0_0.GetPaintingState(arg_33_0, arg_33_1)
	local var_33_0 = ShipSkin.New({
		id = arg_33_0.skinId
	})

	if arg_33_0.isToggleDynamic and var_33_0:IsLive2d() then
		return var_0_2
	elseif arg_33_0.isToggleDynamic and var_33_0:IsSpine() then
		if var_33_0:getConfig("spine_use_live2d") == 1 then
			return var_0_2
		end

		return var_0_3
	else
		return var_0_1
	end
end

function var_0_0.FlushPainting(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetPaintingState(arg_34_1)
	local var_34_1 = pg.ship_skin_template[arg_34_0.skinId].painting
	local var_34_2 = ShipSkin.GetChangeSkinData(arg_34_0.skinId) and true or false

	if var_34_0 == var_0_2 and not arg_34_0:ExistL2dRes(var_34_1) or var_34_0 == var_0_3 and not arg_34_0:ExistSpineRes(var_34_1) then
		var_34_0 = var_0_1
	end

	if arg_34_0.paintingState and arg_34_0.paintingState.state == var_34_0 and arg_34_0.paintingState.id == arg_34_1.id and arg_34_0.paintingState.showBg == arg_34_0.isToggleShowBg and arg_34_0.paintingState.purchaseFlag == arg_34_1.buyCount and not var_34_2 then
		return
	end

	arg_34_0:ClearPainting()

	if var_34_0 == var_0_1 then
		arg_34_0:LoadMeshPainting(arg_34_1, arg_34_0.isToggleShowBg)
	elseif var_34_0 == var_0_2 then
		arg_34_0:LoadL2dPainting(arg_34_1)
	elseif var_34_0 == var_0_3 then
		arg_34_0:LoadSpinePainting(arg_34_1)
	end

	arg_34_0.paintingState = {
		state = var_34_0,
		id = arg_34_1.id,
		showBg = arg_34_0.isToggleShowBg,
		purchaseFlag = arg_34_1.buyCount
	}

	arg_34_0:AdjustPainting(false)
end

function var_0_0.ClearPainting(arg_35_0)
	local var_35_0 = arg_35_0.paintingState

	if not var_35_0 then
		return
	end

	if var_35_0.state == var_0_1 then
		arg_35_0:ClearMeshPainting()
	elseif var_35_0.state == var_0_2 then
		arg_35_0:ClearL2dPainting()
	elseif var_35_0.state == var_0_3 then
		arg_35_0:ClearSpinePainting()
	end

	arg_35_0.paintingState = nil
end

function var_0_0.LoadMeshPainting(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = findTF(arg_36_0.paintingTF, "fitter")
	local var_36_1 = GetOrAddComponent(var_36_0, "PaintingScaler")

	var_36_1.FrameName = "chuanwu"
	var_36_1.Tween = 1

	local var_36_2 = pg.ship_skin_template[arg_36_0.skinId].painting
	local var_36_3 = var_36_2

	if not arg_36_2 and checkABExist("painting/" .. var_36_2 .. "_n") then
		var_36_2 = var_36_2 .. "_n"
	end

	if not checkABExist("painting/" .. var_36_2) then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetPainting(var_36_2, true, function(arg_37_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setParent(arg_37_0, var_36_0, false)
		ShipExpressionHelper.SetExpression(var_36_0:GetChild(0), var_36_3)

		arg_36_0.paintingName = var_36_2

		if arg_36_0.paintingState and arg_36_0.paintingState.id ~= arg_36_1.id then
			arg_36_0:ClearMeshPainting()
		end

		local var_37_0 = arg_37_0.transform:Find("shop_hx")

		arg_36_0:CheckShowShopHx(var_37_0, arg_36_1)
	end)
end

function var_0_0.ClearMeshPainting(arg_38_0)
	local var_38_0 = arg_38_0.paintingTF:Find("fitter")

	if arg_38_0.paintingName and var_38_0.childCount > 0 then
		local var_38_1 = var_38_0:GetChild(0).gameObject
		local var_38_2 = var_38_1.transform:Find("shop_hx")

		arg_38_0:RevertShopHx(var_38_2)
		PoolMgr.GetInstance():ReturnPainting(arg_38_0.paintingName, var_38_1)
	end

	arg_38_0.paintingName = nil
end

function var_0_0.LoadL2dPainting(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0.skinId
	local var_39_1 = pg.ship_skin_template[var_39_0].skin_type
	local var_39_2

	if var_39_1 == ShipSkin.SKIN_TYPE_TB then
		var_39_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_39_0))
	else
		local var_39_3 = pg.ship_skin_template[var_39_0].ship_group
		local var_39_4 = ShipGroup.getDefaultShipConfig(var_39_3)

		var_39_2 = Ship.New({
			id = 999,
			configId = var_39_4.id,
			skin_id = var_39_0
		})
	end

	local var_39_5 = Live2D.GenerateData({
		ship = var_39_2,
		scale = Vector3(52, 52, 52),
		position = Vector3(0, 0, -1),
		parent = arg_39_0.live2dContainer
	})

	var_39_5.shopPreView = true

	pg.UIMgr.GetInstance():LoadingOn()

	arg_39_0.live2dChar = Live2D.New(var_39_5, function(arg_40_0)
		arg_40_0:IgonreReactPos(true)
		arg_39_0:CheckShowShopHxForL2d(arg_40_0, arg_39_1)

		if arg_39_0.paintingState and arg_39_0.paintingState.id ~= arg_39_1.id then
			arg_39_0:ClearL2dPainting()
		end

		arg_40_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
		pg.UIMgr.GetInstance():LoadingOff()

		if var_39_2:getSkinId() == 299024 then
			arg_40_0:setPosition(Vector3(150, 40, 0))
		end
	end)
end

function var_0_0.ClearL2dPainting(arg_41_0)
	if arg_41_0.live2dChar then
		arg_41_0:RevertShopHxForL2d(arg_41_0.live2dChar)
		arg_41_0.live2dChar:Dispose()

		arg_41_0.live2dChar = nil
	end
end

function var_0_0.LoadSpinePainting(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0.skinId
	local var_42_1 = pg.ship_skin_template[var_42_0].skin_type
	local var_42_2

	if var_42_1 == ShipSkin.SKIN_TYPE_TB then
		var_42_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_42_0))
	else
		local var_42_3 = pg.ship_skin_template[var_42_0].ship_group
		local var_42_4 = ShipGroup.getDefaultShipConfig(var_42_3)

		var_42_2 = Ship.New({
			id = 999,
			configId = var_42_4.id,
			skin_id = var_42_0
		})
	end

	local var_42_5 = SpinePainting.GenerateData({
		ship = var_42_2,
		position = Vector3(0, 0, 0),
		parent = arg_42_0.spTF,
		effectParent = arg_42_0.spBg
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_42_0.spinePainting = SpinePainting.New(var_42_5, function(arg_43_0)
		if arg_42_0.paintingState and arg_42_0.paintingState.id ~= arg_42_1.id then
			arg_42_0:ClearSpinePainting()
		end

		local var_43_0 = arg_43_0._tf:Find("shop_hx")

		arg_42_0:CheckShowShopHx(var_43_0, arg_42_1)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearSpinePainting(arg_44_0)
	if arg_44_0.spinePainting and arg_44_0.spinePainting._tf then
		local var_44_0 = arg_44_0.spinePainting._tf:Find("shop_hx")

		arg_44_0:RevertShopHx(arg_44_0.shopHx)
		arg_44_0.spinePainting:Dispose()

		arg_44_0.spinePainting = nil
	end
end

function var_0_0.CheckShowShopHxForL2d(arg_45_0, arg_45_1, arg_45_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	local var_45_0 = arg_45_2.buyCount <= 0 and 1 or 0

	arg_45_1:changeParamaterValue("shophx", var_45_0)
end

function var_0_0.RevertShopHxForL2d(arg_46_0, arg_46_1)
	arg_46_1:changeParamaterValue("shophx", 0)
end

function var_0_0.CheckShowShopHx(arg_47_0, arg_47_1, arg_47_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	if not IsNil(arg_47_1) and arg_47_2.buyCount <= 0 then
		setActive(arg_47_1, true)
	end
end

function var_0_0.RevertShopHx(arg_48_0, arg_48_1)
	if not IsNil(arg_48_1) then
		setActive(arg_48_1, false)
	end
end

function var_0_0.FlushPreviewBtn(arg_49_0, arg_49_1)
	local var_49_0 = Goods.ExistFurniture(arg_49_1.id)

	removeOnButton(arg_49_0.switchPreviewBtn)

	if not var_49_0 and arg_49_0.isPreviewFurniture then
		arg_49_0.isPreviewFurniture = false
	end

	setActive(arg_49_0.switchPreviewBtn, var_49_0)

	if var_49_0 then
		onButton(arg_49_0, arg_49_0.switchPreviewBtn, function()
			if arg_49_0:IsSwitchTweening() then
				return
			end

			arg_49_0.isPreviewFurniture = not arg_49_0.isPreviewFurniture

			arg_49_0:SwitchPreview(arg_49_1, arg_49_0.isPreviewFurniture, true)
			arg_49_0:FlushPrice(arg_49_1)
			arg_49_0:FlushObtainBtn(arg_49_1)
		end, SFX_PANEL)
	end
end

function var_0_0.IsSwitchTweening(arg_51_0)
	return LeanTween.isTweening(go(arg_51_0.furnitureBg)) or LeanTween.isTweening(go(arg_51_0.charBg))
end

function var_0_0.ClearSwitchTween(arg_52_0)
	if arg_52_0:IsSwitchTweening() then
		LeanTween.cancel(go(arg_52_0.furnitureBg))
		LeanTween.cancel(go(arg_52_0.charBg))
	end
end

function var_0_0.StartSwitchAnim(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
	arg_53_0:ClearSwitchTween()

	local var_53_0 = arg_53_1:GetComponent(typeof(CanvasGroup))
	local var_53_1 = arg_53_2:GetComponent(typeof(CanvasGroup))
	local var_53_2 = var_53_0.alpha
	local var_53_3 = var_53_1.alpha
	local var_53_4 = arg_53_1.anchoredPosition3D
	local var_53_5 = arg_53_2.anchoredPosition3D

	LeanTween.moveLocal(go(arg_53_1), var_53_5, arg_53_3):setOnComplete(System.Action(function()
		var_53_0.alpha = var_53_3
	end))
	LeanTween.moveLocal(go(arg_53_2), var_53_4, arg_53_3):setOnComplete(System.Action(function()
		var_53_1.alpha = var_53_2

		arg_53_4()
	end))
end

function var_0_0.SwitchPreview(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	local var_56_0 = arg_56_0.skinId

	if pg.ship_skin_template[var_56_0].skin_type == ShipSkin.SKIN_TYPE_TB then
		setActive(arg_56_0.charContainer, false)

		return
	end

	setActive(arg_56_0.charContainer, true)

	local var_56_1 = arg_56_0.furnitureBg
	local var_56_2 = arg_56_0.charBg

	arg_56_0:StartSwitchAnim(var_56_1, var_56_2, arg_56_3 and 0.3 or 0, function()
		setActive(arg_56_0.charTf, not arg_56_2)
		setActive(arg_56_0.furnitureContainer, arg_56_2)
	end)

	if not arg_56_2 then
		var_56_1:SetAsFirstSibling()
		var_56_2:SetSiblingIndex(2)

		local var_56_3 = pg.ship_skin_template[var_56_0]

		arg_56_0:FlushChar(var_56_3.prefab, var_56_3.id)
	else
		var_56_2:SetAsFirstSibling()
		var_56_1:SetSiblingIndex(2)

		local var_56_4 = Goods.Id2FurnitureId(arg_56_1.id)
		local var_56_5 = Goods.GetFurnitureConfig(arg_56_1.id)

		arg_56_0.interactionPreview:Flush(var_56_0, var_56_4, var_56_5.scale[2] or 1, var_56_5.position[2])
	end
end

function var_0_0.GetObtainBtnState(arg_58_0, arg_58_1)
	if arg_58_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return var_0_9
	elseif arg_58_0.isPreviewFurniture then
		if getProxy(DormProxy):getRawData():HasFurniture(Goods.Id2FurnitureId(arg_58_1.id)) then
			return var_0_4
		else
			return var_0_8
		end
	elseif arg_58_1.type == Goods.TYPE_ACTIVITY or arg_58_1.type == Goods.TYPE_ACTIVITY_EXTRA then
		return var_0_6
	elseif arg_58_1.buyCount > 0 then
		return var_0_4
	elseif arg_58_1:isDisCount() and arg_58_1:IsItemDiscountType() then
		return var_0_7
	elseif arg_58_1:CanUseVoucherType() or arg_58_1:ExistExclusiveDiscountItem() then
		return var_0_10
	elseif #arg_58_1:GetGiftList() > 0 then
		return var_0_11
	else
		return var_0_5
	end
end

function var_0_0.GetMode(arg_59_0)
	return arg_59_0.contextData.mode or NewSkinShopScene.MODE_OVERVIEW
end

function var_0_0.FlushPrice(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit
	local var_60_1 = arg_60_1.type == Goods.TYPE_ACTIVITY or arg_60_1.type == Goods.TYPE_ACTIVITY_EXTRA

	if var_60_0 then
		if arg_60_0:GetMode() == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_60_0:UpdateExperiencePrice4Item(arg_60_1)
		else
			arg_60_0:UpdateExperiencePrice(arg_60_1)
		end
	elseif arg_60_0.isPreviewFurniture then
		arg_60_0:UpdateFurniturePrice(arg_60_1)
	elseif var_60_1 then
		-- block empty
	else
		arg_60_0:UpdateCommodityPrice(arg_60_1)
	end

	local var_60_2 = arg_60_1.type == Goods.TYPE_SKIN

	setActive(arg_60_0.experienceTr, var_60_0 and not var_60_1)
	setActive(arg_60_0.consumeTr, var_60_2 and not var_60_0 and not var_60_1)
end

function var_0_0.UpdateExperiencePrice4Item(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1:getConfig("resource_num")
	local var_61_1 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_61_2 = _.detect(var_61_1, function(arg_62_0)
		return arg_62_0:CanUseForShop(arg_61_1.id)
	end)
	local var_61_3 = var_61_2 and var_61_2.count or 0
	local var_61_4 = (var_61_3 < var_61_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_61_3 .. (var_61_3 < var_61_0 and "</color>" or "")

	arg_61_0.experienceTxt.text = var_61_4 .. "/" .. var_61_0
end

function var_0_0.UpdateExperiencePrice(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_1:getConfig("resource_num")
	local var_63_1 = getProxy(PlayerProxy):getRawData():getSkinTicket()
	local var_63_2 = (var_63_1 < var_63_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_63_1 .. (var_63_1 < var_63_0 and "</color>" or "")

	arg_63_0.experienceTxt.text = var_63_2 .. "/" .. var_63_0
end

function var_0_0.UpdateCommodityPrice(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_1:GetPrice()
	local var_64_1 = arg_64_1:getConfig("resource_num")

	arg_64_0.consumeRealPriceTxt.text = var_64_0
	arg_64_0.consumePriceTxt.text = var_64_1

	setActive(tf(go(arg_64_0.consumePriceTxt)).parent, var_64_0 ~= var_64_1)
end

function var_0_0.UpdateFurniturePrice(arg_65_0, arg_65_1)
	local var_65_0 = Goods.Id2FurnitureId(arg_65_1.id)
	local var_65_1 = Furniture.New({
		id = var_65_0
	})
	local var_65_2 = var_65_1:getConfig("gem_price")

	arg_65_0.consumePriceTxt.text = var_65_2

	local var_65_3 = var_65_1:getPrice(PlayerConst.ResDiamond)

	arg_65_0.consumeRealPriceTxt.text = var_65_3

	setActive(tf(go(arg_65_0.consumePriceTxt)).parent, var_65_2 ~= var_65_3)
end

function var_0_0.FlushObtainBtn(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_0:GetObtainBtnState(arg_66_1)
	local var_66_1 = arg_66_0.obtainBtnSprites[var_66_0]

	if not var_66_1 then
		var_66_1 = GetSpriteFromAtlas("ui/skinshopui_atlas", var_0_12(var_66_0))
		arg_66_0.obtainBtnSprites[var_66_0] = var_66_1
	end

	arg_66_0.obtainBtnImg.sprite = var_66_1

	arg_66_0.obtainBtnImg:SetNativeSize()
	setActive(arg_66_0.giftTag, var_66_0 == var_0_11)
	setActive(arg_66_0.giftItem, var_66_0 == var_0_11)

	if var_66_0 == var_0_11 then
		arg_66_0:FlushGift(arg_66_1)
	else
		arg_66_0.giftText.text = ""
	end

	onButton(arg_66_0, arg_66_0.obtainBtn, function()
		local var_67_0 = {}

		if SkinCouponActivity.StaticEncoreActTip(arg_66_1.id) then
			table.insert(var_67_0, function(arg_68_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Hint"),
					onYes = function()
						local var_69_0 = checkExist(SkinCouponActivity.GetSkinCouponEncoreAct(), {
							"id"
						})

						if var_69_0 then
							arg_66_0:emit(NewSkinShopMediator.OPEN_ACTIVITY, var_69_0)
						end
					end,
					onNo = arg_68_0
				})
			end)
		end

		seriesAsync(var_67_0, function()
			if var_66_0 == var_0_5 or var_66_0 == var_0_7 or var_66_0 == var_0_11 then
				arg_66_0.purchaseView:ExecuteAction("Show", arg_66_1)
			else
				arg_66_0:OnClickBtn(var_66_0, arg_66_1)
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.OnClickBtn(arg_71_0, arg_71_1, arg_71_2)
	if arg_71_1 == var_0_5 or arg_71_1 == var_0_7 or arg_71_1 == var_0_11 then
		arg_71_0:OnPurchase(arg_71_2)
	elseif arg_71_1 == var_0_10 then
		arg_71_0:OnItemPurchase(arg_71_2)
	elseif arg_71_1 == var_0_6 then
		arg_71_0:OnActivity(arg_71_2)
	elseif arg_71_1 == var_0_8 then
		arg_71_0:OnBackyard(arg_71_2)
	elseif arg_71_1 == var_0_9 then
		if arg_71_0:GetMode() == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_71_0:OnExperience4Item(arg_71_2)
		else
			arg_71_0:OnExperience(arg_71_2)
		end
	end
end

function var_0_0.FlushGift(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_1:GetGiftList()
	local var_72_1 = var_72_0[1]

	updateDrop(arg_72_0.giftItem, {
		type = var_72_1.type,
		id = var_72_1.id,
		count = var_72_1.count
	})

	local var_72_2 = #var_72_0 > 1 and "+" .. #var_72_0 - 1 .. "..." or ""

	arg_72_0.giftText.text = var_72_2
end

function var_0_0.OnItemPurchase(arg_73_0, arg_73_1)
	if arg_73_1.type ~= Goods.TYPE_SKIN then
		return
	end

	local var_73_0 = arg_73_1:GetVoucherIdList()
	local var_73_1 = getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_73_1.id)

	if #var_73_0 <= 0 and #var_73_1 <= 0 then
		return
	end

	local var_73_2 = {}

	for iter_73_0, iter_73_1 in ipairs(var_73_0) do
		table.insert(var_73_2, iter_73_1)
	end

	for iter_73_2, iter_73_3 in ipairs(var_73_1) do
		table.insert(var_73_2, iter_73_3.id)
	end

	local var_73_3 = arg_73_0.skinId
	local var_73_4 = pg.ship_skin_template[var_73_3]
	local var_73_5 = SwitchSpecialChar(var_73_4.name, true)

	arg_73_0.voucherMsgBox:ExecuteAction("Show", {
		itemList = var_73_2,
		skinId = var_73_3,
		skinName = var_73_5,
		price = arg_73_1:GetPrice(),
		onYes = function(arg_74_0)
			if arg_74_0 then
				arg_73_0:emit(NewSkinShopMediator.ON_ITEM_PURCHASE, arg_74_0, arg_73_1.id)
			else
				arg_73_0:emit(NewSkinShopMediator.ON_SHOPPING, arg_73_1.id, 1)
			end
		end
	})
end

function var_0_0.OnPurchase(arg_75_0, arg_75_1)
	if arg_75_1.type ~= Goods.TYPE_SKIN then
		return
	end

	if arg_75_1:isDisCount() and arg_75_1:IsItemDiscountType() then
		arg_75_0:emit(NewSkinShopMediator.ON_SHOPPING_BY_ACT, arg_75_1.id, 1)
	else
		arg_75_0:emit(NewSkinShopMediator.ON_SHOPPING, arg_75_1.id, 1)
	end
end

function var_0_0.OnActivity(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_1:getConfig("time")
	local var_76_1 = arg_76_1:getConfig("activity")
	local var_76_2 = getProxy(ActivityProxy):getActivityById(var_76_1)

	if var_76_1 == 0 and pg.TimeMgr.GetInstance():inTime(var_76_0) or var_76_2 and not var_76_2:isEnd() then
		if arg_76_1.type == Goods.TYPE_ACTIVITY then
			arg_76_0:emit(NewSkinShopMediator.GO_SHOPS_LAYER, arg_76_1:getConfig("activity"))
		elseif arg_76_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			local var_76_3 = arg_76_1:getConfig("scene")

			if var_76_3 and #var_76_3 > 0 then
				arg_76_0:emit(NewSkinShopMediator.OPEN_SCENE, var_76_3)
			else
				arg_76_0:emit(NewSkinShopMediator.OPEN_ACTIVITY, var_76_1)
			end
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
	end
end

function var_0_0.OnBackyard(arg_77_0, arg_77_1)
	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "BackYardMediator") then
		local var_77_0 = pg.open_systems_limited[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_77_0.name, var_77_0.level))

		return
	end

	arg_77_0:emit(NewSkinShopMediator.ON_BACKYARD_SHOP)
end

function var_0_0.OnExperience(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_0.skinId
	local var_78_1 = getProxy(ShipSkinProxy):getSkinById(var_78_0)

	if var_78_1 and not var_78_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_78_2 = arg_78_1:getConfig("resource_num")
	local var_78_3 = arg_78_1:getConfig("time_second") * var_78_2
	local var_78_4, var_78_5, var_78_6, var_78_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_78_3)
	local var_78_8 = pg.ship_skin_template[arg_78_0.skinId].name

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_78_2, var_78_8, var_78_4, var_78_5),
		onYes = function()
			if getProxy(PlayerProxy):getRawData():getSkinTicket() < var_78_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_78_0:emit(NewSkinShopMediator.ON_SHOPPING, arg_78_1.id, 1)
		end
	})
end

function var_0_0.OnExperience4Item(arg_80_0, arg_80_1)
	local var_80_0 = arg_80_0.skinId
	local var_80_1 = getProxy(ShipSkinProxy):getSkinById(var_80_0)

	if var_80_1 and not var_80_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_80_2 = arg_80_1:getConfig("resource_num")
	local var_80_3 = arg_80_1:getConfig("time_second") * var_80_2
	local var_80_4, var_80_5, var_80_6, var_80_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_80_3)
	local var_80_8 = pg.ship_skin_template[arg_80_0.skinId].name
	local var_80_9 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_80_10 = _.detect(var_80_9, function(arg_81_0)
		return arg_81_0:CanUseForShop(arg_80_1.id)
	end)

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_80_2, var_80_8, var_80_4, var_80_5),
		onYes = function()
			if not var_80_10 or var_80_10.count < var_80_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_80_0:emit(NewSkinShopMediator.ON_ITEM_EXPERIENCE, var_80_10.id, arg_80_1.id, 1)
		end
	})
end

function var_0_0.FlushTag(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_0.skinId
	local var_83_1 = pg.ship_skin_template[var_83_0].tag

	arg_83_0.uiTagList:make(function(arg_84_0, arg_84_1, arg_84_2)
		if arg_84_0 == UIItemList.EventUpdate then
			LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_83_1[arg_84_1 + 1]), function(arg_85_0)
				if arg_83_0.exited then
					return
				end

				local var_85_0 = arg_84_2:Find("icon"):GetComponent(typeof(Image))

				var_85_0.sprite = arg_85_0

				var_85_0:SetNativeSize()
			end)
		end
	end)
	arg_83_0.uiTagList:align(#var_83_1)
end

function var_0_0.FlushChar(arg_86_0, arg_86_1, arg_86_2)
	if arg_86_0.prefabName and arg_86_0.prefabName == arg_86_1 then
		return
	end

	arg_86_0:ReturnChar()
	PoolMgr.GetInstance():GetSpineChar(arg_86_1, true, function(arg_87_0)
		arg_86_0.spineChar = tf(arg_87_0)
		arg_86_0.prefabName = arg_86_1

		local var_87_0 = pg.skinshop_spine_scale[arg_86_2]

		if var_87_0 then
			arg_86_0.spineChar.localScale = Vector3(var_87_0.skinshop_scale, var_87_0.skinshop_scale, 1)
		else
			arg_86_0.spineChar.localScale = Vector3(0.9, 0.9, 1)
		end

		arg_86_0.spineChar.localPosition = Vector3(0, 0, 0)

		pg.ViewUtils.SetLayer(arg_86_0.spineChar, Layer.UI)
		setParent(arg_86_0.spineChar, arg_86_0.charTf)
		arg_87_0:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end)
end

function var_0_0.FlushTimeline(arg_88_0, arg_88_1)
	local var_88_0 = arg_88_0.skinId
	local var_88_1 = false
	local var_88_2

	if arg_88_1:IsActivityExtra() and arg_88_1:ShowMaintenanceTime() then
		local var_88_3, var_88_4 = arg_88_1:GetMaintenanceMonthAndDay()

		function var_88_2()
			return i18n("limit_skin_time_before_maintenance", var_88_3, var_88_4)
		end

		var_88_1 = true
	elseif arg_88_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		local var_88_5 = getProxy(ShipSkinProxy):getSkinById(var_88_0)

		var_88_1 = var_88_5 and var_88_5:isExpireType() and not var_88_5:isExpired()

		if var_88_1 then
			function var_88_2()
				return skinTimeStamp(var_88_5:getRemainTime())
			end
		end
	else
		local var_88_6, var_88_7 = pg.TimeMgr.GetInstance():inTime(arg_88_1:getConfig("time"))

		var_88_1 = var_88_7

		if var_88_1 then
			local var_88_8 = pg.TimeMgr.GetInstance():Table2ServerTime(var_88_7)

			function var_88_2()
				return skinCommdityTimeStamp(var_88_8)
			end
		end
	end

	setActive(arg_88_0.timeLimitTr, var_88_1)
	arg_88_0:ClearTimer()

	if var_88_1 then
		arg_88_0:AddTimer(var_88_2)
	end
end

function var_0_0.AddTimer(arg_92_0, arg_92_1)
	arg_92_0.timer = Timer.New(function()
		arg_92_0.timeLimitTxt.text = arg_92_1()
	end, 1, -1)

	arg_92_0.timer.func()
	arg_92_0.timer:Start()
end

function var_0_0.ClearTimer(arg_94_0)
	if arg_94_0.timer then
		arg_94_0.timer:Stop()

		arg_94_0.timer = nil
	end
end

function var_0_0.ReturnChar(arg_95_0)
	if not IsNil(arg_95_0.spineChar) then
		arg_95_0.spineChar.gameObject:GetComponent("SpineAnimUI"):SetActionCallBack(nil)
		PoolMgr.GetInstance():ReturnSpineChar(arg_95_0.prefabName, arg_95_0.spineChar.gameObject)

		arg_95_0.spineChar = nil
		arg_95_0.prefabName = nil
	end
end

function var_0_0.ClosePurchaseView(arg_96_0)
	if arg_96_0.purchaseView and arg_96_0.purchaseView:GetLoaded() then
		arg_96_0.purchaseView:Hide()
	end
end

function var_0_0.AdjustPainting(arg_97_0, arg_97_1)
	local var_97_0 = arg_97_0.paintingTF
	local var_97_1 = pg.ship_skin_newmainui_shift[arg_97_0.skinId]

	if var_97_1 then
		local var_97_2 = var_97_1.skin_shop_shift

		if arg_97_1 then
			var_97_0.anchoredPosition = Vector2(var_97_2[1] - 440, var_97_2[2] + arg_97_0.defaultPaintingPosition.y)
		else
			var_97_0.anchoredPosition = Vector2(var_97_2[1] + arg_97_0.defaultPaintingPosition.x, var_97_2[2] + arg_97_0.defaultPaintingPosition.y)
		end

		local var_97_3 = var_97_2[4]

		var_97_0.localScale = Vector3(var_97_3, var_97_3, 1)
	end
end

function var_0_0.Dispose(arg_98_0)
	arg_98_0.exited = true

	pg.DelegateInfo.Dispose(arg_98_0)
	arg_98_0:ClearSwitchBgAnim()
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_98_0:getUIName())

	if arg_98_0.live2dChar then
		arg_98_0.live2dChar:Dispose()

		arg_98_0.live2dChar = nil
	end

	if arg_98_0.voucherMsgBox then
		arg_98_0.voucherMsgBox:Destroy()

		arg_98_0.voucherMsgBox = nil
	end

	if arg_98_0.purchaseView then
		arg_98_0.purchaseView:Destroy()

		arg_98_0.purchaseView = nil
	end

	for iter_98_0, iter_98_1 in pairs(arg_98_0.downloads) do
		iter_98_1:Dispose()
	end

	arg_98_0.downloads = {}

	arg_98_0:ClearPainting()

	for iter_98_2, iter_98_3 in pairs(arg_98_0.obtainBtnSprites) do
		arg_98_0.obtainBtnSprites[iter_98_3] = nil
	end

	arg_98_0.obtainBtnSprites = nil

	if arg_98_0.interactionPreview then
		arg_98_0.interactionPreview:Dispose()

		arg_98_0.interactionPreview = nil
	end

	arg_98_0:ClearSwitchTween()
	arg_98_0:disposeEvent()
	arg_98_0:ClearTimer()
	arg_98_0:ReturnChar()
end

return var_0_0
