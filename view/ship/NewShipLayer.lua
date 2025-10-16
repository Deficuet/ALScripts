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

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.contextData.ship

	LoadSpriteAsync("newshipbg/bg_" .. var_2_0:rarity2bgPrintForGet(), function(arg_3_0)
		arg_2_0.bgSprite = arg_3_0
		arg_2_0.isLoadBg = true

		arg_2_1()
	end)
end

function var_0_0.init(arg_4_0)
	arg_4_0._animator = GetComponent(arg_4_0._tf, "Animator")
	arg_4_0._canvasGroup = GetOrAddComponent(arg_4_0._tf, typeof(CanvasGroup))
	arg_4_0._shake = arg_4_0._tf:Find("shake_panel")
	arg_4_0._shade = arg_4_0._tf:Find("shade")
	arg_4_0._bg = arg_4_0._shake:Find("bg")
	arg_4_0._drag = arg_4_0._shake:Find("drag")
	arg_4_0._paintingTF = arg_4_0._shake:Find("paint")
	arg_4_0._paintingShadowTF = arg_4_0._shake:Find("shadow")
	arg_4_0._dialogue = arg_4_0._shake:Find("dialogue")
	arg_4_0._shipName = arg_4_0._dialogue:Find("bg/name"):GetComponent(typeof(Text))
	arg_4_0._shipType = arg_4_0._dialogue:Find("bg/type"):GetComponent(typeof(Text))
	arg_4_0._dialogueText = arg_4_0._dialogue:Find("Text")
	arg_4_0._left = arg_4_0._shake:Find("ForNotch/left_panel")
	arg_4_0._lockTF = arg_4_0._left:Find("lock")
	arg_4_0._lockBtn = arg_4_0._left:Find("lock/lock")
	arg_4_0._unlockBtn = arg_4_0._left:Find("lock/unlock_btn")
	arg_4_0._viewBtn = arg_4_0._left:Find("view_btn")
	arg_4_0._evaluationBtn = arg_4_0._left:Find("evaluation_btn")
	arg_4_0._shareBtn = arg_4_0._left:Find("share_btn")
	arg_4_0.audioBtn = arg_4_0._shake:Find("property_btn")
	arg_4_0.clickTF = arg_4_0._shake:Find("click")
	arg_4_0.npc = arg_4_0._tf:Find("shake_panel/npc")

	setActive(arg_4_0.npc, false)

	arg_4_0.newTF = arg_4_0._shake:Find("New")
	arg_4_0.rarityTF = arg_4_0._shake:Find("rarity")
	arg_4_0.starsTF = arg_4_0.rarityTF:Find("stars")
	arg_4_0.starsCont = arg_4_0.starsTF:Find("content")
	arg_4_0._skipButton = arg_4_0._shake:Find("ForNotch/skip")

	setActive(arg_4_0._skipButton, arg_4_0.contextData.canSkipBatch)
	setActive(arg_4_0._left, true)
	setActive(arg_4_0.audioBtn, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_4_0._tf)

	arg_4_0.metaRepeatTF = arg_4_0.rarityTF:Find("MetaRepeat")
	arg_4_0.metaDarkTF = arg_4_0._shake:Find("MetaMask")
	arg_4_0.rarityEffect = {}

	if arg_4_0.contextData.autoExitTime then
		arg_4_0.autoExitTimer = Timer.New(function()
			arg_4_0:showExitTip()
		end, arg_4_0.contextData.autoExitTime)

		arg_4_0.autoExitTimer:Start()

		arg_4_0.contextData.autoExitTime = nil
	end

	arg_4_0:PauseAnimation()
end

function var_0_0.voice(arg_6_0, arg_6_1)
	if not arg_6_1 then
		return
	end

	arg_6_0:stopVoice()

	arg_6_0._currentVoice = arg_6_1

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_6_1)
end

function var_0_0.stopVoice(arg_7_0)
	if arg_7_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_7_0._currentVoice)
	end

	arg_7_0._currentVoice = nil
end

