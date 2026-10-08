local var_0_0 = class("CryptolaliaScene", import("view.base.BaseUI"))

var_0_0.ON_UNLOCK = "CryptolaliaScene:ON_UNLOCK"
var_0_0.ON_DELETE = "CryptolaliaScene:ON_DELETE"
var_0_0.ON_SELECT = "CryptolaliaScene:ON_SELECT"

function var_0_0.getUIName(arg_1_0)
	return "CryptolaliaUI"
end

function var_0_0.GetAllCryptolaliaShipRes()
	local var_2_0 = {}
	local var_2_1 = pg.soundstory_template.all

	for iter_2_0, iter_2_1 in ipairs(var_2_1) do
		local var_2_2 = pg.soundstory_template[iter_2_1]
		local var_2_3 = var_2_2 and var_2_2.ship_id

		if var_2_3 then
			table.insert(var_2_0, "CryptolaliaShip/" .. var_2_3)
		end
	end

	return var_2_0
end

function var_0_0.GetAllCryptolaliaAuditionRes()
	local var_3_0 = {}
	local var_3_1 = pg.soundstory_template.all

	for iter_3_0, iter_3_1 in ipairs(var_3_1) do
		local var_3_2 = pg.soundstory_template[iter_3_1]

		if var_3_2 then
			local var_3_3 = var_3_2.audition_resource_CN
			local var_3_4 = var_3_2.audition_resource_JP

			if var_3_3 and var_3_3 ~= "" then
				table.insert(var_3_0, "cue/" .. var_3_3 .. ".b")
			end

			if var_3_4 and var_3_4 ~= "" then
				table.insert(var_3_0, "cue/" .. var_3_4 .. ".b")
			end
		end
	end

	return var_3_0
end

function var_0_0.getResource(arg_4_0, arg_4_1)
	local var_4_0 = {
		"ui/CryptolaliaUI_atlas",
		"ui/CryptolaliaListui",
		"ui/CryptolaliaPurchaseWindowui",
		"ui/CryptolaliaResDeleteWindowui"
	}

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_4_0, arg_4_1), var_4_0, var_0_0.GetAllCryptolaliaShipRes(), var_0_0.GetAllCryptolaliaAuditionRes()))
end

function var_0_0.SetCryptolaliaList(arg_5_0, arg_5_1)
	arg_5_0.cryptolaliaList = arg_5_1
end

