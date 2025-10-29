local var_0_0 = class("IslandBookNpcPage", import(".IslandBookItemPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandBookNpcUI"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.postNameTF = arg_2_0.rightTF:Find("post/Text")
end

function var_0_0.GetIllustrationType(arg_3_0)
	return IslandIllustration.TYPES.NPC
end

function var_0_0.FlushRightPanel(arg_4_0)
	var_0_0.super.FlushRightPanel(arg_4_0)

	if not arg_4_0.showIllustration then
		return
	end

	local var_4_0 = arg_4_0.showIllustration:getLinkConfig("group")
	local var_4_1 = pg.island_npc_hud[var_4_0].title

	setText(arg_4_0.postNameTF, var_4_1)
end

return var_0_0