function var_0_0.setShip(arg_8_0, arg_8_1)
	arg_8_0:recyclePainting()

	arg_8_0._shipVO = arg_8_1
	arg_8_0.isRemoulded = arg_8_1:isRemoulded()

	local var_8_0 = arg_8_1:isBluePrintShip()
	local var_8_1 = arg_8_1:isMetaShip()

	setImageSprite(arg_8_0._bg, arg_8_0.bgSprite)
	setActive(arg_8_0.metaDarkTF, arg_8_1:isMetaShip())

	if var_8_0 then
		if arg_8_0.metaBg then
			setActive(arg_8_0.metaBg, false)
		end

		if arg_8_0.designBg and arg_8_0.designName ~= "raritydesign" .. arg_8_1:getRarity() then
			PoolMgr.GetInstance():ReturnUI(arg_8_0.designName, arg_8_0.designBg)

			arg_8_0.designBg = nil
		end

		if not arg_8_0.designBg then
			PoolMgr.GetInstance():GetUI("raritydesign" .. arg_8_1:getRarity(), true, function(arg_9_0)
				arg_8_0.designBg = arg_9_0
				arg_8_0.designName = "raritydesign" .. arg_8_1:getRarity()

				arg_9_0.transform:SetParent(arg_8_0._shake, false)

				arg_9_0.transform.localPosition = Vector3(1, 1, 1)
				arg_9_0.transform.localScale = Vector3(1, 1, 1)

				arg_9_0.transform:SetSiblingIndex(1)
				setActive(arg_9_0, true)
			end)
		else
			setActive(arg_8_0.designBg, true)
		end
	elseif var_8_1 then
		if arg_8_0.designBg then
			setActive(arg_8_0.designBg, false)
		end

		if arg_8_0.metaBg and arg_8_0.metaName ~= "raritymeta" .. arg_8_1:getRarity() then
			PoolMgr.GetInstance():ReturnUI(arg_8_0.metaName, arg_8_0.metaBg)

			arg_8_0.metaBg = nil
		end

		if not arg_8_0.metaBg then
			PoolMgr.GetInstance():GetUI("raritymeta" .. arg_8_1:getRarity(), true, function(arg_10_0)
				arg_8_0.metaBg = arg_10_0
				arg_8_0.metaName = "raritymeta" .. arg_8_1:getRarity()

				arg_10_0.transform:SetParent(arg_8_0._shake, false)

				arg_10_0.transform.localPosition = Vector3(1, 1, 1)
				arg_10_0.transform.localScale = Vector3(1, 1, 1)

				arg_10_0.transform:SetSiblingIndex(1)
				setActive(arg_10_0, true)
			end)
		else
			setActive(arg_8_0.metaBg, true)
		end
	else
		if arg_8_0.designBg then
			setActive(arg_8_0.designBg, false)
		end

		if arg_8_0.metaBg then
			setActive(arg_8_0.metaBg, false)
		end
	end

	if arg_8_1.virgin and not arg_8_0.isRemoulded and not arg_8_1:isActivityNpc() then
		setActive(arg_8_0.newTF, true)
		LoadImageSpriteAsync("clutter/new", arg_8_0.newTF)

		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, arg_8_0._shipVO.groupId, 1) then
			local var_8_2 = pg.fleet_tech_ship_template[arg_8_0._shipVO.groupId].pt_get
			local var_8_3 = ShipType.FilterOverQuZhuType(pg.fleet_tech_ship_template[arg_8_0._shipVO.groupId].add_get_shiptype)
			local var_8_4 = pg.fleet_tech_ship_template[arg_8_0._shipVO.groupId].add_get_attr
			local var_8_5 = pg.fleet_tech_ship_template[arg_8_0._shipVO.groupId].add_get_value

			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TECPOINT, {
				point = var_8_2,
				typeList = var_8_3,
				attr = var_8_4,
				value = var_8_5
			})
		end
	else
		setActive(arg_8_0.newTF, false)

		local var_8_6 = arg_8_1:getReMetaSpecialItemVO()

		arg_8_0:updateLockTF(var_8_6 ~= nil)

		if var_8_6 then
			local var_8_7 = arg_8_0.metaRepeatTF:Find("Icon")
			local var_8_8 = arg_8_0.metaRepeatTF:Find("Count")

			setImageSprite(var_8_7, LoadSprite(var_8_6:getConfig("icon")))
			GetImageSpriteFromAtlasAsync(var_8_6:getConfig("icon"), "", var_8_7)
			setText(var_8_8, var_8_6.count)

			local var_8_9 = pg.ship_transform[arg_8_0._shipVO.groupId].exclusive_item[1][2]
			local var_8_10 = pg.ship_transform[arg_8_0._shipVO.groupId].common_item[1][2]
			local var_8_11 = arg_8_0.metaRepeatTF:Find("Special")
			local var_8_12 = arg_8_0.metaRepeatTF:Find("Commom")

			setActive(var_8_11, var_8_6.id == var_8_9)
			setActive(var_8_12, var_8_6.id == var_8_10)
		else
			setActive(arg_8_0.metaRepeatTF, false)
		end
	end

	setActive(arg_8_0.audioBtn, not arg_8_0.isRemoulded)
	arg_8_0:UpdateLockButton(arg_8_0._shipVO:GetLockState())

	local var_8_13 = arg_8_0._shipVO:getConfigTable()

	if arg_8_0.isRemoulded then
		setPaintingPrefabAsync(arg_8_0._paintingTF, arg_8_0._shipVO:getRemouldPainting(), "huode")
		setPaintingPrefabAsync(arg_8_0._paintingShadowTF, arg_8_0._shipVO:getRemouldPainting(), "huode")
	else
		setPaintingPrefabAsync(arg_8_0._paintingTF, arg_8_0._shipVO:getPainting(), "huode")
		setPaintingPrefabAsync(arg_8_0._paintingShadowTF, arg_8_0._shipVO:getPainting(), "huode")
	end

	arg_8_0._shipType.text = pg.ship_data_by_type[arg_8_0._shipVO:getShipType()].type_name
	arg_8_0._shipName.text = arg_8_1:getName()

	local var_8_14 = arg_8_1:getRarity()
	local var_8_15 = pg.ship_data_template[var_8_13.id].star_max
	local var_8_16 = arg_8_0._shipVO:getStar()

	if not (var_8_15 % 2 == 0) or not (var_8_15 / 2) then
		local var_8_17 = math.floor(var_8_15 / 2) + 1
	end

	local var_8_18 = 15

	for iter_8_0 = 1, 6 do
		local var_8_19 = arg_8_0.starsTF:Find("content/star_" .. iter_8_0)
		local var_8_20 = var_8_19:Find("star_empty")
		local var_8_21 = var_8_19:Find("star")

		setActive(var_8_21, iter_8_0 <= var_8_16)
		setActive(var_8_20, var_8_16 < iter_8_0)

		if var_8_15 < iter_8_0 then
			setActive(var_8_19, false)
		end
	end

	local var_8_22 = arg_8_0._shake:Find("rarity/nation")
	local var_8_23 = LoadSprite("prints/" .. nation2print(var_8_13.nationality) .. "_0")

	if not var_8_23 then
		warning("找不到印花, shipConfigId: " .. arg_8_1.configId)
		setActive(var_8_22, false)
	else
		setImageSprite(var_8_22, var_8_23, false)
	end

	local var_8_24 = arg_8_0._shake:Find("rarity/type")
	local var_8_25 = arg_8_0._shake:Find("rarity/type/rarLogo")

	if arg_8_1:isMetaShip() then
		LoadImageSpriteAsync("shiprarity/1" .. var_8_14 .. "m", var_8_24, true)
		LoadImageSpriteAsync("shiprarity/1" .. var_8_14 .. "s", var_8_25, true)
	else
		LoadImageSpriteAsync("shiprarity/" .. (var_8_0 and "0" or "") .. var_8_14 .. "m", var_8_24, true)
		LoadImageSpriteAsync("shiprarity/" .. (var_8_0 and "0" or "") .. var_8_14 .. "s", var_8_25, true)
	end

	setActive(var_8_22, false)
	setActive(arg_8_0.rarityTF, false)
	setActive(arg_8_0._shade, true)

	arg_8_0.inAnimating = true

	arg_8_0:AddLeanTween(function()
		return LeanTween.delayedCall(0.5, System.Action(function()
			setActive(var_8_22, true)
			setActive(arg_8_0.rarityTF, true)
			arg_8_0:starsAnimation()
		end))
	end)

	local var_8_26 = arg_8_0._shake:Find("ship_type")
	local var_8_27 = var_8_26:Find("stars")
	local var_8_28 = var_8_26:Find("stars/startpl")
	local var_8_29 = var_8_26:Find("english_name")

	setText(var_8_29, arg_8_0._shipVO:getConfig("english_name"))

	local var_8_30 = var_8_27.childCount
	local var_8_31 = arg_8_0._shipVO:getStar()
	local var_8_32 = arg_8_0._shipVO:getMaxStar()

	for iter_8_1 = var_8_30, var_8_32 - 1 do
		cloneTplTo(var_8_28, var_8_27)
	end

	local var_8_33 = var_8_27.childCount

	for iter_8_2 = 0, var_8_33 - 1 do
		local var_8_34 = var_8_27:GetChild(iter_8_2)

		var_8_34.gameObject:SetActive(iter_8_2 < var_8_32)
		setActive(var_8_34:Find("star"), iter_8_2 < var_8_31)
		setActive(var_8_34:Find("empty"), var_8_31 <= iter_8_2)
	end

	local var_8_35 = arg_8_0._shipVO:getConfigTable()

	findTF(var_8_26, "type_bg/type"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("shiptype", tostring(arg_8_0._shipVO:getShipType()))

	setScrollText(var_8_26:Find("name_bg/mask/Text"), arg_8_0._shipVO:getName())

	if var_8_0 then
		var_8_14 = var_8_14 .. "_1"
	elseif arg_8_1:isMetaShip() then
		var_8_14 = var_8_14 .. "_2"
	end

	if not arg_8_0.rarityEffect[var_8_14] then
		PoolMgr.GetInstance():GetUI("getrole_" .. var_8_14, true, function(arg_13_0)
			if IsNil(arg_8_0._tf) then
				return
			end

			arg_8_0.rarityEffect[var_8_14] = arg_13_0

			arg_13_0.transform:SetParent(arg_8_0._tf, false)

			arg_13_0.transform.localPosition = Vector3(1, 1, 1)
			arg_13_0.transform.localScale = Vector3(1, 1, 1)

			arg_13_0.transform:SetSiblingIndex(1)

			if arg_8_1:isMetaShip() then
				local var_13_0 = tf(arg_13_0):Find("fire_ruchang")

				var_13_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_14_0)
					setActive(var_8_22, true)
					setActive(var_13_0, false)
				end)
			end

			setActive(var_8_22, false)

			arg_8_0.effectObj = arg_13_0

			setActive(arg_8_0.effectObj, arg_8_0.isOpeningEnd)
		end)
	else
		arg_8_0.effectObj = arg_8_0.rarityEffect[var_8_14]

		setActive(arg_8_0.effectObj, arg_8_0.isOpeningEnd)
	end

	arg_8_0:playOpening(function()
		arg_8_0:ResumeAnimation()
		arg_8_0:DisplayWord()
	end)
