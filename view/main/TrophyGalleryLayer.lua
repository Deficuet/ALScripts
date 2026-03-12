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

function var_0_0.setTrophyGroups(arg_2_0, arg_2_1)
	arg_2_0.trophyGroups = arg_2_1
end

function var_0_0.setTrophyList(arg_3_0, arg_3_1)
	arg_3_0.trophyList = arg_3_1
end

function var_0_0.init(arg_4_0)
	arg_4_0._bg = arg_4_0._tf:Find("bg")
	arg_4_0._blurPanel = arg_4_0._tf:Find("blur_panel")
	arg_4_0._topPanel = arg_4_0._blurPanel:Find("adapt/top")
	arg_4_0._backBtn = arg_4_0._topPanel:Find("back_btn")
	arg_4_0._helpBtn = arg_4_0._topPanel:Find("help_btn")
	arg_4_0._center = arg_4_0._tf:Find("bg/taskBGCenter")
	arg_4_0._trophyUpperTpl = arg_4_0:getTpl("trophy_upper", arg_4_0._center)
	arg_4_0._trophyLowerTpl = arg_4_0:getTpl("trophy_lower", arg_4_0._center)
	arg_4_0._trophyContainer = arg_4_0._tf:Find("bg/taskBGCenter/right_panel/Grid")
	arg_4_0._scrllPanel = arg_4_0._tf:Find("bg/taskBGCenter/right_panel")
	arg_4_0._scrollView = arg_4_0._scrllPanel:GetComponent("LScrollRect")
	arg_4_0._trophyDetailPanel = TrophyDetailPanel.New(arg_4_0._tf:Find("trophyPanel"), arg_4_0._tf)
	arg_4_0._filterBtn = arg_4_0._topPanel:Find("filter/toggle")
	arg_4_0._trophyCounter = arg_4_0._topPanel:Find("filter/counter/Text")
	arg_4_0._reminderRes = arg_4_0._tf:Find("bg/resource")
	arg_4_0._pageToggle = {
		arg_4_0._tf:Find("blur_panel/adapt/left_length/frame/root/common_toggle"),
		arg_4_0._tf:Find("blur_panel/adapt/left_length/frame/root/limited_toggle"),
		arg_4_0.toggleLoveLetter
	}
	arg_4_0._hideExpireBtn = arg_4_0._tf:Find("blur_panel/adapt/top/expireCheckBox")
	arg_4_0._hideExpireCheck = arg_4_0._hideExpireBtn:Find("check")
	arg_4_0._pageIndex = arg_4_0.contextData.index or 1
	arg_4_0._hideExpire = false
	arg_4_0._trophyTFList = {}
	arg_4_0.cardItems = {}
	arg_4_0.cardList = arg_4_0.rtScrollContent:GetComponent("LScrollRect")

	function arg_4_0.cardList.onInitItem(arg_5_0)
		arg_4_0:onInitCard(arg_5_0)
	end

	function arg_4_0.cardList.onUpdateItem(arg_6_0, arg_6_1)
		arg_4_0:onUpdateCard(arg_6_0, arg_6_1)
	end

	function arg_4_0.cardList.onReturnItem(arg_7_0, arg_7_1)
		arg_4_0:onReturnCard(arg_7_0, arg_7_1)
	end
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:OverlayPanel(arg_8_0._tf)
	onButton(arg_8_0, arg_8_0._backBtn, function()
		arg_8_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0._filterBtn, function()
		arg_8_0:onFilter()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0._helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.medal_help_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0._hideExpireBtn, function()
		arg_8_0._hideExpire = not arg_8_0._hideExpire

		setActive(arg_8_0._hideExpireCheck, not arg_8_0._hideExpire)
		arg_8_0:updateTrophyList()
	end, SFX_PANEL)
	triggerButton(arg_8_0._hideExpireBtn)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0._pageToggle) do
		onButton(arg_8_0, iter_8_1, function()
			arg_8_0:updatePage(iter_8_0)
		end, SFX_PANEL)
	end

	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_8_0.toggleLoveLetter:Find("tip"), {
		"love_letter_level_up",
		"love_letter_level_reward"
	}, function(arg_14_0)
		local var_14_0 = getProxy(LoveLetterProxy)

		setActive(arg_14_0, var_14_0:IsTipLevelUp() or var_14_0:IsTipAllLevelReward())
	end)
	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_8_0.rtCountLevelPanel:Find("info/icon/tip"), {
		"love_letter_level_up",
		"love_letter_level_reward"
	}, function(arg_15_0)
		setActive(arg_15_0, getProxy(LoveLetterProxy):IsTipAllLevelReward())
	end)

	arg_8_0._filterIndex = 0

	triggerButton(arg_8_0._filterBtn)
	triggerButton(arg_8_0._pageToggle[arg_8_0._pageIndex])
	arg_8_0:updateTrophyCounter()
end

