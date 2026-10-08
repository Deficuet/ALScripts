local var_0_0 = class("NewShipLayer", import("..base.BaseUI"))

var_0_0.PAINT_DURATION = 0.35
var_0_0.STAR_DURATION = 0.5
var_0_0.STAR_ANIMATION_DUR1 = 0.075
var_0_0.STAR_ANIMATION_DUR2 = 0.1
var_0_0.STAR_ANIMATION_DUR3 = 0.4
var_0_0.STAR_ANIMATION_DUR4 = 0.26

local var_0_1 = 19

function var_0_0.getUIName(arg_1_0)
	return "NewShipUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"clutter/new",
		"shiptype"
	}
	local var_2_1 = arg_2_1.ship

	table.insert(var_2_0, string.format(ResPathSupport.ConstPath.Ship.Rarity.NewShipBG, var_2_1:rarity2bgPrintForGet()))

	if var_2_1:isBluePrintShip() then
		table.insert(var_2_0, string.format(ResPathSupport.ConstPath.Ship.Rarity.EffectDesign, var_2_1:getRarity()))
	end

	local var_2_2 = var_2_1:isMetaShip()

	if var_2_2 then
		table.insert(var_2_0, string.format(ResPathSupport.ConstPath.Ship.Rarity.EffectMeta, var_2_1:getRarity()))
	end

	if var_2_2 then
		local var_2_3 = MetaCharacterConst.getReMetaTransItem(var_2_1)

		table.insert(var_2_0, var_2_3:getConfig("icon"))
	end

	local var_2_4 = Ship.getPaintingName(var_2_1.configId)
	local var_2_5 = ResPathSupport.GetPaintingListByPaintingName(var_2_4)
	local var_2_6 = ResPathSupport.GetPaintingFaceListByPaintingName(var_2_4)

	table.insertto(var_2_0, var_2_5)
	table.insertto(var_2_0, var_2_6)

	local var_2_7 = var_2_1:getNation()

	_.each(ResPathSupport.ConstPath.Ship.Nation.PrintsFixList, function(arg_3_0)
		local var_3_0 = string.format(ResPathSupport.ConstPath.Ship.Nation.Prints, nation2print(var_2_7), arg_3_0)

		table.insert(var_2_0, var_3_0)
	end)

	local var_2_8 = var_2_1:getRarity()

	_.each(ResPathSupport.ConstPath.Ship.Rarity.ShipRarityFixList1, function(arg_4_0)
		_.each(ResPathSupport.ConstPath.Ship.Rarity.ShipRarityFixList2, function(arg_5_0)
			local var_5_0 = string.format(ResPathSupport.ConstPath.Ship.Rarity.ShipRarity, arg_4_0, var_2_8, arg_5_0)

			table.insert(var_2_0, var_5_0)
		end)
	end)
	_.each(ResPathSupport.ConstPath.Ship.Rarity.GetRoleFixList, function(arg_6_0)
		local var_6_0 = string.format(ResPathSupport.ConstPath.Ship.Rarity.GetRole, var_2_8, arg_6_0)

		table.insert(var_2_0, var_6_0)
	end)

	local var_2_9 = var_2_1:getGroupId()
	local var_2_10 = {
		ShipGroup.GetGroupConfig(var_2_9).trans_skin,
		ShipGroup.getDefaultSkin(var_2_9).id
	}

	_.each(var_2_10, function(arg_7_0)
		local var_7_0 = "ui/skinunlockanim/star_level_unlock_anim_" .. arg_7_0

		table.insert(var_2_0, var_7_0)
	end)

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.preload(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.contextData.ship

	LoadSpriteAsync("newshipbg/bg_" .. var_8_0:rarity2bgPrintForGet(), function(arg_9_0)
		arg_8_0.bgSprite = arg_9_0
		arg_8_0.isLoadBg = true

		arg_8_1()
	end)
end

function var_0_0.init(arg_10_0)
	arg_10_0._animator = GetComponent(arg_10_0._tf, "Animator")
	arg_10_0._canvasGroup = GetOrAddComponent(arg_10_0._tf, typeof(CanvasGroup))
	arg_10_0._shake = arg_10_0._tf:Find("shake_panel")
	arg_10_0._shade = arg_10_0._tf:Find("shade")
	arg_10_0._bg = arg_10_0._shake:Find("bg")
	arg_10_0._drag = arg_10_0._shake:Find("drag")
	arg_10_0._paintingTF = arg_10_0._shake:Find("paint")
	arg_10_0._paintingShadowTF = arg_10_0._shake:Find("shadow")
	arg_10_0._dialogue = arg_10_0._shake:Find("dialogue")
	arg_10_0._shipName = arg_10_0._dialogue:Find("bg/name"):GetComponent(typeof(Text))
	arg_10_0._shipType = arg_10_0._dialogue:Find("bg/type"):GetComponent(typeof(Text))
	arg_10_0._dialogueText = arg_10_0._dialogue:Find("Text")
	arg_10_0._left = arg_10_0._shake:Find("ForNotch/left_panel")
	arg_10_0._lockTF = arg_10_0._left:Find("lock")
	arg_10_0._lockBtn = arg_10_0._left:Find("lock/lock")
	arg_10_0._unlockBtn = arg_10_0._left:Find("lock/unlock_btn")
	arg_10_0._viewBtn = arg_10_0._left:Find("view_btn")
	arg_10_0._evaluationBtn = arg_10_0._left:Find("evaluation_btn")
	arg_10_0._shareBtn = arg_10_0._left:Find("share_btn")
	arg_10_0.audioBtn = arg_10_0._shake:Find("property_btn")
	arg_10_0.clickTF = arg_10_0._shake:Find("click")
	arg_10_0.npc = arg_10_0._tf:Find("shake_panel/npc")

	setActive(arg_10_0.npc, false)

	arg_10_0.newTF = arg_10_0._shake:Find("New")
	arg_10_0.rarityTF = arg_10_0._shake:Find("rarity")
	arg_10_0.starsTF = arg_10_0.rarityTF:Find("stars")
	arg_10_0.starsCont = arg_10_0.starsTF:Find("content")
	arg_10_0._skipButton = arg_10_0._shake:Find("ForNotch/skip")

	setActive(arg_10_0._skipButton, arg_10_0.contextData.canSkipBatch)
	setActive(arg_10_0._left, true)
	setActive(arg_10_0.audioBtn, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_10_0._tf)

	arg_10_0.metaRepeatTF = arg_10_0.rarityTF:Find("MetaRepeat")
	arg_10_0.metaDarkTF = arg_10_0._shake:Find("MetaMask")
	arg_10_0.rarityEffect = {}

	if arg_10_0.contextData.autoExitTime then
		arg_10_0.autoExitTimer = Timer.New(function()
			arg_10_0:showExitTip()
		end, arg_10_0.contextData.autoExitTime)

		arg_10_0.autoExitTimer:Start()

		arg_10_0.contextData.autoExitTime = nil
	end

	arg_10_0:PauseAnimation()
end

function var_0_0.voice(arg_12_0, arg_12_1)
	if not arg_12_1 then
		return
	end

	arg_12_0:stopVoice()

	arg_12_0._currentVoice = arg_12_1

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_12_1)
end

