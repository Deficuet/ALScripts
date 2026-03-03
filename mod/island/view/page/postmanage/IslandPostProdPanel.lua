local var_0_0 = class("IslandPostProdPanel", import("view.base.BaseSubView"))

var_0_0.ScrollValue = 0

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

	local var_6_0 = arg_6_0.scrollRect.onValueChanged

	var_6_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_6_0, var_6_0)
	var_6_0:AddListener(function(arg_7_0)
		var_0_0.ScrollValue = arg_7_0.y
	end)
end

function var_0_0.OnInitItem(arg_8_0, arg_8_1)
	local var_8_0 = IslandPostPlaceCard.New(arg_8_1)

	arg_8_0.cards[arg_8_1] = var_8_0
end

function var_0_0.OnUpdateItem(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.cards[arg_9_2]

	if not var_9_0 then
		arg_9_0:OnInitItem(arg_9_1, arg_9_2)

		var_9_0 = arg_9_0.cards[arg_9_2]
	end

	local var_9_1 = arg_9_0.placeIds[arg_9_1 + 1]

	if var_9_1 then
		var_9_0:Update(var_9_1, function(arg_10_0)
			arg_9_0:OpenSelectPanel(arg_10_0)
		end)
	end
end

function var_0_0.Show(arg_11_0)
	arg_11_0.super.Show(arg_11_0)

	if arg_11_0.flushAll then
		arg_11_0:Flush()
	end

	arg_11_0.flushAll = false

	arg_11_0.scrollRect:ScrollTo(var_0_0.ScrollValue)
end

function var_0_0.Flush(arg_12_0)
	arg_12_0.buildingAgency = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	arg_12_0.buildings = arg_12_0.buildingAgency:GetBuildings()

	arg_12_0.scrollRect:SetTotalCount(#arg_12_0.placeIds, -1)

	if arg_12_0.selectPanel:isShowing() then
		arg_12_0.selectPanel:ExecuteAction("Flush")
	end
end

function var_0_0.FlushSlot(arg_13_0, arg_13_1)
	local var_13_0 = pg.island_production_slot[arg_13_1].place

	for iter_13_0, iter_13_1 in pairs(arg_13_0.cards) do
		if iter_13_1.id == var_13_0 then
			iter_13_1:UpdateSlot(arg_13_1)
		end
	end

	if arg_13_0.selectPanel:isShowing() then
		arg_13_0.selectPanel:ExecuteAction("Flush")
	end
end

function var_0_0.OpenSelectPanel(arg_14_0, arg_14_1)
	arg_14_0.selectPanel:ExecuteAction("Show", arg_14_1)
end

function var_0_0.Hide(arg_15_0)
	arg_15_0.super.Hide(arg_15_0)
	arg_15_0.selectPanel:ExecuteAction("Hide")
end

function var_0_0.OnDestroy(arg_16_0)
	ClearLScrollrect(arg_16_0.scrollRect)

	if arg_16_0.selectPanel then
		arg_16_0.selectPanel:Destroy()

		arg_16_0.selectPanel = nil
	end

	for iter_16_0, iter_16_1 in pairs(arg_16_0.cards) do
		iter_16_1:Dispose()
	end

	arg_16_0.cards = {}
end

return var_0_0