function var_0_0.updatePage(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0._pageToggle) do
		setActive(iter_16_1:Find("selected"), iter_16_0 == arg_16_1)
		setActive(iter_16_1:Find("Image"), iter_16_0 ~= arg_16_1)
	end

	arg_16_0._pageIndex = arg_16_1

	local var_16_0 = arg_16_1 == 3

	setActive(arg_16_0._center, not var_16_0)
	setActive(arg_16_0._topPanel:Find("filter"), not var_16_0)
	setActive(arg_16_0.rtLoveLetterPanel, var_16_0)
	setActive(arg_16_0.rtCountLevelPanel, var_16_0)
	setActive(arg_16_0.rtCountLevelBg, var_16_0)

	if var_16_0 then
		arg_16_0:updateLoveLetterPage()
	else
		arg_16_0:updateTrophyList()
	end

	setActive(arg_16_0._hideExpireBtn, arg_16_1 == var_0_0.PAGE_LIMITED)
end

function var_0_0.updateTrophyList(arg_17_0)
	arg_17_0._trophyTFList = {}

	removeAllChildren(arg_17_0._trophyContainer)

	local var_17_0 = var_0_0.Filter[arg_17_0._filterIndex]
	local var_17_1 = arg_17_0._pageIndex
	local var_17_2 = 0

	for iter_17_0, iter_17_1 in pairs(arg_17_0.trophyGroups) do
		if iter_17_1:GetTrophyPage() == var_17_1 then
			local var_17_3

			if var_17_0 == "all" then
				var_17_3 = true
			elseif var_17_0 == "claimed" then
				var_17_3 = iter_17_1:getMaxClaimedTrophy() ~= nil
			end

			if var_17_1 == var_0_0.PAGE_LIMITED and arg_17_0._hideExpire and iter_17_1:IsExpire() == 1 and not iter_17_1:getProgressTrophy():isClaimed() then
				var_17_3 = false
			end

			if var_17_3 then
				local var_17_4

				if math.fmod(var_17_2, 2) == 0 then
					var_17_4 = arg_17_0._trophyUpperTpl
				else
					var_17_4 = arg_17_0._trophyLowerTpl
				end

				local var_17_5 = cloneTplTo(var_17_4, arg_17_0._trophyContainer)
				local var_17_6 = TrophyView.New(var_17_5)

				if var_17_0 == "all" then
					var_17_6:UpdateTrophyGroup(iter_17_1)
				elseif var_17_0 == "claimed" then
					var_17_6:ClaimForm(iter_17_1)
				elseif var_17_0 == "unclaim" then
					var_17_6:ProgressingForm(iter_17_1)
				end

				local var_17_7 = var_17_6:GetTrophyClaimTipsID()

				var_17_6:SetTrophyReminder(Instantiate(arg_17_0._reminderRes:Find(var_17_7)))

				arg_17_0._trophyTFList[iter_17_0] = var_17_6
				var_17_2 = var_17_2 + 1

				onButton(arg_17_0, var_17_5.transform:Find("frame"), function()
					local var_18_0 = arg_17_0.trophyGroups[iter_17_0]
					local var_18_1 = var_18_0:getProgressTrophy()

					if var_18_1:canClaimed() and not var_18_1:isClaimed() then
						if not var_17_6:IsPlaying() then
							arg_17_0:emit(TrophyGalleryMediator.ON_TROPHY_CLAIM, var_18_1.id)
						end
					elseif not var_17_6:IsPlaying() then
						arg_17_0:openTrophyDetail(var_18_0, var_18_1)
					end
				end)
			end
		end
	end
end