function var_0_0.stopVoice(arg_13_0)
	if arg_13_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_13_0._currentVoice)
	end

	arg_13_0._currentVoice = nil
end

function var_0_0.setShip(arg_14_0, arg_14_1)
	arg_14_0:recyclePainting()

	arg_14_0._shipVO = arg_14_1
	arg_14_0.isRemoulded = arg_14_1:isRemoulded()

	local var_14_0 = arg_14_1:isBluePrintShip()
	local var_14_1 = arg_14_1:isMetaShip()

	setImageSprite(arg_14_0._bg, arg_14_0.bgSprite)
	setActive(arg_14_0.metaDarkTF, arg_14_1:isMetaShip())

	if var_14_0 then
		if arg_14_0.metaBg then
			setActive(arg_14_0.metaBg, false)
		end

		if arg_14_0.designBg and arg_14_0.designName ~= "raritydesign" .. arg_14_1:getRarity() then
			PoolMgr.GetInstance():ReturnUI(arg_14_0.designName, arg_14_0.designBg)

			arg_14_0.designBg = nil
		end

		if not arg_14_0.designBg then
			PoolMgr.GetInstance():GetUI("raritydesign" .. arg_14_1:getRarity(), true, function(arg_15_0)
				arg_14_0.designBg = arg_15_0
				arg_14_0.designName = "raritydesign" .. arg_14_1:getRarity()

				arg_15_0.transform:SetParent(arg_14_0._shake, false)

				arg_15_0.transform.localPosition = Vector3(1, 1, 1)
				arg_15_0.transform.localScale = Vector3(1, 1, 1)

				arg_15_0.transform:SetSiblingIndex(1)
				setActive(arg_15_0, true)
			end)
		else
			setActive(arg_14_0.designBg, true)
		end
	elseif var_14_1 then
		if arg_14_0.designBg then
			setActive(arg_14_0.designBg, false)
		end

		if arg_14_0.metaBg and arg_14_0.metaName ~= "raritymeta" .. arg_14_1:getRarity() then
			PoolMgr.GetInstance():ReturnUI(arg_14_0.metaName, arg_14_0.metaBg)

			arg_14_0.metaBg = nil
		end

		if not arg_14_0.metaBg then
			PoolMgr.GetInstance():GetUI("raritymeta" .. arg_14_1:getRarity(), true, function(arg_16_0)
				arg_14_0.metaBg = arg_16_0
				arg_14_0.metaName = "raritymeta" .. arg_14_1:getRarity()

				arg_16_0.transform:SetParent(arg_14_0._shake, false)

				arg_16_0.transform.localPosition = Vector3(1, 1, 1)
				arg_16_0.transform.localScale = Vector3(1, 1, 1)

				arg_16_0.transform:SetSiblingIndex(1)
				setActive(arg_16_0, true)
			end)
		else
			setActive(arg_14_0.metaBg, true)
		end
	else
		if arg_14_0.designBg then
			setActive(arg_14_0.designBg, false)
		end

		if arg_14_0.metaBg then
			setActive(arg_14_0.metaBg, false)
		end
	end

	if arg_14_1.virgin and not arg_14_0.isRemoulded and not arg_14_1:isActivityNpc() then
		setActive(arg_14_0.newTF, true)
		LoadImageSpriteAsync("clutter/new", arg_14_0.newTF)

		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, arg_14_0._shipVO.groupId, 1) then
			local var_14_2 = pg.fleet_tech_ship_template[arg_14_0._shipVO.groupId].pt_get
			local var_14_3 = ShipType.FilterOverQuZhuType(pg.fleet_tech_ship_template[arg_14_0._shipVO.groupId].add_get_shiptype)
			local var_14_4 = pg.fleet_tech_ship_template[arg_14_0._shipVO.groupId].add_get_attr
			local var_14_5 = pg.fleet_tech_ship_template[arg_14_0._shipVO.groupId].add_get_value

			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TECPOINT, {
				point = var_14_2,
				typeList = var_14_3,
				attr = var_14_4,
				value = var_14_5
			})
		end
	else
		setActive(arg_14_0.newTF, false)

		local var_14_6 = arg_14_1:getReMetaSpecialItemVO()

		arg_14_0:updateLockTF(var_14_6 ~= nil)

		if var_14_6 then
			local var_14_7 = arg_14_0.metaRepeatTF:Find("Icon")
			local var_14_8 = arg_14_0.metaRepeatTF:Find("Count")

			setImageSprite(var_14_7, LoadSprite(var_14_6:getConfig("icon")))
			GetImageSpriteFromAtlasAsync(var_14_6:getConfig("icon"), "", var_14_7)
			setText(var_14_8, var_14_6.count)

			local var_14_9 = pg.ship_transform[arg_14_0._shipVO.groupId].exclusive_item[1][2]
			local var_14_10 = pg.ship_transform[arg_14_0._shipVO.groupId].common_item[1][2]
			local var_14_11 = arg_14_0.metaRepeatTF:Find("Special")
			local var_14_12 = arg_14_0.metaRepeatTF:Find("Commom")

			setActive(var_14_11, var_14_6.id == var_14_9)
			setActive(var_14_12, var_14_6.id == var_14_10)
		else
			setActive(arg_14_0.metaRepeatTF, false)
		end
	end

	setActive(arg_14_0.audioBtn, not arg_14_0.isRemoulded)
	arg_14_0:UpdateLockButton(arg_14_0._shipVO:GetLockState())

	local var_14_13 = arg_14_0._shipVO:getConfigTable()

	if arg_14_0.isRemoulded then
		setPaintingPrefabAsync(arg_14_0._paintingTF, arg_14_0._shipVO:getRemouldPainting(), "huode")
		setPaintingPrefabAsync(arg_14_0._paintingShadowTF, arg_14_0._shipVO:getRemouldPainting(), "huode")
	else
		setPaintingPrefabAsync(arg_14_0._paintingTF, arg_14_0._shipVO:getPainting(), "huode")
		setPaintingPrefabAsync(arg_14_0._paintingShadowTF, arg_14_0._shipVO:getPainting(), "huode")
	end

	arg_14_0._shipType.text = pg.ship_data_by_type[arg_14_0._shipVO:getShipType()].type_name
	arg_14_0._shipName.text = arg_14_1:getName()

	local var_14_14 = arg_14_1:getRarity()
	local var_14_15 = pg.ship_data_template[var_14_13.id].star_max
	local var_14_16 = arg_14_0._shipVO:getStar()

	if not (var_14_15 % 2 == 0) or not (var_14_15 / 2) then
		local var_14_17 = math.floor(var_14_15 / 2) + 1
	end

	local var_14_18 = 15

	for iter_14_0 = 1, 6 do
		local var_14_19 = arg_14_0.starsTF:Find("content/star_" .. iter_14_0)
		local var_14_20 = var_14_19:Find("star_empty")
		local var_14_21 = var_14_19:Find("star")

		setActive(var_14_21, iter_14_0 <= var_14_16)
		setActive(var_14_20, var_14_16 < iter_14_0)

		if var_14_15 < iter_14_0 then
			setActive(var_14_19, false)
		end
	end

	local var_14_22 = arg_14_0._shake:Find("rarity/nation")
	local var_14_23 = LoadSprite("prints/" .. nation2print(var_14_13.nationality) .. "_0")

	if not var_14_23 then
		warning("找不到印花, shipConfigId: " .. arg_14_1.configId)
		setActive(var_14_22, false)
	else
		setImageSprite(var_14_22, var_14_23, false)
	end

	local var_14_24 = arg_14_0._shake:Find("rarity/type")
	local var_14_25 = arg_14_0._shake:Find("rarity/type/rarLogo")

	if arg_14_1:isMetaShip() then
		LoadImageSpriteAsync("shiprarity/1" .. var_14_14 .. "m", var_14_24, true)
		LoadImageSpriteAsync("shiprarity/1" .. var_14_14 .. "s", var_14_25, true)
	else
		LoadImageSpriteAsync("shiprarity/" .. (var_14_0 and "0" or "") .. var_14_14 .. "m", var_14_24, true)
		LoadImageSpriteAsync("shiprarity/" .. (var_14_0 and "0" or "") .. var_14_14 .. "s", var_14_25, true)
	end

	setActive(var_14_22, false)
	setActive(arg_14_0.rarityTF, false)
	setActive(arg_14_0._shade, true)

	arg_14_0.inAnimating = true

	arg_14_0:AddLeanTween(function()
		return LeanTween.delayedCall(0.5, System.Action(function()
			setActive(var_14_22, true)
			setActive(arg_14_0.rarityTF, true)
			arg_14_0:starsAnimation()
		end))
	end)

	local var_14_26 = arg_14_0._shake:Find("ship_type")
	local var_14_27 = var_14_26:Find("stars")
	local var_14_28 = var_14_26:Find("stars/startpl")
	local var_14_29 = var_14_26:Find("english_name")

	setText(var_14_29, arg_14_0._shipVO:getConfig("english_name"))

	local var_14_30 = var_14_27.childCount
	local var_14_31 = arg_14_0._shipVO:getStar()
	local var_14_32 = arg_14_0._shipVO:getMaxStar()

	for iter_14_1 = var_14_30, var_14_32 - 1 do
		cloneTplTo(var_14_28, var_14_27)
	end

	local var_14_33 = var_14_27.childCount

	for iter_14_2 = 0, var_14_33 - 1 do
		local var_14_34 = var_14_27:GetChild(iter_14_2)

		var_14_34.gameObject:SetActive(iter_14_2 < var_14_32)
		setActive(var_14_34:Find("star"), iter_14_2 < var_14_31)
		setActive(var_14_34:Find("empty"), var_14_31 <= iter_14_2)
	end

	local var_14_35 = arg_14_0._shipVO:getConfigTable()

	findTF(var_14_26, "type_bg/type"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("shiptype", tostring(arg_14_0._shipVO:getShipType()))

	setScrollText(var_14_26:Find("name_bg/mask/Text"), arg_14_0._shipVO:getName())

	if var_14_0 then
		var_14_14 = var_14_14 .. "_1"
	elseif arg_14_1:isMetaShip() then
		var_14_14 = var_14_14 .. "_2"
	end

	if not arg_14_0.rarityEffect[var_14_14] then
		PoolMgr.GetInstance():GetUI("getrole_" .. var_14_14, true, function(arg_19_0)
			if IsNil(arg_14_0._tf) then
				return
			end

			arg_14_0.rarityEffect[var_14_14] = arg_19_0

			arg_19_0.transform:SetParent(arg_14_0._tf, false)

			arg_19_0.transform.localPosition = Vector3(1, 1, 1)
			arg_19_0.transform.localScale = Vector3(1, 1, 1)

			arg_19_0.transform:SetSiblingIndex(1)

			if arg_14_1:isMetaShip() then
				local var_19_0 = tf(arg_19_0):Find("fire_ruchang")

				var_19_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_20_0)
					setActive(var_14_22, true)
					setActive(var_19_0, false)
				end)
			end

			setActive(var_14_22, false)

			arg_14_0.effectObj = arg_19_0

			setActive(arg_14_0.effectObj, arg_14_0.isOpeningEnd)
		end)
	else
		arg_14_0.effectObj = arg_14_0.rarityEffect[var_14_14]

		setActive(arg_14_0.effectObj, arg_14_0.isOpeningEnd)
	end

	arg_14_0:playOpening(function()
		arg_14_0:ResumeAnimation()
		arg_14_0:DisplayWord()
	end)
