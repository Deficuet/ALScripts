local var_0_0 = class("GuildThemePage", import("...base.GuildBasePage"))

function var_0_0.getTargetUI(arg_1_0)
	if getProxy(SettingsProxy):IsMellowStyle() then
		return "GuildThemeBlueUI4Mellow", "GuildThemeRedUI4Mellow"
	else
		return "GuildThemeBlueUI", "GuildThemeRedUI"
	end
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.top = arg_2_0._tf:Find("top")
	arg_2_0.chatBtn = arg_2_0._tf:Find("chat_bg")
	arg_2_0.chatBtnTip = arg_2_0.chatBtn:Find("tip")
	arg_2_0.chatBtnTipCnt = arg_2_0.chatBtn:Find("tip/Text"):GetComponent(typeof(Text))
	arg_2_0.chatPanel = arg_2_0._tf:Find("chat_frame")
	arg_2_0.chatCloseBtn = arg_2_0.chatPanel:Find("close")
	arg_2_0.bottomPanel = arg_2_0._tf:Find("bottom")
	arg_2_0.battleEvent = arg_2_0._tf:Find("bottom/battle_event")
	arg_2_0.battleEventTip = arg_2_0.battleEvent:Find("tip")
	arg_2_0.battleEventTipCnt = arg_2_0.battleEventTip:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.battleReport = arg_2_0._tf:Find("bottom/battle_report")
	arg_2_0.battleReportTip = arg_2_0.battleReport:Find("tip")
	arg_2_0.battleReportCnt = arg_2_0.battleReportTip:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.shopBtn = arg_2_0._tf:Find("bottom/battle_shop")
	arg_2_0.nameTxt = arg_2_0._tf:Find("top/name/Text"):GetComponent(typeof(Text))
	arg_2_0.modifyBtn = arg_2_0._tf:Find("top/name")
	arg_2_0.levelImg = arg_2_0._tf:Find("top/level/Text"):GetComponent(typeof(Text))
	arg_2_0.factionTxt = arg_2_0._tf:Find("top/policy/label"):GetComponent(typeof(Text))
	arg_2_0.policyTxt = arg_2_0._tf:Find("top/policy/Text"):GetComponent(typeof(Text))
	arg_2_0.idTxt = arg_2_0._tf:Find("top/id/Text"):GetComponent(typeof(Text))
	arg_2_0.numberTxt = arg_2_0._tf:Find("top/id/number"):GetComponent(typeof(Text))
	arg_2_0.expImg = arg_2_0._tf:Find("top/exp/bar")
	arg_2_0.levelTxt = arg_2_0._tf:Find("top/exp/lv/Text"):GetComponent(typeof(Text))

	local var_2_0 = 300

	arg_2_0.topPanelWidth = arg_2_0.top.rect.height
	arg_2_0.bottomPanelWidth = -165
	arg_2_0.chatPanelWidth = arg_2_0.chatPanel.rect.width + var_2_0
	arg_2_0.chatBtnWidth = arg_2_0.chatBtn.rect.width + var_2_0

	setAnchoredPosition(arg_2_0.chatPanel, {
		x = arg_2_0.chatPanelWidth
	})
	setAnchoredPosition(arg_2_0.chatBtn, {
		x = 0
	})

	arg_2_0.modifyPage = GuildModifitonPage.New(arg_2_0._tf, arg_2_0.event)
	arg_2_0.chatBubbles = {}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.battleEvent, function()
		local var_4_0 = arg_3_0.contextData.toggles[GuildMainScene.TOGGLE_TAG[6]]

		triggerToggle(var_4_0, true)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.battleReport, function()
		arg_3_0:emit(GuildMainMediator.OPEN_EVENT_REPORT)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.shopBtn, function()
		arg_3_0:emit(GuildMainMediator.OPEN_SHOP)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.chatBtn, function()
		arg_3_0:InitChatWindow()
		arg_3_0:ShowOrHideChatWindow(true)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.chatCloseBtn, function()
		getProxy(GuildProxy):ClearNewChatMsgCnt()
		arg_3_0:UpdateChatBtn()
		arg_3_0:ShowOrHideChatWindow(false)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.modifyBtn, function()
		arg_3_0.modifyPage:ExecuteAction("Show", arg_3_0.guildVO, arg_3_0.playerVO)
	end, SFX_PANEL)
end

