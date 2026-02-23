local var_0_0 = class("IslandBookNpcPage", import(".IslandBookItemPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandBookNpcUI"
end

function var_0_0.GetIllustrationType(arg_2_0)
	return IslandIllustration.TYPES.NPC
end

function var_0_0.GetHelpTip(arg_3_0)
	return i18n("island_guide_help_npc")
end

function var_0_0.OnLoaded(arg_4_0)
	var_0_0.super.OnLoaded(arg_4_0)

	arg_4_0.postNameTF = arg_4_0.rightTF:Find("post/Text")
end

function var_0_0.FlushRightPanel(arg_5_0)
	var_0_0.super.FlushRightPanel(arg_5_0)

	if not arg_5_0.showIllustration then
		return
	end

	local var_5_0 = arg_5_0.showIllustration:getLinkConfig("group")
	local var_5_1 = pg.island_npc_hud[var_5_0].title

	setText(arg_5_0.postNameTF, var_5_1)
end

return var_0_0
