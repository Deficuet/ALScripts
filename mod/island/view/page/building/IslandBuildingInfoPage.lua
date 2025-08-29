local var_0_0 = class("IslandBuildingInfoPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandBuildingInfoTpl"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0:findTF("frame/tags/ship/Text"), i18n("island_ship_title_info"))
	setText(arg_2_0:findTF("frame/tags/building/Text"), i18n("island_building_title_info"))

	arg_2_0.shipPage = arg_2_0:findTF("frame/shipPanel")
	arg_2_0.shipUIList = UIItemList.New(arg_2_0:findTF("list/content", arg_2_0.shipPage), arg_2_0:findTF("list/content/tpl", arg_2_0.shipPage))

	setText(arg_2_0:findTF("skill/title", arg_2_0.shipPage), i18n("island_word_effect"))

	arg_2_0.skillUIList = UIItemList.New(arg_2_0:findTF("skill/list/content", arg_2_0.shipPage), arg_2_0:findTF("skill/list/content/tpl", arg_2_0.shipPage))

	setText(arg_2_0:findTF("ship_num/title", arg_2_0.shipPage), i18n("island_word_dispatch"))

	arg_2_0.shipNumTF = arg_2_0:findTF("ship_num/num", arg_2_0.shipPage)
	arg_2_0.buildingPage = arg_2_0:findTF("frame/buildingPanel")
	arg_2_0.buildingNameTF = arg_2_0:findTF("name", arg_2_0.buildingPage)
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.shipUIList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_3_0.shipList[arg_4_1 + 1]

			setText(arg_3_0:findTF("name", arg_4_2), var_4_0:GetName())

			local var_4_1 = IslandShip.StaticGetPrefab(var_4_0.id)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_4_1, "", arg_3_0:findTF("icon", arg_4_2))

			local var_4_2 = var_4_0:GetEnergy()
			local var_4_3 = var_4_0:GetMaxEnergy()

			setText(arg_3_0:findTF("energy_bar/Text", arg_4_2), var_4_2 .. "/" .. var_4_3)
			setSlider(arg_3_0:findTF("energy_bar", arg_4_2), 0, 1, var_4_2 / var_4_3)
			setText(arg_3_0:findTF("status", arg_4_2), var_4_2 > 0 and i18n("island_word_working") or i18n("island_word_stop_work"))

			local var_4_4 = var_4_2 / 10

			setText(arg_3_0:findTF("time", arg_4_2), var_4_4 .. "s")
		end
	end)
	arg_3_0.skillUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_3_0.skillIdList[arg_5_1 + 1]
			local var_5_1 = pg.island_chara_skill[var_5_0].desc

			setText(arg_5_2, var_5_1)
		end
	end)
end

function var_0_0.Show(arg_6_0, arg_6_1)
	var_0_0.super.Show(arg_6_0)

	arg_6_0.building = arg_6_1

	setText(arg_6_0.buildingNameTF, arg_6_0.building:GetName())

	arg_6_0.shipList = {}
	arg_6_0.skillIdList = {}

	local var_6_0 = 0

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.building:GetCommissionList()) do
		if iter_6_1:IsUnlock() then
			var_6_0 = var_6_0 + 1
		end

		if iter_6_1:GetStatus() == IslandProductionCommission.STATUS_WORKING then
			local var_6_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(iter_6_1:GetShipId())

			table.insert(arg_6_0.shipList, var_6_1)
			table.insert(arg_6_0.skillIdList, var_6_1:GetMainSkill())
		end
	end

	arg_6_0.shipUIList:align(#arg_6_0.shipList)
	arg_6_0.skillUIList:align(#arg_6_0.skillIdList)
	setText(arg_6_0.shipNumTF, #arg_6_0.shipList .. "/" .. var_6_0)
end

function var_0_0.OnDestroy(arg_7_0)
	return
end

return var_0_0
