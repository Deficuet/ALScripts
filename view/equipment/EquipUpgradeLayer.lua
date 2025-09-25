local var_0_0 = class("EquipUpgradeLayer", import("..base.BaseUI"))

var_0_0.CHAT_DURATION_TIME = 0.3

function var_0_0.getUIName(arg_1_0)
	return "EquipUpgradeUI"
end

function var_0_0.setItems(arg_2_0, arg_2_1)
	arg_2_0.itemVOs = arg_2_1
end

function var_0_0.init(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)

	arg_3_0.mainPanel = arg_3_0:findTF("main")
	arg_3_0.finishPanel = arg_3_0:findTF("finish_panel")

	setActive(arg_3_0.mainPanel, true)
	setActive(arg_3_0.finishPanel, false)

	arg_3_0.equipmentList = arg_3_0:findTF("panel/equipment_list", arg_3_0.mainPanel)
	arg_3_0.equipmentContain = arg_3_0:findTF("equipments", arg_3_0.equipmentList)
	arg_3_0.equipmentTpl = arg_3_0:getTpl("equiptpl", arg_3_0.equipmentContain)

	setActive(arg_3_0.equipmentList, false)

	arg_3_0.equipmentPanel = arg_3_0:findTF("panel/equipment_panel", arg_3_0.mainPanel)
	arg_3_0.materialPanel = arg_3_0:findTF("panel/material_panel", arg_3_0.mainPanel)
	arg_3_0.startBtn = arg_3_0:findTF("start_btn", arg_3_0.materialPanel)
	arg_3_0.overLimit = arg_3_0:findTF("materials/limit", arg_3_0.materialPanel)

	setText(arg_3_0:findTF("text", arg_3_0.overLimit), i18n("equipment_upgrade_overlimit"))

	arg_3_0.materialsContain = arg_3_0:findTF("materials/materials", arg_3_0.materialPanel)
	arg_3_0.uiMain = pg.UIMgr.GetInstance().UIMain
	arg_3_0.Overlay = pg.UIMgr.GetInstance().OverlayMain
end

function var_0_0.updateRes(arg_4_0, arg_4_1)
	arg_4_0.playerVO = arg_4_1
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("bg"), function()
		arg_5_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	arg_5_0:updateAll()
end

function var_0_0.updateAll(arg_7_0)
	setActive(arg_7_0.equipmentList, arg_7_0.contextData.shipVO)

	if arg_7_0.contextData.shipVO then
		arg_7_0:displayEquipments()

		if arg_7_0.contextData.pos then
			triggerButton(arg_7_0.equipmentTFs[arg_7_0.contextData.pos])
		else
			triggerButton(arg_7_0.equipmentContain:GetChild(0))
		end
	else
		arg_7_0:updateEquipment()
		arg_7_0:updateMaterials()
	end
end

function var_0_0.displayEquipments(arg_8_0)
	arg_8_0.equipmentTFs = {}

	removeAllChildren(arg_8_0.equipmentContain)

	local var_8_0 = arg_8_0.contextData.shipVO

	for iter_8_0, iter_8_1 in ipairs(var_8_0.equipments) do
		if iter_8_1 then
			local var_8_1 = cloneTplTo(arg_8_0.equipmentTpl, arg_8_0.equipmentContain)

			updateEquipment(var_8_1, iter_8_1)

			local var_8_2 = var_8_1:Find("tip")

			setActive(var_8_2, false)

			if arg_8_0:isMaterialEnough(iter_8_1) and iter_8_1:getConfig("next") ~= 0 then
				setActive(var_8_2, true)
				blinkAni(var_8_2, 0.5)
			end

			onButton(arg_8_0, var_8_1, function()
				local var_9_0 = arg_8_0.contextData.pos

				if var_9_0 then
					setActive(arg_8_0.equipmentTFs[var_9_0]:Find("selected"), false)
					setActive(arg_8_0.equipmentTFs[var_9_0]:Find("tip"), arg_8_0:isMaterialEnough(var_8_0:getEquip(var_9_0)) and var_8_0:getEquip(var_9_0):getConfig("next") ~= 0)
				end

				arg_8_0.contextData.pos = iter_8_0
				arg_8_0.contextData.equipmentId = iter_8_1.id
				arg_8_0.contextData.equipmentVO = iter_8_1

				local var_9_1 = arg_8_0.contextData.pos

				setActive(arg_8_0.equipmentTFs[var_9_1]:Find("selected"), true)
				setActive(arg_8_0.equipmentTFs[var_9_1]:Find("tip"), false)
				arg_8_0:updateEquipment()
				arg_8_0:updateMaterials()
			end, SFX_PANEL)

			arg_8_0.equipmentTFs[iter_8_0] = var_8_1
		end
	end
