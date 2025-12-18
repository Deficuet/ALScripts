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
	arg_3_0.leftPanel = arg_3_0._tf:Find("main/leftPanel")
	arg_3_0.filterBtn = arg_3_0.leftPanel:Find("leftTop/filter")
	arg_3_0.isFiltered = arg_3_0.filterBtn:Find("isFiltered")
	arg_3_0.charaScrollrect = arg_3_0.leftPanel:Find("charaScroll"):GetComponent("LScrollRect")
	arg_3_0.charaScrollContent = arg_3_0.leftPanel:Find("charaScroll/Viewport/Content")
	arg_3_0.rightPanel = arg_3_0._tf:Find("main/rightPanel")
	arg_3_0.characterName = arg_3_0.rightPanel:Find("rightTop/name")
	arg_3_0.careBtn = arg_3_0.rightPanel:Find("rightTop/careBtn")
	arg_3_0.topicBtn = arg_3_0.rightPanel:Find("rightTop/topicBtn")
	arg_3_0.backgroundBtn = arg_3_0.rightPanel:Find("rightTop/backgroundBtn")
	arg_3_0.messageList = UIItemList.New(arg_3_0.rightPanel:Find("messageScroll/Viewport/Content"), arg_3_0.rightPanel:Find("messageScroll/Viewport/Content/messageCard"))
	arg_3_0.optionPanel = arg_3_0.rightPanel:Find("optionPanel")
	arg_3_0.optionList = UIItemList.New(arg_3_0.optionPanel, arg_3_0.optionPanel:Find("option"))
	arg_3_0.filterUI = arg_3_0._tf:Find("subPages/InstagramFilterUI")
	arg_3_0.topicUI = arg_3_0._tf:Find("subPages/InstagramTopicUI")
	arg_3_0.backgroundUI = arg_3_0._tf:Find("subPages/InstagramBackgroundUI")
	arg_3_0.redPacketUI = arg_3_0._tf:Find("subPages/InstagramRedPacketUI")

	setText(arg_3_0.filterBtn:Find("Text"), i18n("juuschat_filter_title"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/read/subTitleFrame/subTitle"), i18n("juuschat_filter_subtitle1"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/type/subTitleFrame/subTitle"), i18n("juuschat_filter_subtitle2"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/subTitleFrame/subTitle"), i18n("juuschat_filter_subtitle3"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/read/option/Text"), i18n("juuschat_filter_tip1"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/read/option_1/Text"), i18n("juuschat_filter_tip2"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/read/option_2/Text"), i18n("juuschat_filter_tip3"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/type/option/Text"), i18n("juuschat_filter_tip1"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/type/option_1/Text"), i18n("juuschat_filter_tip4"))
	setText(arg_3_0.filterUI:Find("panel/filterScroll/Viewport/Content/type/option_2/Text"), i18n("juuschat_filter_tip5"))
	setText(arg_3_0.topicUI:Find("panel/topicScroll/Viewport/Content/self/topic/waiting"), i18n("juuschat_chattip3"))
	setText(arg_3_0.topicUI:Find("panel/topicScroll/Viewport/Content/self/topic/selected/Text"), i18n("juuschat_label2"))
	setText(arg_3_0.topicUI:Find("panel/topicScroll/Viewport/Content/other/topic/waiting"), i18n("juuschat_chattip3"))
	setText(arg_3_0.topicUI:Find("panel/topicScroll/Viewport/Content/other/topic/selected/Text"), i18n("juuschat_label2"))
	setText(arg_3_0.backgroundUI:Find("panel/backgroundScroll/Viewport/Content/background/selected/Text"), i18n("juuschat_label1"))
	setText(arg_3_0.redPacketUI:Find("panel/got/detailBtn/Text"), i18n("juuschat_redpacket_show_detail"))
	setText(arg_3_0.redPacketUI:Find("panel/detail/title"), i18n("juuschat_redpacket_detail"))
	setText(arg_3_0._tf:Find("main/noFilteredMessageBg/Text"), i18n("juuschat_filter_empty"))
	setText(arg_3_0.backgroundUI:Find("panel/backgroundScroll/Viewport/Content/background/lockFrame/Text"), i18n("juuschat_background_tip1"))

	arg_3_0.redPacketGot = arg_3_0.redPacketUI:Find("panel/got")

	arg_3_0:OverlayPanel(arg_3_0._tf)
	SetActive(arg_3_0.filterUI, false)
	SetActive(arg_3_0.isFiltered, false)
	SetActive(arg_3_0.topicUI, false)
	SetActive(arg_3_0.backgroundUI, false)
	SetActive(arg_3_0.redPacketUI, false)
	SetActive(arg_3_0.rightPanel, false)

	arg_3_0.timerList = {}
	arg_3_0.canFresh = false

	local var_3_0 = arg_3_0.rightPanel:Find("messageScroll/Scrollbar Vertical"):GetComponent(typeof(RectTransform))

	arg_3_0.messageScrollWidth = var_3_0.rect.width
	arg_3_0.messageScrollHeight = var_3_0.rect.height

	arg_3_0.filterUI:Find("panel/title"):GetComponent(typeof(Image)):SetNativeSize()
	arg_3_0.topicUI:Find("panel/title"):GetComponent(typeof(Image)):SetNativeSize()
	arg_3_0.backgroundUI:Find("panel/title"):GetComponent(typeof(Image)):SetNativeSize()
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:SetData()

	function arg_4_0.charaScrollrect.onInitItem(arg_5_0)
		arg_4_0:OnInitItem(arg_5_0)
	end

	function arg_4_0.charaScrollrect.onUpdateItem(arg_6_0, arg_6_1)
		arg_4_0:OnUpdateItem(arg_6_0, arg_6_1)
	end

	arg_4_0:UpdateCharaList(false, false)
	arg_4_0:SetFilterPanel()
end

function var_0_0.OnInitItem(arg_7_0, arg_7_1)
	return
end

function var_0_0.OnUpdateItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.chatList[arg_8_1 + 1]
	local var_8_1 = tf(arg_8_2)

	setActive(var_8_1, true)

	local var_8_2 = var_8_0.sculpture

	if var_8_0.currentTopic.isII and var_8_0.sculptureII ~= "" then
		var_8_2 = var_8_0.sculptureII
	end

	setImageSprite(var_8_1:Find("charaBg/chara"), LoadSprite("qicon/" .. var_8_2), false)
	setText(var_8_1:Find("name"), var_8_0.name)

	local var_8_3 = var_8_0:GetDisplayWord()

	if not arg_8_0.currentChat or arg_8_0.currentChat.characterId ~= var_8_0.characterId or not arg_8_0.isSlowMsg then
		setText(var_8_1:Find("msg"), var_8_3)
	end

	setText(var_8_1:Find("displayWord"), var_8_3)
	SetActive(var_8_1:Find("care"), var_8_0.care == 1)

	if var_8_0.care == 1 and arg_8_0.careAniTriggerId and arg_8_0.careAniTriggerId == var_8_0.characterId then
		arg_8_0.careAniTriggerId = nil

		var_8_1:Find("care"):GetComponent(typeof(Animation)):Play("anim_newinstagram_care")
	end

	if arg_8_0.currentChat then
		SetActive(var_8_1:Find("frame"), arg_8_0.currentChat == var_8_0)
	end

	SetActive(var_8_1:Find("tip"), var_8_0:GetCharacterEndFlag() == 0)
	setText(var_8_1:Find("id"), var_8_0.characterId)
	onButton(arg_8_0, var_8_1, function()
		if arg_8_0.currentChat and arg_8_0.currentChat.characterId ~= var_8_0.characterId then
			arg_8_0:ResetCharaTextFunc(arg_8_0.currentChat.characterId)
		end

		arg_8_0.currentChat = var_8_0

		SetActive(arg_8_0.rightPanel, true)
		SetActive(arg_8_0._tf:Find("main/rightNoMessageBg"), false)
		arg_8_0:UpdateChatContent(var_8_0, false, false)
		arg_8_0:SetTopicPanel(var_8_0)
		arg_8_0:SetBackgroundPanel(var_8_0)

		for iter_9_0 = 0, arg_8_0.charaScrollContent.childCount - 1 do
			SetActive(arg_8_0.charaScrollContent:GetChild(iter_9_0):Find("frame"), false)
		end

		SetActive(var_8_1:Find("frame"), true)

		function arg_8_0.cancelFrame()
			if not IsNil(var_8_1) then
				SetActive(var_8_1:Find("frame"), false)
			end
		end

		local var_9_0 = arg_8_0.rightPanel:GetComponent(typeof(Animation))

		var_9_0:Stop()
		var_9_0:Play("anim_newinstagram_chat_right_in")
	end, SFX_PANEL)