end

function var_0_0.PauseAnimation(arg_22_0)
	arg_22_0._canvasGroup.alpha = 0
	arg_22_0._animator.enabled = false
end

function var_0_0.ResumeAnimation(arg_23_0)
	arg_23_0._canvasGroup.alpha = 1
	arg_23_0._animator.enabled = true
	arg_23_0.isOpeningEnd = true

	if arg_23_0.effectObj then
		setActive(arg_23_0.effectObj, true)
	end
end

function var_0_0.DisplayWord(arg_24_0)
	local var_24_0
	local var_24_1 = ""
	local var_24_2

	if arg_24_0.isRemoulded then
		local var_24_3 = arg_24_0._shipVO:getRemouldSkinId()

		var_24_1 = ShipWordHelper.RawGetWord(var_24_3, ShipWordHelper.WORD_TYPE_UNLOCK)

		if var_24_1 == "" then
			local var_24_4

			var_24_4, var_24_2, var_24_1 = ShipWordHelper.GetWordAndCV(var_24_3, ShipWordHelper.WORD_TYPE_DROP)
		else
			local var_24_5

			var_24_5, var_24_2, var_24_1 = ShipWordHelper.GetWordAndCV(var_24_3, ShipWordHelper.WORD_TYPE_UNLOCK)
		end
	else
		local var_24_6

		var_24_6, var_24_2, var_24_1 = ShipWordHelper.GetWordAndCV(arg_24_0._shipVO:getSkinId(), ShipWordHelper.WORD_TYPE_UNLOCK)
	end

	setWidgetText(arg_24_0._dialogue, SwitchSpecialChar(var_24_1, true), "Text")

	arg_24_0._dialogue.transform.localScale = Vector3(0, 1, 1)

	SetActive(arg_24_0._dialogue, false)
	arg_24_0:AddLeanTween(function()
		return LeanTween.delayedCall(0.5, System.Action(function()
			SetActive(arg_24_0._dialogue, true)
			arg_24_0:AddLeanTween(function()
				return LeanTween.scale(arg_24_0._dialogue, Vector3(1, 1, 1), 0.1)
			end)
			arg_24_0:voice(var_24_2)
		end))
	end)
