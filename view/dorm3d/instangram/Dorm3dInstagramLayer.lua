local var_0_0 = class("Dorm3dInstagramLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dInstagramUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/instagramui_atlas"
	}
	local var_2_1 = arg_2_0.contextData or {}

	local function var_2_2(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	local function var_2_3(arg_4_0, arg_4_1)
		if noEmptyStr(arg_4_1) then
			var_2_2(arg_4_0 .. arg_4_1)
		end
	end

	local function var_2_4(arg_5_0)
		for iter_5_0, iter_5_1 in ipairs(arg_5_0 or {}) do
			var_2_3("qicon/", iter_5_1:GetIcon())

			if iter_5_1.GetReplyedList then
				var_2_4(iter_5_1:GetReplyedList())
			end
		end
	end

	local var_2_5 = getProxy(Dorm3dInsProxy):GetInstagramList(var_2_1.apartmentGroupId) or {}

	for iter_2_0, iter_2_1 in ipairs(var_2_5) do
		var_2_3("dorm3dins/", iter_2_1:GetPicture())
		var_2_3("dorm3dins/", iter_2_1:GetBackground())
		var_2_3("qicon/", iter_2_1:GetIcon())
		var_2_4(iter_2_1:GetReplyedList())
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.GetInstagramList(arg_6_0)
	local var_6_0 = arg_6_0.contextData.apartmentGroupId

	assert(var_6_0, "groupId can not be nil")

	return getProxy(Dorm3dInsProxy):GetInstagramList(var_6_0)
end

function var_0_0.init(arg_7_0)
	arg_7_0.listTF = arg_7_0._tf:Find("list")
	arg_7_0.mainTF = arg_7_0._tf:Find("main")
	arg_7_0.closeBtn = arg_7_0._tf:Find("closeBtn")
	arg_7_0.noMsgTF = arg_7_0._tf:Find("list/bg/no_msg")
	arg_7_0.scrollBarTF = arg_7_0._tf:Find("list/bg/scroll_bar")
	arg_7_0.list = arg_7_0._tf:Find("list/bg/scrollrect"):GetComponent("LScrollRect")
	arg_7_0.mainBg = arg_7_0._tf:Find("main/left_panel/bg")
	arg_7_0.imageTF = arg_7_0._tf:Find("main/left_panel/mask/Image"):GetComponent(typeof(Image))
	arg_7_0.likeBtn = arg_7_0._tf:Find("main/left_panel/heart")
	arg_7_0.bubbleTF = arg_7_0._tf:Find("main/left_panel/bubble")
	arg_7_0.planeTF = arg_7_0._tf:Find("main/left_panel/plane")
	arg_7_0.likeCntTxt = arg_7_0._tf:Find("main/left_panel/zan"):GetComponent(typeof(Text))
	arg_7_0.pushTimeTxt = arg_7_0._tf:Find("main/left_panel/time"):GetComponent(typeof(Text))
	arg_7_0.iconTF = arg_7_0._tf:Find("main/right_panel/top/head/icon")
	arg_7_0.nameTxt = arg_7_0._tf:Find("main/right_panel/top/name"):GetComponent(typeof(Text))
	arg_7_0.centerTF = arg_7_0._tf:Find("main/right_panel/center")
	arg_7_0.contentTxt = arg_7_0._tf:Find("main/right_panel/center/Text/Text"):GetComponent(typeof(Text))
	arg_7_0.commentList = UIItemList.New(arg_7_0._tf:Find("main/right_panel/center/bottom/scroll/content"), arg_7_0._tf:Find("main/right_panel/center/bottom/scroll/content/tpl"))
	arg_7_0.commentPanel = arg_7_0._tf:Find("main/right_panel/last/bg2")
	arg_7_0.optionalPanel = arg_7_0._tf:Find("main/right_panel/last/bg2/option")
	arg_7_0.scroll = arg_7_0._tf:Find("main/right_panel/center/bottom/scroll")

	setText(arg_7_0._tf:Find("main_bg/Text"), i18n("dorm3d_privatechat_topics"))
	setText(arg_7_0.noMsgTF:Find("Text"), i18n("dorm3d_ins_no_msg"))
	arg_7_0:OverlayPanel(arg_7_0._tf)
end

function var_0_0.didEnter(arg_8_0)
	setActive(arg_8_0.listTF, true)
	setActive(arg_8_0.mainTF, false)
	onButton(arg_8_0, arg_8_0.closeBtn, function()
		if arg_8_0.inDetail then
			arg_8_0:ExitDetail()

			return
		end

		arg_8_0:emit(var_0_0.ON_CLOSE)
	end, SFX_PANEL)

	arg_8_0.cards = {}

	function arg_8_0.list.onInitItem(arg_10_0)
		arg_8_0:OnInitItem(arg_10_0)
	end

	function arg_8_0.list.onUpdateItem(arg_11_0, arg_11_1)
		arg_8_0:OnUpdateItem(arg_11_0, arg_11_1)
	end

	arg_8_0:InitCards()
end

function var_0_0.OnInitItem(arg_12_0, arg_12_1)
	local var_12_0 = Dorm3dInstagramCard.New(arg_12_1)

	onButton(arg_12_0, var_12_0._go, function()
		if var_12_0.instagram:IsLock() then
			return
		end

		arg_12_0:EnterDetail(var_12_0.instagram)
	end, SFX_PANEL)

	arg_12_0.cards[arg_12_1] = var_12_0
end

function var_0_0.OnUpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.cards[arg_14_2]

	if not var_14_0 then
		var_14_0 = Dorm3dInstagramCard.New(arg_14_2)
		arg_14_0.cards[arg_14_2] = var_14_0
	end

	local var_14_1 = arg_14_0.display[arg_14_1 + 1]

	var_14_0:Update(var_14_1)
end

function var_0_0.InitCards(arg_15_0)
	local var_15_0 = arg_15_0:GetInstagramList()

	arg_15_0.display = {}

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		if not iter_15_1:IsLock() and iter_15_1:CanShow() then
			table.insert(arg_15_0.display, iter_15_1)
		end
	end

	table.sort(arg_15_0.display, function(arg_16_0, arg_16_1)
		local var_16_0 = arg_16_0:LockState()
		local var_16_1 = arg_16_1:LockState()

		if var_16_0 == var_16_1 then
			return var_16_1 < var_16_0
		else
			return arg_16_0.id > arg_16_1.id
		end
	end)

	if isActive(arg_15_0.listTF) then
		arg_15_0.list:SetTotalCount(#arg_15_0.display)
	end

	setActive(arg_15_0.noMsgTF, #arg_15_0.display == 0)
	setActive(arg_15_0.scrollBarTF, not #arg_15_0.display == 0)
end

function var_0_0.EnterDetail(arg_17_0, arg_17_1)
	arg_17_0.contextData.instagram = arg_17_1

	arg_17_0:InitDetailPage()

	arg_17_0.inDetail = true

	setActive(arg_17_0.listTF, false)
	setActive(arg_17_0.mainTF, true)
	scrollTo(arg_17_0.scroll, 0, 1)
end

function var_0_0.ExitDetail(arg_18_0)
	arg_18_0:emit(Dorm3dInstagramMediator.ON_EXIT, arg_18_0.contextData.instagram.id)

	arg_18_0.contextData.instagram = nil
	arg_18_0.inDetail = false

	setActive(arg_18_0.listTF, true)
	setActive(arg_18_0.mainTF, false)
	arg_18_0:ClosePlayerCommentPanel()
end

function var_0_0.MarkRead(arg_19_0, arg_19_1)
	if arg_19_1 and not arg_19_1:IsRead() then
		arg_19_0:emit(Dorm3dInstagramMediator.ON_READ, arg_19_1.id)
	end
end

function var_0_0.InitDetailPage(arg_20_0)
	local var_20_0 = arg_20_0.contextData.instagram

	arg_20_0:MarkRead(var_20_0)

	arg_20_0.pushTimeTxt.text = var_20_0:GetPushTime()

	LoadSpriteAsync("Dorm3dIns/" .. var_20_0:GetPicture(), function(arg_21_0)
		setImageSprite(arg_20_0.imageTF, arg_21_0, false)
	end)

	local var_20_1 = var_20_0:GetBackground()

	if var_20_1 and var_20_1 ~= "" then
		LoadSpriteAsync("Dorm3dIns/" .. var_20_1, function(arg_22_0)
			setImageSprite(arg_20_0.mainBg, arg_22_0, false)
		end)
	end

	setImageSprite(arg_20_0.iconTF, LoadSprite("qicon/" .. var_20_0:GetIcon()), false)

	arg_20_0.nameTxt.text = var_20_0:GetName()
	arg_20_0.contentTxt.text = var_20_0:GetText()

	onToggle(arg_20_0, arg_20_0.commentPanel, function(arg_23_0)
		if arg_23_0 then
			arg_20_0:OpenPlayerCommentPanel()
		else
			arg_20_0:ClosePlayerCommentPanel()
		end
	end, SFX_PANEL)
	arg_20_0:UpdateLikeBtn()
	arg_20_0:UpdateShareBtn()
	arg_20_0:UpdateCommentList()
end

function var_0_0.UpdateShareBtn(arg_24_0)
	local var_24_0 = arg_24_0.contextData.instagram

	onButton(arg_24_0, arg_24_0.planeTF, function()
		arg_24_0:emit(Dorm3dInstagramMediator.ON_SHARE, var_24_0.id)
	end, SFX_PANEL)
end

function var_0_0.UpdateLikeBtn(arg_26_0)
	local var_26_0 = arg_26_0.contextData.instagram

	if not var_26_0 then
		return
	end

	local var_26_1 = var_26_0:IsGood()

	if not var_26_1 then
		onButton(arg_26_0, arg_26_0.likeBtn, function()
			arg_26_0:emit(Dorm3dInstagramMediator.ON_LIKE, var_26_0.id)
		end, SFX_PANEL)
	else
		removeOnButton(arg_26_0.likeBtn)
	end

	setActive(arg_26_0.likeBtn:Find("heart"), var_26_1)

	arg_26_0.likeBtn:GetComponent(typeof(Image)).enabled = not var_26_1
end

function var_0_0.OnLikeInstagram(arg_28_0)
	local var_28_0 = arg_28_0.contextData.instagram

	if not var_28_0 then
		return
	end

	arg_28_0:UpdateLikeBtn()

	for iter_28_0, iter_28_1 in pairs(arg_28_0.cards) do
		if iter_28_1.instagram.id == var_28_0.id then
			iter_28_1:Update(var_28_0)

			break
		end
	end
end

local function var_0_1(arg_29_0, arg_29_1, arg_29_2)
	setText(arg_29_1:Find("main/reply"), "reply")

	local var_29_0 = SwitchSpecialChar(arg_29_2:GetText())

	setText(arg_29_1:Find("main/content"), HXSet.hxLan(var_29_0))
	setText(arg_29_1:Find("main/time"), arg_29_2:GetPushTime())

	if isa(arg_29_2, InstagramPlayerComment3Dorm) then
		setImageSprite(arg_29_1:Find("main/head/icon"), GetSpriteFromAtlas("ui/InstagramUI_atlas", "txdi_3"))
	else
		setImageSprite(arg_29_1:Find("main/head/icon"), LoadSprite("qicon/" .. arg_29_2:GetIcon()), false)
	end
end

local function var_0_2(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_2:GetReplyedList()
	local var_30_1 = _.select(var_30_0, function(arg_31_0)
		return arg_31_0:CanShow()
	end)
	local var_30_2 = UIItemList.New(arg_30_1:Find("replys"), arg_30_1:Find("replys/sub"))

	table.sort(var_30_1, function(arg_32_0, arg_32_1)
		if arg_32_0.time == arg_32_1.time then
			return arg_32_0.id < arg_32_1.id
		else
			return arg_32_0.time < arg_32_1.time
		end
	end)
	var_30_2:make(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == UIItemList.EventUpdate then
			local var_33_0 = var_30_1[arg_33_1 + 1]

			setImageSprite(arg_33_2:Find("head/icon"), LoadSprite("qicon/" .. var_33_0:GetIcon()), false)

			local var_33_1 = SwitchSpecialChar(var_33_0:GetText())

			setText(arg_33_2:Find("content"), HXSet.hxLan(var_33_1))
		end
	end)
	var_30_2:align(#var_30_1)
end

local function var_0_3(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_2:ExistAnyReplay()

	if var_34_0 then
		onToggle(arg_34_0, arg_34_1:Find("main/bubble"), function(arg_35_0)
			setActive(arg_34_1:Find("replys"), arg_35_0)
		end, SFX_PANEL)
		var_0_2(arg_34_0, arg_34_1, arg_34_2)
	else
		setActive(arg_34_1:Find("replys"), false)
	end

	triggerToggle(arg_34_1:Find("main/bubble"), var_34_0)

	arg_34_1:Find("main/bubble"):GetComponent(typeof(Toggle)).enabled = var_34_0
end

function var_0_0.UpdateCommentList(arg_36_0)
	local var_36_0 = arg_36_0.contextData.instagram

	if not var_36_0 then
		return
	end

	local var_36_1 = var_36_0:GetReplyedList()
	local var_36_2 = _.select(var_36_1, function(arg_37_0)
		return arg_37_0:CanShow()
	end)

	table.sort(var_36_2, function(arg_38_0, arg_38_1)
		return arg_38_0.time < arg_38_1.time
	end)
	arg_36_0.commentList:make(function(arg_39_0, arg_39_1, arg_39_2)
		if arg_39_0 == UIItemList.EventUpdate then
			local var_39_0 = var_36_2[arg_39_1 + 1]

			var_0_1(arg_36_0, arg_39_2, var_39_0)
			var_0_3(arg_36_0, arg_39_2, var_39_0)
		end
	end)
	setActive(arg_36_0.centerTF, false)
	setActive(arg_36_0.centerTF, true)
	Canvas.ForceUpdateCanvases()
	arg_36_0.commentList:align(#var_36_2)
end

function var_0_0.OpenPlayerCommentPanel(arg_40_0)
	local var_40_0 = arg_40_0.contextData.instagram

	if not var_40_0:ExistAnyReplyable() then
		return
	end

	setActive(arg_40_0.optionalPanel, true)

	local var_40_1 = var_40_0:GetReplyableList()

	arg_40_0.commentPanel:GetComponent(typeof(Image)).enabled = true
	arg_40_0.commentPanel.sizeDelta = Vector2(0, #var_40_1 * 142 + 60)

	local var_40_2 = UIItemList.New(arg_40_0.optionalPanel, arg_40_0.optionalPanel:Find("option1"))

	var_40_2:make(function(arg_41_0, arg_41_1, arg_41_2)
		if arg_41_0 == UIItemList.EventUpdate then
			local var_41_0 = var_40_1[arg_41_1 + 1]
			local var_41_1 = var_41_0:GetText()
			local var_41_2 = var_41_0.id
			local var_41_3 = var_41_0.index

			setText(arg_41_2:Find("Text"), HXSet.hxLan(var_41_1))
			onButton(arg_40_0, arg_41_2, function()
				arg_40_0:emit(Dorm3dInstagramMediator.ON_DISCUSS, var_40_0.id, var_41_2, var_41_3)
				arg_40_0:ClosePlayerCommentPanel()
			end, SFX_PANEL)
		end
	end)
	var_40_2:align(#var_40_1)
end

function var_0_0.ClosePlayerCommentPanel(arg_43_0)
	arg_43_0.commentPanel:GetComponent(typeof(Image)).enabled = false
	arg_43_0.commentPanel.sizeDelta = Vector2(0, 0)

	setActive(arg_43_0.optionalPanel, false)
end

function var_0_0.onBackPressed(arg_44_0)
	if arg_44_0.inDetail then
		arg_44_0:ExitDetail()

		return
	end

	var_0_0.super.onBackPressed(arg_44_0)
end

function var_0_0.willExit(arg_45_0)
	if arg_45_0.inDetail then
		arg_45_0:ExitDetail()
	end

	for iter_45_0, iter_45_1 in pairs(arg_45_0.cards) do
		iter_45_1:Dispose()
	end

	arg_45_0.cards = {}
end

return var_0_0
