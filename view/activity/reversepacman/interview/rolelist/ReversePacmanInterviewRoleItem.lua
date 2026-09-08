local var_0_0 = class("ReversePacmanInterviewRoleItem", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2
	arg_1_0.roleID = arg_1_3

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
	arg_1_0:didEnter()
end

function var_0_0.Init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiBtn, function()
		arg_2_0:emit(ReversePacmanInterviewScene.ON_SELECTED_ROLE, arg_2_0.roleID)
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_4_0)
	return
end

function var_0_0.SetRoleID(arg_5_0, arg_5_1)
	arg_5_0.roleID = arg_5_1

	arg_5_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_6_0)
	local var_6_0 = pg.activity_chasing_character[arg_6_0.roleID]
	local var_6_1 = ShipGroup.getDefaultShipConfig(pg.ship_skin_template[var_6_0.skin_id].ship_group).id
	local var_6_2 = Ship.New({
		id = var_6_1,
		configId = var_6_1,
		skin_id = var_6_0.skin_id
	})

	GetImageSpriteFromAtlasAsync("shipYardIcon/" .. var_6_2:getPainting(), var_6_2:getPainting(), arg_6_0.uiIconImage)

	local var_6_3 = ReversePacmanTools.IsUnlockRole(arg_6_0.roleID)

	if not ReversePacmanTools.IsUnlockRole(arg_6_0.roleID) then
		setImageColor(arg_6_0.uiIconImage, Color.NewHex("#00000096"))
	elseif ReversePacmanTools.IsHireRole(arg_6_0.roleID) then
		setImageColor(arg_6_0.uiIconImage, Color.NewHex("#ffffffff"))
	else
		setImageColor(arg_6_0.uiIconImage, Color.NewHex("#5E5D5Dff"))
	end

	setActive(arg_6_0.uiSelectedGo, false)
	setActive(arg_6_0.uiOwnedGo, getProxy(ShipSkinProxy):hasSkin(var_6_0.skin_id))
	arg_6_0:Show(true)
end

function var_0_0.Show(arg_7_0, arg_7_1)
	setActive(arg_7_0._go, arg_7_1)
end

function var_0_0.OnSlectedRole(arg_8_0, arg_8_1)
	setActive(arg_8_0.uiSelectedGo, arg_8_0.roleID == arg_8_1)
end

function var_0_0.willExit(arg_9_0)
	arg_9_0:detach()
	Object.Destroy(arg_9_0._go)

	arg_9_0._tf = nil
	arg_9_0._go = nil
end

return var_0_0