end

function var_0_0.PauseAnimation(arg_16_0)
	arg_16_0._canvasGroup.alpha = 0
	arg_16_0._animator.enabled = false
end

function var_0_0.ResumeAnimation(arg_17_0)
	arg_17_0._canvasGroup.alpha = 1
	arg_17_0._animator.enabled = true
	arg_17_0.isOpeningEnd = true

	if arg_17_0.effectObj then
		setActive(arg_17_0.effectObj, true)
	end
end

function var_0_0.DisplayWord(arg_18_0)
	local var_18_0
	local var_18_1 = ""
	local var_18_2

	if arg_18_0.isRemoulded then
		local var_18_3 = arg_18_0._shipVO:getRemouldSkinId()

		var_18_1 = ShipWordHelper.RawGetWord(var_18_3, ShipWordHelper.WORD_TYPE_UNLOCK)

		if var_18_1 == "" then
			local var_18_4

			var_18_4, var_18_2, var_18_1 = ShipWordHelper.GetWordAndCV(var_18_3, ShipWordHelper.WORD_TYPE_DROP)
		else
			local var_18_5

			var_18_5, var_18_2, var_18_1 = ShipWordHelper.GetWordAndCV(var_18_3, ShipWordHelper.WORD_TYPE_UNLOCK)
		end
	else
		local var_18_6

		var_18_6, var_18_2, var_18_1 = ShipWordHelper.GetWordAndCV(arg_18_0._shipVO:getSkinId(), ShipWordHelper.WORD_TYPE_UNLOCK)
	end

	setWidgetText(arg_18_0._dialogue, SwitchSpecialChar(var_18_1, true), "Text")

	arg_18_0._dialogue.transform.localScale = Vector3(0, 1, 1)

	SetActive(arg_18_0._dialogue, false)
	arg_18_0:AddLeanTween(function()
		return LeanTween.delayedCall(0.5, System.Action(function()
			SetActive(arg_18_0._dialogue, true)
			arg_18_0:AddLeanTween(function()
				return LeanTween.scale(arg_18_0._dialogue, Vector3(1, 1, 1), 0.1)
			end)
			arg_18_0:voice(var_18_2)
		end))
	end)