end

function var_0_0.updateShip(arg_28_0, arg_28_1)
	arg_28_0._shipVO = arg_28_1
end

function var_0_0.switch2Property(arg_29_0)
	setActive(arg_29_0.newTF, false)
	setActive(arg_29_0._dialogue, false)
	setActive(arg_29_0.rarityTF, false)
	setActive(arg_29_0._shake:Find("rarity/nation"), false)

	local var_29_0 = arg_29_0._shake:Find("ship_type")

	setActive(var_29_0, true)
	arg_29_0:AddLeanTween(function()
		return LeanTween.move(rtf(var_29_0), Vector3(0, -149.55, 0), 0.3)
	end)
	arg_29_0:AddLeanTween(function()
		return LeanTween.move(rtf(arg_29_0._paintingTF), Vector3(-59, 21, 0), 0.2)
	end)
	arg_29_0:DisplayNewShipDocumentView()
end

function var_0_0.showExitTip(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0._shipVO:GetLockState()
	local var_32_1 = pg.settings_other_template[22]
	local var_32_2 = getProxy(PlayerProxy):getRawData():GetCommonFlag(_G[var_32_1.name])

	if var_32_1.default == 1 then
		var_32_2 = not var_32_2
	end

	if arg_32_0._shipVO.virgin and var_32_0 == Ship.LOCK_STATE_UNLOCK and not var_32_2 then
		if arg_32_0.effectObj then
			setActive(arg_32_0.effectObj, false)
		end

		if arg_32_0.effectLineObj then
			setActive(arg_32_0.effectLineObj, false)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			content = i18n("ship_lock_tip"),
			onYes = function()
				triggerButton(arg_32_0._lockBtn)

				if arg_32_1 then
					arg_32_1()
				else
					arg_32_0:emit(NewShipMediator.ON_EXIT)
				end
			end,
			onNo = function()
				if arg_32_1 then
					arg_32_1()
				else
					arg_32_0:emit(NewShipMediator.ON_EXIT)
				end
			end
		})
	elseif arg_32_1 then
		arg_32_1()
	else
		arg_32_0:emit(NewShipMediator.ON_EXIT)
	end
