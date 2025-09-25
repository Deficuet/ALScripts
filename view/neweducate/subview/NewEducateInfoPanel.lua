local var_0_0 = class("NewEducateInfoPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateInfoPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.foldPanelTF = arg_2_0._tf:Find("fold_panel")
	arg_2_0.showBtn = arg_2_0.foldPanelTF:Find("show_btn")
	arg_2_0.showPanelTF = arg_2_0._tf:Find("show_panel")
	arg_2_0.showAnim = arg_2_0.showPanelTF:GetComponent(typeof(Animation))
	arg_2_0.showAnimEvent = arg_2_0.showPanelTF:GetComponent(typeof(DftAniEvent))

	arg_2_0.showAnimEvent:SetEndEvent(function()
		setActive(arg_2_0.showPanelTF, false)
	end)

	arg_2_0.blurBg = arg_2_0.showPanelTF:Find("content")
	arg_2_0.foldBtn = arg_2_0.showPanelTF:Find("fold_btn")
	arg_2_0.contnetTF = arg_2_0.showPanelTF:Find("content")

	setText(arg_2_0.contnetTF:Find("personality_title/Text"), i18n("child2_personality_title"))

	arg_2_0.personalityTF = arg_2_0.contnetTF:Find("personality")
	arg_2_0.personalityValueTF = arg_2_0.personalityTF:Find("slider/handle/Image/bubble/Text")

	setText(arg_2_0.contnetTF:Find("attr_title/Text"), i18n("child2_attr_title"))

	local var_2_0 = arg_2_0.contnetTF:Find("attrs/content")

	arg_2_0.gradientBgTF = arg_2_0.contnetTF:Find("attrs/bg_gradient")
	arg_2_0.attrUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	setText(arg_2_0.contnetTF:Find("talent_title/Text"), i18n("child2_talent_title"))

	local var_2_1 = arg_2_0.contnetTF:Find("talents/content")

	arg_2_0.talentUIList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))

	setText(arg_2_0.contnetTF:Find("status_title/Text"), i18n("child2_status_title"))

	local var_2_2 = arg_2_0.contnetTF:Find("status/content/content")

	arg_2_0.statusUIList = UIItemList.New(var_2_2, var_2_2:Find("tpl"))
	arg_2_0.attrIds = arg_2_0.contextData.char:GetAttrIds()
	arg_2_0.talentRoundIds = arg_2_0.contextData.char:GetRoundData():GetTalentRoundIds()
end

function var_0_0.OnInit(arg_4_0)
	local var_4_0 = "neweducateicon/" .. arg_4_0.contextData.char:getConfig("child2_data_personality_icon")[1]

	LoadImageSpriteAsync(var_4_0, arg_4_0.personalityTF:Find("slider/handle/Image"), true)
	onButton(arg_4_0, arg_4_0.showBtn, function()
		arg_4_0:ShowPanel()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.foldBtn, function()
		arg_4_0:HidePanel()
	end, SFX_PANEL)
	arg_4_0.attrUIList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventInit then
			local var_7_0 = arg_4_0.attrIds[arg_7_1 + 1]
			local var_7_1 = pg.child2_attr[var_7_0]

			LoadImageSpriteAsync("neweducateicon/" .. var_7_1.icon, arg_7_2:Find("icon_bg/icon"))
			setScrollText(arg_7_2:Find("name_mask/name"), var_7_1.name)
		elseif arg_7_0 == UIItemList.EventUpdate then
			arg_4_0:OnUpdateAttrItem(arg_7_1, arg_7_2)
		end
	end)
	arg_4_0.talentUIList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			arg_4_0:OnUpdateTalentItem(arg_8_1, arg_8_2)
		end
	end)
	arg_4_0.statusUIList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_4_0:OnUpdateStatusItem(arg_9_1, arg_9_2)
		end
	end)
	arg_4_0:OverlayPanel(arg_4_0._tf, {
		groupDelta = -1,
		pbList = {
			arg_4_0.blurBg
		}
	})
	setActive(arg_4_0.foldPanelTF, true)
	setActive(arg_4_0.showPanelTF, false)

	if arg_4_0.contextData.hide then
		arg_4_0:HidePanel()
	elseif arg_4_0.contextData.isMainEnter then
		onDelayTick(function()
			arg_4_0:ShowPanel()
		end, 0.396)
	else
		arg_4_0:ShowPanel()
	end

	arg_4_0:Flush()
end

function var_0_0.IsShowPanel(arg_11_0)
	return isActive(arg_11_0.showPanelTF)
end

function var_0_0.ShowPanel(arg_12_0)
	setActive(arg_12_0.foldPanelTF, false)
	setActive(arg_12_0.showPanelTF, true)
end

function var_0_0.HidePanel(arg_13_0, arg_13_1)
	setActive(arg_13_0.foldPanelTF, true)

	if not arg_13_1 then
		arg_13_0.showAnim:Play("anim_educate_archive_show_out")
	else
		setActive(arg_13_0.showPanelTF, false)
	end

	eachChild(arg_13_0.talentUIList.container, function(arg_14_0)
		triggerToggle(arg_14_0:Find("unlock"), false)
	end)
	eachChild(arg_13_0.statusUIList.container, function(arg_15_0)
		triggerToggle(arg_15_0, false)
	end)
