local var_0_0 = class("IslandRestaurantSettlePage4Event", import(".IslandRestaurantSettlePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandRestaurantSettle4EventUI"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.additionList = UIItemList.New(arg_2_0._tf:Find("window/event/addition"), arg_2_0._tf:Find("window/event/addition/tpl"))
	arg_2_0.priceAdd = arg_2_0._tf:Find("window/summary/price/info/addition/Text"):GetComponent(typeof(Text))

	setText(arg_2_0._tf:Find("window/event/Image/Text"), i18n("island_post_event_label"))
end

function var_0_0.OnShow(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:UpdateAddition(arg_3_1)
	arg_3_0:UpdatePriceAdd(arg_3_1)

	arg_3_0.itemList = arg_3_1.itemList or {}

	var_0_0.super.OnShow(arg_3_0, arg_3_1, arg_3_2)
end

function var_0_0.UpdateAddition(arg_4_0, arg_4_1)
	local var_4_0 = pg.island_manage_event[arg_4_1.spEventID]
	local var_4_1 = arg_4_0:WarpAdditionInfo(var_4_0)

	arg_4_0.additionList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			setText(arg_5_2:Find("Text"), var_4_1[arg_5_1 + 1][1])
			setText(arg_5_2:Find("value"), "+" .. var_4_1[arg_5_1 + 1][2] .. "%")
		end
	end)
	arg_4_0.additionList:align(#var_4_1)
end

function var_0_0.WarpAdditionInfo(arg_6_0, arg_6_1)
	local var_6_0 = {}

	table.insert(var_6_0, {
		i18n("island_addition_influence"),
		arg_6_1.influence_bonus
	})
	table.insert(var_6_0, {
		i18n("island_addition_sale"),
		arg_6_1.event_effect[1][1]
	})

	return var_6_0
end

function var_0_0.UpdatePriceAdd(arg_7_0, arg_7_1)
	arg_7_0.priceAdd.text = "(+" .. arg_7_1.priceAdd .. ")"
end

function var_0_0.UpdateCommonItem(arg_8_0, arg_8_1, arg_8_2)
	var_0_0.super.UpdateCommonItem(arg_8_0, arg_8_1, arg_8_2)
	setActive(arg_8_1:Find("event"), table.contains(arg_8_0.itemList, arg_8_2.id))
end

return var_0_0