end

function var_0_0.UpdateLockButton(arg_35_0, arg_35_1)
	setActive(arg_35_0._lockBtn, arg_35_1 ~= Ship.LOCK_STATE_LOCK)
	setActive(arg_35_0._unlockBtn, arg_35_1 ~= Ship.LOCK_STATE_UNLOCK)
end

function var_0_0.updateLockTF(arg_36_0, arg_36_1)
	setActive(arg_36_0._lockTF, not arg_36_1)
end

function var_0_0.didEnter(arg_37_0)
	onButton(arg_37_0, arg_37_0._lockBtn, function()
		arg_37_0:StopAutoExitTimer()
		arg_37_0:emit(NewShipMediator.ON_LOCK, {
			arg_37_0._shipVO.id
		}, Ship.LOCK_STATE_LOCK)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0._unlockBtn, function()
		arg_37_0:StopAutoExitTimer()
		arg_37_0:emit(NewShipMediator.ON_LOCK, {
			arg_37_0._shipVO.id
		}, Ship.LOCK_STATE_UNLOCK)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0._viewBtn, function()
		arg_37_0:StopAutoExitTimer()

		arg_37_0.isInView = true

		arg_37_0:paintView()
		setActive(arg_37_0.clickTF, false)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0._evaluationBtn, function()
		arg_37_0:StopAutoExitTimer()
		arg_37_0:emit(NewShipMediator.ON_EVALIATION, arg_37_0._shipVO:getGroupId())
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0._shareBtn, function()
		arg_37_0:StopAutoExitTimer()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeNewShip)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0.clickTF, function()
		arg_37_0:StopAutoExitTimer()

		if arg_37_0.isInView or not arg_37_0.isLoadBg then
			return
		end

		arg_37_0:showExitTip()
	end, SFX_CANCEL)
	onButton(arg_37_0, arg_37_0.audioBtn, function()
		arg_37_0:StopAutoExitTimer()

		if arg_37_0.isInView then
			return
		end

		if not arg_37_0.isOpenProperty then
			arg_37_0:switch2Property()

			arg_37_0.isOpenProperty = true
		end

		setActive(arg_37_0.audioBtn, not arg_37_0.isRemoulded and not arg_37_0.isOpenProperty)
	end, SFX_PANEL)
	onButton(arg_37_0, arg_37_0._skipButton, function()
		arg_37_0:showExitTip(function()
			arg_37_0:emit(NewShipMediator.ON_SKIP_BATCH, arg_37_0.contextData.skipBatchType or NewShipMediator.SKIP_TYPE.BUILD)
		end)
	end, SFX_PANEL)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOCKYARD_CHARGET)
	pg.SystemGuideMgr.GetInstance():Play(arg_37_0)
