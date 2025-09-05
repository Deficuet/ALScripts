local var_0_0 = class("IslandMakePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandMakeUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("top/back")
	arg_2_0.title = arg_2_0:findTF("top/title")
	arg_2_0.uiList = UIItemList.New(arg_2_0:findTF("frame/content"), arg_2_0:findTF("frame/content/tpl"))
	arg_2_0.infoPage = IslandBuildingInfoPage.New(arg_2_0._tf, arg_2_0.event)
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.uiList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_5_1, arg_5_2)
		end
	end)
end

function var_0_0.UpdateItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.list[arg_6_1 + 1]

	arg_6_2.name = tostring(var_6_0.id)

	local var_6_1 = var_6_0:IsUnlock()

	setActive(arg_6_0:findTF("unlock", arg_6_2), var_6_1)
	setActive(arg_6_0:findTF("lock", arg_6_2), not var_6_1)

	if not var_6_1 then
		setText(arg_6_0:findTF("lock/Text", arg_6_2), i18n("island_make_unlock_tip", arg_6_0.building:GetName(), var_6_0:getConfig("unlock_place_level")))
	else
		local var_6_2 = var_6_0:GetShipId()
		local var_6_3 = arg_6_0:findTF("unlock/ship/icon", arg_6_2)

		setActive(arg_6_0:findTF("unlock/ship/empty", arg_6_2), not var_6_2)
		setActive(var_6_3, var_6_2)
		setActive(arg_6_0:findTF("unlock/name", arg_6_2), var_6_2)
		setActive(arg_6_0:findTF("unlock/energy_bar", arg_6_2), var_6_2)

		if var_6_2 then
			local var_6_4 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_6_2)

			setText(arg_6_0:findTF("unlock/name", arg_6_2), var_6_4:GetName())

			local var_6_5 = var_6_4:GetEnergy() / var_6_4:GetMaxEnergy()

			setSlider(arg_6_0:findTF("unlock/energy_bar", arg_6_2), 0, 1, var_6_5)

			local var_6_6 = IslandShip.StaticGetPrefab(var_6_2)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_6_6, "", var_6_3)
		end

		onButton(arg_6_0, arg_6_0:findTF("unlock/ship", arg_6_2), function()
			arg_6_0:OpenPage(IslandShipSelectPage, var_6_0)
		end, SFX_PANEL)

		local var_6_7 = var_6_0:GetFormulaId()
		local var_6_8 = arg_6_0:findTF("unlock/formula/progress/icon", arg_6_2)

		setActive(arg_6_0:findTF("unlock/formula/progress/empty", arg_6_2), not var_6_7)
		setActive(var_6_8, var_6_7)
		setText(arg_6_0:findTF("unlock/capacity", arg_6_2), var_6_0:GetNum() .. "/" .. var_6_0:GetCapacity())
		setActive(arg_6_0:findTF("unlock/next_tip", arg_6_2), var_6_7)
		setActive(arg_6_0:findTF("unlock/time", arg_6_2), var_6_7)
		setActive(arg_6_0:findTF("unlock/get", arg_6_2), false)

		if var_6_7 then
			local var_6_9 = IslandFormula.New(var_6_7)
			local var_6_10 = pg.island_item_data_template[var_6_9:getConfig("item_id")].icon

			GetImageSpriteFromAtlasAsync(var_6_10, "", var_6_8)
			setSlider(arg_6_0:findTF("unlock/formula/progress", arg_6_2), 0, 1, var_6_0:GetCurTime() / var_6_0:GetOnceTime())
			setText(arg_6_0:findTF("unlock/time", arg_6_2), var_6_0:GetNextRemainTime())
			onButton(arg_6_0, arg_6_0:findTF("unlock/time/quick", arg_6_2), function()
				return
			end, SFX_PANEL)
			onButton(arg_6_0, arg_6_0:findTF("unlock/get", arg_6_2), function()
				arg_6_0:emit(IslandMediator.ON_GET_COMMISSION_AWARD, arg_6_0.building.id, var_6_0.id)
			end, SFX_PANEL)
		end

		onButton(arg_6_0, arg_6_0:findTF("unlock/formula", arg_6_2), function()
			arg_6_0:OpenPage(IslandFormulaSelectPage, arg_6_0.building, var_6_0)
		end, SFX_PANEL)
	end
end

function var_0_0.Show(arg_11_0, arg_11_1)
	var_0_0.super.Show(arg_11_0)

	arg_11_0.building = arg_11_1

	setText(arg_11_0.title, arg_11_0.building:GetName())

	arg_11_0.list = arg_11_0.building:GetCommissionList()

	arg_11_0.uiList:align(#arg_11_0.list)
	arg_11_0.infoPage:ExecuteAction("Show", arg_11_0.building)
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

return var_0_0
