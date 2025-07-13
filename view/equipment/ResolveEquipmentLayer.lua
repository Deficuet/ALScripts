local var_0_0 = class("ResolveEquipmentLayer", import("..base.BaseUI"))
local var_0_1 = "resolve_equipment_option_all"
local var_0_2 = {
	SR = "SR",
	ALL = "ALL",
	R = "R",
	SSR = "SSR",
	N = "N"
}
local var_0_3 = {
	N = "N",
	SR = "SR",
	R = "R",
	SSR = "SSR"
}
local var_0_4 = {
	[var_0_2.N] = {
		1,
		2
	},
	[var_0_2.R] = {
		3
	},
	[var_0_2.SR] = {
		4
	},
	[var_0_2.SSR] = {
		5
	},
	[var_0_2.ALL] = {
		1,
		2,
		3,
		4,
		5
	}
}
local var_0_5 = {
	ALL = 3,
	PART = 2,
	GREY = 0,
	NONE = 1
}

function var_0_0.getUIName(arg_1_0)
	return "ResolveEquipmentUI"
end

function var_0_0.setPlayer(arg_2_0, arg_2_1)
	arg_2_0.player = arg_2_1
end

function var_0_0.setEquipments(arg_3_0, arg_3_1)
	arg_3_0.equipmentVOs = arg_3_1

	arg_3_0:setEquipmentByIds(arg_3_1)
end

function var_0_0.setEquipmentByIds(arg_4_0, arg_4_1)
	arg_4_0.equipmentVOByIds = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		arg_4_0.equipmentVOByIds[iter_4_1.id] = iter_4_1
	end
end

function var_0_0.init(arg_5_0)
	arg_5_0.mainPanel = arg_5_0:findTF("main")

	setActive(arg_5_0.mainPanel, true)
	setText(arg_5_0.mainPanel:Find("top/title_list/infomation/title"), i18n("title_info"))
	setText(arg_5_0.mainPanel:Find("title/Text"), i18n("resolve_equip_tip"))

	arg_5_0.viewRect = arg_5_0:findTF("main/frame/view"):GetComponent("LScrollRect")
	arg_5_0.backBtn = arg_5_0:findTF("main/top/btnBack")
	arg_5_0.cancelBtn = arg_5_0:findTF("main/cancel_btn")

	setText(arg_5_0.cancelBtn:Find("Image"), i18n("text_cancel"))

	arg_5_0.okBtn = arg_5_0:findTF("main/ok_btn")

	setText(arg_5_0.okBtn:Find("Image"), i18n("text_confirm"))
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf, false, {})

	arg_5_0.selectedIds = {}
	arg_5_0.selectOptions = arg_5_0:findTF("main/options")

	setText(arg_5_0.selectOptions:Find("ALL/Label"), i18n("word_equipment_all"))

	arg_5_0.optionStatus = {}
	arg_5_0.destroyConfirm = arg_5_0:findTF("destroy_confirm")
	arg_5_0.destroyBonusList = arg_5_0.destroyConfirm:Find("got/scrollview/list")
	arg_5_0.destroyBonusItem = arg_5_0.destroyConfirm:Find("got/scrollview/item")

	setActive(arg_5_0.destroyConfirm, false)
	setActive(arg_5_0.destroyBonusItem, false)
	setText(arg_5_0.destroyConfirm:Find("got/title"), i18n("resolve_equip_title"))
	setText(arg_5_0.destroyConfirm:Find("actions/cancel_button/Image"), i18n("text_cancel"))
	setText(arg_5_0.destroyConfirm:Find("actions/destroy_button/Image"), i18n("text_confirm"))

	arg_5_0.equipDestroyConfirmWindow = EquipDestoryConfirmWindow.New(arg_5_0._tf, arg_5_0.event)
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:initEquipments()
	onButton(arg_6_0, arg_6_0.backBtn, function()
		arg_6_0:SureExit()
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0.cancelBtn, function()
		arg_6_0:SureExit()
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0.okBtn, function()
		local var_9_0 = {}

		if underscore.any(arg_6_0.selectedIds, function(arg_10_0)
			local var_10_0 = arg_6_0.equipmentVOByIds[arg_10_0[1]]

			return var_10_0:getConfig("rarity") >= 4 or var_10_0:getConfig("level") > 1
		end) then
			table.insert(var_9_0, function(arg_11_0)
				arg_6_0.equipDestroyConfirmWindow:Load()
				arg_6_0.equipDestroyConfirmWindow:ActionInvoke("Show", underscore.map(arg_6_0.selectedIds, function(arg_12_0)
					return setmetatable({
						count = arg_12_0[2]
					}, {
						__index = arg_6_0.equipmentVOByIds[arg_12_0[1]]
					})
				end), arg_11_0)
			end)
		end

		seriesAsync(var_9_0, function()
			if #arg_6_0.selectedIds <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("err_resloveequip_nochoice"))

				return
			end

			setActive(arg_6_0.mainPanel, false)
			setActive(arg_6_0.destroyConfirm, true)
			arg_6_0:displayDestroyBonus()
		end)
	end, SFX_CONFIRM)
	onButton(arg_6_0, findTF(arg_6_0.destroyConfirm, "actions/cancel_button"), function()
		setActive(arg_6_0.destroyConfirm, false)
		setActive(arg_6_0.mainPanel, true)
		pg.UIMgr.GetInstance():UnblurPanel(arg_6_0.destroyConfirm, arg_6_0._tf)
	end, SFX_CANCEL)
	onButton(arg_6_0, findTF(arg_6_0.destroyConfirm, "actions/destroy_button"), function()
		local var_15_0 = {}

		seriesAsync(var_15_0, function()
			arg_6_0:emit(ResolveEquipmentMediator.ON_RESOLVE, arg_6_0.selectedIds)
		end)
	end, SFX_UI_EQUIPMENT_RESOLVE)
	eachChild(arg_6_0.selectOptions, function(arg_17_0)
		onButton(arg_6_0, arg_17_0, function()
			local var_18_0 = arg_17_0.name
			local var_18_1 = arg_6_0.optionStatus[var_18_0]
			local var_18_2 = var_0_4[var_18_0]

			switch(var_18_1, {
				[var_0_5.GREY] = function()
					return
				end,
				[var_0_5.NONE] = function()
					arg_6_0:selAllEquipsByRaritys(var_18_2)
				end,
				[var_0_5.PART] = function()
					arg_6_0:unselAllEquipsByRaritys(var_18_2)
				end,
				[var_0_5.ALL] = function()
					arg_6_0:unselAllEquipsByRaritys(var_18_2)
				end
			})
		end, SFX_CANCEL)
	end)
