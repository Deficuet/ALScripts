local var_0_0 = class("IslandMechaModelPreviewPage", import("Mod.Island.View.page.ship.IslandBaseShipDisplayPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandMechaModePreviewUI"
end

function var_0_0.NeedCache(arg_2_0)
	return false
end

function var_0_0.GetActiveCamName(arg_3_0)
	return IslandConst.MODEL_PREVIEW_CAMERA_NAME
end

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0.backBtn = arg_4_0._tf:Find("adapt/left_panel/back")

	setText(arg_4_0._tf:Find("adapt/left_panel/title/Text"), i18n("island_dressup_titile"))
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		arg_5_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_7_0)
	var_0_0.super.Show(arg_7_0)

	local var_7_0 = pg.island_unit_character[0]

	arg_7_0:LoadCharacter({
		model = var_7_0.model,
		animator = var_7_0.animator
	}, false)
end

function var_0_0.GetSmoothRotateObject(arg_8_0)
	return arg_8_0._tf:Find("adapt/char")
end

function var_0_0.Hide(arg_9_0)
	var_0_0.super.Hide(arg_9_0)

	if arg_9_0.timer then
		arg_9_0.timer:Stop()
	end
end

function var_0_0.SetObjInitRotaion(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:GetSmoothRotateObject()
	local var_10_1 = GetOrAddComponent(var_10_0, typeof(SmoothRotateObject))

	var_10_1.rotationSpeed = 5

	ReflectionHelp.RefSetProperty(typeof(SmoothRotateObject), "targetRotation", var_10_1, arg_10_1)

	if arg_10_0.timer then
		arg_10_0.timer:Stop()
	end

	arg_10_0.timer = Timer.New(function()
		local var_11_0 = pg.island_set.character_detail_camera_speed.key_value_int

		var_10_1.rotationSpeed = var_11_0
	end, 0.5, 1)

	arg_10_0.timer:Start()
end

function var_0_0.IsPreviewScene(arg_12_0)
	return true
end

function var_0_0.GetDressByType(arg_13_0)
	return {
		[IslandShipDressHelperNew.DressType.Body] = 1060013
	}
end

return var_0_0
