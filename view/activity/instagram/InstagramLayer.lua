local var_0_0 = class("InstagramLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "InstagramUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	pg.m02:sendNotification(GAME.REQ_OLD_INSTAGRAM_DATA, {
		callback = function()
			arg_2_0:SetProxy(getProxy(InstagramProxy))
			arg_2_1()
		end
	})
end

function var_0_0.SetProxy(arg_4_0, arg_4_1)
	arg_4_0.proxy = arg_4_1
	arg_4_0.instagramVOById = arg_4_1:GetData()
	arg_4_0.messages = arg_4_1:GetMessages()
end

function var_0_0.UpdateSelectedInstagram(arg_5_0, arg_5_1)
	if arg_5_0.contextData.instagram and arg_5_0.contextData.instagram.id == arg_5_1 then
		arg_5_0.contextData.instagram = arg_5_0.instagramVOById[arg_5_1]

		arg_5_0:UpdateCommentList()
	end
end

function var_0_0.init(arg_6_0)
	local var_6_0 = GameObject.Find("MainObject")

	arg_6_0.downloadmgr = BulletinBoardMgr.Inst
	arg_6_0.listTF = arg_6_0._tf:Find("list")
	arg_6_0.mainTF = arg_6_0._tf:Find("main")
	arg_6_0.closeBtn = arg_6_0._tf:Find("closeBtn")
	arg_6_0.noMsgTF = arg_6_0._tf:Find("list/bg/no_msg")
	arg_6_0.scrollBarTF = arg_6_0._tf:Find("list/bg/scroll_bar")
	arg_6_0.list = arg_6_0._tf:Find("list/bg/scrollrect"):GetComponent("LScrollRect")
	arg_6_0.imageTF = arg_6_0._tf:Find("main/left_panel/mask/Image"):GetComponent(typeof(RawImage))
	arg_6_0.likeBtn = arg_6_0._tf:Find("main/left_panel/heart")
	arg_6_0.bubbleTF = arg_6_0._tf:Find("main/left_panel/bubble")
	arg_6_0.planeTF = arg_6_0._tf:Find("main/left_panel/plane")
	arg_6_0.likeCntTxt = arg_6_0._tf:Find("main/left_panel/zan"):GetComponent(typeof(Text))
	arg_6_0.pushTimeTxt = arg_6_0._tf:Find("main/left_panel/time"):GetComponent(typeof(Text))
	arg_6_0.iconTF = arg_6_0._tf:Find("main/right_panel/top/head/icon")
	arg_6_0.nameTxt = arg_6_0._tf:Find("main/right_panel/top/name"):GetComponent(typeof(Text))
	arg_6_0.centerTF = arg_6_0._tf:Find("main/right_panel/center")
	arg_6_0.contentTxt = arg_6_0._tf:Find("main/right_panel/center/Text/Text"):GetComponent(typeof(Text))
	arg_6_0.commentList = UIItemList.New(arg_6_0._tf:Find("main/right_panel/center/bottom/scroll/content"), arg_6_0._tf:Find("main/right_panel/center/bottom/scroll/content/tpl"))
	arg_6_0.commentPanel = arg_6_0._tf:Find("main/right_panel/last/bg2")
	arg_6_0.optionalPanel = arg_6_0._tf:Find("main/right_panel/last/bg2/option")
	arg_6_0.scroll = arg_6_0._tf:Find("main/right_panel/center/bottom/scroll")

	setText(arg_6_0._tf:Find("closeBtn/Text"), i18n("word_back"))

	arg_6_0.sprites = {}
	arg_6_0.timers = {}
	arg_6_0.toDownloadList = {}

	arg_6_0:OverlayPanel(arg_6_0._tf)
end

function var_0_0.SetImageByUrl(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if not arg_7_1 or arg_7_1 == "" then
		setActive(arg_7_2.gameObject, false)

		if arg_7_3 then
			arg_7_3()
		end
	else
		setActive(arg_7_2.gameObject, true)

		local var_7_0 = arg_7_0.sprites[arg_7_1]

		if var_7_0 then
			arg_7_2.texture = var_7_0

			if arg_7_3 then
				arg_7_3()
			end
		else
			arg_7_2.enabled = false

			arg_7_0.downloadmgr:GetTexture("ins", "1", arg_7_1, UnityEngine.Events.UnityAction_UnityEngine_Texture(function(arg_8_0)
				if arg_7_0.exited then
					return
				end

				if not arg_7_0.sprites then
					return
				end

				arg_7_0.sprites[arg_7_1] = arg_8_0
				arg_7_2.texture = arg_8_0
				arg_7_2.enabled = true

				if arg_7_3 then
					arg_7_3()
				end
			end))
			table.insert(arg_7_0.toDownloadList, arg_7_1)
		end
	end
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:SetUp()

	arg_9_0.cards = {}

	function arg_9_0.list.onInitItem(arg_10_0)
		local var_10_0 = InstagramCard.New(arg_10_0, arg_9_0)

		onButton(arg_9_0, var_10_0._go, function()
			arg_9_0:EnterDetail(var_10_0.instagram)
		end, SFX_PANEL)

		arg_9_0.cards[arg_10_0] = var_10_0
	end

	function arg_9_0.list.onUpdateItem(arg_12_0, arg_12_1)
		local var_12_0 = arg_9_0.cards[arg_12_1]

		if not var_12_0 then
			var_12_0 = InstagramCard.New(arg_12_1)
			arg_9_0.cards[arg_12_1] = var_12_0
		end

		local var_12_1 = arg_9_0.display[arg_12_0 + 1]
		local var_12_2 = arg_9_0.instagramVOById[var_12_1.id]

		var_12_0:Update(var_12_2)
	end

	arg_9_0:InitList()
end

function var_0_0.SetUp(arg_13_0)
	setActive(arg_13_0.listTF, true)
	setActive(arg_13_0.mainTF, false)
	setActive(arg_13_0.closeBtn, false)
	onButton(arg_13_0, arg_13_0.closeBtn, function()
		if arg_13_0.inDetail then
			arg_13_0:ExitDetail()
		end
	end, SFX_PANEL)
end

function var_0_0.InitList(arg_15_0)
	arg_15_0.display = _.map(arg_15_0.messages, function(arg_16_0)
		return {
			time = arg_16_0:GetLasterUpdateTime(),
			id = arg_16_0.id,
			order = arg_16_0:GetSortIndex()
		}
	end)

	table.sort(arg_15_0.display, function(arg_17_0, arg_17_1)
		if arg_17_0.order == arg_17_1.order then
			return arg_17_0.id > arg_17_1.id
		else
			return arg_17_0.order > arg_17_1.order
		end
	end)

	if isActive(arg_15_0.listTF) then
		arg_15_0.list:SetTotalCount(#arg_15_0.display)
	end

	setActive(arg_15_0.noMsgTF, #arg_15_0.display == 0)
	setActive(arg_15_0.scrollBarTF, not #arg_15_0.display == 0)
end

function var_0_0.UpdateInstagram(arg_18_0, arg_18_1, arg_18_2)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.cards) do
		if iter_18_1.instagram and iter_18_1.instagram.id == arg_18_1 then
			iter_18_1:Update(arg_18_0.instagramVOById[arg_18_1], arg_18_2)
		end
	end
end

function var_0_0.EnterDetail(arg_19_0, arg_19_1)
	arg_19_0.contextData.instagram = arg_19_1

	arg_19_0:InitDetailPage()

	arg_19_0.inDetail = true

	setActive(arg_19_0.listTF, false)
	setActive(arg_19_0.mainTF, true)
	setActive(arg_19_0.closeBtn, true)
	pg.SystemGuideMgr.GetInstance():Play(arg_19_0)
	arg_19_0:RefreshInstagram()
	scrollTo(arg_19_0.scroll, 0, 1)
end

function var_0_0.ExitDetail(arg_20_0)
	local var_20_0 = arg_20_0.contextData.instagram

	if var_20_0 and not var_20_0:IsReaded() then
		arg_20_0:emit(InstagramMediator.ON_READED, var_20_0.id)
	end

	arg_20_0.contextData.instagram = nil
	arg_20_0.inDetail = false

	setActive(arg_20_0.listTF, true)
	setActive(arg_20_0.mainTF, false)
	setActive(arg_20_0.closeBtn, false)
	arg_20_0:CloseCommentPanel()
end

function var_0_0.RefreshInstagram(arg_21_0)
	local var_21_0 = arg_21_0.contextData.instagram
	local var_21_1 = var_21_0:GetFastestRefreshTime()

	if var_21_1 and var_21_1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		arg_21_0:emit(InstagramMediator.ON_REPLY_UPDATE, var_21_0.id)
	end
end

function var_0_0.InitDetailPage(arg_22_0)
	local var_22_0 = arg_22_0.contextData.instagram

	arg_22_0:SetImageByUrl(var_22_0:GetImage(), arg_22_0.imageTF)
	onButton(arg_22_0, arg_22_0.planeTF, function()
		arg_22_0:emit(InstagramMediator.ON_SHARE, var_22_0.id)
	end, SFX_PANEL)

	arg_22_0.pushTimeTxt.text = var_22_0:GetPushTime()

	setImageSprite(arg_22_0.iconTF, LoadSprite("qicon/" .. var_22_0:GetIcon()), false)

	arg_22_0.nameTxt.text = var_22_0:GetName()
	arg_22_0.contentTxt.text = var_22_0:GetContent()

	onToggle(arg_22_0, arg_22_0.commentPanel, function(arg_24_0)
		if arg_24_0 then
			arg_22_0:OpenCommentPanel()
		else
			arg_22_0:CloseCommentPanel()
		end
	end, SFX_PANEL)
	arg_22_0:UpdateLikeBtn()
	arg_22_0:UpdateCommentList()
end

function var_0_0.UpdateLikeBtn(arg_25_0)
	local var_25_0 = arg_25_0.contextData.instagram
	local var_25_1 = var_25_0:IsLiking()

	if not var_25_1 then
		onButton(arg_25_0, arg_25_0.likeBtn, function()
			arg_25_0:emit(InstagramMediator.ON_LIKE, var_25_0.id)
		end, SFX_PANEL)
	else
		removeOnButton(arg_25_0.likeBtn)
	end

	setActive(arg_25_0.likeBtn:Find("heart"), var_25_1)

	arg_25_0.likeBtn:GetComponent(typeof(Image)).enabled = not var_25_1
	arg_25_0.likeCntTxt.text = i18n("ins_word_like", var_25_0:GetLikeCnt())
end

function var_0_0.UpdateCommentList(arg_27_0)
	local var_27_0 = arg_27_0.contextData.instagram

	if not var_27_0 then
		return
	end

	local var_27_1, var_27_2 = var_27_0:GetCanDisplayComments()

	table.sort(var_27_1, function(arg_28_0, arg_28_1)
		return arg_28_0.time < arg_28_1.time
	end)
	arg_27_0.commentList:make(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == UIItemList.EventUpdate then
			local var_29_0 = var_27_1[arg_29_1 + 1]
			local var_29_1 = var_29_0:HasReply()

			setText(arg_29_2:Find("main/reply"), var_29_0:GetReplyBtnTxt())

			local var_29_2 = var_29_0:GetContent()
			local var_29_3 = SwitchSpecialChar(var_29_2)

			setText(arg_29_2:Find("main/content"), HXSet.hxLan(var_29_3))
			setText(arg_29_2:Find("main/bubble/Text"), var_29_0:GetReplyCnt())
			setText(arg_29_2:Find("main/time"), var_29_0:GetTime())

			if var_29_0:GetType() == Instagram.TYPE_PLAYER_COMMENT then
				local var_29_4, var_29_5 = var_29_0:GetIcon()

				setImageSprite(arg_29_2:Find("main/head/icon"), GetSpriteFromAtlas(var_29_4, var_29_5))
			else
				setImageSprite(arg_29_2:Find("main/head/icon"), LoadSprite("qicon/" .. var_29_0:GetIcon()), false)
			end

			if var_29_1 then
				onToggle(arg_27_0, arg_29_2:Find("main/bubble"), function(arg_30_0)
					setActive(arg_29_2:Find("replys"), arg_30_0)
				end, SFX_PANEL)
				arg_27_0:UpdateReplys(arg_29_2, var_29_0)
				triggerToggle(arg_29_2:Find("main/bubble"), true)
			else
				setActive(arg_29_2:Find("replys"), false)
				triggerToggle(arg_29_2:Find("main/bubble"), false)
			end

			arg_29_2:Find("main/bubble"):GetComponent(typeof(Toggle)).enabled = var_29_1
		end
	end)
	setActive(arg_27_0.centerTF, false)
	setActive(arg_27_0.centerTF, true)
	Canvas.ForceUpdateCanvases()
	arg_27_0.commentList:align(#var_27_1)
end

function var_0_0.UpdateReplys(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0, var_31_1 = arg_31_2:GetCanDisplayReply()
	local var_31_2 = UIItemList.New(arg_31_1:Find("replys"), arg_31_1:Find("replys/sub"))

	table.sort(var_31_0, function(arg_32_0, arg_32_1)
		if arg_32_0.level == arg_32_1.level then
			if arg_32_0.time == arg_32_1.time then
				return arg_32_0.id < arg_32_1.id
			else
				return arg_32_0.time < arg_32_1.time
			end
		else
			return arg_32_0.level < arg_32_1.level
		end
	end)
	var_31_2:make(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == UIItemList.EventUpdate then
			local var_33_0 = var_31_0[arg_33_1 + 1]

			setImageSprite(arg_33_2:Find("head/icon"), LoadSprite("qicon/" .. var_33_0:GetIcon()), false)

			local var_33_1 = var_33_0:GetContent()
			local var_33_2 = SwitchSpecialChar(var_33_1)

			setText(arg_33_2:Find("content"), HXSet.hxLan(var_33_2))
		end
	end)
	var_31_2:align(#var_31_0)
end

function var_0_0.OpenCommentPanel(arg_34_0)
	local var_34_0 = arg_34_0.contextData.instagram

	if not var_34_0:CanOpenComment() then
		return
	end

	setActive(arg_34_0.optionalPanel, true)

	local var_34_1 = var_34_0:GetOptionComment()

	arg_34_0.commentPanel:GetComponent(typeof(Image)).enabled = true
	arg_34_0.commentPanel.sizeDelta = Vector2(0, #var_34_1 * 142 + 60)

	local var_34_2 = UIItemList.New(arg_34_0.optionalPanel, arg_34_0.optionalPanel:Find("option1"))

	var_34_2:make(function(arg_35_0, arg_35_1, arg_35_2)
		if arg_35_0 == UIItemList.EventUpdate then
			local var_35_0 = arg_35_1 + 1
			local var_35_1 = var_34_1[var_35_0].text
			local var_35_2 = var_34_1[var_35_0].id
			local var_35_3 = var_34_1[var_35_0].index

			setText(arg_35_2:Find("Text"), HXSet.hxLan(var_35_1))
			onButton(arg_34_0, arg_35_2, function()
				arg_34_0:emit(InstagramMediator.ON_COMMENT, var_34_0.id, var_35_3, var_35_2)
				arg_34_0:CloseCommentPanel()
			end, SFX_PANEL)
		end
	end)
	var_34_2:align(#var_34_1)
end

function var_0_0.CloseCommentPanel(arg_37_0)
	arg_37_0.commentPanel:GetComponent(typeof(Image)).enabled = false
	arg_37_0.commentPanel.sizeDelta = Vector2(0, 0)

	setActive(arg_37_0.optionalPanel, false)
end

function var_0_0.onBackPressed(arg_38_0)
	if arg_38_0.inDetail then
		arg_38_0:ExitDetail()

		return
	end

	arg_38_0:emit(InstagramMediator.CLOSE_ALL)
end

function var_0_0.CloseDetail(arg_39_0)
	if arg_39_0.inDetail then
		arg_39_0:ExitDetail()

		return
	end
end

function var_0_0.willExit(arg_40_0)
	for iter_40_0, iter_40_1 in ipairs(arg_40_0.toDownloadList or {}) do
		arg_40_0.downloadmgr:StopLoader(iter_40_1)
	end

	arg_40_0.toDownloadList = {}

	arg_40_0:UnOverlayPanel(arg_40_0._tf)
	arg_40_0:ExitDetail()

	for iter_40_2, iter_40_3 in pairs(arg_40_0.sprites) do
		if not IsNil(iter_40_3) then
			Object.Destroy(iter_40_3)
		end
	end

	arg_40_0.sprites = nil

	for iter_40_4, iter_40_5 in pairs(arg_40_0.cards) do
		iter_40_5:Dispose()
	end

	arg_40_0.cards = {}
end

return var_0_0
