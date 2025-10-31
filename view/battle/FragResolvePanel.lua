local var_0_0 = class("FragResolvePanel", BaseSubPanel)

function var_0_0.getUIName(arg_1_0)
	return "FragResolveUI"
end

local var_0_1 = {
	"control",
	"resolve"
}

function var_0_0.OnInit(arg_2_0)
	arg_2_0.bagProxy = getProxy(BagProxy)
	arg_2_0.technologyProxy = getProxy(TechnologyProxy)
	arg_2_0.toggles = {}

	for iter_2_0, iter_2_1 in ipairs(var_0_1) do
		arg_2_0[iter_2_1 .. "Panel"] = arg_2_0._tf:Find(iter_2_1)

		local var_2_0 = arg_2_0._tf:Find("toggle_controll/" .. iter_2_1)

		arg_2_0.toggles[iter_2_1] = var_2_0

		onToggle(arg_2_0, var_2_0, function(arg_3_0)
			arg_2_0["Reset" .. iter_2_1](arg_2_0)
		end, SFX_PANEL)
	end

	onButton(arg_2_0, arg_2_0._tf:Find("bg"), function()
		arg_2_0:Back()
	end, SFX_PANEL)

	local var_2_1 = arg_2_0.controlPanel:Find("got/empty/Text")

	setText(arg_2_0.controlPanel:Find("allMax/txt"), i18n("onebutton_max_tip"))

	local var_2_2 = arg_2_0._tf:Find("control/condition/text")
	local var_2_3 = arg_2_0.resolvePanel:Find("cancel_button/label")

	if PLATFORM_CODE == PLATFORM_US then
		setTextEN(var_2_2, i18n("fenjie_lantu_tip"))
		setTextEN(var_2_1, i18n("fragresolve_empty_tip"))
	else
		setText(var_2_2, i18n("fenjie_lantu_tip"))
		setText(var_2_1, i18n("fragresolve_empty_tip"))
	end

	setText(var_2_3, i18n("msgbox_text_cancel"))

	local var_2_4 = getProxy(PlayerProxy):getData()

	var_0_0.keepFateTog = arg_2_0._tf:Find("control/condition/keep_tog")

	setText(arg_2_0.keepFateTog:Find("label"), i18n("keep_fate_tip"))

	local var_2_5 = GetComponent(arg_2_0.keepFateTog, typeof(Toggle))

	var_0_0.keepFateState = not var_2_4:GetCommonFlag(SHOW_DONT_KEEP_FATE_ITEM)
	var_2_5.isOn = var_0_0.keepFateState

	onToggle(arg_2_0, arg_2_0.keepFateTog, function(arg_5_0)
		var_0_0.keepFateState = arg_5_0

		arg_2_0:emit(NewShopMainMediator.SET_PLAYER_FLAG, SHOW_DONT_KEEP_FATE_ITEM, not arg_5_0)
		arg_2_0:Trigger("control")
	end)
	arg_2_0:Trigger("control")
end

function var_0_0.OnShow(arg_6_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_6_0._tf)
end

function var_0_0.OnHide(arg_7_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_7_0._tf)
end

function var_0_0.Reset(arg_8_0)
	if arg_8_0.resolveItems then
		table.clear(arg_8_0.resolveItems)
	end
end