end

function var_0_0.onBackPressed(arg_47_0)
	if arg_47_0.inAnimating then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_47_0.isInView then
		arg_47_0:hidePaintView(true)

		return
	end

	arg_47_0:DestroyNewShipDocumentView()
	triggerButton(arg_47_0.clickTF)
end

function var_0_0.paintView(arg_48_0)
	local var_48_0 = {}
	local var_48_1 = arg_48_0._shake.childCount
	local var_48_2 = 0

	while var_48_2 < var_48_1 do
		local var_48_3 = arg_48_0._shake:GetChild(var_48_2)

		if var_48_3.gameObject.activeSelf and var_48_3 ~= arg_48_0._paintingTF and var_48_3 ~= arg_48_0._bg and var_48_3 ~= arg_48_0._drag then
			var_48_0[#var_48_0 + 1] = var_48_3

			setActive(var_48_3, false)
		end

		var_48_2 = var_48_2 + 1
	end

	setActive(arg_48_0._paintingShadowTF, false)
	openPortrait()

	local var_48_4 = arg_48_0._paintingTF
	local var_48_5 = var_48_4.anchoredPosition.x
	local var_48_6 = var_48_4.anchoredPosition.y
	local var_48_7 = var_48_4.rect.width
	local var_48_8 = var_48_4.rect.height
	local var_48_9 = arg_48_0._tf.rect.width / UnityEngine.Screen.width
	local var_48_10 = arg_48_0._tf.rect.height / UnityEngine.Screen.height
	local var_48_11 = var_48_7 / 2
	local var_48_12 = var_48_8 / 2
	local var_48_13
	local var_48_14

	if not LeanTween.isTweening(go(var_48_4)) then
		arg_48_0:AddLeanTween(function()
			return LeanTween.moveX(rtf(var_48_4), 150, 0.5):setEase(LeanTweenType.easeInOutSine)
		end)
	end

	local var_48_15 = GetOrAddComponent(arg_48_0._drag, "MultiTouchZoom")

	var_48_15:SetZoomTarget(arg_48_0._paintingTF)

	local var_48_16 = GetOrAddComponent(arg_48_0._drag, "EventTriggerListener")

	arg_48_0.dragTrigger = var_48_16

	local var_48_17 = true

	var_48_15.enabled = true
	var_48_16.enabled = true

	local var_48_18 = false

	var_48_16:AddPointDownFunc(function(arg_50_0)
		if Input.touchCount == 1 or IsUnityEditor then
			var_48_18 = true
			var_48_17 = true
		elseif Input.touchCount >= 2 then
			var_48_17 = false
			var_48_18 = false
		end
	end)
	var_48_16:AddPointUpFunc(function(arg_51_0)
		if Input.touchCount <= 2 then
			var_48_17 = true
		end
	end)
	var_48_16:AddBeginDragFunc(function(arg_52_0, arg_52_1)
		var_48_18 = false
		var_48_13 = arg_52_1.position.x * var_48_9 - var_48_11 - tf(arg_48_0._paintingTF).localPosition.x
		var_48_14 = arg_52_1.position.y * var_48_10 - var_48_12 - tf(arg_48_0._paintingTF).localPosition.y
	end)
	var_48_16:AddDragFunc(function(arg_53_0, arg_53_1)
		if var_48_17 then
			local var_53_0 = tf(arg_48_0._paintingTF).localPosition

			tf(arg_48_0._paintingTF).localPosition = Vector3(arg_53_1.position.x * var_48_9 - var_48_11 - var_48_13, arg_53_1.position.y * var_48_10 - var_48_12 - var_48_14, -22)
		end
	end)
	onButton(arg_48_0, arg_48_0._drag, function()
		arg_48_0:hidePaintView()
	end, SFX_CANCEL)

	function var_0_0.hidePaintView(arg_55_0, arg_55_1)
		if not arg_55_1 and not var_48_18 then
			return
		end

		var_48_16.enabled = false
		var_48_15.enabled = false

		for iter_55_0, iter_55_1 in ipairs(var_48_0) do
			setActive(iter_55_1, true)
		end

		setActive(arg_55_0._paintingShadowTF, true)
		closePortrait()
		LeanTween.cancel(go(arg_55_0._paintingTF))

		arg_55_0._paintingTF.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(arg_55_0._paintingTF, {
			x = var_48_5,
			y = var_48_6
		})

		arg_55_0.isInView = false

		setActive(arg_55_0.clickTF, true)
	end
end

function var_0_0.recyclePainting(arg_56_0)
	if arg_56_0._shipVO then
		retPaintingPrefab(arg_56_0._paintingTF, arg_56_0._shipVO:getPainting())
		retPaintingPrefab(arg_56_0._paintingShadowTF, arg_56_0._shipVO:getPainting())

		arg_56_0._shipVO = nil
	end
end

function var_0_0.starsAnimation(arg_57_0)
	arg_57_0.inAnimating = true

	if arg_57_0._shipVO:getMaxStar() >= 6 and PlayerPrefs.GetInt(RARE_SHIP_VIBRATE, 1) > 0 then
		LuaHelper.Vibrate()
	end

	setActive(arg_57_0.starsCont, false)

	local var_57_0 = arg_57_0._tf:GetComponent(typeof(DftAniEvent))

	var_57_0:SetTriggerEvent(function(arg_58_0)
		arg_57_0:AddLeanTween(function()
			return LeanTween.scale(rtf(arg_57_0.starsCont), Vector3.one, 0):setOnComplete(System.Action(function()
				setActive(arg_57_0.starsCont, true)
			end))
		end)

		local var_58_0 = arg_57_0.STAR_ANIMATION_DUR1

		for iter_58_0 = 0, arg_57_0.starsCont.childCount - 1 do
			local var_58_1 = arg_57_0.starsCont:GetChild(iter_58_0)
			local var_58_2 = var_58_1:Find("star_empty")
			local var_58_3 = var_58_1:Find("star")

			setActive(var_58_2, false)
			setActive(var_58_3, false)

			local var_58_4 = iter_58_0 * var_58_0

			arg_57_0:AddLeanTween(function()
				return LeanTween.scale(rtf(var_58_2), Vector3(1.8, 1.8, 1.8), 0):setDelay(var_58_4):setOnComplete(System.Action(function()
					setActive(var_58_2, true)
					arg_57_0:AddLeanTween(function()
						return LeanTween.scale(rtf(var_58_2), Vector3(1, 1, 1), var_58_0)
					end)
				end))
			end)
		end

		local var_58_5 = arg_57_0._shipVO:getStar()
		local var_58_6 = arg_57_0.STAR_ANIMATION_DUR2
		local var_58_7 = arg_57_0.STAR_ANIMATION_DUR3

		for iter_58_1 = 0, var_58_5 - 1 do
			local var_58_8 = arg_57_0.starsCont:GetChild(iter_58_1)
			local var_58_9 = var_58_8:Find("star_empty")
			local var_58_10 = var_58_8:Find("star")
			local var_58_11 = var_58_0 * arg_57_0.starsCont.childCount + iter_58_1 * var_58_6

			arg_57_0:AddLeanTween(function()
				return LeanTween.scale(rtf(var_58_10), Vector3(1.8, 1.8, 1.8), 0):setDelay(var_58_11):setOnStart(System.Action(function()
					pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOCKYARD_STAR)
				end)):setOnComplete(System.Action(function()
					setActive(var_58_9, false)
					setActive(var_58_10, true)
					arg_57_0:AddLeanTween(function()
						return LeanTween.scale(rtf(var_58_10), Vector3(1, 1, 1), var_58_6)
					end)
				end))
			end)

			local var_58_12 = var_58_8:Find("light")

			if var_58_12 then
				arg_57_0:AddLeanTween(function()
					return LeanTween.delayedCall(var_58_11, System.Action(function()
						if arg_57_0.exited then
							return
						end

						setActive(var_58_12, true)
					end))
				end)
				arg_57_0:AddLeanTween(function()
					return LeanTween.alpha(rtf(var_58_12), 0, var_58_7):setDelay(var_58_11):setOnComplete(System.Action(function()
						SetActive(var_58_12, false)
						LeanTween.alpha(rtf(var_58_12), 1, 0)
					end))
				end)

				var_58_12.transform.localScale = Vector3(1, 1, 1)

				arg_57_0:AddLeanTween(function()
					return LeanTween.scale(rtf(var_58_12), Vector3(0.5, 1, 1), arg_57_0.STAR_ANIMATION_DUR4):setDelay(var_58_11 + var_58_7 * 1 / 3)
				end)
			end
		end
	end)
	var_57_0:SetEndEvent(function(arg_73_0)
		if arg_57_0._shipVO:getReMetaSpecialItemVO() then
			GetComponent(arg_57_0.metaRepeatTF, "CanvasGroup").alpha = 1

			arg_57_0:managedTween(LeanTween.value, function()
				setAnchoredPosition(arg_57_0.metaRepeatTF, {
					x = 0
				})

				arg_57_0.inAnimating = false

				setActive(arg_57_0.npc, arg_57_0._shipVO:isActivityNpc())
				setActive(arg_57_0._shade, false)
			end, go(arg_57_0.metaRepeatTF), arg_57_0.metaRepeatTF.rect.width, 0, 1):setOnUpdate(System.Action_float(function(arg_75_0)
				setAnchoredPosition(arg_57_0.metaRepeatTF, {
					x = arg_75_0
				})
			end))
			setAnchoredPosition(arg_57_0.metaRepeatTF, {
				x = arg_57_0.metaRepeatTF.rect.width
			})
			setActive(arg_57_0.metaRepeatTF, true)
		else
			arg_57_0.inAnimating = false

			setActive(arg_57_0.npc, arg_57_0._shipVO:isActivityNpc())
			setActive(arg_57_0._shade, false)
		end
	end)
