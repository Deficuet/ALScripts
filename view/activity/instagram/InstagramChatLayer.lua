local var_0_0 = class("InstagramChatLayer", import("...base.BaseUI"))
local var_0_1 = pg.activity_ins_ship_group_template
local var_0_2 = pg.activity_ins_redpackage
local var_0_3 = pg.emoji_template

function var_0_0.getUIName(arg_1_0)
	return "InstagramChatUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "InstagramMainUI"
end

var_0_0.ReadType = {
	"all",
	"hasReaded",
	"waitingForRead"
}
var_0_0.TypeType = {
	"all",
	"single",
	"multiple"
}
var_0_0.CampIds = {
	0,
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12
}
var_0_0.CampNames = {
	"word_shipNation_all",
	"word_shipNation_baiYing",
	"word_shipNation_huangJia",
	"word_shipNation_chongYing",
	"word_shipNation_tieXue",
	"word_shipNation_dongHuang",
	"word_shipNation_saDing",
	"word_shipNation_beiLian",
	"word_shipNation_ziyou",
	"word_shipNation_weixi",
	"word_shipNation_mot",
	"word_shipNation_yujinwangguo",
	"word_shipNation_other"
}

function var_0_0.init(arg_3_0)
	arg_3_0.leftPanel = arg_3_0:findTF("main/leftPanel")
	arg_3_0.filterBtn = arg_3_0:findTF("leftTop/filter", arg_3_0.leftPanel)
	arg_3_0.isFiltered = arg_3_0:findTF("isFiltered", arg_3_0.filterBtn)
	arg_3_0.charaList = UIItemList.New(arg_3_0:findTF("charaScroll/Viewport/Content", arg_3_0.leftPanel), arg_3_0:findTF("charaScroll/Viewport/Content/charaMsg", arg_3_0.leftPanel))
	arg_3_0.rightPanel = arg_3_0:findTF("main/rightPanel")
	arg_3_0.characterName = arg_3_0:findTF("rightTop/name", arg_3_0.rightPanel)
	arg_3_0.careBtn = arg_3_0:findTF("rightTop/careBtn", arg_3_0.rightPanel)
	arg_3_0.topicBtn = arg_3_0:findTF("rightTop/topicBtn", arg_3_0.rightPanel)
	arg_3_0.backgroundBtn = arg_3_0:findTF("rightTop/backgroundBtn", arg_3_0.rightPanel)
	arg_3_0.messageList = UIItemList.New(arg_3_0:findTF("messageScroll/Viewport/Content", arg_3_0.rightPanel), arg_3_0:findTF("messageScroll/Viewport/Content/messageCard", arg_3_0.rightPanel))
	arg_3_0.optionPanel = arg_3_0:findTF("optionPanel", arg_3_0.rightPanel)
	arg_3_0.optionList = UIItemList.New(arg_3_0.optionPanel, arg_3_0:findTF("option", arg_3_0.optionPanel))
	arg_3_0.filterUI = arg_3_0:findTF("subPages/InstagramFilterUI")
	arg_3_0.topicUI = arg_3_0:findTF("subPages/InstagramTopicUI")
	arg_3_0.backgroundUI = arg_3_0:findTF("subPages/InstagramBackgroundUI")
	arg_3_0.redPacketUI = arg_3_0:findTF("subPages/InstagramRedPacketUI")

	setText(arg_3_0:findTF("Text", arg_3_0.filterBtn), i18n("juuschat_filter_title"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/read/subTitleFrame/subTitle", arg_3_0.filterUI), i18n("juuschat_filter_subtitle1"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/type/subTitleFrame/subTitle", arg_3_0.filterUI), i18n("juuschat_filter_subtitle2"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/subTitleFrame/subTitle", arg_3_0.filterUI), i18n("juuschat_filter_subtitle3"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/read/option/Text", arg_3_0.filterUI), i18n("juuschat_filter_tip1"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/read/option_1/Text", arg_3_0.filterUI), i18n("juuschat_filter_tip2"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/read/option_2/Text", arg_3_0.filterUI), i18n("juuschat_filter_tip3"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/type/option/Text", arg_3_0.filterUI), i18n("juuschat_filter_tip1"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/type/option_1/Text", arg_3_0.filterUI), i18n("juuschat_filter_tip4"))
	setText(arg_3_0:findTF("panel/filterScroll/Viewport/Content/type/option_2/Text", arg_3_0.filterUI), i18n("juuschat_filter_tip5"))
	setText(arg_3_0:findTF("panel/topicScroll/Viewport/Content/topic/waiting", arg_3_0.topicUI), i18n("juuschat_chattip3"))
	setText(arg_3_0:findTF("panel/topicScroll/Viewport/Content/topic/selected/Text", arg_3_0.topicUI), i18n("juuschat_label2"))
	setText(arg_3_0:findTF("panel/backgroundScroll/Viewport/Content/background/selected/Text", arg_3_0.backgroundUI), i18n("juuschat_label1"))
	setText(arg_3_0:findTF("panel/got/detailBtn/Text", arg_3_0.redPacketUI), i18n("juuschat_redpacket_show_detail"))
	setText(arg_3_0:findTF("panel/detail/title", arg_3_0.redPacketUI), i18n("juuschat_redpacket_detail"))
	setText(arg_3_0:findTF("main/noFilteredMessageBg/Text"), i18n("juuschat_filter_empty"))
	setText(arg_3_0:findTF("panel/backgroundScroll/Viewport/Content/background/lockFrame/Text", arg_3_0.backgroundUI), i18n("juuschat_background_tip1"))

	arg_3_0.redPacketGot = arg_3_0:findTF("panel/got", arg_3_0.redPacketUI)

	arg_3_0:OverlayPanel(arg_3_0._tf)
	SetActive(arg_3_0.filterUI, false)
	SetActive(arg_3_0.isFiltered, false)
	SetActive(arg_3_0.topicUI, false)
	SetActive(arg_3_0.backgroundUI, false)
	SetActive(arg_3_0.redPacketUI, false)
	SetActive(arg_3_0.rightPanel, false)

	arg_3_0.timerList = {}
	arg_3_0.canFresh = false

	local var_3_0 = arg_3_0:findTF("messageScroll/Scrollbar Vertical", arg_3_0.rightPanel):GetComponent(typeof(RectTransform))

	arg_3_0.messageScrollWidth = var_3_0.rect.width
	arg_3_0.messageScrollHeight = var_3_0.rect.height

	arg_3_0:findTF("panel/title", arg_3_0.filterUI):GetComponent(typeof(Image)):SetNativeSize()
	arg_3_0:findTF("panel/title", arg_3_0.topicUI):GetComponent(typeof(Image)):SetNativeSize()
	arg_3_0:findTF("panel/title", arg_3_0.backgroundUI):GetComponent(typeof(Image)):SetNativeSize()
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:SetData()
	arg_4_0:UpdateCharaList(false, false)
	arg_4_0:SetFilterPanel()
end