function var_0_0.Resetcontrol(arg_9_0)
	arg_9_0.blueprintItems = arg_9_0.GetAllBluePrintStrengthenItems()

	local var_9_0 = arg_9_0.blueprintItems
	local var_9_1 = arg_9_0.controlPanel
	local var_9_2 = var_9_1:Find("got/empty")
	local var_9_3 = var_9_1:Find("got/list")

	setActive(var_9_2, #var_9_0 <= 0)
	setActive(var_9_3, #var_9_0 > 0)

	if #var_9_0 <= 0 then
		arg_9_0:Updatecontrol()

		return
	end

	local var_9_4 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.resolveItems or {}) do
		var_9_4[iter_9_1.id] = iter_9_1
	end

	UIItemList.StaticAlign(var_9_3, var_9_3:Find("item"), #var_9_0, function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_9_0[arg_10_1 + 1]

			updateDrop(arg_10_2:Find("icon"), var_10_0)

			var_10_0.curCount = math.clamp(var_9_4[var_10_0.id] and var_9_4[var_10_0.id].curCount or 0, 0, var_10_0.maxCount)

			onButton(arg_9_0, arg_10_2:Find("icon/icon_bg"), function()
				arg_9_0:emit(BaseUI.ON_DROP, var_10_0)
			end, SFX_PANEL)

			local var_10_1 = arg_10_2:Find("count")

			onButton(arg_9_0, var_10_1:Find("max"), function()
				if var_10_0.curCount ~= var_10_0.maxCount then
					var_10_0.curCount = var_10_0.maxCount

					arg_9_0:Updatecontrol()
				end
			end)
			pressPersistTrigger(var_10_1:Find("number_panel/left"), 0.5, function(arg_13_0)
				if var_10_0.curCount <= 0 then
					arg_13_0()

					return
				end

				var_10_0.curCount = var_10_0.curCount - 1

				arg_9_0:Updatecontrol()
			end, nil, true, true, 0.1, SFX_PANEL)
			pressPersistTrigger(var_10_1:Find("number_panel/right"), 0.5, function(arg_14_0)
				if var_10_0.curCount >= var_10_0.maxCount then
					arg_14_0()

					return
				end

				var_10_0.curCount = var_10_0.curCount + 1

				arg_9_0:Updatecontrol()
			end, nil, true, true, 0.1, SFX_PANEL)
		end
	end)
	onButton(arg_9_0, var_9_1:Find("button_1"), function()
		local var_15_0 = {}

		for iter_15_0, iter_15_1 in ipairs(arg_9_0.blueprintItems) do
			if iter_15_1.curCount > 0 then
				local var_15_1 = Clone(iter_15_1)

				var_15_1.count = iter_15_1.curCount

				table.insert(var_15_0, var_15_1)
			end
		end

		if #var_15_0 > 0 then
			arg_9_0.resolveItems = var_15_0

			triggerToggle(arg_9_0.toggles.resolve, true)
		end
	end, SFX_PANEL)
	onButton(arg_9_0, var_9_1:Find("allMax"), function()
		for iter_16_0 = 1, #var_9_0 do
			local var_16_0 = var_9_0[iter_16_0]

			if var_16_0.curCount ~= var_16_0.maxCount then
				var_16_0.curCount = var_16_0.maxCount
			end

			arg_9_0:Updatecontrol()
		end
	end, SFX_PANEL)
	arg_9_0:Updatecontrol()
end

function var_0_0.Updatecontrol(arg_17_0)
	local var_17_0 = arg_17_0.controlPanel
	local var_17_1 = var_17_0:Find("got/list")
	local var_17_2 = arg_17_0.blueprintItems
	local var_17_3 = 0

	UIItemList.StaticAlign(var_17_1, var_17_1:Find("item"), #var_17_2, function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = var_17_2[arg_18_1 + 1]
			local var_18_1 = arg_18_2:Find("count")

			setText(var_18_1:Find("number_panel/value"), var_18_0.curCount)

			var_17_3 = var_17_3 + var_18_0.curCount
		end
	end)

	local var_17_4 = var_17_0:Find("button_1")

	setButtonEnabled(var_17_4, var_17_3 > 0)
	setGray(var_17_4, var_17_3 <= 0)

	local var_17_5 = var_17_0:Find("allMax")

	setGray(var_17_5, not var_17_2 or #var_17_2 == 0)
	setButtonEnabled(var_17_5, var_17_2 and #var_17_2 > 0)
end

function var_0_0.Resetresolve(arg_19_0)
	local var_19_0 = arg_19_0.resolvePanel
	local var_19_1 = var_19_0:Find("preview/got/list")
	local var_19_2 = var_19_0:Find("result/got/list")
	local var_19_3 = arg_19_0.resolveItems

	UIItemList.StaticAlign(var_19_1, var_19_1:Find("item"), #var_19_3, function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventUpdate then
			local var_20_0 = var_19_3[arg_20_1 + 1]

			updateDrop(arg_20_2:Find("icon"), var_20_0)
			onButton(arg_19_0, arg_20_2:Find("icon/icon_bg"), function()
				arg_19_0:emit(BaseUI.ON_DROP, var_20_0)
			end, SFX_PANEL)
			setText(arg_20_2:Find("name_panel/name"), var_20_0:getConfig("name"))
			setText(arg_20_2:Find("name_panel/number"), "x " .. var_20_0.curCount)
		end
	end)

	local var_19_4 = {}
	local var_19_5 = {}

	for iter_19_0, iter_19_1 in pairs(var_19_3) do
		local var_19_6 = iter_19_1
		local var_19_7 = Item.getConfigData(var_19_6.id)

		assert(var_19_7, "Can't find the price " .. var_19_6.id)

		local var_19_8 = (var_19_4[var_19_7.price[1]] or 0) + var_19_7.price[2] * var_19_6.count

		var_19_4[var_19_7.price[1]] = var_19_8
	end

	for iter_19_2, iter_19_3 in pairs(var_19_4) do
		table.insert(var_19_5, {
			type = DROP_TYPE_RESOURCE,
			id = iter_19_2,
			count = iter_19_3
		})
	end

	UIItemList.StaticAlign(var_19_2, var_19_2:Find("item"), #var_19_5, function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_19_5[arg_22_1 + 1]

			updateDrop(arg_22_2:Find("icon"), var_22_0)
			onButton(arg_19_0, arg_22_2:Find("icon/icon_bg"), function()
				arg_19_0:emit(BaseUI.ON_DROP, var_22_0)
			end, SFX_PANEL)
			setText(arg_22_2:Find("name_panel/name"), var_22_0:getConfig("name"))
			setText(arg_22_2:Find("name_panel/number"), "x " .. var_22_0.count)
		end
	end)
	onButton(arg_19_0, var_19_0:Find("cancel_button"), function()
		arg_19_0:Back()
	end)
	onButton(arg_19_0, var_19_0:Find("destroy_button"), function()
		arg_19_0:emit(NewShopMainMediator.SELL_BLUEPRINT, arg_19_0.resolveItems)
	end)
end

function var_0_0.GetAllBluePrintStrengthenItems()
	local var_26_0 = {}
	local var_26_1 = getProxy(TechnologyProxy)
	local var_26_2 = getProxy(BagProxy)
	local var_26_3 = pg.ship_data_blueprint

	for iter_26_0, iter_26_1 in ipairs(var_26_3.all) do
		local var_26_4 = var_26_3[iter_26_1]

		if var_26_1:getBluePrintById(iter_26_1):isMaxLevel() then
			local var_26_5 = var_26_4.strengthen_item
			local var_26_6 = var_26_2:getItemById(var_26_5)

			if var_26_6 then
				local var_26_7 = var_26_1:getBluePrintById(var_26_1:GetBlueprint4Item(var_26_5))
				local var_26_8 = var_26_6.count

				if var_26_6 and var_26_6.count > 0 and var_0_0.keepFateState then
					var_26_8 = var_26_6.count - var_26_7:getFateMaxLeftOver()
					var_26_8 = var_26_8 < 0 and 0 or var_26_8
				end

				table.insert(var_26_0, Drop.New({
					id = var_26_6.id,
					type = DROP_TYPE_ITEM,
					count = var_26_6.count,
					maxCount = var_26_8
				}))
			end
		end
	end

	return var_26_0
end

function var_0_0.Trigger(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.toggles[arg_27_1]

	if var_27_0 then
		arg_27_0.buffer:Show()
		triggerToggle(var_27_0, true)
	end
end

function var_0_0.Back(arg_28_0)
	if getToggleState(arg_28_0.toggles.resolve) then
		triggerToggle(arg_28_0.toggles.control, true)
	elseif getToggleState(arg_28_0.toggles.control) then
		arg_28_0:Hide()
	end
end

return var_0_0
