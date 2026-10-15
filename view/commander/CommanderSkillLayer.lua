local var_0_0 = class("CommanderSkillLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CommanderSkillUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = arg_2_0.contextData.skill

	if var_2_1 then
		local var_2_2 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.Commander.CommanderSkillIcon, var_2_1:getConfig("icon"))

		table.insert(var_2_0, var_2_2)
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.init(arg_3_0)
	local var_3_0 = arg_3_0.contextData.skill

	arg_3_0.backBtn = arg_3_0._tf:Find("top/btnBack")
	arg_3_0.skillInfoName = arg_3_0._tf:Find("panel/bg/skill_name")
	arg_3_0.skillInfoLv = arg_3_0._tf:Find("panel/bg/skill_lv")
	arg_3_0.skillInfoIntro = arg_3_0._tf:Find("panel/bg/help_panel/skill_intro")
	arg_3_0.skillInfoIcon = arg_3_0._tf:Find("panel/bg/skill_icon")
	arg_3_0.buttonList = arg_3_0._tf:Find("panel/buttonList")
	arg_3_0.skillDescTF = arg_3_0._tf:Find("panel/bg/help_panel/Viewport/content/introTF")
	arg_3_0.skillDescContent = arg_3_0._tf:Find("panel/bg/help_panel/Viewport/content")

	setText(arg_3_0.skillInfoName, var_3_0:getConfig("name"))
	setText(arg_3_0.skillInfoLv, "Lv." .. var_3_0:getLevel())

	arg_3_0.skillDescList = UIItemList.New(arg_3_0.skillDescContent, arg_3_0.skillDescTF)

	GetImageSpriteFromAtlasAsync("commanderskillicon/" .. var_3_0:getConfig("icon"), "", arg_3_0.skillInfoIcon)
	arg_3_0:SetLocaliza()
end

function var_0_0.SetLocaliza(arg_4_0)
	setText(arg_4_0._tf:Find("top/title_list/infomation/title"), i18n("words_information"))
	setText(arg_4_0._tf:Find("panel/buttonList/ok_button/Image"), i18n("word_ok"))
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf, function()
		arg_5_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		arg_5_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._tf:Find("panel/buttonList/ok_button"), function()
		arg_5_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf)

	arg_5_0.commonFlag = defaultValue(arg_5_0.contextData.commonFlag, true)

	arg_5_0:UpdateList()
end

function var_0_0.UpdateList(arg_9_0)
	local var_9_0 = arg_9_0.contextData.skill
	local var_9_1 = var_9_0:getConfig("lv")
	local var_9_2 = var_9_0:GetSkillGroup()
	local var_9_3 = var_9_0:getConfig("lv")

	arg_9_0.skillDescList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_9_2[arg_10_1 + 1]
			local var_10_1 = arg_9_0:GetDesc(arg_9_0.commonFlag, var_10_0)
			local var_10_2 = arg_9_0:GetColor(var_9_3 >= var_10_0.lv)
			local var_10_3 = var_9_3 < var_10_0.lv and "(Lv." .. var_10_0.lv .. i18n("word_take_effect") .. ")" or ""

			setText(arg_10_2, "<color=" .. var_10_2 .. ">" .. var_10_1 .. var_10_3 .. "</color>")
			setText(arg_10_2:Find("level"), "<color=" .. var_10_2 .. ">" .. "Lv." .. var_10_0.lv .. "</color>")
		end
	end)
	arg_9_0.skillDescList:align(#var_9_2)
end

function var_0_0.GetDesc(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_1 and arg_11_2.desc_world and arg_11_2.desc_world ~= "" then
		return arg_11_2.desc_world
	else
		return arg_11_2.desc
	end
end

function var_0_0.GetColor(arg_12_0, arg_12_1)
	return "#FFFFFFFF"
end

function var_0_0.willExit(arg_13_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf)
end

function var_0_0.onBackPressed(arg_14_0)
	triggerButton(arg_14_0.backBtn)
end

return var_0_0
