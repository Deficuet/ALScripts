local var_0_0 = class("IslandShipSkillMsgboxWindow", import(".IslandBaseMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBoxForShipSkill"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0._tf:Find("close")
	arg_2_0.nameTxt = arg_2_0._tf:Find("name"):GetComponent(typeof(Text))
	arg_2_0.levelTxt = arg_2_0._tf:Find("level"):GetComponent(typeof(Text))
	arg_2_0.descTxt = arg_2_0._tf:Find("content/Text"):GetComponent(typeof(Text))
	arg_2_0.iconTr = arg_2_0._tf:Find("icon")

	setText(arg_2_0._tf:Find("title"), i18n("island_skill_desc"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_5_0)
	local var_5_0 = arg_5_0.settings.skill

	assert(var_5_0)

	arg_5_0.nameTxt.text = var_5_0:GetName()
	arg_5_0.descTxt.text = var_5_0:GetEffectDesc()
	arg_5_0.levelTxt.text = "[Lv." .. var_5_0:GetLevel() .. "]"

	GetImageSpriteFromAtlasAsync("island/IslandSkillIcon/" .. var_5_0:GetIcon(), "", arg_5_0.iconTr)
end

function var_0_0.OnHide(arg_6_0)
	return
end

return var_0_0
