local var_0_0 = class("Dorm3dChatLayer", import("view.base.BaseUI"))
local var_0_1 = pg.dorm3d_ins_ship_group_template
local var_0_2 = pg.dorm3d_ins_redpackage
local var_0_3 = pg.emoji_template

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dChatUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rightPanel = arg_2_0:findTF("main/rightPanel")
	arg_2_0.characterName = arg_2_0:findTF("rightTop/name", arg_2_0.rightPanel)
	arg_2_0.careBtn = arg_2_0:findTF("rightTop/careBtn", arg_2_0.rightPanel)
	arg_2_0.topicBtn = arg_2_0:findTF("rightTop/topicBtn", arg_2_0.rightPanel)
	arg_2_0.backgroundBtn = arg_2_0:findTF("rightTop/backgroundBtn", arg_2_0.rightPanel)
	arg_2_0.messageList = UIItemList.New(arg_2_0:findTF("messageScroll/Viewport/Content", arg_2_0.rightPanel), arg_2_0:findTF("messageScroll/Viewport/Content/messageCard", arg_2_0.rightPanel))
	arg_2_0.optionPanel = arg_2_0:findTF("optionPanel", arg_2_0.rightPanel)
	arg_2_0.optionList = UIItemList.New(arg_2_0.optionPanel, arg_2_0:findTF("option", arg_2_0.optionPanel))
	arg_2_0.topicUI = arg_2_0:findTF("subPages/InstagramTopicUI")
	arg_2_0.backgroundUI = arg_2_0:findTF("subPages/InstagramBackgroundUI")
	arg_2_0.redPacketUI = arg_2_0:findTF("subPages/InstagramRedPacketUI")
	arg_2_0.pictureUI = arg_2_0:findTF("subPages/PictureUI")

	setText(arg_2_0:findTF("panel/topicScroll/Viewport/Content/topic/waiting", arg_2_0.topicUI), i18n("juuschat_chattip3"))
	setText(arg_2_0:findTF("panel/topicScroll/Viewport/Content/topic/selected/Text", arg_2_0.topicUI), i18n("juuschat_label2"))
	setText(arg_2_0:findTF("panel/backgroundScroll/Viewport/Content/background/selected/Text", arg_2_0.backgroundUI), i18n("juuschat_label1"))
	setText(arg_2_0:findTF("panel/backgroundScroll/Viewport/Content/background/lockFrame/Text", arg_2_0.backgroundUI), i18n("juuschat_background_tip1"))

	arg_2_0.redPacketGot = arg_2_0:findTF("panel/got", arg_2_0.redPacketUI)
	arg_2_0.noMessage = arg_2_0:findTF("noMessage", arg_2_0.rightPanel)

	setText(arg_2_0:findTF("Text", arg_2_0.noMessage), i18n("dorm3d_ins_no_topics"))

	if arg_2_0.contextData.tf then
		setParent(arg_2_0._tf, arg_2_0.contextData.tf)
	end

	SetActive(arg_2_0.topicUI, false)
	SetActive(arg_2_0.backgroundUI, false)
	SetActive(arg_2_0.redPacketUI, false)
	SetActive(arg_2_0.pictureUI, false)

	arg_2_0.timerList = {}
	arg_2_0.canFresh = false

	local var_2_0 = arg_2_0:findTF("messageScroll/Scrollbar Vertical", arg_2_0.rightPanel):GetComponent(typeof(RectTransform))

	arg_2_0.messageScrollWidth = var_2_0.rect.width
	arg_2_0.messageScrollHeight = var_2_0.rect.height

	arg_2_0:findTF("panel/title", arg_2_0.topicUI):GetComponent(typeof(Image)):SetNativeSize()
	arg_2_0:findTF("panel/title", arg_2_0.backgroundUI):GetComponent(typeof(Image)):SetNativeSize()
	onButton(arg_2_0, arg_2_0:findTF("closeBtn", arg_2_0.rightPanel), function()
		arg_2_0:closeView()
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:SetData()
	arg_4_0:UpdateChat(false, false)
end

function var_0_0.UpdateChat(arg_5_0, arg_5_1, arg_5_2)
	SetActive(arg_5_0.rightPanel, true)
	arg_5_0:UpdateChatContent(arg_5_1, arg_5_2)
	arg_5_0:SetTopicPanel(arg_5_0.currentChat)
	arg_5_0:SetBackgroundPanel(arg_5_0.currentChat)

	if not arg_5_1 then
		local var_5_0 = arg_5_0.rightPanel:GetComponent(typeof(Animation))

		var_5_0:Stop()
		var_5_0:Play("anim_newinstagram_chat_right_in")
	end
end

function var_0_0.UpdateChatContent(arg_6_0, arg_6_1, arg_6_2)
	SetActive(arg_6_0.rightPanel, true)
	setText(arg_6_0.characterName, arg_6_0.currentChat.name)

	local var_6_0 = arg_6_0:findTF("care", arg_6_0.careBtn)

	SetActive(var_6_0, arg_6_0.currentChat.care == 1)
	onButton(arg_6_0, arg_6_0.careBtn, function()
		local var_7_0 = arg_6_0.currentChat.care == 0 and 1 or 0

		arg_6_0:emit(Dorm3dChatMediator.CHANGE_CARE, arg_6_0.currentChat.characterId, var_7_0)
	end, SFX_PANEL)

	local var_6_1 = arg_6_0:findTF("paintingMask", arg_6_0.rightPanel)
	local var_6_2 = arg_6_0:findTF("painting", var_6_1)
	local var_6_3 = arg_6_0:findTF("groupBackground", arg_6_0.rightPanel)

	if not arg_6_0.currentChat.groupBackground or arg_6_0.currentChat.groupBackground == "" then
		SetActive(var_6_1, true)
		SetActive(var_6_3, false)

		local var_6_4 = "unknown"

		if arg_6_0.currentChat.skinId == 0 then
			var_6_4 = arg_6_0.currentChat:GetPainting()
		else
			for iter_6_0, iter_6_1 in ipairs(arg_6_0.currentChat.skins) do
				if iter_6_1.id == arg_6_0.currentChat.skinId then
					var_6_4 = iter_6_1.painting
				end
			end
		end

		if not arg_6_0.paintingName then
			setPaintingPrefabAsync(var_6_2, var_6_4, "pifu")

			arg_6_0.paintingName = var_6_4
		elseif arg_6_0.paintingName and arg_6_0.paintingName ~= var_6_4 then
			retPaintingPrefab(var_6_2, arg_6_0.paintingName)
			setPaintingPrefabAsync(var_6_2, var_6_4, "pifu")

			arg_6_0.paintingName = var_6_4
		end
	else
		SetActive(var_6_1, false)
		SetActive(var_6_3, true)

		if arg_6_0.paintingName then
			retPaintingPrefab(var_6_2, arg_6_0.paintingName)

			arg_6_0.paintingName = nil
		end

		setImageSprite(var_6_3, LoadSprite("ui/" .. arg_6_0.currentChat.groupBackground), true)
	end

	setActive(arg_6_0:findTF("messageScroll", arg_6_0.rightPanel), arg_6_0.currentChat.currentTopic)
	setActive(var_6_1, arg_6_0.currentChat.currentTopic)
	setActive(arg_6_0.noMessage, not arg_6_0.currentChat.currentTopic)

	if not arg_6_0.currentChat.currentTopic then
		return
	end

	local var_6_5 = arg_6_0.currentChat.currentTopic:GetDisplayWordList()

	if not arg_6_2 then
		arg_6_0:UpdateOptionPanel(arg_6_0.currentChat.currentTopic, var_6_5)
		arg_6_0:UpdateMessageList(arg_6_0.currentChat.currentTopic, var_6_5, arg_6_1, arg_6_0.currentChat.characterId)
	end

	if not arg_6_1 and arg_6_0.currentChat.currentTopic.readFlag == 0 then
		arg_6_0:emit(Dorm3dChatMediator.SET_READED, arg_6_0.currentChat.characterId, {
			arg_6_0.currentChat.currentTopic.topicId
		})
	end
end

function var_0_0.UpdateMessageList(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	arg_8_0:RemoveAllTimer()

	local var_8_0

	for iter_8_0 = #arg_8_2, 1, -1 do
		if arg_8_2[iter_8_0].ship_group == 0 or arg_8_2[iter_8_0].type == 3 and arg_8_1:RedPacketGotFlag(tonumber(arg_8_2[iter_8_0].param)) then
			var_8_0 = iter_8_0

			break
		end
	end

	local var_8_1 = {}

	if var_8_0 then
		for iter_8_1 = var_8_0, 1, -1 do
			if arg_8_2[iter_8_1].ship_group == 0 then
				table.insert(var_8_1, iter_8_1)
			else
				break
			end
		end
	end

	if arg_8_0.shouldShowOption and arg_8_3 then
		arg_8_0:SetOptionPanelActive(false)
	end

	if arg_8_3 then
		onButton(arg_8_0, arg_8_0:findTF("messageScroll", arg_8_0.rightPanel), function()
			arg_8_0:SpeedUpMessage()
		end, SFX_PANEL)
	end

	local var_8_2 = GetComponent(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel), typeof(ScrollRect))

	local function var_8_3(arg_10_0)
		local var_10_0 = Vector2(0, arg_10_0)

		var_8_2.normalizedPosition = var_10_0
	end

	local var_8_4 = pg.gameset.juuschat_dialogue_trigger_time.key_value / 1000
	local var_8_5 = pg.gameset.juuschat_entering_time.key_value / 1000
	local var_8_6 = var_8_4 - var_8_5

	arg_8_0.playbackInfos = {}

	arg_8_0.messageList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = arg_8_2[arg_11_1 + 1]

			if var_11_0.ship_group == 0 and var_11_0.type == 0 then
				SetActive(arg_11_2, false)

				return
			end

			local var_11_1 = arg_11_2:Find("charaMessageCard")
			local var_11_2 = arg_11_2:Find("playerReplyCard")

			SetActive(var_11_1, var_11_0.ship_group ~= 0)
			SetActive(var_11_2, var_11_0.ship_group == 0)
			SetActive(arg_11_2:Find("nameBar"), false)

			local var_11_3

			if arg_8_3 and var_8_0 and arg_11_1 + 1 > var_8_0 then
				var_11_3 = (arg_11_1 + 1 - var_8_0) * var_8_4 - var_8_5

				if #var_8_1 > 1 then
					var_11_3 = var_11_3 + (#var_8_1 - 1) * var_8_6
				end
			end

			if var_11_0.ship_group ~= 0 then
				local var_11_4 = "unknown"

				if var_0_1[var_11_0.ship_group] then
					var_11_4 = var_0_1[var_11_0.ship_group].sculpture
				end

				if var_11_0.type ~= 5 then
					setImageSprite(arg_11_2:Find("charaMessageCard/charaBg/chara"), LoadSprite("qicon/" .. var_11_4), false)
				end

				if var_11_0.type == 1 then
					arg_8_0:SetCharaMessageCardActive(var_11_1, {
						3
					})
					setText(arg_11_2:Find("charaMessageCard/msgBox/msg"), var_11_0.param)

					if arg_8_3 and var_8_0 and arg_11_1 + 1 > var_8_0 then
						SetActive(arg_11_2, false)
						arg_8_0:StartTimer(function()
							SetActive(arg_11_2, true)
							arg_11_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_11_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_11_2:Find("charaMessageCard/msgBox"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_8_0:StartTimer(function()
								SetActive(arg_11_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_11_2:Find("charaMessageCard/msgBox"), true)
								arg_11_2:Find("charaMessageCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_chat_common_in")

								if arg_11_1 + 1 == #arg_8_2 then
									arg_8_0:emit(Dorm3dChatMediator.SET_READED, arg_8_4, {
										arg_8_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_8_0:SetEndAniEvent(arg_11_2:Find("charaMessageCard/msgBox"), function()
									if arg_8_0.shouldShowOption and arg_11_1 + 1 == #arg_8_2 then
										arg_8_0:SetOptionPanelActive(true)
									end
								end)
							end, var_8_5)
						end, var_11_3)
					end
				elseif var_11_0.type == 2 then
					arg_8_0:SetCharaMessageCardActive(var_11_1, {
						2,
						7
					})
					pg.CriMgr.GetInstance():GetCueInfo("cv-" .. var_11_0.ship_group, var_11_0.param[1], function(arg_15_0)
						setText(arg_11_2:Find("charaMessageCard/voiceBox/time"), tostring(math.ceil(tonumber(tostring(arg_15_0.length)) / 1000)) .. "\"")
					end)

					arg_8_0.playbackInfos[var_11_0.id] = nil

					setActive(arg_11_2:Find("charaMessageCard/voiceBox/play/pause"), false)
					onButton(arg_8_0, arg_11_2:Find("charaMessageCard/voiceBox/play"), function()
						if arg_8_0.playbackInfos[var_11_0.id].playback:GetStatus() == CriAtomExPlayback.Status.Removed then
							arg_8_0.playbackInfos[var_11_0.id] = nil
						end

						if not arg_8_0.playbackInfos[var_11_0.id] then
							pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/cv/" .. var_11_0.ship_group .. "/" .. var_11_0.param[1], function(arg_17_0)
								if arg_17_0 then
									arg_8_0.playbackInfos[var_11_0.id] = arg_17_0
								end
							end)
							setActive(arg_11_2:Find("charaMessageCard/voiceBox/play/pause"), true)
						elseif arg_8_0.playbackInfos[var_11_0.id].playback:IsPaused() then
							arg_8_0.playbackInfos[var_11_0.id].playback:Resume(CriWare.CriAtomEx.ResumeMode.PausedPlayback)
							setActive(arg_11_2:Find("charaMessageCard/voiceBox/play/pause"), true)
						else
							arg_8_0.playbackInfos[var_11_0.id].playback:Pause()
							setActive(arg_11_2:Find("charaMessageCard/voiceBox/play/pause"), false)
						end
					end, SFX_PANEL)
					setText(arg_11_2:Find("charaMessageCard/voiceMsgBox/voiceMsg/msg"), var_11_0.param[2])

					if arg_8_3 and var_8_0 and arg_11_1 + 1 > var_8_0 then
						SetActive(arg_11_2, false)
						arg_8_0:StartTimer(function()
							SetActive(arg_11_2, true)
							arg_11_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_11_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_11_2:Find("charaMessageCard/voiceBox"), false)
							SetActive(arg_11_2:Find("charaMessageCard/voiceMsgBox"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_8_0:StartTimer(function()
								SetActive(arg_11_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_11_2:Find("charaMessageCard/voiceBox"), true)
								SetActive(arg_11_2:Find("charaMessageCard/voiceMsgBox"), true)
								arg_11_2:Find("charaMessageCard/voiceBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_chat_common_in")
								arg_11_2:Find("charaMessageCard/voiceMsgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_voicetip_in")

								if arg_11_1 + 1 == #arg_8_2 then
									arg_8_0:emit(Dorm3dChatMediator.SET_READED, arg_8_4, {
										arg_8_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_8_0:SetEndAniEvent(arg_11_2:Find("charaMessageCard/voiceBox"), function()
									if arg_8_0.shouldShowOption and arg_11_1 + 1 == #arg_8_2 then
										arg_8_0:SetOptionPanelActive(true)
									end
								end)
							end, var_8_5)
						end, var_11_3)
					end
				elseif var_11_0.type == 3 then
					arg_8_0:SetCharaMessageCardActive(var_11_1, {
						5
					})

					local var_11_5 = var_0_2[tonumber(var_11_0.param)]

					setText(arg_11_2:Find("charaMessageCard/redPacket/desc"), var_11_5.desc)

					local var_11_6 = arg_8_1:RedPacketGotFlag(var_11_5.id)

					SetActive(arg_11_2:Find("charaMessageCard/redPacket/got"), var_11_6)
					arg_8_0:SetRedPacketPanel(arg_11_2:Find("charaMessageCard/redPacket"), var_11_5, var_11_6, var_11_4, arg_8_4, arg_8_1.topicId, var_11_0.id)

					if arg_8_3 and var_8_0 and arg_11_1 + 1 > var_8_0 then
						SetActive(arg_11_2, false)
						arg_8_0:StartTimer(function()
							SetActive(arg_11_2, true)
							arg_11_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_11_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_11_2:Find("charaMessageCard/redPacket"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_8_0:StartTimer(function()
								SetActive(arg_11_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_11_2:Find("charaMessageCard/redPacket"), true)
								arg_11_2:Find("charaMessageCard/redPacket"):GetComponent(typeof(Animation)):Play("anim_newinstagram_redpacket_in")

								if arg_11_1 + 1 == #arg_8_2 then
									arg_8_0:emit(Dorm3dChatMediator.SET_READED, arg_8_4, {
										arg_8_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_8_0:SetEndAniEvent(arg_11_2:Find("charaMessageCard/redPacket"), function()
									if arg_8_0.shouldShowOption and arg_11_1 + 1 == #arg_8_2 then
										arg_8_0:SetOptionPanelActive(true)
									end
								end)
							end, var_8_5)
						end, var_11_3)
					end
				elseif var_11_0.type == 4 then
					arg_8_0:SetCharaMessageCardActive(var_11_1, {
						4
					})
					arg_8_0:ClearEmoji(arg_11_2:Find("charaMessageCard/emoji/emoticon"))
					arg_8_0:SetEmoji(arg_11_2:Find("charaMessageCard/emoji/emoticon"), var_0_3[tonumber(var_11_0.param)].pic)

					if arg_8_3 and var_8_0 and arg_11_1 + 1 > var_8_0 then
						SetActive(arg_11_2, false)
						arg_8_0:StartTimer(function()
							SetActive(arg_11_2, true)
							arg_11_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_11_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_11_2:Find("charaMessageCard/emoji"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_8_0:StartTimer(function()
								SetActive(arg_11_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_11_2:Find("charaMessageCard/emoji"), true)
								arg_11_2:Find("charaMessageCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

								if arg_11_1 + 1 == #arg_8_2 then
									arg_8_0:emit(Dorm3dChatMediator.SET_READED, arg_8_4, {
										arg_8_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_8_0:SetEndAniEvent(arg_11_2:Find("charaMessageCard/emoji"), function()
									if arg_8_0.shouldShowOption and arg_11_1 + 1 == #arg_8_2 then
										arg_8_0:SetOptionPanelActive(true)
									end
								end)
							end, var_8_5)
						end, var_11_3)
					end
				elseif var_11_0.type == 5 then
					arg_8_0:SetCharaMessageCardActive(var_11_1, {
						6
					})

					local var_11_7 = var_11_0.param

					for iter_11_0 in string.gmatch(var_11_0.param, "'%d+'") do
						local var_11_8 = string.sub(iter_11_0, 2, #iter_11_0 - 1)

						var_11_7 = string.gsub(var_11_7, iter_11_0, "<color=#93e9ff>" .. var_0_1[tonumber(var_11_8)].name .. "</color>")
					end

					setText(arg_11_2:Find("charaMessageCard/systemTip/panel/Text"), var_11_7)

					if arg_8_3 and var_8_0 and arg_11_1 + 1 > var_8_0 then
						SetActive(arg_11_2, false)
						arg_8_0:StartTimer(function()
							SetActive(arg_11_2, true)
							arg_11_2:Find("charaMessageCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")

							if arg_11_1 + 1 == #arg_8_2 then
								arg_8_0:emit(Dorm3dChatMediator.SET_READED, arg_8_4, {
									arg_8_1.topicId
								})
							end

							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_8_0:SetEndAniEvent(arg_11_2:Find("charaMessageCard/systemTip"), function()
								if arg_8_0.shouldShowOption and arg_11_1 + 1 == #arg_8_2 then
									arg_8_0:SetOptionPanelActive(true)
								end
							end)
						end, var_11_3)
					end
				elseif var_11_0.type == 6 then
					arg_8_0:SetCharaMessageCardActive(var_11_1, {
						8
					})
					setImageSprite(arg_11_2:Find("charaMessageCard/picture/mask/img"), LoadSprite("dorm3dprivatechat/" .. var_11_0.param), false)
					arg_8_0:SetPicturePanel(arg_11_2:Find("charaMessageCard/picture/mask/img"), var_11_0.param)

					if arg_8_3 and var_8_0 and arg_11_1 + 1 > var_8_0 then
						SetActive(arg_11_2, false)
						arg_8_0:StartTimer(function()
							SetActive(arg_11_2, true)
							arg_11_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_11_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_11_2:Find("charaMessageCard/picture"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_8_0:StartTimer(function()
								SetActive(arg_11_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_11_2:Find("charaMessageCard/picture"), true)
								arg_11_2:Find("charaMessageCard/picture"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

								if arg_11_1 + 1 == #arg_8_2 then
									arg_8_0:emit(Dorm3dChatMediator.SET_READED, arg_8_4, {
										arg_8_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_8_0:SetEndAniEvent(arg_11_2:Find("charaMessageCard/picture"), function()
									if arg_8_0.shouldShowOption and arg_11_1 + 1 == #arg_8_2 then
										arg_8_0:SetOptionPanelActive(true)
									end
								end)
							end, var_8_5)
						end, var_11_3)
					end
				end
			else
				if var_11_0.type == 1 then
					arg_8_0:SetPlayerMessageCardActive(var_11_2, {
						0
					})
					setText(arg_11_2:Find("playerReplyCard/msgBox/msg"), var_11_0.param)
				elseif var_11_0.type == 4 then
					arg_8_0:SetPlayerMessageCardActive(var_11_2, {
						1
					})
					arg_8_0:ClearEmoji(arg_11_2:Find("playerReplyCard/emoji/emoticon"))
					arg_8_0:SetEmoji(arg_11_2:Find("playerReplyCard/emoji/emoticon"), var_0_3[tonumber(var_11_0.param)].pic)
				elseif var_11_0.type == 5 then
					arg_8_0:SetPlayerMessageCardActive(var_11_2, {
						2
					})

					local var_11_9 = var_11_0.param

					for iter_11_1 in string.gmatch(var_11_0.param, "'%d+'") do
						local var_11_10 = string.sub(iter_11_1, 2, #iter_11_1 - 1)

						var_11_9 = string.gsub(var_11_9, iter_11_1, "<color=#93e9ff>" .. var_0_1[tonumber(var_11_10)].name .. "</color>")
					end

					setText(arg_11_2:Find("playerReplyCard/systemTip/panel/Text"), var_11_9)
				end

				if arg_8_3 and var_8_0 and _.contains(var_8_1, arg_11_1 + 1) then
					if table.indexof(var_8_1, arg_11_1 + 1) < #var_8_1 then
						SetActive(arg_11_2, false)
						arg_8_0:StartTimer(function()
							SetActive(arg_11_2, true)

							if var_11_0.type == 1 then
								arg_11_2:Find("playerReplyCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_playerchat_common_in")
							elseif var_11_0.type == 4 then
								arg_11_2:Find("playerReplyCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")
							elseif var_11_0.type == 5 then
								arg_11_2:Find("playerReplyCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")
							end

							if arg_11_1 + 1 == #arg_8_2 then
								arg_8_0:emit(Dorm3dChatMediator.SET_READED, arg_8_4, {
									arg_8_1.topicId
								})
							end

							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
						end, (#var_8_1 - table.indexof(var_8_1, arg_11_1 + 1)) * var_8_6)
					else
						if var_11_0.type == 1 then
							arg_11_2:Find("playerReplyCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_playerchat_common_in")
						elseif var_11_0.type == 4 then
							arg_11_2:Find("playerReplyCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")
						elseif var_11_0.type == 5 then
							arg_11_2:Find("playerReplyCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")
						end

						if arg_11_1 + 1 == #arg_8_2 then
							arg_8_0:emit(Dorm3dChatMediator.SET_READED, arg_8_4, {
								arg_8_1.topicId
							})
						end
					end
				end
			end

			if not arg_8_1:isWaiting() and arg_11_1 + 1 == #arg_8_2 then
				if arg_8_3 then
					if var_11_0.ship_group ~= 0 then
						arg_8_0:StartTimer(function()
							setActive(arg_11_2:Find("end"), true)
						end, var_11_3 + var_8_4)
					else
						arg_8_0:StartTimer(function()
							setActive(arg_11_2:Find("end"), true)
						end, (#var_8_1 - table.indexof(var_8_1, arg_11_1 + 1)) * var_8_6 + var_8_6)
					end
				else
					setActive(arg_11_2:Find("end"), true)
				end
			else
				setActive(arg_11_2:Find("end"), false)
			end
		end
	end)
	arg_8_0.messageList:align(#arg_8_2)

	if arg_8_3 then
		Canvas.ForceUpdateCanvases()
		LeanTween.value(go(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel)), var_8_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_8_3)):setEase(LeanTweenType.easeInOutCubic)
	else
		scrollToBottom(arg_8_0:findTF("messageScroll", arg_8_0.rightPanel))
	end
end

function var_0_0.SetCharaMessageCardActive(arg_35_0, arg_35_1, arg_35_2)
	if _.contains(arg_35_2, 6) then
		SetActive(arg_35_1:GetChild(0), false)
	else
		SetActive(arg_35_1:GetChild(0), true)
	end

	for iter_35_0 = 1, arg_35_1.childCount - 1 do
		if _.contains(arg_35_2, iter_35_0) then
			SetActive(arg_35_1:GetChild(iter_35_0), true)
		else
			SetActive(arg_35_1:GetChild(iter_35_0), false)
		end
	end
end

function var_0_0.SetPlayerMessageCardActive(arg_36_0, arg_36_1, arg_36_2)
	for iter_36_0 = 0, arg_36_1.childCount - 1 do
		if _.contains(arg_36_2, iter_36_0) then
			SetActive(arg_36_1:GetChild(iter_36_0), true)
		else
			SetActive(arg_36_1:GetChild(iter_36_0), false)
		end
	end
end

function var_0_0.SetEmoji(arg_37_0, arg_37_1, arg_37_2)
	PoolMgr.GetInstance():GetPrefab("emoji/" .. arg_37_2, arg_37_2, true, function(arg_38_0)
		if not IsNil(arg_37_1) then
			arg_38_0.name = arg_37_2
			tf(arg_38_0).sizeDelta = arg_37_1.sizeDelta
			tf(arg_38_0).anchoredPosition = Vector2.zero

			local var_38_0 = arg_38_0:GetComponent("Animator")

			if var_38_0 then
				var_38_0.enabled = true
			end

			setParent(arg_38_0, arg_37_1, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. arg_37_2, arg_37_2, arg_38_0)
		end
	end)
end

function var_0_0.ClearEmoji(arg_39_0, arg_39_1)
	eachChild(arg_39_1, function(arg_40_0)
		local var_40_0 = go(arg_40_0)

		PoolMgr.GetInstance():ReturnPrefab("emoji/" .. var_40_0.name, var_40_0.name, var_40_0)
	end)
end

function var_0_0.UpdateOptionPanel(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_2[#arg_41_2].option

	if var_41_0 and type(var_41_0) == "table" then
		arg_41_0.shouldShowOption = true
		arg_41_0.optionCount = #var_41_0

		arg_41_0:SetOptionPanelActive(true)
		arg_41_0.optionList:make(function(arg_42_0, arg_42_1, arg_42_2)
			if arg_42_0 == UIItemList.EventUpdate then
				local var_42_0 = var_41_0[arg_42_1 + 1]

				setText(arg_42_2:Find("Text"), HXSet.hxLan(var_42_0[2]))
				onButton(arg_41_0, arg_42_2, function()
					arg_41_0:emit(Dorm3dChatMediator.REPLY, arg_41_1.characterId, arg_41_1.topicId, arg_41_2[#arg_41_2].id, var_42_0[1])
				end, SFX_PANEL)
			end
		end)
		arg_41_0.optionList:align(#var_41_0)
	else
		arg_41_0:SetOptionPanelActive(false)

		arg_41_0.shouldShowOption = false
	end
end

function var_0_0.SetOptionPanelActive(arg_44_0, arg_44_1)
	SetActive(arg_44_0.optionPanel, arg_44_1)

	local var_44_0 = arg_44_0:findTF("messageScroll/Viewport/Content", arg_44_0.rightPanel):GetComponent(typeof(VerticalLayoutGroup))
	local var_44_1 = UnityEngine.RectOffset.New()

	var_44_1.left = 0
	var_44_1.right = 0
	var_44_1.top = 0

	local var_44_2 = arg_44_0:findTF("messageScroll/Scrollbar Vertical", arg_44_0.rightPanel):GetComponent(typeof(RectTransform))

	if arg_44_1 then
		var_44_1.bottom = 42 + 88 * arg_44_0.optionCount
		var_44_2.sizeDelta = Vector2(arg_44_0.messageScrollWidth, -var_44_1.bottom)
	else
		var_44_1.bottom = 50
		var_44_2.sizeDelta = Vector2(arg_44_0.messageScrollWidth, 0)
	end

	var_44_0.padding = var_44_1

	scrollToBottom(arg_44_0:findTF("messageScroll", arg_44_0.rightPanel))
end

function var_0_0.SetTopicPanel(arg_45_0, arg_45_1)
	SetActive(arg_45_0:findTF("tip", arg_45_0.topicBtn), arg_45_1:GetCharacterEndFlagExceptCurrent() == 0)
	onButton(arg_45_0, arg_45_0.topicBtn, function()
		SetActive(arg_45_0.topicUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_45_0.topicUI, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})

		arg_45_0.currentTopic = nil

		local var_46_0 = UIItemList.New(arg_45_0:findTF("panel/topicScroll/Viewport/Content", arg_45_0.topicUI), arg_45_0:findTF("panel/topicScroll/Viewport/Content/topic", arg_45_0.topicUI))

		var_46_0:make(function(arg_47_0, arg_47_1, arg_47_2)
			if arg_47_0 == UIItemList.EventUpdate then
				arg_45_1:SortTopicList()

				local var_47_0 = arg_45_1.topics[arg_47_1 + 1]

				setScrollText(arg_47_2:Find("mask/name"), HXSet.hxLan(var_47_0.name))
				SetActive(arg_47_2:Find("lock"), not var_47_0.active)
				SetActive(arg_47_2:Find("waiting"), var_47_0.active and var_47_0:isWaiting())
				SetActive(arg_47_2:Find("complete"), var_47_0.active and var_47_0:IsCompleted())
				SetActive(arg_47_2:Find("selectedFrame"), arg_45_1.currentTopicId == var_47_0.topicId)
				SetActive(arg_47_2:Find("selected"), arg_45_1.currentTopicId == var_47_0.topicId)
				SetActive(arg_47_2:Find("tip"), var_47_0.active and not var_47_0:IsCompleted())

				if arg_45_1.currentTopicId == var_47_0.topicId then
					arg_45_0.currentTopic = var_47_0
				end

				if var_47_0.active then
					onButton(arg_45_0, arg_47_2, function()
						SetActive(arg_47_2:Find("selectedFrame"), true)

						for iter_48_0 = 1, #arg_45_1.topics do
							if iter_48_0 ~= arg_47_1 + 1 then
								SetActive(arg_45_0:findTF("selectedFrame", arg_45_0:findTF("panel/topicScroll/Viewport/Content", arg_45_0.topicUI):GetChild(iter_48_0 - 1)), false)
							end
						end

						arg_45_0.currentTopic = var_47_0
					end, SFX_PANEL)
				else
					onButton(arg_45_0, arg_47_2, function()
						pg.TipsMgr.GetInstance():ShowTips(var_47_0.unlockDesc)
					end, SFX_PANEL)
				end
			end
		end)
		var_46_0:align(#arg_45_1.topics)
	end, SFX_PANEL)
	onButton(arg_45_0, arg_45_0:findTF("bg", arg_45_0.topicUI), function()
		arg_45_0:CloseTopicPanel()
	end, SFX_PANEL)
	onButton(arg_45_0, arg_45_0:findTF("panel/bottom/close", arg_45_0.topicUI), function()
		arg_45_0:CloseTopicPanel()
	end, SFX_PANEL)
	onButton(arg_45_0, arg_45_0:findTF("panel/bottom/ok", arg_45_0.topicUI), function()
		arg_45_0:emit(Dorm3dChatMediator.SET_CURRENT_TOPIC, arg_45_0.currentTopic.characterId, arg_45_0.currentTopic.topicId)
		arg_45_0:CloseTopicPanel()

		local var_52_0 = arg_45_0.rightPanel:GetComponent(typeof(Animation))

		var_52_0:Stop()
		var_52_0:Play("anim_newinstagram_chat_right_in")
	end, SFX_PANEL)
end

function var_0_0.CloseTopicPanel(arg_53_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_53_0.topicUI, arg_53_0:findTF("subPages"))
	SetActive(arg_53_0.topicUI, false)
end

function var_0_0.SetBackgroundPanel(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_1:GetPaintingId()

	onButton(arg_54_0, arg_54_0.backgroundBtn, function()
		SetActive(arg_54_0.backgroundUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_54_0.backgroundUI, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})

		arg_54_0.currentBgId = nil

		local var_55_0 = UIItemList.New(arg_54_0:findTF("panel/backgroundScroll/Viewport/Content", arg_54_0.backgroundUI), arg_54_0:findTF("panel/backgroundScroll/Viewport/Content/background", arg_54_0.backgroundUI))

		var_55_0:make(function(arg_56_0, arg_56_1, arg_56_2)
			if arg_56_0 == UIItemList.EventUpdate then
				local var_56_0 = arg_54_1.skins[arg_56_1 + 1]
				local var_56_1 = 0

				if var_56_0.id ~= var_54_0 then
					var_56_1 = var_56_0.id
				end

				local var_56_2 = var_56_0.painting

				LoadImageSpriteAsync("herohrzicon/" .. var_56_2, arg_56_2:Find("skinMask/skin"), false)
				setScrollText(arg_56_2:Find("skinMask/Panel/mask/Text"), var_56_0.name)

				local var_56_3 = getProxy(ShipSkinProxy):hasSkin(var_56_0.id) or var_56_0.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or var_56_0.skin_type == ShipSkin.SKIN_TYPE_PROPOSE or var_56_0.skin_type == ShipSkin.SKIN_TYPE_REMAKE

				SetActive(arg_56_2:Find("lockFrame"), not var_56_3)
				SetActive(arg_56_2:Find("selectedFrame"), arg_54_1.skinId == var_56_1)
				SetActive(arg_56_2:Find("selected"), arg_54_1.skinId == var_56_1)

				if arg_54_1.skinId == var_56_1 then
					arg_54_0.currentBgId = var_56_1
				end

				onButton(arg_54_0, arg_56_2, function()
					if var_56_3 then
						SetActive(arg_56_2:Find("selectedFrame"), true)

						for iter_57_0 = 1, #arg_54_1.skins do
							if iter_57_0 ~= arg_56_1 + 1 then
								local var_57_0 = arg_54_0:findTF("panel/backgroundScroll/Viewport/Content", arg_54_0.backgroundUI):GetChild(iter_57_0 - 1)

								SetActive(arg_54_0:findTF("selectedFrame", var_57_0), false)
							end
						end

						arg_54_0.currentBgId = var_56_1
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("juuschat_background_tip2"))
					end
				end, SFX_PANEL)
			end
		end)
		var_55_0:align(#arg_54_1.skins)
	end, SFX_PANEL)
	onButton(arg_54_0, arg_54_0:findTF("bg", arg_54_0.backgroundUI), function()
		arg_54_0:CloseBackgroundPanel()
	end, SFX_PANEL)
	onButton(arg_54_0, arg_54_0:findTF("panel/bottom/close", arg_54_0.backgroundUI), function()
		arg_54_0:CloseBackgroundPanel()
	end, SFX_PANEL)
	onButton(arg_54_0, arg_54_0:findTF("panel/bottom/ok", arg_54_0.backgroundUI), function()
		arg_54_0:emit(Dorm3dChatMediator.SET_CURRENT_BACKGROUND, arg_54_1.characterId, arg_54_0.currentBgId)
		arg_54_0:CloseBackgroundPanel()
	end, SFX_PANEL)
end

function var_0_0.CloseBackgroundPanel(arg_61_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_61_0.backgroundUI, arg_61_0:findTF("subPages"))
	SetActive(arg_61_0.backgroundUI, false)
end

function var_0_0.SetRedPacketPanel(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4, arg_62_5, arg_62_6, arg_62_7)
	onButton(arg_62_0, arg_62_1, function()
		SetActive(arg_62_0.redPacketUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_62_0.redPacketUI, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})
		setImageSprite(arg_62_0:findTF("panel/charaBg/chara", arg_62_0.redPacketUI), LoadSprite("qicon/" .. arg_62_4), false)

		if not arg_62_3 then
			SetActive(arg_62_0:findTF("panel/get", arg_62_0.redPacketUI), true)
			SetActive(arg_62_0:findTF("panel/got", arg_62_0.redPacketUI), false)
			SetActive(arg_62_0:findTF("panel/detail", arg_62_0.redPacketUI), false)
			setText(arg_62_0:findTF("panel/get/titleBg/title", arg_62_0.redPacketUI), arg_62_2.desc)
			onButton(arg_62_0, arg_62_0:findTF("panel/get/getBtn", arg_62_0.redPacketUI), function()
				arg_62_0:emit(Dorm3dChatMediator.GET_REDPACKET, arg_62_5, arg_62_6, arg_62_7, arg_62_2.id)
			end, SFX_PANEL)
		else
			arg_62_0:UpdateRedPacketUI(arg_62_2.id)
		end
	end, SFX_PANEL)
	onButton(arg_62_0, arg_62_0:findTF("bg", arg_62_0.redPacketUI), function()
		arg_62_0:CloseRedPacketPanel()

		if arg_62_0.canFresh then
			arg_62_0.canFresh = false

			local var_65_0 = arg_62_0.currentChat.currentTopic:GetDisplayWordList()

			if var_65_0[#var_65_0].type == 0 then
				arg_62_0:UpdateChat(false, false)
			else
				arg_62_0:UpdateChat(true, false)
			end
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateRedPacketUI(arg_66_0, arg_66_1)
	local var_66_0 = var_0_2[arg_66_1]

	SetActive(arg_66_0:findTF("panel/get", arg_66_0.redPacketUI), false)
	SetActive(arg_66_0:findTF("panel/got", arg_66_0.redPacketUI), true)
	SetActive(arg_66_0:findTF("panel/detail", arg_66_0.redPacketUI), false)

	local var_66_1 = Drop.Create(var_66_0.content)

	var_66_1.count = 0

	updateDrop(arg_66_0:findTF("panel/got/item", arg_66_0.redPacketUI), var_66_1)
	onButton(arg_66_0, arg_66_0:findTF("panel/got/item", arg_66_0.redPacketUI), function()
		arg_66_0:emit(BaseUI.ON_DROP, var_66_1)
	end, SFX_PANEL)

	arg_66_0:findTF("panel/got/item/icon_bg", arg_66_0.redPacketUI):GetComponent(typeof(Image)).enabled = false
	arg_66_0:findTF("panel/got/item/icon_bg/frame", arg_66_0.redPacketUI):GetComponent(typeof(Image)).enabled = false

	setText(arg_66_0:findTF("panel/got/awardCount", arg_66_0.redPacketUI), var_66_0.content[3])
end

function var_0_0.CloseRedPacketPanel(arg_68_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_68_0.redPacketUI, arg_68_0:findTF("subPages"))
	SetActive(arg_68_0.redPacketUI, false)
end

function var_0_0.SetPicturePanel(arg_69_0, arg_69_1, arg_69_2)
	onButton(arg_69_0, arg_69_1, function()
		setActive(arg_69_0.pictureUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_69_0.pictureUI, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})
		setImageSprite(arg_69_0:findTF("picture", arg_69_0.pictureUI), LoadSprite("dorm3dprivatechat/" .. arg_69_2), true)
	end, SFX_PANEL)
	onButton(arg_69_0, arg_69_0:findTF("bg", arg_69_0.pictureUI), function()
		arg_69_0:ClosePicturePanel()
	end, SFX_PANEL)
	onButton(arg_69_0, arg_69_0:findTF("closeBtn", arg_69_0.pictureUI), function()
		arg_69_0:ClosePicturePanel()
	end, SFX_PANEL)
end

function var_0_0.ClosePicturePanel(arg_73_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_73_0.pictureUI, arg_73_0:findTF("subPages"))
	SetActive(arg_73_0.pictureUI, false)
end

function var_0_0.SetData(arg_74_0)
	arg_74_0.currentChat = getProxy(Dorm3dChatProxy):GetCharacterChatById(arg_74_0.contextData.chatId)

	getProxy(Dorm3dChatProxy):AutoChangeCurrentTopic(arg_74_0.currentChat)
end

function var_0_0.willExit(arg_75_0)
	local var_75_0 = arg_75_0:findTF("paintingMask/painting", arg_75_0.rightPanel)

	if arg_75_0.paintingName then
		retPaintingPrefab(var_75_0, arg_75_0.paintingName)

		arg_75_0.paintingName = nil
	end

	arg_75_0:RemoveAllTimer()
end

function var_0_0.StartTimer(arg_76_0, arg_76_1, arg_76_2)
	local var_76_0 = Timer.New(arg_76_1, arg_76_2, 1)

	var_76_0:Start()
	table.insert(arg_76_0.timerList, var_76_0)
end

function var_0_0.RemoveAllTimer(arg_77_0)
	for iter_77_0, iter_77_1 in ipairs(arg_77_0.timerList) do
		iter_77_1:Stop()
	end

	arg_77_0.timerList = {}
end

function var_0_0.StartTimer2(arg_78_0, arg_78_1, arg_78_2)
	arg_78_0.timer = Timer.New(arg_78_1, arg_78_2, 1)

	arg_78_0.timer:Start()
end

function var_0_0.SpeedUpMessage(arg_79_0)
	local var_79_0 = pg.gameset.juuschat_dialogue_trigger_time.key_value / 1000
	local var_79_1 = pg.gameset.juuschat_entering_time.key_value / 1000

	for iter_79_0, iter_79_1 in ipairs(arg_79_0.timerList) do
		if iter_79_1.running then
			if iter_79_1.duration == var_79_1 then
				iter_79_1.time = 0.05
			elseif iter_79_1.time - var_79_0 < 0.05 then
				iter_79_1.time = 0.05

				arg_79_0:StartTimer2(function()
					arg_79_0:SpeedUpWaiting()
				end, 0.05)
			else
				iter_79_1.time = iter_79_1.time - var_79_0
			end
		end
	end
end

function var_0_0.SpeedUpWaiting(arg_81_0)
	local var_81_0 = pg.gameset.juuschat_entering_time.key_value / 1000

	for iter_81_0, iter_81_1 in ipairs(arg_81_0.timerList) do
		if iter_81_1.running and iter_81_1.duration == var_81_0 then
			iter_81_1.time = 0.05

			break
		end
	end
end

function var_0_0.ChangeFresh(arg_82_0)
	arg_82_0.canFresh = true
end

function var_0_0.SetEndAniEvent(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0 = arg_83_1:GetComponent(typeof(DftAniEvent))

	if var_83_0 then
		var_83_0:SetEndEvent(function()
			arg_83_2()
			var_83_0:SetEndEvent(nil)
		end)
	end
end

function var_0_0.onBackPressed(arg_85_0)
	if isActive(arg_85_0.topicUI) then
		arg_85_0:CloseTopicPanel()

		return
	end

	if isActive(arg_85_0.backgroundUI) then
		arg_85_0:CloseBackgroundPanel()

		return
	end

	if isActive(arg_85_0.redPacketUI) then
		arg_85_0:CloseRedPacketPanel()

		return
	end

	if isActive(arg_85_0.pictureUI) then
		arg_85_0:ClosePicturePanel()

		return
	end

	arg_85_0:closeView()
end

return var_0_0
