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

	arg_2_0.selectPanel = IslandDelegationSelectPanel.New(arg_2_0._tf, arg_2_0.event, {
		isPost = true
	})
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0.placeIds = pg.island_set.post_manage_produce.key_value_varchar
	arg_5_0.cards = {}
	arg_5_0.flushAll = true
end

function var_0_0.OnInitItem(arg_6_0, arg_6_1)
	local var_6_0 = IslandPostPlaceCard.New(arg_6_1)

	arg_6_0.cards[arg_6_1] = var_6_0
end

function var_0_0.OnUpdateItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.cards[arg_7_2]

	if not var_7_0 then
		arg_7_0:OnInitItem(arg_7_1, arg_7_2)

		var_7_0 = arg_7_0.cards[arg_7_2]
	end

	local var_7_1 = arg_7_0.placeIds[arg_7_1 + 1]

	if var_7_1 then
		var_7_0:Update(var_7_1, function(arg_8_0)
			arg_7_0:OpenSelectPanel(arg_8_0)
		end)
	end
end

function var_0_0.Show(arg_9_0)
	arg_9_0.super.Show(arg_9_0)

	if arg_9_0.flushAll then
		arg_9_0:Flush()
	end

	arg_9_0.flushAll = false
end

function var_0_0.Flush(arg_10_0)
	arg_10_0.buildingAgency = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	arg_10_0.buildings = arg_10_0.buildingAgency:GetBuildings()

	arg_10_0.scrollRect:SetTotalCount(#arg_10_0.placeIds, -1)

	if arg_10_0.selectPanel:isShowing() then
		arg_10_0.selectPanel:ExecuteAction("Flush")
	end
end

function var_0_0.FlushSlot(arg_11_0, arg_11_1)
	local var_11_0 = pg.island_production_slot[arg_11_1].place

	for iter_11_0, iter_11_1 in pairs(arg_11_0.cards) do
		if iter_11_1.id == var_11_0 then
			iter_11_1:UpdateSlot(arg_11_1)
		end
	end

	if arg_11_0.selectPanel:isShowing() then
		arg_11_0.selectPanel:ExecuteAction("Flush")
	end
end

function var_0_0.OpenSelectPanel(arg_12_0, arg_12_1)
	arg_12_0.selectPanel:ExecuteAction("Show", arg_12_1)
end

function var_0_0.Hide(arg_13_0)
	arg_13_0.super.Hide(arg_13_0)
	arg_13_0.selectPanel:ExecuteAction("Hide")
end

function var_0_0.OnDestroy(arg_14_0)
	if arg_14_0.selectPanel then
		arg_14_0.selectPanel:Destroy()

		arg_14_0.selectPanel = nil
	end

	for iter_14_0, iter_14_1 in pairs(arg_14_0.cards) do
		iter_14_1:Dispose()
	end

	arg_14_0.cards = {}
end

return var_0_0
