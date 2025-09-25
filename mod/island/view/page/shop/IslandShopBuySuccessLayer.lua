local var_0_0 = class("IslandShopBuySuccessLayer", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShopBuySuccessUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.awardList = UIItemList.New(arg_2_0._tf:Find("awards"), arg_2_0._tf:Find("awards/item"))

	setText(arg_2_0._tf:Find("tip/text"), i18n("island_3Dshop_close"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("award_window"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("tip"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.SetUp(arg_6_0, arg_6_1)
	arg_6_0.awardList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = arg_6_1[arg_7_1 + 1]

			if var_7_0.type == VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT and var_7_0.id == 0 then
				LoadImageSpriteAtlasAsync("island/" .. pg.island_set.season_pt.key_value_varchar[2], "", arg_7_2:Find("IslandItemTpl/icon_bg/icon"))
				setText(arg_7_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_7_0.count)
				setActive(arg_7_2:Find("split"), true)
			else
				setActive(arg_7_2:Find("split"), false)

				if var_7_0.type == DROP_TYPE_ISLAND_ITEM or var_7_0.type == DROP_TYPE_ISLAND_SPEEDUP_TICKET then
					updateCustomDrop(arg_7_2:Find("IslandItemTpl"), {
						type = var_7_0.type,
						id = var_7_0.id,
						count = var_7_0.count
					})
				elseif var_7_0.type == DROP_TYPE_ISLAND_FURNITURE then
					GetImageSpriteFromAtlasAsync("island/IslandFurnitureIcon/" .. pg.island_furniture_template[var_7_0.id].icon, "", arg_7_2:Find("IslandItemTpl/icon_bg/icon"))
					setText(arg_7_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_7_0.count)
				elseif var_7_0.type == DROP_TYPE_ISLAND_DRESS then
					GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. pg.island_dress_template[var_7_0.id].icon, "", arg_7_2:Find("IslandItemTpl/icon_bg/icon"))
					setText(arg_7_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_7_0.count)
				elseif var_7_0.type == DROP_TYPE_ISLAND_SKIN then
					GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. pg.island_skin_template[var_7_0.id].icon, "", arg_7_2:Find("IslandItemTpl/icon_bg/icon"))
					setText(arg_7_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_7_0.count)
				end
			end
		end
	end)
	arg_6_0.awardList:align(#arg_6_1)
end

function var_0_0.OnShow(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0:BlurPanel(arg_8_0._tf)
	arg_8_0:SetUp(arg_8_1)

	arg_8_0.callback = arg_8_2
	arg_8_0.active = true
end

function var_0_0.OnHide(arg_9_0)
	arg_9_0:UnOverlayPanel(arg_9_0._tf, arg_9_0._parentTf)

	if arg_9_0.active then
		arg_9_0.active = false

		if arg_9_0.callback then
			arg_9_0.callback()
		end
	end
end

function var_0_0.OnDestroy(arg_10_0)
	return
end

return var_0_0