end

function var_0_0.HideDestroyCondirm(arg_23_0)
	setActive(arg_23_0.destroyConfirm, false)
end

function var_0_0.OnResolveEquipDone(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(var_0_3) do
		local var_24_0 = arg_24_0.optionStatus[iter_24_1]

		if var_24_0 == var_0_5.ALL then
			arg_24_0:SetLocalDataByOption(iter_24_1, 1)
		elseif var_24_0 == var_0_5.NONE then
			arg_24_0:SetLocalDataByOption(iter_24_1, 0)
		end
	end

	if arg_24_0.optionStatus[var_0_2.ALL] == var_0_5.ALL then
		arg_24_0:emit(var_0_0.ON_CLOSE)
	else
		setActive(arg_24_0.mainPanel, true)

		local function var_24_1(arg_25_0)
			for iter_25_0, iter_25_1 in ipairs(arg_24_0.selectedIds) do
				if iter_25_1[1] == arg_25_0 then
					return iter_25_1[2]
				end
			end

			return 0
		end

		local var_24_2 = {}

		for iter_24_2, iter_24_3 in ipairs(arg_24_0.equipmentVOs) do
			local var_24_3 = Clone(iter_24_3)

			if iter_24_3.count - var_24_1(iter_24_3.id) > 0 then
				table.insert(var_24_2, var_24_3)
			end
		end

		arg_24_0:setEquipments(var_24_2)
		arg_24_0.viewRect:SetTotalCount(#arg_24_0.equipmentVOs, -1)
		arg_24_0:selectedLocalRecordEquipment()
	end
end

function var_0_0.onBackPressed(arg_26_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_26_0.destroyConfirm) then
		triggerButton(findTF(arg_26_0.destroyConfirm, "actions/cancel_button"))
	elseif arg_26_0.equipDestroyConfirmWindow:isShowing() then
		arg_26_0.equipDestroyConfirmWindow:Hide()
	else
		triggerButton(arg_26_0.cancelBtn)
	end
end

function var_0_0.selectedLocalRecordEquipment(arg_27_0)
	arg_27_0.selectedIds = {}

	for iter_27_0, iter_27_1 in pairs(var_0_3) do
		if arg_27_0:GetLocalDataByOption(iter_27_1) == 1 then
			local var_27_0 = var_0_4[iter_27_1]

			arg_27_0:selAllEquipsByRaritys(var_27_0)
		end
	end

	arg_27_0:updateSelected()
end

function var_0_0.GetLocalDataByOption(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.player.id .. var_0_1 .. arg_28_1

	if (arg_28_1 == var_0_2.N or arg_28_1 == var_0_2.R) and not PlayerPrefs.HasKey(var_28_0) then
		arg_28_0:SetLocalDataByOption(arg_28_1, 1)
	end

	return PlayerPrefs.GetInt(arg_28_0.player.id .. var_0_1 .. arg_28_1, 0)
end

function var_0_0.SetLocalDataByOption(arg_29_0, arg_29_1, arg_29_2)
	PlayerPrefs.SetInt(arg_29_0.player.id .. var_0_1 .. arg_29_1, arg_29_2)
	PlayerPrefs.Save()
end

function var_0_0.selAllEquipsByRaritys(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in ipairs(arg_30_0.equipmentVOs) do
		local var_30_0 = iter_30_1:getConfig("rarity")

		if table.contains(arg_30_1, var_30_0) then
			arg_30_0:selectEquip(iter_30_1, iter_30_1.count)
		end
	end

	arg_30_0:updateSelected()
end

function var_0_0.unselAllEquipsByRaritys(arg_31_0, arg_31_1)
	arg_31_0.selectedIds = underscore.select(arg_31_0.selectedIds, function(arg_32_0)
		local var_32_0 = arg_31_0.equipmentVOByIds[arg_32_0[1]]:getConfig("rarity")

		return not table.contains(arg_31_1, var_32_0)
	end)

	arg_31_0:updateSelected()
end

function var_0_0.displayDestroyBonus(arg_33_0)
	local var_33_0 = {}
	local var_33_1 = 0

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.selectedIds) do
		if Equipment.CanInBag(iter_33_1[1]) then
			local var_33_2 = Equipment.getConfigData(iter_33_1[1])
			local var_33_3 = var_33_2.destory_item or {}

			var_33_1 = var_33_1 + (var_33_2.destory_gold or 0) * iter_33_1[2]

			for iter_33_2, iter_33_3 in ipairs(var_33_3) do
				local var_33_4 = false

				for iter_33_4, iter_33_5 in ipairs(var_33_0) do
					if iter_33_3[1] == var_33_0[iter_33_4].id then
						var_33_0[iter_33_4].count = var_33_0[iter_33_4].count + iter_33_3[2] * iter_33_1[2]
						var_33_4 = true

						break
					end
				end

				if not var_33_4 then
					table.insert(var_33_0, {
						type = DROP_TYPE_ITEM,
						id = iter_33_3[1],
						count = iter_33_3[2] * iter_33_1[2]
					})
				end
			end
		end
	end

	if var_33_1 > 0 then
		table.insert(var_33_0, {
			id = 1,
			type = DROP_TYPE_RESOURCE,
			count = var_33_1
		})
	end

	for iter_33_6 = #var_33_0, arg_33_0.destroyBonusList.childCount - 1 do
		Destroy(arg_33_0.destroyBonusList:GetChild(iter_33_6))
	end

	for iter_33_7 = arg_33_0.destroyBonusList.childCount, #var_33_0 - 1 do
		cloneTplTo(arg_33_0.destroyBonusItem, arg_33_0.destroyBonusList)
	end

	for iter_33_8 = 1, #var_33_0 do
		local var_33_5 = arg_33_0.destroyBonusList:GetChild(iter_33_8 - 1)
		local var_33_6 = var_33_0[iter_33_8]

		if var_33_6.type == DROP_TYPE_SHIP then
			arg_33_0.hasShip = true
		end

		local var_33_7 = var_33_5:Find("icon_bg/icon/icon")

		GetComponent(var_33_5:Find("icon_bg/icon"), typeof(Image)).enabled = true

		if not IsNil(var_33_7) then
			setActive(var_33_7, false)
		end

		updateDrop(var_33_5, var_33_6)

		local var_33_8, var_33_9 = contentWrap(var_33_6:getConfig("name"), 10, 2)

		if var_33_8 then
			var_33_9 = var_33_9 .. "..."
		end

		setText(var_33_5:Find("name"), var_33_9)
		onButton(arg_33_0, var_33_5, function()
			if var_33_6.type == DROP_TYPE_RESOURCE or var_33_6.type == DROP_TYPE_ITEM then
				arg_33_0:emit(var_0_0.ON_ITEM, var_33_6:getConfig("id"))
			elseif var_33_6.type == DROP_TYPE_EQUIP then
				arg_33_0:emit(var_0_0.ON_EQUIPMENT, {
					equipmentId = var_33_6:getConfig("id"),
					type = EquipmentInfoMediator.TYPE_DISPLAY
				})
			end
		end, SFX_PANEL)
	end
end

function var_0_0.initEquipments(arg_35_0)
	function arg_35_0.viewRect.onInitItem(arg_36_0)
		arg_35_0:onInitItem(arg_36_0)
	end

	function arg_35_0.viewRect.onUpdateItem(arg_37_0, arg_37_1)
		arg_35_0:onUpdateItem(arg_37_0, arg_37_1)
	end

	function arg_35_0.viewRect.onStart()
		arg_35_0:selectedLocalRecordEquipment()
	end

	arg_35_0.cards = {}

	arg_35_0:filterEquipments()
end

function var_0_0.filterEquipments(arg_39_0)
	local var_39_0 = underscore.select(arg_39_0.equipmentVOs, function(arg_40_0)
		return not arg_40_0:isImportance()
	end)

	arg_39_0:setEquipments(var_39_0)
	table.sort(arg_39_0.equipmentVOs, CompareFuncs({
		function(arg_41_0)
			return -arg_41_0:getConfig("rarity")
		end,
		function(arg_42_0)
			return arg_42_0.id
		end
	}))
	arg_39_0.viewRect:SetTotalCount(#arg_39_0.equipmentVOs, -1)
end

function var_0_0.onInitItem(arg_43_0, arg_43_1)
	local var_43_0 = EquipmentItem.New(arg_43_1)

	onButton(arg_43_0, var_43_0.go, function()
		arg_43_0:selectEquip(var_43_0.equipmentVO, var_43_0.equipmentVO.count)
	end, SFX_PANEL)
	onButton(arg_43_0, var_43_0.reduceBtn, function()
		arg_43_0:selectEquip(var_43_0.equipmentVO, 1)
	end, SFX_PANEL)

	arg_43_0.cards[arg_43_1] = var_43_0
end

function var_0_0.onUpdateItem(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = arg_46_0.cards[arg_46_2]

	if not var_46_0 then
		arg_46_0:onInitItem(arg_46_2)

		var_46_0 = arg_46_0.cards[arg_46_2]
	end

	local var_46_1 = arg_46_0.equipmentVOs[arg_46_1 + 1]

	var_46_0:update(var_46_1, true)

	local var_46_2 = false
	local var_46_3 = 0

	for iter_46_0, iter_46_1 in pairs(arg_46_0.selectedIds) do
		if var_46_0.equipmentVO.id == iter_46_1[1] then
			var_46_2 = true
			var_46_3 = iter_46_1[2]

			break
		end
	end

	var_46_0:updateSelected(var_46_2, var_46_3)
end

function var_0_0.isSelectedAll(arg_47_0)
	for iter_47_0, iter_47_1 in pairs(arg_47_0.equipmentVOByIds) do
		local var_47_0 = false

		for iter_47_2, iter_47_3 in pairs(arg_47_0.selectedIds) do
			if iter_47_3[1] == iter_47_1.id and iter_47_1.count == iter_47_3[2] then
				var_47_0 = true
			end
		end

		if var_47_0 == false then
			return false
		end
	end

	return true
end

function var_0_0.selectEquip(arg_48_0, arg_48_1, arg_48_2)
	if not arg_48_0:checkDestroyGold(arg_48_1, arg_48_2) then
		return
	end

	if arg_48_1:isImportance() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("retire_importantequipment_tips"))

		return
	end

	local var_48_0 = false
	local var_48_1
	local var_48_2 = 0

	for iter_48_0, iter_48_1 in pairs(arg_48_0.selectedIds) do
		if iter_48_1[1] == arg_48_1.id then
			var_48_0 = true
			var_48_1 = iter_48_0
			var_48_2 = iter_48_1[2]

			break
		end
	end

	if not var_48_0 then
		table.insert(arg_48_0.selectedIds, {
			arg_48_1.id,
			arg_48_2
		})
	elseif var_48_2 - arg_48_2 > 0 then
		arg_48_0.selectedIds[var_48_1][2] = var_48_2 - arg_48_2
	else
		table.remove(arg_48_0.selectedIds, var_48_1)
	end

	arg_48_0:updateSelected()
end

function var_0_0.updateSelected(arg_49_0)
	for iter_49_0, iter_49_1 in pairs(arg_49_0.cards) do
		if iter_49_1.equipmentVO then
			local var_49_0 = false
			local var_49_1 = 0

			for iter_49_2, iter_49_3 in pairs(arg_49_0.selectedIds) do
				if iter_49_1.equipmentVO.id == iter_49_3[1] then
					var_49_0 = true
					var_49_1 = iter_49_3[2]

					break
				end
			end

			iter_49_1:updateSelected(var_49_0, var_49_1)
		end
	end

	arg_49_0:updateOptionsStatus()
end

function var_0_0.updateOptionsStatus(arg_50_0)
	arg_50_0.optionStatus = {}

	for iter_50_0, iter_50_1 in pairs(var_0_2) do
		local var_50_0 = arg_50_0.selectOptions:Find(iter_50_1)
		local var_50_1 = arg_50_0:GetOptionStatus(iter_50_1)

		arg_50_0.optionStatus[iter_50_1] = var_50_1

		setGray(var_50_0, var_50_1 == var_0_5.GREY, true)

		GetOrAddComponent(var_50_0, "CanvasGroup").alpha = var_50_1 == var_0_5.GREY and 0.4 or 1

		setActive(var_50_0:Find("Background/Checkmark"), var_50_1 == var_0_5.ALL)
		setActive(var_50_0:Find("Background/Part"), var_50_1 == var_0_5.PART)
	end
end

function var_0_0.GetOptionStatus(arg_51_0, arg_51_1)
	if arg_51_1 == var_0_2.ALL then
		if #arg_51_0.selectedIds == 0 then
			return var_0_5.NONE
		elseif arg_51_0:isSelectedAll() then
			return var_0_5.ALL
		else
			return var_0_5.PART
		end
	else
		local var_51_0 = var_0_4[arg_51_1]

		if not underscore.any(arg_51_0.equipmentVOs, function(arg_52_0)
			local var_52_0 = arg_52_0:getConfig("rarity")

			return table.contains(var_51_0, var_52_0)
		end) then
			return var_0_5.GREY
		end

		local var_51_1 = underscore.any(arg_51_0.selectedIds, function(arg_53_0)
			local var_53_0 = arg_51_0.equipmentVOByIds[arg_53_0[1]]:getConfig("rarity")

			return table.contains(var_51_0, var_53_0)
		end)

		return arg_51_0:isSelectedAllRaritys(var_51_0) and var_0_5.ALL or var_51_1 and var_0_5.PART or var_0_5.NONE
	end
end

function var_0_0.isSelectedAllRaritys(arg_54_0, arg_54_1)
	for iter_54_0, iter_54_1 in pairs(arg_54_0.equipmentVOByIds) do
		local var_54_0 = iter_54_1:getConfig("rarity")

		if table.contains(arg_54_1, var_54_0) then
			local var_54_1 = false

			for iter_54_2, iter_54_3 in pairs(arg_54_0.selectedIds) do
				if iter_54_3[1] == iter_54_1.id and iter_54_1.count == iter_54_3[2] then
					var_54_1 = true
				end
			end

			if var_54_1 == false then
				return false
			end
		end
	end

	return true
end

function var_0_0.checkDestroyGold(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = 0
	local var_55_1 = false

	for iter_55_0, iter_55_1 in pairs(arg_55_0.selectedIds) do
		local var_55_2 = iter_55_1[2]

		if Equipment.CanInBag(iter_55_1[1]) then
			var_55_0 = var_55_0 + (Equipment.getConfigData(iter_55_1[1]).destory_gold or 0) * var_55_2
		end

		if arg_55_1 and iter_55_1[1] == arg_55_1.configId then
			var_55_1 = true
		end
	end

	if not var_55_1 and arg_55_1 and arg_55_2 > 0 then
		var_55_0 = var_55_0 + (arg_55_1:getConfig("destory_gold") or 0) * arg_55_2
	end

	if arg_55_0.player:GoldMax(var_55_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
	end

	return true
end

function var_0_0.SureExit(arg_56_0)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("sure_exit_resolve_equip"),
		onYes = function()
			arg_56_0:emit(var_0_0.ON_CLOSE)
		end
	})
end

function var_0_0.willExit(arg_58_0)
	arg_58_0.equipDestroyConfirmWindow:Destroy()
	pg.UIMgr.GetInstance():UnblurPanel(arg_58_0._tf, pg.UIMgr.GetInstance().UIMain)
end

return var_0_0
