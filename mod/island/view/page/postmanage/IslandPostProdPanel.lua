local var_0_0 = class("IslandPostProdPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandPostProdPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	setActive(arg_2_0._tf:Find("tpl"), false)

	arg_2_0.scrollRect = arg_2_0._tf:Find("view"):GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	arg_2_0.selectPanel = IslandDelegationSelectPanel.New(arg_2_0._tf, arg_2_0.event, setmetatable({
		isPost = true,
		ShowMsgBox = function(arg_5_0, arg_5_1)
			arg_2_0.contextData:ShowMsgBox(arg_5_1)
		end
	}, {
		__index = arg_2_0.contextData
	}))
end

function var_0_0.OnInit(arg_6_0)
	arg_6_0.placeIds = pg.island_set.post_manage_produce.key_value_varchar
	arg_6_0.cards = {}
	arg_6_0.flushAll = true
end

function var_0_0.OnInitItem(arg_7_0, arg_7_1)
	local var_7_0 = IslandPostPlaceCard.New(arg_7_1)

	arg_7_0.cards[arg_7_1] = var_7_0
end

function var_0_0.OnUpdateItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.cards[arg_8_2]

	if not var_8_0 then
		arg_8_0:OnInitItem(arg_8_1, arg_8_2)

		var_8_0 = arg_8_0.cards[arg_8_2]
	end

	local var_8_1 = arg_8_0.placeIds[arg_8_1 + 1]

	if var_8_1 then
		var_8_0:Update(var_8_1, function(arg_9_0)
			arg_8_0:OpenSelectPanel(arg_9_0)
		end)
	end
end

function var_0_0.Show(arg_10_0)
	arg_10_0.super.Show(arg_10_0)

	if arg_10_0.flushAll then
		arg_10_0:Flush()
	end

	arg_10_0.flushAll = false
end

function var_0_0.Flush(arg_11_0)
	arg_11_0.buildingAgency = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	arg_11_0.buildings = arg_11_0.buildingAgency:GetBuildings()

	arg_11_0.scrollRect:SetTotalCount(#arg_11_0.placeIds, -1)

	if arg_11_0.selectPanel:isShowing() then
		arg_11_0.selectPanel:ExecuteAction("Flush")
	end
end

function var_0_0.FlushSlot(arg_12_0, arg_12_1)
	local var_12_0 = pg.island_production_slot[arg_12_1].place

	for iter_12_0, iter_12_1 in pairs(arg_12_0.cards) do
		if iter_12_1.id == var_12_0 then
			iter_12_1:UpdateSlot(arg_12_1)
		end
	end

	if arg_12_0.selectPanel:isShowing() then
		arg_12_0.selectPanel:ExecuteAction("Flush")
	end
end

function var_0_0.OpenSelectPanel(arg_13_0, arg_13_1)
	arg_13_0.selectPanel:ExecuteAction("Show", arg_13_1)
end

function var_0_0.Hide(arg_14_0)
	arg_14_0.super.Hide(arg_14_0)
	arg_14_0.selectPanel:ExecuteAction("Hide")
end

function var_0_0.OnDestroy(arg_15_0)
	ClearLScrollrect(arg_15_0.scrollRect)

	if arg_15_0.selectPanel then
		arg_15_0.selectPanel:Destroy()

		arg_15_0.selectPanel = nil
	end

	for iter_15_0, iter_15_1 in pairs(arg_15_0.cards) do
		iter_15_1:Dispose()
	end

	arg_15_0.cards = {}
end

return var_0_0
