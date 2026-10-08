local var_0_0 = class("PlayerVitaeScene", import("..base.BaseUI"))

var_0_0.ON_PAGE_SWTICH = "PlayerVitaeScene:ON_PAGE_SWTICH"
var_0_0.PAGE_DEFAULT = 1
var_0_0.PAGE_NATIVE_SHIPS = 2
var_0_0.PAGE_RANDOM_SHIPS = 3

function var_0_0.getUIName(arg_1_0)
	return "PlayerVitaeUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/playervitaeui",
		"ui/share/btn_l2d_atlas",
		"commonbg/bg_admiral",
		"ui/shareui",
		"ui/admiralui_atlas",
		"ui/playervitaeshipspage"
	}

	local function var_2_1()
		local var_3_0 = {}
		local var_3_1 = getProxy(MilitaryExerciseProxy):RawGetSeasonInfo()
		local var_3_2 = SeasonInfo.getEmblem(var_3_1.score, var_3_1.rank)

		table.insert(var_3_0, "emblem/" .. var_3_2)
		table.insert(var_3_0, "emblem/n_" .. var_3_2)

		return var_3_0
	end

	local function var_2_2()
		local var_4_0 = {}
		local var_4_1 = arg_2_0:GetFlagShip()
		local var_4_2 = getProxy(ShipSkinProxy):GetAllSkinForShip(var_4_1)
		local var_4_3 = getProxy(ShipSkinProxy):GetShareSkinsForShip(var_4_1)
		local var_4_4 = _.map(var_4_3, function(arg_5_0)
			return pg.ship_skin_template[arg_5_0.id]
		end)

		table.insertto(var_4_2, var_4_4)

		for iter_4_0, iter_4_1 in ipairs(var_4_2) do
			local var_4_5 = iter_4_1 and iter_4_1.painting or "unknown"

			if var_4_5 ~= "unknown" then
				local var_4_6 = ResPathSupport.GetPaintingListByPaintingName(var_4_5)

				table.insertto(var_4_0, var_4_6)
			end
		end

		return var_4_0
	end

	local function var_2_3()
		local var_6_0 = {}
		local var_6_1 = arg_2_0:GetPlayer().displayTrophyList

		for iter_6_0, iter_6_1 in ipairs(var_6_1) do
			local var_6_2 = iter_6_1 > 1000000000 and LoveLetterTrophy.New({
				id = iter_6_1
			}) or Trophy.New({
				id = iter_6_1
			})

			if var_6_2:isLoverLetter() then
				table.insert(var_6_0, var_6_2:GetPrefabName())
				table.insert(var_6_0, "SquareIcon/" .. var_6_2:GetPainting())
			else
				table.insert(var_6_0, "medal/s_" .. var_6_2:getConfig("icon"))
			end
		end

		return var_6_0
	end

	local function var_2_4()
		return {}
	end

	local var_2_5 = var_2_1()
	local var_2_6 = var_2_2()
	local var_2_7 = var_2_4()
	local var_2_8 = var_2_3()

	return ResPathSupport.MergeLuaArr(var_2_0, var_2_5, var_2_6, var_2_7, var_2_8)
end

function var_0_0.GetBGM(arg_8_0)
	local var_8_0 = arg_8_0:GetFlagShip()
	local var_8_1 = getProxy(SettingsProxy):IsBGMEnable()

	if var_8_0:IsBgmSkin() and var_8_1 then
		return var_8_0:GetSkinBgm()
	else
		return "main"
	end
end

function var_0_0.OnPlayerNameChange(arg_9_0)
	if arg_9_0.detailPage and arg_9_0.detailPage:GetLoaded() then
		arg_9_0.detailPage:OnPlayerNameChange(arg_9_0:GetPlayer())
	end
end

function var_0_0.OnShipSkinChanged(arg_10_0, arg_10_1)
	arg_10_0:UpdatePainting()

	if arg_10_0.shipsPage and arg_10_0.shipsPage:isShowing() then
		arg_10_0.shipsPage:UpdateCard(arg_10_1)
	end
end

function var_0_0.ReloadPanting(arg_11_0, arg_11_1)
	if arg_11_0.displaySkinID and arg_11_0.displaySkinID == arg_11_1 then
		local var_11_0 = arg_11_0:GetFlagShip()

		arg_11_0:ReturnPainting()

		local var_11_1 = var_11_0:getPainting()

		setPaintingPrefabAsync(arg_11_0.painting, var_11_1, "kanban")

		arg_11_0.paintingName = var_11_1
	end
