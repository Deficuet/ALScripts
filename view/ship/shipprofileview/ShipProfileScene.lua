local var_0_0 = class("ShipProfileScene", import("...base.BaseUI"))

var_0_0.SHOW_SKILL_INFO = "event show skill info"
var_0_0.SHOW_EVALUATION = "event show evalution"
var_0_0.WEDDING_REVIEW = "event wedding review"
var_0_0.INDEX_DETAIL = 1
var_0_0.INDEX_PROFILE = 2
var_0_0.CHAT_ANIMATION_TIME = 0.3
var_0_0.CHAT_SHOW_TIME = 3

local var_0_1 = 0.35

function var_0_0.getUIName(arg_1_0)
	return "ShipProfileUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(CollectionProxy):getShipGroup(arg_2_1.groupId)
	local var_2_1 = {
		"bg/star_level_bg_" .. var_2_0:rarity2bgPrintForGet(arg_2_1.showTrans),
		"ui/share/btn_l2d_atlas"
	}

	for iter_2_0, iter_2_1 in ipairs(ShipGroup.GetDisplayableSkinList(var_2_0.id)) do
		table.insertto(var_2_1, ResPathSupport.GetPaintingListByPaintingName(iter_2_1.painting))
	end

	local var_2_2 = var_2_0:getShipConfigId()

	table.insertto(var_2_1, ResPathSupport.GetSkillIconList(var_2_2))

	local var_2_3 = Ship.New({
		configId = var_2_2
	}):getPrefab()
	local var_2_4 = ResPathSupport.GetSpineCharListByPrefabName(var_2_3)

	table.insertto(var_2_1, var_2_4)

	return table.insertto(var_2_1, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(CollectionProxy):getShipGroup(arg_3_0.contextData.groupId)

	LoadSpriteAtlasAsync("bg/star_level_bg_" .. var_3_0:rarity2bgPrintForGet(arg_3_0.contextData.showTrans), "", arg_3_1)
end

function var_0_0.setShipGroup(arg_4_0, arg_4_1)
	arg_4_0.shipGroup = arg_4_1
	arg_4_0.groupSkinList = ShipGroup.GetDisplayableSkinList(arg_4_1.id)
	arg_4_0.isBluePrintGroup = arg_4_0.shipGroup:isBluePrintGroup()
	arg_4_0.isMetaGroup = arg_4_0.shipGroup:isMetaGroup()
end

function var_0_0.setShowTrans(arg_5_0, arg_5_1)
	arg_5_0.showTrans = arg_5_1
end

function var_0_0.setOwnedSkinList(arg_6_0, arg_6_1)
	arg_6_0.ownedSkinList = arg_6_1
end

function var_0_0.init(arg_7_0)
	arg_7_0.bg = arg_7_0._tf:Find("bg")
	arg_7_0.staticBg = arg_7_0.bg:Find("static_bg")
	arg_7_0.painting = arg_7_0._tf:Find("paint")
	arg_7_0.paintingFitter = findTF(arg_7_0.painting, "fitter")
	arg_7_0.paintingInitPos = arg_7_0.painting.transform.localPosition
	arg_7_0.chatTF = arg_7_0._tf:Find("paint/chat")

	setActive(arg_7_0.chatTF, false)

	arg_7_0.commonPainting = arg_7_0.painting:Find("fitter")
	arg_7_0.l2dRoot = arg_7_0.painting:Find("live2d")
	arg_7_0.spinePaintingRoot = arg_7_0.painting:Find("spinePainting")
	arg_7_0.spinePaintingBgRoot = arg_7_0._tf:Find("paintBg/spinePainting")
	arg_7_0.chatBg = arg_7_0.chatTF:Find("chatbgtop")
	arg_7_0.initChatBgH = arg_7_0.chatBg.sizeDelta.y
	arg_7_0.chatText = arg_7_0.chatBg:Find("Text")
	arg_7_0.name = arg_7_0._tf:Find("name")
	arg_7_0.nameInitPos = arg_7_0.name.transform.localPosition
	arg_7_0.shipType = arg_7_0.name:Find("type")
	arg_7_0.labelName = arg_7_0.name:Find("name_mask/Text"):GetComponent(typeof(Text))
	arg_7_0.labelEnName = arg_7_0.name:Find("english_name"):GetComponent(typeof(Text))
	arg_7_0.stars = arg_7_0.name:Find("stars")
	arg_7_0.star = arg_7_0:getTpl("star_tpl", arg_7_0.stars)
	arg_7_0.blurPanel = arg_7_0._tf:Find("blur_panel")
	arg_7_0.top = arg_7_0._tf:Find("blur_panel/adapt/top")
	arg_7_0.btnBack = arg_7_0.top:Find("back")
	arg_7_0.bottomTF = arg_7_0._tf:Find("adapt/bottom")
	arg_7_0.labelHeart = arg_7_0.blurPanel:Find("adapt/detail_left_panel/heart/label")
	arg_7_0.btnLike = arg_7_0.blurPanel:Find("adapt/detail_left_panel/heart/btnLike")
	arg_7_0.btnChangeSkin = arg_7_0.blurPanel:Find("adapt/detail_left_panel/change_skin")
	arg_7_0.changeSkinToggle = ChangeSkinToggle.New(findTF(arg_7_0.btnChangeSkin, "toggle_ui"))
	arg_7_0.btnLikeAct = arg_7_0.btnLike:Find("like")
	arg_7_0.btnLikeDisact = arg_7_0.btnLike:Find("unlike")
	arg_7_0.obtainBtn = arg_7_0._tf:Find("adapt/bottom/others/obtain_btn")
	arg_7_0.evaBtn = arg_7_0._tf:Find("adapt/bottom/others/eva_btn")
	arg_7_0.viewBtn = arg_7_0._tf:Find("adapt/bottom/others/view_btn")
	arg_7_0.shareBtn = arg_7_0._tf:Find("adapt/bottom/others/share_btn")
	arg_7_0.rotateBtn = arg_7_0._tf:Find("adapt/bottom/others/rotate_btn")
	arg_7_0.cryptolaliaBtn = arg_7_0._tf:Find("adapt/bottom/others/cryptolalia_btn")
	arg_7_0.equipCodeBtn = arg_7_0._tf:Find("adapt/bottom/others/equip_code_btn")
	arg_7_0.leftProfile = arg_7_0.blurPanel:Find("adapt/profile_left_panel")
	arg_7_0.modelContainer = arg_7_0.leftProfile:Find("model")
	arg_7_0.live2DBtn = ShipProfileLive2dBtn.New(arg_7_0.blurPanel:Find("L2D_btn"))
	arg_7_0.l2dBtnOn = false

	GetComponent(arg_7_0.blurPanel:Find("L2D_btn"), typeof(Image)):SetNativeSize()
	GetComponent(arg_7_0.blurPanel:Find("L2D_btn/img"), typeof(Image)):SetNativeSize()

	arg_7_0.spinePaintingBtn = arg_7_0.blurPanel:Find("SP_btn")

	GetComponent(arg_7_0.spinePaintingBtn, typeof(Image)):SetNativeSize()
	GetComponent(arg_7_0.blurPanel:Find("SP_btn/img"), typeof(Image)):SetNativeSize()
	GetComponent(arg_7_0.blurPanel:Find("adapt/top/title"), typeof(Image)):SetNativeSize()

	arg_7_0.spinePaintingToggle = arg_7_0.spinePaintingBtn:Find("toggle")
	arg_7_0.cvLoader = ShipProfileCVLoader.New()
	arg_7_0.pageTFs = arg_7_0._tf:Find("adapt/pages")
	arg_7_0.paintingView = ShipProfilePaintingView.New(arg_7_0._tf, arg_7_0.painting)
	arg_7_0.toggles = {
		arg_7_0._tf:Find("adapt/bottom/detail"),
		arg_7_0._tf:Find("adapt/bottom/profile")
	}

	local var_7_0 = ShipProfileInformationPage.New(arg_7_0.pageTFs, arg_7_0.event)
	local var_7_1 = ShipProfileDetailPage.New(arg_7_0.pageTFs, arg_7_0.event)

	var_7_0:SetCvLoader(arg_7_0.cvLoader)
	var_7_0:SetCallback(function(arg_8_0)
		arg_7_0:OnCVBtnClick(arg_8_0)
	end)

	arg_7_0.pages = {
		var_7_1,
		var_7_0
	}
	arg_7_0.UISkinList = UIItemList.New(arg_7_0.leftProfile:Find("scroll/Viewport/skin_container"), arg_7_0.leftProfile:Find("scroll/Viewport/skin_container/skin_tpl"))
end

function var_0_0.didEnter(arg_9_0)
	onButton(arg_9_0, arg_9_0.btnBack, function()
		arg_9_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.equipCodeBtn, function()
		arg_9_0:emit(ShipProfileMediator.OPEN_EQUIP_CODE_SHARE, arg_9_0.shipGroup.id)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.cryptolaliaBtn, function()
		arg_9_0:emit(ShipProfileMediator.OPEN_CRYPTOLALIA, arg_9_0.shipGroup.id)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.obtainBtn, function()
		local var_13_0 = {
			type = MSGBOX_TYPE_OBTAIN,
			shipId = arg_9_0.shipGroup:getShipConfigId(),
			list = arg_9_0.shipGroup.groupConfig.description,
			mediatorName = ShipProfileMediator.__cname
		}

		pg.MsgboxMgr.GetInstance():ShowMsgBox(var_13_0)
	end)
	onButton(arg_9_0, arg_9_0.evaBtn, function()
		arg_9_0:emit(var_0_0.SHOW_EVALUATION, arg_9_0.shipGroup.id)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.viewBtn, function()
		if LeanTween.isTweening(arg_9_0.chatTF.gameObject) then
			LeanTween.cancel(arg_9_0.chatTF.gameObject)

			arg_9_0.chatTF.localScale = Vector3(0, 0, 0)

			if arg_9_0.dailogueCallback then
				arg_9_0.dailogueCallback()

				arg_9_0.dailogueCallback = nil
			end
		end

		arg_9_0.paintingView:Start()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.shareBtn, function()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeShipProfile)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.rotateBtn, function()
		setActive(arg_9_0._tf, false)
		setActive(arg_9_0.blurPanel, false)
		arg_9_0:emit(ShipProfileMediator.CLICK_ROTATE_BTN, arg_9_0.shipGroup, arg_9_0.showTrans, arg_9_0.skin)
	end, SFX_PANEL)
	arg_9_0.live2DBtn:AddListener(function(arg_18_0)
		if arg_18_0 then
			arg_9_0:CreateLive2D()
		else
			arg_9_0:clearLive2dPainting()
		end

		arg_9_0.l2dBtnOn = arg_18_0

		setActive(arg_9_0.viewBtn, not arg_18_0)
		setActive(arg_9_0.rotateBtn, not arg_18_0)
		setActive(arg_9_0.commonPainting, not arg_18_0)
		setActive(arg_9_0.l2dRoot, arg_18_0)
		arg_9_0:StopDailogue()

		arg_9_0.l2dActioning = nil

		if arg_9_0.skin then
			arg_9_0.pages[var_0_0.INDEX_PROFILE]:ExecuteAction("Flush", arg_9_0.skin, arg_18_0)
		end
	end)

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.toggles) do
		onToggle(arg_9_0, iter_9_1, function(arg_19_0)
			if iter_9_0 == var_0_0.INDEX_DETAIL then
				arg_9_0.live2DBtn:Update(arg_9_0.paintingName, false)

				arg_9_0.spinePaintingisOn = false

				arg_9_0:updateSpinePaintingState()
				arg_9_0:DisplaySpinePainting(false)
			end

			if arg_19_0 then
				arg_9_0:SwitchPage(iter_9_0)
			end
		end, SFX_PANEL)
	end

	arg_9_0:InitCommon()
	arg_9_0.live2DBtn:Update(arg_9_0.paintingName, false)
	arg_9_0:updateSpinePaintingState()
	onButton(arg_9_0, arg_9_0.btnChangeSkin, function()
		local var_20_0 = arg_9_0.skin

		if ShipSkin.IsChangeSkin(var_20_0.id) then
			local var_20_1 = ShipSkin.GetChangeSkinNextId(var_20_0.id)
			local var_20_2 = pg.ship_skin_template[var_20_1]

			arg_9_0:showSkinProfile(arg_9_0.contextData.skinIndex, var_20_2, arg_9_0.prevSkinBtn)
		end
	end, SFX_CONFIRM)
	setActive(arg_9_0.bottomTF, false)
	triggerToggle(arg_9_0.toggles[var_0_0.INDEX_DETAIL], true)