end

function var_0_0.playOpening(arg_76_0, arg_76_1)
	if arg_76_0._shipVO:isMetaShip() and not getProxy(ContextProxy):getContextByMediator(BuildShipMediator) then
		if arg_76_1 then
			arg_76_1()
		end

		return
	end

	local var_76_0

	if arg_76_0._shipVO:isRemoulded() then
		var_76_0 = ShipGroup.GetGroupConfig(arg_76_0._shipVO:getGroupId()).trans_skin
	else
		var_76_0 = ShipGroup.getDefaultSkin(arg_76_0._shipVO:getGroupId()).id
	end

	local var_76_1 = "star_level_unlock_anim_" .. var_76_0

	if checkABExist("ui/skinunlockanim/" .. var_76_1) then
		pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
			return
		end, function()
			if arg_76_1 then
				arg_76_1()
			end
		end, "ui/skinunlockanim", var_76_1, true, false)
	elseif arg_76_1 then
		arg_76_1()
	end
end

function var_0_0.ClearTweens(arg_79_0, arg_79_1)
	arg_79_0:cleanManagedTween(true)
end

function var_0_0.willExit(arg_80_0)
	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()
	arg_80_0:StopAutoExitTimer()
	arg_80_0:DestroyNewShipDocumentView()

	if arg_80_0.designBg then
		PoolMgr.GetInstance():ReturnUI(arg_80_0.designName, arg_80_0.designBg)
	end

	if arg_80_0.metaBg then
		PoolMgr.GetInstance():ReturnUI(arg_80_0.metaName, arg_80_0.metaBg)
	end

	for iter_80_0, iter_80_1 in pairs(arg_80_0.rarityEffect) do
		if iter_80_1 then
			PoolMgr.GetInstance():ReturnUI("getrole_" .. iter_80_0, iter_80_1)
		end
	end

	if arg_80_0.dragTrigger then
		ClearEventTrigger(arg_80_0.dragTrigger)

		arg_80_0.dragTrigger = nil
	end

	if not arg_80_0.isRemoulded then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_newShipLayer_get", pg.ship_data_by_type[arg_80_0._shipVO:getShipType()].type_name, arg_80_0._shipVO:getName()), COLOR_GREEN)
	end

	arg_80_0:recyclePainting()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_80_0._tf)
	arg_80_0:stopVoice()

	if arg_80_0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(arg_80_0.loadedCVBankName)

		arg_80_0.loadedCVBankName = nil
	end

	if LeanTween.isTweening(go(arg_80_0.rarityTF)) then
		LeanTween.cancel(go(arg_80_0.rarityTF))
	end

	cameraPaintViewAdjust(false)
end

function var_0_0.DisplayNewShipDocumentView(arg_81_0)
	arg_81_0.newShipDocumentView = NewShipDocumentView.New(arg_81_0._shake:Find("ForNotch"), arg_81_0.event, arg_81_0.contextData)

	arg_81_0.newShipDocumentView:Load()

	local function var_81_0()
		if not arg_81_0.isLoadBg then
			return
		end

		arg_81_0:showExitTip()
	end

	arg_81_0.newShipDocumentView:ActionInvoke("SetParams", arg_81_0._shipVO, var_81_0)
	arg_81_0.newShipDocumentView:ActionInvoke("RefreshUI")
end

function var_0_0.DestroyNewShipDocumentView(arg_83_0)
	if arg_83_0.newShipDocumentView and arg_83_0.newShipDocumentView:CheckState(BaseSubView.STATES.INITED) then
		arg_83_0.newShipDocumentView:Destroy()
	end
end

function var_0_0.StopAutoExitTimer(arg_84_0)
	if not arg_84_0.autoExitTimer then
		return
	end

	arg_84_0.autoExitTimer:Stop()

	arg_84_0.autoExitTimer = nil
end

return var_0_0
