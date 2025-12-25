local var_0_0 = class("NewSkinShowLayer", import("...base.BaseUI"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3

function var_0_0.getUIName(arg_1_0)
	return "NewSkinShowUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("adapt/top/closeBtn")
	arg_2_0.homeBtn = arg_2_0._tf:Find("adapt/top/homeBtn")
	arg_2_0.bgs = arg_2_0._tf:Find("bgs")
	arg_2_0.resources = arg_2_0._tf:Find("adapt/top/resources")
	arg_2_0.limitTime = arg_2_0._tf:Find("adapt/top/skinTitle/limit_time")
	arg_2_0.skinName = arg_2_0._tf:Find("adapt/top/skinTitle/skin_name_mask/skin_name")
	arg_2_0.shipName = arg_2_0._tf:Find("adapt/top/skinTitle/name_mask/name")
	arg_2_0.changeSkin = arg_2_0._tf:Find("adapt/top/change_skin")
	arg_2_0.sdTg = arg_2_0._tf:Find("adapt/right/sdTg")
	arg_2_0.hideUITg = arg_2_0._tf:Find("adapt/right/hideUITg")
	arg_2_0.charContainer = arg_2_0._tf:Find("adapt/right/char_container")
	arg_2_0.backChara = arg_2_0.charContainer:Find("bg/back/chara")
	arg_2_0.charTf = arg_2_0.charContainer:Find("char")
	arg_2_0.furnitureContainer = arg_2_0.charContainer:Find("fur")
	arg_2_0.dynamicToggle = arg_2_0._tf:Find("adapt/right/functionsAndTags/dynamic")
	arg_2_0.showBgToggle = arg_2_0._tf:Find("adapt/right/functionsAndTags/showBg")
	arg_2_0.dynamicResToggle = arg_2_0._tf:Find("adapt/right/functionsAndTags/dynamic/l2d_res_state")
	arg_2_0.tagList = UIItemList.New(arg_2_0._tf:Find("adapt/right/functionsAndTags/tags"), arg_2_0._tf:Find("adapt/right/functionsAndTags/tags/tag"))
	arg_2_0.switchPreviewBtn = arg_2_0.charContainer:Find("switch")
	arg_2_0.painting = arg_2_0._tf:Find("painting")
	arg_2_0.paintingTF = arg_2_0._tf:Find("painting/paint")
	arg_2_0.defaultPaintingPosition = arg_2_0.paintingTF.anchoredPosition
	arg_2_0.defaultPaintingScale = arg_2_0.paintingTF.localScale
	arg_2_0.live2dContainer = arg_2_0._tf:Find("painting/paint/live2d")
	arg_2_0.spTF = arg_2_0._tf:Find("painting/paint/spinePainting")
	arg_2_0.spBg = arg_2_0._tf:Find("painting/paintBg/spinePainting")
	arg_2_0.equipBtn = arg_2_0._tf:Find("adapt/equipBtn")

	setText(arg_2_0._tf:Find("bgs/empty/Text"), i18n("shop_new_unfound"))
	setText(arg_2_0._tf:Find("adapt/top/title/Text"), i18n("shop_new_shop"))
	setText(arg_2_0.equipBtn:Find("Text"), i18n("shop_new_wear"))
	setActive(arg_2_0.switchPreviewBtn, false)
	setActive(arg_2_0.limitTime, false)

	arg_2_0.changeSkinToggle = ChangeSkinToggle.New(arg_2_0.changeSkin:Find("toggle_ui"))
	arg_2_0.downloads = {}
	arg_2_0.isToggleDynamic = false
	arg_2_0.isToggleShowBg = true
	arg_2_0.selectShipPage = ChangeShipSkinPage.New(arg_2_0._parentTf, arg_2_0.event)

	pg.UIMgr.GetInstance():OverlayPanel(arg_2_0._tf)
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0.shipSkin = arg_3_0.contextData.skin
	arg_3_0.skinId = arg_3_0.shipSkin.id

	arg_3_0:SetResource()
	arg_3_0:UpdateMainView()
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.homeBtn, function()
		arg_3_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)

	local var_3_0 = getProxy(PlayerProxy):getRawData().id

	onToggle(arg_3_0, arg_3_0.sdTg, function(arg_6_0)
		setActive(arg_3_0.charContainer, arg_6_0)
		PlayerPrefs.SetInt("LatestSkinShopLayerSdTg" .. var_3_0, arg_6_0 and 1 or 0)
		PlayerPrefs.Save()
	end, SFX_PANEL)

	local var_3_1 = PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_3_0, 0)

	triggerToggle(arg_3_0.sdTg, var_3_1 == 1)
	onToggle(arg_3_0, arg_3_0.sdTg, function(arg_7_0)
		setActive(arg_3_0.charContainer, arg_7_0)
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.hideUITg, function(arg_8_0)
		setActive(arg_3_0._tf:Find("adapt/top"), not arg_8_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.equipBtn, function()
		if arg_3_0.shipSkin:CantUse() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("without_ship_to_wear"))

			return
		end

		arg_3_0.selectShipPage:ExecuteAction("Show", arg_3_0.shipSkin)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.changeSkin, function()
		if ShipSkin.IsChangeSkin(arg_3_0.skinId) then
			arg_3_0.changeSkinId = ShipSkin.GetChangeSkinNextId(arg_3_0.skinId)

			arg_3_0:UpdateMainView()
		end
	end, SFX_PANEL)
