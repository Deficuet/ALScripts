local var_0_0 = class("TrophyGalleryLayer", import("..base.BaseUI"))

var_0_0.Filter = {
	"all",
	"claimed"
}
var_0_0.PAGE_COMMON = 1
var_0_0.PAGE_LIMITED = 2

function var_0_0.getUIName(arg_1_0)
	return "TrophyGalleryUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/trophygalleryui",
		"ui/iconcolorful",
		"ui/newstyleloveletterrewardmsgboxui"
	}

	local function var_2_1()
		local var_3_0 = {}

		for iter_3_0, iter_3_1 in ipairs(pg.medal_template.all) do
			local var_3_1 = pg.medal_template[iter_3_1]
			local var_3_2 = var_3_1.icon
			local var_3_3 = var_3_1.label

			if var_3_2 and var_3_2 ~= "" then
				table.insert(var_3_0, ResPathSupport.CombinePath("medal", var_3_2))
				table.insert(var_3_0, ResPathSupport.CombinePath("medal", "s_" .. var_3_2))

				local var_3_4 = tonumber(var_3_2)

				if var_3_4 < 9000 then
					var_3_4 = var_3_4 - var_3_4 % 10

					table.insert(var_3_0, ResPathSupport.CombinePath("artresource/effect/xunzhang/materials", "xunzhang" .. var_3_4))
				else
					local var_3_5 = var_3_4 - var_3_4 % 10 + 1

					table.insert(var_3_0, ResPathSupport.CombinePath("artresource/effect/xunzhang/materials", "xunzhang" .. var_3_5))
				end
			end

			if var_3_3 and var_3_3 ~= "" then
				table.insert(var_3_0, ResPathSupport.CombinePath("medal", var_3_3))
			end
		end

		return ResPathSupport.UniqueLuaArr(var_3_0)
	end

	local function var_2_2()
		local var_4_0 = {}
		local var_4_1 = {}
		local var_4_2 = {}

		for iter_4_0, iter_4_1 in ipairs(pg.lover_character_template.all) do
			local var_4_3 = pg.lover_character_template[iter_4_1]
			local var_4_4 = var_4_3.exp_up
			local var_4_5 = var_4_3.exp_upper_limit

			if var_4_4 and var_4_4 > 0 and var_4_5 and var_4_5 > 0 then
				local var_4_6 = math.floor(var_4_5 / var_4_4)
				local var_4_7 = math.floor((var_4_6 - 1) / 10) + 1

				for iter_4_2 = 1, var_4_7 do
					table.insert(var_4_0, "lovelettermedal/default_" .. iter_4_2)
				end
			end
		end

		for iter_4_3, iter_4_4 in ipairs(getProxy(LoveLetterProxy):GetDisplayGroupList()) do
			table.insertto(var_4_1, ResPathSupport.GetPaintingShipYardIconListByPaintingName(iter_4_4:getPainting()))
			table.insert(var_4_2, string.format(ResPathSupport.ConstPath.BG.ShipCard, iter_4_4:rarity2bgPrint()))
		end

		return ResPathSupport.MergeLuaArr(var_4_1, var_4_0, var_4_2)
	end

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0, arg_2_1), var_2_0, var_2_1(), var_2_2())
end

function var_0_0.setTrophyGroups(arg_5_0, arg_5_1)
	arg_5_0.trophyGroups = arg_5_1
end

function var_0_0.setTrophyList(arg_6_0, arg_6_1)
	arg_6_0.trophyList = arg_6_1
end