end

function var_0_0.isMaterialEnough(arg_10_0, arg_10_1)
	local var_10_0 = true
	local var_10_1 = arg_10_1:getConfig("trans_use_item")

	if not var_10_1 then
		return false
	end

	for iter_10_0 = 1, #var_10_1 do
		local var_10_2 = var_10_1[iter_10_0][1]

		if defaultValue(arg_10_0.itemVOs[var_10_2], {
			count = 0
		}).count < var_10_1[iter_10_0][2] then
			var_10_0 = false
		end
	end

	return var_10_0
end

function var_0_0.updateEquipment(arg_11_0)
	local var_11_0 = arg_11_0.contextData.equipmentVO

	arg_11_0.contextData.equipmentId = var_11_0.id

	local var_11_1 = var_11_0:getConfig("next") > 0 and var_11_0:MigrateTo(var_11_0:getConfig("next")) or nil

	arg_11_0:updateAttrs(arg_11_0.equipmentPanel:Find("view/content"), var_11_0, var_11_1)
	changeToScrollText(arg_11_0.equipmentPanel:Find("name_container"), var_11_0:getConfig("name"))
	setActive(findTF(arg_11_0.equipmentPanel, "unique"), var_11_0:isUnique())

	local var_11_2 = arg_11_0:findTF("equiptpl", arg_11_0.equipmentPanel)

	updateEquipment(var_11_2, var_11_0)
end

local function var_0_1(arg_12_0)
	local var_12_0 = _.detect(arg_12_0.sub, function(arg_13_0)
		return arg_13_0.type == AttributeType.Damage
	end)

	arg_12_0.sub = {
		var_12_0
	}
end

local function var_0_2(arg_14_0)
	local var_14_0 = _.detect(arg_14_0.sub, function(arg_15_0)
		return arg_15_0.type == AttributeType.Corrected
	end)

	arg_14_0.sub = {
		var_14_0
	}
end

