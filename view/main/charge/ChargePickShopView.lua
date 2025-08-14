local var_0_0 = class("ChargePickShopView", import(".ChargeGiftShopView"))

function var_0_0.getUIName(arg_1_0)
	return "ChargePickShopUI"
end

function var_0_0.GetViewSkinWrap(arg_2_0)
	return ChargeScene.TYPE_PICK
end

function var_0_0.updateGiftGoodsVOList(arg_3_0)
	arg_3_0.giftGoodsVOList = {}
	arg_3_0.packageSortList = {
		0
	}

	local var_3_0 = RefluxShopView.getAllRefluxPackID()
	local var_3_1 = pg.pay_data_display

	for iter_3_0, iter_3_1 in pairs(var_3_1.all) do
		if not table.contains(var_3_0, iter_3_1) then
			local var_3_2 = var_3_1[iter_3_1]
			local var_3_3 = var_3_2.extra_service

			if var_3_2.akashi_pick == 1 and (var_3_3 == Goods.ITEM_BOX or var_3_3 == Goods.PASS_ITEM) then
				local var_3_4 = Goods.Create({
					shop_id = iter_3_1
				}, Goods.TYPE_CHARGE)

				if arg_3_0:filterLimitTypeGoods(var_3_4) then
					local var_3_5 = var_3_2.package_sort_id

					if not table.contains(arg_3_0.packageSortList, var_3_5) then
						table.insert(arg_3_0.packageSortList, var_3_5)
					end

					table.insert(arg_3_0.giftGoodsVOList, var_3_4)
				end
			end
		end
	end

	for iter_3_2, iter_3_3 in pairs(pg.shop_template.get_id_list_by_genre.gift_package) do
		local var_3_6 = pg.shop_template[iter_3_3]

		if var_3_6.akashi_pick == 1 and not table.contains(var_3_0, iter_3_3) then
			local var_3_7 = Goods.Create({
				shop_id = iter_3_3
			}, Goods.TYPE_GIFT_PACKAGE)
			local var_3_8 = var_3_6.package_sort_id

			if not table.contains(arg_3_0.packageSortList, var_3_8) then
				table.insert(arg_3_0.packageSortList, var_3_8)
			end

			table.insert(arg_3_0.giftGoodsVOList, var_3_7)
		end
	end
end

return var_0_0