end

function var_0_0.RefreshShips(arg_12_0)
	if arg_12_0.shipsPage and arg_12_0.shipsPage:GetLoaded() and arg_12_0.shipsPage:isShowing() then
		arg_12_0.shipsPage:RefreshShips()
	end
end

function var_0_0.GetPlayer(arg_13_0)
	return getProxy(PlayerProxy):getRawData()
end

function var_0_0.GetFlagShip(arg_14_0)
	return (arg_14_0:GetPlayer():GetFlagShip())
end

function var_0_0.init(arg_15_0)
	arg_15_0.bg = arg_15_0._tf:Find("bg")
	arg_15_0.backBtn = arg_15_0._tf:Find("top/frame/back")
	arg_15_0.mainViewCg = arg_15_0._tf:Find("adapt"):GetComponent(typeof(CanvasGroup))
	arg_15_0.mainTr = arg_15_0.mainViewCg.gameObject.transform
	arg_15_0.painting = arg_15_0._tf:Find("adapt/paint")
	arg_15_0.btnContainer = arg_15_0._tf:Find("adapt/btns")
	arg_15_0.switchSkinBtn = arg_15_0._tf:Find("adapt/btns/swichSkin_btn")
	arg_15_0.replaceBtn = arg_15_0._tf:Find("adapt/btns/replace_btn")
	arg_15_0.replaceBtnTip = arg_15_0.replaceBtn:Find("tip")
	arg_15_0.cryptolaliaBtn = arg_15_0._tf:Find("adapt/btns/cryptolalia_btn")
	arg_15_0.switchSkinBtnTag = arg_15_0.switchSkinBtn:Find("Tag")
	arg_15_0.titlt = arg_15_0._tf:Find("top/frame/title")
	arg_15_0.titltNative = arg_15_0._tf:Find("top/frame/title_native")
	arg_15_0.titltRandom = arg_15_0._tf:Find("top/frame/title_random")

	local var_15_0 = arg_15_0._tf:Find("detail")

	arg_15_0.detailCg = GetOrAddComponent(var_15_0, typeof(CanvasGroup))

	local var_15_1 = arg_15_0._tf:Find("adapt/tpl")

	setActive(var_15_1, false)

	arg_15_0.btns = {
		PlayerVitaeSpineBtn.New(var_15_1, PlayerVitaeBaseBtn.HRZ_TYPE),
		PlayerVitaeBGBtn.New(var_15_1, PlayerVitaeBaseBtn.HRZ_TYPE),
		PlayerVitaeBMGBtn.New(var_15_1, PlayerVitaeBaseBtn.HRZ_TYPE),
		PlayerVitaeLive2dBtn.New(var_15_1, PlayerVitaeBaseBtn.HRZ_TYPE)
	}

	for iter_15_0 = 1, #arg_15_0.btns do
		arg_15_0.btns[iter_15_0]:setParent(arg_15_0._tf:Find("adapt/toggleBtns"), #arg_15_0.btns - iter_15_0)
	end

	arg_15_0.btnLive2dReset = arg_15_0._tf:Find("adapt/btnLive2dReset")

	GetComponent(findTF(arg_15_0.btnLive2dReset, "img"), typeof(Image)):SetNativeSize()
	GetComponent(arg_15_0.btnLive2dReset, typeof(Image)):SetNativeSize()
	SetParent(arg_15_0.btnLive2dReset, arg_15_0._tf:Find("adapt/toggleBtns"))

	arg_15_0.shipsPage = PlayerVitaeShipsPage.New(arg_15_0._tf, arg_15_0.event, arg_15_0.contextData)
	arg_15_0.detailPage = PlayerVitaeDetailPage.New(var_15_0, arg_15_0.event, arg_15_0.contextData)

	setParent(arg_15_0._tf:Find("adapt/toggleBtns"), arg_15_0._tf:Find("detail"), true)

	arg_15_0.contextData.renamePage = PlayerVitaeRenamePage.New(arg_15_0._tf, arg_15_0.event)
	arg_15_0.topFrame = arg_15_0._tf:Find("top/frame")

	local var_15_2 = PlayerVitaeDetailPage.PreCalcAspect(var_15_0, 1080)

	arg_15_0.detailPosx = arg_15_0._tf.rect.width * 0.5 - 937 * var_15_2

	LoadSpriteAsync("CommonBG/bg_admiral", function(arg_16_0)
		if IsNil(arg_15_0.bg) then
			return
		end

		local var_16_0 = arg_15_0.bg:GetComponent(typeof(Image))

		var_16_0.sprite = arg_16_0
		var_16_0.color = Color.New(1, 1, 1, 1)
	end)
end

function var_0_0.didEnter(arg_17_0)
	onButton(arg_17_0, arg_17_0.backBtn, function()
		if arg_17_0.shipsPage:GetLoaded() and arg_17_0.shipsPage:isShowing() then
			arg_17_0.shipsPage:Hide()
			arg_17_0:ShowOrHideMainView(true)
		else
			arg_17_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(arg_17_0, arg_17_0.switchSkinBtn, function()
		local var_19_0 = arg_17_0:GetFlagShip()

		arg_17_0:emit(PlayerVitaeMediator.CHANGE_SKIN, var_19_0)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.replaceBtn, function()
		arg_17_0.shipsPage:ExecuteAction("Update")
		arg_17_0:ShowOrHideMainView(false)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.cryptolaliaBtn, function()
		local var_21_0 = arg_17_0:GetFlagShip()

		arg_17_0:emit(PlayerVitaeMediator.OPEN_CRYPTOLALIA, var_21_0:getGroupId())
	end, SFX_PANEL)
	arg_17_0:bind(var_0_0.ON_PAGE_SWTICH, function(arg_22_0, arg_22_1)
		setActive(arg_17_0.titlt, arg_22_1 == var_0_0.PAGE_DEFAULT)
		setActive(arg_17_0.titltNative, arg_22_1 == var_0_0.PAGE_NATIVE_SHIPS)
		setActive(arg_17_0.titltRandom, arg_22_1 == var_0_0.PAGE_RANDOM_SHIPS)
	end)

	local var_17_0 = false

	if arg_17_0.contextData.showSelectCharacters then
		arg_17_0.contextData.showSelectCharacters = nil

		triggerButton(arg_17_0.replaceBtn)
	else
		arg_17_0:DoEnterAnimation()

		var_17_0 = true
	end

	arg_17_0:UpdatePainting()
	arg_17_0:UpdateReplaceTip()
	arg_17_0.detailPage:ExecuteAction("Show", arg_17_0:GetPlayer(), var_17_0)
	arg_17_0:emit(var_0_0.ON_PAGE_SWTICH, var_0_0.PAGE_DEFAULT)
	arg_17_0:checkShowResetL2dBtn()
end

function var_0_0.UpdateReplaceTip(arg_23_0)
	setActive(arg_23_0.replaceBtnTip, getProxy(SettingsProxy):ShouldEducateCharTip() or getProxy(ActivityProxy):IsTipLoveLetterMail())
end

function var_0_0.DoEnterAnimation(arg_24_0)
	local function var_24_0(arg_25_0)
		local var_25_0 = arg_25_0.anchoredPosition3D

		arg_25_0.anchoredPosition3D = Vector3(var_25_0.x - 1200, var_25_0.y, 0)

		LeanTween.value(arg_25_0.gameObject, var_25_0.x - 1200, var_25_0.x, 0.2):setOnUpdate(System.Action_float(function(arg_26_0)
			arg_25_0.anchoredPosition3D = Vector3(arg_26_0, var_25_0.y, 0)
		end)):setDelay(0.1):setEase(LeanTweenType.easeInOutSine)
	end

	local var_24_1 = {
		arg_24_0.btnContainer,
		arg_24_0.painting
	}

	for iter_24_0, iter_24_1 in ipairs(var_24_1) do
		var_24_0(iter_24_1)
	end

	;(function(arg_27_0)
		local var_27_0 = arg_27_0.localPosition

		arg_27_0.localPosition = Vector3(var_27_0.x, var_27_0.y + 150, 0)

		LeanTween.moveLocalY(arg_27_0.gameObject, var_27_0.y, 0.2):setDelay(0.1):setEase(LeanTweenType.easeInOutSine)
	end)(arg_24_0.topFrame)
end

function var_0_0.ShowOrHideMainView(arg_28_0, arg_28_1)
	arg_28_0.mainViewCg.alpha = arg_28_1 and 1 or 0
	arg_28_0.mainViewCg.blocksRaycasts = arg_28_1
	arg_28_0.detailCg.alpha = arg_28_1 and 1 or 0
	arg_28_0.detailCg.blocksRaycasts = arg_28_1

	if arg_28_1 then
		arg_28_0:UpdatePainting()
		arg_28_0:UpdateReplaceTip()
	end
end

function var_0_0.UpdatePainting(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0:GetFlagShip()
	local var_29_1 = false
	local var_29_2 = {}

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.btns) do
		local var_29_3 = iter_29_1:IsActive(var_29_0)

		if var_29_3 then
			table.insert(var_29_2, iter_29_1)
		end

		iter_29_1:Update(var_29_3, #var_29_2, var_29_0)

		if var_29_3 and not var_29_1 and iter_29_1:IsOverlap(arg_29_0.detailPosx) then
			var_29_1 = true
		end
	end

	if var_29_1 then
		for iter_29_2, iter_29_3 in ipairs(var_29_2) do
			iter_29_3:SwitchToVecLayout()
		end
	end

	if not arg_29_0.displaySkinID or arg_29_0.displaySkinID ~= var_29_0:getSkinId() or arg_29_1 then
		arg_29_0:ReturnPainting()

		local var_29_4 = var_29_0:getPainting()

		setPaintingPrefabAsync(arg_29_0.painting, var_29_4, "kanban")

		arg_29_0.paintingName = var_29_4

		local var_29_5 = not HXSet.isHxSkin() and getProxy(ShipSkinProxy):HasFashion(var_29_0)

		setActive(arg_29_0.switchSkinBtn, var_29_5 and not isa(var_29_0, VirtualEducateCharShip))

		arg_29_0.displaySkinID = var_29_0:getSkinId()
	end

	local var_29_6 = var_29_0:getGroupId()

	setActive(arg_29_0.cryptolaliaBtn, getProxy(PlayerProxy):getRawData():ExistCryptolalia(var_29_6))
	arg_29_0:updateSwitchSkinBtnTag()
	arg_29_0:checkShowResetL2dBtn()
end

function var_0_0.ReturnPainting(arg_30_0)
	if arg_30_0.paintingName then
		retPaintingPrefab(arg_30_0.painting, arg_30_0.paintingName)
	end

	arg_30_0.paintingName = nil
end

function var_0_0.updateSwitchSkinBtnTag(arg_31_0)
	local var_31_0 = arg_31_0:GetFlagShip()

	setActive(arg_31_0.switchSkinBtnTag, #PaintingGroupConst.GetPaintingNameListByShipVO(var_31_0) > 0)
end

function var_0_0.onBackPressed(arg_32_0)
	if arg_32_0.shipsPage and arg_32_0.shipsPage:GetLoaded() and arg_32_0.shipsPage:isShowing() then
		triggerButton(arg_32_0.backBtn)

		return
	end

	if arg_32_0.contextData.renamePage and arg_32_0.contextData.renamePage:GetLoaded() and arg_32_0.contextData.renamePage:isShowing() then
		arg_32_0.contextData.renamePage:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_32_0)
end

function var_0_0.checkShowResetL2dBtn(arg_33_0)
	local var_33_0 = arg_33_0:GetFlagShip()

	if var_33_0 and var_33_0:GetSkinConfig().spine_use_live2d == 1 then
		setActive(arg_33_0.btnLive2dReset, false)

		return
	end

	local var_33_1 = "live2d/" .. string.lower(var_33_0:getPainting())
	local var_33_2 = HXSet.autoHxShiftPath(var_33_1, nil, true)

	if not checkABExist(var_33_2) then
		setActive(arg_33_0.btnLive2dReset, false)

		return
	end

	setActive(arg_33_0.btnLive2dReset, true)
	onButton(arg_33_0, arg_33_0.btnLive2dReset, function()
		if arg_33_0:GetFlagShip() then
			local var_34_0 = arg_33_0:GetFlagShip()

			Live2dConst.ClearLive2dSave(var_34_0:getSkinId(), var_34_0.id)
			Live2dConst.SetLive2dDirty(var_34_0:getSkinId(), var_34_0.id)
		end
	end, SFX_CONFIRM)
end

function var_0_0.willExit(arg_35_0)
	arg_35_0:ReturnPainting()

	if LeanTween.isTweening(arg_35_0.painting.gameObject) then
		LeanTween.cancel(arg_35_0.painting.gameObject)
	end

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.btns) do
		iter_35_1:Dispose()
	end

	arg_35_0.btns = nil

	if arg_35_0.shipsPage then
		arg_35_0.shipsPage:Destroy()

		arg_35_0.shipsPage = nil
	end

	if arg_35_0.detailPage then
		arg_35_0.detailPage:Destroy()

		arg_35_0.detailPage = nil
	end

	if arg_35_0.contextData.renamePage then
		arg_35_0.contextData.renamePage:Destroy()

		arg_35_0.contextData.renamePage = nil
	end
end

return var_0_0