function var_0_0.init(arg_6_0)
	arg_6_0.cg = arg_6_0._tf:GetComponent(typeof(CanvasGroup))
	arg_6_0.backBtn = arg_6_0._tf:Find("Top/blur_panel/adapt/top/back_btn")
	arg_6_0.auditionBtn = arg_6_0._tf:Find("Main/audition/toggle")
	arg_6_0.auditionBtnOn = arg_6_0._tf:Find("Main/audition/toggle/on")
	arg_6_0.auditionBtnOff = arg_6_0._tf:Find("Main/audition/toggle/off")
	arg_6_0.cdImg = arg_6_0._tf:Find("Main/cd"):GetComponent(typeof(Image))
	arg_6_0.cdSignatureImg = arg_6_0._tf:Find("Main/cd/signature"):GetComponent(typeof(Image))
	arg_6_0.shipName = arg_6_0._tf:Find("Main/cd/name"):GetComponent(typeof(Text))
	arg_6_0.timeLimit = arg_6_0._tf:Find("Main/cd/timelimit")
	arg_6_0.timeTxt = arg_6_0._tf:Find("Main/cd/timelimit/Text"):GetComponent(typeof(Text))
	arg_6_0.nameTxt = arg_6_0._tf:Find("Main/name"):GetComponent(typeof(Text))
	arg_6_0.authorTxt = arg_6_0._tf:Find("Main/author"):GetComponent(typeof(Text))
	arg_6_0.descTxt = arg_6_0._tf:Find("Main/desc"):GetComponent(typeof(Text))
	arg_6_0.signatureImg = arg_6_0._tf:Find("Main/desc/signature"):GetComponent(typeof(Image))
	arg_6_0.auditionTxt = arg_6_0._tf:Find("Main/audition/mask/Text"):GetComponent("ScrollText")
	arg_6_0.auditionEffect = arg_6_0._tf:Find("Main/audition/p2/Lines"):GetComponent(typeof(Animation))

	arg_6_0.auditionEffect:Play("anim_line_reset")

	arg_6_0.btnsTr = arg_6_0._tf:Find("Main/btns")
	arg_6_0.lockBtn = arg_6_0.btnsTr:Find("lock")
	arg_6_0.downloadBtn = arg_6_0.btnsTr:Find("download")
	arg_6_0.downloadingBtn = arg_6_0.btnsTr:Find("downloading")
	arg_6_0.playBtn = arg_6_0.btnsTr:Find("play")
	arg_6_0.playPrevBtn = arg_6_0.btnsTr:Find("play/prev")
	arg_6_0.playNextBtn = arg_6_0.btnsTr:Find("play/next")
	arg_6_0.deleteBtn = arg_6_0.btnsTr:Find("delete")
	arg_6_0.stateBtn = arg_6_0.btnsTr:Find("state")
	arg_6_0.stateBtnTxt = arg_6_0.stateBtn:Find("Text"):GetComponent(typeof(Text))
	arg_6_0.switchBtn = arg_6_0.btnsTr:Find("switch")
	arg_6_0.listBtn = arg_6_0.btnsTr:Find("list")
	arg_6_0.optionBtn = arg_6_0._tf:Find("Top/blur_panel/adapt/top/option")
	arg_6_0.purchaseWindow = CryptolaliaPurchaseWindow.New(arg_6_0._tf, arg_6_0.event)
	arg_6_0.resDeleteWindow = CryptolaliaResDeleteWindow.New(arg_6_0._tf, arg_6_0.event)
	arg_6_0.downloadMgr = CryptolaliaDownloadMgr.New()
	arg_6_0.soundPlayer = CryptolaliaSoundPlayer.New()
	arg_6_0.mainView = CryptolaliaMainView.New(arg_6_0)
	arg_6_0.listView = CryptolaliaListView.New(arg_6_0._tf, arg_6_0.event)

	local var_6_0 = CryptolaliaScrollRectAnimation.New(arg_6_0._tf)

	arg_6_0.scrollRect = CryptolaliaScrollRect.New(arg_6_0._tf:Find("Main/list/tpl"), var_6_0)

	arg_6_0.scrollRect:Make(function(arg_7_0)
		arg_6_0:OnItemUpdate(arg_7_0)
	end, function(arg_8_0)
		arg_6_0:OnItemSelected(arg_8_0:GetInitIndex())
	end)

	arg_6_0.dftAniEvent = arg_6_0._tf:GetComponent(typeof(DftAniEvent))

	setText(arg_6_0._tf:Find("Main/cd/timelimit/label"), i18n("cryptolalia_timelimie"))
	setText(arg_6_0.downloadingBtn:Find("label"), i18n("cryptolalia_label_downloading"))

	Input.multiTouchEnabled = false
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0.cards = {}
	arg_9_0.downloadReqList = {}

	parallelAsync({
		function(arg_10_0)
			arg_9_0.dftAniEvent:SetEndEvent(arg_10_0)
		end,
		function(arg_11_0)
			arg_9_0:InitCryptolaliaList(arg_11_0)
		end
	}, function()
		arg_9_0.dftAniEvent:SetEndEvent(nil)
		arg_9_0.scrollRect:SetUp()
		arg_9_0:ActiveDefault()
		arg_9_0:RegisterEvent()
	end)
end

function var_0_0.ActiveDefault(arg_13_0)
	if not arg_13_0.contextData.groupId then
		return
	end

	local var_13_0 = -1

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.displays) do
		if iter_13_1 and iter_13_1:IsSameGroup(arg_13_0.contextData.groupId) then
			var_13_0 = iter_13_0

			break
		end
	end

	if var_13_0 <= 0 then
		return
	end

	for iter_13_2, iter_13_3 in pairs(arg_13_0.cards) do
		if iter_13_3:GetInitIndex() == var_13_0 then
			triggerButton(iter_13_3._go)

			break
		end
	end
