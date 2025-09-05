local var_0_0 = class("AgoraDecorationPreview", import("Mod.Island.Core.View.IslandBaseSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandAgoraPreviewDecorationUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0.backBtn = arg_2_0._tf:Find("top/back")

	onButton(arg_2_0, arg_2_0.backBtn, function()
		arg_2_0:Op("GoBackLastExitPoint")
	end, SFX_CANCEL)
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_agora_furniure_preview"))
end

function var_0_0.Execute(arg_4_0, arg_4_1, ...)
	if not arg_4_0[arg_4_1] then
		return
	end

	var_0_0.super.Execute(arg_4_0, arg_4_1, ...)
end

return var_0_0
