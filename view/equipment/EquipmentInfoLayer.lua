local var_0_0 = class("EquipmentInfoLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EquipmentInfoUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/equipmentinfoui_atlas",
		"equiptype"
	}

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))

	return var_2_0
end

var_0_0.PANEL_DESTROY = "Destroy"
var_0_0.PANEL_REVERT = "Revert"
var_0_0.Left = 1
var_0_0.Middle = 2
var_0_0.Right = 3
var_0_0.pos = {
	{
		-353,
		30,
		0
	},
	{
		0,
		30,
		0
	},
	{
		353,
		30,
		0
	}
}

function var_0_0.init(arg_3_0)
	local var_3_0 = {
		"default",
		"replace",
		"display",
		"destroy",
		"revert"
	}

	arg_3_0.toggles = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		arg_3_0[iter_3_1 .. "Panel"] = arg_3_0._tf:Find(iter_3_1)
		arg_3_0.toggles[iter_3_1 .. "Panel"] = arg_3_0._tf:Find("toggle_controll/" .. iter_3_1)
	end

	arg_3_0.sample = arg_3_0._tf:Find("sample")

	setActive(arg_3_0.sample, false)
	setActive(arg_3_0.defaultPanel:Find("transform_tip"), false)

	arg_3_0.txtQuickEnable = findTF(arg_3_0._tf, "txtQuickEnable")

	setText(arg_3_0.txtQuickEnable, i18n("ship_equip_check"))

	arg_3_0.equipDestroyConfirmWindow = EquipDestoryConfirmWindow.New(arg_3_0._tf, arg_3_0.event)
end

function var_0_0.setEquipment(arg_4_0, arg_4_1)
	arg_4_0.equipmentVO = arg_4_1
end

