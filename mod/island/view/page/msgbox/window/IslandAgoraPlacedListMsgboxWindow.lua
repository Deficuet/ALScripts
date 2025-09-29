local var_0_0 = class("IslandAgoraPlacedListMsgboxWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandAgoraPlacedInfoMsgBox"
end

local function var_0_1(arg_2_0)
	local var_2_0 = {
		go = arg_2_0
	}
	local var_2_1 = arg_2_0.transform:Find("icon"):GetComponent(typeof(Image))
	local var_2_2 = arg_2_0.transform:Find("name"):GetComponent(typeof(Text))
	local var_2_3 = arg_2_0.transform:Find("count"):GetComponent(typeof(Text))
	local var_2_4 = arg_2_0.transform:Find("capacity"):GetComponent(typeof(Text))

	function var_2_0.Update(arg_3_0)
		var_2_2.text = arg_3_0.name
		var_2_3.text = "X" .. arg_3_0.count
		var_2_4.text = arg_3_0.capacity

		LoadSpriteAsync("island/IslandFurnitureIcon/" .. arg_3_0.icon, function(arg_4_0)
			var_2_1.sprite = arg_4_0
		end)
	end

	return var_2_0
end

function var_0_0.OnLoaded(arg_5_0)
	var_0_0.super.OnLoaded(arg_5_0)
	setText(arg_5_0:findTF("list/titles/1"), i18n("island_label_furniture"))
	setText(arg_5_0:findTF("list/titles/2"), i18n("island_label_furniture_cnt"))
	setText(arg_5_0:findTF("list/titles/3"), i18n("island_label_furniture_capacity"))

	arg_5_0.capacityTxt = arg_5_0:findTF("capacity"):GetComponent(typeof(Text))
	arg_5_0.scrollRect = arg_5_0._tf:Find("list/scrollrect"):GetComponent("LScrollRect")

	function arg_5_0.scrollRect.onInitItem(arg_6_0)
		arg_5_0:OnInitItem(arg_6_0)
	end

	function arg_5_0.scrollRect.onUpdateItem(arg_7_0, arg_7_1)
		arg_5_0:OnUpdateItem(arg_7_0, arg_7_1)
	end

	arg_5_0.cards = {}
end

function var_0_0.FlushBtn(arg_8_0, arg_8_1)
	return
end

function var_0_0.OnShow(arg_9_0)
	arg_9_0.settings.content = i18n("island_label_furniture_tip")

	var_0_0.super.OnShow(arg_9_0)

	local var_9_0 = arg_9_0.settings.list
	local var_9_1 = arg_9_0.settings.totalCnt

	arg_9_0:UpdateCapacity(var_9_0, var_9_1)
	arg_9_0:UpdateList(var_9_0)
end

function var_0_0.UpdateCapacity(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = 0

	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		var_10_0 = var_10_0 + iter_10_1.capacity
	end

	arg_10_0.capacityTxt.text = i18n("island_label_furniture_capacity_display") .. var_10_0 .. "/" .. arg_10_2
end

function var_0_0.OnInitItem(arg_11_0, arg_11_1)
	local var_11_0 = var_0_1(arg_11_1)

	arg_11_0.cards[arg_11_1] = var_11_0
end

function var_0_0.OnUpdateItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.cards[arg_12_2]

	if not var_12_0 then
		arg_12_0:OnInitItem(arg_12_2)

		var_12_0 = arg_12_0.cards[arg_12_2]
	end

	local var_12_1 = arg_12_0.settings.list[arg_12_1 + 1]

	var_12_0.Update(var_12_1)
end

function var_0_0.UpdateList(arg_13_0, arg_13_1)
	arg_13_0.scrollRect:SetTotalCount(#arg_13_1)
end

function var_0_0.OnDestroy(arg_14_0)
	var_0_0.super.OnDestroy(arg_14_0)
	ClearLScrollrect(arg_14_0.scrollRect)
end

return var_0_0