end

function var_0_0.SetResource(arg_11_0)
	local var_11_0 = getProxy(PlayerProxy):getRawData()

	setText(arg_11_0.resources:Find("gem/Text"), var_11_0:getTotalGem())
	onButton(arg_11_0, arg_11_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.UpdateMainView(arg_13_0)
	local var_13_0 = ShipSkin.IsChangeSkin(arg_13_0.skinId)

	setActive(arg_13_0.changeSkin, var_13_0)

	if var_13_0 then
		arg_13_0:FlushChangeSkin()
	end

	arg_13_0:FlushName()
	arg_13_0:FlushSkin()
	arg_13_0:FlushPaintingToggle()
	arg_13_0:FlushTag()
	arg_13_0:FlushBG()
	arg_13_0:FlushPainting()
end

function var_0_0.FlushChangeSkin(arg_14_0)
	local var_14_0 = ShipSkin.GetChangeSkinGroupId(arg_14_0.skinId)

	if not arg_14_0.changeSkinId then
		arg_14_0.changeSkinId = arg_14_0.skinId
	elseif ShipSkin.GetChangeSkinGroupId(arg_14_0.changeSkinId) == var_14_0 then
		arg_14_0.skinId = arg_14_0.changeSkinId
		arg_14_0.shipSkin = ShipSkin.New({
			id = arg_14_0.skinId
		})
	else
		arg_14_0.changeSkinId = arg_14_0.skinId
	end

	arg_14_0._toggleIndex = ShipSkin.GetChangeSkinIndex(arg_14_0.skinId)

	arg_14_0.changeSkinToggle:setSkinData(arg_14_0.skinId)
	setActive(arg_14_0.changeSkin, not arg_14_0.changeSkinToggle:IsAsmrSkin())
end

function var_0_0.FlushName(arg_15_0)
	local var_15_0 = pg.ship_skin_template[arg_15_0.skinId]

	setScrollText(arg_15_0.skinName, SwitchSpecialChar(var_15_0.name, true))

	if var_15_0.skin_type == ShipSkin.SKIN_TYPE_TB then
		setScrollText(arg_15_0.shipName, NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_15_0.skinId)))
	else
		local var_15_1 = ShipGroup.getDefaultShipConfig(var_15_0.ship_group)

		setScrollText(arg_15_0.shipName, var_15_1.name)
	end
end