function var_0_0.setShip(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.shipVO = arg_5_1
	arg_5_0.oldShipVO = arg_5_2
end

function var_0_0.setPlayer(arg_6_0, arg_6_1)
	arg_6_0.player = arg_6_1
end

function var_0_0.checkOverGold(arg_7_0, arg_7_1)
	local var_7_0 = _.detect(arg_7_1, function(arg_8_0)
		return arg_8_0.type == DROP_TYPE_RESOURCE and arg_8_0.id == 1
	end).count or 0

	if arg_7_0.player:GoldMax(var_7_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
	end

	return true
end

function var_0_0.setDestroyCount(arg_9_0, arg_9_1)
	arg_9_1 = math.clamp(arg_9_1, 1, arg_9_0.equipmentVO.count)

	if arg_9_0.destroyCount ~= arg_9_1 then
		arg_9_0.destroyCount = arg_9_1

		arg_9_0:updateDestroyCount()
	end
end

function var_0_0.didEnter(arg_10_0)
	setActive(arg_10_0.txtQuickEnable, arg_10_0.contextData.quickFlag or false)

	local var_10_0 = defaultValue(arg_10_0.contextData.type, EquipmentInfoMediator.TYPE_DEFAULT)

	arg_10_0.isShowUnique = table.contains(EquipmentInfoMediator.SHOW_UNIQUE, var_10_0)

	onButton(arg_10_0, arg_10_0._tf:Find("bg"), function()
		if isActive(arg_10_0.destroyPanel) then
			triggerToggle(arg_10_0.toggles.defaultPanel, true)

			return
		end

		arg_10_0:closeView()
	end, SOUND_BACK)
	arg_10_0:initAndSetBtn(var_10_0)

	if var_10_0 == EquipmentInfoMediator.TYPE_DEFAULT then
		arg_10_0:updateOperation1()
	elseif var_10_0 == EquipmentInfoMediator.TYPE_SHIP then
		arg_10_0:updateOperation2()
	elseif var_10_0 == EquipmentInfoMediator.TYPE_REPLACE then
		arg_10_0:updateOperation3()
	elseif var_10_0 == EquipmentInfoMediator.TYPE_DISPLAY then
		arg_10_0:updateOperation4()
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf, {
		staticBlur = true
	})
end

function var_0_0.initAndSetBtn(arg_12_0, arg_12_1)
	if arg_12_1 == EquipmentInfoMediator.TYPE_DEFAULT or arg_12_1 == EquipmentInfoMediator.TYPE_SHIP then
		arg_12_0.defaultEquipTF = arg_12_0.defaultPanel:Find("equipment") or arg_12_0:cloneSampleTo(arg_12_0.defaultPanel, var_0_0.Middle, "equipment")
		arg_12_0.defaultReplaceBtn = arg_12_0.defaultPanel:Find("actions/action_button_3")
		arg_12_0.defaultDestroyBtn = arg_12_0.defaultPanel:Find("actions/action_button_1")
		arg_12_0.defaultEnhanceBtn = arg_12_0.defaultPanel:Find("actions/action_button_2")
		arg_12_0.defaultUnloadBtn = arg_12_0.defaultPanel:Find("actions/action_button_4")
		arg_12_0.defaultRevertBtn = arg_12_0.defaultEquipTF:Find("info/equip/revert_btn")
		arg_12_0.defaultTransformTipBar = arg_12_0.defaultEquipTF:Find("transform_tip")

		if arg_12_1 == EquipmentInfoMediator.TYPE_DEFAULT and not arg_12_0.defaultTransformTipBar then
			local var_12_0 = arg_12_0.defaultPanel:Find("transform_tip")

			setParent(var_12_0, arg_12_0.defaultEquipTF)

			local var_12_1 = var_12_0.sizeDelta

			var_12_1.y = 0
			var_12_0.sizeDelta = var_12_1

			setAnchoredPosition(var_12_0, Vector2.zero)

			arg_12_0.defaultTransformTipBar = var_12_0
		end

		onButton(arg_12_0, arg_12_0.defaultReplaceBtn, function()
			local var_13_0, var_13_1 = ShipStatus.ShipStatusCheck("onModify", arg_12_0.shipVO)

			if not var_13_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_13_1)

				return
			end

			arg_12_0:emit(EquipmentInfoMediator.ON_CHANGE)
		end, SFX_PANEL)
		onButton(arg_12_0, arg_12_0.defaultEnhanceBtn, function()
			if arg_12_0.shipVO then
				local var_14_0, var_14_1 = ShipStatus.ShipStatusCheck("onModify", arg_12_0.shipVO)

				if not var_14_0 then
					pg.TipsMgr.GetInstance():ShowTips(var_14_1)

					return
				end
			end

			arg_12_0:emit(EquipmentInfoMediator.ON_INTENSIFY)
		end, SFX_PANEL)
		onButton(arg_12_0, arg_12_0.defaultUnloadBtn, function()
			local var_15_0, var_15_1 = ShipStatus.ShipStatusCheck("onModify", arg_12_0.shipVO)

			if not var_15_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_15_1)

				return
			end

			arg_12_0:emit(EquipmentInfoMediator.ON_UNEQUIP)
		end, SFX_UI_DOCKYARD_EQUIPOFF)
		onButton(arg_12_0, arg_12_0.defaultDestroyBtn, function()
			triggerToggle(arg_12_0.toggles.destroyPanel, true)

			if not arg_12_0.initDestroyPanel then
				arg_12_0:initAndSetBtn(var_0_0.PANEL_DESTROY)
			end

			arg_12_0:updateEquipmentPanel(arg_12_0.destroyEquipTF, arg_12_0.equipmentVO)

			if arg_12_0.equipmentVO.count > 0 then
				arg_12_0:setDestroyCount(1)
			end
		end, SFX_PANEL)
		onButton(arg_12_0, arg_12_0.defaultRevertBtn, function()
			triggerToggle(arg_12_0.toggles.revertPanel, true)

			if not arg_12_0.initRevertPanel then
				arg_12_0:initAndSetBtn(var_0_0.PANEL_REVERT)
			end

			arg_12_0:updateRevertPanel()
		end, SFX_PANEL)
	elseif arg_12_1 == EquipmentInfoMediator.TYPE_REPLACE then
		arg_12_0.replaceSrcEquipTF = arg_12_0.replacePanel:Find("equipment") or arg_12_0:cloneSampleTo(arg_12_0.replacePanel, var_0_0.Left, "equipment")
		arg_12_0.replaceDstEquipTF = arg_12_0.replacePanel:Find("equipment_on_ship") or arg_12_0:cloneSampleTo(arg_12_0.replacePanel, var_0_0.Right, "equipment_on_ship")
		arg_12_0.replaceCancelBtn = arg_12_0.replacePanel:Find("actions/cancel_button")
		arg_12_0.replaceConfirmBtn = arg_12_0.replacePanel:Find("actions/action_button_2")

		onButton(arg_12_0, arg_12_0.replaceCancelBtn, function()
			if isActive(arg_12_0.destroyPanel) then
				triggerToggle(arg_12_0.toggles.defaultPanel, true)

				return
			end

			arg_12_0:closeView()
		end, SFX_CANCEL)
		onButton(arg_12_0, arg_12_0.replaceConfirmBtn, function()
			local var_19_0, var_19_1 = arg_12_0.shipVO:canEquipAtPos(arg_12_0.equipmentVO, arg_12_0.contextData.pos)

			if not var_19_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_equipmentInfoLayer_error_canNotEquip", var_19_1))

				return
			end

			if arg_12_0.contextData.quickCallback then
				arg_12_0.contextData.quickCallback()
				arg_12_0:closeView()
			else
				arg_12_0:emit(EquipmentInfoMediator.ON_EQUIP)
			end
		end, SFX_UI_DOCKYARD_EQUIPADD)
	elseif arg_12_1 == EquipmentInfoMediator.TYPE_DISPLAY then
		arg_12_0.displayEquipTF = arg_12_0.displayPanel:Find("equipment") or arg_12_0:cloneSampleTo(arg_12_0.displayPanel, var_0_0.Middle, "equipment")
		arg_12_0.displayMoveBtn = arg_12_0.displayPanel:Find("actions/move_button")
		arg_12_0.defaultTransformTipBar = arg_12_0.displayEquipTF:Find("transform_tip")

		if arg_12_0.contextData.showTransformTip and not arg_12_0.defaultTransformTipBar then
			local var_12_2 = arg_12_0.defaultPanel:Find("transform_tip")

			setParent(var_12_2, arg_12_0.displayEquipTF)

			local var_12_3 = var_12_2.sizeDelta

			var_12_3.y = 0
			var_12_2.sizeDelta = var_12_3

			setAnchoredPosition(var_12_2, Vector2.zero)

			arg_12_0.defaultTransformTipBar = var_12_2
		end

		onButton(arg_12_0, arg_12_0.displayMoveBtn, function()
			arg_12_0:emit(EquipmentInfoMediator.ON_MOVE, arg_12_0.shipVO.id)
		end)
	elseif arg_12_1 == var_0_0.PANEL_DESTROY then
		arg_12_0.initDestroyPanel = true
		arg_12_0.destroyEquipTF = arg_12_0.destroyPanel:Find("equipment") or arg_12_0:cloneSampleTo(arg_12_0.destroyPanel, var_0_0.Left, "equipment")
		arg_12_0.destroyCounter = arg_12_0.destroyPanel:Find("destroy")
		arg_12_0.destroyValue = arg_12_0.destroyCounter:Find("count/number_panel/value")
		arg_12_0.destroyLeftButton = arg_12_0.destroyCounter:Find("count/number_panel/left")
		arg_12_0.destroyRightButton = arg_12_0.destroyCounter:Find("count/number_panel/right")
		arg_12_0.destroyBonusList = arg_12_0.destroyCounter:Find("got/list")
		arg_12_0.destroyBonusItem = arg_12_0.destroyCounter:Find("got/item")
		arg_12_0.destroyCancelBtn = arg_12_0.destroyPanel:Find("actions/cancel_button")
		arg_12_0.destroyConfirmBtn = arg_12_0.destroyPanel:Find("actions/destroy_button")

		onButton(arg_12_0, arg_12_0.destroyLeftButton, function()
			arg_12_0:setDestroyCount(arg_12_0.destroyCount - 1)
		end, SFX_PANEL)
		onButton(arg_12_0, arg_12_0.destroyRightButton, function()
			arg_12_0:setDestroyCount(arg_12_0.destroyCount + 1)
		end, SFX_PANEL)
		onButton(arg_12_0, arg_12_0.destroyCounter:Find("count/max"), function()
			arg_12_0:setDestroyCount(arg_12_0.equipmentVO.count)
		end, SFX_PANEL)
		onButton(arg_12_0, arg_12_0.destroyCancelBtn, function()
			triggerToggle(arg_12_0.toggles.defaultPanel, true)
		end, SFX_CANCEL)
		onButton(arg_12_0, arg_12_0.destroyConfirmBtn, function()
			if not arg_12_0:checkOverGold(arg_12_0.awards) then
				return
			end

			local var_25_0 = {}

			if arg_12_0.equipmentVO:isImportance() then
				table.insert(var_25_0, function(arg_26_0)
					arg_12_0.equipDestroyConfirmWindow:Load()
					arg_12_0.equipDestroyConfirmWindow:ActionInvoke("Show", {
						setmetatable({
							count = arg_12_0.destroyCount
						}, {
							__index = arg_12_0.equipmentVO
						})
					}, arg_26_0)
				end)
			end

			seriesAsync(var_25_0, function()
				arg_12_0:emit(EquipmentInfoMediator.ON_DESTROY, arg_12_0.destroyCount)
			end)
		end, SFX_UI_EQUIPMENT_RESOLVE)
	elseif arg_12_1 == var_0_0.PANEL_REVERT then
		arg_12_0.initRevertPanel = true
		arg_12_0.revertEquipTF = arg_12_0.revertPanel:Find("equipment") or arg_12_0:cloneSampleTo(arg_12_0.revertPanel, var_0_0.Left, "equipment")
		arg_12_0.revertAwardContainer = arg_12_0.revertPanel:Find("item_panel/got/list")
		arg_12_0.revertCancelBtn = arg_12_0.revertPanel:Find("actions/cancel_button")
		arg_12_0.revertConfirmBtn = arg_12_0.revertPanel:Find("actions/revert_button")
		arg_12_0.itemTpl = arg_12_0:getTpl("item_panel/got/item", arg_12_0.revertPanel)

		onButton(arg_12_0, arg_12_0.revertCancelBtn, function()
			triggerToggle(arg_12_0.toggles.defaultPanel, true)
		end, SFX_CANCEL)
		onButton(arg_12_0, arg_12_0.revertConfirmBtn, function()
			if not arg_12_0:checkOverGold(arg_12_0.awards) then
				return
			end

			local var_29_0 = arg_12_0.equipmentVO

			arg_12_0:emit(EquipmentInfoMediator.ON_REVERT, var_29_0.id)
		end, SFX_UI_EQUIPMENT_RESOLVE)
	end