end

function var_0_0.InitSkinList(arg_21_0)
	arg_21_0.skinBtns = {}

	arg_21_0.UISkinList:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = arg_21_0.groupSkinList[arg_22_1 + 1]
			local var_22_1 = ShipProfileSkinBtn.New(arg_22_2)

			table.insert(arg_21_0.skinBtns, var_22_1)
			var_22_1:Update(var_22_0, arg_21_0.shipGroup, table.contains(arg_21_0.ownedSkinList, var_22_0.id))
			onButton(arg_21_0, var_22_1._tf, function()
				if not var_22_1.unlock then
					pg.TipsMgr.GetInstance():ShowTips(i18n("ship_profile_skin_locked"))

					return
				end

				arg_21_0:showSkinProfile(arg_22_1, var_22_0, var_22_1)
			end, SFX_PANEL)
			setActive(arg_22_2, var_22_0.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or not HXSet.isHxSkin())
		end
	end)
	arg_21_0.UISkinList:align(#arg_21_0.groupSkinList)
end

function var_0_0.showSkinProfile(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = ShipSkin.IsChangeSkin(arg_24_2.id)

	setActive(arg_24_0.btnChangeSkin, var_24_0)

	if var_24_0 then
		arg_24_0.changeSkinToggle:setSkinData(arg_24_2.id)
		setActive(arg_24_0.btnChangeSkin, not arg_24_0.changeSkinToggle:IsAsmrSkin())
	end

	arg_24_0.contextData.skinIndex = arg_24_1 + 1

	arg_24_0:ShiftSkin(arg_24_2)

	if arg_24_0.prevSkinBtn then
		arg_24_0.prevSkinBtn:UnShift()
	end

	arg_24_3:Shift()

	arg_24_0.prevSkinBtn = arg_24_3
end

function var_0_0.InitCommon(arg_25_0)
	arg_25_0:LoadSkinBg(arg_25_0.shipGroup:rarity2bgPrintForGet(arg_25_0.showTrans))
	setImageSprite(arg_25_0.shipType, GetSpriteFromAtlas("shiptype", arg_25_0.shipGroup:getShipType(arg_25_0.showTrans)))

	arg_25_0.labelName.text = arg_25_0.shipGroup:getName(arg_25_0.showTrans)

	local var_25_0 = arg_25_0.shipGroup.shipConfig
	local var_25_1 = pg.ship_data_template[var_25_0.id].star_max

	arg_25_0.labelEnName.text = var_25_0.english_name

	for iter_25_0 = 1, var_25_1 do
		cloneTplTo(arg_25_0.star, arg_25_0.stars)
	end

	arg_25_0:FlushHearts()

	local var_25_2 = arg_25_0.shipGroup:GetSkin(arg_25_0.showTrans).id

	arg_25_0:SetPainting(var_25_2, arg_25_0.showTrans)
end

function var_0_0.SetPainting(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0:RecyclePainting()

	if arg_26_2 and arg_26_0.shipGroup.trans then
		arg_26_1 = arg_26_0.shipGroup.groupConfig.trans_skin
	end

	local var_26_0 = pg.ship_skin_template[arg_26_1].painting

	setPaintingPrefabAsync(arg_26_0.painting, var_26_0, "chuanwu", function()
		setActive(arg_26_0.commonPainting, true)
	end)

	arg_26_0.paintingName = var_26_0

	arg_26_0:UpdateCryptolaliaBtn(arg_26_1)
end

function var_0_0.RecyclePainting(arg_28_0)
	if arg_28_0.paintingName then
		retPaintingPrefab(arg_28_0.painting, arg_28_0.paintingName)
	end
end

function var_0_0.FlushHearts(arg_29_0)
	local var_29_0 = arg_29_0.shipGroup.hearts

	setText(arg_29_0.labelHeart, var_29_0 > 999 and "999+" or var_29_0)

	arg_29_0.labelHeart:GetComponent("Text").color = arg_29_0.shipGroup.iheart and Color.New(1, 0.6, 0.6) or Color.New(1, 1, 1)

	setActive(arg_29_0.btnLikeDisact, not arg_29_0.shipGroup.iheart)
	setActive(arg_29_0.btnLikeAct, arg_29_0.shipGroup.iheart)
end

function var_0_0.LoadSkinBg(arg_30_0, arg_30_1)
	arg_30_0.bluePintBg = arg_30_0.isBluePrintGroup and arg_30_0.shipGroup:rarity2bgPrintForGet(arg_30_0.showTrans)
	arg_30_0.metaMainBg = arg_30_0.isMetaGroup and arg_30_0.shipGroup:rarity2bgPrintForGet(arg_30_0.showTrans)

	if arg_30_0.shipSkinBg ~= arg_30_1 then
		arg_30_0.shipSkinBg = arg_30_1

		local function var_30_0(arg_31_0)
			rtf(arg_31_0).localPosition = Vector3(0, 0, 200)
			rtf(arg_31_0).anchorMin = Vector2.zero
			rtf(arg_31_0).anchorMax = Vector2.one
			rtf(arg_31_0).offsetMin = Vector2(0, 0)
			rtf(arg_31_0).offsetMax = Vector2(0, 0)
		end

		local function var_30_1()
			PoolMgr.GetInstance():GetUI("raritydesign" .. arg_30_0.shipGroup:getRarity(arg_30_0.showTrans), true, function(arg_33_0)
				arg_30_0.designBg = arg_33_0
				arg_30_0.designName = "raritydesign" .. arg_30_0.shipGroup:getRarity(arg_30_0.showTrans)

				arg_33_0.transform:SetParent(arg_30_0.staticBg, false)

				arg_33_0.transform.localPosition = Vector3(1, 1, 1)
				arg_33_0.transform.localScale = Vector3(1, 1, 1)

				arg_33_0.transform:SetSiblingIndex(1)
				SetTFLayerOrder(arg_33_0.transform, LayerWeightConst.PAINTING_RARITY_DESIGN_LAYER)
				setActive(arg_33_0, true)
			end)
		end

		local function var_30_2()
			PoolMgr.GetInstance():GetUI("raritymeta" .. arg_30_0.shipGroup:getRarity(arg_30_0.showTrans), true, function(arg_35_0)
				arg_30_0.metaBg = arg_35_0
				arg_30_0.metaName = "raritymeta" .. arg_30_0.shipGroup:getRarity(arg_30_0.showTrans)

				arg_35_0.transform:SetParent(arg_30_0.staticBg, false)

				arg_35_0.transform.localPosition = Vector3(1, 1, 1)
				arg_35_0.transform.localScale = Vector3(1, 1, 1)

				arg_35_0.transform:SetSiblingIndex(1)
				setActive(arg_35_0, true)
			end)
		end

		local function var_30_3(arg_36_0)
			if arg_30_0.bluePintBg and arg_30_1 == arg_30_0.bluePintBg then
				if arg_30_0.metaBg then
					setActive(arg_30_0.metaBg, false)
				end

				if arg_30_0.designBg and arg_30_0.designName ~= "raritydesign" .. arg_30_0.shipGroup:getRarity(arg_30_0.showTrans) then
					PoolMgr.GetInstance():ReturnUI(arg_30_0.designName, arg_30_0.designBg)

					arg_30_0.designBg = nil
				end

				if not arg_30_0.designBg then
					var_30_1()
				else
					setActive(arg_30_0.designBg, true)
				end
			elseif arg_30_0.metaMainBg and arg_30_1 == arg_30_0.metaMainBg then
				if arg_30_0.designBg then
					setActive(arg_30_0.designBg, false)
				end

				if arg_30_0.metaBg and arg_30_0.metaName ~= "raritymeta" .. arg_30_0.shipGroup:getRarity(arg_30_0.showTrans) then
					PoolMgr.GetInstance():ReturnUI(arg_30_0.metaName, arg_30_0.metaBg)

					arg_30_0.metaBg = nil
				end

				if not arg_30_0.metaBg then
					var_30_2()
				else
					setActive(arg_30_0.metaBg, true)
				end
			else
				if arg_30_0.designBg then
					setActive(arg_30_0.designBg, false)
				end

				if arg_30_0.metaBg then
					setActive(arg_30_0.metaBg, false)
				end
			end
		end

		pg.DynamicBgMgr.GetInstance():LoadBg(arg_30_0, arg_30_1, arg_30_0.bg, arg_30_0.staticBg, var_30_0, var_30_3)
	end
end

function var_0_0.SwitchPage(arg_37_0, arg_37_1)
	if arg_37_0.index ~= arg_37_1 then
		seriesAsync({
			function(arg_38_0)
				arg_37_0:OverlayPanel(arg_37_0.blurPanel)
				arg_38_0()
			end,
			function(arg_39_0)
				local var_39_0 = arg_37_0.pages[arg_37_1]
				local var_39_1 = arg_37_1 == var_0_0.INDEX_PROFILE and not var_39_0:GetLoaded()

				var_39_0:ExecuteAction("Update", arg_37_0.shipGroup, arg_37_0.showTrans, function()
					if var_39_1 then
						arg_37_0:InitSkinList()
					end

					arg_39_0()
				end)
			end,
			function(arg_41_0)
				if not arg_37_0.index then
					arg_41_0()

					return
				end

				arg_37_0.pages[arg_37_0.index]:ExecuteAction("ExistAnim", var_0_1)
				arg_41_0()
			end,
			function(arg_42_0)
				local var_42_0 = arg_37_0.pages[arg_37_1]

				SetParent(arg_37_0.bottomTF, var_42_0._tf)
				setActive(arg_37_0.bottomTF, true)
				setAnchoredPosition(arg_37_0.bottomTF, {
					z = 0,
					x = -7,
					y = 24
				})
				var_42_0:ExecuteAction("EnterAnim", var_0_1)
				arg_37_0:TweenPage(arg_37_1)
				arg_42_0()
			end,
			function(arg_43_0)
				arg_37_0.index = arg_37_1

				local var_43_0 = arg_37_0.contextData.skinIndex or 1

				if arg_37_1 == var_0_0.INDEX_PROFILE and var_43_0 <= #arg_37_0.skinBtns then
					triggerButton(arg_37_0.skinBtns[var_43_0]._tf)
				end
			end
		})
	end
end

function var_0_0.TweenPage(arg_44_0, arg_44_1)
	if arg_44_1 == var_0_0.INDEX_DETAIL then
		LeanTween.moveX(rtf(arg_44_0.leftProfile), -700, var_0_1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveY(rtf(arg_44_0.live2DBtn._tf), -70, var_0_1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveY(rtf(arg_44_0.spinePaintingBtn), -70, var_0_1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveX(rtf(arg_44_0.painting), arg_44_0.paintingInitPos.x, var_0_1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveX(rtf(arg_44_0.name), arg_44_0.nameInitPos.x, var_0_1):setEase(LeanTweenType.easeInOutSine)
	elseif arg_44_1 == var_0_0.INDEX_PROFILE then
		LeanTween.moveX(rtf(arg_44_0.leftProfile), 0, var_0_1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveY(rtf(arg_44_0.live2DBtn._tf), 60, var_0_1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveY(rtf(arg_44_0.spinePaintingBtn), 60, var_0_1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveX(rtf(arg_44_0.painting), arg_44_0.paintingInitPos.x + 50, var_0_1):setEase(LeanTweenType.easeInOutSine)
		LeanTween.moveX(rtf(arg_44_0.name), arg_44_0.nameInitPos.x + 50, var_0_1):setEase(LeanTweenType.easeInOutSine)
	end
end

function var_0_0.ShiftSkin(arg_45_0, arg_45_1)
	if arg_45_0.index ~= var_0_0.INDEX_PROFILE or arg_45_0.skin and arg_45_1.id == arg_45_0.skin.id then
		return
	end

	arg_45_0.skin = arg_45_1

	arg_45_0:SetPainting(arg_45_1.id, false)
	arg_45_0:LoadModel(arg_45_1)
	arg_45_0.live2DBtn:Disable()
	arg_45_0.live2DBtn:Update(arg_45_0.paintingName, false)

	local var_45_0
	local var_45_1 = arg_45_1 and arg_45_1.spine_use_live2d == 1 and "spine_painting_bg" or "live2d_bg"

	LoadSpriteAtlasAsync("ui/share/btn_l2d_atlas", var_45_1, function(arg_46_0)
		GetComponent(arg_45_0.blurPanel:Find("L2D_btn"), typeof(Image)).sprite = arg_46_0
		GetComponent(arg_45_0.blurPanel:Find("L2D_btn/img"), typeof(Image)).sprite = arg_46_0

		GetComponent(arg_45_0.blurPanel:Find("L2D_btn"), typeof(Image)):SetNativeSize()
		GetComponent(arg_45_0.blurPanel:Find("L2D_btn/img"), typeof(Image)):SetNativeSize()
	end)

	arg_45_0.spinePaintingisOn = false

	arg_45_0:updateSpinePaintingState()
	arg_45_0:DestroySpinePainting()
	arg_45_0.pages[var_0_0.INDEX_PROFILE]:ExecuteAction("Flush", arg_45_1, false)

	local var_45_2
	local var_45_3 = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_45_0.skin.painting, 0) == 0

	if arg_45_0.skin.bg_sp and arg_45_0.skin.bg_sp ~= "" and var_45_3 then
		var_45_2 = arg_45_0.skin.bg_sp
	elseif arg_45_0.skin.bg and arg_45_0.skin.bg ~= "" then
		var_45_2 = arg_45_0.skin.bg
	else
		var_45_2 = arg_45_0.shipGroup:rarity2bgPrintForGet(arg_45_0.showTrans, arg_45_0.skin.id)
	end

	arg_45_0:LoadSkinBg(var_45_2)

	arg_45_0.haveOp = checkABExist("ui/skinunlockanim/star_level_unlock_anim_" .. arg_45_0.skin.id)
end

function var_0_0.UpdateCryptolaliaBtn(arg_47_0, arg_47_1)
	local var_47_0 = ShipSkin.New({
		id = arg_47_1
	}):getConfig("ship_group")

	setActive(arg_47_0.cryptolaliaBtn, getProxy(PlayerProxy):getRawData():ExistCryptolalia(var_47_0))
end

function var_0_0.LoadModel(arg_48_0, arg_48_1)
	if arg_48_0.inLoading then
		return
	end

	arg_48_0:ReturnModel()

	local var_48_0 = arg_48_1.prefab

	arg_48_0.inLoading = true

	local var_48_1 = SpineAnimChar.New()

	var_48_1:SetPaint(var_48_0)
	var_48_1:Load(true, function(arg_49_0)
		arg_48_0.inLoading = false

		arg_49_0:SetName(var_48_0)
		arg_49_0:SetLocalPosition(Vector3.zero)
		arg_49_0:SetLocalScale(Vector3(0.8, 0.8, 1))
		arg_49_0:SetParent(arg_48_0.modelContainer)
		arg_49_0:SetAction(arg_48_1.show_skin or "stand", 0)

		arg_48_0.characterModel = arg_49_0
		arg_48_0.modelName = var_48_0
	end)
end

function var_0_0.ReturnModel(arg_50_0)
	if arg_50_0.characterModel then
		arg_50_0.characterModel:Dispose()

		arg_50_0.characterModel = nil
	end
end

function var_0_0.CreateLive2D(arg_51_0)
	arg_51_0.live2DBtn:SetEnable(false)

	if arg_51_0.l2dChar then
		arg_51_0.l2dChar:Dispose()

		arg_51_0.l2dChar = nil
	end

	local var_51_0 = arg_51_0.shipGroup:getShipConfigId()
	local var_51_1 = pg.ship_skin_template[arg_51_0.skin.id].live2d_offset_profile
	local var_51_2

	if var_51_1 and #var_51_1 >= 3 then
		local var_51_3 = var_51_1
	else
		local var_51_4 = {
			0,
			0,
			0,
			52
		}
	end

	local var_51_5 = Live2DPainting.GenerateData({
		ship = Ship.New({
			noChangeSkin = true,
			configId = var_51_0,
			skin_id = arg_51_0.skin.id,
			propose = arg_51_0.shipGroup.married
		}),
		position = Vector3(0, 0, 0),
		offset = var_51_1,
		parent = arg_51_0.l2dRoot
	})

	arg_51_0.l2dChar = Live2DPainting.New(var_51_5, function(arg_52_0)
		arg_52_0:setSortingModeFrontZ()
		arg_51_0.live2DBtn:SetEnable(true)
	end)

	if isHalfBodyLive2D(arg_51_0.skin.prefab) then
		setAnchoredPosition(arg_51_0.l2dRoot, {
			y = -77 - (arg_51_0.painting.rect.height - arg_51_0.l2dRoot.rect.height * 1.5) / 2
		})
	else
		setAnchoredPosition(arg_51_0.l2dRoot, {
			y = -40
		})
	end

	if Live2dConst.UnLoadL2dPating then
		Live2dConst.UnLoadL2dPating()
	end
end

function var_0_0.GetModelAction(arg_53_0, arg_53_1)
	local var_53_0

	if not arg_53_1.spine_action or arg_53_1.spine_action == "" then
		return "stand"
	else
		return arg_53_1.spine_action
	end
end

function var_0_0.OnCVBtnClick(arg_54_0, arg_54_1)
	if arg_54_0.l2dActioning then
		return
	end

	local var_54_0 = arg_54_1.voice

	local function var_54_1()
		local var_55_0

		if arg_54_1:isEx() then
			local var_55_1 = var_54_0.l2d_action .. "_ex"

			if arg_54_0.l2dChar and arg_54_0.l2dChar:checkActionExist(var_55_1) then
				var_55_0 = var_55_1
			else
				var_55_0 = var_54_0.l2d_action
			end
		else
			var_55_0 = var_54_0.l2d_action
		end

		if arg_54_0.l2dBtnOn and arg_54_0.l2dChar and not arg_54_0.l2dChar:enablePlayAction(var_55_0) then
			return
		end

		arg_54_0:UpdatePaintingFace(arg_54_1)

		if arg_54_0.characterModel then
			local var_55_2 = arg_54_0:GetModelAction(var_54_0)

			arg_54_0.characterModel:SetAction(var_55_2, 0)
		end

		local var_55_3 = {
			var_0_0.CHAT_SHOW_TIME
		}

		if arg_54_0.live2DBtn.isOn and arg_54_0.l2dChar then
			if arg_54_0.l2dChar:IsLoaded() then
				arg_54_0.l2dActioning = true

				if not arg_54_1:L2dHasEvent() then
					parallelAsync({
						function(arg_56_0)
							arg_54_0:RemoveLive2DTimer()

							arg_54_0.l2dActioning = arg_54_0.l2dChar:TriggerAction(var_55_0, arg_56_0)
						end,
						function(arg_57_0)
							arg_54_0:PlayVoice(arg_54_1, var_55_3)
							arg_54_0:ShowDailogue(arg_54_1, var_55_3, arg_57_0)
						end
					}, function()
						arg_54_0.l2dActioning = false
					end)
				else
					seriesAsync({
						function(arg_59_0)
							arg_54_0:RemoveLive2DTimer()

							if arg_54_0.l2dChar:checkActionProfile(var_55_0) then
								arg_54_0.l2dActioning = arg_54_0.l2dChar:TriggerAction(var_55_0, arg_59_0, nil, function(arg_60_0)
									arg_54_0:PlayVoice(arg_54_1, var_55_3)
									arg_54_0:ShowDailogue(arg_54_1, var_55_3, arg_59_0)
								end)
							else
								arg_54_0:PlayVoice(arg_54_1, var_55_3)
								arg_54_0:ShowDailogue(arg_54_1, var_55_3, arg_59_0)
							end
						end
					}, function()
						arg_54_0.l2dActioning = false
					end)
				end
			end
		else
			arg_54_0:PlayVoice(arg_54_1, var_55_3)
			arg_54_0:ShowDailogue(arg_54_1, var_55_3)
		end
	end

	if var_54_0.key == "unlock" and arg_54_0.haveOp then
		arg_54_0:playOpening(var_54_1)
	elseif arg_54_1.voice.resource_key == "get" then
		local var_54_2 = arg_54_1.skin.id

		if PaintingShowScene.GetSkinShowAble(var_54_2) then
			arg_54_0:emit(ShipProfileMediator.OPEN_PAINTING_SHOW, var_54_2, function()
				onNextTick(function()
					var_54_1()
				end)
			end)
		else
			var_54_1()
		end
	else
		var_54_1()
	end
end

function var_0_0.UpdatePaintingFace(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_1.wordData
	local var_64_1 = var_64_0.mainIndex ~= nil
	local var_64_2 = arg_64_1.voice.key

	if var_64_1 then
		var_64_2 = "main_" .. var_64_0.mainIndex
	end

	if arg_64_0.paintingFitter.childCount > 0 then
		ShipExpressionHelper.SetExpression(arg_64_0.paintingFitter:GetChild(0), arg_64_0.paintingName, var_64_2, var_64_0.maxfavor, arg_64_1.skin.id)
	end

	if arg_64_0.spinePainting then
		local var_64_3

		if pg.AssistantInfo.GetAssistantEventsByDialog(var_64_2) then
			var_64_3 = pg.AssistantInfo.GetAssistantEventsByDialog(var_64_2).action
		end

		local var_64_4 = ShipExpressionHelper.GetExpression(arg_64_0.paintingName, var_64_2, var_64_0.maxfavor, arg_64_1.skin.id)

		if var_64_4 ~= "" then
			arg_64_0.spinePainting:SetAction(var_64_4, 1)

			if var_64_3 and arg_64_0.spinePainting:getAnimationExist(var_64_3) then
				arg_64_0.spinePainting:SetEmptyAction(1)
				arg_64_0.spinePainting:SetOnceAction(var_64_3, nil, function()
					return
				end, true)
			elseif arg_64_0.spinePainting:isInAction() then
				arg_64_0.spinePainting:SetAction(arg_64_0.spinePainting:getIdleName(), 0, true)
				arg_64_0.spinePainting:ClearAction()
			end
		else
			arg_64_0.spinePainting:SetEmptyAction(1)

			if var_64_3 and arg_64_0.spinePainting:getAnimationExist(var_64_3) then
				arg_64_0.spinePainting:SetOnceAction(var_64_3, nil, function()
					return
				end, true)
			elseif arg_64_0.spinePainting:isInAction() then
				arg_64_0.spinePainting:SetAction(arg_64_0.spinePainting:getIdleName(), 0, true)
				arg_64_0.spinePainting:ClearAction()
			end
		end
	end
end

function var_0_0.PlayVoice(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = arg_67_1.wordData
	local var_67_1 = arg_67_1.skin
	local var_67_2 = arg_67_1.words

	arg_67_0:RemoveCvTimer()

	if not var_67_0.cvPath or var_67_0.cvPath == "" then
		return
	end

	if var_67_2.voice_key >= ShipWordHelper.CV_KEY_REPALCE or var_67_2.voice_key_2 >= ShipWordHelper.CV_KEY_REPALCE or var_67_2.voice_key == ShipWordHelper.CV_KEY_BAN_NEW then
		local var_67_3 = 0

		if arg_67_1.isLive2d and arg_67_0.l2dChar and var_67_0.voiceCalibrate then
			var_67_3 = var_67_0.voiceCalibrate
		end

		arg_67_0.cvLoader:DelayPlaySound(var_67_0.cvPath, var_67_3, function(arg_68_0)
			if arg_68_0 then
				arg_67_2[1] = long2int(arg_68_0.length) * 0.001
			end
		end)
	end

	local var_67_4 = var_67_0.se

	if arg_67_1.isLive2d and arg_67_0.l2dChar and var_67_4 then
		arg_67_0.cvLoader:RawPlaySound("event:/ui/" .. var_67_4[1], var_67_4[2])
	end
end

function var_0_0.RemoveCvSeTimer(arg_69_0)
	if arg_69_0.cvSeTimer then
		arg_69_0.cvSeTimer:Stop()

		arg_69_0.cvSeTimer = nil
	end
end

function var_0_0.RemoveCvTimer(arg_70_0)
	if arg_70_0.cvTimer then
		arg_70_0.cvTimer:Stop()

		arg_70_0.cvTimer = nil
	end
end

function var_0_0.RemoveLive2DTimer(arg_71_0)
	if arg_71_0.Live2DTimer then
		LeanTween.cancel(arg_71_0.Live2DTimer)

		arg_71_0.Live2DTimer = nil
	end
end

function var_0_0.ShowDailogue(arg_72_0, arg_72_1, arg_72_2, arg_72_3)
	arg_72_0.dailogueCallback = arg_72_3 or function()
		return
	end

	local var_72_0 = arg_72_1.wordData.textContent

	if not var_72_0 or var_72_0 == "" or var_72_0 == "nil" then
		if arg_72_0.dailogueCallback then
			arg_72_0.dailogueCallback()

			arg_72_0.dailogueCallback = nil
		end

		return
	end

	local var_72_1 = arg_72_1.wordData.voiceCalibrate
	local var_72_2 = arg_72_0.chatText:GetComponent(typeof(Text))

	setText(arg_72_0.chatText, SwitchSpecialChar(var_72_0))

	var_72_2.alignment = #var_72_2.text > CHAT_POP_STR_LEN and TextAnchor.MiddleLeft or TextAnchor.MiddleCenter

	local var_72_3 = var_72_2.preferredHeight + 120

	arg_72_0.chatBg.sizeDelta = var_72_3 > arg_72_0.initChatBgH and Vector2.New(arg_72_0.chatBg.sizeDelta.x, var_72_3) or Vector2.New(arg_72_0.chatBg.sizeDelta.x, arg_72_0.initChatBgH)

	arg_72_0:StopDailogue()
	setActive(arg_72_0.chatTF, true)
	LeanTween.scale(rtf(arg_72_0.chatTF.gameObject), Vector3.New(1, 1, 1), var_0_0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack):setDelay(var_72_1 and var_72_1 or 0):setOnComplete(System.Action(function()
		LeanTween.scale(rtf(arg_72_0.chatTF.gameObject), Vector3.New(0, 0, 1), var_0_0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(var_0_0.CHAT_ANIMATION_TIME + arg_72_2[1]):setOnComplete(System.Action(function()
			if arg_72_0.dailogueCallback then
				arg_72_0.dailogueCallback()

				arg_72_0.dailogueCallback = nil
			end

			if arg_72_0.spinePainting then
				arg_72_0.spinePainting:SetEmptyAction(1)
			end
		end))
	end))
end

function var_0_0.StopDailogue(arg_76_0)
	LeanTween.cancel(arg_76_0.chatTF.gameObject)

	arg_76_0.chatTF.localScale = Vector3(0, 0)
end

function var_0_0.onBackPressed(arg_77_0)
	if arg_77_0.paintingView.isPreview then
		arg_77_0.paintingView:Finish(true)

		return
	end

	triggerButton(arg_77_0.btnBack)
end

function var_0_0.playOpening(arg_78_0, arg_78_1)
	local var_78_0 = "star_level_unlock_anim_" .. arg_78_0.skin.id

	if checkABExist("ui/skinunlockanim/" .. var_78_0) then
		pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
			return
		end, function()
			if arg_78_1 then
				arg_78_1()
			end
		end, "ui/skinunlockanim", var_78_0, true, false)
	elseif arg_78_1 then
		arg_78_1()
	end
end

function var_0_0.updateSpinePaintingState(arg_81_0)
	local var_81_0 = HXSet.autoHxShiftPath("spinepainting/" .. arg_81_0.paintingName)

	if checkABExist(var_81_0) then
		setActive(arg_81_0.spinePaintingBtn, true)
		setActive(arg_81_0.spinePaintingToggle:Find("on"), arg_81_0.spinePaintingisOn)
		setActive(arg_81_0.spinePaintingToggle:Find("off"), not arg_81_0.spinePaintingisOn)
		removeOnButton(arg_81_0.spinePaintingBtn)
		onButton(arg_81_0, arg_81_0.spinePaintingBtn, function()
			arg_81_0.spinePaintingisOn = not arg_81_0.spinePaintingisOn

			setActive(arg_81_0.spinePaintingToggle:Find("on"), arg_81_0.spinePaintingisOn)
			setActive(arg_81_0.spinePaintingToggle:Find("off"), not arg_81_0.spinePaintingisOn)

			if arg_81_0.spinePaintingisOn then
				arg_81_0:CreateSpinePainting()
			end

			setActive(arg_81_0.viewBtn, not arg_81_0.spinePaintingisOn)
			setActive(arg_81_0.rotateBtn, not arg_81_0.spinePaintingisOn)
			setActive(arg_81_0.commonPainting, not arg_81_0.spinePaintingisOn)
			setActive(arg_81_0.spinePaintingRoot, arg_81_0.spinePaintingisOn)
			setActive(arg_81_0.spinePaintingBgRoot, arg_81_0.spinePaintingisOn)
			arg_81_0:StopDailogue()

			if arg_81_0.skin then
				arg_81_0.pages[var_0_0.INDEX_PROFILE]:ExecuteAction("Flush", arg_81_0.skin, false)
			end
		end, SFX_PANEL)
	else
		setActive(arg_81_0.spinePaintingBtn, false)
	end
end

function var_0_0.CreateSpinePainting(arg_83_0)
	if arg_83_0.skin.id ~= arg_83_0.preSkinId then
		arg_83_0:DestroySpinePainting()

		local var_83_0 = arg_83_0.shipGroup:getShipConfigId()
		local var_83_1 = SpinePainting.GenerateData({
			ship = Ship.New({
				noChangeSkin = true,
				configId = var_83_0,
				skin_id = arg_83_0.skin.id
			}),
			position = Vector3(0, 0, 0),
			parent = arg_83_0.spinePaintingRoot,
			offset = pg.ship_skin_template[arg_83_0.skin.id].spine_offset_profile,
			effectParent = arg_83_0.spinePaintingBgRoot
		})

		arg_83_0.spinePainting = SpinePainting.New(var_83_1, function()
			return
		end)
		arg_83_0.preSkinId = arg_83_0.skin.id
	end

	arg_83_0:DisplaySpinePainting(true)
end

function var_0_0.clearLive2dPainting(arg_85_0)
	if arg_85_0.l2dChar then
		arg_85_0.l2dChar:Dispose()

		arg_85_0.l2dChar = nil
		arg_85_0.l2dActioning = false
		arg_85_0.cvLoader.prevCvPath = nil

		arg_85_0:StopDailogue()
		arg_85_0.cvLoader:StopSound()
	end
end

function var_0_0.DestroySpinePainting(arg_86_0)
	if arg_86_0.spinePainting then
		arg_86_0.spinePainting:Dispose()

		arg_86_0.spinePainting = nil
	end

	arg_86_0.preSkinId = nil
end

function var_0_0.onWeddingReview(arg_87_0, arg_87_1)
	if not arg_87_1 and arg_87_0.exitLoadL2d then
		arg_87_0.exitLoadL2d = false

		arg_87_0.live2DBtn:Update(arg_87_0.paintingName, true)
	else
		arg_87_0.live2DBtn:Update(arg_87_0.paintingName, false)
	end

	arg_87_0.live2DBtn:SetEnable(not arg_87_1)

	if arg_87_0.l2dChar and arg_87_1 then
		arg_87_0.l2dChar:Dispose()

		arg_87_0.l2dChar = nil
		arg_87_0.l2dActioning = false
		arg_87_0.cvLoader.prevCvPath = nil

		arg_87_0:StopDailogue()
		arg_87_0.cvLoader:StopSound()

		arg_87_0.exitLoadL2d = true
	end

	if arg_87_0.spinePaintingRoot.childCount > 0 then
		setActive(arg_87_0.commonPainting, not arg_87_0.spinePaintingisOn)
	end
end

function var_0_0.DisplaySpinePainting(arg_88_0, arg_88_1)
	setActive(arg_88_0.spinePaintingRoot, arg_88_1)
	setActive(arg_88_0.spinePaintingBgRoot, arg_88_1)
end

function var_0_0.willExit(arg_89_0)
	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()
	SetParent(arg_89_0.bottomTF, arg_89_0._tf)
	arg_89_0:UnOverlayPanel(arg_89_0.blurPanel, arg_89_0._tf)

	for iter_89_0, iter_89_1 in ipairs(arg_89_0.pages) do
		iter_89_1:Destroy()
	end

	if arg_89_0.l2dChar then
		arg_89_0.l2dChar:Dispose()

		arg_89_0.l2dChar = nil
	end

	arg_89_0:DestroySpinePainting()
	arg_89_0.paintingView:Dispose()
	arg_89_0.live2DBtn:Dispose()
	arg_89_0.cvLoader:Dispose()
	arg_89_0:ReturnModel()
	arg_89_0:RecyclePainting()
	_.each(arg_89_0.skinBtns or {}, function(arg_90_0)
		arg_90_0:Dispose()
	end)
	arg_89_0:RemoveCvTimer()
	arg_89_0:RemoveCvSeTimer()
	arg_89_0:RemoveLive2DTimer()
end

return var_0_0
