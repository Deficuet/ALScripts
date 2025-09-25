local var_0_0 = class("EquipmentTransformLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EquipmentTransformUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.layer = arg_2_0:findTF("Adapt")
	arg_2_0.formulaItems = {}
	arg_2_0.formulaItems[1] = arg_2_0.layer:Find("MaterialModule1")
	arg_2_0.formulaItems[2] = arg_2_0.layer:Find("MaterialModule2")
	arg_2_0.formulaItems[3] = arg_2_0.layer:Find("MaterialModule3")
	arg_2_0.sourceEquipItem = arg_2_0.layer:Find("SourceEquip")
	arg_2_0.targetEquipItem = arg_2_0.layer:Find("TargetEquip")
	arg_2_0.consumePanel = arg_2_0.layer:Find("ComposePanel")

	setText(arg_2_0._tf:Find("Adapt/TitleText"), i18n("equipment_upgrade_title"))
	setText(arg_2_0.consumePanel:Find("Consume"), i18n("equipment_upgrade_coin_consume"))
	setText(arg_2_0._tf:Find("Adapt/InfoPanel/StoreCount/OnShip/NameText"), i18n("equipment_upgrade_equipped_tag"))
	setText(arg_2_0._tf:Find("Adapt/InfoPanel/StoreCount/Free/NameText"), i18n("equipment_upgrade_spare_tag"))

	local var_2_0 = arg_2_0._tf:Find("Adapt/InfoPanel/Viewport/Content")
	local var_2_1 = var_2_0:Find("attr_tpl")

	setActive(var_2_1, false)
	setActive(var_2_1:Find("subs"), false)

	local var_2_2 = Instantiate(var_2_1).transform

	var_2_2.name = "attr"

	setParent(var_2_2, var_2_0:Find("skill"))
	var_2_2:SetAsFirstSibling()

	local var_2_3 = Instantiate(var_2_1).transform

	var_2_3.name = "attr"

	setParent(var_2_3, var_2_0:Find("part"))
	var_2_3:SetAsFirstSibling()

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.SetEnv(arg_3_0, arg_3_1)
	arg_3_0.env = arg_3_1
end

function var_0_0.UpdatePlayer(arg_4_0, arg_4_1)
	arg_4_0.player = arg_4_1

	arg_4_0:UpdateConsumeComparer()
end

function var_0_0.UpdateConsumeComparer(arg_5_0)
	local var_5_0 = 0
	local var_5_1 = 0
	local var_5_2 = true

	if arg_5_0.contextData.sourceEquipmentInstance then
		var_5_2, var_5_0, var_5_1 = EquipmentTransformUtil.CheckTransformEnoughGold({
			arg_5_0.contextData.formulaId
		}, arg_5_0.contextData.sourceEquipmentInstance)
	end

	local var_5_3 = setColorStr(var_5_0, var_5_2 and COLOR_WHITE or COLOR_RED)

	if var_5_1 > 0 then
		var_5_3 = var_5_3 .. setColorStr(" + " .. var_5_1, var_5_2 and COLOR_GREEN or COLOR_RED)
	end

	arg_5_0.consumePanel:Find("GoldText"):GetComponent(typeof(Text)).text = var_5_3
end

function var_0_0.UpdateFormula(arg_6_0, arg_6_1)
	if arg_6_1 == arg_6_0.contextData.formulaId then
		return
	end

	assert(arg_6_1 and arg_6_1 > 0, "target formulaId is invalid")

	arg_6_0.contextData.formulaId = arg_6_1

	local var_6_0 = pg.equip_upgrade_data[arg_6_1]

	arg_6_0.contextData.formula = var_6_0
	arg_6_0.equipmentSourceId = var_6_0.upgrade_from
	arg_6_0.equipmentTarget = var_6_0.target_id
	arg_6_0.transformMaterials = var_6_0.material_consume

	arg_6_0:UpdateConsumeComparer()

	local var_6_1 = arg_6_0.env.tracebackHelper:GetEquipmentTransformCandicates(arg_6_0.equipmentSourceId)
	local var_6_2

	if arg_6_0.contextData.sourceEquipmentInstance then
		var_6_2 = _.detect(var_6_1, function(arg_7_0)
			return EquipmentTransformUtil.SameDrop(arg_7_0, arg_6_0.contextData.sourceEquipmentInstance)
		end)
	end

	arg_6_0.contextData.sourceEquipmentInstance = var_6_2

	PlayerPrefs.SetInt("ShowTransformTip_" .. arg_6_0.equipmentTarget, 1)
	PlayerPrefs.Save()
	arg_6_0:emit(EquipmentTransformMediator.UPDATE_NEW_FLAG, arg_6_0.equipmentTarget)
	setActive(arg_6_0.layer:Find("SwitchButton"), #EquipmentProxy.GetTransformSources(arg_6_0.equipmentTarget) > 1)
	arg_6_0:UpdatePage()
end

function var_0_0.UpdatePage(arg_8_0)
	arg_8_0:UpdateSourceEquipmentPaths()
	arg_8_0:UpdateFormulaItems()
	arg_8_0:UpdateTargetInfo()
	arg_8_0:UpdateSourceInfo()
end

function var_0_0.UpdateSourceEquipmentPaths(arg_9_0)
	local var_9_0 = arg_9_0.env.tracebackHelper:GetSortedEquipTraceBack(arg_9_0.equipmentSourceId)

	arg_9_0.hasRoot = _.any(var_9_0, function(arg_10_0)
		local var_10_0 = arg_10_0.candicates

		return var_10_0 and #var_10_0 > 0 and EquipmentTransformUtil.CheckTransformFormulasSucceed(arg_10_0.formulas, var_10_0[#var_10_0])
	end)

	local var_9_1 = arg_9_0.env.tracebackHelper:GetEquipmentTransformCandicates(arg_9_0.equipmentSourceId)

	arg_9_0.childsCanUse = _.any(var_9_1, function(arg_11_0)
		if arg_11_0.type == DROP_TYPE_ITEM then
			return arg_11_0.template.count >= arg_11_0.composeCfg.material_num
		elseif arg_11_0.type == DROP_TYPE_EQUIP then
			return arg_11_0.template.count > 0
		end
	end)
end

function var_0_0.CheckEnoughMaterials(arg_12_0)
	if not arg_12_0.contextData.formula then
		return
	end

	if not arg_12_0.contextData.sourceEquipmentInstance then
		return
	end

	local var_12_0 = arg_12_0.contextData.sourceEquipmentInstance
	local var_12_1, var_12_2 = EquipmentTransformUtil.CheckTransformFormulasSucceed({
		arg_12_0.contextData.formulaId
	}, var_12_0)

	if not var_12_1 then
		return false, var_12_2
	end

	return true
end

function var_0_0.UpdateFormulaItems(arg_13_0)
	for iter_13_0, iter_13_1 in ipairs(arg_13_0.formulaItems) do
		local var_13_0 = iter_13_1:Find("Item")
		local var_13_1 = arg_13_0.transformMaterials[iter_13_0]

		setActive(iter_13_1, var_13_1)

		if var_13_1 then
			local var_13_2 = {
				type = DROP_TYPE_ITEM,
				id = var_13_1[1],
				count = var_13_1[2]
			}

			updateDrop(var_13_0, var_13_2)
			onButton(arg_13_0, var_13_0, function()
				arg_13_0:emit(var_0_0.ON_DROP, var_13_2)
			end, SFX_PANEL)

			local var_13_3 = getProxy(BagProxy):getItemCountById(var_13_1[1]) or 0

			setText(iter_13_1:Find("NumText"), setColorStr(var_13_3, var_13_3 < var_13_1[2] and COLOR_RED or "#000F") .. "/" .. var_13_1[2])

			local var_13_4 = arg_13_0.equipmentSourceId == 0

			setActive(iter_13_1:Find("Line"), not var_13_4)
			setActive(iter_13_1:Find("Line2"), var_13_4)
		end
	end
end

function var_0_0.UpdateTargetInfo(arg_15_0)
	updateDrop(arg_15_0.targetEquipItem:Find("Item"), {
		id = arg_15_0.equipmentTarget,
		type = DROP_TYPE_EQUIP
	})
	arg_15_0.targetEquipItem:Find("Mask/NameText"):GetComponent("ScrollText"):SetText(Equipment.getConfigData(arg_15_0.equipmentTarget).name)

	local var_15_0 = arg_15_0.layer:Find("InfoPanel")
	local var_15_1 = arg_15_0.env.tracebackHelper:GetEquipmentTransformCandicates(arg_15_0.equipmentTarget)
	local var_15_2 = 0
	local var_15_3 = 0

	for iter_15_0, iter_15_1 in ipairs(var_15_1) do
		if iter_15_1.type == DROP_TYPE_EQUIP then
			if iter_15_1.template.shipId then
				var_15_2 = var_15_2 + iter_15_1.template.count
			else
				var_15_3 = var_15_3 + iter_15_1.template.count
			end
		end
	end

	setText(var_15_0:Find("StoreCount/OnShip/ValueText"), var_15_2)
	setText(var_15_0:Find("StoreCount/Free/ValueText"), var_15_3)

	local var_15_4 = Equipment.New({
		id = arg_15_0.equipmentTarget
	})
	local var_15_5 = var_15_0:Find("Viewport/Content")

	updateEquipInfo(var_15_5, var_15_4:GetPropertiesInfo(), var_15_4:GetSkill())
	Canvas.ForceUpdateCanvases()
	var_0_0.FitTextBGSize(var_15_5:Find("attrs"))
	var_0_0.FitTextBGSize(var_15_5:Find("weapon"))
	var_0_0.FitTextBGSize(var_15_5:Find("equip_info"))
end

function var_0_0.FitTextBGSize(arg_16_0)
	for iter_16_0 = 0, arg_16_0.childCount - 1 do
		local var_16_0 = arg_16_0:GetChild(iter_16_0)
		local var_16_1 = var_16_0:Find("base/NameBG").sizeDelta

		var_16_1.x = var_16_0:Find("base/name").rect.width + 18
		var_16_0:Find("base/NameBG").sizeDelta = var_16_1

		var_0_0.FitTextBGSize(var_16_0:Find("subs"))
	end
end

function var_0_0.UpdateSourceInfo(arg_17_0)
	local var_17_0 = arg_17_0.contextData.sourceEquipmentInstance
	local var_17_1 = var_17_0 or {
		id = arg_17_0.equipmentSourceId,
		type = DROP_TYPE_EQUIP
	}
	local var_17_2 = arg_17_0.equipmentSourceId == 0

	setActive(arg_17_0.sourceEquipItem, not var_17_2)

	if var_17_2 then
		return
	end

	updateDrop(arg_17_0.sourceEquipItem:Find("Item"), var_17_1)

	local var_17_3 = arg_17_0.sourceEquipItem:Find("Item/icon_bg/count")
	local var_17_4 = ""

	if var_17_0 and var_17_0.type == DROP_TYPE_ITEM then
		local var_17_5 = var_17_0.template.count >= var_17_0.composeCfg.material_num

		var_17_4 = setColorStr(math.min(var_17_0.template.count, var_17_0.composeCfg.material_num), var_17_5 and COLOR_WHITE or COLOR_RED)
	end

	setText(var_17_3, var_17_4)
	arg_17_0.sourceEquipItem:Find("Mask/NameText"):GetComponent("ScrollText"):SetText(Equipment.getConfigData(arg_17_0.equipmentSourceId).name)
	setActive(arg_17_0.sourceEquipItem:Find("craftable"), arg_17_0.hasRoot)
	onButton(arg_17_0, arg_17_0.sourceEquipItem:Find("craftable"), function()
		arg_17_0:emit(EquipmentTransformMediator.OPEN_LAYER, Context.New({
			mediator = EquipmentTraceBackMediator,
			viewComponent = EquipmentTraceBackLayer,
			data = {
				TargetEquipmentId = arg_17_0.equipmentSourceId
			}
		}))
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.sourceEquipItem:Find("Item"), function()
		if arg_17_0.childsCanUse then
			arg_17_0:emit(EquipmentTransformMediator.SELECT_TRANSFORM_FROM_STOREHOUSE, arg_17_0.equipmentSourceId)
		end
	end, SFX_PANEL)

	local var_17_6 = arg_17_0.sourceEquipItem:Find("Status")

	if not arg_17_0.childsCanUse then
		setImageSprite(var_17_6, LoadSprite("ui/equipmenttransformui_atlas", "noown"))
		setActive(var_17_6, true)
	elseif not var_17_0 then
		setImageSprite(var_17_6, LoadSprite("ui/equipmenttransformui_atlas", "unselect"))
		setActive(var_17_6, true)
	else
		setActive(var_17_6, false)
	end

	local var_17_7 = var_17_0 and var_17_0.template.shipId

	setActive(arg_17_0.sourceEquipItem:Find("EquipShip"), var_17_7)

	if var_17_7 then
		local var_17_8 = getProxy(BayProxy):getShipById(var_17_7)

		arg_17_0.loader:GetSprite("qicon/" .. var_17_8:getPainting(), "", arg_17_0.sourceEquipItem:Find("EquipShip/Image"))
	end
end

function var_0_0.didEnter(arg_20_0)
	onButton(arg_20_0, arg_20_0._tf:Find("BG"), function()
		arg_20_0:closeView()
	end)
	onButton(arg_20_0, arg_20_0.consumePanel:Find("ComposeBtn"), function()
		local var_22_0 = arg_20_0.contextData.sourceEquipmentInstance

		if arg_20_0.equipmentSourceId ~= 0 and not var_22_0 then
			if arg_20_0.childsCanUse then
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_quick_interface_feedback_source_chosen"))

				return
			elseif arg_20_0.hasRoot then
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_feedback_equipment_can_be_produced"))

				return
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_feedback_lack_of_equipment"))

				return
			end
		end

		if not arg_20_0:CheckEnoughMaterials() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_feedback_lack_of_materials"))

			return
		end

		arg_20_0:emit(EquipmentTransformMediator.TRANSFORM_EQUIP, var_22_0, arg_20_0.contextData.formulaId)
	end, SFX_PANEL)
	onButton(arg_20_0, arg_20_0.layer:Find("OverviewBtn"), function()
		arg_20_0:emit(EquipmentTransformMediator.OPEN_TRANSFORM_TREE, arg_20_0.equipmentTarget)
	end, SFX_CANCEL)
	onButton(arg_20_0, arg_20_0.layer:Find("SwitchButton"), function()
		local var_24_0 = EquipmentProxy.GetTransformSources(arg_20_0.equipmentTarget)
		local var_24_1 = table.indexof(var_24_0, arg_20_0.contextData.formulaId)
		local var_24_2

		var_24_2 = var_24_1 and var_24_1 % #var_24_0 + 1 or 1
		arg_20_0.contextData.sourceEquipmentInstance = nil

		arg_20_0:UpdateFormula(var_24_0[var_24_2])
	end, SFX_PANEL)
	onButton(arg_20_0, arg_20_0.layer:Find("HelpBtn"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.equipment_upgrade_help.tip
		})
	end, SFX_PANEL)
	assert(arg_20_0.contextData.formulaId)

	local var_20_0 = arg_20_0.contextData.formulaId

	arg_20_0.contextData.formulaId = nil

	arg_20_0:UpdateFormula(var_20_0)

	local var_20_1, var_20_2 = getProxy(ContextProxy):getContextByMediator(EquipmentTransformMediator)
	local var_20_3 = var_20_2 and pg.m02:retrieveMediator(var_20_2.mediator.__cname)

	setActive(arg_20_0.layer:Find("OverviewBtn"), var_20_3.class ~= EquipmentTransformTreeMediator)
	pg.UIMgr.GetInstance():BlurPanel(arg_20_0._tf)
end

function var_0_0.willExit(arg_26_0)
	arg_26_0.loader:Clear()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_26_0._tf)
end

return var_0_0