end

function var_0_0.updateOperation1(arg_30_0)
	triggerToggle(arg_30_0.toggles.defaultPanel, true)
	arg_30_0:updateEquipmentPanel(arg_30_0.defaultEquipTF, arg_30_0.equipmentVO)
	setActive(arg_30_0.defaultRevertBtn, not LOCK_EQUIP_REVERT and arg_30_0.fromEquipmentView and arg_30_0.equipmentVO:getConfig("level") > 1 and getProxy(BagProxy):getItemCountById(Item.REVERT_EQUIPMENT_ID) > 0)
	setActive(arg_30_0.defaultReplaceBtn, false)
	setActive(arg_30_0.defaultUnloadBtn, false)
	setActive(arg_30_0.defaultDestroyBtn, arg_30_0.contextData.destroy and arg_30_0.equipmentVO.count > 0)
	arg_30_0:UpdateTransformTipBar(arg_30_0.equipmentVO)
end

function var_0_0.updateOperation2(arg_31_0)
	triggerToggle(arg_31_0.toggles.defaultPanel, true)
	arg_31_0:updateEquipmentPanel(arg_31_0.defaultEquipTF, arg_31_0.shipVO:getEquip(arg_31_0.contextData.pos))
	setActive(arg_31_0.defaultDestroyBtn, false)
	setActive(arg_31_0.defaultReplaceBtn, true)
	setActive(arg_31_0.defaultUnloadBtn, true)
	setActive(arg_31_0.defaultRevertBtn, false)

	local var_31_0 = arg_31_0.defaultEquipTF:Find("head")

	setActive(var_31_0, arg_31_0.shipVO)

	if arg_31_0.shipVO then
		setImageSprite(findTF(var_31_0, "Image"), LoadSprite("qicon/" .. arg_31_0.shipVO:getPainting()))
	end

	if arg_31_0.defaultTransformTipBar then
		setActive(arg_31_0.defaultTransformTipBar, false)
	end
