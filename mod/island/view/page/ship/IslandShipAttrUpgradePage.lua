local var_0_0 = class("IslandShipAttrUpgradePage", import("...base.IslandBasePage"))
local var_0_1 = 1
local var_0_2 = 2

function var_0_0.getUIName(arg_1_0)
	return "IslandShipAttrUpgradeUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.upgradeBtn = arg_2_0._tf:Find("frame/btn_confirm")
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/frame_1/close")
	arg_2_0.contentTxt = arg_2_0._tf:Find("frame/frame_1/Text"):GetComponent(typeof(Text))
	arg_2_0.delBtn = arg_2_0._tf:Find("frame/frame_2/del")
	arg_2_0.maxBtn = arg_2_0._tf:Find("frame/frame_2/max")
	arg_2_0.toggles = {
		[var_0_1] = arg_2_0._tf:Find("frame/toggles/upgrade"),
		[var_0_2] = arg_2_0._tf:Find("frame/toggles/limit")
	}
	arg_2_0.uiAttrList = UIItemList.New(arg_2_0._tf:Find("frame/attr"), arg_2_0._tf:Find("frame/attr/tpl"))
	arg_2_0.uiUpgradeList = UIItemList.New(arg_2_0._tf:Find("frame/frame_2/items"), arg_2_0._tf:Find("frame/frame_2/items/tpl"))
	arg_2_0.emptyTr = arg_2_0._tf:Find("frame/frame_2/empty")
	arg_2_0.uiLimitConsumrList = UIItemList.New(arg_2_0._tf:Find("frame/frame_3/items"), arg_2_0._tf:Find("frame/frame_3/items/tpl"))

	setText(arg_2_0._tf:Find("frame/frame_1/title"), i18n("island_ship_title1"))
	setText(arg_2_0._tf:Find("frame/toggles/upgrade/Text"), i18n("island_ship_title2"))
	setText(arg_2_0._tf:Find("frame/toggles/limit/Text"), i18n("island_ship_title3"))
	setText(arg_2_0._tf:Find("frame/toggles/upgrade/Text_1"), i18n("island_ship_title2"))
	setText(arg_2_0._tf:Find("frame/toggles/limit/Text_1"), i18n("island_ship_title3"))
	setText(arg_2_0._tf:Find("frame/frame_2/sub_title/Text"), i18n("island_ship_title4"))
	setText(arg_2_0._tf:Find("frame/frame_3/sub_title/Text"), i18n("island_ship_title4"))
	setText(arg_2_0.upgradeBtn:Find("Text"), i18n("island_confirm"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.delBtn, function()
		arg_3_0.selected = {}

		arg_3_0:FlushAttrs(arg_3_0.slectedAttrName)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.maxBtn, function()
		arg_3_0:FillSelected()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.upgradeBtn, function()
		arg_3_0:Confirm()
	end, SFX_PANEL)

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.toggles) do
		onToggle(arg_3_0, iter_3_1, function(arg_9_0)
			if arg_9_0 then
				arg_3_0:SwitchPage(iter_3_0)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(GAME.ISLNAD_SHIP_ATTR_UPGRADE_DONE, arg_10_0.OnAttrUpgrade)
	arg_10_0:AddListener(GAME.ISLNAD_SHIP_ATTR_LIMIT_UNLOCK_DONE, arg_10_0.OnLimitUnlock)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(GAME.ISLNAD_SHIP_ATTR_UPGRADE_DONE, arg_11_0.OnAttrUpgrade)
	arg_11_0:RemoveListener(GAME.ISLNAD_SHIP_ATTR_LIMIT_UNLOCK_DONE, arg_11_0.OnLimitUnlock)
end

function var_0_0.OnAttrUpgrade(arg_12_0)
	arg_12_0.selected = {}

	arg_12_0:SwitchAttr(arg_12_0.slectedAttrName)
end

function var_0_0.OnLimitUnlock(arg_13_0)
	arg_13_0:SwitchPage(arg_13_0.page)
end

function var_0_0.OnShow(arg_14_0, arg_14_1)
	arg_14_0.ship = arg_14_1
	arg_14_0.selected = {}

	arg_14_0:BlurPanel()
	triggerToggle(arg_14_0.toggles[var_0_1], true)
end

function var_0_0.SwitchPage(arg_15_0, arg_15_1)
	arg_15_0.page = arg_15_1

	arg_15_0:UpdateAttrPanel()
	arg_15_0:UpdateContent()

	if arg_15_0.page == var_0_2 then
		arg_15_0:UpdateLimitUpgradeConsume()
	end
end

function var_0_0.UpdateAttrPanel(arg_16_0)
	local var_16_0 = arg_16_0.ship

	arg_16_0.attrTrs = {}

	arg_16_0.uiAttrList:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == UIItemList.EventUpdate then
			local var_17_0 = IslandShipAttr.ATTRS[arg_17_1 + 1]

			arg_16_0.attrTrs[var_17_0] = arg_17_2

			local var_17_1 = var_16_0:GetAttrGrade(var_17_0)
			local var_17_2 = IslandShipAttr.Grade2Img(var_17_1)

			arg_17_2:Find("grade_bg"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_17_2[2])

			setText(arg_17_2:Find("name"), IslandShipAttr.ToChinese(var_17_0))
			arg_16_0:UpdateAtrrValue(var_16_0, var_17_0)
		end
	end)
	arg_16_0.uiAttrList:align(#IslandShipAttr.ATTRS)
end

function var_0_0.UpdateAtrrValue(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.ship
	local var_18_1 = arg_18_0.attrTrs[arg_18_2]

	if arg_18_0.page == var_0_1 then
		setText(var_18_1:Find("value/value_1"), var_18_0:GetAttr(arg_18_2))
		setText(var_18_1:Find("value/value_2"), "")
		setActive(var_18_1:Find("value/arr"), false)
		onToggle(arg_18_0, var_18_1, function(arg_19_0)
			if arg_19_0 then
				arg_18_0:SwitchAttr(arg_18_2)
			end
		end, SFX_PANEL)
		setToggleEnabled(var_18_1, true)

		if arg_18_0.slectedAttrName and arg_18_2 == arg_18_0.slectedAttrName then
			triggerToggle(var_18_1, true)
		elseif not arg_18_0.slectedAttrName and arg_18_2 == IslandShipAttr.ATTRS[1] then
			triggerToggle(var_18_1, true)
		end
	elseif arg_18_0.page == var_0_2 then
		local var_18_2 = Clone(var_18_0)

		var_18_2:SetUnlockExtraAttLimit()
		setActive(var_18_1:Find("value/arr"), true)
		setText(var_18_1:Find("value/value_1"), var_18_0:GetExtraAttrLimit(arg_18_2))
		setText(var_18_1:Find("value/value_2"), var_18_2:GetExtraAttrLimit(arg_18_2))
		setToggleEnabled(var_18_1, false)
		removeOnToggle(var_18_1)

		for iter_18_0, iter_18_1 in pairs(arg_18_0.attrTrs) do
			setActive(iter_18_1:Find("Image"), false)
		end
	end
end

function var_0_0.UpdateLimitUpgradeConsume(arg_20_0)
	local var_20_0 = arg_20_0.ship
	local var_20_1 = var_20_0:IsUnlockExtraAttLimit()
	local var_20_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_20_3 = false

	if var_20_0:IsUnlockExtraAttLimit() then
		arg_20_0.uiLimitConsumrList:align(0)
	else
		local var_20_4 = var_20_0:GetExtraAttrLimitUnlockConsume()

		arg_20_0.uiLimitConsumrList:make(function(arg_21_0, arg_21_1, arg_21_2)
			if arg_21_0 == UIItemList.EventUpdate then
				local var_21_0 = var_20_4[arg_21_1 + 1]

				updateCustomDrop(arg_21_2, var_21_0)

				local var_21_1 = var_20_2:GetOwnCount(var_21_0.id)
				local var_21_2 = setColorStr(var_21_1, var_21_1 >= var_21_0.count and COLOR_GREEN or COLOR_RED)

				setText(arg_21_2:Find("icon_bg/count_bg/count"), var_21_2 .. "/" .. var_21_0.count)
			end
		end)

		var_20_3 = _.all(var_20_4, function(arg_22_0)
			return var_20_2:GetOwnCount(arg_22_0.id) >= arg_22_0.count
		end)

		arg_20_0.uiLimitConsumrList:align(#var_20_4)
	end

	setGray(arg_20_0.upgradeBtn, var_20_1 or not var_20_3)
end

function var_0_0.SwitchAttr(arg_23_0, arg_23_1)
	arg_23_0.selected = {}

	local var_23_0 = arg_23_0.ship

	arg_23_0:ClearUpdateAttrValue(arg_23_0.slectedAttrName)

	arg_23_0.slectedAttrName = arg_23_1

	local var_23_1 = arg_23_0:CanAddItemForAttrValue(arg_23_1)

	if var_23_1 then
		arg_23_0:FlushAttrs(arg_23_1)
	else
		arg_23_0.uiUpgradeList:align(0)
	end

	arg_23_0:UpdateAttrValue()
	setActive(arg_23_0.emptyTr, not var_23_1)
	setActive(arg_23_0.delBtn, var_23_1)
	setActive(arg_23_0.maxBtn, var_23_1)
end

function var_0_0.FlushAttrs(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.ship:GetUpgradeExtraAttrConsume(arg_24_1)

	arg_24_0.uiUpgradeList:make(function(arg_25_0, arg_25_1, arg_25_2)
		if arg_25_0 == UIItemList.EventUpdate then
			local var_25_0 = var_24_0[arg_25_1 + 1]

			updateCustomDrop(arg_25_2, var_25_0)

			local var_25_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetOwnCount(var_25_0.id)

			setText(arg_25_2:Find("icon_bg/count_bg/count"), "X" .. var_25_1)
			onButton(arg_24_0, arg_25_2, function()
				if not arg_24_0:CanAddItemForAttrValue(arg_24_1, arg_24_0.selected) then
					return
				end

				arg_24_0:OpenAtrrCalcPanel(arg_25_2, var_25_0)
			end, SFX_PANEL)
			onButton(arg_24_0, arg_25_2:Find("calc/bg"), function()
				arg_24_0.selected[var_25_0.id] = (arg_24_0.selected[var_25_0.id] or 0) - 1

				arg_24_0:UpdateAttrCalcPanel(arg_25_2, var_25_0)
			end, SFX_PANEL)
			arg_24_0:UpdateAttrCalcPanel(arg_25_2, var_25_0)
		end
	end)
	arg_24_0.uiUpgradeList:align(#var_24_0)
end

function var_0_0.ClearUpdateAttrValue(arg_28_0, arg_28_1)
	if not arg_28_1 or arg_28_1 == "" then
		return
	end

	local var_28_0 = arg_28_0.ship
	local var_28_1 = arg_28_0.attrTrs[arg_28_1]

	setText(var_28_1:Find("value/value_1"), var_28_0:GetAttr(arg_28_1))
end

function var_0_0.OpenAtrrCalcPanel(arg_29_0, arg_29_1, arg_29_2)
	if getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetOwnCount(arg_29_2.id) <= (arg_29_0.selected[arg_29_2.id] or 0) then
		return
	end

	arg_29_0.selected[arg_29_2.id] = (arg_29_0.selected[arg_29_2.id] or 0) + 1

	arg_29_0:UpdateAttrCalcPanel(arg_29_1, arg_29_2)
end

function var_0_0.UpdateAttrCalcPanel(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_0.selected[arg_30_2.id] or 0

	setText(arg_30_1:Find("calc/Text"), var_30_0)
	setActive(arg_30_1:Find("calc"), var_30_0 > 0)
	arg_30_0:UpdateAttrValue()
end

function var_0_0.UpdateAttrValue(arg_31_0)
	local var_31_0 = arg_31_0.slectedAttrName
	local var_31_1 = arg_31_0.attrTrs[var_31_0]
	local var_31_2 = arg_31_0.ship
	local var_31_3, var_31_4, var_31_5 = arg_31_0:CanAddItemForAttrValue(var_31_0, arg_31_0.selected)
	local var_31_6 = var_31_5 <= var_31_4 and "(MAX)" or string.format("(<color=#36a5fb>+%s</color>/%s)", var_31_4, var_31_5)

	setText(var_31_1:Find("value/value_1"), var_31_2:GetAttr(var_31_0) .. var_31_6)

	local var_31_7 = arg_31_0:NothingSelected() and not var_31_3

	setGray(arg_31_0.upgradeBtn, var_31_7 or arg_31_0:NothingSelected())
end

function var_0_0.CanAddItemForAttrValue(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0.ship
	local var_32_1 = var_32_0:GetExtraAttrValue(arg_32_1)

	for iter_32_0, iter_32_1 in pairs(arg_32_2 or {}) do
		local var_32_2 = IslandItem.New({
			id = iter_32_0
		})

		var_32_1 = var_32_1 + tonumber(var_32_2:GetUseArg()) * iter_32_1
	end

	local var_32_3 = var_32_0:GetExtraAttrLimit(arg_32_1)

	return var_32_1 < var_32_3, var_32_1, var_32_3
end

function var_0_0.FillSelected(arg_33_0)
	arg_33_0.selected = {}

	local var_33_0 = arg_33_0.ship:GetUpgradeExtraAttrConsume(arg_33_0.slectedAttrName)
	local var_33_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_33_2 = _.map(var_33_0, function(arg_34_0)
		return var_33_1:GetItemById(arg_34_0.id) or IslandItem.New({
			number = 0,
			id = arg_34_0.id
		})
	end)

	table.sort(var_33_2, function(arg_35_0, arg_35_1)
		return arg_35_0:GetRarity() > arg_35_1:GetRarity()
	end)

	local var_33_3 = {}

	for iter_33_0, iter_33_1 in ipairs(var_33_2) do
		for iter_33_2 = 1, iter_33_1.count do
			if arg_33_0:CanAddItemForAttrValue(arg_33_0.slectedAttrName, var_33_3) then
				var_33_3[iter_33_1.id] = (var_33_3[iter_33_1.id] or 0) + 1
			else
				break
			end
		end
	end

	arg_33_0.selected = var_33_3

	arg_33_0:FlushAttrs(arg_33_0.slectedAttrName)
end

function var_0_0.UpdateContent(arg_36_0)
	if arg_36_0.page == var_0_1 then
		arg_36_0.contentTxt.text = i18n("island_ship_lock_attr_tip")
	elseif arg_36_0.page == var_0_2 then
		arg_36_0.contentTxt.text = i18n("island_ship_unlock_limit_tip")
	end
end

function var_0_0.Confirm(arg_37_0)
	if arg_37_0.page == var_0_1 then
		if not arg_37_0.slectedAttrName or not arg_37_0.ship then
			return
		end

		if arg_37_0:NothingSelected() then
			return
		end

		if not arg_37_0:CanAddItemForAttrValue(arg_37_0.slectedAttrName) then
			return
		end

		local var_37_0 = table.indexof(IslandShipAttr.ATTRS, arg_37_0.slectedAttrName)

		if var_37_0 <= 0 then
			return
		end

		arg_37_0:emit(IslandMediator.SHIP_ATTR_UPGRADE, arg_37_0.ship.id, var_37_0, arg_37_0.selected)
	elseif arg_37_0.page == var_0_2 then
		if arg_37_0.ship:IsUnlockExtraAttLimit() then
			return
		end

		arg_37_0:emit(IslandMediator.SHIP_ATTR_LIMIT_UNLOCK, arg_37_0.ship.id)
	end
end

function var_0_0.NothingSelected(arg_38_0)
	for iter_38_0, iter_38_1 in pairs(arg_38_0.selected) do
		if iter_38_1 > 0 then
			return false
		end
	end

	return true
end

function var_0_0.OnHide(arg_39_0)
	arg_39_0:UnBlurPanel()
end

return var_0_0
