local var_0_0 = class("InstagramLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "InstagramUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "InstagramMainUI"
end

function var_0_0.preload(arg_3_0, arg_3_1)
	pg.m02:sendNotification(GAME.REQ_OLD_INSTAGRAM_DATA, {
		callback = function()
			arg_3_0:SetProxy(getProxy(InstagramProxy))
			arg_3_1()
		end
	})
end

function var_0_0.SetProxy(arg_5_0, arg_5_1)
	arg_5_0.proxy = arg_5_1
	arg_5_0.instagramVOById = arg_5_1:GetData()
	arg_5_0.messages = arg_5_1:GetMessages()
end

function var_0_0.UpdateSelectedInstagram(arg_6_0, arg_6_1)
	if arg_6_0.contextData.instagram and arg_6_0.contextData.instagram.id == arg_6_1 then
		arg_6_0.contextData.instagram = arg_6_0.instagramVOById[arg_6_1]

		arg_6_0:UpdateCommentList()
	end
end

function var_0_0.init(arg_7_0)
	local var_7_0 = GameObject.Find("MainObject")

	arg_7_0.downloadmgr = BulletinBoardMgr.Inst
	arg_7_0.listTF = arg_7_0:findTF("list")
	arg_7_0.mainTF = arg_7_0:findTF("main")
	arg_7_0.closeBtn = arg_7_0:findTF("closeBtn")
	arg_7_0.noMsgTF = arg_7_0:findTF("list/bg/no_msg")
	arg_7_0.scrollBarTF = arg_7_0:findTF("list/bg/scroll_bar")
	arg_7_0.list = arg_7_0:findTF("list/bg/scrollrect"):GetComponent("LScrollRect")
	arg_7_0.imageTF = arg_7_0:findTF("main/left_panel/mask/Image"):GetComponent(typeof(RawImage))
	arg_7_0.likeBtn = arg_7_0:findTF("main/left_panel/heart")
	arg_7_0.bubbleTF = arg_7_0:findTF("main/left_panel/bubble")
	arg_7_0.planeTF = arg_7_0:findTF("main/left_panel/plane")
	arg_7_0.likeCntTxt = arg_7_0:findTF("main/left_panel/zan"):GetComponent(typeof(Text))
	arg_7_0.pushTimeTxt = arg_7_0:findTF("main/left_panel/time"):GetComponent(typeof(Text))
	arg_7_0.iconTF = arg_7_0:findTF("main/right_panel/top/head/icon")
	arg_7_0.nameTxt = arg_7_0:findTF("main/right_panel/top/name"):GetComponent(typeof(Text))
	arg_7_0.centerTF = arg_7_0:findTF("main/right_panel/center")
	arg_7_0.contentTxt = arg_7_0:findTF("main/right_panel/center/Text/Text"):GetComponent(typeof(Text))
	arg_7_0.commentList = UIItemList.New(arg_7_0:findTF("main/right_panel/center/bottom/scroll/content"), arg_7_0:findTF("main/right_panel/center/bottom/scroll/content/tpl"))
	arg_7_0.commentPanel = arg_7_0:findTF("main/right_panel/last/bg2")
	arg_7_0.optionalPanel = arg_7_0:findTF("main/right_panel/last/bg2/option")
	arg_7_0.scroll = arg_7_0:findTF("main/right_panel/center/bottom/scroll")

	setText(arg_7_0:findTF("closeBtn/Text"), i18n("word_back"))

	arg_7_0.sprites = {}
	arg_7_0.timers = {}
	arg_7_0.toDownloadList = {}

	arg_7_0:OverlayPanel(arg_7_0._tf)
end

function var_0_0.SetImageByUrl(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if not arg_8_1 or arg_8_1 == "" then
		setActive(arg_8_2.gameObject, false)

		if arg_8_3 then
			arg_8_3()
		end
	else
		setActive(arg_8_2.gameObject, true)

		local var_8_0 = arg_8_0.sprites[arg_8_1]

		if var_8_0 then
			arg_8_2.texture = var_8_0

			if arg_8_3 then
				arg_8_3()
			end
		else
			arg_8_2.enabled = false

			arg_8_0.downloadmgr:GetTexture("ins", "1", arg_8_1, UnityEngine.Events.UnityAction_UnityEngine_Texture(function(arg_9_0)
				if arg_8_0.exited then
					return
				end

				if not arg_8_0.sprites then
					return
				end

				arg_8_0.sprites[arg_8_1] = arg_9_0
				arg_8_2.texture = arg_9_0
				arg_8_2.enabled = true

				if arg_8_3 then
					arg_8_3()
				end
			end))
			table.insert(arg_8_0.toDownloadList, arg_8_1)
		end
	end
end

function var_0_0.didEnter(arg_10_0)
	arg_10_0:SetUp()

	arg_10_0.cards = {}

	function arg_10_0.list.onInitItem(arg_11_0)
		local var_11_0 = InstagramCard.New(arg_11_0, arg_10_0)

		onButton(arg_10_0, var_11_0._go, function()
			arg_10_0:EnterDetail(var_11_0.instagram)
		end, SFX_PANEL)

		arg_10_0.cards[arg_11_0] = var_11_0
	end

	function arg_10_0.list.onUpdateItem(arg_13_0, arg_13_1)
		local var_13_0 = arg_10_0.cards[arg_13_1]

		if not var_13_0 then
			var_13_0 = InstagramCard.New(arg_13_1)
			arg_10_0.cards[arg_13_1] = var_13_0
		end

		local var_13_1 = arg_10_0.display[arg_13_0 + 1]
		local var_13_2 = arg_10_0.instagramVOById[var_13_1.id]

		var_13_0:Update(var_13_2)
	end

	arg_10_0:InitList()
end

function var_0_0.SetUp(arg_14_0)
	setActive(arg_14_0.listTF, true)
	setActive(arg_14_0.mainTF, false)
	setActive(arg_14_0.closeBtn, false)
	onButton(arg_14_0, arg_14_0.closeBtn, function()
		if arg_14_0.inDetail then
			arg_14_0:ExitDetail()
		end
	end, SFX_PANEL)
end

function var_0_0.InitList(arg_16_0)
	arg_16_0.display = _.map(arg_16_0.messages, function(arg_17_0)
		return {
			time = arg_17_0:GetLasterUpdateTime(),
			id = arg_17_0.id,
			order = arg_17_0:GetSortIndex()
		}
	end)

	table.sort(arg_16_0.display, function(arg_18_0, arg_18_1)
		if arg_18_0.order == arg_18_1.order then
			return arg_18_0.id > arg_18_1.id
		else
			return arg_18_0.order > arg_18_1.order
		end
	end)

	if isActive(arg_16_0.listTF) then
		arg_16_0.list:SetTotalCount(#arg_16_0.display)
	end

	setActive(arg_16_0.noMsgTF, #arg_16_0.display == 0)
	setActive(arg_16_0.scrollBarTF, not #arg_16_0.display == 0)
end

function var_0_0.UpdateInstagram(arg_19_0, arg_19_1, arg_19_2)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.cards) do
		if iter_19_1.instagram and iter_19_1.instagram.id == arg_19_1 then
			iter_19_1:Update(arg_19_0.instagramVOById[arg_19_1], arg_19_2)
		end
	end
end

function var_0_0.EnterDetail(arg_20_0, arg_20_1)
	arg_20_0.contextData.instagram = arg_20_1

	arg_20_0:InitDetailPage()

	arg_20_0.inDetail = true

	setActive(arg_20_0.listTF, false)
	setActive(arg_20_0.mainTF, true)
	setActive(arg_20_0.closeBtn, true)
	pg.SystemGuideMgr.GetInstance():Play(arg_20_0)
	arg_20_0:RefreshInstagram()
	scrollTo(arg_20_0.scroll, 0, 1)
end

function var_0_0.ExitDetail(arg_21_0)
	local var_21_0 = arg_21_0.contextData.instagram

	if var_21_0 and not var_21_0:IsReaded() then
		arg_21_0:emit(InstagramMediator.ON_READED, var_21_0.id)
	end

	arg_21_0.contextData.instagram = nil
	arg_21_0.inDetail = false

	setActive(arg_21_0.listTF, true)
	setActive(arg_21_0.mainTF, false)
	setActive(arg_21_0.closeBtn, false)
	arg_21_0:CloseCommentPanel()
end

function var_0_0.RefreshInstagram(arg_22_0)
	local var_22_0 = arg_22_0.contextData.instagram
	local var_22_1 = var_22_0:GetFastestRefreshTime()

	if var_22_1 and var_22_1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		arg_22_0:emit(InstagramMediator.ON_REPLY_UPDATE, var_22_0.id)
	end
end

function var_0_0.InitDetailPage(arg_23_0)
	local var_23_0 = arg_23_0.contextData.instagram

	arg_23_0:SetImageByUrl(var_23_0:GetImage(), arg_23_0.imageTF)
	onButton(arg_23_0, arg_23_0.planeTF, function()
		arg_23_0:emit(InstagramMediator.ON_SHARE, var_23_0.id)
	end, SFX_PANEL)

	arg_23_0.pushTimeTxt.text = var_23_0:GetPushTime()

	setImageSprite(arg_23_0.iconTF, LoadSprite("qicon/" .. var_23_0:GetIcon()), false)

	arg_23_0.nameTxt.text = var_23_0:GetName()
	arg_23_0.contentTxt.text = var_23_0:GetContent()

	onToggle(arg_23_0, arg_23_0.commentPanel, function(arg_25_0)
		if arg_25_0 then
			arg_23_0:OpenCommentPanel()
		else
			arg_23_0:CloseCommentPanel()
		end
	end, SFX_PANEL)
	arg_23_0:UpdateLikeBtn()
	arg_23_0:UpdateCommentList()
end

function var_0_0.UpdateLikeBtn(arg_26_0)
	local var_26_0 = arg_26_0.contextData.instagram
	local var_26_1 = var_26_0:IsLiking()

	if not var_26_1 then
		onButton(arg_26_0, arg_26_0.likeBtn, function()
			arg_26_0:emit(InstagramMediator.ON_LIKE, var_26_0.id)
		end, SFX_PANEL)
	else
		removeOnButton(arg_26_0.likeBtn)
	end

	setActive(arg_26_0.likeBtn:Find("heart"), var_26_1)

	arg_26_0.likeBtn:GetComponent(typeof(Image)).enabled = not var_26_1
	arg_26_0.likeCntTxt.text = i18n("ins_word_like", var_26_0:GetLikeCnt())
end

function var_0_0.UpdateCommentList(arg_28_0)
	local var_28_0 = arg_28_0.contextData.instagram

	if not var_28_0 then
		return
	end

	local var_28_1, var_28_2 = var_28_0:GetCanDisplayComments()

	table.sort(var_28_1, function(arg_29_0, arg_29_1)
		return arg_29_0.time < arg_29_1.time
	end)
	arg_28_0.commentList:make(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == UIItemList.EventUpdate then
			local var_30_0 = var_28_1[arg_30_1 + 1]
			local var_30_1 = var_30_0:HasReply()

			setText(arg_30_2:Find("main/reply"), var_30_0:GetReplyBtnTxt())

			local var_30_2 = var_30_0:GetContent()
			local var_30_3 = SwitchSpecialChar(var_30_2)

			setText(arg_30_2:Find("main/content"), HXSet.hxLan(var_30_3))
			setText(arg_30_2:Find("main/bubble/Text"), var_30_0:GetReplyCnt())
			setText(arg_30_2:Find("main/time"), var_30_0:GetTime())

			if var_30_0:GetType() == Instagram.TYPE_PLAYER_COMMENT then
				local var_30_4, var_30_5 = var_30_0:GetIcon()

				setImageSprite(arg_30_2:Find("main/head/icon"), GetSpriteFromAtlas(var_30_4, var_30_5))
			else
				setImageSprite(arg_30_2:Find("main/head/icon"), LoadSprite("qicon/" .. var_30_0:GetIcon()), false)
			end

			if var_30_1 then
				onToggle(arg_28_0, arg_30_2:Find("main/bubble"), function(arg_31_0)
					setActive(arg_30_2:Find("replys"), arg_31_0)
				end, SFX_PANEL)
				arg_28_0:UpdateReplys(arg_30_2, var_30_0)
				triggerToggle(arg_30_2:Find("main/bubble"), true)
			else
				setActive(arg_30_2:Find("replys"), false)
				triggerToggle(arg_30_2:Find("main/bubble"), false)
			end

			arg_30_2:Find("main/bubble"):GetComponent(typeof(Toggle)).enabled = var_30_1
		end
	end)
	setActive(arg_28_0.centerTF, false)
	setActive(arg_28_0.centerTF, true)
	Canvas.ForceUpdateCanvases()
	arg_28_0.commentList:align(#var_28_1)
end

function var_0_0.UpdateReplys(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0, var_32_1 = arg_32_2:GetCanDisplayReply()
	local var_32_2 = UIItemList.New(arg_32_1:Find("replys"), arg_32_1:Find("replys/sub"))

	table.sort(var_32_0, function(arg_33_0, arg_33_1)
		if arg_33_0.level == arg_33_1.level then
			if arg_33_0.time == arg_33_1.time then
				return arg_33_0.id < arg_33_1.id
			else
				return arg_33_0.time < arg_33_1.time
			end
		else
			return arg_33_0.level < arg_33_1.level
		end
	end)
	var_32_2:make(function(arg_34_0, arg_34_1, arg_34_2)
		if arg_34_0 == UIItemList.EventUpdate then
			local var_34_0 = var_32_0[arg_34_1 + 1]

			setImageSprite(arg_34_2:Find("head/icon"), LoadSprite("qicon/" .. var_34_0:GetIcon()), false)

			local var_34_1 = var_34_0:GetContent()
			local var_34_2 = SwitchSpecialChar(var_34_1)

			setText(arg_34_2:Find("content"), HXSet.hxLan(var_34_2))
		end
	end)
	var_32_2:align(#var_32_0)
end

function var_0_0.OpenCommentPanel(arg_35_0)
	local var_35_0 = arg_35_0.contextData.instagram

	if not var_35_0:CanOpenComment() then
		return
	end

	setActive(arg_35_0.optionalPanel, true)

	local var_35_1 = var_35_0:GetOptionComment()

	arg_35_0.commentPanel:GetComponent(typeof(Image)).enabled = true
	arg_35_0.commentPanel.sizeDelta = Vector2(0, #var_35_1 * 142 + 60)

	local var_35_2 = UIItemList.New(arg_35_0.optionalPanel, arg_35_0.optionalPanel:Find("option1"))

	var_35_2:make(function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 == UIItemList.EventUpdate then
			local var_36_0 = arg_36_1 + 1
			local var_36_1 = var_35_1[var_36_0].text
			local var_36_2 = var_35_1[var_36_0].id
			local var_36_3 = var_35_1[var_36_0].index

			setText(arg_36_2:Find("Text"), HXSet.hxLan(var_36_1))
			onButton(arg_35_0, arg_36_2, function()
				arg_35_0:emit(InstagramMediator.ON_COMMENT, var_35_0.id, var_36_3, var_36_2)
				arg_35_0:CloseCommentPanel()
			end, SFX_PANEL)
		end
	end)
	var_35_2:align(#var_35_1)
end

function var_0_0.CloseCommentPanel(arg_38_0)
	arg_38_0.commentPanel:GetComponent(typeof(Image)).enabled = false
	arg_38_0.commentPanel.sizeDelta = Vector2(0, 0)

	setActive(arg_38_0.optionalPanel, false)
end

function var_0_0.onBackPressed(arg_39_0)
	if arg_39_0.inDetail then
		arg_39_0:ExitDetail()

		return
	end

	arg_39_0:emit(InstagramMediator.CLOSE_ALL)
end

function var_0_0.CloseDetail(arg_40_0)
	if arg_40_0.inDetail then
		arg_40_0:ExitDetail()

		return
	end
end

function var_0_0.willExit(arg_41_0)
	for iter_41_0, iter_41_1 in ipairs(arg_41_0.toDownloadList or {}) do
		arg_41_0.downloadmgr:StopLoader(iter_41_1)
	end

	arg_41_0.toDownloadList = {}

	arg_41_0:UnOverlayPanel(arg_41_0._tf)
	arg_41_0:ExitDetail()

	for iter_41_2, iter_41_3 in pairs(arg_41_0.sprites) do
		if not IsNil(iter_41_3) then
			Object.Destroy(iter_41_3)
		end
	end

	arg_41_0.sprites = nil

	for iter_41_4, iter_41_5 in pairs(arg_41_0.cards) do
		iter_41_5:Dispose()
	end

	arg_41_0.cards = {}
end

return var_0_0
