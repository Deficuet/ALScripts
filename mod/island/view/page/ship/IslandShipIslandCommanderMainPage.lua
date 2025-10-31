local var_0_0 = class("IslandShipIslandCommanderMainPage", import(".IslandBaseShipDisplayPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommanderMainUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("adapt/left_panel/back")
	arg_2_0.homeBtn = arg_2_0._tf:Find("adapt/home")

	setText(arg_2_0._tf:Find("adapt/left_panel/title/Text"), i18n("island_dressup_titile"))
	setActive(arg_2_0.homeBtn, false)
end

function var_0_0.AddListeners(arg_3_0)
	return
end

function var_0_0.RemoveListeners(arg_4_0)
	return
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.homeBtn, function()
		arg_5_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.backBtn, function()
		if arg_5_0:CheckDressIsDirty() then
			arg_5_0:ShowMsgBox({
				type = IslandMsgBox.TYPE_COMMON,
				content = i18n("island_dressup_tip_1"),
				onYes = function()
					arg_5_0.currentChildPage:SaveDressUpData()
					arg_5_0:Hide()
				end,
				onNo = function()
					arg_5_0:Hide()
				end
			})
		else
			arg_5_0:Hide()
		end
	end, SFX_PANEL)
end

function var_0_0.Show(arg_10_0)
	var_0_0.super.Show(arg_10_0)
	arg_10_0:Flush()

	local var_10_0 = pg.island_unit_character[0]

	arg_10_0.shipDressHelper = IslandShipDressHelperNew.New()

	arg_10_0.shipDressHelper:SetShipId(0)
	arg_10_0:LoadCharacter({
		model = var_10_0.model,
		animator = var_10_0.animator
	}, true)

	arg_10_0.currentChildPage = arg_10_0:OpenPage(IslandShipDressUpPageNew, 0, false, arg_10_0.shipDressHelper, function(arg_11_0)
		arg_10_0:SetObjInitRotaion(arg_11_0)
	end)
end

function var_0_0.Flush(arg_12_0)
	return
end

function var_0_0.GetSmoothRotateObject(arg_13_0)
	return arg_13_0._tf:Find("adapt/char")
end

function var_0_0.OnCharLoaded(arg_14_0)
	arg_14_0.shipDressHelper:OnRoleLoaded(arg_14_0.role.transform)
end

function var_0_0.Hide(arg_15_0)
	arg_15_0.currentChildPage:Destroy()
	arg_15_0.shipDressHelper:Destroy()
	var_0_0.super.Hide(arg_15_0)

	if arg_15_0.timer then
		arg_15_0.timer:Stop()
	end
end

function var_0_0.OnDestroy(arg_16_0)
	return
end

function var_0_0.SetObjInitRotaion(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:GetSmoothRotateObject()
	local var_17_1 = GetOrAddComponent(var_17_0, typeof(SmoothRotateObject))

	var_17_1.rotationSpeed = 5

	ReflectionHelp.RefSetProperty(typeof(SmoothRotateObject), "targetRotation", var_17_1, arg_17_1)

	if arg_17_0.timer then
		arg_17_0.timer:Stop()
	end

	arg_17_0.timer = Timer.New(function()
		local var_18_0 = pg.island_set.character_detail_camera_speed.key_value_int

		var_17_1.rotationSpeed = var_18_0
	end, 0.5, 1)

	arg_17_0.timer:Start()
end

function var_0_0.CheckDressIsDirty(arg_19_0)
	return arg_19_0.currentChildPage:CheckDressIsDirty()
end

return var_0_0
