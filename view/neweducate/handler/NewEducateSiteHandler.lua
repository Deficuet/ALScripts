local var_0_0 = class("NewEducateSiteHandler")

var_0_0.TPL_TYPE = {
	TEXT = 2,
	DROP = 4,
	CONDITION = 1,
	ARROWS = 5,
	OPTION = 3
}
var_0_0.TEXT_WORLD_TYPE = {
	RIGHT = 2,
	ASIDE = 0,
	LEFT = 1
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.windowTF = arg_1_0._tf:Find("window")
	arg_1_0.titleTF = arg_1_0.windowTF:Find("title/Text")
	arg_1_0.closeBtn = arg_1_0.windowTF:Find("close_btn")

	setActive(arg_1_0.closeBtn, false)

	arg_1_0.endOptionsTF = arg_1_0.windowTF:Find("end_options")
	arg_1_0.endBtn = arg_1_0.endOptionsTF:Find("end_btn")

	setScrollText(arg_1_0.endBtn:Find("mask/Text"), i18n("child2_site_exit"))
	setActive(arg_1_0.endOptionsTF, false)

	arg_1_0.againBtn = arg_1_0.endOptionsTF:Find("again_btn")

	setScrollText(arg_1_0.againBtn:Find("mask/Text"), i18n("child2_site_again"))

	arg_1_0.closeBtn2 = arg_1_0._tf:Find("close")

	setActive(arg_1_0.closeBtn2, false)

	arg_1_0.scrollrect = arg_1_0.windowTF:Find("content/view")
	arg_1_0.contentTF = arg_1_0.scrollrect:Find("mask/content")
	arg_1_0.optionsTF = arg_1_0.windowTF:Find("content/options")
	arg_1_0.optionUIList = UIItemList.New(arg_1_0.optionsTF, arg_1_0.optionsTF:Find("tpl"))

	arg_1_0.optionUIList:make(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == UIItemList.EventUpdate then
			arg_1_0:UpdateOption(arg_2_1, arg_2_2)
		end
	end)

	arg_1_0.tpls = {
		[var_0_0.TPL_TYPE.CONDITION] = arg_1_0._tf:Find("window/tpls/tpl_condition"),
		[var_0_0.TPL_TYPE.TEXT] = arg_1_0._tf:Find("window/tpls/tpl_text"),
		[var_0_0.TPL_TYPE.OPTION] = arg_1_0._tf:Find("window/tpls/tpl_option"),
		[var_0_0.TPL_TYPE.DROP] = arg_1_0._tf:Find("window/tpls/tpl_drop"),
		[var_0_0.TPL_TYPE.ARROWS] = arg_1_0._tf:Find("window/tpls/tpl_arrows")
	}
	arg_1_0.imageColorTFs = {
		arg_1_0.windowTF:Find("title"),
		arg_1_0.windowTF:Find("line"),
		arg_1_0.tpls[var_0_0.TPL_TYPE.TEXT]:Find("name_container/left/Image"),
		arg_1_0.tpls[var_0_0.TPL_TYPE.TEXT]:Find("name_container/right/Image")
	}
	arg_1_0.textColorTFs = {
		arg_1_0.tpls[var_0_0.TPL_TYPE.TEXT]:Find("name_container/left"),
		arg_1_0.tpls[var_0_0.TPL_TYPE.TEXT]:Find("name_container/right"),
		arg_1_0.tpls[var_0_0.TPL_TYPE.OPTION]:Find("text"),
		arg_1_0.tpls[var_0_0.TPL_TYPE.DROP]:Find("tpl/content/value")
	}
	arg_1_0.charName = getProxy(NewEducateProxy):GetCurChar():getConfig("name")
	arg_1_0.playerName = getProxy(PlayerProxy):getRawData():GetName()
	arg_1_0.passNodeIds = {}
	arg_1_0.optionIds = {}
	arg_1_0.dropRecords = {}
	arg_1_0.speed = NewEducateConst.TYPEWRITE_SPEED
end

function var_0_0.SetSite(arg_3_0, arg_3_1)
	setActive(arg_3_0._go, true)

	arg_3_0.siteId = arg_3_1

	local var_3_0 = pg.child2_site_display[arg_3_1]

	arg_3_0.siteType = var_3_0.type

	local var_3_1, var_3_2 = NewEducateHelper.GetSiteColors(arg_3_0.siteId)

	underscore.each(arg_3_0.imageColorTFs, function(arg_4_0)
		setImageColor(arg_4_0, var_3_1)
	end)
	underscore.each(arg_3_0.textColorTFs, function(arg_5_0)
		setTextColor(arg_5_0, var_3_2)
	end)
	setText(arg_3_0.titleTF, var_3_0.title)

	local var_3_3 = getProxy(NewEducateProxy):GetCurChar()

	switch(arg_3_0.siteType, {
		[NewEducateConst.SITE_TYPE.WORK] = function()
			existCall(arg_3_0.onNormal)
			setActive(arg_3_0._tf, false)

			local var_6_0 = var_3_3:GetNormalIdByType(NewEducateConst.SITE_NORMAL_TYPE.WORK)
			local var_6_1 = pg.child2_site_normal[var_6_0]

			arg_3_0:AddConditions(var_3_3, var_6_1)
			arg_3_0:AddEnterOption(var_6_1.title)
		end,
		[NewEducateConst.SITE_TYPE.TRAVEL] = function()
			existCall(arg_3_0.onNormal)
			setActive(arg_3_0._tf, false)

			local var_7_0 = var_3_3:GetNormalIdByType(NewEducateConst.SITE_NORMAL_TYPE.TRAVEL)
			local var_7_1 = pg.child2_site_normal[var_7_0]

			arg_3_0:AddConditions(var_3_3, var_7_1)
			arg_3_0:AddEnterOption(var_7_1.title)
		end,
		[NewEducateConst.SITE_TYPE.SHIP] = function()
			return
		end,
		[NewEducateConst.SITE_TYPE.EVENT] = function()
			setText(arg_3_0.titleTF, pg.child2_site_event_group[var_3_0.param].event_title)
		end
	})
end

function var_0_0.AddConditions(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_1:GetConditionIdsFromComplex(arg_10_2.special_args)

	if not var_10_0 or #var_10_0 == 0 then
		return
	end

	local var_10_1 = cloneTplTo(arg_10_0.tpls[var_0_0.TPL_TYPE.CONDITION], arg_10_0.contentTF, arg_10_0.siteId .. "Conditions")
	local var_10_2 = underscore.detect(var_10_0, function(arg_11_0)
		return pg.child2_condition[arg_11_0].type == NewEducateConst.CONDITION_TYPE.NORMAL_SITE_CNT
	end)

	if var_10_2 and not arg_10_1:IsMatchCondition(var_10_2) then
		local var_10_3 = pg.child2_condition[var_10_2].param
		local var_10_4 = var_10_3[3] - arg_10_1:GetNormalCnt(arg_10_2.id)

		if var_10_3[1] == ">" then
			var_10_4 = var_10_4 + 1
		end

		setText(var_10_1:Find("count"), i18n("child2_unlock_site_cnt", var_10_4))
	end

	setActive(var_10_1:Find("count"), var_10_2)

	local var_10_5 = underscore.detect(var_10_0, function(arg_12_0)
		return pg.child2_condition[arg_12_0].type == NewEducateConst.CONDITION_TYPE.ROUND
	end)

	if var_10_5 and not arg_10_1:IsMatchCondition(var_10_5) then
		local var_10_6 = pg.child2_condition[var_10_5].param
		local var_10_7 = var_10_6[2] - arg_10_1:GetRoundData().round

		if var_10_6[1] == ">" then
			var_10_7 = var_10_7 + 1
		end

		setText(var_10_1:Find("round"), i18n("child2_unlock_site_round", var_10_7))
	end

	setActive(var_10_1:Find("round"), var_10_5)

	local var_10_8 = underscore.select(var_10_0, function(arg_13_0)
		local var_13_0 = pg.child2_condition[arg_13_0]

		return var_13_0.type == NewEducateConst.CONDITION_TYPE.DROP and var_13_0.param[1] == NewEducateConst.DROP_TYPE.ATTR and not arg_10_1:IsMatchCondition(arg_13_0)
	end) or {}

	if #var_10_8 > 0 then
		setText(var_10_1:Find("attrs/text"), i18n("child2_unlock_site_attr"))

		local var_10_9 = var_10_1:Find("attrs/content")
		local var_10_10 = UIItemList.New(var_10_9, var_10_9:Find("tpl"))

		var_10_10:make(function(arg_14_0, arg_14_1, arg_14_2)
			if arg_14_0 == UIItemList.EventUpdate then
				local var_14_0 = pg.child2_condition[var_10_8[arg_14_1 + 1]].param
				local var_14_1 = var_14_0[2]
				local var_14_2 = pg.child2_attr[var_14_1]
				local var_14_3 = var_14_0[4]

				LoadImageSpriteAsync("neweducateicon/" .. var_14_2.icon, arg_14_2:Find("icon_bg/icon"))
				setText(arg_14_2:Find("name"), var_14_2.name)

				local var_14_4 = arg_10_1:GetAttr(var_14_1)

				setText(arg_14_2:Find("value"), (var_14_4 < var_14_3 and setColorStr(var_14_4, "#a9a9b0") or var_14_4) .. "/" .. var_14_3)
			end
		end)
		var_10_10:align(#var_10_8)
	end

	setActive(var_10_1:Find("attrs"), #var_10_8 > 0)
end

function var_0_0.AddEnterOption(arg_15_0, arg_15_1)
	local var_15_0 = cloneTplTo(arg_15_0.tpls[var_0_0.TPL_TYPE.OPTION], arg_15_0.contentTF, arg_15_0.siteId .. "_EnterOption")

	setText(var_15_0:Find("name_container/name"), arg_15_0.charName)
	setText(var_15_0:Find("text"), ">>" .. arg_15_1)
end

function var_0_0.AddEnterText(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = cloneTplTo(arg_16_0.tpls[var_0_0.TPL_TYPE.TEXT], arg_16_0.contentTF, arg_16_0.siteId .. "_EnterText")

	setActive(var_16_0:Find("name_container"), true)
	setActive(var_16_0:Find("name_container/left"), true)
	setActive(var_16_0:Find("name_container/right"), false)
	setText(var_16_0:Find("name_container/left"), arg_16_1)
	setText(var_16_0:Find("text"), arg_16_2)
end

function var_0_0.Play(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if not arg_17_0.callName then
		arg_17_0.callName = getProxy(NewEducateProxy):GetCurChar():GetCallName()
	end

	local function var_17_0(...)
		existCall(arg_17_2(...))
		scrollTo(arg_17_0.scrollrect, 0, 0)
	end

	table.insert(arg_17_0.passNodeIds, arg_17_1)

	local var_17_1 = pg.child2_node[arg_17_1]

	switch(var_17_1.type, {
		[NewEducateNodePanel.NODE_TYPE.EVENT_TEXT] = function()
			arg_17_0:AddText(var_17_1, var_17_0)
		end,
		[NewEducateNodePanel.NODE_TYPE.EVENT_OPTION] = function()
			arg_17_0:AddOption(var_17_1, var_17_0)
		end,
		[NewEducateNodePanel.NODE_TYPE.DROP] = function()
			arg_17_0:AddDrops(arg_17_1, arg_17_3, var_17_0)
		end
	})
end

function var_0_0._GetText(arg_22_0, arg_22_1)
	local var_22_0 = pg.child2_word[arg_22_1].word

	return string.gsub(var_22_0, "$1", arg_22_0.callName)
end

function var_0_0.UpdateOption(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.optionIds[arg_23_1 + 1]

	arg_23_2.name = var_23_0

	local var_23_1 = pg.child2_node[var_23_0]

	setScrollText(arg_23_2:Find("mask/name"), arg_23_0:_GetText(var_23_1.text))

	local var_23_2 = var_23_1.performance_param

	setActive(arg_23_2:Find("bg"), var_23_2 ~= "")

	if var_23_2 ~= "" then
		LoadImageSpriteAtlasAsync("ui/neweducatenodeui_atlas", "option_bg" .. var_23_2, arg_23_2:Find("bg"))
	end

	local var_23_3 = false
	local var_23_4 = getProxy(NewEducateProxy):GetCurChar()

	if #var_23_1.option_condition > 0 then
		var_23_3 = not var_23_4:IsMatchComplex(var_23_1.option_condition)
	end

	setActive(arg_23_2:Find("cost"), #var_23_1.option_cost > 0)

	local var_23_5 = NewEducateHelper.Config2Drops(var_23_1.option_cost)

	if #var_23_5 > 0 then
		local var_23_6 = UIItemList.New(arg_23_2:Find("cost"), arg_23_2:Find("cost/tpl"))

		var_23_6:make(function(arg_24_0, arg_24_1, arg_24_2)
			if arg_24_0 == UIItemList.EventUpdate then
				local var_24_0 = var_23_5[arg_24_1 + 1]
				local var_24_1 = NewEducateHelper.GetDropConfig(var_24_0).icon

				LoadImageSpriteAsync("neweducateicon/" .. var_24_1, arg_24_2:Find("Image"))
				setText(arg_24_2:Find("Text"), "-" .. var_24_0.number)
			end
		end)
		var_23_6:align(#var_23_5)

		local var_23_7 = underscore.map(var_23_5, function(arg_25_0)
			arg_25_0.operator = ">="

			return arg_25_0
		end)

		var_23_3 = var_23_3 or not var_23_4:IsMatchs(var_23_7)
	end

	setImageColor(arg_23_2, Color.NewHex(var_23_3 and "C8CAD5" or "FFFFFF"))
	setTextColor(arg_23_2:Find("mask/name"), Color.NewHex(var_23_3 and "717171" or "393A3C"))

	if not var_23_3 then
		onButton(arg_23_0, arg_23_2, function()
			existCall(arg_23_0.callback(var_23_0, var_23_5))
		end, SFX_PANEL)
	else
		removeOnButton(arg_23_2)
	end
end

function var_0_0.AddText(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.speed = NewEducateConst.TYPEWRITE_SPEED

	local var_27_0 = cloneTplTo(arg_27_0.tpls[var_0_0.TPL_TYPE.TEXT], arg_27_0.contentTF, arg_27_1.id)
	local var_27_1 = arg_27_1.name ~= 0

	setActive(var_27_0:Find("name_container"), var_27_1)

	local var_27_2 = false

	if var_27_1 then
		local var_27_3 = pg.child2_word[arg_27_1.name]
		local var_27_4 = arg_27_0:_GetText(var_27_3.id)

		if var_27_3.char_type == NewEducateConst.WORD_TYPE.SITE_LEFT then
			setActive(var_27_0:Find("name_container/left"), true)
			setActive(var_27_0:Find("name_container/right"), false)
			setText(var_27_0:Find("name_container/left"), var_27_4)
		elseif var_27_3.char_type == NewEducateConst.WORD_TYPE.SITE_RIGHT then
			var_27_2 = true

			setActive(var_27_0:Find("name_container/left"), false)
			setActive(var_27_0:Find("name_container/right"), true)
			setText(var_27_0:Find("name_container/right"), var_27_4)
		end
	end

	local var_27_5 = arg_27_0:_GetText(arg_27_1.text)

	if var_27_2 and GetPerceptualSize(var_27_5) < 22 then
		var_27_0:Find("text"):GetComponent(typeof(Text)).alignment = TextAnchor.UpperRight
	end

	setText(var_27_0:Find("text"), var_27_5)

	local var_27_6 = GetComponent(var_27_0:Find("text"), typeof(Typewriter))

	function var_27_6.endFunc()
		if arg_27_1.next_type == NewEducateNodePanel.NEXT_TYPE.OPTION then
			arg_27_0.optionIds = arg_27_0:FilterOptions(arg_27_1.next)
			arg_27_0.callback = arg_27_2

			arg_27_0.optionUIList:align(#arg_27_0.optionIds)
		else
			arg_27_0.optionUIList:align(#arg_27_0.optionIds)
			existCall(arg_27_2)
		end

		arg_27_0:StopAutoScroll()
		scrollTo(arg_27_0.scrollrect, 0, 0)
	end

	var_27_6:setSpeed(arg_27_0.speed)
	var_27_6:Play()

	if arg_27_0.speed ~= NewEducateConst.TYPEWRITE_SPEED_UP then
		onButton(arg_27_0, arg_27_0.windowTF, function()
			removeOnButton(arg_27_0.windowTF)

			arg_27_0.speed = NewEducateConst.TYPEWRITE_SPEED_UP

			var_27_6:setSpeed(arg_27_0.speed)
		end)
	end

	arg_27_0:StartAutoScroll()
end

function var_0_0.FilterOptions(arg_30_0, arg_30_1)
	local var_30_0 = getProxy(NewEducateProxy):GetCurChar()

	return underscore.select(arg_30_1, function(arg_31_0)
		local var_31_0 = pg.child2_node[arg_31_0]

		if var_31_0.option_condition_show == 0 then
			return true
		end

		local var_31_1 = false

		if #var_31_0.option_condition > 0 then
			var_31_1 = not var_30_0:IsMatchComplex(var_31_0.option_condition)
		end

		return not var_31_1
	end)
end

function var_0_0.AddOption(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = cloneTplTo(arg_32_0.tpls[var_0_0.TPL_TYPE.OPTION], arg_32_0.contentTF, arg_32_1.id)
	local var_32_1 = pg.child2_word[arg_32_1.text].char_type

	if var_32_1 == NewEducateConst.WORD_TYPE.CHILD then
		setActive(var_32_0:Find("name_container"), true)
		setText(var_32_0:Find("name_container/name"), arg_32_0.charName)
	elseif var_32_1 == NewEducateConst.WORD_TYPE.PLAYER then
		setActive(var_32_0:Find("name_container"), true)
		setText(var_32_0:Find("name_container/name"), arg_32_0.playerName)
	else
		setActive(var_32_0:Find("name_container"), false)
	end

	setText(var_32_0:Find("text"), ">>" .. arg_32_0:_GetText(arg_32_1.text))

	if arg_32_1.next_type == NewEducateNodePanel.NEXT_TYPE.OPTION then
		arg_32_0.optionIds = arg_32_1.next
		arg_32_0.callback = arg_32_2

		arg_32_0.optionUIList:align(#arg_32_0.optionIds)
	else
		arg_32_0.optionIds = {}

		arg_32_0.optionUIList:align(#arg_32_0.optionIds)
		existCall(arg_32_2)
	end
end

function var_0_0.AddDrops(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = cloneTplTo(arg_33_0.tpls[var_0_0.TPL_TYPE.DROP], arg_33_0.contentTF, arg_33_1)

	setActive(var_33_0:Find("tpl"), false)

	local var_33_1 = {}

	for iter_33_0, iter_33_1 in ipairs(arg_33_2) do
		table.insert(var_33_1, function(arg_34_0)
			local var_34_0 = cloneTplTo(var_33_0:Find("tpl"), var_33_0, iter_33_1.type .. "_" .. iter_33_1.id)

			arg_33_0:UpdateDropText(iter_33_1, var_34_0, arg_34_0)
		end)
	end

	seriesAsync(var_33_1, function()
		local var_35_0 = underscore.reduce(arg_33_2, 0, function(arg_36_0, arg_36_1)
			return arg_36_0 + (NewEducateHelper.IsPersonalDrop(arg_36_1) and arg_36_1.number or 0)
		end)

		if var_35_0 ~= 0 then
			arg_33_0:CheckPersonalChange(var_35_0)
		end

		existCall(arg_33_3)
	end)
end

function var_0_0.UpdateDropText(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	arg_37_0.speed = NewEducateConst.TYPEWRITE_SPEED

	local var_37_0 = NewEducateHelper.GetDropConfig(arg_37_1)

	if NewEducateHelper.IsPersonalDrop(arg_37_1) then
		local var_37_1 = arg_37_1.number > 0 and i18n("child2_personal_tag2") or i18n("child2_personal_tag1")

		setText(arg_37_2:Find("content/value"), var_37_1 .. "+" .. math.abs(arg_37_1.number))
	elseif arg_37_1.type == NewEducateConst.DROP_TYPE.ATTR or arg_37_1.type == NewEducateConst.DROP_TYPE.RES then
		local var_37_2 = arg_37_1.number > 0 and "child2_site_drop_add" or "child2_site_drop_reduce"
		local var_37_3 = getProxy(NewEducateProxy):GetCurChar():GetOwnCnt(arg_37_1)
		local var_37_4 = var_37_3 - arg_37_1.number + (arg_37_1.overflow or 0)
		local var_37_5 = math.abs(arg_37_1.number - (arg_37_1.overflow or 0))

		setText(arg_37_2:Find("content/value"), i18n(var_37_2, var_37_0.name, var_37_4, var_37_3, var_37_5))
	else
		setText(arg_37_2:Find("content/value"), i18n("child2_site_drop_item", var_37_0.name))
	end

	setActive(arg_37_2:Find("content/benefit"), false)

	local var_37_6 = GetComponent(arg_37_2:Find("content/value"), typeof(Typewriter))

	function var_37_6.endFunc()
		onDelayTick(function()
			existCall(arg_37_3)
		end, 0.5)
	end

	var_37_6:setSpeed(arg_37_0.speed)

	if not isActive(arg_37_0._tf) then
		existCall(arg_37_3)
	else
		var_37_6:Play()

		if arg_37_0.speed ~= NewEducateConst.TYPEWRITE_SPEED_UP then
			onButton(arg_37_0, arg_37_0.windowTF, function()
				removeOnButton(arg_37_0.windowTF)

				arg_37_0.speed = NewEducateConst.TYPEWRITE_SPEED_UP

				var_37_6:setSpeed(arg_37_0.speed)
			end)
		end

		scrollTo(arg_37_0.scrollrect, 0, 0)
	end
end

function var_0_0.CheckPersonalChange(arg_41_0, arg_41_1)
	arg_41_0.speed = NewEducateConst.TYPEWRITE_SPEED

	local var_41_0 = getProxy(NewEducateProxy):GetCurChar()
	local var_41_1 = var_41_0:GetPersonalityTag()

	if var_41_0:GetPersonalityTag(var_41_0:GetPersonality() - arg_41_1) ~= var_41_1 then
		local var_41_2 = cloneTplTo(arg_41_0.tpls[var_0_0.TPL_TYPE.DROP], arg_41_0.contentTF, "personal_change"):Find("tpl")
		local var_41_3 = arg_41_1 > 0 and i18n("child2_personal_tag2") or i18n("child2_personal_tag1")

		setText(var_41_2:Find("content/value"), i18n("child2_personal_change") .. ">>" .. var_41_3)
		setActive(var_41_2:Find("content/benefit"), false)

		local var_41_4 = GetComponent(var_41_2:Find("content/value"), typeof(Typewriter))

		function var_41_4.endFunc()
			return
		end

		var_41_4:setSpeed(arg_41_0.speed)
		var_41_4:Play()

		if arg_41_0.speed ~= NewEducateConst.TYPEWRITE_SPEED_UP then
			onButton(arg_41_0, arg_41_0.windowTF, function()
				removeOnButton(arg_41_0.windowTF)

				arg_41_0.speed = NewEducateConst.TYPEWRITE_SPEED_UP

				var_41_4:setSpeed(arg_41_0.speed)
			end)
		end

		scrollTo(arg_41_0.scrollrect, 0, 0)
	end
end

function var_0_0.AddFavorUpgrade(arg_44_0)
	arg_44_0.speed = NewEducateConst.TYPEWRITE_SPEED

	local var_44_0 = cloneTplTo(arg_44_0.tpls[var_0_0.TPL_TYPE.DROP], arg_44_0.contentTF, "favor_drop"):Find("tpl")
	local var_44_1 = pg.child2_site_display[arg_44_0.siteId]
	local var_44_2 = pg.child2_site_character[var_44_1.param].level + 1

	setText(var_44_0:Find("content/value"), i18n("child2_ship_upgrade_favor", var_44_1.name, var_44_2))
	setActive(var_44_0:Find("content/benefit"), false)

	local var_44_3 = GetComponent(var_44_0:Find("content/value"), typeof(Typewriter))

	function var_44_3.endFunc()
		return
	end

	var_44_3:setSpeed(arg_44_0.speed)
	var_44_3:Play()

	if arg_44_0.speed ~= NewEducateConst.TYPEWRITE_SPEED_UP then
		onButton(arg_44_0, arg_44_0.windowTF, function()
			removeOnButton(arg_44_0.windowTF)

			arg_44_0.speed = NewEducateConst.TYPEWRITE_SPEED_UP

			var_44_3:setSpeed(arg_44_0.speed)
		end)
	end

	scrollTo(arg_44_0.scrollrect, 0, 0)
	pg.m02:sendNotification(NewEducateMapMediator.ON_SHIP_UPGRADE_LEVEL)
end

function var_0_0.Reset(arg_47_0)
	setActive(arg_47_0._go, false)
	setActive(arg_47_0.endOptionsTF, false)
	setActive(arg_47_0.closeBtn, false)
	setActive(arg_47_0.closeBtn2, false)
	removeAllChildren(arg_47_0.contentTF)
	arg_47_0:StopAutoScroll()

	arg_47_0.dropRecords = {}
	arg_47_0.passNodeIds = {}
	arg_47_0.optionIds = {}
	arg_47_0.callback = nil
	arg_47_0.siteId = 0
	arg_47_0.speed = NewEducateConst.TYPEWRITE_SPEED

	removeOnButton(arg_47_0.windowTF)
end

function var_0_0.BindEndBtn(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	onButton(arg_48_0, arg_48_0.endBtn, function()
		existCall(arg_48_1)
	end, SFX_PANEL)
	onButton(arg_48_0, arg_48_0.closeBtn, function()
		existCall(arg_48_1)
	end, SFX_PANEL)
	onButton(arg_48_0, arg_48_0.closeBtn2, function()
		existCall(arg_48_1)
	end, SFX_PANEL)

	arg_48_0.onSiteEnd = arg_48_2
	arg_48_0.onNormal = arg_48_3
end

function var_0_0.AddDropRecords(arg_52_0, arg_52_1)
	arg_52_0.dropRecords = table.mergeArray(arg_52_0.dropRecords, arg_52_1)
end

function var_0_0.OnEventEnd(arg_53_0)
	setActive(arg_53_0._tf, true)
	existCall(arg_53_0.onSiteEnd)
	arg_53_0:UpdateAgainBtn()
	setActive(arg_53_0.endOptionsTF, true)
	setActive(arg_53_0.closeBtn, true)
	setActive(arg_53_0.closeBtn2, true)

	if pg.child2_site_display[arg_53_0.siteId].type == NewEducateConst.SITE_TYPE.SHIP then
		arg_53_0:AddFavorUpgrade()
	end
end

function var_0_0.UpdateAgainBtn(arg_54_0)
	local var_54_0 = pg.child2_site_display[arg_54_0.siteId].type
	local var_54_1 = var_54_0 == NewEducateConst.SITE_TYPE.WORK or var_54_0 == NewEducateConst.SITE_TYPE.TRAVEL

	setActive(arg_54_0.againBtn, var_54_1)

	if var_54_1 then
		local var_54_2 = getProxy(NewEducateProxy):GetCurChar()
		local var_54_3 = var_54_0 == NewEducateConst.SITE_TYPE.WORK and NewEducateConst.SITE_NORMAL_TYPE.WORK or NewEducateConst.SITE_NORMAL_TYPE.TRAVEL
		local var_54_4 = var_54_2:GetNormalIdByType(var_54_3)
		local var_54_5 = NewEducateHelper.Config2Drop(pg.child2_site_normal[var_54_4].cost)
		local var_54_6 = NewEducateHelper.GetDropConfig(var_54_5).icon

		LoadImageSpriteAsync("neweducateicon/" .. var_54_6, arg_54_0.againBtn:Find("cost/Image"))
		setText(arg_54_0.againBtn:Find("cost/Text"), "-" .. var_54_5.number)

		var_54_5.operator = ">="

		local var_54_7 = not var_54_2:IsMatch(var_54_5)

		setImageColor(arg_54_0.againBtn, Color.NewHex(var_54_7 and "C8CAD5" or "FFFFFF"))
		setTextColor(arg_54_0.againBtn:Find("mask/Text"), Color.NewHex(var_54_7 and "717171" or "393A3C"))

		if not var_54_7 then
			onButton(arg_54_0, arg_54_0.againBtn, function()
				pg.m02:sendNotification(GAME.NEW_EDUCATE_MAP_NORMAL, {
					id = var_54_2.id,
					normalId = var_54_4
				})
				existCall(arg_54_0.onNormal)
			end, SFX_PANEL)
		else
			removeOnButton(arg_54_0.againBtn)
		end
	end
end

function var_0_0.StartAutoScroll(arg_56_0)
	arg_56_0.timer = Timer.New(function()
		scrollTo(arg_56_0.scrollrect, 0, 0)
	end, 0.4, -1)

	arg_56_0.timer:Start()
end

function var_0_0.StopAutoScroll(arg_58_0)
	if arg_58_0.timer then
		arg_58_0.timer:Stop()

		arg_58_0.timer = nil
	end
end

function var_0_0.UpdateCallName(arg_59_0)
	arg_59_0.callName = getProxy(NewEducateProxy):GetCurChar():GetCallName()
end

function var_0_0.Destroy(arg_60_0)
	pg.DelegateInfo.Dispose(arg_60_0)
end

return var_0_0