end

function var_0_0.UpdateCharaList(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_0.chatList or #arg_11_0.chatList == 0 then
		SetActive(arg_11_0.leftPanel, false)
		SetActive(arg_11_0.rightPanel, false)
		SetActive(arg_11_0._tf:Find("main/noMessageBg"), true)
		SetActive(arg_11_0._tf:Find("main/noFilteredMessageBg"), false)
		SetActive(arg_11_0._tf:Find("main/rightNoMessageBg"), false)

		return
	end

	if not arg_11_0.currentChat then
		SetActive(arg_11_0.rightPanel, false)
		SetActive(arg_11_0._tf:Find("main/rightNoMessageBg"), true)
	else
		SetActive(arg_11_0.rightPanel, true)
		SetActive(arg_11_0._tf:Find("main/rightNoMessageBg"), false)
	end

	arg_11_0.isSlowMsg = arg_11_1

	arg_11_0:SetFilterResult()

	if arg_11_0.currentChat then
		arg_11_0:UpdateChatContent(arg_11_0.currentChat, arg_11_1, arg_11_2)
		arg_11_0:SetTopicPanel(arg_11_0.currentChat)
	end
end

function var_0_0.UpdateChatContent(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	SetActive(arg_12_0.rightPanel, true)
	setText(arg_12_0.characterName, arg_12_1.name)

	local var_12_0 = arg_12_0.careBtn:Find("care")

	SetActive(var_12_0, arg_12_1.care == 1)
	onButton(arg_12_0, arg_12_0.careBtn, function()
		local var_13_0 = arg_12_1.care == 0 and 1 or 0

		arg_12_0:emit(InstagramChatMediator.CHANGE_CARE, arg_12_1.characterId, var_13_0)

		arg_12_0.careAniTriggerId = arg_12_1.characterId
	end, SFX_PANEL)

	local var_12_1 = arg_12_0.rightPanel:Find("paintingMask")
	local var_12_2 = var_12_1:Find("painting")
	local var_12_3 = arg_12_0.rightPanel:Find("groupBackground")

	if arg_12_1.type == 1 then
		SetActive(var_12_1, true)
		SetActive(var_12_3, false)

		local var_12_4 = "unknown"

		if arg_12_1.skinId == 0 then
			var_12_4 = arg_12_1:GetPainting()
		else
			for iter_12_0, iter_12_1 in ipairs(arg_12_1.skins) do
				if iter_12_1.id == arg_12_1.skinId then
					var_12_4 = iter_12_1.painting
				end
			end
		end

		if not arg_12_0.paintingName then
			setPaintingPrefabAsync(var_12_2, var_12_4, "pifu")

			arg_12_0.paintingName = var_12_4
		elseif arg_12_0.paintingName and arg_12_0.paintingName ~= var_12_4 then
			retPaintingPrefab(var_12_2, arg_12_0.paintingName)
			setPaintingPrefabAsync(var_12_2, var_12_4, "pifu")

			arg_12_0.paintingName = var_12_4
		end
	else
		SetActive(var_12_1, false)
		SetActive(var_12_3, true)

		if arg_12_0.paintingName then
			retPaintingPrefab(var_12_2, arg_12_0.paintingName)

			arg_12_0.paintingName = nil
		end

		setImageSprite(var_12_3, LoadSprite("ui/InstagramChatBackgrounds_atlas", arg_12_1.groupBackground), true)
	end

	local var_12_5 = arg_12_1.currentTopic:GetDisplayWordList()

	if not arg_12_3 then
		arg_12_0:UpdateOptionPanel(arg_12_1.currentTopic, var_12_5)
		arg_12_0:UpdateMessageList(arg_12_1.currentTopic, var_12_5, arg_12_2, arg_12_1.characterId, arg_12_1.type)
	end

	if not arg_12_2 and arg_12_1.currentTopic.readFlag == 0 then
		arg_12_0:emit(InstagramChatMediator.SET_READED, {
			arg_12_1.currentTopic.topicId
		})
	end
end

function var_0_0.UpdateMessageList(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4, arg_14_5)
	arg_14_0:RemoveAllTimer()

	local var_14_0

	for iter_14_0 = #arg_14_2, 1, -1 do
		if arg_14_2[iter_14_0].ship_group == 0 or arg_14_2[iter_14_0].type == 3 and arg_14_1:RedPacketGotFlag(tonumber(arg_14_2[iter_14_0].param)) then
			var_14_0 = iter_14_0

			break
		end
	end

	local var_14_1 = {}

	if var_14_0 then
		for iter_14_1 = var_14_0, 1, -1 do
			if arg_14_2[iter_14_1].ship_group == 0 then
				table.insert(var_14_1, iter_14_1)
			else
				break
			end
		end
	end

	if arg_14_0.shouldShowOption and arg_14_3 then
		arg_14_0:SetOptionPanelActive(false)
	end

	if arg_14_3 then
		onButton(arg_14_0, arg_14_0.rightPanel:Find("messageScroll"), function()
			arg_14_0:SpeedUpMessage()
		end, SFX_PANEL)
	end

	local var_14_2 = GetComponent(arg_14_0.rightPanel:Find("messageScroll"), typeof(ScrollRect))

	local function var_14_3(arg_16_0)
		local var_16_0 = Vector2(0, arg_16_0)

		var_14_2.normalizedPosition = var_16_0
	end

	local var_14_4 = pg.gameset.juuschat_dialogue_trigger_time.key_value / 1000
	local var_14_5 = pg.gameset.juuschat_entering_time.key_value / 1000
	local var_14_6 = var_14_4 - var_14_5

	arg_14_0.messageList:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == UIItemList.EventUpdate then
			local var_17_0 = arg_14_2[arg_17_1 + 1]

			if var_17_0.ship_group == 0 and var_17_0.type == 0 then
				SetActive(arg_17_2, false)

				return
			end

			local var_17_1 = arg_17_2:Find("charaMessageCard")
			local var_17_2 = arg_17_2:Find("playerReplyCard")

			SetActive(var_17_1, var_17_0.ship_group ~= 0)
			SetActive(var_17_2, var_17_0.ship_group == 0)

			if var_17_0.ship_group ~= 0 and arg_14_5 == 2 and var_17_0.type ~= 5 then
				SetActive(arg_17_2:Find("nameBar"), true)
				setText(arg_17_2:Find("nameBar/Text"), var_0_1[var_17_0.ship_group].name)
			else
				SetActive(arg_17_2:Find("nameBar"), false)
			end

			local var_17_3

			if arg_14_3 and var_14_0 and arg_17_1 + 1 > var_14_0 then
				var_17_3 = (arg_17_1 + 1 - var_14_0) * var_14_4 - var_14_5

				if #var_14_1 > 1 then
					var_17_3 = var_17_3 + (#var_14_1 - 1) * var_14_6
				end
			end

			if var_17_0.ship_group ~= 0 then
				local var_17_4 = "unknown"
				local var_17_5 = var_0_1[var_17_0.ship_group]

				if var_17_5 then
					if var_17_0.ship_group == arg_14_4 and arg_14_1.isII and var_17_5.sculpture_ii ~= "" then
						var_17_4 = var_17_5.sculpture_ii
					else
						var_17_4 = var_17_5.sculpture
					end
				end

				if var_17_0.type ~= 5 then
					setImageSprite(arg_17_2:Find("charaMessageCard/charaBg/chara"), LoadSprite("qicon/" .. var_17_4), false)
				end

				if var_17_0.type == 1 then
					arg_14_0:SetCharaMessageCardActive(var_17_1, {
						3
					})
					setText(arg_17_2:Find("charaMessageCard/msgBox/msg"), var_17_0.param)

					if arg_14_3 and var_14_0 and arg_17_1 + 1 > var_14_0 then
						SetActive(arg_17_2, false)
						arg_14_0:StartTimer(function()
							SetActive(arg_17_2, true)
							arg_17_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_17_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_17_2:Find("charaMessageCard/msgBox"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_14_0:StartTimer(function()
								SetActive(arg_17_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_17_2:Find("charaMessageCard/msgBox"), true)
								arg_17_2:Find("charaMessageCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_chat_common_in")

								if arg_17_1 + 1 ~= #arg_14_2 then
									arg_14_0:ChangeCharaTextFunc(arg_14_4, var_17_0.param)
								else
									arg_14_0:emit(InstagramChatMediator.SET_READED, {
										arg_14_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_14_0:SetEndAniEvent(arg_17_2:Find("charaMessageCard/msgBox"), function()
									if arg_14_0.shouldShowOption and arg_17_1 + 1 == #arg_14_2 then
										arg_14_0:SetOptionPanelActive(true)
									end
								end)
							end, var_14_5)
						end, var_17_3)
					end
				elseif var_17_0.type == 2 then
					arg_14_0:SetCharaMessageCardActive(var_17_1, {
						2,
						7
					})
					pg.CriMgr.GetInstance():GetCueInfo("cv-" .. var_17_0.ship_group, var_17_0.param[1], function(arg_21_0)
						setText(arg_17_2:Find("charaMessageCard/voiceBox/time"), tostring(math.ceil(tonumber(tostring(arg_21_0.length)) / 1000)) .. "\"")
					end)
					onButton(arg_14_0, arg_17_2:Find("charaMessageCard/voiceBox"), function()
						pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/cv/" .. var_17_0.ship_group .. "/" .. var_17_0.param[1])
					end, SFX_PANEL)
					setText(arg_17_2:Find("charaMessageCard/voiceMsgBox/voiceMsg/msg"), var_17_0.param[2])

					if arg_14_3 and var_14_0 and arg_17_1 + 1 > var_14_0 then
						SetActive(arg_17_2, false)
						arg_14_0:StartTimer(function()
							SetActive(arg_17_2, true)
							arg_17_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_17_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_17_2:Find("charaMessageCard/voiceBox"), false)
							SetActive(arg_17_2:Find("charaMessageCard/voiceMsgBox"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_14_0:StartTimer(function()
								SetActive(arg_17_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_17_2:Find("charaMessageCard/voiceBox"), true)
								SetActive(arg_17_2:Find("charaMessageCard/voiceMsgBox"), true)
								arg_17_2:Find("charaMessageCard/voiceBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_chat_common_in")
								arg_17_2:Find("charaMessageCard/voiceMsgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_voicetip_in")

								if arg_17_1 + 1 ~= #arg_14_2 then
									arg_14_0:ChangeCharaTextFunc(arg_14_4, "<color=#ff6666>" .. i18n("juuschat_chattip1") .. "</color>")
								else
									arg_14_0:emit(InstagramChatMediator.SET_READED, {
										arg_14_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_14_0:SetEndAniEvent(arg_17_2:Find("charaMessageCard/voiceBox"), function()
									if arg_14_0.shouldShowOption and arg_17_1 + 1 == #arg_14_2 then
										arg_14_0:SetOptionPanelActive(true)
									end
								end)
							end, var_14_5)
						end, var_17_3)
					end
				elseif var_17_0.type == 3 then
					arg_14_0:SetCharaMessageCardActive(var_17_1, {
						5
					})

					local var_17_6 = var_0_2[tonumber(var_17_0.param)]

					setText(arg_17_2:Find("charaMessageCard/redPacket/desc"), var_17_6.desc)

					local var_17_7 = arg_14_1:RedPacketGotFlag(var_17_6.id)

					SetActive(arg_17_2:Find("charaMessageCard/redPacket/got"), var_17_7)
					arg_14_0:SetRedPacketPanel(arg_17_2:Find("charaMessageCard/redPacket"), var_17_6, var_17_7, var_17_4, arg_14_1.topicId, var_17_0.id)

					if arg_14_3 and var_14_0 and arg_17_1 + 1 == var_14_0 then
						arg_14_0:ChangeCharaTextFunc(arg_14_4, "<color=#ff6666>" .. i18n("juuschat_chattip2") .. "</color>" .. pg.activity_ins_redpackage[tonumber(var_17_0.param)].desc)
					end

					if arg_14_3 and var_14_0 and arg_17_1 + 1 > var_14_0 then
						SetActive(arg_17_2, false)
						arg_14_0:StartTimer(function()
							SetActive(arg_17_2, true)
							arg_17_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_17_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_17_2:Find("charaMessageCard/redPacket"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_14_0:StartTimer(function()
								SetActive(arg_17_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_17_2:Find("charaMessageCard/redPacket"), true)
								arg_17_2:Find("charaMessageCard/redPacket"):GetComponent(typeof(Animation)):Play("anim_newinstagram_redpacket_in")

								if arg_17_1 + 1 ~= #arg_14_2 then
									arg_14_0:ChangeCharaTextFunc(arg_14_4, "<color=#ff6666>" .. i18n("juuschat_chattip2") .. "</color>" .. pg.activity_ins_redpackage[tonumber(var_17_0.param)].desc)
								else
									arg_14_0:emit(InstagramChatMediator.SET_READED, {
										arg_14_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_14_0:SetEndAniEvent(arg_17_2:Find("charaMessageCard/redPacket"), function()
									if arg_14_0.shouldShowOption and arg_17_1 + 1 == #arg_14_2 then
										arg_14_0:SetOptionPanelActive(true)
									end
								end)
							end, var_14_5)
						end, var_17_3)
					end
				elseif var_17_0.type == 4 then
					arg_14_0:SetCharaMessageCardActive(var_17_1, {
						4
					})
					arg_14_0:ClearEmoji(arg_17_2:Find("charaMessageCard/emoji/emoticon"))
					arg_14_0:SetEmoji(arg_17_2:Find("charaMessageCard/emoji/emoticon"), var_0_3[tonumber(var_17_0.param)].pic)

					if arg_14_3 and var_14_0 and arg_17_1 + 1 > var_14_0 then
						SetActive(arg_17_2, false)
						arg_14_0:StartTimer(function()
							SetActive(arg_17_2, true)
							arg_17_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_17_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_17_2:Find("charaMessageCard/emoji"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_14_0:StartTimer(function()
								SetActive(arg_17_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_17_2:Find("charaMessageCard/emoji"), true)
								arg_17_2:Find("charaMessageCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

								if arg_17_1 + 1 ~= #arg_14_2 then
									local var_30_0 = var_0_3[tonumber(var_17_0.param)].desc
									local var_30_1 = string.gsub(var_30_0, "#%w+>", "#28af6e>")

									arg_14_0:ChangeCharaTextFunc(arg_14_4, var_30_1)
								else
									arg_14_0:emit(InstagramChatMediator.SET_READED, {
										arg_14_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_14_0:SetEndAniEvent(arg_17_2:Find("charaMessageCard/emoji"), function()
									if arg_14_0.shouldShowOption and arg_17_1 + 1 == #arg_14_2 then
										arg_14_0:SetOptionPanelActive(true)
									end
								end)
							end, var_14_5)
						end, var_17_3)
					end
				elseif var_17_0.type == 5 then
					arg_14_0:SetCharaMessageCardActive(var_17_1, {
						6
					})

					local var_17_8 = var_17_0.param

					for iter_17_0 in string.gmatch(var_17_0.param, "'%d+'") do
						local var_17_9 = string.sub(iter_17_0, 2, #iter_17_0 - 1)

						var_17_8 = string.gsub(var_17_8, iter_17_0, "<color=#93e9ff>" .. var_0_1[tonumber(var_17_9)].name .. "</color>")
					end

					setText(arg_17_2:Find("charaMessageCard/systemTip/panel/Text"), var_17_8)

					if arg_14_3 and var_14_0 and arg_17_1 + 1 > var_14_0 then
						SetActive(arg_17_2, false)
						arg_14_0:StartTimer(function()
							SetActive(arg_17_2, true)
							arg_17_2:Find("charaMessageCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")

							if arg_17_1 + 1 ~= #arg_14_2 then
								arg_14_0:ChangeCharaTextFunc(arg_14_4, var_17_8)
							else
								arg_14_0:emit(InstagramChatMediator.SET_READED, {
									arg_14_1.topicId
								})
							end

							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_14_0:SetEndAniEvent(arg_17_2:Find("charaMessageCard/systemTip"), function()
								if arg_14_0.shouldShowOption and arg_17_1 + 1 == #arg_14_2 then
									arg_14_0:SetOptionPanelActive(true)
								end
							end)
						end, var_17_3)
					end
				end
			else
				if var_17_0.type == 1 then
					arg_14_0:SetPlayerMessageCardActive(var_17_2, {
						0
					})
					setText(arg_17_2:Find("playerReplyCard/msgBox/msg"), var_17_0.param)
				elseif var_17_0.type == 4 then
					arg_14_0:SetPlayerMessageCardActive(var_17_2, {
						1
					})
					arg_14_0:ClearEmoji(arg_17_2:Find("playerReplyCard/emoji/emoticon"))
					arg_14_0:SetEmoji(arg_17_2:Find("playerReplyCard/emoji/emoticon"), var_0_3[tonumber(var_17_0.param)].pic)
				elseif var_17_0.type == 5 then
					arg_14_0:SetPlayerMessageCardActive(var_17_2, {
						2
					})

					local var_17_10 = var_17_0.param

					for iter_17_1 in string.gmatch(var_17_0.param, "'%d+'") do
						local var_17_11 = string.sub(iter_17_1, 2, #iter_17_1 - 1)

						var_17_10 = string.gsub(var_17_10, iter_17_1, "<color=#93e9ff>" .. var_0_1[tonumber(var_17_11)].name .. "</color>")
					end

					setText(arg_17_2:Find("playerReplyCard/systemTip/panel/Text"), var_17_10)
				end

				if arg_14_3 and var_14_0 and _.contains(var_14_1, arg_17_1 + 1) then
					if table.indexof(var_14_1, arg_17_1 + 1) < #var_14_1 then
						SetActive(arg_17_2, false)
						arg_14_0:StartTimer(function()
							SetActive(arg_17_2, true)

							if var_17_0.type == 1 then
								arg_17_2:Find("playerReplyCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_playerchat_common_in")
								arg_14_0:ChangeCharaTextFunc(arg_14_4, var_17_0.param)
							elseif var_17_0.type == 4 then
								arg_17_2:Find("playerReplyCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

								local var_34_0 = var_0_3[tonumber(var_17_0.param)].desc
								local var_34_1 = string.gsub(var_34_0, "#%w+>", "#28af6e>")

								arg_14_0:ChangeCharaTextFunc(arg_14_4, var_34_1)
							elseif var_17_0.type == 5 then
								arg_17_2:Find("playerReplyCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")

								local var_34_2 = var_17_0.param

								for iter_34_0 in string.gmatch(var_17_0.param, "'%d+'") do
									local var_34_3 = string.sub(iter_34_0, 2, #iter_34_0 - 1)

									var_34_2 = string.gsub(var_34_2, iter_34_0, "<color=#93e9ff>" .. var_0_1[tonumber(var_34_3)].name .. "</color>")
								end

								arg_14_0:ChangeCharaTextFunc(arg_14_4, var_34_2)
							end

							if arg_17_1 + 1 == #arg_14_2 then
								arg_14_0:emit(InstagramChatMediator.SET_READED, {
									arg_14_1.topicId
								})
							end

							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
						end, (#var_14_1 - table.indexof(var_14_1, arg_17_1 + 1)) * var_14_6)
					else
						if var_17_0.type == 1 then
							arg_17_2:Find("playerReplyCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_playerchat_common_in")
							arg_14_0:ChangeCharaTextFunc(arg_14_4, var_17_0.param)
						elseif var_17_0.type == 4 then
							arg_17_2:Find("playerReplyCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

							local var_17_12 = var_0_3[tonumber(var_17_0.param)].desc
							local var_17_13 = string.gsub(var_17_12, "#%w+>", "#28af6e>")

							arg_14_0:ChangeCharaTextFunc(arg_14_4, var_17_13)
						elseif var_17_0.type == 5 then
							arg_17_2:Find("playerReplyCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")

							local var_17_14 = var_17_0.param

							for iter_17_2 in string.gmatch(var_17_0.param, "'%d+'") do
								local var_17_15 = string.sub(iter_17_2, 2, #iter_17_2 - 1)

								var_17_14 = string.gsub(var_17_14, iter_17_2, "<color=#93e9ff>" .. var_0_1[tonumber(var_17_15)].name .. "</color>")
							end

							arg_14_0:ChangeCharaTextFunc(arg_14_4, var_17_14)
						end

						if arg_17_1 + 1 == #arg_14_2 then
							arg_14_0:emit(InstagramChatMediator.SET_READED, {
								arg_14_1.topicId
							})
						end
					end
				end
			end

			if not arg_14_1:isWaiting() and arg_17_1 + 1 == #arg_14_2 then
				if arg_14_3 then
					if var_17_0.ship_group ~= 0 then
						arg_14_0:StartTimer(function()
							setActive(arg_17_2:Find("end"), true)
						end, var_17_3 + var_14_4)
					else
						arg_14_0:StartTimer(function()
							setActive(arg_17_2:Find("end"), true)
						end, (#var_14_1 - table.indexof(var_14_1, arg_17_1 + 1)) * var_14_6 + var_14_6)
					end
				else
					setActive(arg_17_2:Find("end"), true)
				end
			else
				setActive(arg_17_2:Find("end"), false)
			end
		end
	end)
	arg_14_0.messageList:align(#arg_14_2)

	if arg_14_3 then
		Canvas.ForceUpdateCanvases()
		LeanTween.value(go(arg_14_0.rightPanel:Find("messageScroll")), var_14_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_14_3)):setEase(LeanTweenType.easeInOutCubic)
	else
		scrollToBottom(arg_14_0.rightPanel:Find("messageScroll"))
	end
end

function var_0_0.SetCharaMessageCardActive(arg_37_0, arg_37_1, arg_37_2)
	if _.contains(arg_37_2, 6) then
		SetActive(arg_37_1:GetChild(0), false)
	else
		SetActive(arg_37_1:GetChild(0), true)
	end

	for iter_37_0 = 1, arg_37_1.childCount - 1 do
		if _.contains(arg_37_2, iter_37_0) then
			SetActive(arg_37_1:GetChild(iter_37_0), true)
		else
			SetActive(arg_37_1:GetChild(iter_37_0), false)
		end
	end
end

function var_0_0.SetPlayerMessageCardActive(arg_38_0, arg_38_1, arg_38_2)
	for iter_38_0 = 0, arg_38_1.childCount - 1 do
		if _.contains(arg_38_2, iter_38_0) then
			SetActive(arg_38_1:GetChild(iter_38_0), true)
		else
			SetActive(arg_38_1:GetChild(iter_38_0), false)
		end
	end
end

function var_0_0.SetEmoji(arg_39_0, arg_39_1, arg_39_2)
	PoolMgr.GetInstance():GetPrefab("emoji/" .. arg_39_2, arg_39_2, true, function(arg_40_0)
		if not IsNil(arg_39_1) then
			arg_40_0.name = arg_39_2
			tf(arg_40_0).sizeDelta = arg_39_1.sizeDelta
			tf(arg_40_0).anchoredPosition = Vector2.zero

			local var_40_0 = arg_40_0:GetComponent("Animator")

			if var_40_0 then
				var_40_0.enabled = true
			end

			setParent(arg_40_0, arg_39_1, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. arg_39_2, arg_39_2, arg_40_0)
		end
	end)
end

function var_0_0.ClearEmoji(arg_41_0, arg_41_1)
	eachChild(arg_41_1, function(arg_42_0)
		local var_42_0 = go(arg_42_0)

		PoolMgr.GetInstance():ReturnPrefab("emoji/" .. var_42_0.name, var_42_0.name, var_42_0)
	end)
end

function var_0_0.UpdateOptionPanel(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_2[#arg_43_2].option

	if var_43_0 and type(var_43_0) == "table" then
		arg_43_0.shouldShowOption = true
		arg_43_0.optionCount = #var_43_0

		arg_43_0:SetOptionPanelActive(true)
		arg_43_0.optionList:make(function(arg_44_0, arg_44_1, arg_44_2)
			if arg_44_0 == UIItemList.EventUpdate then
				local var_44_0 = var_43_0[arg_44_1 + 1]

				setText(arg_44_2:Find("Text"), HXSet.hxLan(var_44_0[2]))
				onButton(arg_43_0, arg_44_2, function()
					arg_43_0:emit(InstagramChatMediator.REPLY, arg_43_1.topicId, arg_43_2[#arg_43_2].id, var_44_0[1])
				end, SFX_PANEL)
			end
		end)
		arg_43_0.optionList:align(#var_43_0)
	else
		arg_43_0:SetOptionPanelActive(false)

		arg_43_0.shouldShowOption = false
	end
end

function var_0_0.SetOptionPanelActive(arg_46_0, arg_46_1)
	SetActive(arg_46_0.optionPanel, arg_46_1)

	local var_46_0 = arg_46_0.rightPanel:Find("messageScroll/Viewport/Content"):GetComponent(typeof(VerticalLayoutGroup))
	local var_46_1 = UnityEngine.RectOffset.New()

	var_46_1.left = 0
	var_46_1.right = 0
	var_46_1.top = 0

	local var_46_2 = arg_46_0.rightPanel:Find("messageScroll/Scrollbar Vertical"):GetComponent(typeof(RectTransform))

	if arg_46_1 then
		var_46_1.bottom = 42 + 88 * arg_46_0.optionCount
		var_46_2.sizeDelta = Vector2(arg_46_0.messageScrollWidth, -var_46_1.bottom)
	else
		var_46_1.bottom = 50
		var_46_2.sizeDelta = Vector2(arg_46_0.messageScrollWidth, 0)
	end

	var_46_0.padding = var_46_1

	scrollToBottom(arg_46_0.rightPanel:Find("messageScroll"))
end

function var_0_0.SetFilterPanel(arg_47_0)
	arg_47_0.readFilter = arg_47_0.readFilter or var_0_0.ReadType[1]
	arg_47_0.typeFilter = arg_47_0.typeFilter or var_0_0.TypeType[1]
	arg_47_0.campFilter = arg_47_0.campFilter or {
		var_0_0.CampIds[1]
	}

	local var_47_0 = arg_47_0.filterUI:Find("panel/filterScroll/Viewport/Content/read")
	local var_47_1 = arg_47_0.filterUI:Find("panel/filterScroll/Viewport/Content/type")
	local var_47_2 = arg_47_0.filterUI:Find("panel/filterScroll/Viewport/Content/camp")
	local var_47_3 = UIItemList.New(var_47_2, var_47_2:Find("option"))

	onButton(arg_47_0, arg_47_0.filterBtn, function()
		SetActive(arg_47_0.filterUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_47_0.filterUI)

		for iter_48_0, iter_48_1 in ipairs(var_0_0.ReadType) do
			local var_48_0 = var_47_0:GetChild(iter_48_0)
			local var_48_1 = var_48_0:Find("selectedFrame")

			SetActive(var_48_1, arg_47_0.readFilter == iter_48_1)
			onButton(arg_47_0, var_48_0, function()
				for iter_49_0, iter_49_1 in ipairs(var_0_0.ReadType) do
					SetActive(var_47_0:GetChild(iter_49_0):Find("selectedFrame"), false)
				end

				SetActive(var_48_1, true)
			end, SFX_PANEL)
		end

		for iter_48_2, iter_48_3 in ipairs(var_0_0.TypeType) do
			local var_48_2 = var_47_1:GetChild(iter_48_2)
			local var_48_3 = var_48_2:Find("selectedFrame")

			SetActive(var_48_3, arg_47_0.typeFilter == iter_48_3)
			onButton(arg_47_0, var_48_2, function()
				for iter_50_0, iter_50_1 in ipairs(var_0_0.TypeType) do
					SetActive(var_47_1:GetChild(iter_50_0):Find("selectedFrame"), false)
				end

				SetActive(var_48_3, true)
			end, SFX_PANEL)
		end

		var_47_3:make(function(arg_51_0, arg_51_1, arg_51_2)
			if arg_51_0 == UIItemList.EventUpdate then
				setText(arg_51_2:Find("Text"), i18n(var_0_0.CampNames[arg_51_1 + 1]))

				local var_51_0 = arg_51_2:Find("selectedFrame")

				SetActive(var_51_0, _.contains(arg_47_0.campFilter, var_0_0.CampIds[arg_51_1 + 1]))
				onButton(arg_47_0, arg_51_2, function()
					if arg_51_1 == 0 then
						SetActive(var_51_0, true)

						for iter_52_0 = 2, #var_0_0.CampIds do
							SetActive(var_47_2:GetChild(iter_52_0 - 1):Find("selectedFrame"), false)
						end
					else
						SetActive(var_51_0, not isActive(var_51_0))

						local var_52_0 = true
						local var_52_1 = true

						for iter_52_1 = 2, #var_0_0.CampIds do
							if not isActive(var_47_2:GetChild(iter_52_1 - 1):Find("selectedFrame")) then
								var_52_0 = false
							end

							if isActive(var_47_2:GetChild(iter_52_1 - 1):Find("selectedFrame")) then
								var_52_1 = false
							end
						end

						if var_52_0 then
							SetActive(var_47_2:GetChild(0):Find("selectedFrame"), true)

							for iter_52_2 = 2, #var_0_0.CampIds do
								SetActive(var_47_2:GetChild(iter_52_2 - 1):Find("selectedFrame"), false)
							end
						elseif var_52_1 then
							SetActive(var_47_2:GetChild(0):Find("selectedFrame"), true)
						else
							SetActive(var_47_2:GetChild(0):Find("selectedFrame"), false)
						end
					end
				end, SFX_PANEL)
			end
		end)
		var_47_3:align(#var_0_0.CampIds)
	end, SFX_PANEL)
	onButton(arg_47_0, arg_47_0.filterUI:Find("bg"), function()
		arg_47_0:CloseFilterPanel()
	end, SFX_PANEL)
	onButton(arg_47_0, arg_47_0.filterUI:Find("panel/bottom/close"), function()
		arg_47_0:CloseFilterPanel()
	end, SFX_PANEL)
	onButton(arg_47_0, arg_47_0.filterUI:Find("panel/bottom/ok"), function()
		for iter_55_0, iter_55_1 in ipairs(var_0_0.ReadType) do
			local var_55_0 = var_47_0:GetChild(iter_55_0):Find("selectedFrame")

			if isActive(var_55_0) then
				arg_47_0.readFilter = iter_55_1
			end
		end

		for iter_55_2, iter_55_3 in ipairs(var_0_0.TypeType) do
			local var_55_1 = var_47_1:GetChild(iter_55_2):Find("selectedFrame")

			if isActive(var_55_1) then
				arg_47_0.typeFilter = iter_55_3
			end
		end

		arg_47_0.campFilter = {}

		for iter_55_4, iter_55_5 in ipairs(var_0_0.CampIds) do
			local var_55_2 = var_47_2:GetChild(iter_55_4 - 1):Find("selectedFrame")

			if isActive(var_55_2) then
				table.insert(arg_47_0.campFilter, iter_55_5)
			end
		end

		arg_47_0:CloseFilterPanel()
		arg_47_0:SetFilterResult()
	end, SFX_PANEL)
end

function var_0_0.SetFilterResult(arg_56_0)
	local var_56_0 = true
	local var_56_1 = false

	if not arg_56_0.readFilter then
		arg_56_0.readFilter = var_0_0.ReadType[1]
		arg_56_0.typeFilter = var_0_0.TypeType[1]
		arg_56_0.campFilter = {
			var_0_0.CampIds[1]
		}
	end

	arg_56_0.chatList = table.insertto({}, arg_56_0.allChatList)

	for iter_56_0 = #arg_56_0.chatList, 1, -1 do
		local var_56_2 = arg_56_0.chatList[iter_56_0]
		local var_56_3 = true

		if arg_56_0.readFilter ~= "all" then
			local var_56_4 = arg_56_0.readFilter == "hasReaded" and 1 or 0

			if var_56_2:GetCharacterEndFlag() ~= var_56_4 then
				var_56_3 = false
			end
		end

		if arg_56_0.typeFilter ~= "all" then
			local var_56_5 = arg_56_0.typeFilter == "single" and 1 or 2

			if var_56_2.type ~= var_56_5 then
				var_56_3 = false
			end
		end

		if not _.contains(arg_56_0.campFilter, 0) and not _.contains(arg_56_0.campFilter, var_56_2.nationality) then
			var_56_3 = false
		end

		if not var_56_3 then
			table.remove(arg_56_0.chatList, iter_56_0)
		end

		if var_56_3 then
			var_56_0 = false
		end

		if arg_56_0.currentChat and arg_56_0.currentChat.characterId == var_56_2.characterId and var_56_3 then
			var_56_1 = true
		end
	end

	local var_56_6 = arg_56_0.readFilter == "all" and arg_56_0.typeFilter == "all" and _.contains(arg_56_0.campFilter, 0)

	SetActive(arg_56_0.isFiltered, not var_56_6)

	if var_56_0 then
		SetActive(arg_56_0.leftPanel:Find("charaScroll"), false)
		SetActive(arg_56_0._tf:Find("main/noFilteredMessageBg"), true)
		SetActive(arg_56_0.rightPanel, false)
		SetActive(arg_56_0._tf:Find("main/rightNoMessageBg"), false)
	else
		SetActive(arg_56_0.leftPanel:Find("charaScroll"), true)
		arg_56_0.charaScrollrect:SetTotalCount(#arg_56_0.chatList)
		SetActive(arg_56_0._tf:Find("main/noFilteredMessageBg"), false)

		if var_56_1 then
			SetActive(arg_56_0.rightPanel, true)
			SetActive(arg_56_0._tf:Find("main/rightNoMessageBg"), false)
		else
			SetActive(arg_56_0.rightPanel, false)
			SetActive(arg_56_0._tf:Find("main/rightNoMessageBg"), true)

			arg_56_0.currentChat = nil

			if arg_56_0.cancelFrame then
				arg_56_0.cancelFrame()

				arg_56_0.cancelFrame = nil
			end
		end
	end
end

function var_0_0.CloseFilterPanel(arg_57_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_57_0.filterUI, arg_57_0._tf:Find("subPages"))
	SetActive(arg_57_0.filterUI, false)
end

function var_0_0.SetTopicPanel(arg_58_0, arg_58_1)
	SetActive(arg_58_0.topicBtn:Find("tip"), arg_58_1:GetCharacterEndFlagExceptCurrent() == 0)
	onButton(arg_58_0, arg_58_0.topicBtn, function()
		SetActive(arg_58_0.topicUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_58_0.topicUI)

		arg_58_0.currentTopic = nil

		arg_58_1:SortTopicList()

		local var_59_0 = {}
		local var_59_1 = {}

		for iter_59_0, iter_59_1 in ipairs(arg_58_1.topics) do
			if iter_59_1.active then
				if iter_59_1.isII then
					table.insert(var_59_1, iter_59_1)
				else
					table.insert(var_59_0, iter_59_1)
				end
			end
		end

		setActive(arg_58_0.topicUI:Find("panel/topicScroll/Viewport/Content/self"), #var_59_0 > 0)
		setActive(arg_58_0.topicUI:Find("panel/topicScroll/Viewport/Content/other"), #var_59_1 > 0)
		setActive(arg_58_0.topicUI:Find("panel/topicScroll/Viewport/Content/line"), #var_59_0 > 0 and #var_59_1 > 0)

		if #var_59_0 > 0 then
			local var_59_2 = UIItemList.New(arg_58_0.topicUI:Find("panel/topicScroll/Viewport/Content/self"), arg_58_0.topicUI:Find("panel/topicScroll/Viewport/Content/self/topic"))

			var_59_2:make(function(arg_60_0, arg_60_1, arg_60_2)
				if arg_60_0 == UIItemList.EventUpdate then
					local var_60_0 = var_59_0[arg_60_1 + 1]

					arg_58_0:SetTopic(arg_60_2, arg_58_1, var_60_0, var_59_0, var_59_1)
				end
			end)
			var_59_2:align(#var_59_0)
		end

		if #var_59_1 > 0 then
			local var_59_3 = UIItemList.New(arg_58_0.topicUI:Find("panel/topicScroll/Viewport/Content/other"), arg_58_0.topicUI:Find("panel/topicScroll/Viewport/Content/other/topic"))

			var_59_3:make(function(arg_61_0, arg_61_1, arg_61_2)
				if arg_61_0 == UIItemList.EventUpdate then
					local var_61_0 = var_59_1[arg_61_1 + 1]

					arg_58_0:SetTopic(arg_61_2, arg_58_1, var_61_0, var_59_0, var_59_1)
				end
			end)
			var_59_3:align(#var_59_1)
		end
	end, SFX_PANEL)
	onButton(arg_58_0, arg_58_0.topicUI:Find("bg"), function()
		arg_58_0:CloseTopicPanel()
	end, SFX_PANEL)
	onButton(arg_58_0, arg_58_0.topicUI:Find("panel/bottom/close"), function()
		arg_58_0:CloseTopicPanel()
	end, SFX_PANEL)
	onButton(arg_58_0, arg_58_0.topicUI:Find("panel/bottom/ok"), function()
		arg_58_0:emit(InstagramChatMediator.SET_CURRENT_TOPIC, arg_58_0.currentTopic.topicId)
		arg_58_0:CloseTopicPanel()

		local var_64_0 = arg_58_0.rightPanel:GetComponent(typeof(Animation))

		var_64_0:Stop()
		var_64_0:Play("anim_newinstagram_chat_right_in")
	end, SFX_PANEL)
end

function var_0_0.SetTopic(arg_65_0, arg_65_1, arg_65_2, arg_65_3, arg_65_4, arg_65_5)
	setScrollText(arg_65_1:Find("mask/name"), HXSet.hxLan(arg_65_3.name))
	SetActive(arg_65_1:Find("lock"), not arg_65_3.active)
	SetActive(arg_65_1:Find("waiting"), arg_65_3.active and arg_65_3:isWaiting())
	SetActive(arg_65_1:Find("complete"), arg_65_3.active and arg_65_3:IsCompleted())
	SetActive(arg_65_1:Find("selectedFrame"), arg_65_2.currentTopicId == arg_65_3.topicId)
	SetActive(arg_65_1:Find("selected"), arg_65_2.currentTopicId == arg_65_3.topicId)
	SetActive(arg_65_1:Find("tip"), arg_65_3.active and not arg_65_3:IsCompleted())

	if arg_65_2.currentTopicId == arg_65_3.topicId then
		arg_65_0.currentTopic = arg_65_3
	end

	SetActive(arg_65_1, arg_65_3.active)

	if arg_65_3.active then
		onButton(arg_65_0, arg_65_1, function()
			for iter_66_0 = 1, #arg_65_4 do
				SetActive(arg_65_0.topicUI:Find("panel/topicScroll/Viewport/Content/self"):GetChild(iter_66_0 - 1):Find("selectedFrame"), false)
			end

			for iter_66_1 = 1, #arg_65_5 do
				SetActive(arg_65_0.topicUI:Find("panel/topicScroll/Viewport/Content/other"):GetChild(iter_66_1 - 1):Find("selectedFrame"), false)
			end

			SetActive(arg_65_1:Find("selectedFrame"), true)

			arg_65_0.currentTopic = arg_65_3
		end, SFX_PANEL)
	else
		onButton(arg_65_0, arg_65_1, function()
			pg.TipsMgr.GetInstance():ShowTips(arg_65_3.unlockDesc)
		end, SFX_PANEL)
	end
end

function var_0_0.CloseTopicPanel(arg_68_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_68_0.topicUI, arg_68_0._tf:Find("subPages"))
	SetActive(arg_68_0.topicUI, false)
end

function var_0_0.SetBackgroundPanel(arg_69_0, arg_69_1)
	if arg_69_1.type == 2 then
		SetActive(arg_69_0.backgroundBtn, false)

		return
	end

	SetActive(arg_69_0.backgroundBtn, true)
	onButton(arg_69_0, arg_69_0.backgroundBtn, function()
		SetActive(arg_69_0.backgroundUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_69_0.backgroundUI)

		arg_69_0.currentBgId = nil

		local var_70_0 = arg_69_1:GetSkins()
		local var_70_1 = UIItemList.New(arg_69_0.backgroundUI:Find("panel/backgroundScroll/Viewport/Content"), arg_69_0.backgroundUI:Find("panel/backgroundScroll/Viewport/Content/background"))

		var_70_1:make(function(arg_71_0, arg_71_1, arg_71_2)
			if arg_71_0 == UIItemList.EventUpdate then
				local var_71_0 = var_70_0[arg_71_1 + 1]
				local var_71_1 = var_71_0.id
				local var_71_2 = var_71_0.painting

				LoadImageSpriteAsync("herohrzicon/" .. var_71_2, arg_71_2:Find("skinMask/skin"), false)
				setScrollText(arg_71_2:Find("skinMask/Panel/mask/Text"), var_71_0.name)

				local var_71_3 = getProxy(ShipSkinProxy):hasSkin(var_71_0.id) or var_71_0.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or var_71_0.skin_type == ShipSkin.SKIN_TYPE_PROPOSE or var_71_0.skin_type == ShipSkin.SKIN_TYPE_REMAKE

				SetActive(arg_71_2:Find("lockFrame"), not var_71_3)

				if arg_69_1.skinId ~= 0 then
					SetActive(arg_71_2:Find("selectedFrame"), arg_69_1.skinId == var_71_1)
					SetActive(arg_71_2:Find("selected"), arg_69_1.skinId == var_71_1)

					if arg_69_1.skinId == var_71_1 then
						arg_69_0.currentBgId = var_71_1
					end
				else
					local var_71_4 = arg_69_1:GetPaintingId()

					SetActive(arg_71_2:Find("selectedFrame"), var_71_4 == var_71_1)
					SetActive(arg_71_2:Find("selected"), var_71_4 == var_71_1)

					if var_71_4 == var_71_1 then
						arg_69_0.currentBgId = var_71_1
					end
				end

				onButton(arg_69_0, arg_71_2, function()
					if var_71_3 then
						SetActive(arg_71_2:Find("selectedFrame"), true)

						for iter_72_0 = 1, #var_70_0 do
							if iter_72_0 ~= arg_71_1 + 1 then
								local var_72_0 = arg_69_0.backgroundUI:Find("panel/backgroundScroll/Viewport/Content"):GetChild(iter_72_0 - 1)

								SetActive(var_72_0:Find("selectedFrame"), false)
							end
						end

						arg_69_0.currentBgId = var_71_1
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("juuschat_background_tip2"))
					end
				end, SFX_PANEL)
			end
		end)
		var_70_1:align(#var_70_0)
	end, SFX_PANEL)
	onButton(arg_69_0, arg_69_0.backgroundUI:Find("bg"), function()
		arg_69_0:CloseBackgroundPanel()
	end, SFX_PANEL)
	onButton(arg_69_0, arg_69_0.backgroundUI:Find("panel/bottom/close"), function()
		arg_69_0:CloseBackgroundPanel()
	end, SFX_PANEL)
	onButton(arg_69_0, arg_69_0.backgroundUI:Find("panel/bottom/ok"), function()
		arg_69_0:emit(InstagramChatMediator.SET_CURRENT_BACKGROUND, arg_69_1.characterId, arg_69_0.currentBgId)
		arg_69_0:CloseBackgroundPanel()
	end, SFX_PANEL)
end

function var_0_0.CloseBackgroundPanel(arg_76_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_76_0.backgroundUI, arg_76_0._tf:Find("subPages"))
	SetActive(arg_76_0.backgroundUI, false)
end

function var_0_0.SetRedPacketPanel(arg_77_0, arg_77_1, arg_77_2, arg_77_3, arg_77_4, arg_77_5, arg_77_6)
	onButton(arg_77_0, arg_77_1, function()
		SetActive(arg_77_0.redPacketUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_77_0.redPacketUI)
		setImageSprite(arg_77_0.redPacketUI:Find("panel/charaBg/chara"), LoadSprite("qicon/" .. arg_77_4), false)

		if not arg_77_3 then
			SetActive(arg_77_0.redPacketUI:Find("panel/panelBg"), true)
			SetActive(arg_77_0.redPacketUI:Find("panel/openImg"), false)
			SetActive(arg_77_0.redPacketUI:Find("panel/get"), true)
			SetActive(arg_77_0.redPacketUI:Find("panel/got"), false)
			SetActive(arg_77_0.redPacketUI:Find("panel/detail"), false)
			setText(arg_77_0.redPacketUI:Find("panel/get/titleBg/title"), arg_77_2.desc)
			onButton(arg_77_0, arg_77_0.redPacketUI:Find("panel/get/getBtn"), function()
				arg_77_0:emit(InstagramChatMediator.GET_REDPACKET, arg_77_5, arg_77_6, arg_77_2.id)
			end, SFX_PANEL)
		else
			arg_77_0:UpdateRedPacketUI(arg_77_2.id)
		end
	end, SFX_PANEL)
	onButton(arg_77_0, arg_77_0.redPacketUI:Find("bg"), function()
		arg_77_0:CloseRedPacketPanel()

		if arg_77_0.canFresh then
			arg_77_0.canFresh = false

			local var_80_0 = arg_77_0.currentChat.currentTopic:GetDisplayWordList()

			if var_80_0[#var_80_0].type == 0 then
				arg_77_0:UpdateCharaList(false, false)
			else
				arg_77_0:UpdateCharaList(true, false)
			end
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateRedPacketUI(arg_81_0, arg_81_1)
	local var_81_0 = var_0_2[arg_81_1]

	SetActive(arg_81_0.redPacketUI:Find("panel/panelBg"), true)
	SetActive(arg_81_0.redPacketUI:Find("panel/openImg"), false)
	SetActive(arg_81_0.redPacketUI:Find("panel/get"), false)
	SetActive(arg_81_0.redPacketUI:Find("panel/got"), true)
	SetActive(arg_81_0.redPacketUI:Find("panel/detail"), false)

	local var_81_1 = Drop.Create(var_81_0.content)

	var_81_1.count = 0

	updateDrop(arg_81_0.redPacketUI:Find("panel/got/item"), var_81_1)
	onButton(arg_81_0, arg_81_0.redPacketUI:Find("panel/got/item"), function()
		arg_81_0:emit(BaseUI.ON_DROP, var_81_1)
	end, SFX_PANEL)

	arg_81_0.redPacketUI:Find("panel/got/item/icon_bg"):GetComponent(typeof(Image)).enabled = false
	arg_81_0.redPacketUI:Find("panel/got/item/icon_bg/frame"):GetComponent(typeof(Image)).enabled = false

	setText(arg_81_0.redPacketUI:Find("panel/got/awardCount"), var_81_0.content[3])

	if var_81_0.type == 1 then
		SetActive(arg_81_0.redPacketUI:Find("panel/got/detailBtn"), false)
	else
		SetActive(arg_81_0.redPacketUI:Find("panel/got/detailBtn"), true)
		onButton(arg_81_0, arg_81_0.redPacketUI:Find("panel/got/detailBtn"), function()
			SetActive(arg_81_0.redPacketUI:Find("panel/panelBg"), false)
			SetActive(arg_81_0.redPacketUI:Find("panel/openImg"), true)
			SetActive(arg_81_0.redPacketUI:Find("panel/got"), false)
			SetActive(arg_81_0.redPacketUI:Find("panel/detail"), true)

			local var_83_0 = 0
			local var_83_1 = 0
			local var_83_2 = UIItemList.New(arg_81_0.redPacketUI:Find("panel/detail/detailScroll/Viewport/Content"), arg_81_0.redPacketUI:Find("panel/detail/detailScroll/Viewport/Content/charaGetCard"))

			var_83_2:make(function(arg_84_0, arg_84_1, arg_84_2)
				if arg_84_0 == UIItemList.EventUpdate then
					local var_84_0 = var_81_0.group_receive[arg_84_1 + 1]
					local var_84_1 = var_84_0[1]
					local var_84_2 = {
						var_84_0[2],
						var_84_0[3],
						var_84_0[4]
					}

					if var_84_0[1] ~= 0 then
						local var_84_3 = "unknown"

						if var_0_1[var_84_1] then
							var_84_3 = var_0_1[var_84_1].sculpture
						end

						setImageSprite(arg_84_2:Find("charaBg/chara"), LoadSprite("qicon/" .. var_84_3), false)
					else
						setImageSprite(arg_84_2:Find("charaBg/chara"), GetSpriteFromAtlas("ui/InstagramUI_atlas", "txdi_3"), false)
					end

					local var_84_4 = Drop.Create(var_84_2)

					var_84_4.count = 0

					updateDrop(arg_84_2:Find("item"), var_84_4)
					onButton(arg_81_0, arg_84_2:Find("item"), function()
						arg_81_0:emit(BaseUI.ON_DROP, var_84_4)
					end, SFX_PANEL)

					arg_84_2:Find("item/icon_bg"):GetComponent(typeof(Image)).enabled = false
					arg_84_2:Find("item/icon_bg/frame"):GetComponent(typeof(Image)).enabled = false

					setText(arg_84_2:Find("awardCount"), var_84_0[4])

					if var_84_0[4] > var_83_1 then
						var_83_0 = arg_84_1
						var_83_1 = var_84_0[4]
					end
				end
			end)
			var_83_2:align(#var_81_0.group_receive)

			for iter_83_0 = 1, #var_81_0.group_receive do
				SetActive(arg_81_0.redPacketUI:Find("panel/detail/detailScroll/Viewport/Content"):GetChild(iter_83_0 - 1):Find("charaBg/king"), var_83_0 == iter_83_0 - 1)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.CloseRedPacketPanel(arg_86_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_86_0.redPacketUI, arg_86_0._tf:Find("subPages"))
	SetActive(arg_86_0.redPacketUI, false)
end

function var_0_0.SetData(arg_87_0)
	local var_87_0 = getProxy(InstagramChatProxy)

	arg_87_0.allChatList = var_87_0:GetChatList()
	arg_87_0.chatList = table.insertto({}, arg_87_0.allChatList)

	var_87_0:SortChatList()
end

function var_0_0.willExit(arg_88_0)
	local var_88_0 = arg_88_0.rightPanel:Find("paintingMask/painting")

	if arg_88_0.paintingName then
		retPaintingPrefab(var_88_0, arg_88_0.paintingName)

		arg_88_0.paintingName = nil
	end

	arg_88_0:RemoveAllTimer()
end

function var_0_0.StartTimer(arg_89_0, arg_89_1, arg_89_2)
	local var_89_0 = Timer.New(arg_89_1, arg_89_2, 1)

	var_89_0:Start()
	table.insert(arg_89_0.timerList, var_89_0)
end

function var_0_0.RemoveAllTimer(arg_90_0)
	for iter_90_0, iter_90_1 in ipairs(arg_90_0.timerList) do
		iter_90_1:Stop()
	end

	arg_90_0.timerList = {}
end

function var_0_0.StartTimer2(arg_91_0, arg_91_1, arg_91_2)
	arg_91_0.timer = Timer.New(arg_91_1, arg_91_2, 1)

	arg_91_0.timer:Start()
end

function var_0_0.SpeedUpMessage(arg_92_0)
	local var_92_0 = pg.gameset.juuschat_dialogue_trigger_time.key_value / 1000
	local var_92_1 = pg.gameset.juuschat_entering_time.key_value / 1000

	for iter_92_0, iter_92_1 in ipairs(arg_92_0.timerList) do
		if iter_92_1.running then
			if iter_92_1.duration == var_92_1 then
				iter_92_1.time = 0.05
			elseif iter_92_1.time - var_92_0 < 0.05 then
				iter_92_1.time = 0.05

				arg_92_0:StartTimer2(function()
					arg_92_0:SpeedUpWaiting()
				end, 0.05)
			else
				iter_92_1.time = iter_92_1.time - var_92_0
			end
		end
	end
end

function var_0_0.SpeedUpWaiting(arg_94_0)
	local var_94_0 = pg.gameset.juuschat_entering_time.key_value / 1000

	for iter_94_0, iter_94_1 in ipairs(arg_94_0.timerList) do
		if iter_94_1.running and iter_94_1.duration == var_94_0 then
			iter_94_1.time = 0.05

			break
		end
	end
end

function var_0_0.ChangeFresh(arg_95_0)
	arg_95_0.canFresh = true
end

function var_0_0.ChangeCharaTextFunc(arg_96_0, arg_96_1, arg_96_2)
	local function var_96_0(arg_97_0)
		if arg_97_0:Find("id"):GetComponent(typeof(Text)).text == tostring(arg_96_1) then
			setText(arg_97_0:Find("msg"), arg_96_2)
		end
	end

	for iter_96_0 = 0, arg_96_0.charaScrollContent.childCount - 1 do
		local var_96_1 = arg_96_0.charaScrollContent:GetChild(iter_96_0)

		var_96_0(var_96_1)
	end
end

function var_0_0.ResetCharaTextFunc(arg_98_0, arg_98_1)
	local function var_98_0(arg_99_0)
		if arg_99_0:Find("id"):GetComponent(typeof(Text)).text == tostring(arg_98_1) then
			setText(arg_99_0:Find("msg"), arg_99_0:Find("displayWord"):GetComponent(typeof(Text)).text)
		end
	end

	for iter_98_0 = 0, arg_98_0.charaScrollContent.childCount - 1 do
		local var_98_1 = arg_98_0.charaScrollContent:GetChild(iter_98_0)

		var_98_0(var_98_1)
	end
end

function var_0_0.SetEndAniEvent(arg_100_0, arg_100_1, arg_100_2)
	local var_100_0 = arg_100_1:GetComponent(typeof(DftAniEvent))

	if var_100_0 then
		var_100_0:SetEndEvent(function()
			arg_100_2()
			var_100_0:SetEndEvent(nil)
		end)
	end
end

function var_0_0.onBackPressed(arg_102_0)
	if isActive(arg_102_0.filterUI) then
		arg_102_0:CloseFilterPanel()

		return
	end

	if isActive(arg_102_0.topicUI) then
		arg_102_0:CloseTopicPanel()

		return
	end

	if isActive(arg_102_0.backgroundUI) then
		arg_102_0:CloseBackgroundPanel()

		return
	end

	if isActive(arg_102_0.redPacketUI) then
		arg_102_0:CloseRedPacketPanel()

		return
	end

	arg_102_0:emit(InstagramChatMediator.CLOSE_ALL)
end

return var_0_0
