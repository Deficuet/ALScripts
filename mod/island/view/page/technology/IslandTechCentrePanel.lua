local var_0_0 = class("IslandTechCentrePanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechCentrePanel"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("view/content")

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.uiList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventInit then
			arg_3_0:InitVerticalItem(arg_4_1, arg_4_2)
		elseif arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateVerticalItem(arg_4_1, arg_4_2)
		end
	end)
	arg_3_0:InifConfigData()
end

function var_0_0.InifConfigData(arg_5_0)
	arg_5_0.config = pg.island_technology_template
	arg_5_0.level2Ids = {}
	arg_5_0.levels = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.config.get_id_list_by_tech_belong[IslandTechBelong.CENTRE]) do
		local var_5_0 = arg_5_0.config[iter_5_1].island_level

		if not arg_5_0.level2Ids[var_5_0] then
			arg_5_0.level2Ids[var_5_0] = {}

			table.insert(arg_5_0.levels, var_5_0)
		end

		table.insert(arg_5_0.level2Ids[var_5_0], iter_5_1)
	end

	table.sort(arg_5_0.levels)

	arg_5_0.level2UIList = {}
end

function var_0_0.InitVerticalItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.levels[arg_6_1 + 1]

	setText(arg_6_2:Find("level/lv"), "LV." .. var_6_0)
	setActive(arg_6_2:Find("line"), arg_6_1 + 1 ~= #arg_6_0.levels)

	local var_6_1 = arg_6_0.level2Ids[var_6_0]
	local var_6_2 = arg_6_2:Find("items_view/content")
	local var_6_3 = UIItemList.New(var_6_2, var_6_2:Find("tpl"))

	var_6_3:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventInit then
			arg_6_2.name = var_6_0

			arg_6_0:InitItem(arg_7_1, arg_7_2, var_6_0)
		elseif arg_7_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateItem(arg_7_1, arg_7_2, var_6_0)
		end
	end)

	arg_6_0.level2UIList[var_6_0] = var_6_3
end

function var_0_0.UpdateVerticalItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.levels[arg_8_1 + 1]
	local var_8_1 = arg_8_0.level2Ids[var_8_0]

	arg_8_0.level2UIList[var_8_0]:align(#var_8_1)

	local var_8_2 = arg_8_0.levels[arg_8_1]
	local var_8_3 = var_8_2 and arg_8_0.level2Ids[var_8_2] or {}

	setActive(arg_8_2:Find("lock"), var_8_0 > arg_8_0.islandLevel or arg_8_0:IsAnyUnFinish(var_8_3))
end

function var_0_0.IsAnyUnFinish(arg_9_0, arg_9_1)
	return underscore.any(arg_9_1, function(arg_10_0)
		return not arg_9_0.techAgency:IsFinishedTech(arg_10_0)
	end)
end

function var_0_0.InitItem(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = arg_11_0.level2Ids[arg_11_3]
	local var_11_1 = var_11_0[arg_11_1 + 1]

	arg_11_2.name = var_11_1

	local var_11_2 = arg_11_0.techAgency:GetTechnology(var_11_0[arg_11_1 + 1])

	setText(arg_11_2:Find("corner/Text"), arg_11_0.config[var_11_1].tech_level)
	LoadImageSpriteAsync("island/IslandTechnology/" .. arg_11_0.config[var_11_1].tech_icon, arg_11_2:Find("icon"), true)
	setActive(arg_11_2:Find("line"), arg_11_1 + 1 ~= #var_11_0)
end

function var_0_0.UpdateItem(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = arg_12_0.level2Ids[arg_12_3]
	local var_12_1 = var_12_0[arg_12_1 + 1]
	local var_12_2 = arg_12_0.techAgency:GetTechnology(var_12_0[arg_12_1 + 1])
	local var_12_3 = var_12_2:GetStatus()

	setActive(arg_12_2:Find("receive"), var_12_3 == IslandTechnology.STATUS.RECEIVE)
	setActive(arg_12_2:Find("studying"), var_12_3 == IslandTechnology.STATUS.STUDYING)

	local var_12_4 = var_12_3 == IslandTechnology.STATUS.STUDYING or var_12_3 == IslandTechnology.STATUS.NORMAL and var_12_2:GetFinishedCnt() == 0

	setImageAlpha(arg_12_2:Find("icon"), var_12_4 and 0.5 or 1)
	onButton(arg_12_0, arg_12_2, function()
		existCall(arg_12_0.contextData.onItemClick, var_12_2.id)
	end, SFX_PANEL)
end

function var_0_0.Show(arg_14_0)
	arg_14_0.super.Show(arg_14_0)
	arg_14_0:Flush()
end

function var_0_0.Flush(arg_15_0)
	local var_15_0 = getProxy(IslandProxy):GetIsland()

	arg_15_0.islandLevel = var_15_0:GetLevel()
	arg_15_0.techAgency = var_15_0:GetTechnologyAgency()

	arg_15_0.uiList:align(#arg_15_0.levels)
end

function var_0_0.OnDestroy(arg_16_0)
	return
end

return var_0_0