function var_0_0.UpdateCharaList(arg_5_0, arg_5_1, arg_5_2)
	if not arg_5_0.chatList or #arg_5_0.chatList == 0 then
		SetActive(arg_5_0.leftPanel, false)
		SetActive(arg_5_0.rightPanel, false)
		SetActive(arg_5_0:findTF("main/noMessageBg"), true)
		SetActive(arg_5_0:findTF("main/noFilteredMessageBg"), false)
		SetActive(arg_5_0:findTF("main/rightNoMessageBg"), false)

		return
	end

	if not arg_5_0.currentChat then
		SetActive(arg_5_0.rightPanel, false)
		SetActive(arg_5_0:findTF("main/rightNoMessageBg"), true)
	else
		SetActive(arg_5_0.rightPanel, true)
		SetActive(arg_5_0:findTF("main/rightNoMessageBg"), false)
	end

	arg_5_0.charaList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = arg_5_0.chatList[arg_6_1 + 1]

			setImageSprite(arg_6_2:Find("charaBg/chara"), LoadSprite("qicon/" .. var_6_0.sculpture), false)
			setText(arg_6_2:Find("name"), var_6_0.name)

			local var_6_1 = var_6_0:GetDisplayWord()

			if not arg_5_0.currentChat or arg_5_0.currentChat.characterId ~= var_6_0.characterId or not arg_5_1 then
				setText(arg_6_2:Find("msg"), var_6_1)
			end

			setText(arg_6_2:Find("displayWord"), var_6_1)
			SetActive(arg_6_2:Find("care"), var_6_0.care == 1)

			if var_6_0.care == 1 and arg_5_0.careAniTriggerId and arg_5_0.careAniTriggerId == var_6_0.characterId then
				arg_5_0.careAniTriggerId = nil

				arg_6_2:Find("care"):GetComponent(typeof(Animation)):Play("anim_newinstagram_care")
			end

			if arg_5_0.currentChat then
				SetActive(arg_6_2:Find("frame"), arg_5_0.currentChat == var_6_0)
			end

			SetActive(arg_6_2:Find("tip"), var_6_0:GetCharacterEndFlag() == 0)
			setText(arg_6_2:Find("id"), var_6_0.characterId)
			onButton(arg_5_0, arg_6_2, function()
				if arg_5_0.currentChat and arg_5_0.currentChat.characterId ~= var_6_0.characterId then
					arg_5_0:ResetCharaTextFunc(arg_5_0.currentChat.characterId)
				end

				arg_5_0.currentChat = var_6_0

				SetActive(arg_5_0.rightPanel, true)
				SetActive(arg_5_0:findTF("main/rightNoMessageBg"), false)
				arg_5_0:UpdateChatContent(var_6_0, false, false)
				arg_5_0:SetTopicPanel(var_6_0)
				arg_5_0:SetBackgroundPanel(var_6_0)

				for iter_7_0, iter_7_1 in ipairs(arg_5_0.chatList) do
					SetActive(arg_5_0:findTF("frame", arg_5_0:findTF("main/leftPanel/charaScroll/Viewport/Content"):GetChild(iter_7_0 - 1)), false)
				end

				SetActive(arg_6_2:Find("frame"), true)

				function arg_5_0.cancelFrame()
					SetActive(arg_6_2:Find("frame"), false)
				end

				local var_7_0 = arg_5_0.rightPanel:GetComponent(typeof(Animation))

				var_7_0:Stop()
				var_7_0:Play("anim_newinstagram_chat_right_in")
			end, SFX_PANEL)
		end
	end)
	arg_5_0.charaList:align(#arg_5_0.chatList)
	arg_5_0:SetFilterResult()

	if arg_5_0.currentChat then
		arg_5_0:UpdateChatContent(arg_5_0.currentChat, arg_5_1, arg_5_2)
		arg_5_0:SetTopicPanel(arg_5_0.currentChat)
	end
end

function var_0_0.UpdateChatContent(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	SetActive(arg_9_0.rightPanel, true)
	setText(arg_9_0.characterName, arg_9_1.name)

	local var_9_0 = arg_9_0:findTF("care", arg_9_0.careBtn)

	SetActive(var_9_0, arg_9_1.care == 1)
	onButton(arg_9_0, arg_9_0.careBtn, function()
		local var_10_0 = arg_9_1.care == 0 and 1 or 0

		arg_9_0:emit(InstagramChatMediator.CHANGE_CARE, arg_9_1.characterId, var_10_0)

		arg_9_0.careAniTriggerId = arg_9_1.characterId
	end, SFX_PANEL)

	local var_9_1 = arg_9_0:findTF("paintingMask", arg_9_0.rightPanel)
	local var_9_2 = arg_9_0:findTF("painting", var_9_1)
	local var_9_3 = arg_9_0:findTF("groupBackground", arg_9_0.rightPanel)

	if arg_9_1.type == 1 then
		SetActive(var_9_1, true)
		SetActive(var_9_3, false)

		local var_9_4 = "unknown"

		if arg_9_1.skinId == 0 then
			var_9_4 = arg_9_1:GetPainting()
		else
			for iter_9_0, iter_9_1 in ipairs(arg_9_1.skins) do
				if iter_9_1.id == arg_9_1.skinId then
					var_9_4 = iter_9_1.painting
				end
			end
		end

		if not arg_9_0.paintingName then
			setPaintingPrefabAsync(var_9_2, var_9_4, "pifu")

			arg_9_0.paintingName = var_9_4
		elseif arg_9_0.paintingName and arg_9_0.paintingName ~= var_9_4 then
			retPaintingPrefab(var_9_2, arg_9_0.paintingName)
			setPaintingPrefabAsync(var_9_2, var_9_4, "pifu")

			arg_9_0.paintingName = var_9_4
		end
	else
		SetActive(var_9_1, false)
		SetActive(var_9_3, true)

		if arg_9_0.paintingName then
			retPaintingPrefab(var_9_2, arg_9_0.paintingName)

			arg_9_0.paintingName = nil
		end

		setImageSprite(var_9_3, LoadSprite("ui/InstagramChatBackgrounds_atlas", arg_9_1.groupBackground), true)
	end

	local var_9_5 = arg_9_1.currentTopic:GetDisplayWordList()

	if not arg_9_3 then
		arg_9_0:UpdateOptionPanel(arg_9_1.currentTopic, var_9_5)
		arg_9_0:UpdateMessageList(arg_9_1.currentTopic, var_9_5, arg_9_2, arg_9_1.characterId, arg_9_1.type)
	end

	if not arg_9_2 and arg_9_1.currentTopic.readFlag == 0 then
		arg_9_0:emit(InstagramChatMediator.SET_READED, {
			arg_9_1.currentTopic.topicId
		})
	end
end

function var_0_0.UpdateMessageList(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
	arg_11_0:RemoveAllTimer()

	local var_11_0

	for iter_11_0 = #arg_11_2, 1, -1 do
		if arg_11_2[iter_11_0].ship_group == 0 or arg_11_2[iter_11_0].type == 3 and arg_11_1:RedPacketGotFlag(tonumber(arg_11_2[iter_11_0].param)) then
			var_11_0 = iter_11_0

			break
		end
	end

	local var_11_1 = {}

	if var_11_0 then
		for iter_11_1 = var_11_0, 1, -1 do
			if arg_11_2[iter_11_1].ship_group == 0 then
				table.insert(var_11_1, iter_11_1)
			else
				break
			end
		end
	end

	if arg_11_0.shouldShowOption and arg_11_3 then
		arg_11_0:SetOptionPanelActive(false)
	end

	if arg_11_3 then
		onButton(arg_11_0, arg_11_0:findTF("messageScroll", arg_11_0.rightPanel), function()
			arg_11_0:SpeedUpMessage()
		end, SFX_PANEL)
	end

	local var_11_2 = GetComponent(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel), typeof(ScrollRect))

	local function var_11_3(arg_13_0)
		local var_13_0 = Vector2(0, arg_13_0)

		var_11_2.normalizedPosition = var_13_0
	end

	local var_11_4 = pg.gameset.juuschat_dialogue_trigger_time.key_value / 1000
	local var_11_5 = pg.gameset.juuschat_entering_time.key_value / 1000
	local var_11_6 = var_11_4 - var_11_5

	arg_11_0.messageList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_11_2[arg_14_1 + 1]

			if var_14_0.ship_group == 0 and var_14_0.type == 0 then
				SetActive(arg_14_2, false)

				return
			end

			local var_14_1 = arg_14_2:Find("charaMessageCard")
			local var_14_2 = arg_14_2:Find("playerReplyCard")

			SetActive(var_14_1, var_14_0.ship_group ~= 0)
			SetActive(var_14_2, var_14_0.ship_group == 0)

			if var_14_0.ship_group ~= 0 and arg_11_5 == 2 and var_14_0.type ~= 5 then
				SetActive(arg_14_2:Find("nameBar"), true)
				setText(arg_14_2:Find("nameBar/Text"), var_0_1[var_14_0.ship_group].name)
			else
				SetActive(arg_14_2:Find("nameBar"), false)
			end

			local var_14_3

			if arg_11_3 and var_11_0 and arg_14_1 + 1 > var_11_0 then
				var_14_3 = (arg_14_1 + 1 - var_11_0) * var_11_4 - var_11_5

				if #var_11_1 > 1 then
					var_14_3 = var_14_3 + (#var_11_1 - 1) * var_11_6
				end
			end

			if var_14_0.ship_group ~= 0 then
				local var_14_4 = "unknown"

				if var_0_1[var_14_0.ship_group] then
					var_14_4 = var_0_1[var_14_0.ship_group].sculpture
				end

				if var_14_0.type ~= 5 then
					setImageSprite(arg_14_2:Find("charaMessageCard/charaBg/chara"), LoadSprite("qicon/" .. var_14_4), false)
				end

				if var_14_0.type == 1 then
					arg_11_0:SetCharaMessageCardActive(var_14_1, {
						3
					})
					setText(arg_14_2:Find("charaMessageCard/msgBox/msg"), var_14_0.param)

					if arg_11_3 and var_11_0 and arg_14_1 + 1 > var_11_0 then
						SetActive(arg_14_2, false)
						arg_11_0:StartTimer(function()
							SetActive(arg_14_2, true)
							arg_14_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_14_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_14_2:Find("charaMessageCard/msgBox"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_11_0:StartTimer(function()
								SetActive(arg_14_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_14_2:Find("charaMessageCard/msgBox"), true)
								arg_14_2:Find("charaMessageCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_chat_common_in")

								if arg_14_1 + 1 ~= #arg_11_2 then
									arg_11_0:ChangeCharaTextFunc(arg_11_4, var_14_0.param)
								else
									arg_11_0:emit(InstagramChatMediator.SET_READED, {
										arg_11_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_11_0:SetEndAniEvent(arg_14_2:Find("charaMessageCard/msgBox"), function()
									if arg_11_0.shouldShowOption and arg_14_1 + 1 == #arg_11_2 then
										arg_11_0:SetOptionPanelActive(true)
									end
								end)
							end, var_11_5)
						end, var_14_3)
					end
				elseif var_14_0.type == 2 then
					arg_11_0:SetCharaMessageCardActive(var_14_1, {
						2,
						7
					})
					pg.CriMgr.GetInstance():GetCueInfo("cv-" .. var_14_0.ship_group, var_14_0.param[1], function(arg_18_0)
						setText(arg_14_2:Find("charaMessageCard/voiceBox/time"), tostring(math.ceil(tonumber(tostring(arg_18_0.length)) / 1000)) .. "\"")
					end)
					onButton(arg_11_0, arg_14_2:Find("charaMessageCard/voiceBox"), function()
						pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/cv/" .. var_14_0.ship_group .. "/" .. var_14_0.param[1])
					end, SFX_PANEL)
					setText(arg_14_2:Find("charaMessageCard/voiceMsgBox/voiceMsg/msg"), var_14_0.param[2])

					if arg_11_3 and var_11_0 and arg_14_1 + 1 > var_11_0 then
						SetActive(arg_14_2, false)
						arg_11_0:StartTimer(function()
							SetActive(arg_14_2, true)
							arg_14_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_14_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_14_2:Find("charaMessageCard/voiceBox"), false)
							SetActive(arg_14_2:Find("charaMessageCard/voiceMsgBox"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_11_0:StartTimer(function()
								SetActive(arg_14_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_14_2:Find("charaMessageCard/voiceBox"), true)
								SetActive(arg_14_2:Find("charaMessageCard/voiceMsgBox"), true)
								arg_14_2:Find("charaMessageCard/voiceBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_chat_common_in")
								arg_14_2:Find("charaMessageCard/voiceMsgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_voicetip_in")

								if arg_14_1 + 1 ~= #arg_11_2 then
									arg_11_0:ChangeCharaTextFunc(arg_11_4, "<color=#ff6666>" .. i18n("juuschat_chattip1") .. "</color>")
								else
									arg_11_0:emit(InstagramChatMediator.SET_READED, {
										arg_11_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_11_0:SetEndAniEvent(arg_14_2:Find("charaMessageCard/voiceBox"), function()
									if arg_11_0.shouldShowOption and arg_14_1 + 1 == #arg_11_2 then
										arg_11_0:SetOptionPanelActive(true)
									end
								end)
							end, var_11_5)
						end, var_14_3)
					end
				elseif var_14_0.type == 3 then
					arg_11_0:SetCharaMessageCardActive(var_14_1, {
						5
					})

					local var_14_5 = var_0_2[tonumber(var_14_0.param)]

					setText(arg_14_2:Find("charaMessageCard/redPacket/desc"), var_14_5.desc)

					local var_14_6 = arg_11_1:RedPacketGotFlag(var_14_5.id)

					SetActive(arg_14_2:Find("charaMessageCard/redPacket/got"), var_14_6)
					arg_11_0:SetRedPacketPanel(arg_14_2:Find("charaMessageCard/redPacket"), var_14_5, var_14_6, var_14_4, arg_11_1.topicId, var_14_0.id)

					if arg_11_3 and var_11_0 and arg_14_1 + 1 == var_11_0 then
						arg_11_0:ChangeCharaTextFunc(arg_11_4, "<color=#ff6666>" .. i18n("juuschat_chattip2") .. "</color>" .. pg.activity_ins_redpackage[tonumber(var_14_0.param)].desc)
					end

					if arg_11_3 and var_11_0 and arg_14_1 + 1 > var_11_0 then
						SetActive(arg_14_2, false)
						arg_11_0:StartTimer(function()
							SetActive(arg_14_2, true)
							arg_14_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_14_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_14_2:Find("charaMessageCard/redPacket"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_11_0:StartTimer(function()
								SetActive(arg_14_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_14_2:Find("charaMessageCard/redPacket"), true)
								arg_14_2:Find("charaMessageCard/redPacket"):GetComponent(typeof(Animation)):Play("anim_newinstagram_redpacket_in")

								if arg_14_1 + 1 ~= #arg_11_2 then
									arg_11_0:ChangeCharaTextFunc(arg_11_4, "<color=#ff6666>" .. i18n("juuschat_chattip2") .. "</color>" .. pg.activity_ins_redpackage[tonumber(var_14_0.param)].desc)
								else
									arg_11_0:emit(InstagramChatMediator.SET_READED, {
										arg_11_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_11_0:SetEndAniEvent(arg_14_2:Find("charaMessageCard/redPacket"), function()
									if arg_11_0.shouldShowOption and arg_14_1 + 1 == #arg_11_2 then
										arg_11_0:SetOptionPanelActive(true)
									end
								end)
							end, var_11_5)
						end, var_14_3)
					end
				elseif var_14_0.type == 4 then
					arg_11_0:SetCharaMessageCardActive(var_14_1, {
						4
					})
					arg_11_0:ClearEmoji(arg_14_2:Find("charaMessageCard/emoji/emoticon"))
					arg_11_0:SetEmoji(arg_14_2:Find("charaMessageCard/emoji/emoticon"), var_0_3[tonumber(var_14_0.param)].pic)

					if arg_11_3 and var_11_0 and arg_14_1 + 1 > var_11_0 then
						SetActive(arg_14_2, false)
						arg_11_0:StartTimer(function()
							SetActive(arg_14_2, true)
							arg_14_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_14_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_14_2:Find("charaMessageCard/emoji"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_11_0:StartTimer(function()
								SetActive(arg_14_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_14_2:Find("charaMessageCard/emoji"), true)
								arg_14_2:Find("charaMessageCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

								if arg_14_1 + 1 ~= #arg_11_2 then
									local var_27_0 = var_0_3[tonumber(var_14_0.param)].desc
									local var_27_1 = string.gsub(var_27_0, "#%w+>", "#28af6e>")

									arg_11_0:ChangeCharaTextFunc(arg_11_4, var_27_1)
								else
									arg_11_0:emit(InstagramChatMediator.SET_READED, {
										arg_11_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_11_0:SetEndAniEvent(arg_14_2:Find("charaMessageCard/emoji"), function()
									if arg_11_0.shouldShowOption and arg_14_1 + 1 == #arg_11_2 then
										arg_11_0:SetOptionPanelActive(true)
									end
								end)
							end, var_11_5)
						end, var_14_3)
					end
				elseif var_14_0.type == 5 then
					arg_11_0:SetCharaMessageCardActive(var_14_1, {
						6
					})

					local var_14_7 = var_14_0.param

					for iter_14_0 in string.gmatch(var_14_0.param, "'%d+'") do
						local var_14_8 = string.sub(iter_14_0, 2, #iter_14_0 - 1)

						var_14_7 = string.gsub(var_14_7, iter_14_0, "<color=#93e9ff>" .. var_0_1[tonumber(var_14_8)].name .. "</color>")
					end

					setText(arg_14_2:Find("charaMessageCard/systemTip/panel/Text"), var_14_7)

					if arg_11_3 and var_11_0 and arg_14_1 + 1 > var_11_0 then
						SetActive(arg_14_2, false)
						arg_11_0:StartTimer(function()
							SetActive(arg_14_2, true)
							arg_14_2:Find("charaMessageCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")

							if arg_14_1 + 1 ~= #arg_11_2 then
								arg_11_0:ChangeCharaTextFunc(arg_11_4, var_14_7)
							else
								arg_11_0:emit(InstagramChatMediator.SET_READED, {
									arg_11_1.topicId
								})
							end

							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_11_0:SetEndAniEvent(arg_14_2:Find("charaMessageCard/systemTip"), function()
								if arg_11_0.shouldShowOption and arg_14_1 + 1 == #arg_11_2 then
									arg_11_0:SetOptionPanelActive(true)
								end
							end)
						end, var_14_3)
					end
				end
			else
				if var_14_0.type == 1 then
					arg_11_0:SetPlayerMessageCardActive(var_14_2, {
						0
					})
					setText(arg_14_2:Find("playerReplyCard/msgBox/msg"), var_14_0.param)
				elseif var_14_0.type == 4 then
					arg_11_0:SetPlayerMessageCardActive(var_14_2, {
						1
					})
					arg_11_0:ClearEmoji(arg_14_2:Find("playerReplyCard/emoji/emoticon"))
					arg_11_0:SetEmoji(arg_14_2:Find("playerReplyCard/emoji/emoticon"), var_0_3[tonumber(var_14_0.param)].pic)
				elseif var_14_0.type == 5 then
					arg_11_0:SetPlayerMessageCardActive(var_14_2, {
						2
					})

					local var_14_9 = var_14_0.param

					for iter_14_1 in string.gmatch(var_14_0.param, "'%d+'") do
						local var_14_10 = string.sub(iter_14_1, 2, #iter_14_1 - 1)

						var_14_9 = string.gsub(var_14_9, iter_14_1, "<color=#93e9ff>" .. var_0_1[tonumber(var_14_10)].name .. "</color>")
					end

					setText(arg_14_2:Find("playerReplyCard/systemTip/panel/Text"), var_14_9)
				end

				if arg_11_3 and var_11_0 and _.contains(var_11_1, arg_14_1 + 1) then
					if table.indexof(var_11_1, arg_14_1 + 1) < #var_11_1 then
						SetActive(arg_14_2, false)
						arg_11_0:StartTimer(function()
							SetActive(arg_14_2, true)

							if var_14_0.type == 1 then
								arg_14_2:Find("playerReplyCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_playerchat_common_in")
								arg_11_0:ChangeCharaTextFunc(arg_11_4, var_14_0.param)
							elseif var_14_0.type == 4 then
								arg_14_2:Find("playerReplyCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

								local var_31_0 = var_0_3[tonumber(var_14_0.param)].desc
								local var_31_1 = string.gsub(var_31_0, "#%w+>", "#28af6e>")

								arg_11_0:ChangeCharaTextFunc(arg_11_4, var_31_1)
							elseif var_14_0.type == 5 then
								arg_14_2:Find("playerReplyCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")

								local var_31_2 = var_14_0.param

								for iter_31_0 in string.gmatch(var_14_0.param, "'%d+'") do
									local var_31_3 = string.sub(iter_31_0, 2, #iter_31_0 - 1)

									var_31_2 = string.gsub(var_31_2, iter_31_0, "<color=#93e9ff>" .. var_0_1[tonumber(var_31_3)].name .. "</color>")
								end

								arg_11_0:ChangeCharaTextFunc(arg_11_4, var_31_2)
							end

							if arg_14_1 + 1 == #arg_11_2 then
								arg_11_0:emit(InstagramChatMediator.SET_READED, {
									arg_11_1.topicId
								})
							end

							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
						end, (#var_11_1 - table.indexof(var_11_1, arg_14_1 + 1)) * var_11_6)
					else
						if var_14_0.type == 1 then
							arg_14_2:Find("playerReplyCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_playerchat_common_in")
							arg_11_0:ChangeCharaTextFunc(arg_11_4, var_14_0.param)
						elseif var_14_0.type == 4 then
							arg_14_2:Find("playerReplyCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

							local var_14_11 = var_0_3[tonumber(var_14_0.param)].desc
							local var_14_12 = string.gsub(var_14_11, "#%w+>", "#28af6e>")

							arg_11_0:ChangeCharaTextFunc(arg_11_4, var_14_12)
						elseif var_14_0.type == 5 then
							arg_14_2:Find("playerReplyCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")

							local var_14_13 = var_14_0.param

							for iter_14_2 in string.gmatch(var_14_0.param, "'%d+'") do
								local var_14_14 = string.sub(iter_14_2, 2, #iter_14_2 - 1)

								var_14_13 = string.gsub(var_14_13, iter_14_2, "<color=#93e9ff>" .. var_0_1[tonumber(var_14_14)].name .. "</color>")
							end

							arg_11_0:ChangeCharaTextFunc(arg_11_4, var_14_13)
						end

						if arg_14_1 + 1 == #arg_11_2 then
							arg_11_0:emit(InstagramChatMediator.SET_READED, {
								arg_11_1.topicId
							})
						end
					end
				end
			end

			if not arg_11_1:isWaiting() and arg_14_1 + 1 == #arg_11_2 then
				if arg_11_3 then
					if var_14_0.ship_group ~= 0 then
						arg_11_0:StartTimer(function()
							setActive(arg_14_2:Find("end"), true)
						end, var_14_3 + var_11_4)
					else
						arg_11_0:StartTimer(function()
							setActive(arg_14_2:Find("end"), true)
						end, (#var_11_1 - table.indexof(var_11_1, arg_14_1 + 1)) * var_11_6 + var_11_6)
					end
				else
					setActive(arg_14_2:Find("end"), true)
				end
			else
				setActive(arg_14_2:Find("end"), false)
			end
		end
	end)
	arg_11_0.messageList:align(#arg_11_2)

	if arg_11_3 then
		Canvas.ForceUpdateCanvases()
		LeanTween.value(go(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel)), var_11_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_11_3)):setEase(LeanTweenType.easeInOutCubic)
	else
		scrollToBottom(arg_11_0:findTF("messageScroll", arg_11_0.rightPanel))
	end
end

function var_0_0.SetCharaMessageCardActive(arg_34_0, arg_34_1, arg_34_2)
	if _.contains(arg_34_2, 6) then
		SetActive(arg_34_1:GetChild(0), false)
	else
		SetActive(arg_34_1:GetChild(0), true)
	end

	for iter_34_0 = 1, arg_34_1.childCount - 1 do
		if _.contains(arg_34_2, iter_34_0) then
			SetActive(arg_34_1:GetChild(iter_34_0), true)
		else
			SetActive(arg_34_1:GetChild(iter_34_0), false)
		end
	end
end

function var_0_0.SetPlayerMessageCardActive(arg_35_0, arg_35_1, arg_35_2)
	for iter_35_0 = 0, arg_35_1.childCount - 1 do
		if _.contains(arg_35_2, iter_35_0) then
			SetActive(arg_35_1:GetChild(iter_35_0), true)
		else
			SetActive(arg_35_1:GetChild(iter_35_0), false)
		end
	end
end

function var_0_0.SetEmoji(arg_36_0, arg_36_1, arg_36_2)
	PoolMgr.GetInstance():GetPrefab("emoji/" .. arg_36_2, arg_36_2, true, function(arg_37_0)
		if not IsNil(arg_36_1) then
			arg_37_0.name = arg_36_2
			tf(arg_37_0).sizeDelta = arg_36_1.sizeDelta
			tf(arg_37_0).anchoredPosition = Vector2.zero

			local var_37_0 = arg_37_0:GetComponent("Animator")

			if var_37_0 then
				var_37_0.enabled = true
			end

			setParent(arg_37_0, arg_36_1, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. arg_36_2, arg_36_2, arg_37_0)
		end
	end)
end

function var_0_0.ClearEmoji(arg_38_0, arg_38_1)
	eachChild(arg_38_1, function(arg_39_0)
		local var_39_0 = go(arg_39_0)

		PoolMgr.GetInstance():ReturnPrefab("emoji/" .. var_39_0.name, var_39_0.name, var_39_0)
	end)
end

function var_0_0.UpdateOptionPanel(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_2[#arg_40_2].option

	if var_40_0 and type(var_40_0) == "table" then
		arg_40_0.shouldShowOption = true
		arg_40_0.optionCount = #var_40_0

		arg_40_0:SetOptionPanelActive(true)
		arg_40_0.optionList:make(function(arg_41_0, arg_41_1, arg_41_2)
			if arg_41_0 == UIItemList.EventUpdate then
				local var_41_0 = var_40_0[arg_41_1 + 1]

				setText(arg_41_2:Find("Text"), HXSet.hxLan(var_41_0[2]))
				onButton(arg_40_0, arg_41_2, function()
					arg_40_0:emit(InstagramChatMediator.REPLY, arg_40_1.topicId, arg_40_2[#arg_40_2].id, var_41_0[1])
				end, SFX_PANEL)
			end
		end)
		arg_40_0.optionList:align(#var_40_0)
	else
		arg_40_0:SetOptionPanelActive(false)

		arg_40_0.shouldShowOption = false
	end
end

function var_0_0.SetOptionPanelActive(arg_43_0, arg_43_1)
	SetActive(arg_43_0.optionPanel, arg_43_1)

	local var_43_0 = arg_43_0:findTF("messageScroll/Viewport/Content", arg_43_0.rightPanel):GetComponent(typeof(VerticalLayoutGroup))
	local var_43_1 = UnityEngine.RectOffset.New()

	var_43_1.left = 0
	var_43_1.right = 0
	var_43_1.top = 0

	local var_43_2 = arg_43_0:findTF("messageScroll/Scrollbar Vertical", arg_43_0.rightPanel):GetComponent(typeof(RectTransform))

	if arg_43_1 then
		var_43_1.bottom = 42 + 88 * arg_43_0.optionCount
		var_43_2.sizeDelta = Vector2(arg_43_0.messageScrollWidth, -var_43_1.bottom)
	else
		var_43_1.bottom = 50
		var_43_2.sizeDelta = Vector2(arg_43_0.messageScrollWidth, 0)
	end

	var_43_0.padding = var_43_1

	scrollToBottom(arg_43_0:findTF("messageScroll", arg_43_0.rightPanel))
end

function var_0_0.SetFilterPanel(arg_44_0)
	arg_44_0.readFilter = arg_44_0.readFilter or var_0_0.ReadType[1]
	arg_44_0.typeFilter = arg_44_0.typeFilter or var_0_0.TypeType[1]
	arg_44_0.campFilter = arg_44_0.campFilter or {
		var_0_0.CampIds[1]
	}

	local var_44_0 = arg_44_0:findTF("panel/filterScroll/Viewport/Content/read", arg_44_0.filterUI)
	local var_44_1 = arg_44_0:findTF("panel/filterScroll/Viewport/Content/type", arg_44_0.filterUI)
	local var_44_2 = arg_44_0:findTF("panel/filterScroll/Viewport/Content/camp", arg_44_0.filterUI)
	local var_44_3 = UIItemList.New(var_44_2, arg_44_0:findTF("option", var_44_2))

	onButton(arg_44_0, arg_44_0.filterBtn, function()
		SetActive(arg_44_0.filterUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_44_0.filterUI)

		for iter_45_0, iter_45_1 in ipairs(var_0_0.ReadType) do
			local var_45_0 = var_44_0:GetChild(iter_45_0)
			local var_45_1 = arg_44_0:findTF("selectedFrame", var_45_0)

			SetActive(var_45_1, arg_44_0.readFilter == iter_45_1)
			onButton(arg_44_0, var_45_0, function()
				for iter_46_0, iter_46_1 in ipairs(var_0_0.ReadType) do
					SetActive(arg_44_0:findTF("selectedFrame", var_44_0:GetChild(iter_46_0)), false)
				end

				SetActive(var_45_1, true)
			end, SFX_PANEL)
		end

		for iter_45_2, iter_45_3 in ipairs(var_0_0.TypeType) do
			local var_45_2 = var_44_1:GetChild(iter_45_2)
			local var_45_3 = arg_44_0:findTF("selectedFrame", var_45_2)

			SetActive(var_45_3, arg_44_0.typeFilter == iter_45_3)
			onButton(arg_44_0, var_45_2, function()
				for iter_47_0, iter_47_1 in ipairs(var_0_0.TypeType) do
					SetActive(arg_44_0:findTF("selectedFrame", var_44_1:GetChild(iter_47_0)), false)
				end

				SetActive(var_45_3, true)
			end, SFX_PANEL)
		end

		var_44_3:make(function(arg_48_0, arg_48_1, arg_48_2)
			if arg_48_0 == UIItemList.EventUpdate then
				setText(arg_48_2:Find("Text"), i18n(var_0_0.CampNames[arg_48_1 + 1]))

				local var_48_0 = arg_48_2:Find("selectedFrame")

				SetActive(var_48_0, _.contains(arg_44_0.campFilter, var_0_0.CampIds[arg_48_1 + 1]))
				onButton(arg_44_0, arg_48_2, function()
					if arg_48_1 == 0 then
						SetActive(var_48_0, true)

						for iter_49_0 = 2, #var_0_0.CampIds do
							SetActive(arg_44_0:findTF("selectedFrame", var_44_2:GetChild(iter_49_0 - 1)), false)
						end
					else
						SetActive(var_48_0, not isActive(var_48_0))

						local var_49_0 = true
						local var_49_1 = true

						for iter_49_1 = 2, #var_0_0.CampIds do
							if not isActive(arg_44_0:findTF("selectedFrame", var_44_2:GetChild(iter_49_1 - 1))) then
								var_49_0 = false
							end

							if isActive(arg_44_0:findTF("selectedFrame", var_44_2:GetChild(iter_49_1 - 1))) then
								var_49_1 = false
							end
						end

						if var_49_0 then
							SetActive(arg_44_0:findTF("selectedFrame", var_44_2:GetChild(0)), true)

							for iter_49_2 = 2, #var_0_0.CampIds do
								SetActive(arg_44_0:findTF("selectedFrame", var_44_2:GetChild(iter_49_2 - 1)), false)
							end
						elseif var_49_1 then
							SetActive(arg_44_0:findTF("selectedFrame", var_44_2:GetChild(0)), true)
						else
							SetActive(arg_44_0:findTF("selectedFrame", var_44_2:GetChild(0)), false)
						end
					end
				end, SFX_PANEL)
			end
		end)
		var_44_3:align(#var_0_0.CampIds)
	end, SFX_PANEL)
	onButton(arg_44_0, arg_44_0:findTF("bg", arg_44_0.filterUI), function()
		arg_44_0:CloseFilterPanel()
	end, SFX_PANEL)
	onButton(arg_44_0, arg_44_0:findTF("panel/bottom/close", arg_44_0.filterUI), function()
		arg_44_0:CloseFilterPanel()
	end, SFX_PANEL)
	onButton(arg_44_0, arg_44_0:findTF("panel/bottom/ok", arg_44_0.filterUI), function()
		for iter_52_0, iter_52_1 in ipairs(var_0_0.ReadType) do
			local var_52_0 = var_44_0:GetChild(iter_52_0)
			local var_52_1 = arg_44_0:findTF("selectedFrame", var_52_0)

			if isActive(var_52_1) then
				arg_44_0.readFilter = iter_52_1
			end
		end

		for iter_52_2, iter_52_3 in ipairs(var_0_0.TypeType) do
			local var_52_2 = var_44_1:GetChild(iter_52_2)
			local var_52_3 = arg_44_0:findTF("selectedFrame", var_52_2)

			if isActive(var_52_3) then
				arg_44_0.typeFilter = iter_52_3
			end
		end

		arg_44_0.campFilter = {}

		for iter_52_4, iter_52_5 in ipairs(var_0_0.CampIds) do
			local var_52_4 = var_44_2:GetChild(iter_52_4 - 1)
			local var_52_5 = arg_44_0:findTF("selectedFrame", var_52_4)

			if isActive(var_52_5) then
				table.insert(arg_44_0.campFilter, iter_52_5)
			end
		end

		arg_44_0:CloseFilterPanel()
		arg_44_0:SetFilterResult()
	end, SFX_PANEL)
end

function var_0_0.SetFilterResult(arg_53_0)
	local var_53_0 = true
	local var_53_1 = false

	if not arg_53_0.readFilter then
		arg_53_0.readFilter = var_0_0.ReadType[1]
		arg_53_0.typeFilter = var_0_0.TypeType[1]
		arg_53_0.campFilter = {
			var_0_0.CampIds[1]
		}
	end

	for iter_53_0, iter_53_1 in ipairs(arg_53_0.chatList) do
		local var_53_2 = true

		if arg_53_0.readFilter ~= "all" then
			local var_53_3 = arg_53_0.readFilter == "hasReaded" and 1 or 0

			if iter_53_1:GetCharacterEndFlag() ~= var_53_3 then
				var_53_2 = false
			end
		end

		if arg_53_0.typeFilter ~= "all" then
			local var_53_4 = arg_53_0.typeFilter == "single" and 1 or 2

			if iter_53_1.type ~= var_53_4 then
				var_53_2 = false
			end
		end

		if not _.contains(arg_53_0.campFilter, 0) and not _.contains(arg_53_0.campFilter, iter_53_1.nationality) then
			var_53_2 = false
		end

		SetActive(arg_53_0:findTF("main/leftPanel/charaScroll/Viewport/Content"):GetChild(iter_53_0 - 1), var_53_2)

		if var_53_2 then
			var_53_0 = false
		end

		if arg_53_0.currentChat and arg_53_0.currentChat.characterId == iter_53_1.characterId and var_53_2 then
			var_53_1 = true
		end
	end

	local var_53_5 = arg_53_0.readFilter == "all" and arg_53_0.typeFilter == "all" and _.contains(arg_53_0.campFilter, 0)

	SetActive(arg_53_0.isFiltered, not var_53_5)

	if var_53_0 then
		SetActive(arg_53_0:findTF("charaScroll", arg_53_0.leftPanel), false)
		SetActive(arg_53_0:findTF("main/noFilteredMessageBg"), true)
		SetActive(arg_53_0.rightPanel, false)
		SetActive(arg_53_0:findTF("main/rightNoMessageBg"), false)
	else
		SetActive(arg_53_0:findTF("charaScroll", arg_53_0.leftPanel), true)
		SetActive(arg_53_0:findTF("main/noFilteredMessageBg"), false)

		if var_53_1 then
			SetActive(arg_53_0.rightPanel, true)
			SetActive(arg_53_0:findTF("main/rightNoMessageBg"), false)
		else
			SetActive(arg_53_0.rightPanel, false)
			SetActive(arg_53_0:findTF("main/rightNoMessageBg"), true)

			arg_53_0.currentChat = nil

			if arg_53_0.cancelFrame then
				arg_53_0.cancelFrame()

				arg_53_0.cancelFrame = nil
			end
		end
	end
end

function var_0_0.CloseFilterPanel(arg_54_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_54_0.filterUI, arg_54_0:findTF("subPages"))
	SetActive(arg_54_0.filterUI, false)
end

function var_0_0.SetTopicPanel(arg_55_0, arg_55_1)
	SetActive(arg_55_0:findTF("tip", arg_55_0.topicBtn), arg_55_1:GetCharacterEndFlagExceptCurrent() == 0)
	onButton(arg_55_0, arg_55_0.topicBtn, function()
		SetActive(arg_55_0.topicUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_55_0.topicUI)

		arg_55_0.currentTopic = nil

		local var_56_0 = UIItemList.New(arg_55_0:findTF("panel/topicScroll/Viewport/Content", arg_55_0.topicUI), arg_55_0:findTF("panel/topicScroll/Viewport/Content/topic", arg_55_0.topicUI))

		var_56_0:make(function(arg_57_0, arg_57_1, arg_57_2)
			if arg_57_0 == UIItemList.EventUpdate then
				arg_55_1:SortTopicList()

				local var_57_0 = arg_55_1.topics[arg_57_1 + 1]

				setScrollText(arg_57_2:Find("mask/name"), HXSet.hxLan(var_57_0.name))
				SetActive(arg_57_2:Find("lock"), not var_57_0.active)
				SetActive(arg_57_2:Find("waiting"), var_57_0.active and var_57_0:isWaiting())
				SetActive(arg_57_2:Find("complete"), var_57_0.active and var_57_0:IsCompleted())
				SetActive(arg_57_2:Find("selectedFrame"), arg_55_1.currentTopicId == var_57_0.topicId)
				SetActive(arg_57_2:Find("selected"), arg_55_1.currentTopicId == var_57_0.topicId)
				SetActive(arg_57_2:Find("tip"), var_57_0.active and not var_57_0:IsCompleted())

				if arg_55_1.currentTopicId == var_57_0.topicId then
					arg_55_0.currentTopic = var_57_0
				end

				SetActive(arg_57_2, var_57_0.active)

				if var_57_0.active then
					onButton(arg_55_0, arg_57_2, function()
						SetActive(arg_57_2:Find("selectedFrame"), true)

						for iter_58_0 = 1, #arg_55_1.topics do
							if iter_58_0 ~= arg_57_1 + 1 then
								SetActive(arg_55_0:findTF("selectedFrame", arg_55_0:findTF("panel/topicScroll/Viewport/Content", arg_55_0.topicUI):GetChild(iter_58_0 - 1)), false)
							end
						end

						arg_55_0.currentTopic = var_57_0
					end, SFX_PANEL)
				else
					onButton(arg_55_0, arg_57_2, function()
						pg.TipsMgr.GetInstance():ShowTips(var_57_0.unlockDesc)
					end, SFX_PANEL)
				end
			end
		end)
		var_56_0:align(#arg_55_1.topics)
	end, SFX_PANEL)
	onButton(arg_55_0, arg_55_0:findTF("bg", arg_55_0.topicUI), function()
		arg_55_0:CloseTopicPanel()
	end, SFX_PANEL)
	onButton(arg_55_0, arg_55_0:findTF("panel/bottom/close", arg_55_0.topicUI), function()
		arg_55_0:CloseTopicPanel()
	end, SFX_PANEL)
	onButton(arg_55_0, arg_55_0:findTF("panel/bottom/ok", arg_55_0.topicUI), function()
		arg_55_0:emit(InstagramChatMediator.SET_CURRENT_TOPIC, arg_55_0.currentTopic.topicId)
		arg_55_0:CloseTopicPanel()

		local var_62_0 = arg_55_0.rightPanel:GetComponent(typeof(Animation))

		var_62_0:Stop()
		var_62_0:Play("anim_newinstagram_chat_right_in")
	end, SFX_PANEL)
end

function var_0_0.CloseTopicPanel(arg_63_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_63_0.topicUI, arg_63_0:findTF("subPages"))
	SetActive(arg_63_0.topicUI, false)
end

function var_0_0.SetBackgroundPanel(arg_64_0, arg_64_1)
	if arg_64_1.type == 2 then
		SetActive(arg_64_0.backgroundBtn, false)

		return
	end

	SetActive(arg_64_0.backgroundBtn, true)

	local var_64_0 = arg_64_1:GetPaintingId()

	onButton(arg_64_0, arg_64_0.backgroundBtn, function()
		SetActive(arg_64_0.backgroundUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_64_0.backgroundUI)

		arg_64_0.currentBgId = nil

		local var_65_0 = UIItemList.New(arg_64_0:findTF("panel/backgroundScroll/Viewport/Content", arg_64_0.backgroundUI), arg_64_0:findTF("panel/backgroundScroll/Viewport/Content/background", arg_64_0.backgroundUI))

		var_65_0:make(function(arg_66_0, arg_66_1, arg_66_2)
			if arg_66_0 == UIItemList.EventUpdate then
				local var_66_0 = arg_64_1.skins[arg_66_1 + 1]
				local var_66_1 = 0

				if var_66_0.id ~= var_64_0 then
					var_66_1 = var_66_0.id
				end

				local var_66_2 = var_66_0.painting

				LoadImageSpriteAsync("herohrzicon/" .. var_66_2, arg_66_2:Find("skinMask/skin"), false)
				setScrollText(arg_66_2:Find("skinMask/Panel/mask/Text"), var_66_0.name)

				local var_66_3 = getProxy(ShipSkinProxy):hasSkin(var_66_0.id) or var_66_0.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or var_66_0.skin_type == ShipSkin.SKIN_TYPE_PROPOSE or var_66_0.skin_type == ShipSkin.SKIN_TYPE_REMAKE

				SetActive(arg_66_2:Find("lockFrame"), not var_66_3)
				SetActive(arg_66_2:Find("selectedFrame"), arg_64_1.skinId == var_66_1)
				SetActive(arg_66_2:Find("selected"), arg_64_1.skinId == var_66_1)

				if arg_64_1.skinId == var_66_1 then
					arg_64_0.currentBgId = var_66_1
				end

				onButton(arg_64_0, arg_66_2, function()
					if var_66_3 then
						SetActive(arg_66_2:Find("selectedFrame"), true)

						for iter_67_0 = 1, #arg_64_1.skins do
							if iter_67_0 ~= arg_66_1 + 1 then
								local var_67_0 = arg_64_0:findTF("panel/backgroundScroll/Viewport/Content", arg_64_0.backgroundUI):GetChild(iter_67_0 - 1)

								SetActive(arg_64_0:findTF("selectedFrame", var_67_0), false)
							end
						end

						arg_64_0.currentBgId = var_66_1
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("juuschat_background_tip2"))
					end
				end, SFX_PANEL)
			end
		end)
		var_65_0:align(#arg_64_1.skins)
	end, SFX_PANEL)
	onButton(arg_64_0, arg_64_0:findTF("bg", arg_64_0.backgroundUI), function()
		arg_64_0:CloseBackgroundPanel()
	end, SFX_PANEL)
	onButton(arg_64_0, arg_64_0:findTF("panel/bottom/close", arg_64_0.backgroundUI), function()
		arg_64_0:CloseBackgroundPanel()
	end, SFX_PANEL)
	onButton(arg_64_0, arg_64_0:findTF("panel/bottom/ok", arg_64_0.backgroundUI), function()
		arg_64_0:emit(InstagramChatMediator.SET_CURRENT_BACKGROUND, arg_64_1.characterId, arg_64_0.currentBgId)
		arg_64_0:CloseBackgroundPanel()
	end, SFX_PANEL)
end

function var_0_0.CloseBackgroundPanel(arg_71_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_71_0.backgroundUI, arg_71_0:findTF("subPages"))
	SetActive(arg_71_0.backgroundUI, false)
end

function var_0_0.SetRedPacketPanel(arg_72_0, arg_72_1, arg_72_2, arg_72_3, arg_72_4, arg_72_5, arg_72_6)
	onButton(arg_72_0, arg_72_1, function()
		SetActive(arg_72_0.redPacketUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_72_0.redPacketUI)
		setImageSprite(arg_72_0:findTF("panel/charaBg/chara", arg_72_0.redPacketUI), LoadSprite("qicon/" .. arg_72_4), false)

		if not arg_72_3 then
			SetActive(arg_72_0:findTF("panel/panelBg", arg_72_0.redPacketUI), true)
			SetActive(arg_72_0:findTF("panel/openImg", arg_72_0.redPacketUI), false)
			SetActive(arg_72_0:findTF("panel/get", arg_72_0.redPacketUI), true)
			SetActive(arg_72_0:findTF("panel/got", arg_72_0.redPacketUI), false)
			SetActive(arg_72_0:findTF("panel/detail", arg_72_0.redPacketUI), false)
			setText(arg_72_0:findTF("panel/get/titleBg/title", arg_72_0.redPacketUI), arg_72_2.desc)
			onButton(arg_72_0, arg_72_0:findTF("panel/get/getBtn", arg_72_0.redPacketUI), function()
				arg_72_0:emit(InstagramChatMediator.GET_REDPACKET, arg_72_5, arg_72_6, arg_72_2.id)
			end, SFX_PANEL)
		else
			arg_72_0:UpdateRedPacketUI(arg_72_2.id)
		end
	end, SFX_PANEL)
	onButton(arg_72_0, arg_72_0:findTF("bg", arg_72_0.redPacketUI), function()
		arg_72_0:CloseRedPacketPanel()

		if arg_72_0.canFresh then
			arg_72_0.canFresh = false

			local var_75_0 = arg_72_0.currentChat.currentTopic:GetDisplayWordList()

			if var_75_0[#var_75_0].type == 0 then
				arg_72_0:UpdateCharaList(false, false)
			else
				arg_72_0:UpdateCharaList(true, false)
			end
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateRedPacketUI(arg_76_0, arg_76_1)
	local var_76_0 = var_0_2[arg_76_1]

	SetActive(arg_76_0:findTF("panel/panelBg", arg_76_0.redPacketUI), true)
	SetActive(arg_76_0:findTF("panel/openImg", arg_76_0.redPacketUI), false)
	SetActive(arg_76_0:findTF("panel/get", arg_76_0.redPacketUI), false)
	SetActive(arg_76_0:findTF("panel/got", arg_76_0.redPacketUI), true)
	SetActive(arg_76_0:findTF("panel/detail", arg_76_0.redPacketUI), false)

	local var_76_1 = Drop.Create(var_76_0.content)

	var_76_1.count = 0

	updateDrop(arg_76_0:findTF("panel/got/item", arg_76_0.redPacketUI), var_76_1)
	onButton(arg_76_0, arg_76_0:findTF("panel/got/item", arg_76_0.redPacketUI), function()
		arg_76_0:emit(BaseUI.ON_DROP, var_76_1)
	end, SFX_PANEL)

	arg_76_0:findTF("panel/got/item/icon_bg", arg_76_0.redPacketUI):GetComponent(typeof(Image)).enabled = false
	arg_76_0:findTF("panel/got/item/icon_bg/frame", arg_76_0.redPacketUI):GetComponent(typeof(Image)).enabled = false

	setText(arg_76_0:findTF("panel/got/awardCount", arg_76_0.redPacketUI), var_76_0.content[3])

	if var_76_0.type == 1 then
		SetActive(arg_76_0:findTF("panel/got/detailBtn", arg_76_0.redPacketUI), false)
	else
		SetActive(arg_76_0:findTF("panel/got/detailBtn", arg_76_0.redPacketUI), true)
		onButton(arg_76_0, arg_76_0:findTF("panel/got/detailBtn", arg_76_0.redPacketUI), function()
			SetActive(arg_76_0:findTF("panel/panelBg", arg_76_0.redPacketUI), false)
			SetActive(arg_76_0:findTF("panel/openImg", arg_76_0.redPacketUI), true)
			SetActive(arg_76_0:findTF("panel/got", arg_76_0.redPacketUI), false)
			SetActive(arg_76_0:findTF("panel/detail", arg_76_0.redPacketUI), true)

			local var_78_0 = 0
			local var_78_1 = 0
			local var_78_2 = UIItemList.New(arg_76_0:findTF("panel/detail/detailScroll/Viewport/Content", arg_76_0.redPacketUI), arg_76_0:findTF("panel/detail/detailScroll/Viewport/Content/charaGetCard", arg_76_0.redPacketUI))

			var_78_2:make(function(arg_79_0, arg_79_1, arg_79_2)
				if arg_79_0 == UIItemList.EventUpdate then
					local var_79_0 = var_76_0.group_receive[arg_79_1 + 1]
					local var_79_1 = var_79_0[1]
					local var_79_2 = {
						var_79_0[2],
						var_79_0[3],
						var_79_0[4]
					}

					if var_79_0[1] ~= 0 then
						local var_79_3 = "unknown"

						if var_0_1[var_79_1] then
							var_79_3 = var_0_1[var_79_1].sculpture
						end

						setImageSprite(arg_79_2:Find("charaBg/chara"), LoadSprite("qicon/" .. var_79_3), false)
					else
						setImageSprite(arg_79_2:Find("charaBg/chara"), GetSpriteFromAtlas("ui/InstagramUI_atlas", "txdi_3"), false)
					end

					local var_79_4 = Drop.Create(var_79_2)

					var_79_4.count = 0

					updateDrop(arg_79_2:Find("item"), var_79_4)
					onButton(arg_76_0, arg_79_2:Find("item"), function()
						arg_76_0:emit(BaseUI.ON_DROP, var_79_4)
					end, SFX_PANEL)

					arg_79_2:Find("item/icon_bg"):GetComponent(typeof(Image)).enabled = false
					arg_79_2:Find("item/icon_bg/frame"):GetComponent(typeof(Image)).enabled = false

					setText(arg_79_2:Find("awardCount"), var_79_0[4])

					if var_79_0[4] > var_78_1 then
						var_78_0 = arg_79_1
						var_78_1 = var_79_0[4]
					end
				end
			end)
			var_78_2:align(#var_76_0.group_receive)

			for iter_78_0 = 1, #var_76_0.group_receive do
				SetActive(arg_76_0:findTF("charaBg/king", arg_76_0:findTF("panel/detail/detailScroll/Viewport/Content", arg_76_0.redPacketUI):GetChild(iter_78_0 - 1)), var_78_0 == iter_78_0 - 1)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.CloseRedPacketPanel(arg_81_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_81_0.redPacketUI, arg_81_0:findTF("subPages"))
	SetActive(arg_81_0.redPacketUI, false)
end

function var_0_0.SetData(arg_82_0)
	local var_82_0 = getProxy(InstagramChatProxy)

	arg_82_0.chatList = var_82_0:GetChatList()

	var_82_0:SortChatList()
end

function var_0_0.willExit(arg_83_0)
	local var_83_0 = arg_83_0:findTF("paintingMask/painting", arg_83_0.rightPanel)

	if arg_83_0.paintingName then
		retPaintingPrefab(var_83_0, arg_83_0.paintingName)

		arg_83_0.paintingName = nil
	end

	arg_83_0:RemoveAllTimer()
end

function var_0_0.StartTimer(arg_84_0, arg_84_1, arg_84_2)
	local var_84_0 = Timer.New(arg_84_1, arg_84_2, 1)

	var_84_0:Start()
	table.insert(arg_84_0.timerList, var_84_0)
end

function var_0_0.RemoveAllTimer(arg_85_0)
	for iter_85_0, iter_85_1 in ipairs(arg_85_0.timerList) do
		iter_85_1:Stop()
	end

	arg_85_0.timerList = {}
end

function var_0_0.StartTimer2(arg_86_0, arg_86_1, arg_86_2)
	arg_86_0.timer = Timer.New(arg_86_1, arg_86_2, 1)

	arg_86_0.timer:Start()
end

function var_0_0.SpeedUpMessage(arg_87_0)
	local var_87_0 = pg.gameset.juuschat_dialogue_trigger_time.key_value / 1000
	local var_87_1 = pg.gameset.juuschat_entering_time.key_value / 1000

	for iter_87_0, iter_87_1 in ipairs(arg_87_0.timerList) do
		if iter_87_1.running then
			if iter_87_1.duration == var_87_1 then
				iter_87_1.time = 0.05
			elseif iter_87_1.time - var_87_0 < 0.05 then
				iter_87_1.time = 0.05

				arg_87_0:StartTimer2(function()
					arg_87_0:SpeedUpWaiting()
				end, 0.05)
			else
				iter_87_1.time = iter_87_1.time - var_87_0
			end
		end
	end
end

function var_0_0.SpeedUpWaiting(arg_89_0)
	local var_89_0 = pg.gameset.juuschat_entering_time.key_value / 1000

	for iter_89_0, iter_89_1 in ipairs(arg_89_0.timerList) do
		if iter_89_1.running and iter_89_1.duration == var_89_0 then
			iter_89_1.time = 0.05

			break
		end
	end
end

function var_0_0.ChangeFresh(arg_90_0)
	arg_90_0.canFresh = true
end

function var_0_0.ChangeCharaTextFunc(arg_91_0, arg_91_1, arg_91_2)
	local function var_91_0(arg_92_0, arg_92_1)
		if arg_92_1:Find("id"):GetComponent(typeof(Text)).text == tostring(arg_91_1) then
			setText(arg_92_1:Find("msg"), arg_91_2)
		end
	end

	arg_91_0.charaList:each(var_91_0)
end

function var_0_0.ResetCharaTextFunc(arg_93_0, arg_93_1)
	local function var_93_0(arg_94_0, arg_94_1)
		if arg_94_1:Find("id"):GetComponent(typeof(Text)).text == tostring(arg_93_1) then
			setText(arg_94_1:Find("msg"), arg_94_1:Find("displayWord"):GetComponent(typeof(Text)).text)
		end
	end

	arg_93_0.charaList:each(var_93_0)
end

function var_0_0.SetEndAniEvent(arg_95_0, arg_95_1, arg_95_2)
	local var_95_0 = arg_95_1:GetComponent(typeof(DftAniEvent))

	if var_95_0 then
		var_95_0:SetEndEvent(function()
			arg_95_2()
			var_95_0:SetEndEvent(nil)
		end)
	end
end

function var_0_0.onBackPressed(arg_97_0)
	if isActive(arg_97_0.filterUI) then
		arg_97_0:CloseFilterPanel()

		return
	end

	if isActive(arg_97_0.topicUI) then
		arg_97_0:CloseTopicPanel()

		return
	end

	if isActive(arg_97_0.backgroundUI) then
		arg_97_0:CloseBackgroundPanel()

		return
	end

	if isActive(arg_97_0.redPacketUI) then
		arg_97_0:CloseRedPacketPanel()

		return
	end

	arg_97_0:emit(InstagramChatMediator.CLOSE_ALL)
end

return var_0_0