function var_0_0.PlayTrophyClaim(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.trophyGroups[arg_19_1]
	local var_19_1 = arg_19_0._trophyTFList[arg_19_1]
	local var_19_2 = Instantiate(arg_19_0._reminderRes:Find("claim_fx"))

	var_19_1:PlayClaimAnima(var_19_0, var_19_2, function()
		arg_19_0:updateTrophyByGroup(arg_19_1)
		arg_19_0:updateTrophyCounter()
	end)
end

function var_0_0.updateTrophyByGroup(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.trophyGroups[arg_21_1]

	arg_21_0._trophyTFList[arg_21_1]:UpdateTrophyGroup(var_21_0)
end

function var_0_0.openTrophyDetail(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0._trophyDetailPanel:SetTrophyGroup(arg_22_1)
	arg_22_0._trophyDetailPanel:UpdateTrophy(arg_22_2)
	arg_22_0._trophyDetailPanel:SetActive(true)
end

function var_0_0.updateTrophyCounter(arg_23_0)
	local var_23_0 = 0

	for iter_23_0, iter_23_1 in pairs(arg_23_0.trophyList) do
		if iter_23_1:isClaimed() and not iter_23_1:isHide() then
			var_23_0 = var_23_0 + 1
		end
	end

	setText(arg_23_0._trophyCounter, var_23_0)
end

function var_0_0.onFilter(arg_24_0)
	arg_24_0._filterIndex = arg_24_0._filterIndex + 1

	if arg_24_0._filterIndex > #var_0_0.Filter then
		arg_24_0._filterIndex = 1
	end

	for iter_24_0 = 1, #var_0_0.Filter do
		setActive(arg_24_0._filterBtn:GetChild(iter_24_0 - 1), iter_24_0 == arg_24_0._filterIndex)
	end

	arg_24_0:updateTrophyList()
end

function var_0_0.updateLoveLetterPage(arg_25_0)
	if not arg_25_0.contextData.checkRalizeGift then
		arg_25_0.contextData.checkRalizeGift = true

		if getProxy(LoveLetterProxy):IsTipRealizeGift() then
			arg_25_0:emit(TrophyGalleryMediator.OPEN_REALIZE_GIFT_LAYER)
		end
	end

	arg_25_0.cardInfos = getProxy(LoveLetterProxy):GetDisplayGroupList()

	arg_25_0.cardList:SetTotalCount(#arg_25_0.cardInfos, -1)

	local var_25_0 = getProxy(LoveLetterProxy)
	local var_25_1 = arg_25_0.rtCountLevelPanel:Find("info")

	setText(var_25_1:Find("word"), i18n("loveactivity_ui_10"))

	local var_25_2 = var_25_0:GetAllLevel()

	setText(var_25_1:Find("count"), var_25_2)

	local var_25_3, var_25_4 = var_25_0:GetAllLevelProgress()

	if var_25_4 == 0 then
		setSlider(var_25_1:Find("Slider"), 0, 1, 1)
	else
		setSlider(var_25_1:Find("Slider"), 0, var_25_4, var_25_3)
	end

	setText(var_25_1:Find("Slider/Text"), var_25_3 .. "/" .. var_25_4)

	local var_25_5 = var_25_0:GetAllLevelNextAward()

	updateDrop(var_25_1:Find("icon/mask/IconTpl"), var_25_5[1])
	onButton(arg_25_0, var_25_1:Find("icon/mask/IconTpl"), function()
		arg_25_0:emit(BaseUI.ON_DROP, drop[1])
	end, SFX_PANEL)
	setActive(var_25_1:Find("icon/got"), var_25_4 == 0)
	onButton(arg_25_0, var_25_1:Find("click"), function()
		local var_27_0 = getProxy(LoveLetterProxy):GetAllLevelReadyReward()

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_LOVE_LETTER_LEVEL_REWARD, {
			btnList = #var_27_0 > 0 and {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.cancel,
					name = i18n("msgbox_text_cancel"),
					sound = SFX_CANCEL
				},
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.confirm,
					name = i18n("mail_get_oneclick"),
					func = function()
						arg_25_0:emit(TrophyGalleryMediator.ON_GET_ALL_LOVE_LETTER_REWARD, var_27_0)
					end,
					sound = SFX_CONFIRM
				}
			} or nil
		})
	end, SFX_PANEL)
end

function var_0_0.onInitCard(arg_29_0, arg_29_1)
	local var_29_0 = LoveLetterShipCard.New(arg_29_1)

	onButton(arg_29_0, var_29_0.go, function()
		if var_29_0.shipGroup then
			arg_29_0:emit(TrophyGalleryMediator.OPEN_DISPLAY_WINDOW, var_29_0.shipGroup.id)
		end
	end)

	arg_29_0.cardItems[arg_29_1] = var_29_0
end

function var_0_0.onUpdateCard(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0.cardItems[arg_31_2]

	if not var_31_0 then
		arg_31_0:onInitCard(arg_31_2)

		var_31_0 = arg_31_0.cardItems[arg_31_2]
	end

	local var_31_1 = arg_31_1 + 1
	local var_31_2 = arg_31_0.cardInfos[var_31_1]

	var_31_0:update(var_31_2)
	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_31_2.transform:Find("content/pick_up"), {
		"love_letter_level_up"
	}, function(arg_32_0)
		local var_32_0 = getProxy(LoveLetterProxy):GetGroupData(var_31_2.id)

		setActive(arg_32_0, var_32_0:GetDisplayLevel() < var_32_0:GetMaxLevel() and var_32_0:CanLevelUp())
	end)
end

function var_0_0.onReturnCard(arg_33_0, arg_33_1, arg_33_2)
	if arg_33_0.exited then
		return
	end

	local var_33_0 = arg_33_0.cardItems[arg_33_2]

	if var_33_0 then
		var_33_0:clear()
	end

	arg_33_0.cardItems[arg_33_2] = nil
end

function var_0_0.onBackPressed(arg_34_0)
	if arg_34_0._trophyDetailPanel:IsActive() then
		arg_34_0._trophyDetailPanel:SetActive(false)
	else
		var_0_0.super.onBackPressed(arg_34_0)
	end
end

function var_0_0.willExit(arg_35_0)
	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_35_0.toggleLoveLetter:Find("tip"))
	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_35_0.rtCountLevelPanel:Find("info/icon/tip"))

	for iter_35_0, iter_35_1 in pairs(arg_35_0.cardItems) do
		pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(iter_35_0.transform:Find("content/pick_up"))
	end

	arg_35_0:UnOverlayPanel(arg_35_0._blurPanel, arg_35_0._tf)
	arg_35_0._trophyDetailPanel:Dispose()
end

return var_0_0