end

function var_0_0.OnUpdateAttrItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.attrIds[arg_16_1 + 1]
	local var_16_1 = pg.child2_attr[var_16_0]
	local var_16_2 = arg_16_0.contextData.char:GetAttr(var_16_0)
	local var_16_3, var_16_4 = var_0_0.GetArrtInfo(var_16_1.rank, var_16_2)

	setText(arg_16_2:Find("rank/Text"), var_16_3)
	setText(arg_16_2:Find("value"), var_16_4)

	local var_16_5 = EducateConst.GRADE_2_COLOR[var_16_3][1]
	local var_16_6 = EducateConst.GRADE_2_COLOR[var_16_3][2]
	local var_16_7 = arg_16_0.gradientBgTF:GetChild(arg_16_1)

	setImageColor(var_16_7, Color.NewHex(var_16_5))
	setImageColor(arg_16_2:Find("rank"), Color.NewHex(var_16_6))
end

function var_0_0.OnUpdateTalentItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.talents[arg_17_1 + 1]

	setActive(arg_17_2:Find("unlock"), var_17_0)
	setActive(arg_17_2:Find("lock"), not var_17_0)

	if var_17_0 then
		LoadImageSpriteAsync("neweducateicon/" .. var_17_0:getConfig("item_icon_little"), arg_17_2:Find("unlock/icon"))
		setText(arg_17_2:Find("unlock/name"), shortenString(var_17_0:getConfig("name"), 5))
		setText(arg_17_2:Find("unlock/info/content/name"), var_17_0:getConfig("name"))
		setText(arg_17_2:Find("unlock/info/content/desc"), var_17_0:getConfig("desc"))
	end

	local var_17_1 = arg_17_0.talentRoundIds[arg_17_1 + 1]

	onButton(arg_17_0, arg_17_2:Find("lock"), function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("child2_talent_unlock_tip", var_17_1))
	end, SFX_PANEL)
	onScroll(arg_17_0, arg_17_0.contnetTF:Find("status"), function(arg_19_0)
		eachChild(arg_17_0.statusUIList.container, function(arg_20_0)
			triggerToggle(arg_20_0, false)
		end)
	end)
end

function var_0_0.OnUpdateStatusItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0.status[arg_21_1 + 1]

	if arg_21_2.name ~= tostring(var_21_0.id) then
		arg_21_2.name = var_21_0.id

		LoadImageSpriteAsync("neweducateicon/" .. var_21_0:getConfig("item_icon"), arg_21_2:Find("icon"))
	end

	local var_21_1 = var_21_0:getConfig("during_time")
	local var_21_2 = var_21_0:GetEndRound() - arg_21_0.contextData.char:GetRoundData().round
	local var_21_3 = var_21_1 == -1 and i18n("child2_status_time2") or i18n("child2_status_time1", var_21_2)

	setText(arg_21_2:Find("time/Text"), var_21_3)
	setText(arg_21_2:Find("info/content/name"), var_21_0:getConfig("name"))
	setText(arg_21_2:Find("info/content/desc"), var_21_0:getConfig("desc"))
end

function var_0_0.Flush(arg_22_0)
	arg_22_0:FlushAttrs()
	arg_22_0:FlushTalents()
	arg_22_0:FlushStatus()
end

function var_0_0.FlushAttrs(arg_23_0)
	local var_23_0 = arg_23_0.contextData.char:GetPersonalityMiddle()
	local var_23_1 = arg_23_0.contextData.char:GetPersonalityTag()
	local var_23_2 = arg_23_0.contextData.char:GetPersonality()

	setSlider(arg_23_0.personalityTF:Find("slider"), -var_23_0, var_23_0, var_23_2 - var_23_0)
	setText(arg_23_0.personalityValueTF, math.abs(var_23_2 - var_23_0))

	local var_23_3 = var_23_1 == "tag1" and "26b1f3" or "ff6767"

	setTextColor(arg_23_0.personalityValueTF, Color.NewHex(var_23_3))
	arg_23_0.attrUIList:align(#arg_23_0.attrIds)
end

function var_0_0.FlushTalents(arg_24_0)
	arg_24_0.talents = arg_24_0.contextData.char:GetTalentList()

	arg_24_0.talentUIList:align(#arg_24_0.talentRoundIds)
end

function var_0_0.FlushStatus(arg_25_0)
	arg_25_0.status = arg_25_0.contextData.char:GetStatusList()

	arg_25_0.statusUIList:align(#arg_25_0.status)
end

function var_0_0.OnDestroy(arg_26_0)
	arg_26_0:UnOverlayPanel(arg_26_0._tf)
end

function var_0_0.GetArrtInfo(arg_27_0, arg_27_1)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0) do
		if arg_27_1 >= iter_27_1[1][1] and arg_27_1 < iter_27_1[1][2] then
			return iter_27_1[2], arg_27_1 .. "/" .. iter_27_1[1][2]
		end
	end

	return arg_27_0[#arg_27_0][2], arg_27_1 .. "/" .. arg_27_0[#arg_27_0][1][2]
end

return var_0_0
