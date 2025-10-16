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
		arg_4_0._tf:Find("blur_panel/adapt/left_length/frame/root/limited_toggle")
	}
	arg_4_0._hideExpireBtn = arg_4_0._tf:Find("blur_panel/adapt/top/expireCheckBox")
	arg_4_0._hideExpireCheck = arg_4_0._hideExpireBtn:Find("check")
	arg_4_0._pageIndex = 1
	arg_4_0._hideExpire = false
	arg_4_0._trophyTFList = {}
end

function var_0_0.didEnter(arg_5_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_5_0._tf)
	onButton(arg_5_0, arg_5_0._backBtn, function()
		arg_5_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._filterBtn, function()
		arg_5_0:onFilter()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.medal_help_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._hideExpireBtn, function()
		arg_5_0._hideExpire = not arg_5_0._hideExpire

		setActive(arg_5_0._hideExpireCheck, not arg_5_0._hideExpire)
		arg_5_0:updateTrophyList()
	end, SFX_PANEL)
	triggerButton(arg_5_0._hideExpireBtn)

	for iter_5_0 = 1, 2 do
		local var_5_0 = arg_5_0._pageToggle[iter_5_0]

		onButton(arg_5_0, var_5_0, function()
			arg_5_0:updatePage(iter_5_0)
		end, SFX_PANEL)
	end

	arg_5_0._filterIndex = 0

	triggerButton(arg_5_0._filterBtn)
	triggerButton(arg_5_0._pageToggle[arg_5_0._pageIndex])
	arg_5_0:updateTrophyCounter()
end

function var_0_0.updatePage(arg_11_0, arg_11_1)
	for iter_11_0 = 1, #arg_11_0._pageToggle do
		local var_11_0 = arg_11_0._pageToggle[iter_11_0]

		setActive(var_11_0:Find("selected"), iter_11_0 == arg_11_1)
		setActive(var_11_0:Find("Image"), iter_11_0 ~= arg_11_1)
	end

	arg_11_0._pageIndex = arg_11_1

	arg_11_0:updateTrophyList()
	setActive(arg_11_0._hideExpireBtn, arg_11_1 == var_0_0.PAGE_LIMITED)
end

function var_0_0.updateTrophyList(arg_12_0)
	arg_12_0._trophyTFList = {}

	removeAllChildren(arg_12_0._trophyContainer)

	local var_12_0 = var_0_0.Filter[arg_12_0._filterIndex]
	local var_12_1 = arg_12_0._pageIndex
	local var_12_2 = 0

	for iter_12_0, iter_12_1 in pairs(arg_12_0.trophyGroups) do
		if iter_12_1:GetTrophyPage() == var_12_1 then
			local var_12_3

			if var_12_0 == "all" then
				var_12_3 = true
			elseif var_12_0 == "claimed" then
				var_12_3 = iter_12_1:getMaxClaimedTrophy() ~= nil
			end

			if var_12_1 == var_0_0.PAGE_LIMITED and arg_12_0._hideExpire and iter_12_1:IsExpire() == 1 and not iter_12_1:getProgressTrophy():isClaimed() then
				var_12_3 = false
			end

			if var_12_3 then
				local var_12_4

				if math.fmod(var_12_2, 2) == 0 then
					var_12_4 = arg_12_0._trophyUpperTpl
				else
					var_12_4 = arg_12_0._trophyLowerTpl
				end

				local var_12_5 = cloneTplTo(var_12_4, arg_12_0._trophyContainer)
				local var_12_6 = TrophyView.New(var_12_5)

				if var_12_0 == "all" then
					var_12_6:UpdateTrophyGroup(iter_12_1)
				elseif var_12_0 == "claimed" then
					var_12_6:ClaimForm(iter_12_1)
				elseif var_12_0 == "unclaim" then
					var_12_6:ProgressingForm(iter_12_1)
				end

				local var_12_7 = var_12_6:GetTrophyClaimTipsID()

				var_12_6:SetTrophyReminder(Instantiate(arg_12_0._reminderRes:Find(var_12_7)))

				arg_12_0._trophyTFList[iter_12_0] = var_12_6
				var_12_2 = var_12_2 + 1

				onButton(arg_12_0, var_12_5.transform:Find("frame"), function()
					local var_13_0 = arg_12_0.trophyGroups[iter_12_0]
					local var_13_1 = var_13_0:getProgressTrophy()

					if var_13_1:canClaimed() and not var_13_1:isClaimed() then
						if not var_12_6:IsPlaying() then
							arg_12_0:emit(TrophyGalleryMediator.ON_TROPHY_CLAIM, var_13_1.id)
						end
					elseif not var_12_6:IsPlaying() then
						arg_12_0:openTrophyDetail(var_13_0, var_13_1)
					end
				end)
			end
		end
	end
end

function var_0_0.PlayTrophyClaim(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.trophyGroups[arg_14_1]
	local var_14_1 = arg_14_0._trophyTFList[arg_14_1]
	local var_14_2 = Instantiate(arg_14_0._reminderRes:Find("claim_fx"))

	var_14_1:PlayClaimAnima(var_14_0, var_14_2, function()
		arg_14_0:updateTrophyByGroup(arg_14_1)
		arg_14_0:updateTrophyCounter()
	end)
end

function var_0_0.updateTrophyByGroup(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.trophyGroups[arg_16_1]

	arg_16_0._trophyTFList[arg_16_1]:UpdateTrophyGroup(var_16_0)
end

function var_0_0.openTrophyDetail(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0._trophyDetailPanel:SetTrophyGroup(arg_17_1)
	arg_17_0._trophyDetailPanel:UpdateTrophy(arg_17_2)
	arg_17_0._trophyDetailPanel:SetActive(true)
end

function var_0_0.updateTrophyCounter(arg_18_0)
	local var_18_0 = 0

	for iter_18_0, iter_18_1 in pairs(arg_18_0.trophyList) do
		if iter_18_1:isClaimed() and not iter_18_1:isHide() then
			var_18_0 = var_18_0 + 1
		end
	end

	setText(arg_18_0._trophyCounter, var_18_0)
end

function var_0_0.onFilter(arg_19_0)
	arg_19_0._filterIndex = arg_19_0._filterIndex + 1

	if arg_19_0._filterIndex > #var_0_0.Filter then
		arg_19_0._filterIndex = 1
	end

	for iter_19_0 = 1, #var_0_0.Filter do
		setActive(arg_19_0._filterBtn:GetChild(iter_19_0 - 1), iter_19_0 == arg_19_0._filterIndex)
	end

	arg_19_0:updateTrophyList()
end

function var_0_0.onBackPressed(arg_20_0)
	if arg_20_0._trophyDetailPanel:IsActive() then
		arg_20_0._trophyDetailPanel:SetActive(false)
	else
		var_0_0.super.onBackPressed(arg_20_0)
	end
end

function var_0_0.willExit(arg_21_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0._blurPanel, arg_21_0._tf)
	arg_21_0._trophyDetailPanel:Dispose()
end

return var_0_0