function var_0_0.FlushSkin(arg_16_0)
	if pg.ship_skin_template[arg_16_0.skinId].skin_type == ShipSkin.SKIN_TYPE_TB then
		setActive(arg_16_0.charContainer, false)

		return
	end

	setActive(arg_16_0.charContainer, true)

	local var_16_0 = pg.ship_skin_template[arg_16_0.skinId]

	arg_16_0:FlushChar(var_16_0.prefab, var_16_0.id)
	GetImageSpriteFromAtlasAsync("qicon/" .. var_16_0.painting, "", arg_16_0.backChara)
end

function var_0_0.FlushChar(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.prefabName and arg_17_0.prefabName == arg_17_1 then
		return
	end

	arg_17_0:ReturnChar()

	arg_17_0.prefabName = arg_17_1

	PoolMgr.GetInstance():GetSpineChar(arg_17_1, true, function(arg_18_0)
		if arg_17_0.prefabName ~= arg_17_1 then
			PoolMgr.GetInstance():ReturnSpineChar(arg_17_1, arg_18_0)

			return
		end

		arg_17_0.spineChar = tf(arg_18_0)

		local var_18_0 = pg.skinshop_spine_scale[arg_17_2]

		if var_18_0 then
			arg_17_0.spineChar.localScale = Vector3(var_18_0.skinshop_scale, var_18_0.skinshop_scale, 1)
		else
			arg_17_0.spineChar.localScale = Vector3(0.9, 0.9, 1)
		end

		arg_17_0.spineChar.localPosition = Vector3(0, 0, 0)

		pg.ViewUtils.SetLayer(arg_17_0.spineChar, Layer.UI)
		setParent(arg_17_0.spineChar, arg_17_0.charTf)
		arg_18_0:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end)
end

function var_0_0.FlushPaintingToggle(arg_19_0)
	removeOnToggle(arg_19_0.dynamicToggle)
	removeOnToggle(arg_19_0.showBgToggle)

	local var_19_0 = checkABExist("painting/" .. arg_19_0.shipSkin:getConfig("painting") .. "_n")

	if arg_19_0.isToggleShowBg and not var_19_0 then
		triggerToggle(arg_19_0.showBgToggle, false)

		arg_19_0.isToggleShowBg = false
	elseif var_19_0 then
		triggerToggle(arg_19_0.showBgToggle, true)

		arg_19_0.isToggleShowBg = true
	end

	local var_19_1 = arg_19_0.shipSkin:IsSpine() or arg_19_0.shipSkin:IsLive2d() or arg_19_0.shipSkin:IsSpinePlus() or arg_19_0.shipSkin:IsLive2dPlus()

	if var_19_1 and PlayerPrefs.GetInt("skinShop#l2dPreViewToggle" .. getProxy(PlayerProxy):getRawData().id, 0) == 1 then
		arg_19_0.isToggleDynamic = true
	end

	if var_19_1 then
		local var_19_2 = 0

		if arg_19_0.shipSkin:IsSpine() then
			var_19_2 = 6
		elseif arg_19_0.shipSkin:IsLive2d() then
			var_19_2 = 1
		elseif arg_19_0.shipSkin:IsSpinePlus() then
			var_19_2 = 7
		elseif arg_19_0.shipSkin:IsLive2dPlus() then
			var_19_2 = 9
		end

		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_19_2) .. "_off", arg_19_0.dynamicToggle)
		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_19_2), arg_19_0.dynamicToggle:Find("select"))
	end

	if arg_19_0.isToggleDynamic and not var_19_1 then
		triggerToggle(arg_19_0.dynamicToggle, false)

		arg_19_0.isToggleDynamic = false
	elseif arg_19_0.isToggleDynamic and not arg_19_0.dynamicToggle:GetComponent(typeof(Toggle)).isOn then
		if (arg_19_0.shipSkin:IsLive2d() or arg_19_0.shipSkin:IsLive2dPlus()) and Live2dConst.GetLive2DArm32MatchAble() then
			arg_19_0.isToggleDynamic = false

			local var_19_3 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_19_3, 0)
			PlayerPrefs.Save()
			triggerToggle(arg_19_0.dynamicToggle, false)
		else
			triggerToggle(arg_19_0.dynamicToggle, true)

			arg_19_0.isToggleDynamic = true
		end
	end

	if var_19_0 then
		onToggle(arg_19_0, arg_19_0.showBgToggle, function(arg_20_0)
			arg_19_0.isToggleShowBg = arg_20_0

			arg_19_0:FlushPainting()
			arg_19_0:FlushBG()
		end, SFX_PANEL)
	end

	if arg_19_0.shipSkin:IsSpine() or arg_19_0.shipSkin:IsLive2d() or arg_19_0.shipSkin:IsSpinePlus() or arg_19_0.shipSkin:IsLive2dPlus() then
		onToggle(arg_19_0, arg_19_0.dynamicToggle, function(arg_21_0)
			if arg_21_0 and Live2dConst.GetLive2DArm32MatchAble() and (arg_19_0.shipSkin:IsLive2d() or arg_19_0.shipSkin:IsLive2dPlus()) then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_19_0.dynamicToggle, false)

				return
			end

			arg_19_0.isToggleDynamic = arg_21_0

			setActive(arg_19_0.showBgToggle, not arg_21_0 and var_19_0)
			arg_19_0:FlushPainting()
			arg_19_0:FlushDynamicPaintingResState()
			arg_19_0:RecordFlag(arg_21_0)
		end, SFX_PANEL)
	end

	if arg_19_0.isToggleDynamic then
		arg_19_0:FlushDynamicPaintingResState()
	end

	setActive(arg_19_0.dynamicToggle, var_19_1)
	setActive(arg_19_0.showBgToggle, not arg_19_0.isToggleDynamic and var_19_0)