function var_0_0.init(arg_7_0)
	arg_7_0._bg = arg_7_0._tf:Find("bg")
	arg_7_0._blurPanel = arg_7_0._tf:Find("blur_panel")
	arg_7_0._topPanel = arg_7_0._blurPanel:Find("adapt/top")
	arg_7_0._backBtn = arg_7_0._topPanel:Find("back_btn")
	arg_7_0._helpBtn = arg_7_0._topPanel:Find("help_btn")
	arg_7_0._center = arg_7_0._tf:Find("bg/taskBGCenter")
	arg_7_0._trophyUpperTpl = arg_7_0:getTpl("trophy_upper", arg_7_0._center)
	arg_7_0._trophyLowerTpl = arg_7_0:getTpl("trophy_lower", arg_7_0._center)
	arg_7_0._trophyContainer = arg_7_0._tf:Find("bg/taskBGCenter/right_panel/Grid")
	arg_7_0._scrllPanel = arg_7_0._tf:Find("bg/taskBGCenter/right_panel")
	arg_7_0._scrollView = arg_7_0._scrllPanel:GetComponent("LScrollRect")
	arg_7_0._trophyDetailPanel = TrophyDetailPanel.New(arg_7_0._tf:Find("trophyPanel"), arg_7_0._tf)
	arg_7_0._filterBtn = arg_7_0._topPanel:Find("filter/toggle")
	arg_7_0._trophyCounter = arg_7_0._topPanel:Find("filter/counter/Text")
	arg_7_0._reminderRes = arg_7_0._tf:Find("bg/resource")
	arg_7_0._pageToggle = {
		arg_7_0._tf:Find("blur_panel/adapt/left_length/frame/root/common_toggle"),
		arg_7_0._tf:Find("blur_panel/adapt/left_length/frame/root/limited_toggle"),
		arg_7_0.toggleLoveLetter
	}
	arg_7_0._hideExpireBtn = arg_7_0._tf:Find("blur_panel/adapt/top/expireCheckBox")
	arg_7_0._hideExpireCheck = arg_7_0._hideExpireBtn:Find("check")
	arg_7_0._pageIndex = arg_7_0.contextData.index or 1
	arg_7_0._hideExpire = false
	arg_7_0._trophyTFList = {}
	arg_7_0._trophyViewCache = {}
	arg_7_0._trophyMatCache = {}
	arg_7_0.cardItems = {}
	arg_7_0.cardList = arg_7_0.rtScrollContent:GetComponent("LScrollRect")

	function arg_7_0.cardList.onInitItem(arg_8_0)
		arg_7_0:onInitCard(arg_8_0)
	end

	function arg_7_0.cardList.onUpdateItem(arg_9_0, arg_9_1)
		arg_7_0:onUpdateCard(arg_9_0, arg_9_1)
	end

	function arg_7_0.cardList.onReturnItem(arg_10_0, arg_10_1)
		arg_7_0:onReturnCard(arg_10_0, arg_10_1)
	end

	arg_7_0._loader = AutoLoader.New()
end

