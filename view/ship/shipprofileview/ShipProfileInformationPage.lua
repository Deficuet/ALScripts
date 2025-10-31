local var_0_0 = class("ShipProfileInformationPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ShipProfileInformationPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.voiceActor = arg_2_0._tf:Find("bg/author_panel/cvPanel/label/mask/Text"):GetComponent("ScrollText")
	arg_2_0.illustrator = arg_2_0._tf:Find("bg/author_panel/illustPanel/illustrator/label/mask/Text"):GetComponent("ScrollText")
	arg_2_0.cvContainer = arg_2_0._tf:Find("bg/lines_panel/lines_list/Grid")
	arg_2_0.cvTpl = arg_2_0:getTpl("bg/lines_panel/lines_list/Grid/lines_tpl")
	arg_2_0.weddingReview = arg_2_0._tf:Find("bg/wedding")
	arg_2_0.voiceBtn = arg_2_0._tf:Find("bg/language_change")
	arg_2_0.voiceBtnSel = arg_2_0.voiceBtn:Find("sel")
	arg_2_0.voiceBtnUnsel = arg_2_0.voiceBtn:Find("unsel")
	arg_2_0.voiceBtnPositions = {
		arg_2_0.voiceBtnSel.localPosition,
		arg_2_0.voiceBtnUnsel.localPosition
	}
	arg_2_0.voiceBtnTxt = arg_2_0.voiceBtn:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.voiceBtnTxt1 = arg_2_0.voiceBtn:Find("Text1"):GetComponent(typeof(Text))
	arg_2_0.profilePlayBtn = arg_2_0._tf:Find("bg/prototype_panel/title/playButton")
	arg_2_0.profileTxt = arg_2_0._tf:Find("bg/prototype_panel/desc/scroll/Text"):GetComponent(typeof(Text))
end

function var_0_0.UpdateCvBtn(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.voiceBtnPositions[arg_3_1 and 2 or 1]
	local var_3_1 = arg_3_0.voiceBtnPositions[arg_3_1 and 1 or 2]

	arg_3_0.voiceBtnSel.localPosition = var_3_0
	arg_3_0.voiceBtnUnsel.localPosition = var_3_1

	local var_3_2 = Color.New(1, 1, 1, 1)
	local var_3_3 = Color.New(0.5, 0.5, 0.5, 1)

	arg_3_0.voiceBtnTxt.color = arg_3_1 and var_3_2 or var_3_3
	arg_3_0.voiceBtnTxt1.color = arg_3_1 and var_3_3 or var_3_2
end

function var_0_0.UpdateLang2(arg_4_0)
	local var_4_0 = arg_4_0.skin.ship_group
	local var_4_1 = ShipGroup.getDefaultSkin(var_4_0)
	local var_4_2 = pg.ship_skin_words[var_4_1.id]

	PlayerPrefs.SetInt(CV_LANGUAGE_KEY .. var_4_0, 2)
	arg_4_0.cvLoader:Load(arg_4_0.skin.id)
	arg_4_0:SetAuthorInfo()
	arg_4_0:UpdateCvList(arg_4_0.isLive2d)
	arg_4_0:UpdateProfileInfo()
end

function var_0_0.UpdateLang1(arg_5_0)
	local var_5_0 = arg_5_0.skin.ship_group
	local var_5_1 = ShipGroup.getDefaultSkin(var_5_0)
	local var_5_2 = pg.ship_skin_words[var_5_1.id]

	PlayerPrefs.SetInt(CV_LANGUAGE_KEY .. var_5_0, 1)
	arg_5_0.cvLoader:Load(arg_5_0.skin.id)
	arg_5_0:SetAuthorInfo()
	arg_5_0:UpdateCvList(arg_5_0.isLive2d)
	arg_5_0:UpdateProfileInfo()
end

function var_0_0.OnCvBtn(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1

	onButton(arg_6_0, arg_6_0.voiceBtn, function()
		var_6_0 = not var_6_0

		arg_6_0:UpdateCvBtn(var_6_0)

		if var_6_0 then
			arg_6_0:UpdateLang2()
		else
			arg_6_0:UpdateLang1()
		end
	end, SFX_PANEL)
	arg_6_0:UpdateCvBtn(var_6_0)
end

function var_0_0.OnInit(arg_8_0)
	onButton(arg_8_0, arg_8_0.weddingReview, function()
		arg_8_0:emit(ShipProfileScene.WEDDING_REVIEW, {
			group = arg_8_0.shipGroup,
			skinID = arg_8_0.skin.id
		})
	end, SFX_PANEL)
end

function var_0_0.EnterAnim(arg_10_0, arg_10_1, arg_10_2)
	LeanTween.moveX(rtf(arg_10_0._tf), 0, arg_10_1):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(arg_10_2))
end

function var_0_0.ExistAnim(arg_11_0, arg_11_1, arg_11_2)
	LeanTween.moveX(rtf(arg_11_0._tf), 1000, arg_11_1):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function()
		if arg_11_2 then
			arg_11_2()
		end

		arg_11_0:Hide()
	end))
