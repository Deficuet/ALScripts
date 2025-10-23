local var_0_0 = class("IslandSystemUnlockPage", import(".Island3dTaskAcceptPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSystemUnlockMsgBox"
end

function var_0_0.Show(arg_2_0, arg_2_1, arg_2_2)
	var_0_0.super.super.Show(arg_2_0)
	setText(arg_2_0.tipText, i18n("word_unlock"))

	local var_2_0 = pg.island_ability_template[arg_2_1] or {}
	local var_2_1 = string.split(var_2_0.show_pop_text or "", "|")

	setText(arg_2_0.chapterText, var_2_1[2] or "")
	setText(arg_2_0.nameText, var_2_1[1] or "")

	arg_2_0.onExit = arg_2_2
end

return var_0_0
