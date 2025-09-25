local var_0_0 = class("IslandSetMealHandbookPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSetMealHandbookUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0._tf:Find("top/back")
	arg_2_0.setMealList = UIItemList.New(arg_2_0._tf:Find("setMealList/Viewport/Content"), arg_2_0._tf:Find("setMealList/Viewport/Content/setMealTpl"))
	arg_2_0.detail = arg_2_0._tf:Find("detail")
	arg_2_0.detailName = arg_2_0.detail:Find("name")
	arg_2_0.formulaList1 = arg_2_0.detail:Find("formulaList1")
	arg_2_0.formulaList2 = arg_2_0.detail:Find("formulaList2")
	arg_2_0.detailDesc = arg_2_0.detail:Find("desc")
	arg_2_0.conditionList = UIItemList.New(arg_2_0.detail:Find("conditionList"), arg_2_0.detail:Find("conditionList/condition"))

	setActive(arg_2_0.detail, false)
	setText(arg_2_0._tf:Find("top/title/Text"), i18n1("套餐图鉴"))
	setText(arg_2_0._tf:Find("top/title/Text/en"), i18n1("HANDBOOK"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0:InitData()
end

function var_0_0.InitData(arg_5_0)
	arg_5_0.formulaNums = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetFormulaNums()
	arg_5_0.formulas = {}

	for iter_5_0, iter_5_1 in ipairs(pg.island_combo.all) do
		local var_5_0 = Clone(pg.island_formula[iter_5_1])

		var_5_0.unlock_condition = pg.island_combo[iter_5_1].unlock_condition
		var_5_0.is_hide = pg.island_combo[iter_5_1].is_hide

		table.insert(arg_5_0.formulas, var_5_0)
	end

	table.sort(arg_5_0.formulas, CompareFuncs({
		function(arg_6_0)
			local var_6_0 = arg_6_0
			local var_6_1 = var_6_0.is_hide == 1
			local var_6_2 = true
			local var_6_3 = true

			for iter_6_0, iter_6_1 in ipairs(var_6_0.unlock_condition) do
				local var_6_4 = iter_6_1[1]
				local var_6_5 = iter_6_1[2]

				if not arg_5_0.formulaNums[var_6_4] or arg_5_0.formulaNums[var_6_4] < 1 then
					var_6_2 = false
				end

				if not arg_5_0.formulaNums[var_6_4] or var_6_5 > arg_5_0.formulaNums[var_6_4] then
					var_6_3 = false
				end
			end

			return (not var_6_1 and var_6_2 or var_6_1 and var_6_3) and 0 or 1
		end,
		function(arg_7_0)
			return arg_7_0.id
		end
	}))
end

function var_0_0.SetFormulaList(arg_8_0)
	arg_8_0.setMealList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_8_0.formulas[arg_9_1 + 1]
			local var_9_1 = var_9_0.is_hide == 1
			local var_9_2 = true
			local var_9_3 = true

			for iter_9_0, iter_9_1 in ipairs(var_9_0.unlock_condition) do
				local var_9_4 = iter_9_1[1]
				local var_9_5 = iter_9_1[2]

				if not arg_8_0.formulaNums[var_9_4] or arg_8_0.formulaNums[var_9_4] < 1 then
					var_9_2 = false
				end

				if not arg_8_0.formulaNums[var_9_4] or var_9_5 > arg_8_0.formulaNums[var_9_4] then
					var_9_3 = false
				end
			end

			local var_9_6 = not var_9_1 and var_9_2 or var_9_1 and var_9_3

			setActive(arg_9_2:Find("special"), var_9_1 and var_9_3)
			setActive(arg_9_2:Find("name"), var_9_6)
			setActive(arg_9_2:Find("IslandItemTpl"), var_9_6)
			setActive(arg_9_2:Find("lock"), not var_9_6)

			if var_9_6 then
				setText(arg_9_2:Find("name"), var_9_0.name)

				local var_9_7 = {
					count = 0,
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_9_0.item_id
				}

				updateCustomDrop(arg_9_2:Find("IslandItemTpl"), var_9_7)
			end

			if var_9_6 then
				onToggle(arg_8_0, arg_9_2, function(arg_10_0)
					setActive(arg_9_2:Find("select"), arg_10_0)

					if arg_10_0 then
						arg_8_0:SetDetail(var_9_0)
					end
				end, SFX_PANEL)
			else
				removeOnToggle(arg_9_2)
			end
		end
	end)
	arg_8_0.setMealList:align(#arg_8_0.formulas)
end

function var_0_0.SetDetail(arg_11_0, arg_11_1)
	setActive(arg_11_0.detail, true)
	setText(arg_11_0.detailName, arg_11_1.name)
	setActive(arg_11_0.formulaList1, #arg_11_1.unlock_condition == 2)
	setActive(arg_11_0.formulaList2, #arg_11_1.unlock_condition == 3)

	if #arg_11_1.unlock_condition == 2 then
		for iter_11_0 = 1, 2 do
			local var_11_0 = pg.island_formula[arg_11_1.unlock_condition[iter_11_0][1]]
			local var_11_1 = pg.island_item_data_template[var_11_0.item_id]

			GetImageSpriteFromAtlasAsync("island/" .. var_11_1.icon, "", arg_11_0.formulaList1:Find("formula" .. iter_11_0 .. "/icon"))
		end
	elseif #arg_11_1.unlock_condition == 3 then
		for iter_11_1 = 1, 3 do
			local var_11_2 = pg.island_formula[arg_11_1.unlock_condition[iter_11_1][1]]
			local var_11_3 = pg.island_item_data_template[var_11_2.item_id]

			GetImageSpriteFromAtlasAsync("island/" .. var_11_3.icon, "", arg_11_0.formulaList2:Find("formula" .. iter_11_1 .. "/icon"))
		end
	end

	local var_11_4 = true

	arg_11_0.conditionList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = arg_11_1.unlock_condition[arg_12_1 + 1][1]
			local var_12_1 = arg_11_1.unlock_condition[arg_12_1 + 1][2]
			local var_12_2 = pg.island_formula[var_12_0]

			setText(arg_12_2:Find("name"), "制作" .. var_12_2.name)

			local var_12_3 = arg_11_0.formulaNums[var_12_0] or 0

			if var_12_1 < var_12_3 then
				formulaNum = var_12_1
			end

			setText(arg_12_2:Find("count"), "" .. var_12_3 .. "/" .. var_12_1 .. "次")

			if var_12_3 < var_12_1 then
				var_11_4 = false
			end
		end
	end)
	arg_11_0.conditionList:align(#arg_11_1.unlock_condition)

	if var_11_4 == true then
		setText(arg_11_0.detailDesc, i18n1("已解锁套餐制作"))
	else
		setText(arg_11_0.detailDesc, arg_11_1.desc or "")
	end
end

function var_0_0.OnShow(arg_13_0)
	arg_13_0:InitData()
	arg_13_0:SetFormulaList()
	pg.UIMgr.GetInstance():BlurPanel(arg_13_0._tf)
end

function var_0_0.OnHide(arg_14_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_14_0._tf)
end

return var_0_0
