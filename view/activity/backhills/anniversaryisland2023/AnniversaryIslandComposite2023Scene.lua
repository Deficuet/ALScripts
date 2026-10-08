local var_0_0 = class("AnniversaryIslandComposite2023Scene", import("view.base.BaseUI"))

var_0_0.FilterAll = bit.bor(1, 2)

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.loader = AutoLoader.New()
end

function var_0_0.getUIName(arg_2_0)
	return "AnniversaryIslandComposite2023UI"
end

local var_0_1 = "ui/AnniversaryIslandComposite2023UI_atlas"
local var_0_2 = "ui/AtelierCommonUI_atlas"

function var_0_0.getResource(arg_3_0)
	local var_3_0 = var_0_0.super.getResource(arg_3_0)

	table.insert(var_3_0, var_0_1)
	table.insert(var_3_0, var_0_2)

	return var_3_0
end

function var_0_0.preload(arg_4_0, arg_4_1)
	table.ParallelIpairsAsync({
		var_0_1,
		var_0_2
	}, function(arg_5_0, arg_5_1, arg_5_2)
		arg_4_0.loader:LoadBundle(arg_5_1, arg_5_2)
	end, arg_4_1)
end

function var_0_0.init(arg_6_0)
	arg_6_0.layerFormulaList = arg_6_0._tf:Find("Panel/FormulaList")
	arg_6_0.layerFormulaDetail = arg_6_0._tf:Find("Panel/FormulaDetail")
	arg_6_0.top = arg_6_0._tf:Find("Top")
	arg_6_0.formulaRect = arg_6_0.layerFormulaList:Find("ScrollView"):GetComponent("LScrollRect")

	local var_6_0 = arg_6_0.layerFormulaList:Find("Item")

	setActive(var_6_0, false)

	function arg_6_0.formulaRect.onUpdateItem(arg_7_0, arg_7_1)
		arg_6_0:UpdateFormulaListItem(arg_7_0 + 1, arg_7_1)
	end

	arg_6_0.formulaFilterButtons = _.map({
		1,
		2
	}, function(arg_8_0)
		return arg_6_0.layerFormulaList:Find("Tabs"):GetChild(arg_8_0 - 1)
	end)
	arg_6_0.lastEnv = nil
	arg_6_0.env = {}
	arg_6_0.listeners = {}

	setText(arg_6_0.layerFormulaList:Find("Empty"), i18n("workbench_tips5"))
	setText(arg_6_0.layerFormulaList:Find("Tabs/Furniture/UnSelected/Text"), i18n("word_furniture"))
	setText(arg_6_0.layerFormulaList:Find("Tabs/Furniture/Selected/Text"), i18n("word_furniture"))
	setText(arg_6_0.layerFormulaList:Find("Tabs/Item/UnSelected/Text"), i18n("workbench_tips7"))
	setText(arg_6_0.layerFormulaList:Find("Tabs/Item/Selected/Text"), i18n("workbench_tips7"))
	setText(arg_6_0.layerFormulaList:Find("Filter/Text"), i18n("workbench_tips10"))
	setText(arg_6_0.layerFormulaDetail:Find("Counters/Text"), i18n("workbench_tips8"))
	setText(arg_6_0.layerFormulaDetail:Find("MaterialsBG/MaterialsTitle"), i18n("workbench_tips9"))
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0.contextData.filterType = arg_9_0.contextData.filterType or var_0_0.FilterAll

	table.Foreach(arg_9_0.formulaFilterButtons, function(arg_10_0, arg_10_1)
		onButton(arg_9_0, arg_10_1, function()
			local var_11_0 = bit.lshift(1, arg_10_0 - 1)

			if arg_9_0.contextData.filterType == var_0_0.FilterAll then
				arg_9_0.contextData.filterType = var_11_0
			elseif arg_9_0.contextData.filterType == var_11_0 then
				arg_9_0.contextData.filterType = var_0_0.FilterAll
			else
				arg_9_0.contextData.filterType = var_11_0
			end

			arg_9_0:UpdateFilterButtons()
			arg_9_0:FilterFormulas()
			arg_9_0:UpdateView()
		end, SFX_PANEL)
	end)

	arg_9_0.showOnlyComposite = PlayerPrefs.GetInt("workbench_show_composite_avaliable", 0) == 1

	triggerToggle(arg_9_0.layerFormulaList:Find("Filter/Toggle"), arg_9_0.showOnlyComposite)
	onToggle(arg_9_0, arg_9_0.layerFormulaList:Find("Filter/Toggle"), function(arg_12_0)
		arg_9_0.showOnlyComposite = arg_12_0

		PlayerPrefs.SetInt("workbench_show_composite_avaliable", arg_12_0 and 1 or 0)
		PlayerPrefs.Save()
		arg_9_0:FilterFormulas()
		arg_9_0:UpdateView()
	end)
	onButton(arg_9_0, arg_9_0._tf:Find("BG"), function()
		arg_9_0:onBackPressed()
	end)
	onButton(arg_9_0, arg_9_0._tf:Find("Top/Back"), function()
		arg_9_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0._tf:Find("Top/Home"), function()
		arg_9_0:quickExitFunc()
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0._tf:Find("Top/Help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("workbench_help")
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0._tf:Find("Top/Upgrade"), function()
		arg_9_0:emit(AnniversaryIslandComposite2023Mediator.OPEN_UPGRADE_PANEL)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0._tf:Find("Top/StoreHouse"), function()
		arg_9_0:emit(AnniversaryIslandComposite2023Mediator.OPEN_STOREHOUSE)
	end, SFX_PANEL)
	arg_9_0:BindEnv({
		"filterFormulas",
		"formulas",
		"bagAct",
		"formulaId"
	}, function()
		arg_9_0:UpdateFormulaList()
	end)
	arg_9_0:BindEnv({
		"formulaId",
		"formulas",
		"bagAct"
	}, function(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_0[1]

		arg_9_0:UpdateFormulaDetail(var_20_0)
	end)
	arg_9_0:BindEnv({
		"BuildingLv"
	}, function(arg_21_0)
		local var_21_0 = arg_21_0[1]

		arg_9_0.loader:GetSpriteQuiet("ui/AnniversaryIslandComposite2023UI_atlas", "title_" .. var_21_0, arg_9_0.top:Find("Title/Number"))
	end)
	arg_9_0:BindEnv({
		"tip"
	}, function(arg_22_0)
		setActive(arg_9_0._tf:Find("Top/Upgrade/Tip"), arg_22_0[1])
	end)

	arg_9_0.env.formulaId = arg_9_0.contextData.formulaId

	arg_9_0:UpdateFilterButtons()
	arg_9_0:BuildActivityEnv()
	arg_9_0:UpdateView()
end

function var_0_0.InitCounter(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	arg_23_2[2] = math.max(arg_23_2[1], arg_23_2[2])

	local var_23_0 = arg_23_1
	local var_23_1 = arg_23_0.layerFormulaDetail:Find("Counters")

	assert(var_23_1)

	local function var_23_2()
		local var_24_0 = var_23_0

		if var_23_0 == 0 then
			var_24_0 = setColorStr(var_24_0, "#f9c461")
		end

		setText(var_23_1:Find("Number"), var_24_0)
		arg_23_3(var_23_0)
	end

	var_23_2()
	pressPersistTrigger(var_23_1:Find("Plus"), 0.5, function(arg_25_0)
		local var_25_0 = var_23_0

		var_23_0 = var_23_0 + 1
		var_23_0 = math.clamp(var_23_0, arg_23_2[1], arg_23_2[2])

		if var_25_0 == var_23_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("workbench_tips3"))
			arg_25_0()

			return
		end

		var_23_2()
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(var_23_1:Find("Minus"), 0.5, function(arg_26_0)
		local var_26_0 = var_23_0

		var_23_0 = var_23_0 - 1
		var_23_0 = math.clamp(var_23_0, arg_23_2[1], arg_23_2[2])

		if var_26_0 == var_23_0 then
			arg_26_0()

			return
		end

		var_23_2()
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(arg_23_0, var_23_1:Find("Plus10"), function()
		local var_27_0 = var_23_0

		var_23_0 = var_23_0 + 10
		var_23_0 = math.clamp(var_23_0, arg_23_2[1], arg_23_2[2])

		if var_27_0 == var_23_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("workbench_tips3"))

			return
		end

		var_23_2()
	end)
	onButton(arg_23_0, var_23_1:Find("Minus10"), function()
		var_23_0 = var_23_0 - 10
		var_23_0 = math.clamp(var_23_0, arg_23_2[1], arg_23_2[2])

		var_23_2()
	end)
	onButton(arg_23_0, arg_23_0.layerFormulaDetail:Find("Composite"), function()
		existCall(arg_23_4, var_23_0)
	end, SFX_PANEL)
end

local var_0_3 = {
	[DROP_TYPE_FURNITURE] = "word_furniture",
	[DROP_TYPE_WORKBENCH_DROP] = "workbench_tips7"
}

function var_0_0.UpdateFormulaListItem(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = tf(arg_30_2)
	local var_30_1 = arg_30_0.env.filterFormulas[arg_30_1]
	local var_30_2 = var_30_1:GetProduction()
	local var_30_3 = var_30_0:Find("BG/Icon")

	assert(var_30_3)
	arg_30_0:UpdateActivityDrop(var_30_3, {
		type = var_30_2[1],
		id = var_30_2[2]
	}, true)

	local var_30_4 = var_0_3[var_30_2[1]]
	local var_30_5 = not var_30_1:IsUnlock()

	setActive(var_30_0:Find("Lock"), var_30_5)
	setActive(var_30_0:Find("BG"), not var_30_5)

	if var_30_5 then
		setText(var_30_0:Find("Lock/Text"), var_30_1:GetLockDesc())
	end

	setText(var_30_0:Find("BG/Type"), i18n(var_30_4))
	setScrollText(var_30_0:Find("BG/Name/Text"), var_30_1:GetName())
	setActive(var_30_0:Find("Selected"), var_30_1:GetConfigID() == arg_30_0.env.formulaId)

	local var_30_6 = var_30_1:IsAvaliable()

	setActive(var_30_0:Find("Completed"), not var_30_6)

	local var_30_7

	if var_30_1:GetMaxLimit() > 0 then
		local var_30_8 = var_30_1:GetMaxLimit() - var_30_1:GetUsedCount()

		var_30_7 = (var_30_8 <= 0 and setColorStr(var_30_8, "#bb6754") or var_30_8) .. "/" .. var_30_1:GetMaxLimit()
	else
		var_30_7 = "∞"
	end

	setText(var_30_0:Find("BG/Count"), var_30_7)
	onButton(arg_30_0, var_30_0, function()
		if not var_30_6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("workbench_tips1"))

			return
		end

		if var_30_5 then
			local var_31_0 = var_30_1:GetLockLimit()

			pg.TipsMgr.GetInstance():ShowTips(i18n("workbench_tips4", var_31_0 and var_31_0[3]))

			return
		end

		arg_30_0.env.formulaId = var_30_1:GetConfigID()

		arg_30_0:UpdateView()
	end, SFX_PANEL)
end

function var_0_0.UpdateFilterButtons(arg_32_0)
	table.Foreach(arg_32_0.formulaFilterButtons, function(arg_33_0, arg_33_1)
		local var_33_0 = arg_32_0.contextData.filterType ~= var_0_0.FilterAll

		var_33_0 = var_33_0 and bit.band(arg_32_0.contextData.filterType, bit.lshift(1, arg_33_0 - 1)) > 0

		setActive(arg_33_1:Find("Selected"), var_33_0)
		setActive(arg_33_1:Find("UnSelected"), not var_33_0)
	end)
end

function var_0_0.BuildActivityEnv(arg_34_0)
	arg_34_0.env.formulas = _.map(pg.activity_workbench_recipe.all, function(arg_35_0)
		local var_35_0 = WorkBenchFormula.New({
			configId = arg_35_0
		})

		var_35_0:BuildFromActivity()

		return var_35_0
	end)

	if arg_34_0.env.formulaId then
		local var_34_0 = _.detect(arg_34_0.env.formulas, function(arg_36_0)
			return arg_36_0:GetConfigID() == arg_34_0.env.formulaId
		end)

		if not var_34_0 or not var_34_0:IsAvaliable() then
			arg_34_0.env.formulaId = nil
		end
	end

	local var_34_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	arg_34_0.env.bagAct = var_34_1

	local var_34_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2)

	arg_34_0.env.BuildingLv = var_34_2:GetBuildingLevel(table.keyof(AnniversaryIsland2023Scene.Buildings, "craft"))
	arg_34_0.env.tip = AnniversaryIsland2023Scene.UpdateBuildingTip(nil, var_34_2, table.keyof(AnniversaryIsland2023Scene.Buildings, "craft"))

	arg_34_0:FilterFormulas()
end

function var_0_0.FilterFormulas(arg_37_0)
	local var_37_0 = {}
	local var_37_1 = arg_37_0.contextData.filterType

	local function var_37_2(arg_38_0)
		if var_37_1 == var_0_0.FilterAll then
			return true
		end

		return switch(arg_38_0:GetProduction()[1], {
			[DROP_TYPE_WORKBENCH_DROP] = function()
				return bit.band(var_37_1, 1) > 0
			end
		}, function()
			return bit.band(var_37_1, 2) > 0
		end)
	end

	for iter_37_0, iter_37_1 in ipairs(_.values(arg_37_0.env.formulas)) do
		if var_37_2(iter_37_1) and (not arg_37_0.showOnlyComposite or iter_37_1:IsUnlock() and iter_37_1:IsAvaliable() and _.all(iter_37_1:GetMaterials(), function(arg_41_0)
			local var_41_0 = arg_41_0[1]
			local var_41_1 = arg_41_0[2]

			return arg_41_0[3] <= arg_37_0.env.bagAct:getVitemNumber(var_41_1)
		end)) then
			table.insert(var_37_0, iter_37_1)
		end
	end

	local var_37_3 = CompareFuncs({
		function(arg_42_0)
			return arg_42_0:IsAvaliable() and 0 or 1
		end,
		function(arg_43_0)
			return arg_43_0:IsUnlock() and 0 or 1
		end,
		function(arg_44_0)
			return arg_44_0:GetConfigID()
		end
	})

	table.sort(var_37_0, var_37_3)

	arg_37_0.env.filterFormulas = var_37_0
end

function var_0_0.UpdateFormulaList(arg_45_0)
	local var_45_0 = #arg_45_0.env.filterFormulas == 0

	setActive(arg_45_0.layerFormulaList:Find("Empty"), var_45_0)
	setActive(arg_45_0.layerFormulaList:Find("ScrollView"), not var_45_0)
	arg_45_0.formulaRect:SetTotalCount(#arg_45_0.env.filterFormulas)
end

function var_0_0.UpdateFormulaDetail(arg_46_0, arg_46_1)
	arg_46_0.contextData.formulaId = arg_46_1

	setActive(arg_46_0.layerFormulaDetail, arg_46_1)

	if not arg_46_1 then
		return
	end

	local var_46_0 = _.detect(arg_46_0.env.formulas, function(arg_47_0)
		return arg_47_0:GetConfigID() == arg_46_1
	end)

	assert(var_46_0)

	local var_46_1 = var_46_0:GetProduction()
	local var_46_2 = var_46_0:GetMaterials()
	local var_46_3 = 100

	;(function()
		local var_48_0 = {
			type = var_46_1[1],
			id = var_46_1[2],
			count = var_46_1[3]
		}
		local var_48_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORKBENCH)
		local var_48_2 = var_46_0:GetMaxLimit()

		if var_48_2 > 0 then
			var_46_3 = var_48_2 - var_48_1:GetFormulaUseCount(arg_46_1)
		end

		local var_48_3 = arg_46_0.layerFormulaDetail:Find("Icon")

		assert(var_48_3)
		arg_46_0:UpdateActivityDrop(var_48_3, var_48_0)
		onButton(arg_46_0, var_48_3, function()
			if var_48_0.type == DROP_TYPE_WORKBENCH_DROP then
				arg_46_0:emit(WorkBenchItemDetailMediator.SHOW_DETAIL, WorkBenchItem.New({
					configId = var_48_0.id,
					count = var_48_0.count
				}))
			else
				arg_46_0:emit(BaseUI.ON_DROP, var_48_0)
			end
		end)
		setText(arg_46_0.layerFormulaDetail:Find("Name"), var_48_0:getConfig("name"))
	end)()

	local var_46_4 = var_46_3
	local var_46_5 = arg_46_0.env.bagAct

	UIItemList.StaticAlign(arg_46_0.layerFormulaDetail:Find("Materials"), arg_46_0.layerFormulaDetail:Find("Materials/Item"), #var_46_2, function(arg_50_0, arg_50_1, arg_50_2)
		if arg_50_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_50_0 = var_46_2[arg_50_1 + 1]
		local var_50_1 = {
			type = var_50_0[1],
			id = var_50_0[2],
			count = var_50_0[3]
		}

		arg_46_0:UpdateActivityDrop(arg_50_2:Find("Icon"), var_50_1)
		onButton(arg_46_0, arg_50_2:Find("Icon"), function()
			if var_50_1.type == DROP_TYPE_WORKBENCH_DROP then
				arg_46_0:emit(WorkBenchItemDetailMediator.SHOW_DETAIL, WorkBenchItem.New({
					configId = var_50_1.id,
					count = var_50_1.count
				}))
			else
				arg_46_0:emit(BaseUI.ON_DROP, var_50_1)
			end
		end)

		local var_50_2 = var_50_0[2]
		local var_50_3 = var_50_0[3]
		local var_50_4 = var_46_5:getVitemNumber(var_50_2)

		if var_50_3 > 0 then
			var_46_4 = math.min(var_46_4, math.floor(var_50_4 / var_50_3))
		end
	end)

	local function var_46_6(arg_52_0)
		UIItemList.StaticAlign(arg_46_0.layerFormulaDetail:Find("Materials"), arg_46_0.layerFormulaDetail:Find("Materials/Item"), #var_46_2, function(arg_53_0, arg_53_1, arg_53_2)
			if arg_53_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_53_0 = var_46_2[arg_53_1 + 1]
			local var_53_1 = var_53_0[2]
			local var_53_2 = var_53_0[3]
			local var_53_3 = var_46_5:getVitemNumber(var_53_1)

			arg_52_0 = math.max(arg_52_0, 1)

			local var_53_4 = var_53_2 * arg_52_0
			local var_53_5 = setColorStr(var_53_3, var_53_3 < var_53_4 and "#bb6754" or "#6b5a48")

			setText(arg_53_2:Find("Text"), var_53_5 .. "/" .. var_53_4)
		end)
	end

	local var_46_7 = math.min(1, var_46_4)

	arg_46_0:InitCounter(var_46_7, {
		0,
		var_46_4
	}, var_46_6, function(arg_54_0)
		arg_46_0:emit(GAME.WORKBENCH_COMPOSITE, arg_46_1, arg_54_0)
	end)
	var_46_6(var_46_7)
end

function var_0_0.BindEnv(arg_55_0, arg_55_1, arg_55_2)
	table.insert(arg_55_0.listeners, {
		keys = arg_55_1,
		func = arg_55_2
	})
end

function var_0_0.RefreshData(arg_56_0)
	arg_56_0.lastEnv = arg_56_0.lastEnv or {}

	local var_56_0 = {}
	local var_56_1

	local function var_56_2(arg_57_0, arg_57_1)
		if var_56_0[arg_57_0] then
			return
		end

		var_56_0[arg_57_0] = arg_57_1
		var_56_1 = var_56_1 or {}

		local var_57_0 = _.select(arg_56_0.listeners, function(arg_58_0)
			return table.contains(arg_58_0.keys, arg_57_0)
		end)

		_.each(var_57_0, function(arg_59_0)
			var_56_1[arg_59_0] = true
		end)
	end

	for iter_56_0, iter_56_1 in pairs(arg_56_0.env) do
		if iter_56_1 ~= arg_56_0.lastEnv[iter_56_0] then
			var_56_2(iter_56_0, iter_56_1)
		end
	end

	for iter_56_2, iter_56_3 in pairs(arg_56_0.lastEnv) do
		local var_56_3 = arg_56_0.env[iter_56_2]

		if iter_56_3 ~= var_56_3 then
			var_56_2(iter_56_2, var_56_3)
		end
	end

	if var_56_1 then
		table.Foreach(var_56_1, function(arg_60_0)
			local var_60_0 = table.map(arg_60_0.keys, function(arg_61_0)
				return arg_56_0.env[arg_61_0]
			end)
			local var_60_1 = table.map(arg_60_0.keys, function(arg_62_0)
				return arg_56_0.lastEnv[arg_62_0]
			end)

			arg_60_0.func(var_60_0, var_60_1)
		end)
	end

	arg_56_0.lastEnv = table.shallowCopy(arg_56_0.env)
end

function var_0_0.UpdateView(arg_63_0)
	arg_63_0:RefreshData()
	AnniversaryIsland2023Scene.PlayStory()
end

function var_0_0.OnReceiveFormualRequest(arg_64_0, arg_64_1)
	arg_64_0.env.formulaId = arg_64_1

	arg_64_0:UpdateView()
end

function var_0_0.UpdateActivityDrop(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	updateDrop(arg_65_1, arg_65_2)
	SetCompomentEnabled(arg_65_1:Find("icon_bg"), typeof(Image), false)
	setActive(arg_65_1:Find("bg"), false)
	setActive(arg_65_1:Find("icon_bg/frame"), false)
	setActive(arg_65_1:Find("icon_bg/stars"), false)

	local var_65_0 = arg_65_2:getConfig("rarity")

	if arg_65_2.type == DROP_TYPE_EQUIP or arg_65_2.type == DROP_TYPE_EQUIPMENT_SKIN then
		var_65_0 = var_65_0 - 1
	end

	local var_65_1 = "icon_frame_" .. var_65_0

	if arg_65_3 then
		var_65_1 = var_65_1 .. "_small"
	end

	arg_65_0.loader:GetSpriteQuiet(var_0_2, var_65_1, arg_65_1)
end

function var_0_0.willExit(arg_66_0)
	arg_66_0.loader:Clear()
end

return var_0_0
