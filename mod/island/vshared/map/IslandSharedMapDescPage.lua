local var_0_0 = class("IslandSharedMapDescPage", import("Mod.Island.View.page.map.IslandBaseMapDescPage"))

function var_0_0.OnShow(arg_1_0, arg_1_1)
	var_0_0.super.OnShow(arg_1_0, arg_1_1)
	arg_1_0:UpdateProductionList(arg_1_1)
end

function var_0_0.UpdateProductionList(arg_2_0, arg_2_1)
	local var_2_0 = pg.island_map_details.get_id_list_by_belong_map[arg_2_1]
	local var_2_1 = arg_2_0:GetIsland():GetAblityAgency()
	local var_2_2 = _.select(var_2_0, function(arg_3_0)
		return var_2_1:HasAbility(pg.island_map_details[arg_3_0].ability_id)
	end)

	arg_2_0.uiProductionList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = var_2_2[arg_4_1 + 1]
			local var_4_1 = pg.island_map_details[var_4_0]

			GetImageSpriteFromAtlasAsync("island/IslandMapRes", var_4_1.detail_icon, arg_4_2)
			setText(arg_4_2:Find("Text"), var_4_1.name)
			setActive(arg_4_2:Find("full"), false)
		end
	end)
	arg_2_0.uiProductionList:align(#var_2_2)
end

return var_0_0