end

function var_0_0.updateShip(arg_22_0, arg_22_1)
	arg_22_0._shipVO = arg_22_1
end

function var_0_0.switch2Property(arg_23_0)
	setActive(arg_23_0.newTF, false)
	setActive(arg_23_0._dialogue, false)
	setActive(arg_23_0.rarityTF, false)
	setActive(arg_23_0._shake:Find("rarity/nation"), false)

	local var_23_0 = arg_23_0._shake:Find("ship_type")

	setActive(var_23_0, true)
	arg_23_0:AddLeanTween(function()
		return LeanTween.move(rtf(var_23_0), Vector3(0, -149.55, 0), 0.3)
	end)
	arg_23_0:AddLeanTween(function()
		return LeanTween.move(rtf(arg_23_0._paintingTF), Vector3(-59, 21, 0), 0.2)
	end)
	arg_23_0:DisplayNewShipDocumentView()
end

function var_0_0.showExitTip(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0._shipVO:GetLockState()
	local var_26_1 = pg.settings_other_template[22]
	local var_26_2 = getProxy(PlayerProxy):getRawData():GetCommonFlag(_G[var_26_1.name])

	if var_26_1.default == 1 then
		var_26_2 = not var_26_2
	end

	if arg_26_0._shipVO.virgin and var_26_0 == Ship.LOCK_STATE_UNLOCK and not var_26_2 then
		if arg_26_0.effectObj then
			setActive(arg_26_0.effectObj, false)
		end

		if arg_26_0.effectLineObj then
			setActive(arg_26_0.effectLineObj, false)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			content = i18n("ship_lock_tip"),
			onYes = function()
				triggerButton(arg_26_0._lockBtn)

				if arg_26_1 then
					arg_26_1()
				else
					arg_26_0:emit(NewShipMediator.ON_EXIT)
				end
			end,
			onNo = function()
				if arg_26_1 then
					arg_26_1()
				else
					arg_26_0:emit(NewShipMediator.ON_EXIT)
				end
			end
		})
	elseif arg_26_1 then
		arg_26_1()
	else
		arg_26_0:emit(NewShipMediator.ON_EXIT)
	end
