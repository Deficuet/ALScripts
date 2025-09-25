local var_0_0 = class("CommanderSkillInfoLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CommanderSkillInfoUI"
end

function var_0_0.init(arg_2_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)

	arg_2_0.skillNameTxt = arg_2_0:findTF("panel/bg/skill_name"):GetComponent(typeof(Text))
	arg_2_0.skillLevelTxt = arg_2_0:findTF("panel/bg/skill_lv"):GetComponent(typeof(Text))
	arg_2_0.skillDescTxt = arg_2_0:findTF("panel/bg/help_panel/skill_intro"):GetComponent(typeof(Text))
	arg_2_0.skillIcon = arg_2_0:findTF("panel/bg/skill_icon")
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0:findTF("panel/top/btnBack"), function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0:findTF("panel/ok_button"), function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CONFIRM)
	arg_3_0:updateSkill()
end

function var_0_0.updateSkill(arg_7_0)
	local var_7_0 = arg_7_0.contextData.skill

	arg_7_0.skillNameTxt.text = var_7_0:getConfig("name")
	arg_7_0.skillLevelTxt.text = "Lv." .. var_7_0:getLevel()
	arg_7_0.skillDescTxt.text = var_7_0:getConfig("desc")

	GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. var_7_0:getConfig("icon"), "", arg_7_0.skillIcon)
end

function var_0_0.close(arg_8_0)
	arg_8_0:emit(var_0_0.ON_CLOSE)
end

function var_0_0.willExit(arg_9_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0._tf)
end

return var_0_0
