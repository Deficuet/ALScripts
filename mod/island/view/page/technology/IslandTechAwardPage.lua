local var_0_0 = class("IslandTechAwardPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechAwardUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.nameTF = arg_2_0._tf:Find("window/name_bg/Text")
	arg_2_0.iconTF = arg_2_0._tf:Find("window/icon_bg/Image")
	arg_2_0.tipTF = arg_2_0._tf:Find("window/tip")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_5_0, arg_5_1)
	local var_5_0 = pg.island_technology_template[arg_5_1]

	LoadImageSpriteAsync("island/IslandTechnology/" .. var_5_0.tech_icon, arg_5_0.iconTF, true)
	setText(arg_5_0.nameTF, var_5_0.tech_name)
	setText(arg_5_0.tipTF, var_5_0.complete_tips)
	arg_5_0:BlurPanel()
end

function var_0_0.OnHide(arg_6_0)
	arg_6_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_7_0)
	arg_7_0:OnHide()
end

function var_0_0.OnDestroy(arg_8_0)
	arg_8_0:OnHide()
end

return var_0_0