function var_0_0.updateAttrs(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_2:GetPropertiesInfo()

	for iter_16_0 = 1, #var_16_0.weapon.sub do
		var_0_1(var_16_0.weapon.sub[iter_16_0])
	end

	var_0_2(var_16_0.equipInfo)

	var_16_0.equipInfo.lock_open = true

	if arg_16_3 then
		local var_16_1 = arg_16_3:GetPropertiesInfo()

		Equipment.InsertAttrsUpgrade(var_16_0.attrs, var_16_1.attrs)

		local var_16_2 = arg_16_2:GetSkill()
		local var_16_3 = arg_16_3:GetSkill()

		if checkExist(var_16_2, {
			"name"
		}) ~= checkExist(var_16_3, {
			"name"
		}) then
			local var_16_4 = {
				lock_open = true,
				name = i18n("skill"),
				value = setColorStr(checkExist(var_16_2, {
					"name"
				}) or i18n("equip_info_25"), "#FFDE00FF"),
				sub = {
					{
						name = i18n("equip_info_26"),
						value = setColorStr(checkExist(var_16_3, {
							"name"
						}) or i18n("equip_info_25"), "#FFDE00FF")
					}
				}
			}

			table.insert(var_16_0.attrs, var_16_4)
		end

		if #var_16_1.weapon.sub > #var_16_0.weapon.sub then
			for iter_16_1 = #var_16_0.weapon.sub, #var_16_1.weapon.sub do
				table.insert(var_16_0.weapon.sub, {
					name = i18n("equip_info_25"),
					sub = {}
				})
			end
		end

		for iter_16_2 = #var_16_0.weapon.sub, 1, -1 do
			local var_16_5 = var_16_0.weapon.sub[iter_16_2]
			local var_16_6 = var_16_1.weapon.sub[iter_16_2]

			if var_16_6 then
				var_0_1(var_16_1.weapon.sub[iter_16_2])
			else
				var_16_6 = {
					name = i18n("equip_info_25"),
					sub = {}
				}
			end

			if var_16_5.name ~= var_16_6.name then
				var_16_5.sub = {
					{
						name = i18n("equip_info_27"),
						value = var_16_6.name
					}
				}
			else
				Equipment.InsertAttrsUpgrade(var_16_5.sub, var_16_6.sub)
			end

			if #var_16_5.sub == 0 then
				table.remove(var_16_0.weapon.sub, iter_16_2)

				if var_16_1.weapon.sub[iter_16_2] then
					table.remove(var_16_1.weapon.sub, iter_16_2)
				end
			end
		end

		var_0_2(var_16_1.equipInfo)
		Equipment.InsertAttrsUpgrade(var_16_0.equipInfo.sub, var_16_1.equipInfo.sub)
	end

	updateEquipUpgradeInfo(arg_16_1, var_16_0, arg_16_0.contextData.shipVO)
end

function var_0_0.updateMaterials(arg_17_0)
	local var_17_0 = true
	local var_17_1 = arg_17_0.contextData.equipmentVO
	local var_17_2 = var_17_1:getConfig("trans_use_item")
	local var_17_3 = var_17_1:getConfig("trans_use_gold")
	local var_17_4 = defaultValue(var_17_2, {})
	local var_17_5
	local var_17_6 = 0

	for iter_17_0 = 1, 3 do
		local var_17_7 = arg_17_0.materialsContain:GetChild(iter_17_0 - 1)

		setActive(findTF(var_17_7, "off"), not var_17_4[iter_17_0])
		setActive(findTF(var_17_7, "equiptpl"), var_17_4[iter_17_0])

		if var_17_4[iter_17_0] then
			local var_17_8 = var_17_4[iter_17_0][1]
			local var_17_9 = findTF(var_17_7, "equiptpl")

			updateItem(var_17_9, Item.New({
				id = var_17_8
			}))
			onButton(arg_17_0, var_17_9, function()
				arg_17_0:emit(EquipUpgradeMediator.ON_ITEM, var_17_8)
			end, SFX_PANEL)

			local var_17_10 = defaultValue(arg_17_0.itemVOs[var_17_8], {
				count = 0
			})
			local var_17_11 = var_17_10.count .. "/" .. var_17_4[iter_17_0][2]

			if var_17_10.count < var_17_4[iter_17_0][2] then
				var_17_11 = setColorStr(var_17_10.count, COLOR_RED) .. "/" .. var_17_4[iter_17_0][2]
				var_17_0 = false
				var_17_5 = var_17_4[iter_17_0]
			end

			local var_17_12 = findTF(var_17_9, "icon_bg/count")

			setActive(var_17_12, true)
			setText(var_17_12, var_17_11)
			onButton(arg_17_0, var_17_9:Find("click"), function()
				setActive(var_17_9:Find("click"), false)

				var_17_6 = var_17_6 - 1
			end, SFX_PANEL)
			setActive(var_17_9:Find("click"), var_17_1:getConfig("level") > 10)

			var_17_6 = var_17_6 + (var_17_1:getConfig("level") > 10 and 1 or 0)
		end
	end

	setText(arg_17_0:findTF("cost/consume", arg_17_0.materialPanel), var_17_3)
	setActive(arg_17_0.startBtn, var_17_4)

	local var_17_13 = Equipment.canUpgrade(var_17_1.configId)

	setActive(arg_17_0.materialsContain, var_17_13)
	setActive(arg_17_0.overLimit, not var_17_13)
	onButton(arg_17_0, arg_17_0.startBtn, function()
		if not var_17_0 then
			if not ItemTipPanel.ShowItemTipbyID(var_17_5[1]) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_shipUpgradeLayer2_noMaterail"))
			end

			return
		end

		if var_17_6 > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_costcheck_error"))

			return
		end

		if arg_17_0.playerVO.gold < var_17_3 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					var_17_3 - arg_17_0.playerVO.gold,
					var_17_3
				}
			})

			return
		end

		arg_17_0:updateMaterials()
		arg_17_0:emit(EquipUpgradeMediator.EQUIPMENT_UPGRDE)
	end, SFX_UI_DOCKYARD_REINFORCE)
	setButtonEnabled(arg_17_0.startBtn, var_17_13)
end

function var_0_0.upgradeFinish(arg_21_0, arg_21_1, arg_21_2)
	setActive(arg_21_0.mainPanel, false)
	setActive(arg_21_0.finishPanel, true)
	onButton(arg_21_0, arg_21_0.finishPanel:Find("bg"), function()
		setActive(arg_21_0.mainPanel, true)
		setActive(arg_21_0.finishPanel, false)
	end, SFX_CANCEL)
	changeToScrollText(arg_21_0.finishPanel:Find("frame/equipment_panel/name_container"), arg_21_2:getConfig("name"))
	setActive(findTF(arg_21_0.finishPanel, "frame/equipment_panel/unique"), arg_21_2:isUnique())

	local var_21_0 = arg_21_0:findTF("frame/equipment_panel/equiptpl", arg_21_0.finishPanel)

	updateEquipment(var_21_0, arg_21_2)
	arg_21_0:updateAttrs(arg_21_0:findTF("frame/equipment_panel/view/content", arg_21_0.finishPanel), arg_21_1, arg_21_2)
end

function var_0_0.willExit(arg_23_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_23_0._tf)
end

return var_0_0