end

function var_0_0.FlushPainting(arg_22_0)
	local var_22_0 = arg_22_0:GetPaintingState()
	local var_22_1 = pg.ship_skin_template[arg_22_0.skinId].painting
	local var_22_2 = ShipSkin.GetChangeSkinData(arg_22_0.skinId) and true or false

	if var_22_0 == var_0_2 and not arg_22_0:ExistL2dRes(var_22_1) or var_22_0 == var_0_3 and not arg_22_0:ExistSpineRes(var_22_1) then
		var_22_0 = var_0_1
	end

	if arg_22_0.paintingState and arg_22_0.paintingState.state == var_22_0 and arg_22_0.paintingState.id == arg_22_0.skinId and arg_22_0.paintingState.showBg == arg_22_0.isToggleShowBg and not var_22_2 then
		return
	end

	arg_22_0:ClearPainting()

	if var_22_0 == var_0_1 then
		arg_22_0:LoadMeshPainting(arg_22_0.isToggleShowBg)
	elseif var_22_0 == var_0_2 then
		arg_22_0:LoadL2dPainting()
	elseif var_22_0 == var_0_3 then
		arg_22_0:LoadSpinePainting()
	end

	arg_22_0.paintingState = {
		state = var_22_0,
		id = arg_22_0.skinId,
		showBg = arg_22_0.isToggleShowBg
	}

	arg_22_0:AdjustPainting(false)
end

function var_0_0.GetPaintingState(arg_23_0)
	if arg_23_0.isToggleDynamic and (arg_23_0.shipSkin:IsLive2d() or arg_23_0.shipSkin:IsLive2dPlus()) then
		return var_0_2
	elseif arg_23_0.isToggleDynamic and (arg_23_0.shipSkin:IsSpine() or arg_23_0.shipSkin:IsSpinePlus()) then
		if arg_23_0.shipSkin:getConfig("spine_use_live2d") == 1 then
			return var_0_2
		end

		return var_0_3
	else
		return var_0_1
	end
end