end

function var_0_0.updateOperation3(arg_32_0)
	triggerToggle(arg_32_0.toggles.replacePanel, true)

	local var_32_0 = arg_32_0.shipVO:getEquip(arg_32_0.contextData.pos)

	if var_32_0 then
		local var_32_1 = var_32_0:GetPropertiesInfo()
		local var_32_2 = arg_32_0.equipmentVO:GetPropertiesInfo()

		if EquipType.getCompareGroup(var_32_0.configId) == EquipType.getCompareGroup(arg_32_0.equipmentVO.configId) then
			Equipment.InsertAttrsCompare(var_32_1.attrs, var_32_2.attrs, arg_32_0.shipVO)
		end

		arg_32_0:updateEquipmentPanel(arg_32_0.replaceSrcEquipTF, var_32_0, var_32_1)
		arg_32_0:updateEquipmentPanel(arg_32_0.replaceDstEquipTF, arg_32_0.equipmentVO, var_32_2)
	else
		arg_32_0:updateEquipmentPanel(arg_32_0.replaceSrcEquipTF, var_32_0)
		arg_32_0:updateEquipmentPanel(arg_32_0.replaceDstEquipTF, arg_32_0.equipmentVO)
	end

	local var_32_3 = arg_32_0.replaceDstEquipTF:Find("head")

	setActive(var_32_3, arg_32_0.oldShipVO)

	if arg_32_0.oldShipVO then
		setImageSprite(findTF(var_32_3, "Image"), LoadSprite("qicon/" .. arg_32_0.oldShipVO:getPainting()))
	end
