local var_0_0 = class("IslandShopBuySuccessLayer", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShopBuySuccessUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.awardList = UIItemList.New(arg_2_0._tf:Find("awards"), arg_2_0._tf:Find("awards/item"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("award_window"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.SetUp(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_2.count > 0 then
		table.insert(arg_5_1, 1, arg_5_2)
	end

	arg_5_0.awardList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = arg_5_1[arg_6_1 + 1]

			if var_6_0.type == VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT and var_6_0.id == 0 then
				LoadImageSpriteAtlasAsync("island/" .. pg.island_set.season_pt.key_value_varchar[2], "", arg_6_2:Find("IslandItemTpl/icon_bg/icon"))
				setText(arg_6_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_6_0.count)
				setActive(arg_6_2:Find("split"), true)
			else
				setActive(arg_6_2:Find("split"), false)

				if var_6_0.type == DROP_TYPE_ISLAND_ITEM then
					updateCustomDrop(arg_6_2:Find("IslandItemTpl"), {
						type = var_6_0.type,
						id = var_6_0.id,
						count = var_6_0.number
					})
				elseif var_6_0.type == DROP_TYPE_ISLAND_FURNITURE then
					GetImageSpriteFromAtlasAsync("island/IslandFurnitureIcon/" .. pg.island_furniture_template[var_6_0.id].icon, "", arg_6_2:Find("IslandItemTpl/icon_bg/icon"))
					setText(arg_6_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_6_0.number)
				elseif var_6_0.type == DROP_TYPE_ISLAND_DRESS then
					GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. pg.island_dress_template[var_6_0.id].icon, "", arg_6_2:Find("IslandItemTpl/icon_bg/icon"))
					setText(arg_6_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_6_0.number)
				elseif var_6_0.type == DROP_TYPE_ISLAND_SKIN then
					GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. pg.island_skin_template[var_6_0.id].icon, "", arg_6_2:Find("IslandItemTpl/icon_bg/icon"))
					setText(arg_6_2:Find("IslandItemTpl/icon_bg/count_bg/count"), var_6_0.number)
				end
			end
		end
	end)
	arg_5_0.awardList:align(#arg_5_1)
end

function var_0_0.OnShow(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf, false, {
		groupName = "IslandShop"
	})
	arg_7_0:SetUp(arg_7_1, arg_7_2)

	arg_7_0.callback = arg_7_3
	arg_7_0.active = true
end

function var_0_0.OnHide(arg_8_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_8_0._tf, arg_8_0._parentTf)

	if arg_8_0.active then
		arg_8_0.active = false

		if arg_8_0.callback then
			arg_8_0.callback()
		end
	end
end

function var_0_0.OnDestroy(arg_9_0)
	return
end

return var_0_0