end

function var_0_0.UpdateLockButton(arg_29_0, arg_29_1)
	setActive(arg_29_0._lockBtn, arg_29_1 ~= Ship.LOCK_STATE_LOCK)
	setActive(arg_29_0._unlockBtn, arg_29_1 ~= Ship.LOCK_STATE_UNLOCK)
end

function var_0_0.updateLockTF(arg_30_0, arg_30_1)
	setActive(arg_30_0._lockTF, not arg_30_1)
end

function var_0_0.didEnter(arg_31_0)
	onButton(arg_31_0, arg_31_0._lockBtn, function()
		arg_31_0:StopAutoExitTimer()
		arg_31_0:emit(NewShipMediator.ON_LOCK, {
			arg_31_0._shipVO.id
		}, Ship.LOCK_STATE_LOCK)
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0._unlockBtn, function()
		arg_31_0:StopAutoExitTimer()
		arg_31_0:emit(NewShipMediator.ON_LOCK, {
			arg_31_0._shipVO.id
		}, Ship.LOCK_STATE_UNLOCK)
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0._viewBtn, function()
		arg_31_0:StopAutoExitTimer()

		arg_31_0.isInView = true

		arg_31_0:paintView()
		setActive(arg_31_0.clickTF, false)
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0._evaluationBtn, function()
		arg_31_0:StopAutoExitTimer()
		arg_31_0:emit(NewShipMediator.ON_EVALIATION, arg_31_0._shipVO:getGroupId())
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0._shareBtn, function()
		arg_31_0:StopAutoExitTimer()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeNewShip)
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0.clickTF, function()
		arg_31_0:StopAutoExitTimer()

		if arg_31_0.isInView or not arg_31_0.isLoadBg then
			return
		end

		arg_31_0:showExitTip()
	end, SFX_CANCEL)
	onButton(arg_31_0, arg_31_0.audioBtn, function()
		arg_31_0:StopAutoExitTimer()

		if arg_31_0.isInView then
			return
		end

		if not arg_31_0.isOpenProperty then
			arg_31_0:switch2Property()

			arg_31_0.isOpenProperty = true
		end

		setActive(arg_31_0.audioBtn, not arg_31_0.isRemoulded and not arg_31_0.isOpenProperty)
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0._skipButton, function()
		arg_31_0:showExitTip(function()
			arg_31_0:emit(NewShipMediator.ON_SKIP_BATCH)
		end)
	end, SFX_PANEL)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOCKYARD_CHARGET)
	pg.SystemGuideMgr.GetInstance():Play(arg_31_0)
end

function var_0_0.onBackPressed(arg_41_0)
	if arg_41_0.inAnimating then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_41_0.isInView then
		arg_41_0:hidePaintView(true)

		return
	end

	arg_41_0:DestroyNewShipDocumentView()
	triggerButton(arg_41_0.clickTF)