end

function var_0_0.updateOperation4(arg_33_0)
	triggerToggle(arg_33_0.toggles.displayPanel, true)
	arg_33_0:updateEquipmentPanel(arg_33_0.displayEquipTF, arg_33_0.equipmentVO)
	setActive(arg_33_0.displayMoveBtn, arg_33_0.shipVO)

	local var_33_0 = arg_33_0.displayEquipTF:Find("head")

	setActive(var_33_0, arg_33_0.shipVO)

	if arg_33_0.shipVO then
		setImageSprite(findTF(var_33_0, "Image"), LoadSprite("qicon/" .. arg_33_0.shipVO:getPainting()))
	end

	arg_33_0:UpdateTransformTipBar(arg_33_0.equipmentVO)
end

function var_0_0.updateRevertPanel(arg_34_0)
	local var_34_0 = arg_34_0.equipmentVO:GetRootEquipment()
	local var_34_1 = arg_34_0.equipmentVO:GetPropertiesInfo()
	local var_34_2 = var_34_0:GetPropertiesInfo()

	Equipment.InsertAttrsCompare(var_34_1.attrs, var_34_2.attrs, arg_34_0.shipVO)
	arg_34_0:updateEquipmentPanel(arg_34_0.revertEquipTF, var_34_0, var_34_2, arg_34_0.equipmentVO:getConfig("level"))
	arg_34_0:updateOperationAward(arg_34_0.revertAwardContainer, arg_34_0.itemTpl, arg_34_0.equipmentVO:getRevertAwards())
