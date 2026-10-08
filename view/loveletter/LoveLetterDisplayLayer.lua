local var_0_0 = class("LoveLetterDisplayLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "LoveLetterDisplayUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	pg.PoolMgr.GetInstance():GetPrefab("LoveLetterStyle/" .. arg_2_0.contextData.prefab, "", true, function(arg_3_0)
		arg_2_0.rtStyle = arg_3_0.transform

		arg_2_1()
	end)
end

function var_0_0.getResource(arg_4_0)
	local var_4_0 = var_0_0.super.getResource(arg_4_0)
	local var_4_1 = {}

	local function var_4_2(arg_5_0)
		if noEmptyStr(arg_5_0) and not table.contains(var_4_1, arg_5_0) then
			table.insert(var_4_1, arg_5_0)
		end
	end

	var_4_2("LoveLetterStyle/" .. arg_4_0.contextData.prefab)
	var_4_2("loveletteranim/loveletteranim")
	var_4_2("bg/" .. arg_4_0.contextData.bg)
	var_4_2("loveletterstyleatlas/mail_" .. arg_4_0.contextData.prefab)

	local var_4_3 = getProxy(LoveLetterProxy)
	local var_4_4 = var_4_3 and var_4_3:GetGroupData(arg_4_0.contextData.groupId)

	if var_4_4 then
		local var_4_5 = var_4_4:GetDisplayInfo()

		if var_4_5 then
			var_4_2("loveletterstyleatlas/" .. var_4_5.hand)
			var_4_2("loveletterstyleatlas/" .. var_4_5.kiss)
		end

		local var_4_6 = var_4_4:GetPainting()

		if noEmptyStr(var_4_6) then
			PaintingGroupConst.AddPaintingNameWithFilteMap(var_4_1, var_4_6)
		end
	end

	for iter_4_0, iter_4_1 in ipairs(var_4_1) do
		if noEmptyStr(iter_4_1) and not table.contains(var_4_0, iter_4_1) then
			table.insert(var_4_0, iter_4_1)
		end
	end

	return var_4_0
end

var_0_0.optionsPath = {}

function var_0_0.SetLoveLetter(arg_6_0, arg_6_1)
	arg_6_0.ll = getProxy(LoveLetterProxy):GetGroupData(arg_6_1)
	arg_6_0.letterIds = arg_6_0.ll:GetDisplayLetterList()

	arg_6_0:ShowLetter(arg_6_0.contextData.letterId or arg_6_0.letterIds[1])
end

function var_0_0.init(arg_7_0)
	setParent(arg_7_0.rtStyle, arg_7_0.rtPanel)
	onButton(arg_7_0, arg_7_0.rtBg, function()
		arg_7_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0.rtStyle:Find("before"), function()
		arg_7_0:emit(LoveLetterDisplayMediator.ON_UNLOCK_LETTER, arg_7_0.letterId)
	end, SFX_PANEL)
	arg_7_0:addRingDragListenter()
	arg_7_0:BlurPanel(arg_7_0._tf)
end

function var_0_0.didEnter(arg_10_0)
	setText(arg_10_0.rtStyle:Find("after/bg/paper_root/name"), arg_10_0.ll:GetName())
end

function var_0_0.ChangeLetter(arg_11_0, arg_11_1)
	local var_11_0 = table.indexof(arg_11_0.letterIds, arg_11_0.letterId) + arg_11_1

	if var_11_0 ~= math.clamp(var_11_0, 1, #arg_11_0.letterIds) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("loveactivity_ui_15"))
	else
		arg_11_0:ShowLetter(arg_11_0.letterIds[var_11_0])
	end
end

function var_0_0.ShowLetter(arg_12_0, arg_12_1)
	arg_12_0.letterId = arg_12_1
	arg_12_0.contextData.letterId = arg_12_0.letterId

	setText(arg_12_0.rtStyle:Find("after/bg/paper_root/content"), getProxy(LoveLetterProxy):GetLoveLetterContent(arg_12_1))

	local var_12_0 = table.indexof(arg_12_0.letterIds, arg_12_0.letterId)

	UIItemList.StaticAlign(arg_12_0.rtPointsContainer, arg_12_0.rtPointsTpl, #arg_12_0.letterIds, function(arg_13_0, arg_13_1, arg_13_2)
		arg_13_1 = arg_13_1 + 1

		if arg_13_0 == UIItemList.EventUpdate then
			setActive(arg_13_2:Find("short"), arg_13_1 ~= var_12_0)
			setActive(arg_13_2:Find("long"), arg_13_1 == var_12_0)
			setActive(arg_13_2:Find("short/pick_up"), not arg_12_0.ll:GetLetterUnlock(arg_12_0.letterIds[arg_13_1]))
		end
	end)
	arg_12_0:UpdateLetterDisplay(arg_12_0.ll:GetLetterUnlock(arg_12_0.letterId))
end

function var_0_0.DoOpenLetter(arg_14_0)
	onButton(arg_14_0, arg_14_0.rtAnim:Find("click"), function()
		local var_15_0 = arg_14_0.clickCall

		arg_14_0.clickCall = nil

		existCall(var_15_0)
	end, SFX_PANEL)

	GetOrAddComponent(arg_14_0._tf, "EventTriggerListener").enabled = false

	setActive(arg_14_0.rtPointsContainer, false)
	pg.UIMgr.GetInstance():LoadingOn()

	local var_14_0 = {}

	table.insert(var_14_0, function(arg_16_0)
		local var_16_0 = arg_14_0.ll:GetDisplayInfo()

		parallelAsync({
			function(arg_17_0)
				pg.PoolMgr.GetInstance():GetPrefab("loveletteranim/loveletteranim", "", true, function(arg_18_0)
					arg_14_0.rtAnimation = arg_18_0.transform

					arg_17_0()
				end)
			end,
			function(arg_19_0)
				LoadSpriteAtlasAsync("bg/" .. arg_14_0.contextData.bg, "", function(arg_20_0)
					arg_14_0.spriteBg = arg_20_0

					arg_19_0()
				end)
			end,
			function(arg_21_0)
				LoadSpriteAtlasAsync("loveletterstyleatlas/mail_" .. arg_14_0.contextData.prefab, "", function(arg_22_0)
					arg_14_0.spriteMail = arg_22_0

					arg_21_0()
				end)
			end,
			function(arg_23_0)
				LoadSpriteAtlasAsync("loveletterstyleatlas/" .. var_16_0.hand, "", function(arg_24_0)
					arg_14_0.spriteHand = arg_24_0

					arg_23_0()
				end)
			end,
			function(arg_25_0)
				LoadSpriteAtlasAsync("loveletterstyleatlas/" .. var_16_0.kiss, "", function(arg_26_0)
					arg_14_0.spriteKiss = arg_26_0

					arg_25_0()
				end)
			end
		}, function()
			setParent(arg_14_0.rtAnimation, arg_14_0.rtAnim:Find("content"))
			setImageSprite(arg_14_0.rtAnimation:Find("bg_root/bg"), arg_14_0.spriteBg)
			setImageSprite(arg_14_0.rtAnimation:Find("fx_letter_in/deco_letter/deco_letter_1"), arg_14_0.spriteMail)
			setImageSprite(arg_14_0.rtAnimation:Find("fx_letter_in/deco_letter/lip_01"), arg_14_0.spriteKiss, true)
			setImageSprite(arg_14_0.rtAnimation:Find("hand/hand_deco"), arg_14_0.spriteHand, true)
			arg_14_0.rtAnimation:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_28_0)
				local var_28_0 = arg_14_0.nextCall

				arg_14_0.nextCall = nil

				existCall(var_28_0, arg_28_0)
			end)
			eachChild(arg_14_0.rtAnimation:Find("letter_style/root"), function(arg_29_0, arg_29_1)
				setActive(arg_29_0, arg_29_0.name == arg_14_0.contextData.prefab)

				if arg_29_0.name == arg_14_0.contextData.prefab then
					setText(arg_29_0:Find("after/bg/paper_root/name"), arg_14_0.ll:GetName())
					setText(arg_29_0:Find("after/bg/paper_root/content"), getProxy(LoveLetterProxy):GetLoveLetterContent(arg_14_0.contextData.letterId))
				end
			end)
			arg_16_0()
		end)
	end)
	table.insert(var_14_0, function(arg_30_0)
		setPaintingPrefab(arg_14_0.rtAnimation:Find("painting_root/paint"), arg_14_0.ll:GetPainting(), "mainNormal", nil, nil, arg_30_0)
	end)
	table.insert(var_14_0, function(arg_31_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setActive(arg_14_0.rtAnim, true)

		function arg_14_0.nextCall()
			setActive(arg_14_0.rtAnim:Find("click"), true)
		end

		arg_14_0.clickCall = arg_31_0

		setActive(arg_14_0.rtAnim:Find("click"), false)
		quickPlayAnimation(arg_14_0.rtAnimation, "anim_LoveLetterDisplayUI_fadein_01")
	end)
	table.insert(var_14_0, function(arg_33_0)
		setActive(arg_14_0.rtAnim, true)

		function arg_14_0.nextCall()
			setActive(arg_14_0.rtAnim:Find("click"), true)
		end

		arg_14_0.clickCall = arg_33_0

		setActive(arg_14_0.rtAnim:Find("click"), false)
		quickPlayAnimation(arg_14_0.rtAnimation, "anim_LoveLetterDisplayUI_fadein_02")
	end)
	table.insert(var_14_0, function(arg_35_0)
		setActive(arg_14_0.rtAnim, true)

		arg_14_0.nextCall = arg_35_0

		setActive(arg_14_0.rtAnim:Find("click"), false)
		quickPlayAnimation(arg_14_0.rtAnimation, "anim_LoveLetterDisplayUI_fadeout_01")
	end)
	seriesAsync(var_14_0, function()
		setActive(arg_14_0.rtAnim, false)
		setActive(arg_14_0.rtPointsContainer, true)
		arg_14_0:UpdateLetterDisplay(true)

		GetOrAddComponent(arg_14_0._tf, "EventTriggerListener").enabled = true
	end)
end

function var_0_0.UpdateLetterDisplay(arg_37_0, arg_37_1)
	setActive(arg_37_0.rtStyle:Find("after"), arg_37_1)
	setActive(arg_37_0.rtStyle:Find("before"), not arg_37_1)
	setButtonEnabled(arg_37_0.rtStyle:Find("before"), not arg_37_1)

	if not arg_37_1 then
		setLoveLetterMedal(arg_37_0.rtStyle:Find("before/medal"), setmetatable({
			level = table.indexof(pg.lover_letter_content.get_id_list_by_ship_group[arg_37_0.ll.groupId], arg_37_0.contextData.letterId)
		}, {
			__index = arg_37_0.ll
		}))
	end
end

function var_0_0.addRingDragListenter(arg_38_0)
	local var_38_0 = GetOrAddComponent(arg_38_0._tf, "EventTriggerListener")
	local var_38_1
	local var_38_2 = 0
	local var_38_3

	var_38_0:AddBeginDragFunc(function()
		var_38_2 = 0
		var_38_1 = nil
	end)
	var_38_0:AddDragFunc(function(arg_40_0, arg_40_1)
		local var_40_0 = arg_40_1.position

		if not var_38_1 then
			var_38_1 = var_40_0
		end

		var_38_2 = var_40_0.x - var_38_1.x
	end)
	var_38_0:AddDragEndFunc(function(arg_41_0, arg_41_1)
		if arg_38_0.isBlock then
			return
		end

		if var_38_2 < -50 then
			arg_38_0:ChangeLetter(1)
		elseif var_38_2 > 50 then
			arg_38_0:ChangeLetter(-1)
		end
	end)
end

function var_0_0.willExit(arg_42_0)
	if arg_42_0.rtStyle then
		eachChild(arg_42_0.rtStyle:Find("before/medal"), function(arg_43_0, arg_43_1)
			returnLoveLetterMedal(arg_43_0)
		end)
		pg.PoolMgr.GetInstance():ReturnPrefab("LoveLetterStyle/" .. arg_42_0.contextData.prefab, "", arg_42_0.rtStyle.gameObject)

		arg_42_0.rtStyle = nil
	end

	if arg_42_0.rtAnimation then
		retPaintingPrefab(arg_42_0.rtAnimation:Find("painting_root/paint"), arg_42_0.ll:GetPainting(), "mainNormal")
		pg.PoolMgr.GetInstance():ReturnPrefab("loveletteranim/loveletteranim", "", arg_42_0.rtAnimation.gameObject)

		arg_42_0.rtAnimation = nil
	end
end

return var_0_0
