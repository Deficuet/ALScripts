local var_0_0 = class("IslandTechCentrePanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechCentrePanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.viewTF = arg_2_0._tf:Find("view")
	arg_2_0.scrollRect = arg_2_0.viewTF:GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0:InifConfigData()

	arg_5_0.cards = {}
end

function var_0_0.InifConfigData(arg_6_0)
	arg_6_0.config = pg.island_technology_template
	arg_6_0.level2Ids = {}
	arg_6_0.levels = {}
	arg_6_0.allIds = arg_6_0.config.get_id_list_by_tech_belong[IslandTechBelong.CENTRE]

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.allIds) do
		local var_6_0 = arg_6_0.config[iter_6_1].island_level

		if not arg_6_0.level2Ids[var_6_0] then
			arg_6_0.level2Ids[var_6_0] = {}

			table.insert(arg_6_0.levels, var_6_0)
		end

		table.insert(arg_6_0.level2Ids[var_6_0], iter_6_1)
	end

	for iter_6_2, iter_6_3 in pairs(arg_6_0.level2Ids) do
		table.sort(iter_6_3, CompareFuncs({
			function(arg_7_0)
				return arg_6_0.config[arg_7_0].axis[2]
			end,
			function(arg_8_0)
				return arg_8_0
			end
		}))
	end

	table.sort(arg_6_0.levels)

	arg_6_0.level2UIList = {}
end

function var_0_0.OnInitItem(arg_9_0, arg_9_1)
	local var_9_0 = IslandTechCentreCard.New(arg_9_1)

	arg_9_0.cards[arg_9_1] = var_9_0
end

function var_0_0.OnUpdateItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.cards[arg_10_2]

	if not var_10_0 then
		arg_10_0:OnInitItem(arg_10_1, arg_10_2)

		var_10_0 = arg_10_0.cards[arg_10_2]
	end

	local var_10_1 = arg_10_1 + 1
	local var_10_2 = arg_10_0.levels[var_10_1]
	local var_10_3 = arg_10_0.level2Ids[var_10_2]
	local var_10_4 = arg_10_0.levels[arg_10_1]
	local var_10_5 = var_10_4 and arg_10_0.level2Ids[var_10_4] or {}
	local var_10_6 = var_10_2 > arg_10_0.islandLevel or arg_10_0:IsAnyUnFinish(var_10_5)
	local var_10_7 = var_10_1 == #arg_10_0.levels

	var_10_0:Update(var_10_2, var_10_3, var_10_7, var_10_6, arg_10_0.contextData.onItemClick)
end

function var_0_0.IsAnyUnFinish(arg_11_0, arg_11_1)
	return underscore.any(arg_11_1, function(arg_12_0)
		return not arg_11_0.techAgency:IsFinishedTech(arg_12_0)
	end)
end

function var_0_0.Show(arg_13_0)
	arg_13_0.super.Show(arg_13_0)
	arg_13_0:Flush()
	arg_13_0:AutoFocus()
end

function var_0_0.Flush(arg_14_0)
	local var_14_0 = getProxy(IslandProxy):GetIsland()

	arg_14_0.islandLevel = var_14_0:GetLevel()
	arg_14_0.techAgency = var_14_0:GetTechnologyAgency()

	arg_14_0.scrollRect:SetTotalCount(#arg_14_0.levels, -1)
end

function var_0_0.AutoFocus(arg_15_0)
	local var_15_0 = arg_15_0:GetFocusTechId()
	local var_15_1 = arg_15_0.config[var_15_0].island_level
	local var_15_2 = table.indexof(arg_15_0.levels, var_15_1)

	arg_15_0.scrollRect:ScrollTo(math.max(var_15_2 - 4, 0) / (#arg_15_0.levels - 7))
end

function var_0_0.GetFocusTechId(arg_16_0)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.allIds) do
		local var_16_1 = arg_16_0.techAgency:GetTechnology(iter_16_1):GetStatus()

		if not var_16_0[var_16_1] then
			var_16_0[var_16_1] = {}
		end

		table.insert(var_16_0[var_16_1], iter_16_1)
	end

	for iter_16_2, iter_16_3 in ipairs(IslandTechTreePanel.FocusPriorities) do
		local var_16_2 = var_16_0[iter_16_3]

		if var_16_2 and #var_16_2 > 0 then
			table.sort(var_16_2, CompareFuncs({
				function(arg_17_0)
					return arg_16_0.config[arg_17_0].island_level
				end,
				function(arg_18_0)
					return arg_18_0
				end
			}))

			return var_16_2[1]
		end
	end

	return arg_16_0.allIds[1]
end

function var_0_0.OnDestroy(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.cards) do
		iter_19_1:Dispose()
	end

	arg_19_0.cards = {}
end

return var_0_0