end

function var_0_0.Update(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_0:Show()

	arg_13_0.shipGroup = arg_13_1
	arg_13_0.showTrans = arg_13_2

	setActive(arg_13_0.weddingReview, arg_13_1.married == 1)

	if isActive(arg_13_0.weddingReview) then
		local var_13_0 = arg_13_1:getProposeType()

		eachChild(arg_13_0.weddingReview, function(arg_14_0)
			setActive(arg_14_0, arg_14_0.name == var_13_0)
		end)
	end

	if arg_13_3 then
		arg_13_3()
	end
end

function var_0_0.Flush(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0.skin and arg_15_0.skin.id == arg_15_1.id and arg_15_0.isLive2d == arg_15_2 then
		return
	end

	arg_15_0.skin = arg_15_1
	arg_15_0.isLive2d = arg_15_2

	arg_15_0:SetAuthorInfo()
	arg_15_0:SetIllustrator()
	arg_15_0:UpdateLanguage()
	arg_15_0:UpdateProfileInfo()
	arg_15_0:UpdateCvList(arg_15_2)
	arg_15_0.cvLoader:Load(arg_15_0.skin.id)
end

function var_0_0.UpdateProfileInfo(arg_16_0)
	local var_16_0, var_16_1, var_16_2 = ShipWordHelper.GetWordAndCV(arg_16_0.skin.id, ShipWordHelper.WORD_TYPE_PROFILE)

	arg_16_0.profileTxt.text = SwitchSpecialChar(var_16_2, true)

	local var_16_3 = pg.ship_skin_words[arg_16_0.skin.id]
	local var_16_4 = var_16_3 and (var_16_3.voice_key >= 0 or var_16_3.voice_key == -2) or var_16_3.voice_key_2 > 0 and var_16_3.voice_key < 0

	if var_16_4 then
		onButton(arg_16_0, arg_16_0.profilePlayBtn, function()
			arg_16_0.cvLoader:PlaySound(var_16_1)
		end, SFX_PANEL)
	end

	setActive(arg_16_0.profilePlayBtn, var_16_4)
end

function var_0_0.SetCvLoader(arg_18_0, arg_18_1)
	arg_18_0.cvLoader = arg_18_1
end

function var_0_0.SetCallback(arg_19_0, arg_19_1)
	arg_19_0.callback = arg_19_1
end

function var_0_0.UpdateLanguage(arg_20_0)
	local var_20_0 = arg_20_0.skin.ship_group
	local var_20_1 = ShipGroup.getDefaultSkin(var_20_0)
	local var_20_2 = pg.ship_skin_words[var_20_1.id]
	local var_20_3 = ShipWordHelper.GetLanguageSetting(var_20_1.id)
	local var_20_4 = var_20_2.voice_key_2 >= 0 or var_20_2.voice_key_2 == -2

	if var_20_2.voice_key_2 >= 0 and var_20_3 == 0 then
		var_20_3 = pg.gameset.language_default.key_value

		PlayerPrefs.SetInt(CV_LANGUAGE_KEY .. var_20_0, var_20_3)
	end

	arg_20_0:OnCvBtn(var_20_3 == 2)

	if var_20_2.voice_key_2 >= 0 or var_20_2.voice_key_2 == -2 then
		local var_20_5 = var_20_2.voice_key_2 % 10
		local var_20_6 = ""

		if var_20_5 == 2 then
			var_20_6 = i18n("word_chinese")
		elseif var_20_5 == 3 then
			var_20_6 = i18n("word_japanese_2")
		end

		arg_20_0.voiceBtnTxt.text = var_20_6
		arg_20_0.voiceBtnTxt1.text = i18n("word_japanese")
	end

	setActive(arg_20_0.voiceBtn, var_20_4)
end

function var_0_0.SetAuthorInfo(arg_21_0)
	local var_21_0 = arg_21_0.skin
	local var_21_1 = ShipWordHelper.GetCVAuthor(var_21_0.id)

	print(var_21_1 .. "  ----")
	arg_21_0.voiceActor:SetText(var_21_1)
end

function var_0_0.SetIllustrator(arg_22_0)
	local var_22_0 = arg_22_0.shipGroup:GetNationTxt()

	print(var_22_0)
	arg_22_0.illustrator:SetText(var_22_0)
end

function var_0_0.GetCvList(arg_23_0, arg_23_1)
	local var_23_0 = {}

	if arg_23_1 then
		if pg.ship_skin_template[arg_23_0.skin.id].spine_use_live2d == 1 then
			var_23_0 = pg.AssistantInfo.GetCVListForProfile(true, arg_23_0.skin.id)
		else
			var_23_0 = pg.AssistantInfo.GetCVListForProfile(false, arg_23_0.skin.id)
		end
	else
		var_23_0 = ShipWordHelper.GetCVList()
	end

	return var_23_0
end

function var_0_0.UpdateCvList(arg_24_0, arg_24_1)
	arg_24_0:DestroyCvBtns()

	arg_24_0.cvBtns = {}
	arg_24_0.dispalys = arg_24_0:GetCvList(arg_24_1)

	table.sort(arg_24_0.dispalys, function(arg_25_0, arg_25_1)
		return arg_25_0.profile_index < arg_25_1.profile_index
	end)

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.dispalys) do
		arg_24_0:AddCvBtn(iter_24_1)
		arg_24_0:AddExCvBtn(iter_24_1)
	end

	local var_24_0 = (pg.character_voice.touch.profile_index - 1) * 2
	local var_24_1 = arg_24_0.cvBtns[var_24_0]

	var_24_0 = var_24_1 and var_24_1._tf:GetSiblingIndex() or var_24_0

	local var_24_2 = ShipWordHelper.GetMainSceneWordCnt(arg_24_0.skin.id, -1)
	local var_24_3 = arg_24_0.shipGroup:GetMaxIntimacy()
	local var_24_4 = ShipWordHelper.GetMainSceneWordCnt(arg_24_0.skin.id, var_24_3)

	if var_24_2 < var_24_4 then
		for iter_24_2 = var_24_2 + 1, var_24_4 do
			arg_24_0:AddMainExBtn(iter_24_2, var_24_0)

			var_24_0 = var_24_0 + 1
		end
	end
end

function var_0_0.AddMainExBtn(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = ShipProfileMainExCvBtn.New(cloneTplTo(arg_26_0.cvTpl, arg_26_0.cvContainer))

	onButton(arg_26_0, var_26_0._tf, function()
		if arg_26_0.callback then
			arg_26_0.callback(var_26_0)
		end
	end, SFX_PANEL)
	var_26_0:Init(arg_26_0.shipGroup, arg_26_0.skin, arg_26_0.isLive2d, arg_26_1)
	var_26_0:Update()
	var_26_0._tf:SetSiblingIndex(arg_26_2)
	table.insert(arg_26_0.cvBtns, var_26_0)
end

function var_0_0.AddCvBtn(arg_28_0, arg_28_1)
	local var_28_0 = ShipProfileCvBtn.New(cloneTplTo(arg_28_0.cvTpl, arg_28_0.cvContainer))

	onButton(arg_28_0, var_28_0._tf, function()
		if arg_28_0.callback then
			arg_28_0.callback(var_28_0)
		end
	end, SFX_PANEL)
	var_28_0:Init(arg_28_0.shipGroup, arg_28_0.skin, arg_28_0.isLive2d, arg_28_1)
	var_28_0:Update()
	table.insert(arg_28_0.cvBtns, var_28_0)
end

function var_0_0.AddExCvBtn(arg_30_0, arg_30_1)
	local var_30_0 = ShipProfileExCvBtn.New(cloneTplTo(arg_30_0.cvTpl, arg_30_0.cvContainer))

	onButton(arg_30_0, var_30_0._tf, function()
		if arg_30_0.callback then
			arg_30_0.callback(var_30_0)
		end
	end, SFX_PANEL)

	local var_30_1 = arg_30_0.shipGroup:GetMaxIntimacy()

	var_30_0:Init(arg_30_0.shipGroup, arg_30_0.skin, arg_30_0.isLive2d, arg_30_1, var_30_1)
	var_30_0:Update()
	table.insert(arg_30_0.cvBtns, var_30_0)
end

function var_0_0.DestroyCvBtns(arg_32_0)
	if not arg_32_0.cvBtns then
		return
	end

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.cvBtns) do
		iter_32_1:Destroy()
	end
end

function var_0_0.OnDestroy(arg_33_0)
	arg_33_0:DestroyCvBtns()

	arg_33_0.cvLoader = nil
	arg_33_0.callback = nil
end

return var_0_0
