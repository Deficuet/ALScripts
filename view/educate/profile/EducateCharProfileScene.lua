local var_0_0 = class("EducateCharProfileScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EducateCharProfileUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/educatecharprofileui",
		"cue/story-richang-8.b"
	}

	local function var_2_1()
		local var_3_0 = {}

		for iter_3_0, iter_3_1 in ipairs(pg.secretary_special_ship.all) do
			local var_3_1 = pg.secretary_special_ship[iter_3_1].painting

			if var_3_1 then
				table.insert(var_3_0, "painting/" .. var_3_1)
				table.insert(var_3_0, "paintingface/" .. var_3_1)
			end
		end

		return var_3_0
	end

	return ResPathSupport.MergeLuaArr(var_2_0, var_2_1())
end

function var_0_0.init(arg_4_0)
	arg_4_0.backBtn = arg_4_0._tf:Find("adapt/top/back")
	arg_4_0.homeBtn = arg_4_0._tf:Find("adapt/top/home")
	arg_4_0.paintingTr = arg_4_0._tf:Find("main/mask/painting")
	arg_4_0.chatTf = arg_4_0._tf:Find("main/chat")
	arg_4_0.chatTxt = arg_4_0.chatTf:Find("Text"):GetComponent(typeof(Text))
	arg_4_0.toggleUIItemList = UIItemList.New(arg_4_0._tf:Find("main/tag"), arg_4_0._tf:Find("main/tag/tpl"))
	arg_4_0.wordUIItemList = UIItemList.New(arg_4_0._tf:Find("main/list/content"), arg_4_0._tf:Find("main/list/content/tpl"))
	arg_4_0.tabItemList = UIItemList.New(arg_4_0._tf:Find("tab/list"), arg_4_0._tf:Find("tab/list/tpl"))
	arg_4_0.cvLoader = EducateCharCvLoader.New()
	arg_4_0.animation = arg_4_0._tf:GetComponent(typeof(Animation))
	arg_4_0.timers = {}
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		arg_5_0:emit(var_0_0.ON_BACK)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.homeBtn, function()
		arg_5_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	arg_5_0:InitTabs()
	arg_5_0:InitToggles()
end