end

function var_0_0.paintView(arg_42_0)
	local var_42_0 = {}
	local var_42_1 = arg_42_0._shake.childCount
	local var_42_2 = 0

	while var_42_2 < var_42_1 do
		local var_42_3 = arg_42_0._shake:GetChild(var_42_2)

		if var_42_3.gameObject.activeSelf and var_42_3 ~= arg_42_0._paintingTF and var_42_3 ~= arg_42_0._bg and var_42_3 ~= arg_42_0._drag then
			var_42_0[#var_42_0 + 1] = var_42_3

			setActive(var_42_3, false)
		end

		var_42_2 = var_42_2 + 1
	end

	setActive(arg_42_0._paintingShadowTF, false)
	openPortrait()

	local var_42_4 = arg_42_0._paintingTF
	local var_42_5 = var_42_4.anchoredPosition.x
	local var_42_6 = var_42_4.anchoredPosition.y
	local var_42_7 = var_42_4.rect.width
	local var_42_8 = var_42_4.rect.height
	local var_42_9 = arg_42_0._tf.rect.width / UnityEngine.Screen.width
	local var_42_10 = arg_42_0._tf.rect.height / UnityEngine.Screen.height
	local var_42_11 = var_42_7 / 2
	local var_42_12 = var_42_8 / 2
	local var_42_13
	local var_42_14

	if not LeanTween.isTweening(go(var_42_4)) then
		arg_42_0:AddLeanTween(function()
			return LeanTween.moveX(rtf(var_42_4), 150, 0.5):setEase(LeanTweenType.easeInOutSine)
		end)
	end

	local var_42_15 = GetOrAddComponent(arg_42_0._drag, "MultiTouchZoom")

	var_42_15:SetZoomTarget(arg_42_0._paintingTF)

	local var_42_16 = GetOrAddComponent(arg_42_0._drag, "EventTriggerListener")

	arg_42_0.dragTrigger = var_42_16

	local var_42_17 = true

	var_42_15.enabled = true
	var_42_16.enabled = true

	local var_42_18 = false

	var_42_16:AddPointDownFunc(function(arg_44_0)
		if Input.touchCount == 1 or IsUnityEditor then
			var_42_18 = true
			var_42_17 = true
		elseif Input.touchCount >= 2 then
			var_42_17 = false
			var_42_18 = false
		end
	end)
	var_42_16:AddPointUpFunc(function(arg_45_0)
		if Input.touchCount <= 2 then
			var_42_17 = true
		end
	end)
	var_42_16:AddBeginDragFunc(function(arg_46_0, arg_46_1)
		var_42_18 = false
		var_42_13 = arg_46_1.position.x * var_42_9 - var_42_11 - tf(arg_42_0._paintingTF).localPosition.x
		var_42_14 = arg_46_1.position.y * var_42_10 - var_42_12 - tf(arg_42_0._paintingTF).localPosition.y
	end)
	var_42_16:AddDragFunc(function(arg_47_0, arg_47_1)
		if var_42_17 then
			local var_47_0 = tf(arg_42_0._paintingTF).localPosition

			tf(arg_42_0._paintingTF).localPosition = Vector3(arg_47_1.position.x * var_42_9 - var_42_11 - var_42_13, arg_47_1.position.y * var_42_10 - var_42_12 - var_42_14, -22)
		end
	end)
	onButton(arg_42_0, arg_42_0._drag, function()
		arg_42_0:hidePaintView()
	end, SFX_CANCEL)

	function var_0_0.hidePaintView(arg_49_0, arg_49_1)
		if not arg_49_1 and not var_42_18 then
			return
		end

		var_42_16.enabled = false
		var_42_15.enabled = false

		for iter_49_0, iter_49_1 in ipairs(var_42_0) do
			setActive(iter_49_1, true)
		end

		setActive(arg_49_0._paintingShadowTF, true)
		closePortrait()
		LeanTween.cancel(go(arg_49_0._paintingTF))

		arg_49_0._paintingTF.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(arg_49_0._paintingTF, {
			x = var_42_5,
			y = var_42_6
		})

		arg_49_0.isInView = false

		setActive(arg_49_0.clickTF, true)
	end
end

function var_0_0.recyclePainting(arg_50_0)
	if arg_50_0._shipVO then
		retPaintingPrefab(arg_50_0._paintingTF, arg_50_0._shipVO:getPainting())
		retPaintingPrefab(arg_50_0._paintingShadowTF, arg_50_0._shipVO:getPainting())

		arg_50_0._shipVO = nil
	end
end

function var_0_0.starsAnimation(arg_51_0)
	arg_51_0.inAnimating = true

	if arg_51_0._shipVO:getMaxStar() >= 6 and PlayerPrefs.GetInt(RARE_SHIP_VIBRATE, 1) > 0 then
		LuaHelper.Vibrate()
	end

	setActive(arg_51_0.starsCont, false)

	local var_51_0 = arg_51_0._tf:GetComponent(typeof(DftAniEvent))

	var_51_0:SetTriggerEvent(function(arg_52_0)
		arg_51_0:AddLeanTween(function()
			return LeanTween.scale(rtf(arg_51_0.starsCont), Vector3.one, 0):setOnComplete(System.Action(function()
				setActive(arg_51_0.starsCont, true)
			end))
		end)

		local var_52_0 = arg_51_0.STAR_ANIMATION_DUR1

		for iter_52_0 = 0, arg_51_0.starsCont.childCount - 1 do
			local var_52_1 = arg_51_0.starsCont:GetChild(iter_52_0)
			local var_52_2 = var_52_1:Find("star_empty")
			local var_52_3 = var_52_1:Find("star")

			setActive(var_52_2, false)
			setActive(var_52_3, false)

			local var_52_4 = iter_52_0 * var_52_0

			arg_51_0:AddLeanTween(function()
				return LeanTween.scale(rtf(var_52_2), Vector3(1.8, 1.8, 1.8), 0):setDelay(var_52_4):setOnComplete(System.Action(function()
					setActive(var_52_2, true)
					arg_51_0:AddLeanTween(function()
						return LeanTween.scale(rtf(var_52_2), Vector3(1, 1, 1), var_52_0)
					end)
				end))
			end)
		end

		local var_52_5 = arg_51_0._shipVO:getStar()
		local var_52_6 = arg_51_0.STAR_ANIMATION_DUR2
		local var_52_7 = arg_51_0.STAR_ANIMATION_DUR3

		for iter_52_1 = 0, var_52_5 - 1 do
			local var_52_8 = arg_51_0.starsCont:GetChild(iter_52_1)
			local var_52_9 = var_52_8:Find("star_empty")
			local var_52_10 = var_52_8:Find("star")
			local var_52_11 = var_52_0 * arg_51_0.starsCont.childCount + iter_52_1 * var_52_6

			arg_51_0:AddLeanTween(function()
				return LeanTween.scale(rtf(var_52_10), Vector3(1.8, 1.8, 1.8), 0):setDelay(var_52_11):setOnStart(System.Action(function()
					pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOCKYARD_STAR)
				end)):setOnComplete(System.Action(function()
					setActive(var_52_9, false)
					setActive(var_52_10, true)
					arg_51_0:AddLeanTween(function()
						return LeanTween.scale(rtf(var_52_10), Vector3(1, 1, 1), var_52_6)
					end)
				end))
			end)

			local var_52_12 = var_52_8:Find("light")

			if var_52_12 then
				arg_51_0:AddLeanTween(function()
					return LeanTween.delayedCall(var_52_11, System.Action(function()
						if arg_51_0.exited then
							return
						end

						setActive(var_52_12, true)
					end))
				end)
				arg_51_0:AddLeanTween(function()
					return LeanTween.alpha(rtf(var_52_12), 0, var_52_7):setDelay(var_52_11):setOnComplete(System.Action(function()
						SetActive(var_52_12, false)
						LeanTween.alpha(rtf(var_52_12), 1, 0)
					end))
				end)

				var_52_12.transform.localScale = Vector3(1, 1, 1)

				arg_51_0:AddLeanTween(function()
					return LeanTween.scale(rtf(var_52_12), Vector3(0.5, 1, 1), arg_51_0.STAR_ANIMATION_DUR4):setDelay(var_52_11 + var_52_7 * 1 / 3)
				end)
			end
		end
	end)
	var_51_0:SetEndEvent(function(arg_67_0)
		if arg_51_0._shipVO:getReMetaSpecialItemVO() then
			GetComponent(arg_51_0.metaRepeatTF, "CanvasGroup").alpha = 1

			arg_51_0:managedTween(LeanTween.value, function()
				setAnchoredPosition(arg_51_0.metaRepeatTF, {
					x = 0
				})

				arg_51_0.inAnimating = false

				setActive(arg_51_0.npc, arg_51_0._shipVO:isActivityNpc())
				setActive(arg_51_0._shade, false)
			end, go(arg_51_0.metaRepeatTF), arg_51_0.metaRepeatTF.rect.width, 0, 1):setOnUpdate(System.Action_float(function(arg_69_0)
				setAnchoredPosition(arg_51_0.metaRepeatTF, {
					x = arg_69_0
				})
			end))
			setAnchoredPosition(arg_51_0.metaRepeatTF, {
				x = arg_51_0.metaRepeatTF.rect.width
			})
			setActive(arg_51_0.metaRepeatTF, true)
		else
			arg_51_0.inAnimating = false

			setActive(arg_51_0.npc, arg_51_0._shipVO:isActivityNpc())
			setActive(arg_51_0._shade, false)
		end
	end)