function var_0_0.ExistL2dRes(arg_24_0, arg_24_1)
	local var_24_0 = "live2d/" .. string.lower(arg_24_1)
	local var_24_1 = HXSet.autoHxShiftPath(var_24_0, nil, true)

	return checkABExist(var_24_1), var_24_1
end

function var_0_0.ExistSpineRes(arg_25_0, arg_25_1)
	local var_25_0 = "SpinePainting/" .. string.lower(arg_25_1)
	local var_25_1 = HXSet.autoHxShiftPath(var_25_0, nil, true)

	return checkABExist(var_25_1), var_25_1
end

function var_0_0.FlushBG(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.skinId
	local var_26_1 = pg.ship_skin_template[var_26_0]
	local var_26_2

	if var_26_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		var_26_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_26_0))
	else
		local var_26_3 = ShipGroup.getDefaultShipConfig(var_26_1.ship_group)

		var_26_2 = Ship.New({
			id = 999,
			configId = var_26_3.id,
			skin_id = var_26_0
		})
	end

	local var_26_4 = var_26_2:getShipBgPrint(true)
	local var_26_5 = pg.ship_skin_template[var_26_0].painting

	if (arg_26_0.isToggleShowBg or not checkABExist("painting/" .. var_26_5 .. "_n")) and var_26_1.bg_sp ~= "" then
		var_26_4 = var_26_1.bg_sp
	end

	local var_26_6 = var_26_4 ~= var_26_2:rarity2bgPrintForGet()

	if var_26_6 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_26_0, var_26_4, arg_26_0.bgs:Find("diffBg"), arg_26_0.bgs:Find("diffBg/bg"), function(arg_27_0)
			if arg_26_1 then
				arg_26_1()
			end
		end, function(arg_28_0)
			if arg_26_1 then
				arg_26_1()
			end
		end)
	else
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_26_0:getUIName())

		if arg_26_1 then
			arg_26_1()
		end
	end

	setActive(arg_26_0.bgs:Find("diffBg"), var_26_6)
	setActive(arg_26_0.bgs:Find("default"), not var_26_6)
end

