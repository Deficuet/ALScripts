local var_0_0 = class("IslandShipFirstDressupPage", import(".IslandBaseDressupPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommanderMainUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.leftPlane = arg_2_0:findTF("adapt/left_panel")
	arg_2_0.backBtn = arg_2_0:findTF("adapt/left_panel/back")
	arg_2_0.homeBtn = arg_2_0:findTF("adapt/home")

	setText(arg_2_0:findTF("adapt/left_panel/title/Text"), i18n("island_dressup_titile"))
	setActive(arg_2_0.leftPlane, false)
	setActive(arg_2_0.homeBtn, false)
end

function var_0_0.AddListeners(arg_3_0)
	arg_3_0:AddListener(GAME.ISLAND_CHANGE_COMMANDER_DRESS_DONE, arg_3_0.OnDressUpDone)
end

function var_0_0.RemoveListeners(arg_4_0)
	arg_4_0:RemoveListener(GAME.ISLAND_CHANGE_COMMANDER_DRESS_DONE, arg_4_0.OnDressUpDone)
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

function var_0_0.Show(arg_10_0, arg_10_1)
	arg_10_0.callback = arg_10_1

	var_0_0.super.Show(arg_10_0)
	arg_10_0:Flush()

	arg_10_0.shipDressHelper = IslandShipDressHelperNew.New()

	arg_10_0.shipDressHelper:SetShipId(0)

	arg_10_0.currentChildPage = arg_10_0:OpenPage(IslandShipDressUpPageNew, 0, true, arg_10_0.shipDressHelper)

	local var_10_0 = pg.island_unit_character[0]

	arg_10_0:LoadCharacter({
		model = var_10_0.model,
		animator = var_10_0.animator
	})
end

function var_0_0.Flush(arg_11_0)
	return
end

function var_0_0.GetSmoothRotateObject(arg_12_0)
	return GetOrAddComponent(arg_12_0:findTF("adapt/char"), typeof(SmoothRotateObject))
end

function var_0_0.OnCharLoaded(arg_13_0)
	arg_13_0.shipDressHelper:OnRoleLoaded(arg_13_0.role.transform)
end

function var_0_0.Hide(arg_14_0)
	arg_14_0.currentChildPage:Destroy()
	arg_14_0.shipDressHelper:Destroy()
	var_0_0.super.Hide(arg_14_0)
end

function var_0_0.OnDressUpDone(arg_15_0)
	arg_15_0:Hide()
	arg_15_0:ClearCharacterScene(arg_15_0.callback)
end

function var_0_0.CheckDressIsDirty(arg_16_0)
	return arg_16_0.currentChildPage:CheckDressIsDirty()
end

function var_0_0.OnDestroy(arg_17_0)
	return
end

return var_0_0