end

function var_0_0.OnItemUpdate(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.displays[arg_14_1:GetInitIndex()]

	arg_14_1:Interactable(false)

	if not var_14_0 then
		return
	end

	arg_14_1:Interactable(true)

	local var_14_1 = var_14_0:GetShipGroupId()

	LoadSpriteAtlasAsync("CryptolaliaShip/" .. var_14_1, "icon", function(arg_15_0)
		arg_14_1:UpdateSprite(arg_15_0)
	end)

	arg_14_0.cards[var_14_0.id] = arg_14_1
end

function var_0_0.OnItemSelected(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.displays[arg_16_1]

	if not var_16_0 then
		return
	end

	if not arg_16_0.langType or not var_16_0:ExistLang(arg_16_0.langType) or arg_16_0.selectedIndex ~= arg_16_1 then
		arg_16_0.langType = var_16_0:GetDefaultLangType()
	end

	local var_16_1 = var_16_0:GetCpkName(arg_16_0.langType)
	local var_16_2 = Cryptolalia.BuildCpkPath(var_16_1)
	local var_16_3 = arg_16_0.downloadMgr:IsDownloadState(var_16_2)

	if var_16_3 and arg_16_0.downloadReqList[var_16_0.id] == nil then
		arg_16_0:OnUpdateForResDownload("ReConnection", var_16_0, arg_16_1)
	end

	arg_16_0.mainView:Flush(var_16_0, arg_16_0.langType, var_16_3)

	arg_16_0.selectedIndex = arg_16_1

	if arg_16_0.auditionFlag then
		triggerButton(arg_16_0.auditionBtn)
	end
end

function var_0_0.Filter(arg_17_0)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.cryptolaliaList or {}) do
		if iter_17_1:InTime() or not iter_17_1:IsLock() then
			table.insert(var_17_0, iter_17_1)
		end
	end

	table.sort(var_17_0, function(arg_18_0, arg_18_1)
		local var_18_0 = arg_18_0:GetSortIndex()
		local var_18_1 = arg_18_1:GetSortIndex()

		if var_18_0 == var_18_1 then
			return arg_18_0.id < arg_18_1.id
		else
			return var_18_0 < var_18_1
		end
	end)

	return var_17_0
end

function var_0_0.InitCryptolaliaList(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0:Filter()

	arg_19_0.displays = arg_19_0:FillEmptyDisplayIfNeed(var_19_0)

	arg_19_0.scrollRect:Align(#arg_19_0.displays, arg_19_1)
end

function var_0_0.FillEmptyDisplayIfNeed(arg_20_0, arg_20_1)
	local var_20_0 = {}

	for iter_20_0 = 1, math.max(5, #arg_20_1) do
		local var_20_1 = defaultValue(arg_20_1[iter_20_0], false)

		if iter_20_0 % 2 == 0 then
			table.insert(var_20_0, var_20_1)
		else
			table.insert(var_20_0, 1, var_20_1)
		end
	end

	return var_20_0
end

function var_0_0.RegisterEvent(arg_21_0)
	arg_21_0:bind(var_0_0.ON_UNLOCK, function(arg_22_0, arg_22_1)
		arg_21_0:OnUnlockCryptolalia(arg_22_1)
	end)
	arg_21_0:bind(var_0_0.ON_DELETE, function(arg_23_0)
		if not arg_21_0.selectedIndex then
			return
		end

		arg_21_0:OnItemSelected(arg_21_0.selectedIndex)
	end)
	arg_21_0:bind(var_0_0.ON_SELECT, function(arg_24_0, arg_24_1)
		local var_24_0 = arg_21_0.cards[arg_24_1]

		if var_24_0 then
			triggerButton(var_24_0._go)
		end
	end)
	onButton(arg_21_0, arg_21_0.optionBtn, function()
		arg_21_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.backBtn, function()
		arg_21_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_21_0, arg_21_0.switchBtn, function()
		if not arg_21_0.selectedIndex then
			return
		end

		local var_27_0 = arg_21_0.displays[arg_21_0.selectedIndex]

		if not var_27_0 then
			return
		end

		if not var_27_0:IsMultiVersion() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("cryptolalia_coming_soom"))

			return
		end

		arg_21_0.langType = 1 - arg_21_0.langType

		arg_21_0:OnItemSelected(arg_21_0.selectedIndex)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.listBtn, function()
		if not arg_21_0.selectedIndex then
			return
		end

		local var_28_0 = arg_21_0.displays[arg_21_0.selectedIndex]

		if var_28_0 then
			local var_28_1 = arg_21_0:Filter()

			arg_21_0.listView:ExecuteAction("Show", var_28_1, arg_21_0.langType, var_28_0.id, arg_21_0.scrollRect)
		end
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.deleteBtn, function()
		if not arg_21_0.selectedIndex then
			return
		end

		local var_29_0 = arg_21_0.displays[arg_21_0.selectedIndex]

		if var_29_0 and var_29_0:IsPlayableState(arg_21_0.langType) then
			arg_21_0.resDeleteWindow:ExecuteAction("Show", var_29_0, arg_21_0.langType)
		end
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.playBtn:Find("play"), function()
		if not arg_21_0.selectedIndex then
			return
		end

		arg_21_0:PlayVedio(arg_21_0.selectedIndex)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.playNextBtn, function()
		if not arg_21_0.selectedIndex then
			return
		end

		local var_31_0 = arg_21_0.displays[arg_21_0.selectedIndex + 1]

		if var_31_0 then
			arg_21_0:emit(var_0_0.ON_SELECT, var_31_0.id)
		end
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.playPrevBtn, function()
		if not arg_21_0.selectedIndex then
			return
		end

		local var_32_0 = arg_21_0.displays[arg_21_0.selectedIndex - 1]

		if var_32_0 then
			arg_21_0:emit(var_0_0.ON_SELECT, var_32_0.id)
		end
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.downloadBtn, function()
		if not arg_21_0.selectedIndex then
			return
		end

		arg_21_0:DownloadRes(arg_21_0.selectedIndex)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.lockBtn, function()
		if not arg_21_0.selectedIndex then
			return
		end

		local var_34_0 = arg_21_0.displays[arg_21_0.selectedIndex]

		if var_34_0 and var_34_0:IsLockState() then
			arg_21_0.purchaseWindow:ExecuteAction("Show", var_34_0, arg_21_0.langType)
		end
	end, SFX_PANEL)

	arg_21_0.auditionFlag = false

	onButton(arg_21_0, arg_21_0.auditionBtn, function()
		if not arg_21_0.selectedIndex then
			return
		end

		local var_35_0 = arg_21_0.displays[arg_21_0.selectedIndex]

		if not var_35_0 then
			return
		end

		arg_21_0.auditionFlag = not arg_21_0.auditionFlag

		if arg_21_0.auditionFlag then
			arg_21_0:PlayAudition(var_35_0)
			pg.BgmMgr.GetInstance():StopPlay()
		else
			arg_21_0:ClearAuditionTimer()
			arg_21_0.soundPlayer:Stop()
			arg_21_0.auditionEffect:Play("anim_line_reset")
			pg.BgmMgr.GetInstance():ContinuePlay()
		end

		arg_21_0:UpdateAudition(arg_21_0.auditionFlag)
	end, SFX_PANEL)
	arg_21_0:UpdateAudition(arg_21_0.auditionFlag)
end

function var_0_0.UpdateAudition(arg_36_0, arg_36_1)
	setActive(arg_36_0.auditionBtnOn, arg_36_1)
	setActive(arg_36_0.auditionBtnOff, not arg_36_1)
end

function var_0_0.PlayAudition(arg_37_0, arg_37_1)
	arg_37_0:ClearAuditionTimer()
	arg_37_0.auditionEffect:Play("anim_line_loop")

	local var_37_0 = getProxy(PlayerProxy):getRawData():GetFlagShip()
	local var_37_1 = arg_37_1:GetAudition(arg_37_0.langType)
	local var_37_2 = arg_37_1:GetAuditionVoice(arg_37_0.langType)

	arg_37_0.soundPlayer:Load(var_37_1, var_37_2, 0, function(arg_38_0)
		arg_37_0.timer = Timer.New(function()
			if arg_37_0.auditionFlag then
				triggerButton(arg_37_0.auditionBtn)
			end
		end, arg_38_0, 1)

		arg_37_0.timer:Start()
	end)
end

function var_0_0.ClearAuditionTimer(arg_40_0)
	if arg_40_0.timer then
		arg_40_0.timer:Stop()

		arg_40_0.timer = nil
	end
end

function var_0_0.IsDownloading(arg_41_0, arg_41_1)
	if not arg_41_1 then
		return false
	end

	if arg_41_1:ExistLang(Cryptolalia.LANG_TYPE_CH) then
		local var_41_0 = arg_41_1:GetCpkName(Cryptolalia.LANG_TYPE_CH)
		local var_41_1 = Cryptolalia.BuildCpkPath(var_41_0)

		if arg_41_0.downloadMgr:IsDownloadState(var_41_1) then
			return true
		end
	end

	if arg_41_1:ExistLang(Cryptolalia.LANG_TYPE_JP) then
		local var_41_2 = arg_41_1:GetCpkName(Cryptolalia.LANG_TYPE_JP)
		local var_41_3 = Cryptolalia.BuildCpkPath(var_41_2)

		if arg_41_0.downloadMgr:IsDownloadState(var_41_3) then
			return true
		end
	end

	return false
end

function var_0_0.DownloadRes(arg_42_0, arg_42_1)
	for iter_42_0, iter_42_1 in ipairs(arg_42_0.displays or {}) do
		if arg_42_0:IsDownloading(iter_42_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("cryptolalia_download_task_already_exists", iter_42_1:GetName()))

			return
		end
	end

	if IsUnityEditor then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

		return
	end

	local var_42_0 = arg_42_0.displays[arg_42_1]

	originalPrint(var_42_0:IsDownloadableState(arg_42_0.langType))

	if var_42_0 and var_42_0:IsDownloadableState(arg_42_0.langType) and not arg_42_0.downloadReqList[var_42_0.id] then
		originalPrint("Downloading............")
		arg_42_0:OnUpdateForResDownload("Request", var_42_0, arg_42_1)
		arg_42_0:OnItemSelected(arg_42_0.selectedIndex)
	end
end

function var_0_0.OnUpdateForResDownload(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = arg_43_2:GetCpkName(arg_43_0.langType)
	local var_43_1 = Cryptolalia.BuildCpkPath(var_43_0)
	local var_43_2 = Cryptolalia.BuildSubtitlePath(var_43_0)

	arg_43_0.downloadMgr[arg_43_1](arg_43_0.downloadMgr, {
		var_43_2,
		var_43_1
	}, function(arg_44_0, arg_44_1)
		local var_44_0 = arg_43_0.downloadReqList[arg_43_2.id]

		if not var_44_0 or var_44_0.index ~= arg_43_0.selectedIndex then
			return
		end

		if arg_44_1 == CryptolaliaDownloadMgr.PROGRESS_FINISH or arg_44_1 == CryptolaliaDownloadMgr.PROGRESS_ERROR then
			arg_43_0.downloadReqList[arg_43_2.id] = nil
			arg_43_0.cg.blocksRaycasts = false

			onNextTick(function()
				arg_43_0:OnItemSelected(arg_43_0.selectedIndex)

				arg_43_0.cg.blocksRaycasts = true
			end)

			if arg_44_1 == CryptolaliaDownloadMgr.PROGRESS_FINISH then
				pg.TipsMgr.GetInstance():ShowTips(i18n("cryptolalia_download_done"))
			end
		else
			setSlider(arg_43_0.downloadingBtn, 0, 1, arg_44_1)
		end
	end)

	arg_43_0.downloadReqList[arg_43_2.id] = {
		index = arg_43_3
	}
end

function var_0_0.PlayVedio(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0.displays[arg_46_1]

	if var_46_0 and var_46_0:IsPlayableState(arg_46_0.langType) then
		pg.BgmMgr.GetInstance():StopPlay()

		local var_46_1 = var_46_0:GetCpkName(arg_46_0.langType)
		local var_46_2 = var_46_0:GetCaptionsColor()
		local var_46_3 = CryptolaliaVedioPlayer.New(arg_46_0._tf)

		var_46_3:Play(var_46_1, var_46_2, function()
			pg.BgmMgr.GetInstance():ContinuePlay()
		end)

		arg_46_0.player = var_46_3
	end
end

function var_0_0.OnUnlockCryptolalia(arg_48_0, arg_48_1)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0.cryptolaliaList) do
		if iter_48_1.id == arg_48_1 then
			iter_48_1:Unlock()
		end
	end

	for iter_48_2, iter_48_3 in ipairs(arg_48_0.displays) do
		if iter_48_3 and iter_48_3.id == arg_48_1 then
			iter_48_3:Unlock()
		end
	end

	if not arg_48_0.selectedIndex then
		return
	end

	local var_48_0 = arg_48_0.displays[arg_48_0.selectedIndex]

	if var_48_0 and var_48_0.id == arg_48_1 then
		arg_48_0:OnItemSelected(arg_48_0.selectedIndex)
	end

	if arg_48_0.purchaseWindow and arg_48_0.purchaseWindow:GetLoaded() and arg_48_0.purchaseWindow:isShowing() then
		arg_48_0.purchaseWindow:Hide()
	end
end

function var_0_0.onBackPressed(arg_49_0)
	if arg_49_0.purchaseWindow and arg_49_0.purchaseWindow:GetLoaded() and arg_49_0.purchaseWindow:isShowing() then
		arg_49_0.purchaseWindow:Hide()

		return
	end

	if arg_49_0.resDeleteWindow and arg_49_0.resDeleteWindow:GetLoaded() and arg_49_0.resDeleteWindow:isShowing() then
		arg_49_0.resDeleteWindow:Hide()

		return
	end

	if arg_49_0.listView and arg_49_0.listView:GetLoaded() and arg_49_0.listView:isShowing() then
		arg_49_0.listView:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_49_0)
end

function var_0_0.willExit(arg_50_0)
	arg_50_0:ClearAuditionTimer()

	if arg_50_0.scrollRect then
		arg_50_0.scrollRect:Dispose()

		arg_50_0.scrollRect = nil
	end

	arg_50_0.downloadReqList = nil

	if arg_50_0.purchaseWindow then
		arg_50_0.purchaseWindow:Destroy()

		arg_50_0.purchaseWindow = nil
	end

	if arg_50_0.resDeleteWindow then
		arg_50_0.resDeleteWindow:Destroy()

		arg_50_0.resDeleteWindow = nil
	end

	if arg_50_0.mainView then
		arg_50_0.mainView:Dispose()

		arg_50_0.mainView = nil
	end

	if arg_50_0.player then
		arg_50_0.player:Dispose()

		arg_50_0.player = nil
	end

	if arg_50_0.downloadMgr then
		arg_50_0.downloadMgr:Dispose()

		arg_50_0.downloadMgr = nil
	end

	if arg_50_0.listView then
		arg_50_0.listView:Destroy()

		arg_50_0.listView = nil
	end

	arg_50_0.cards = nil

	if arg_50_0.soundPlayer then
		arg_50_0.soundPlayer:Dispose()

		arg_50_0.soundPlayer = nil
	end

	Input.multiTouchEnabled = true
end

return var_0_0