function var_0_0.FlushDynamicPaintingResState(arg_29_0)
	if not arg_29_0.isToggleDynamic then
		return
	end

	local var_29_0 = arg_29_0:GetPaintingState()
	local var_29_1 = false
	local var_29_2 = ""
	local var_29_3 = pg.ship_skin_template[arg_29_0.skinId].painting

	if var_0_2 == var_29_0 then
		var_29_1, var_29_2 = arg_29_0:ExistL2dRes(var_29_3)
	elseif var_0_3 == var_29_0 then
		var_29_1, var_29_2 = arg_29_0:ExistSpineRes(var_29_3)
	end

	setActive(arg_29_0.dynamicResToggle, not var_29_1)
	removeOnButton(arg_29_0.dynamicResToggle)

	if not var_29_1 and var_29_2 ~= "" then
		onButton(arg_29_0, arg_29_0.dynamicResToggle, function()
			arg_29_0:DownloadDynamicPainting(var_29_2)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadDynamicPainting(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0.skinId

	if arg_31_0.downloads[var_31_0] then
		return
	end

	local var_31_1 = SkinShopDownloadRequest.New()

	arg_31_0.downloads[var_31_0] = var_31_1

	var_31_1:Start(arg_31_1, function(arg_32_0)
		if arg_32_0 and arg_31_0.paintingState and arg_31_0.paintingState.id == arg_31_0.skinId then
			arg_31_0:FlushPainting()
			arg_31_0:FlushDynamicPaintingResState()
		end

		var_31_1:Dispose()

		arg_31_0.downloads[var_31_0] = nil
	end)
end

function var_0_0.RecordFlag(arg_33_0, arg_33_1)
	local var_33_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_33_0, arg_33_1 and 1 or 0)
	PlayerPrefs.Save()
	arg_33_0:emit(LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN, arg_33_1)
end

function var_0_0.LoadMeshPainting(arg_34_0, arg_34_1)
	local var_34_0 = findTF(arg_34_0.paintingTF, "fitter")
	local var_34_1 = GetOrAddComponent(var_34_0, "PaintingScaler")

	var_34_1.FrameName = "chuanwu"
	var_34_1.Tween = 1

	local var_34_2 = pg.ship_skin_template[arg_34_0.skinId].painting
	local var_34_3 = var_34_2

	if not arg_34_1 and checkABExist("painting/" .. var_34_2 .. "_n") then
		var_34_2 = var_34_2 .. "_n"
	end

	if not checkABExist("painting/" .. var_34_2) then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetPainting(var_34_2, true, function(arg_35_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setParent(arg_35_0, var_34_0, false)
		ShipExpressionHelper.SetExpression(var_34_0:GetChild(0), var_34_3)

		arg_34_0.paintingName = var_34_2

		if arg_34_0.paintingState and arg_34_0.paintingState.id ~= arg_34_0.skinId then
			arg_34_0:ClearMeshPainting()
		end
	end)
end

function var_0_0.ClearMeshPainting(arg_36_0)
	local var_36_0 = arg_36_0.paintingTF:Find("fitter")

	if arg_36_0.paintingName and var_36_0.childCount > 0 then
		local var_36_1 = var_36_0:GetChild(0).gameObject

		PoolMgr.GetInstance():ReturnPainting(arg_36_0.paintingName, var_36_1)
	end

	arg_36_0.paintingName = nil
end

function var_0_0.LoadL2dPainting(arg_37_0)
	local var_37_0 = arg_37_0.skinId
	local var_37_1 = pg.ship_skin_template[var_37_0].skin_type
	local var_37_2

	if var_37_1 == ShipSkin.SKIN_TYPE_TB then
		var_37_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_37_0))
	else
		local var_37_3 = pg.ship_skin_template[var_37_0].ship_group
		local var_37_4 = ShipGroup.getDefaultShipConfig(var_37_3)

		var_37_2 = Ship.New({
			noChangeSkin = true,
			configId = var_37_4.id,
			skin_id = var_37_0
		})
	end

	local var_37_5 = Live2D.GenerateData({
		ship = var_37_2,
		position = Vector3(0, 0, -1),
		parent = arg_37_0.live2dContainer,
		offset = var_37_2:GetSkinConfig().shop_offset
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_37_0.live2dChar = Live2D.New(var_37_5, function(arg_38_0)
		arg_38_0:IgonreReactPos(true)

		if arg_37_0.paintingState and arg_37_0.paintingState.id ~= arg_37_0.skinId then
			arg_37_0:ClearL2dPainting()
		end

		arg_38_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearL2dPainting(arg_39_0)
	if arg_39_0.live2dChar then
		arg_39_0.live2dChar:Dispose()

		arg_39_0.live2dChar = nil
	end
end

function var_0_0.LoadSpinePainting(arg_40_0)
	local var_40_0 = arg_40_0.skinId
	local var_40_1 = pg.ship_skin_template[var_40_0].skin_type
	local var_40_2

	if var_40_1 == ShipSkin.SKIN_TYPE_TB then
		var_40_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_40_0))
	else
		local var_40_3 = pg.ship_skin_template[var_40_0].ship_group
		local var_40_4 = ShipGroup.getDefaultShipConfig(var_40_3)

		var_40_2 = Ship.New({
			noChangeSkin = true,
			configId = var_40_4.id,
			skin_id = var_40_0
		})
	end

	local var_40_5 = SpinePainting.GenerateData({
		ship = var_40_2,
		position = Vector3(0, 0, 0),
		parent = arg_40_0.spTF,
		effectParent = arg_40_0.spBg,
		offset = var_40_2:GetSkinConfig().shop_offset
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_40_0.spinePainting = SpinePainting.New(var_40_5, function(arg_41_0)
		if arg_40_0.paintingState and arg_40_0.paintingState.id ~= arg_40_0.skinId then
			arg_40_0:ClearSpinePainting()
		end

		arg_40_0:InitSpecialTouch(var_40_2, arg_40_0.spTF)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearSpinePainting(arg_42_0)
	if arg_42_0.spinePainting and arg_42_0.spinePainting._tf then
		local var_42_0 = arg_42_0.spinePainting._tf:Find("shop_hx")

		arg_42_0.spinePainting:Dispose()

		arg_42_0.spinePainting = nil

		if arg_42_0.dragEvent then
			ClearEventTrigger(arg_42_0.dragEvent)
		end
	end
end

function var_0_0.InitSpecialTouch(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_1:getPainting()
	local var_43_1 = findTF(arg_43_2:GetChild(0), "hitArea")

	if not var_43_1 then
		return
	end

	eachChild(var_43_1, function(arg_44_0)
		if arg_43_0:getDragTouchAble(arg_44_0.name, var_43_0, false) then
			arg_43_0.dragEvent = GetOrAddComponent(arg_44_0, typeof(EventTriggerListener))

			arg_43_0.dragEvent:AddPointDownFunc(function(arg_45_0, arg_45_1)
				arg_43_0.dragActive = true
				arg_43_0.dragStart = arg_45_1.position
			end)
			arg_43_0.dragEvent:AddPointUpFunc(function(arg_46_0, arg_46_1)
				if arg_43_0.dragActive then
					arg_43_0.dragActive = false
					arg_43_0.dragOffset = Vector2(arg_43_0.dragStart.x - arg_46_1.position.x, arg_43_0.dragStart.y - arg_46_1.position.y)

					if math.abs(arg_43_0.dragOffset.x) < 200 or math.abs(arg_43_0.dragOffset.y) < 200 then
						arg_43_0.dragUp = arg_46_1.position

						if arg_43_0.spinePainting:isInAction() then
							return
						end

						local var_46_0

						if arg_43_0:getDragTouchAble(arg_44_0.name, var_43_0, true) then
							local var_46_1 = arg_43_0.spinePainting:readyDragAction(arg_44_0.name)
						end
					end
				end
			end)
			arg_43_0.dragEvent:AddDragFunc(function(arg_47_0, arg_47_1)
				if arg_43_0.dragActive then
					arg_43_0.dragOffset = Vector2(arg_43_0.dragStart.x - arg_47_1.position.x, arg_43_0.dragStart.y - arg_47_1.position.y)

					if math.abs(arg_43_0.dragOffset.x) > 200 or math.abs(arg_43_0.dragOffset.y) > 200 then
						arg_43_0.dragActive = false

						arg_43_0.spinePainting:readyDragAction(arg_44_0.name)
					end
				end
			end)
		else
			onButton(arg_43_0, arg_44_0, function()
				if arg_43_0.spinePainting:isInAction() then
					return
				end

				local var_48_0 = pg.AssistantInfo.getPaintingTouchEvents(arg_44_0.name)

				if arg_43_0:getDragTouchAble(arg_44_0.name, var_43_0, true) then
					arg_43_0.spinePainting:readyDragAction(arg_44_0.name)
				end
			end)
		end
	end)
end

function var_0_0.getDragTouchAble(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0 = SpinePaintingConst.ship_drag_datas[arg_49_2]

	if not var_49_0 then
		return false
	end

	if var_49_0.drag_data and var_49_0.click_trigger ~= arg_49_3 then
		return false
	end

	if var_49_0.hit_area then
		return table.contains(var_49_0.hit_area, arg_49_1)
	end

	return false
end

function var_0_0.AdjustPainting(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0.paintingTF
	local var_50_1 = pg.ship_skin_newmainui_shift[arg_50_0.skinId]

	if var_50_1 then
		local var_50_2 = var_50_1.skin_shop_shift

		if arg_50_1 then
			var_50_0.anchoredPosition = Vector2(var_50_2[1] - 440, var_50_2[2] + arg_50_0.defaultPaintingPosition.y)
		else
			var_50_0.anchoredPosition = Vector2(var_50_2[1] + arg_50_0.defaultPaintingPosition.x, var_50_2[2] + arg_50_0.defaultPaintingPosition.y)
		end

		local var_50_3 = var_50_2[4]

		var_50_0.localScale = Vector3(var_50_3, var_50_3, 1)
	else
		var_50_0.anchoredPosition = Vector2(arg_50_0.defaultPaintingPosition.x, arg_50_0.defaultPaintingPosition.y)
		var_50_0.localScale = arg_50_0.defaultPaintingScale
	end
end

function var_0_0.ReturnChar(arg_51_0)
	if not IsNil(arg_51_0.spineChar) then
		arg_51_0.spineChar.gameObject:GetComponent("SpineAnimUI"):SetActionCallBack(nil)
		PoolMgr.GetInstance():ReturnSpineChar(arg_51_0.prefabName, arg_51_0.spineChar.gameObject)

		arg_51_0.spineChar = nil
		arg_51_0.prefabName = nil
	end
end

function var_0_0.FlushTag(arg_52_0)
	local var_52_0 = arg_52_0.skinId
	local var_52_1 = pg.ship_skin_template[var_52_0]
	local var_52_2 = Clone(var_52_1.tag)
	local var_52_3 = false

	for iter_52_0 = #var_52_2, 1, -1 do
		local var_52_4 = var_52_2[iter_52_0]

		if var_52_4 == 1 or var_52_4 == 6 or var_52_4 == 7 or var_52_4 == 9 then
			local var_52_5 = true

			table.remove(var_52_2, iter_52_0)
		end
	end

	local var_52_6 = checkABExist("painting/" .. arg_52_0.shipSkin:getConfig("painting") .. "_n")

	arg_52_0.tagList:make(function(arg_53_0, arg_53_1, arg_53_2)
		if arg_53_0 == UIItemList.EventUpdate then
			local var_53_0 = var_52_2[arg_53_1 + 1]

			LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_52_2[arg_53_1 + 1]), function(arg_54_0)
				if arg_52_0.exited then
					return
				end

				arg_53_2:GetComponent(typeof(Image)).sprite = arg_54_0
			end)
		end
	end)
	arg_52_0.tagList:align(#var_52_2)
end

function var_0_0.ClearPainting(arg_55_0)
	local var_55_0 = arg_55_0.paintingState

	if not var_55_0 then
		return
	end

	if var_55_0.state == var_0_1 then
		arg_55_0:ClearMeshPainting()
	elseif var_55_0.state == var_0_2 then
		arg_55_0:ClearL2dPainting()
	elseif var_55_0.state == var_0_3 then
		arg_55_0:ClearSpinePainting()
	end

	arg_55_0.paintingState = nil
end

function var_0_0.IsShowSelectShipView(arg_56_0)
	return arg_56_0.selectShipPage and arg_56_0.selectShipPage:GetLoaded() and arg_56_0.selectShipPage:isShowing()
end

function var_0_0.CloseSelectShipView(arg_57_0)
	arg_57_0.selectShipPage:Hide()
end

function var_0_0.willExit(arg_58_0)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_58_0:getUIName())

	if arg_58_0.live2dChar then
		arg_58_0.live2dChar:Dispose()

		arg_58_0.live2dChar = nil
	end

	for iter_58_0, iter_58_1 in pairs(arg_58_0.downloads) do
		iter_58_1:Dispose()
	end

	arg_58_0.downloads = {}

	arg_58_0:ClearPainting()
	arg_58_0:ReturnChar()
	arg_58_0.selectShipPage:Destroy()

	arg_58_0.selectShipPage = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_58_0._tf)
end

function var_0_0.onBackPressed(arg_59_0)
	if arg_59_0:IsShowSelectShipView() then
		arg_59_0:CloseSelectShipView()

		return
	end

	var_0_0.super.onBackPressed(arg_59_0)
end

return var_0_0
