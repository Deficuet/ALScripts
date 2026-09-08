local var_0_0 = class("ReversePacmanHireSuccessScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanHireSuccessUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)

	arg_2_0.nameView = ReversePacmanInterviewRoleName.New(arg_2_0.uiNamePanel, arg_2_0)
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:BlurPanel(arg_4_0._tf)

	local var_4_0 = arg_4_0.contextData.roleID

	arg_4_0.nameView:RefreshUI(var_4_0)

	local var_4_1 = pg.activity_chasing_character[var_4_0]
	local var_4_2 = var_4_1.skin_id
	local var_4_3 = ShipGroup.getDefaultShipConfig(pg.ship_skin_template[var_4_1.skin_id].ship_group).id

	setText(arg_4_0.uiDescText, pg.ship_skin_words[var_4_3] and pg.ship_skin_words[var_4_3].unlock or "")

	local var_4_4 = Ship.New({
		id = var_4_3,
		configId = var_4_3,
		skin_id = var_4_1.skin_id
	}):getPrefab()

	pg.UIMgr.GetInstance():LoadingOn()

	local var_4_5 = SpineAnimChar.New()

	var_4_5:SetPaint(var_4_4)
	var_4_5:Load(true, function(arg_5_0)
		pg.UIMgr.GetInstance():LoadingOff()

		arg_4_0.shipPrefab = var_4_4
		arg_4_0.shipModel = arg_5_0

		arg_5_0:SetLocalScale(Vector3(1, 1, 1))
		arg_5_0:SetParent(arg_4_0.uiCharaParent)
		arg_5_0:SetAction("victory", 0)
	end)
end

function var_0_0.recycleSpineChar(arg_6_0)
	if arg_6_0.shipPrefab and arg_6_0.shipModel then
		arg_6_0.shipModel:Dispose()

		arg_6_0.shipPrefab = nil
		arg_6_0.shipModel = nil
	end
end

function var_0_0.willExit(arg_7_0)
	arg_7_0:recycleSpineChar()
	arg_7_0.nameView:willExit()

	arg_7_0.nameView = nil

	arg_7_0:UnOverlayPanel(arg_7_0._tf)
end

return var_0_0