function var_0_0.Update(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_0:UpdateData(arg_10_1, arg_10_2, arg_10_3)
	arg_10_0:UpdateMainInfo()
	arg_10_0:UpdateChatBtn()
	arg_10_0:UpdateBattleBtn()
	arg_10_0:Show()
end

function var_0_0.ResUISettings(arg_11_0)
	return {
		showType = PlayerResUI.TYPE_ALL
	}
end

function var_0_0.UpdateData(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	arg_12_0:UpdateGuild(arg_12_1)

	arg_12_0.playerVO = arg_12_2
	arg_12_0.chatMsgs = arg_12_3
	arg_12_0.isAdmin = arg_12_1:IsAdministrator()
end

function var_0_0.UpdateGuild(arg_13_0, arg_13_1)
	arg_13_0.guildVO = arg_13_1
end

function var_0_0.RefreshReportBtn(arg_14_0)
	arg_14_0:UpdateBattleBtn()
end

function var_0_0.UpdateBattleBtn(arg_15_0)
	local var_15_0 = getProxy(GuildProxy):GetReports()

	setActive(arg_15_0.battleEvent, arg_15_0.guildVO:GetActiveEvent() ~= nil)
	setActive(arg_15_0.battleEventTip, false)

	local var_15_1 = arg_15_0.guildVO:getMemberById(arg_15_0.playerVO.id)
	local var_15_2 = _.select(_.values(var_15_0), function(arg_16_0)
		return arg_16_0:CanSubmit()
	end)
	local var_15_3 = #var_15_2 > 0 and not var_15_1:IsRecruit()

	setActive(arg_15_0.battleReport, var_15_3)
	setActive(arg_15_0.battleReportTip, var_15_3)

	if var_15_3 then
		arg_15_0.battleReportCnt.text = #var_15_2
	end
end

function var_0_0.UpdateChatBtn(arg_17_0)
	local var_17_0 = getProxy(GuildProxy):GetNewChatMsgCnt()
	local var_17_1 = var_17_0 > 0

	setActive(arg_17_0.chatBtnTip, var_17_1)

	if var_17_1 then
		arg_17_0.chatBtnTipCnt.text = var_17_0
	end
end

function var_0_0.InitChatWindow(arg_18_0)
	if arg_18_0.isInitChatWindow then
		return
	end

	arg_18_0.isInitChatWindow = true
	arg_18_0.noticeTxt = arg_18_0.chatPanel:Find("log/notice/InputField"):GetComponent(typeof(InputField))
	arg_18_0.noticeMask = arg_18_0.chatPanel:Find("log/notice/mask")
	arg_18_0.noticeScrollTxt = arg_18_0.chatPanel:Find("log/notice/mask/label"):GetComponent(typeof(ScrollText))
	arg_18_0.logContent = arg_18_0.chatPanel:Find("log/content/viewport/list")
	arg_18_0.prefabPublic = arg_18_0:getTpl("tpl", arg_18_0.logContent)
	arg_18_0.chatRect = arg_18_0.chatPanel:Find("bottom/list")
	arg_18_0.chatContent = arg_18_0.chatPanel:Find("bottom/list/content")
	arg_18_0.prefabOthers = arg_18_0.chatPanel:Find("bottom/list/popo_other")
	arg_18_0.prefabSelf = arg_18_0.chatPanel:Find("bottom/list/popo_self")
	arg_18_0.prefabWorldboss = arg_18_0.chatPanel:Find("bottom/list/popo_worldboss")
	arg_18_0.sendBtn = arg_18_0.chatPanel:Find("bottom/bottom/send")
	arg_18_0.msgInput = arg_18_0.chatPanel:Find("bottom/bottom/input"):GetComponent(typeof(InputField))
	arg_18_0.emojiBtn = arg_18_0.chatPanel:Find("bottom/bottom/emoji")
	arg_18_0.newMsgTip = arg_18_0.chatPanel:Find("bottom/bottom/tip")

	onButton(arg_18_0, arg_18_0.sendBtn, function()
		local var_19_0 = arg_18_0.msgInput.text

		if wordVer(var_19_0) > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("playerinfo_mask_word"))

			return
		end

		if var_19_0 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_msg_is_null"))

			return
		end

		if arg_18_0.chatTimer and pg.TimeMgr.GetInstance():GetServerTime() - arg_18_0.chatTimer < 5 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dont_send_message_frequently"))

			return
		end

		arg_18_0.chatTimer = pg.TimeMgr.GetInstance():GetServerTime()

		arg_18_0:emit(GuildMainMediator.SEND_MSG, var_19_0)

		arg_18_0.msgInput.text = ""
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.emojiBtn, function()
		local var_20_0 = arg_18_0.emojiBtn.position

		arg_18_0:emit(GuildMainMediator.OPEN_EMOJI, Vector3(var_20_0.x, var_20_0.y, 0), function(arg_21_0)
			arg_18_0:emit(GuildMainMediator.SEND_MSG, string.gsub(ChatConst.EmojiCode, "code", arg_21_0))
		end)
	end, SFX_PANEL)
	GetOrAddComponent(arg_18_0.chatRect, typeof(EventTriggerListener)):AddDragEndFunc(function(arg_22_0, arg_22_1)
		if GetComponent(arg_18_0.chatRect, typeof(ScrollRect)).normalizedPosition.y <= 0.1 then
			arg_18_0:ClearChatTip()
		end
	end)
	arg_18_0:UpdateChatWindow()

	if arg_18_0.isAdmin then
		onInputEndEdit(arg_18_0, arg_18_0.noticeTxt.gameObject, function()
			local var_23_0 = arg_18_0.guildVO:GetAnnounce() or ""
			local var_23_1 = getInputText(arg_18_0.noticeTxt.gameObject)

			if var_23_1 == "" or var_23_1 == var_23_0 then
				return
			end

			if wordVer(var_23_1) > 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("playerinfo_mask_word"))
				setInputText(arg_18_0.noticeTxt.gameObject, "")

				return
			end

			arg_18_0.noticeScrollTxt:SetText(var_23_1)
			arg_18_0:emit(GuildMainMediator.MODIFY, 5, 0, var_23_1)
			setInputText(arg_18_0.noticeTxt.gameObject, "")
		end)
	end

	setButtonEnabled(arg_18_0.noticeMask, arg_18_0.isAdmin)