end

function var_0_0.updateDestroyCount(arg_35_0)
	local var_35_0 = arg_35_0.destroyCount

	setText(arg_35_0.destroyValue, var_35_0)

	local var_35_1 = {}
	local var_35_2 = 0
	local var_35_3 = arg_35_0.equipmentVO:getConfig("destory_item") or {}
	local var_35_4 = var_35_2 + (arg_35_0.equipmentVO:getConfig("destory_gold") or 0) * var_35_0

	for iter_35_0, iter_35_1 in ipairs(var_35_3) do
		table.insert(var_35_1, {
			type = DROP_TYPE_ITEM,
			id = iter_35_1[1],
			count = iter_35_1[2] * var_35_0
		})
	end

	table.insert(var_35_1, {
		id = 1,
		type = DROP_TYPE_RESOURCE,
		count = var_35_4
	})
	arg_35_0:updateOperationAward(arg_35_0.destroyBonusList, arg_35_0.destroyBonusItem, var_35_1)
end

function var_0_0.updateOperationAward(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	arg_36_0.awards = arg_36_3

	if arg_36_1.childCount == 0 then
		for iter_36_0 = 1, #arg_36_3 do
			cloneTplTo(arg_36_2, arg_36_1)
		end
	end

	for iter_36_1 = 1, #arg_36_3 do
		local var_36_0 = arg_36_1:GetChild(iter_36_1 - 1)
		local var_36_1 = arg_36_3[iter_36_1]

		updateDrop(var_36_0, var_36_1)
		onButton(arg_36_0, var_36_0, function()
			arg_36_0:emit(var_0_0.ON_DROP, var_36_1)
		end, SFX_PANEL)
		setText(findTF(var_36_0, "name_panel/name"), getText(findTF(var_36_0, "name")))
		setText(findTF(var_36_0, "name_panel/number"), " x " .. getText(findTF(var_36_0, "icon_bg/count")))
		setActive(findTF(var_36_0, "icon_bg/count"), false)
	end
end

function var_0_0.updateEquipmentPanel(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	local var_38_0 = arg_38_1:Find("info")
	local var_38_1 = arg_38_1:Find("empty")

	setActive(var_38_0, arg_38_2)
	setActive(var_38_1, not arg_38_2)

	if arg_38_2 then
		local var_38_2 = findTF(var_38_0, "name")

		setScrollText(findTF(var_38_2, "mask/Text"), arg_38_2:getConfig("name"))
		setActive(findTF(var_38_2, "unique"), arg_38_2:isUnique() and arg_38_0.isShowUnique)

		local var_38_3 = findTF(var_38_0, "equip")

		setImageSprite(findTF(var_38_3, "bg"), GetSpriteFromAtlas("ui/equipmentinfoui_atlas", "equip_bg_" .. EquipmentRarity.Rarity2Print(arg_38_2:getConfig("rarity"))))
		updateEquipment(var_38_3, arg_38_2, {
			noIconColorful = true
		})
		setActive(findTF(var_38_3, "revert_btn"), false)
		setActive(findTF(var_38_3, "slv"), arg_38_4 or arg_38_2:getConfig("level") > 1)
		setText(findTF(var_38_3, "slv/Text"), arg_38_4 and arg_38_4 - 1 or arg_38_2:getConfig("level") - 1)
		setActive(findTF(var_38_3, "slv/next"), arg_38_4)
		setText(findTF(var_38_3, "slv/next/Text"), arg_38_2:getConfig("level") - 1)

		local var_38_4 = var_38_3:Find("tier")

		setActive(var_38_4, arg_38_2)

		local var_38_5 = arg_38_2:getConfig("tech") or 1

		eachChild(var_38_4, function(arg_39_0)
			setActive(arg_39_0, tostring(var_38_5) == arg_39_0.gameObject.name)
		end)
		setImageSprite(findTF(var_38_3, "title"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(arg_38_2:getConfig("type"))))
		setText(var_38_3:Find("speciality/Text"), arg_38_2:getConfig("speciality") ~= "无" and arg_38_2:getConfig("speciality") or i18n1("—"))
		updateEquipInfo(var_38_0:Find("attributes/view/content"), arg_38_3 or arg_38_2:GetPropertiesInfo(), arg_38_2:GetSkill(), arg_38_0.shipVO)
	end
end

function var_0_0.UpdateTransformTipBar(arg_40_0, arg_40_1)
	if not arg_40_0.defaultTransformTipBar then
		return
	end

	local var_40_0 = pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "EquipmentTransformTreeMediator")
	local var_40_1 = EquipmentProxy.GetTransformTargets(Equipment.GetEquipRootStatic(arg_40_1.id))

	setActive(arg_40_0.defaultTransformTipBar, not LOCK_EQUIPMENT_TRANSFORM and var_40_0 and #var_40_1 > 0)

	if isActive(arg_40_0.defaultTransformTipBar) then
		local var_40_2 = pg.equip_upgrade_data

		UIItemList.StaticAlign(arg_40_0.defaultTransformTipBar:Find("list"), arg_40_0.defaultTransformTipBar:Find("list/transformTarget"), #var_40_1, function(arg_41_0, arg_41_1, arg_41_2)
			if arg_41_0 == UIItemList.EventUpdate then
				setActive(arg_41_2:Find("link"), arg_41_1 > 0)

				local var_41_0 = var_40_2[var_40_1[arg_41_1 + 1]]
				local var_41_1 = var_41_0 and var_41_0.target_id

				if not var_41_1 then
					setActive(arg_41_2, false)

					return
				end

				updateDrop(arg_41_2:Find("item"), {
					type = DROP_TYPE_EQUIP,
					id = var_41_1
				})
				onButton(arg_40_0, arg_41_2:Find("item"), function()
					local var_42_0 = CreateShell(arg_40_1)

					if arg_40_0.shipVO then
						var_42_0.shipId = arg_40_0.shipVO.id
						var_42_0.shipPos = arg_40_0.contextData.pos
					end

					arg_40_0:emit(EquipmentInfoMediator.OPEN_LAYER, Context.New({
						mediator = EquipmentTransformMediator,
						viewComponent = EquipmentTransformLayer,
						data = {
							fromStoreHouse = true,
							formulaId = var_40_1[arg_41_1 + 1],
							sourceEquipmentInstance = {
								type = DROP_TYPE_EQUIP,
								id = arg_40_1.id,
								template = var_42_0
							}
						}
					}))
				end, SFX_PANEL)
				arg_41_2:Find("mask/name"):GetComponent("ScrollText"):SetText(Equipment.getConfigData(var_41_1).name)
			end
		end)
	end
end

function var_0_0.cloneSampleTo(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4)
	local var_43_0 = cloneTplTo(arg_43_0.sample, arg_43_1, arg_43_3)

	var_43_0.localPosition = Vector3.New(var_0_0.pos[arg_43_2][1], var_0_0.pos[arg_43_2][2], var_0_0.pos[arg_43_2][3])

	if arg_43_4 then
		var_43_0:SetSiblingIndex(arg_43_4)
	end

	return var_43_0
end

function var_0_0.willExit(arg_44_0)
	arg_44_0.equipDestroyConfirmWindow:Destroy()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_44_0._tf)
end

function var_0_0.onBackPressed(arg_45_0)
	if arg_45_0.equipDestroyConfirmWindow:isShowing() then
		arg_45_0.equipDestroyConfirmWindow:Hide()

		return
	end

	if isActive(arg_45_0.destroyPanel) then
		triggerToggle(arg_45_0.toggles.defaultPanel, true)

		return
	end

	arg_45_0:closeView()
end

return var_0_0