end

function var_0_0.playOpening(arg_70_0, arg_70_1)
	if arg_70_0._shipVO:isMetaShip() and not getProxy(ContextProxy):getContextByMediator(BuildShipMediator) then
		if arg_70_1 then
			arg_70_1()
		end

		return
	end

	local var_70_0

	if arg_70_0._shipVO:isRemoulded() then
		var_70_0 = ShipGroup.GetGroupConfig(arg_70_0._shipVO:getGroupId()).trans_skin
	else
		var_70_0 = ShipGroup.getDefaultSkin(arg_70_0._shipVO:getGroupId()).id
	end

	local var_70_1 = "star_level_unlock_anim_" .. var_70_0

	if checkABExist("ui/skinunlockanim/" .. var_70_1) then
		pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
			return
		end, function()
			if arg_70_1 then
				arg_70_1()
			end
		end, "ui/skinunlockanim", var_70_1, true, false)
	elseif arg_70_1 then
		arg_70_1()
	end
end

function var_0_0.ClearTweens(arg_73_0, arg_73_1)
	arg_73_0:cleanManagedTween(true)
end

function var_0_0.willExit(arg_74_0)
	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()
	arg_74_0:StopAutoExitTimer()
	arg_74_0:DestroyNewShipDocumentView()

	if arg_74_0.designBg then
		PoolMgr.GetInstance():ReturnUI(arg_74_0.designName, arg_74_0.designBg)
	end

	if arg_74_0.metaBg then
		PoolMgr.GetInstance():ReturnUI(arg_74_0.metaName, arg_74_0.metaBg)
	end

	for iter_74_0, iter_74_1 in pairs(arg_74_0.rarityEffect) do
		if iter_74_1 then
			PoolMgr.GetInstance():ReturnUI("getrole_" .. iter_74_0, iter_74_1)
		end
	end

	if arg_74_0.dragTrigger then
		ClearEventTrigger(arg_74_0.dragTrigger)

		arg_74_0.dragTrigger = nil
	end

	if not arg_74_0.isRemoulded then
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_newShipLayer_get", pg.ship_data_by_type[arg_74_0._shipVO:getShipType()].type_name, arg_74_0._shipVO:getName()), COLOR_GREEN)
	end

	arg_74_0:recyclePainting()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_74_0._tf)
	arg_74_0:stopVoice()

	if arg_74_0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(arg_74_0.loadedCVBankName)

		arg_74_0.loadedCVBankName = nil
	end

	if LeanTween.isTweening(go(arg_74_0.rarityTF)) then
		LeanTween.cancel(go(arg_74_0.rarityTF))
	end

	cameraPaintViewAdjust(false)
end

function var_0_0.DisplayNewShipDocumentView(arg_75_0)
	arg_75_0.newShipDocumentView = NewShipDocumentView.New(arg_75_0._shake:Find("ForNotch"), arg_75_0.event, arg_75_0.contextData)

	arg_75_0.newShipDocumentView:Load()

	local function var_75_0()
		if not arg_75_0.isLoadBg then
			return
		end

		arg_75_0:showExitTip()
	end

	arg_75_0.newShipDocumentView:ActionInvoke("SetParams", arg_75_0._shipVO, var_75_0)
	arg_75_0.newShipDocumentView:ActionInvoke("RefreshUI")
end

function var_0_0.DestroyNewShipDocumentView(arg_77_0)
	if arg_77_0.newShipDocumentView and arg_77_0.newShipDocumentView:CheckState(BaseSubView.STATES.INITED) then
		arg_77_0.newShipDocumentView:Destroy()
	end
end

function var_0_0.StopAutoExitTimer(arg_78_0)
	if not arg_78_0.autoExitTimer then
		return
	end

	arg_78_0.autoExitTimer:Stop()

	arg_78_0.autoExitTimer = nil
end

return var_0_0