end

function var_0_0.UpdateChatWindow(arg_24_0)
	local var_24_0 = arg_24_0.guildVO

	arg_24_0:UpdateNotice()

	local var_24_1 = var_24_0.logInfo

	arg_24_0:UpdateAllLog(var_24_1)

	local var_24_2 = arg_24_0.chatMsgs

	arg_24_0:UpdateAllChat(var_24_2)
end

function var_0_0.UpdateNotice(arg_25_0)
	local var_25_0 = arg_25_0.guildVO:GetAnnounce()
	local var_25_1 = (not var_25_0 or var_25_0 == "") and i18n("guild_not_exist_notifycation") or var_25_0

	arg_25_0.noticeScrollTxt:SetText(var_25_1)
end

function var_0_0.UpdateAllLog(arg_26_0, arg_26_1)
	removeAllChildren(arg_26_0.logContent)

	for iter_26_0, iter_26_1 in ipairs(arg_26_1) do
		arg_26_0:AppendLog(iter_26_1)
	end
end

function var_0_0.AppendLog(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_0.isInitChatWindow then
		return
	end

	if arg_27_0.logContent.childCount >= 200 then
		arg_27_0:emit(GuildMainMediator.ON_REBUILD_LOG_ALL)
	else
		local var_27_0 = cloneTplTo(arg_27_0.prefabPublic, arg_27_0.logContent)

		if arg_27_2 then
			var_27_0:SetAsFirstSibling()
		end

		local var_27_1 = var_27_0:Find("text"):GetComponent("RichText")
		local var_27_2 = var_27_0:Find("time"):GetComponent(typeof(Text))
		local var_27_3, var_27_4 = arg_27_1:getConent()

		if arg_27_1.cmd == GuildLogInfo.CMD_TYPE_GET_SHIP then
			ChatProxy.InjectPublic(var_27_1, var_27_3, true)
		else
			var_27_1.text = var_27_3
		end

		var_27_2.text = var_27_4
	end
end

function var_0_0.UpdateAllChat(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1 or {}

	removeAllChildren(arg_28_0.chatContent)

	local var_28_1 = {}

	arg_28_0.index = math.max(1, #var_28_0 - GuildConst.CHAT_LOG_MAX_COUNT)

	for iter_28_0 = arg_28_0.index, #var_28_0 do
		table.insert(var_28_1, function(arg_29_0)
			arg_28_0:Append(var_28_0[iter_28_0], -1, true)
			arg_29_0()
		end)
	end

	seriesAsync(var_28_1, function()
		Timer.New(function()
			if not IsNil(arg_28_0.chatContent) then
				scrollToBottom(arg_28_0.chatContent.parent)
			end
		end, 0.5, 1):Start()
	end)
end

function var_0_0.Append(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	arg_32_0:UpdateChatBtn()

	if not arg_32_0.isInitChatWindow then
		return
	end

	if arg_32_0.chatContent.childCount >= GuildConst.CHAT_LOG_MAX_COUNT * 2 then
		arg_32_0:emit(GuildMainMediator.REBUILD_ALL)
	elseif arg_32_1.id and arg_32_1.id == 4 then
		arg_32_0:AddWorldBossMsg(arg_32_1, arg_32_2, arg_32_3)
	else
		arg_32_0:AppendWorld(arg_32_1, arg_32_2, arg_32_3)
	end
end

function var_0_0.ShowChatTip(arg_33_0)
	setActive(arg_33_0.newMsgTip, true)
end

function var_0_0.ClearChatTip(arg_34_0)
	setActive(arg_34_0.newMsgTip, false)
end

function var_0_0.AddWorldBossMsg(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	local var_35_0 = Clone(arg_35_1)
	local var_35_1 = var_35_0.player

	if not arg_35_3 then
		arg_35_0:ShowChatTip()
	end

	local var_35_2 = cloneTplTo(arg_35_0.prefabWorldboss, arg_35_0.chatContent)
	local var_35_3 = ChatBubbleWorldBoss.New(var_35_2)

	if arg_35_2 >= 0 then
		var_35_3.tf:SetSiblingIndex(arg_35_2)
	end

	var_35_3:update(var_35_0)
	table.insert(arg_35_0.chatBubbles, var_35_3)
end

function var_0_0.AppendWorld(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	local var_36_0 = Clone(arg_36_1)
	local var_36_1 = var_36_0.player
	local var_36_2 = arg_36_0.prefabOthers

	if var_36_1.id == arg_36_0.playerVO.id then
		var_36_2 = arg_36_0.prefabSelf
		var_36_0.player = setmetatable(Clone(arg_36_0.playerVO), {
			__index = var_36_0.player
		})
	elseif not arg_36_3 then
		arg_36_0:ShowChatTip()
	end

	local var_36_3 = cloneTplTo(var_36_2, arg_36_0.chatContent)
	local var_36_4 = GuildChatBubble.New(var_36_3)

	if arg_36_2 >= 0 then
		var_36_4.tf:SetSiblingIndex(arg_36_2)
	end

	var_36_0.isSelf = var_36_1.id == arg_36_0.playerVO.id

	var_36_4:update(var_36_0)

	if not arg_36_3 and var_36_0.isSelf then
		onNextTick(function()
			scrollToBottom(arg_36_0.chatContent.parent)
		end)
	end

	table.insert(arg_36_0.chatBubbles, var_36_4)
end

function var_0_0.UpdateMainInfo(arg_38_0)
	local var_38_0 = arg_38_0.guildVO

	arg_38_0.nameTxt.text = var_38_0:getName()
	arg_38_0.factionTxt.text = var_38_0:getFactionName()
	arg_38_0.policyTxt.text = var_38_0:getPolicyName()
	arg_38_0.idTxt.text = "ID:" .. var_38_0.id
	arg_38_0.numberTxt.text = var_38_0.memberCount .. "/" .. var_38_0:getMaxMember()

	setFillAmount(arg_38_0.expImg, var_38_0.exp / math.max(var_38_0:getLevelMaxExp(), 1))

	arg_38_0.levelTxt.text = var_38_0.level <= 9 and "0" .. var_38_0.level or var_38_0.level

	local var_38_1 = ""
	local var_38_2 = ""
	local var_38_3 = math.floor(var_38_0.level / 10)

	for iter_38_0 = 1, var_38_3 do
		var_38_2 = var_38_2 .. ":"
	end

	local var_38_4 = var_38_0.level % 10
	local var_38_5 = var_38_2 .. (var_38_4 == 0 and "" or var_38_4)

	arg_38_0.levelImg.text = var_38_5

	if arg_38_0.isInitChatWindow then
		arg_38_0:UpdateNotice()
	end
end

function var_0_0.ShowOrHideChatWindow(arg_39_0, arg_39_1)
	if LeanTween.isTweening(go(arg_39_0.chatPanel)) then
		return
	end

	local var_39_0
	local var_39_1
	local var_39_2
	local var_39_3

	if not arg_39_1 then
		var_39_0, var_39_1 = 0, arg_39_0.chatPanelWidth
		var_39_2, var_39_3 = arg_39_0.chatBtnWidth, 0
	else
		var_39_0, var_39_1 = arg_39_0.chatPanelWidth, 0
		var_39_2, var_39_3 = 0, arg_39_0.chatBtnWidth
	end

	arg_39_0.isShowChatWindow = arg_39_1

	local function var_39_4()
		if arg_39_1 then
			setParent(arg_39_0.chatPanel, pg.UIMgr.GetInstance().OverlayMain, true)

			local var_40_0 = arg_39_0.chatPanel.localPosition

			arg_39_0.chatPanel.localPosition = Vector3(var_40_0.x, var_40_0.y, 0)

			pg.UIMgr.GetInstance():OverlayPanel(arg_39_0.chatPanel, {
				pbList = {
					arg_39_0.chatPanel
				}
			})

			arg_39_0.chatPanelAnchoredPositionX = arg_39_0.chatPanel.anchoredPosition.x
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_39_0.chatPanel, arg_39_0._tf)
		end
	end

	LeanTween.value(go(arg_39_0.chatPanel), var_39_0, var_39_1, 0.3):setOnUpdate(System.Action_float(function(arg_41_0)
		setAnchoredPosition(arg_39_0.chatPanel, {
			x = arg_41_0
		})
	end)):setOnComplete(System.Action(var_39_4))
	LeanTween.value(go(arg_39_0.chatBtn), var_39_2, var_39_3, 0.3):setOnUpdate(System.Action_float(function(arg_42_0)
		setAnchoredPosition(arg_39_0.chatBtn, {
			x = arg_42_0
		})
	end))
end

function var_0_0.EnterOrExitPreView(arg_43_0, arg_43_1)
	if LeanTween.isTweening(go(arg_43_0.top)) or LeanTween.isTweening(go(arg_43_0.bottomPanel)) or LeanTween.isTweening(go(arg_43_0.chatPanel)) or LeanTween.isTweening(go(arg_43_0.chatBtn)) then
		return
	end

	local var_43_0 = arg_43_1 and {
		0,
		arg_43_0.topPanelWidth
	} or {
		arg_43_0.topPanelWidth,
		0
	}

	LeanTween.value(go(arg_43_0.top), var_43_0[1], var_43_0[2], 0.3):setOnUpdate(System.Action_float(function(arg_44_0)
		setAnchoredPosition(arg_43_0.top, {
			y = arg_44_0
		})
	end))

	local var_43_1 = arg_43_1 and {
		94,
		94 + arg_43_0.bottomPanelWidth
	} or {
		94 + arg_43_0.bottomPanelWidth,
		94
	}

	LeanTween.value(go(arg_43_0.bottomPanel), var_43_1[1], var_43_1[2], 0.3):setOnUpdate(System.Action_float(function(arg_45_0)
		setAnchoredPosition(arg_43_0.bottomPanel, {
			y = arg_45_0
		})
	end))

	if arg_43_0.isShowChatWindow then
		local var_43_2 = arg_43_1 and {
			0,
			arg_43_0.chatPanelWidth
		} or {
			arg_43_0.chatPanelWidth,
			arg_43_0.chatPanelAnchoredPositionX or 0
		}

		LeanTween.value(go(arg_43_0.chatPanel), var_43_2[1], var_43_2[2], 0.3):setOnUpdate(System.Action_float(function(arg_46_0)
			setAnchoredPosition(arg_43_0.chatPanel, {
				x = arg_46_0
			})
		end))
	else
		local var_43_3 = arg_43_1 and {
			0,
			arg_43_0.chatBtnWidth
		} or {
			arg_43_0.chatBtnWidth,
			0
		}

		LeanTween.value(go(arg_43_0.chatBtn), var_43_3[1], var_43_3[2], 0.3):setOnUpdate(System.Action_float(function(arg_47_0)
			setAnchoredPosition(arg_43_0.chatBtn, {
				x = arg_47_0
			})
		end))
	end
end

function var_0_0.InsertEmojiToInputText(arg_48_0, arg_48_1)
	arg_48_0.msgInput.text = arg_48_0.msgInput.text .. string.gsub(ChatConst.EmojiIconCode, "code", arg_48_1)
end

function var_0_0.OnDestroy(arg_49_0)
	if arg_49_0.isShowChatWindow then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_49_0.chatPanel, arg_49_0._tf)
	end

	if LeanTween.isTweening(go(arg_49_0.chatPanel)) then
		LeanTween.cancel(go(arg_49_0.chatPanel))
	end

	if LeanTween.isTweening(go(arg_49_0.chatBtn)) then
		LeanTween.cancel(go(arg_49_0.chatBtn))
	end

	arg_49_0.modifyPage:Destroy()

	for iter_49_0, iter_49_1 in ipairs(arg_49_0.chatBubbles) do
		if iter_49_1 then
			iter_49_1:dispose()
		end
	end

	arg_49_0.chatBubbles = nil

	arg_49_0:Hide()
end

return var_0_0