function var_0_0.checkTrophyVisible(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_1:GetTrophyPage() ~= arg_11_2 then
		return false
	end

	local var_11_0 = false

	if arg_11_3 == "all" then
		var_11_0 = true
	elseif arg_11_3 == "claimed" then
		var_11_0 = arg_11_1:getMaxClaimedTrophy() ~= nil
	end

	if arg_11_2 == var_0_0.PAGE_LIMITED and arg_11_0._hideExpire and arg_11_1:IsExpire() == 1 and not arg_11_1:getProgressTrophy():isClaimed() then
		var_11_0 = false
	end

	return var_11_0
end

function var_0_0.ensureTrophyViewCache(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0._trophyViewCache[arg_12_1]

	if var_12_0 then
		return var_12_0
	end

	local var_12_1 = cloneTplTo(arg_12_0._trophyUpperTpl, arg_12_0._trophyContainer)
	local var_12_2 = cloneTplTo(arg_12_0._trophyLowerTpl, arg_12_0._trophyContainer)
	local var_12_3 = TrophyView.New(var_12_1)
	local var_12_4 = TrophyView.New(var_12_2)

	local function var_12_5()
		local var_13_0 = arg_12_0.trophyGroups[arg_12_1]
		local var_13_1 = var_13_0:getProgressTrophy()
		local var_13_2 = arg_12_0._trophyTFList[arg_12_1]

		if not var_13_2 then
			return
		end

		if var_13_1:canClaimed() and not var_13_1:isClaimed() then
			if not var_13_2:IsPlaying() then
				arg_12_0:emit(TrophyGalleryMediator.ON_TROPHY_CLAIM, var_13_1.id)
			end
		elseif not var_13_2:IsPlaying() then
			arg_12_0:openTrophyDetail(var_13_0, var_13_1)
		end
	end

	onButton(arg_12_0, var_12_1.transform:Find("frame"), var_12_5)
	onButton(arg_12_0, var_12_2.transform:Find("frame"), var_12_5)
	setActive(var_12_1, false)
	setActive(var_12_2, false)

	local var_12_6 = {
		upperGO = var_12_1,
		lowerGO = var_12_2,
		upperView = var_12_3,
		lowerView = var_12_4
	}

	arg_12_0._trophyViewCache[arg_12_1] = var_12_6

	return var_12_6
end

function var_0_0.updateTrophyViewByFilter(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if arg_14_3 == "all" then
		arg_14_1:UpdateTrophyGroup(arg_14_2)
	elseif arg_14_3 == "claimed" then
		arg_14_1:ClaimForm(arg_14_2)
	elseif arg_14_3 == "unclaim" then
		arg_14_1:ProgressingForm(arg_14_2)
	end
end

function var_0_0.updateTrophyReminderMaterial(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1:GetTrophyClaimTipsID()
	local var_15_1 = arg_15_0._trophyMatCache[var_15_0]

	if var_15_1 then
		arg_15_1:SetTrophyReminderMaterial(var_15_1)

		return
	end

	local var_15_2 = "artresource/effect/xunzhang/materials/" .. var_15_0

	if checkABExist(var_15_2) then
		arg_15_0._loader:LoadBundle(var_15_2, function(arg_16_0)
			local var_16_0 = arg_16_0:LoadAssetSync(var_15_0, typeof(Material), false, false)

			arg_15_0._trophyMatCache[var_15_0] = var_16_0

			arg_15_1:SetTrophyReminderMaterial(var_16_0)
		end)
	end
end

function var_0_0.didEnter(arg_17_0)
	arg_17_0:OverlayPanel(arg_17_0._tf)
	onButton(arg_17_0, arg_17_0._backBtn, function()
		arg_17_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_17_0, arg_17_0._filterBtn, function()
		arg_17_0:onFilter()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0._helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.medal_help_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0._hideExpireBtn, function()
		arg_17_0._hideExpire = not arg_17_0._hideExpire

		setActive(arg_17_0._hideExpireCheck, not arg_17_0._hideExpire)
		arg_17_0:updateTrophyList()
	end, SFX_PANEL)
	triggerButton(arg_17_0._hideExpireBtn)

	for iter_17_0, iter_17_1 in ipairs(arg_17_0._pageToggle) do
		onButton(arg_17_0, iter_17_1, function()
			arg_17_0:updatePage(iter_17_0)
		end, SFX_PANEL)
	end

	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_17_0.toggleLoveLetter:Find("tip"), {
		"love_letter_level_up",
		"love_letter_level_reward"
	}, function(arg_23_0)
		local var_23_0 = getProxy(LoveLetterProxy)

		setActive(arg_23_0, var_23_0:IsTipLevelUp() or var_23_0:IsTipAllLevelReward())
	end)
	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_17_0.rtCountLevelPanel:Find("info/icon/tip"), {
		"love_letter_level_up",
		"love_letter_level_reward"
	}, function(arg_24_0)
		setActive(arg_24_0, getProxy(LoveLetterProxy):IsTipAllLevelReward())
	end)

	arg_17_0._filterIndex = 0

	triggerButton(arg_17_0._filterBtn)
	triggerButton(arg_17_0._pageToggle[arg_17_0._pageIndex])
	arg_17_0:updateTrophyCounter()
end

function var_0_0.updatePage(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0._pageToggle) do
		setActive(iter_25_1:Find("selected"), iter_25_0 == arg_25_1)
		setActive(iter_25_1:Find("Image"), iter_25_0 ~= arg_25_1)
	end

	arg_25_0._pageIndex = arg_25_1

	local var_25_0 = arg_25_1 == 3

	setActive(arg_25_0._center, not var_25_0)
	setActive(arg_25_0._topPanel:Find("filter"), not var_25_0)
	setActive(arg_25_0.rtLoveLetterPanel, var_25_0)
	setActive(arg_25_0.rtCountLevelPanel, var_25_0)
	setActive(arg_25_0.rtCountLevelBg, var_25_0)

	if var_25_0 then
		arg_25_0:updateLoveLetterPage()
	else
		arg_25_0:updateTrophyList()
	end

	setActive(arg_25_0._hideExpireBtn, arg_25_1 == var_0_0.PAGE_LIMITED)
end

function var_0_0.updateTrophyList(arg_26_0)
	arg_26_0._trophyTFList = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0._trophyViewCache) do
		setActive(iter_26_1.upperGO, false)
		setActive(iter_26_1.lowerGO, false)
	end

	local var_26_0 = var_0_0.Filter[arg_26_0._filterIndex]
	local var_26_1 = arg_26_0._pageIndex
	local var_26_2 = 1

	for iter_26_2, iter_26_3 in pairs(arg_26_0.trophyGroups) do
		if arg_26_0:checkTrophyVisible(iter_26_3, var_26_1, var_26_0) then
			local var_26_3 = arg_26_0:ensureTrophyViewCache(iter_26_2)
			local var_26_4 = math.fmod(var_26_2, 2) == 1
			local var_26_5 = var_26_4 and var_26_3.upperGO or var_26_3.lowerGO
			local var_26_6 = var_26_4 and var_26_3.lowerGO or var_26_3.upperGO
			local var_26_7 = var_26_4 and var_26_3.upperView or var_26_3.lowerView

			setActive(var_26_5, true)
			setActive(var_26_6, false)
			var_26_5.transform:SetSiblingIndex(var_26_2 - 1)
			arg_26_0:updateTrophyViewByFilter(var_26_7, iter_26_3, var_26_0)
			arg_26_0:updateTrophyReminderMaterial(var_26_7)

			arg_26_0._trophyTFList[iter_26_2] = var_26_7
			var_26_2 = var_26_2 + 1
		end
	end
end

function var_0_0.PlayTrophyClaim(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.trophyGroups[arg_27_1]
	local var_27_1 = arg_27_0._trophyTFList[arg_27_1]
	local var_27_2 = Instantiate(arg_27_0._reminderRes:Find("claim_fx"))

	var_27_1:PlayClaimAnima(var_27_0, var_27_2, function()
		arg_27_0:updateTrophyByGroup(arg_27_1)
		arg_27_0:updateTrophyCounter()
	end)
end

function var_0_0.updateTrophyByGroup(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.trophyGroups[arg_29_1]

	arg_29_0._trophyTFList[arg_29_1]:UpdateTrophyGroup(var_29_0)
end

function var_0_0.openTrophyDetail(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0._trophyDetailPanel:SetTrophyGroup(arg_30_1)
	arg_30_0._trophyDetailPanel:UpdateTrophy(arg_30_2)
	arg_30_0._trophyDetailPanel:SetActive(true)
end

function var_0_0.updateTrophyCounter(arg_31_0)
	local var_31_0 = 0

	for iter_31_0, iter_31_1 in pairs(arg_31_0.trophyList) do
		if iter_31_1:isClaimed() and not iter_31_1:isHide() then
			var_31_0 = var_31_0 + 1
		end
	end

	setText(arg_31_0._trophyCounter, var_31_0)
end

function var_0_0.onFilter(arg_32_0)
	arg_32_0._filterIndex = arg_32_0._filterIndex + 1

	if arg_32_0._filterIndex > #var_0_0.Filter then
		arg_32_0._filterIndex = 1
	end

	for iter_32_0 = 1, #var_0_0.Filter do
		setActive(arg_32_0._filterBtn:GetChild(iter_32_0 - 1), iter_32_0 == arg_32_0._filterIndex)
	end

	arg_32_0:updateTrophyList()
end

function var_0_0.updateLoveLetterPage(arg_33_0)
	if not arg_33_0.contextData.checkRalizeGift then
		arg_33_0.contextData.checkRalizeGift = true

		if getProxy(LoveLetterProxy):IsTipRealizeGift() then
			arg_33_0:emit(TrophyGalleryMediator.OPEN_REALIZE_GIFT_LAYER)
		end
	end

	arg_33_0.cardInfos = getProxy(LoveLetterProxy):GetDisplayGroupList()

	arg_33_0.cardList:SetTotalCount(#arg_33_0.cardInfos, -1)

	local var_33_0 = getProxy(LoveLetterProxy)
	local var_33_1 = arg_33_0.rtCountLevelPanel:Find("info")

	setText(var_33_1:Find("word"), i18n("loveactivity_ui_10"))

	local var_33_2 = var_33_0:GetAllLevel()

	setText(var_33_1:Find("count"), var_33_2)

	local var_33_3, var_33_4 = var_33_0:GetAllLevelProgress()

	if var_33_4 == 0 then
		setSlider(var_33_1:Find("Slider"), 0, 1, 1)
	else
		setSlider(var_33_1:Find("Slider"), 0, var_33_4, var_33_3)
	end

	setText(var_33_1:Find("Slider/Text"), var_33_3 .. "/" .. var_33_4)

	local var_33_5 = var_33_0:GetAllLevelNextAward()

	updateDrop(var_33_1:Find("icon/mask/IconTpl"), var_33_5[1])
	onButton(arg_33_0, var_33_1:Find("icon/mask/IconTpl"), function()
		arg_33_0:emit(BaseUI.ON_DROP, drop[1])
	end, SFX_PANEL)
	setActive(var_33_1:Find("icon/got"), var_33_4 == 0)
	onButton(arg_33_0, var_33_1:Find("click"), function()
		local var_35_0 = getProxy(LoveLetterProxy):GetAllLevelReadyReward()

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_LOVE_LETTER_LEVEL_REWARD, {
			btnList = #var_35_0 > 0 and {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.cancel,
					name = i18n("msgbox_text_cancel"),
					sound = SFX_CANCEL
				},
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.confirm,
					name = i18n("mail_get_oneclick"),
					func = function()
						arg_33_0:emit(TrophyGalleryMediator.ON_GET_ALL_LOVE_LETTER_REWARD, var_35_0)
					end,
					sound = SFX_CONFIRM
				}
			} or nil
		})
	end, SFX_PANEL)
end

function var_0_0.onInitCard(arg_37_0, arg_37_1)
	local var_37_0 = LoveLetterShipCard.New(arg_37_1)

	onButton(arg_37_0, var_37_0.go, function()
		if var_37_0.shipGroup then
			arg_37_0:emit(TrophyGalleryMediator.OPEN_DISPLAY_WINDOW, var_37_0.shipGroup.id)
		end
	end)

	arg_37_0.cardItems[arg_37_1] = var_37_0
end

function var_0_0.onUpdateCard(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0.cardItems[arg_39_2]

	if not var_39_0 then
		arg_39_0:onInitCard(arg_39_2)

		var_39_0 = arg_39_0.cardItems[arg_39_2]
	end

	local var_39_1 = arg_39_1 + 1
	local var_39_2 = arg_39_0.cardInfos[var_39_1]

	var_39_0:update(var_39_2)
	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_39_2.transform:Find("content/pick_up"), {
		"love_letter_level_up"
	}, function(arg_40_0)
		local var_40_0 = getProxy(LoveLetterProxy):GetGroupData(var_39_2.id)

		setActive(arg_40_0, var_40_0:GetDisplayLevel() < var_40_0:GetMaxLevel() and var_40_0:CanLevelUp())
	end)
end

function var_0_0.onReturnCard(arg_41_0, arg_41_1, arg_41_2)
	if arg_41_0.exited then
		return
	end

	local var_41_0 = arg_41_0.cardItems[arg_41_2]

	if var_41_0 then
		var_41_0:clear()
	end

	arg_41_0.cardItems[arg_41_2] = nil
end

function var_0_0.onBackPressed(arg_42_0)
	if arg_42_0._trophyDetailPanel:IsActive() then
		arg_42_0._trophyDetailPanel:SetActive(false)
	else
		var_0_0.super.onBackPressed(arg_42_0)
	end
end

function var_0_0.willExit(arg_43_0)
	arg_43_0._loader:Clear()
	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_43_0.toggleLoveLetter:Find("tip"))
	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_43_0.rtCountLevelPanel:Find("info/icon/tip"))

	for iter_43_0, iter_43_1 in pairs(arg_43_0.cardItems) do
		pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(iter_43_0.transform:Find("content/pick_up"))
	end

	arg_43_0:UnOverlayPanel(arg_43_0._blurPanel, arg_43_0._tf)
	arg_43_0._trophyDetailPanel:Dispose()
end

return var_0_0
