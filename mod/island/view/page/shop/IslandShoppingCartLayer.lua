local var_0_0 = class("IslandShoppingCartLayer", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShoppingCartUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.panel = arg_2_0._tf:Find("panel")
	arg_2_0.closeBtn = arg_2_0.panel:Find("closeBtn")
	arg_2_0.commodityList = arg_2_0.panel:Find("commodityList/Viewport/Content")
	arg_2_0.cancelBtn = arg_2_0.panel:Find("cancelBtn")
	arg_2_0.buyBtn = arg_2_0.panel:Find("buyBtn")
	arg_2_0.consumeIcon = arg_2_0.buyBtn:Find("consume/icon")
	arg_2_0.consumeCount = arg_2_0.buyBtn:Find("consume/count")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.SetUp(arg_7_0, arg_7_1)
	local var_7_0
	local var_7_1
	local var_7_2 = 0

	for iter_7_0 = 1, 3 do
		local var_7_3 = arg_7_0.commodityList:Find("commodity" .. iter_7_0)

		setActive(var_7_3:Find("normal"), iter_7_0 <= #arg_7_1)
		setActive(var_7_3:Find("nothing"), iter_7_0 > #arg_7_1)

		if iter_7_0 <= #arg_7_1 then
			local var_7_4 = arg_7_1[iter_7_0]

			GetImageSpriteFromAtlasAsync(var_7_4:GetIcon(), "", var_7_3:Find("normal/IslandItemTpl/icon_bg/icon"))
			setText(var_7_3:Find("normal/name"), var_7_4:GetName())
			setActive(var_7_3:Find("normal/count"), false)

			if #var_7_4:GetItems() == 1 then
				local var_7_5 = 0

				if var_7_4:GetItems()[1][1] == DROP_TYPE_ISLAND_FURNITURE then
					local var_7_6 = getProxy(IslandProxy):GetIsland():GetAgoraAgency():GetFurnitures()

					for iter_7_1, iter_7_2 in ipairs(var_7_6) do
						if iter_7_2.id == var_7_4:GetItems()[1][2] then
							var_7_5 = iter_7_2.count

							break
						end
					end

					setActive(var_7_3:Find("normal/count"), true)
					setText(var_7_3:Find("normal/count"), "拥有数量(" .. var_7_5 .. ")")
				elseif var_7_4:GetItems()[1][1] == DROP_TYPE_ISLAND_DRESS then
					local var_7_7 = var_7_4:GetItems()[1][2]

					if pg.island_dress_template[var_7_7].belongto == 2 then
						local var_7_8 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetOwnDressCountByDressId(var_7_7)

						setActive(var_7_3:Find("normal/count"), true)
						setText(var_7_3:Find("normal/count"), "拥有数量(" .. var_7_8 .. ")")
					end
				end
			end

			local var_7_9 = var_7_4:GetResourceConsume()

			GetImageSpriteFromAtlasAsync(Drop.New({
				type = var_7_9[1],
				id = var_7_9[2]
			}):getIcon(), "", var_7_3:Find("normal/consumeIcon"))
			setText(var_7_3:Find("normal/consumeNum"), var_7_9[3])

			var_7_0 = var_7_9[1]
			var_7_1 = var_7_9[2]
			var_7_2 = var_7_2 + var_7_9[3]
		end
	end

	GetImageSpriteFromAtlasAsync(Drop.New({
		type = var_7_0,
		id = var_7_1
	}):getIcon(), "", arg_7_0.consumeIcon)
	setText(arg_7_0.consumeCount, var_7_2)
	onButton(arg_7_0, arg_7_0.buyBtn, function()
		local var_8_0 = {}

		for iter_8_0, iter_8_1 in ipairs(arg_7_1) do
			table.insert(var_8_0, {
				value2 = 1,
				key = iter_8_1.shopId,
				value1 = iter_8_1.id
			})
		end

		arg_7_0:emit(IslandMediator.BUY_COMMODITY, var_8_0)
	end, SFX_PANEL)
end

function var_0_0.Refresh(arg_9_0)
	arg_9_0:SetUp(arg_9_0.commodities)
end

function var_0_0.OnShow(arg_10_0, arg_10_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf, false, {
		groupName = "IslandShop"
	})

	arg_10_0.commodities = arg_10_1

	arg_10_0:SetUp(arg_10_0.commodities)
end

function var_0_0.OnHide(arg_11_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_11_0._tf, arg_11_0._parentTf)
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

return var_0_0