function var_0_0.InitTabs(arg_8_0)
	arg_8_0.characterList = NewEducateHelper.GetEducateCharacterList()
	arg_8_0.selectedCharacterId = arg_8_0.contextData.selectedCharacterId

	arg_8_0.tabItemList:make(function(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0 = arg_9_1 + 1
		local var_9_1 = arg_8_0.characterList[var_9_0]

		if arg_9_0 == UIItemList.EventUpdate then
			setActive(arg_9_2:Find("lock"), var_9_1:IsLock())
			setActive(arg_9_2:Find("border/selected"), var_9_0 == arg_8_0.selectedCharacterId)
			setActive(arg_9_2:Find("border/normal"), var_9_0 ~= arg_8_0.selectedCharacterId)
		elseif arg_9_0 == UIItemList.EventInit then
			GetImageSpriteFromAtlasAsync("qicon/" .. var_9_1:GetDefaultFrame(), "", arg_9_2:Find("frame"))
			onButton(arg_8_0, arg_9_2, function()
				if var_9_1:IsLock() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("secretary_special_character_unlock"))

					return
				end

				if var_9_0 ~= arg_8_0.selectedCharacterId then
					arg_8_0.selectedCharacterId = var_9_0

					arg_8_0.tabItemList:align(#arg_8_0.characterList)
					arg_8_0:InitToggles()
				end
			end)
		end
	end)
	arg_8_0.tabItemList:align(#arg_8_0.characterList)
end

function var_0_0.InitToggles(arg_11_0)
	local var_11_0 = arg_11_0.characterList[arg_11_0.selectedCharacterId]:GetGroupList()

	table.sort(var_11_0, function(arg_12_0, arg_12_1)
		return arg_12_0:GetSortWeight() < arg_12_1:GetSortWeight()
	end)
	arg_11_0.toggleUIItemList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			arg_11_0:UpdateToggle(arg_13_2, var_11_0[arg_13_1 + 1])

			if arg_13_1 == 0 then
				arg_11_0.isInit = true

				triggerToggle(arg_13_2, true)
			end
		end
	end)
	arg_11_0.toggleUIItemList:align(#var_11_0)

	arg_11_0.isInit = false
end

function var_0_0.UpdateToggle(arg_14_0, arg_14_1, arg_14_2)
	setImageSprite(arg_14_1:Find("sel/Text"), GetSpriteFromAtlas("ui/EducateCharProfileUI_atlas", arg_14_2:GetSpriteName()), true)
	setImageSprite(arg_14_1:Find("Text"), GetSpriteFromAtlas("ui/EducateCharProfileUI_atlas", arg_14_2:GetSpriteName()), true)
	setActive(arg_14_1:Find("lock"), arg_14_2:IsLock())
	onToggle(arg_14_0, arg_14_1, function(arg_15_0)
		if arg_15_0 then
			if not arg_14_0.isInit then
				arg_14_0.animation:Play("anim_educate_profile_change")

				arg_14_0.isInit = nil
			end

			local var_15_0 = arg_14_2:GetShowId()

			arg_14_0:ClearCurrentWord()
			arg_14_0:InitPainting(var_15_0)
			arg_14_0:InitWordList(var_15_0)
		end
	end, SFX_PANEL)
end

function var_0_0.GetWordList(arg_16_0, arg_16_1)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(pg.character_voice_special.all) do
		local var_16_1 = iter_16_1

		if string.find(iter_16_1, ShipWordHelper.WORD_TYPE_MAIN) then
			local var_16_2 = string.gsub(iter_16_1, ShipWordHelper.WORD_TYPE_MAIN, "")

			var_16_1 = ShipWordHelper.WORD_TYPE_MAIN .. "_" .. var_16_2
		end

		if EducateCharWordHelper.ExistWord(arg_16_1, var_16_1) then
			table.insert(var_16_0, iter_16_1)
		end
	end

	return var_16_0
end

function var_0_0.InitWordList(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:GetWordList(arg_17_1)
	local var_17_1 = pg.secretary_special_ship[arg_17_1]

	arg_17_0:RemoveAllTimer()
	arg_17_0.wordUIItemList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			arg_17_0:UpdateWordCard(arg_18_2, arg_17_1, var_17_0[arg_18_1 + 1], arg_18_1)
		end
	end)
	arg_17_0.wordUIItemList:align(#var_17_0)
end

function var_0_0.UpdateWordCard(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	local var_19_0 = arg_19_1:Find("bg")
	local var_19_1 = pg.character_voice_special[arg_19_3]

	setText(var_19_0:Find("Text"), var_19_1.voice_name)

	local var_19_2 = -1

	onButton(arg_19_0, var_19_0, function()
		if arg_19_0.chatting then
			return
		end

		local var_20_0, var_20_1, var_20_2, var_20_3 = EducateCharWordHelper.GetWordAndCV(arg_19_2, var_19_1.resource_key)

		seriesAsync({
			function(arg_21_0)
				arg_19_0:OnChatStart(var_19_0, var_20_2, arg_21_0)
			end,
			function(arg_22_0)
				arg_19_0:UpdateExpression(arg_19_2, var_19_1.resource_key)
				arg_19_0:PlayCV(var_20_3, var_20_0, function(arg_23_0)
					var_19_2 = arg_23_0

					arg_22_0()
				end)
			end,
			function(arg_24_0)
				arg_19_0:StartCharAnimation(var_19_2, arg_24_0)
			end
		}, function()
			arg_19_0:OnChatEnd()
		end)
	end, SFX_PANEL)
	setActive(var_19_0, false)

	arg_19_0.timers[arg_19_4] = Timer.New(function()
		setActive(var_19_0, true)
		arg_19_1:GetComponent(typeof(Animation)):Play("anim_educate_profile_tpl")
	end, math.max(1e-05, arg_19_4 * 0.066), 1)

	arg_19_0.timers[arg_19_4]:Start()
end

function var_0_0.RemoveAllTimer(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.timers) do
		iter_27_1:Stop()

		iter_27_1 = nil
	end

	arg_27_0.timers = {}
end

function var_0_0.OnChatStart(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	arg_28_0.chatting = true
	arg_28_0.chatTxt.text = arg_28_2

	triggerToggle(arg_28_1:Find("state"), true)

	arg_28_0.selectedCard = arg_28_1

	arg_28_3()
end

function var_0_0.UpdateExpression(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = EducateCharWordHelper.GetExpression(arg_29_1, arg_29_2)

	if var_29_0 and var_29_0 ~= "" then
		ShipExpressionHelper.UpdateExpression(findTF(arg_29_0.paintingTr, "fitter"):GetChild(0), arg_29_0.paintingName, var_29_0)
	else
		ShipExpressionHelper.UpdateExpression(findTF(arg_29_0.paintingTr, "fitter"):GetChild(0), arg_29_0.paintingName, "")
	end
end

function var_0_0.OnChatEnd(arg_30_0)
	arg_30_0:ClearCurrentWord()
end

function var_0_0.PlayCV(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	arg_31_0.cvLoader:Play(arg_31_1, arg_31_2, 0, arg_31_3)
end

function var_0_0.StartCharAnimation(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = 0.3
	local var_32_1 = arg_32_1 > 0 and arg_32_1 or 3

	LeanTween.scale(rtf(arg_32_0.chatTf.gameObject), Vector3.New(1, 1, 1), var_32_0):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
		LeanTween.scale(rtf(arg_32_0.chatTf.gameObject), Vector3.New(0, 0, 1), var_32_0):setEase(LeanTweenType.easeInBack):setDelay(var_32_0 + var_32_1):setOnComplete(System.Action(arg_32_2))
	end))
end

function var_0_0.InitPainting(arg_34_0, arg_34_1)
	arg_34_0:ReturnPainting()

	local var_34_0 = pg.secretary_special_ship[arg_34_1]

	setPaintingPrefabAsync(arg_34_0.paintingTr, var_34_0.painting, "tb3")

	arg_34_0.paintingName = var_34_0.painting
end

function var_0_0.ReturnPainting(arg_35_0)
	if arg_35_0.paintingName then
		retPaintingPrefab(arg_35_0.paintingTr, arg_35_0.paintingName)

		arg_35_0.paintingName = nil
	end
end

function var_0_0.ClearCurrentWord(arg_36_0)
	arg_36_0.chatting = nil

	LeanTween.cancel(arg_36_0.chatTf.gameObject)

	arg_36_0.chatTf.localScale = Vector3.zero

	arg_36_0.cvLoader:Stop()

	if not arg_36_0.selectedCard then
		return
	end

	local var_36_0 = arg_36_0.selectedCard

	arg_36_0.selectedCard = nil

	triggerToggle(var_36_0:Find("state"), false)
end

function var_0_0.onBackPressed(arg_37_0)
	var_0_0.super.onBackPressed(arg_37_0)
end

function var_0_0.willExit(arg_38_0)
	arg_38_0:ClearCurrentWord()
	arg_38_0:RemoveAllTimer()
	arg_38_0:ReturnPainting()

	if arg_38_0.cvLoader then
		arg_38_0.cvLoader:Dispose()

		arg_38_0.cvLoader = nil
	end
end

return var_0_0
