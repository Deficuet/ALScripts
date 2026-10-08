local var_0_0 = class("SpWeaponInfoLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SpWeaponInfoUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/equipmentinfoui_atlas",
		"equiptype",
		"weaponframes",
		"shiptype"
	}

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))

	return var_2_0
end

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
var_0_0.TYPE_DEFAULT = 1
var_0_0.TYPE_SHIP = 2
var_0_0.TYPE_REPLACE = 3
var_0_0.TYPE_DISPLAY = 4
var_0_0.SHOW_UNIQUE = {
	1,
	2,
	3,
	4
}

function var_0_0.init(arg_3_0)
	local var_3_0 = {
		"default",
		"replace",
		"display"
	}

	arg_3_0.toggles = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		arg_3_0[iter_3_1 .. "Panel"] = arg_3_0._tf:Find(iter_3_1)
		arg_3_0.toggles[iter_3_1 .. "Panel"] = arg_3_0._tf:Find("toggle_controll/" .. iter_3_1)
	end

	Canvas.ForceUpdateCanvases()

	arg_3_0.sample = arg_3_0._tf:Find("sample")

	setActive(arg_3_0.sample, false)

	arg_3_0.txtQuickEnable = findTF(arg_3_0._tf, "txtQuickEnable")

	setText(arg_3_0.txtQuickEnable, i18n("ship_equip_check"))
	setText(arg_3_0._tf:Find("sample/empty/Text"), i18n("spweapon_ui_empty"))
end

function var_0_0.setEquipment(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.equipmentVO = arg_4_1
	arg_4_0.oldEquipmentVO = arg_4_2
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

function var_0_0.didEnter(arg_9_0)
	setActive(arg_9_0.txtQuickEnable, arg_9_0.contextData.quickFlag or false)

	local var_9_0 = defaultValue(arg_9_0.contextData.type, var_0_0.TYPE_DEFAULT)

	arg_9_0.isShowUnique = table.contains(var_0_0.SHOW_UNIQUE, var_9_0)

	onButton(arg_9_0, arg_9_0._tf:Find("bg"), function()
		arg_9_0:closeView()
	end, SOUND_BACK)
	arg_9_0:initAndSetBtn(var_9_0)

	if var_9_0 == var_0_0.TYPE_DEFAULT then
		arg_9_0:updateOperation1()
	elseif var_9_0 == var_0_0.TYPE_SHIP then
		arg_9_0:updateOperation2()
	elseif var_9_0 == var_0_0.TYPE_REPLACE then
		arg_9_0:updateOperation3()
	elseif var_9_0 == var_0_0.TYPE_DISPLAY then
		arg_9_0:updateOperation4()
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_9_0._tf, {
		staticBlur = true
	})
end

local var_0_1 = {
	{
		"Enhance",
		"msgbox_text_noPos_intensify"
	},
	{
		"Replace",
		"msgbox_text_replace"
	},
	{
		"Unload",
		"msgbox_text_unload"
	},
	{
		"Modify",
		"msgbox_text_modify"
	}
}

function var_0_0.initAndSetBtn(arg_11_0, arg_11_1)
	if arg_11_1 == var_0_0.TYPE_DEFAULT or arg_11_1 == var_0_0.TYPE_SHIP then
		arg_11_0.defaultEquipTF = arg_11_0.defaultPanel:Find("equipment") or arg_11_0:cloneSampleTo(arg_11_0.defaultPanel, var_0_0.Middle, "equipment")

		table.Foreach(var_0_1, function(arg_12_0, arg_12_1)
			local var_12_0 = arg_11_0.defaultPanel:Find("actions/action_button_" .. arg_12_0)

			arg_11_0["default" .. arg_12_1[1] .. "Btn"] = var_12_0

			setText(var_12_0:GetChild(0), i18n(arg_12_1[2]))
		end)
		onButton(arg_11_0, arg_11_0.defaultReplaceBtn, function()
			arg_11_0:emit(SpWeaponInfoMediator.ON_CHANGE)
		end, SFX_PANEL)
		onButton(arg_11_0, arg_11_0.defaultEnhanceBtn, function()
			arg_11_0:emit(SpWeaponInfoMediator.ON_INTENSIFY)
		end, SFX_PANEL)
		onButton(arg_11_0, arg_11_0.defaultUnloadBtn, function()
			arg_11_0:emit(SpWeaponInfoMediator.ON_UNEQUIP)
		end, SFX_UI_DOCKYARD_EQUIPOFF)
		onButton(arg_11_0, arg_11_0.defaultModifyBtn, function()
			arg_11_0:emit(SpWeaponInfoMediator.ON_MODIFY)
		end, SFX_PANEL)
	elseif arg_11_1 == var_0_0.TYPE_REPLACE then
		arg_11_0.replaceSrcEquipTF = arg_11_0.replacePanel:Find("equipment") or arg_11_0:cloneSampleTo(arg_11_0.replacePanel, var_0_0.Left, "equipment")
		arg_11_0.replaceDstEquipTF = arg_11_0.replacePanel:Find("equipment_on_ship") or arg_11_0:cloneSampleTo(arg_11_0.replacePanel, var_0_0.Right, "equipment_on_ship")
		arg_11_0.replaceCancelBtn = arg_11_0.replacePanel:Find("actions/cancel_button")
		arg_11_0.replaceConfirmBtn = arg_11_0.replacePanel:Find("actions/action_button_2")

		setText(arg_11_0.replaceConfirmBtn:Find("label"), i18n("msgbox_text_confirm"))
		setText(arg_11_0.replaceCancelBtn:Find("label"), i18n("msgbox_text_cancel"))
		onButton(arg_11_0, arg_11_0.replaceCancelBtn, function()
			arg_11_0:closeView()
		end, SFX_CANCEL)
		onButton(arg_11_0, arg_11_0.replaceConfirmBtn, function()
			if arg_11_0.contextData.quickCallback then
				arg_11_0.contextData.quickCallback()
				arg_11_0:closeView()
			else
				arg_11_0:emit(SpWeaponInfoMediator.ON_EQUIP)
			end
		end, SFX_UI_DOCKYARD_EQUIPADD)
	elseif arg_11_1 == var_0_0.TYPE_DISPLAY then
		arg_11_0.displayEquipTF = arg_11_0.displayPanel:Find("equipment") or arg_11_0:cloneSampleTo(arg_11_0.displayPanel, var_0_0.Middle, "equipment")
		arg_11_0.displayMoveBtn = arg_11_0.displayPanel:Find("actions/move_button")

		setText(arg_11_0.displayMoveBtn:Find("label"), i18n("msgbox_text_equipdetail"))
		onButton(arg_11_0, arg_11_0.displayMoveBtn, function()
			arg_11_0:emit(SpWeaponInfoMediator.ON_MOVE, arg_11_0.shipVO.id)
		end)
	end
end

function var_0_0.updateOperation1(arg_20_0)
	triggerToggle(arg_20_0.toggles.defaultPanel, true)

	if not arg_20_0.equipmentVO then
		local var_20_0 = arg_20_0.contextData.spWeaponUid

		if var_20_0 then
			arg_20_0.equipmentVO = getProxy(EquipmentProxy):GetSpWeaponByUid(var_20_0)

			if not arg_20_0.equipmentVO then
				local var_20_1 = getProxy(BayProxy)

				for iter_20_0, iter_20_1 in pairs(var_20_1:getRawData()) do
					local var_20_2 = iter_20_1:GetSpWeapon()

					if var_20_2 and var_20_2:GetUID() == var_20_0 then
						arg_20_0.shipVO = var_20_1:getShipById(iter_20_0)
						arg_20_0.equipmentVO = arg_20_0.shipVO:GetSpWeapon()
						arg_20_0.contextData.shipId = iter_20_0
						arg_20_0.contextData.type = var_0_0.TYPE_SHIP
					end
				end
			end
		end
	end

	arg_20_0:updateEquipmentPanel(arg_20_0.defaultEquipTF, arg_20_0.equipmentVO, SpWeaponHelper.TransformNormalInfo(arg_20_0.equipmentVO))
	setActive(arg_20_0.defaultEnhanceBtn, true)
	setActive(arg_20_0.defaultReplaceBtn, false)
	setActive(arg_20_0.defaultUnloadBtn, false)
	setActive(arg_20_0.defaultModifyBtn, true)
end

function var_0_0.updateOperation2(arg_21_0)
	triggerToggle(arg_21_0.toggles.defaultPanel, true)

	local var_21_0 = arg_21_0.shipVO:GetSpWeapon()

	arg_21_0:updateEquipmentPanel(arg_21_0.defaultEquipTF, var_21_0, SpWeaponHelper.TransformNormalInfo(var_21_0))
	setActive(arg_21_0.defaultEnhanceBtn, true)
	setActive(arg_21_0.defaultReplaceBtn, true)
	setActive(arg_21_0.defaultUnloadBtn, true)
	setActive(arg_21_0.defaultModifyBtn, true)

	local var_21_1 = arg_21_0.defaultEquipTF:Find("head")

	setActive(var_21_1, arg_21_0.shipVO)

	if arg_21_0.shipVO then
		setImageSprite(findTF(var_21_1, "Image"), LoadSprite("qicon/" .. arg_21_0.shipVO:getPainting()))
	end
end

function var_0_0.updateOperation3(arg_22_0)
	triggerToggle(arg_22_0.toggles.replacePanel, true)

	local var_22_0 = arg_22_0.equipmentVO

	if var_22_0 then
		local var_22_1, var_22_2 = SpWeaponHelper.CompareNormalInfo(var_22_0, arg_22_0.oldEquipmentVO)

		arg_22_0:updateEquipmentPanel(arg_22_0.replaceSrcEquipTF, var_22_0, var_22_1)
		arg_22_0:updateEquipmentPanel(arg_22_0.replaceDstEquipTF, arg_22_0.oldEquipmentVO, var_22_2)
	else
		arg_22_0:updateEquipmentPanel(arg_22_0.replaceSrcEquipTF, nil)
		arg_22_0:updateEquipmentPanel(arg_22_0.replaceDstEquipTF, arg_22_0.oldEquipmentVO, SpWeaponHelper.TransformNormalInfo(arg_22_0.oldEquipmentVO))
	end

	local var_22_3 = arg_22_0.replaceDstEquipTF:Find("head")

	setActive(var_22_3, arg_22_0.oldShipVO)

	if arg_22_0.oldShipVO then
		setImageSprite(findTF(var_22_3, "Image"), LoadSprite("qicon/" .. arg_22_0.oldShipVO:getPainting()))
	end
end

function var_0_0.updateOperation4(arg_23_0)
	triggerToggle(arg_23_0.toggles.displayPanel, true)
	arg_23_0:updateEquipmentPanel(arg_23_0.displayEquipTF, arg_23_0.equipmentVO, SpWeaponHelper.TransformNormalInfo(arg_23_0.equipmentVO))
	setActive(arg_23_0.displayMoveBtn, arg_23_0.shipVO)

	local var_23_0 = arg_23_0.displayEquipTF:Find("head")

	setActive(var_23_0, arg_23_0.shipVO)

	if arg_23_0.shipVO then
		setImageSprite(findTF(var_23_0, "Image"), LoadSprite("qicon/" .. arg_23_0.shipVO:getPainting()))
	end
end

function var_0_0.updateOperationAward(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	arg_24_0.awards = arg_24_3

	if arg_24_1.childCount == 0 then
		for iter_24_0 = 1, #arg_24_3 do
			cloneTplTo(arg_24_2, arg_24_1)
		end
	end

	for iter_24_1 = 1, #arg_24_3 do
		local var_24_0 = arg_24_1:GetChild(iter_24_1 - 1)
		local var_24_1 = arg_24_3[iter_24_1]

		updateDrop(var_24_0, var_24_1)
		onButton(arg_24_0, var_24_0, function()
			arg_24_0:emit(var_0_0.ON_DROP, var_24_1)
		end, SFX_PANEL)
		setText(findTF(var_24_0, "name_panel/name"), getText(findTF(var_24_0, "name")))
		setText(findTF(var_24_0, "name_panel/number"), " x " .. getText(findTF(var_24_0, "icon_bg/count")))
		setActive(findTF(var_24_0, "icon_bg/count"), false)
	end
end

function var_0_0.updateEquipmentPanel(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = arg_26_1:Find("info")
	local var_26_1 = arg_26_1:Find("empty")

	setActive(var_26_0, arg_26_2)
	setActive(var_26_1, not arg_26_2)

	if not arg_26_2 then
		return
	end

	local var_26_2 = findTF(var_26_0, "name")

	setScrollText(findTF(var_26_2, "mask/Text"), arg_26_2:GetName())

	local var_26_3 = findTF(var_26_0, "equip")

	setImageSprite(findTF(var_26_3, "bg"), GetSpriteFromAtlas("ui/equipmentinfoui_atlas", "equip_bg_" .. ItemRarity.Rarity2Print(arg_26_2:GetRarity())))
	updateSpWeapon(var_26_3, arg_26_2, {
		noIconColorful = true
	})
	setActive(findTF(var_26_3, "slv"), arg_26_2:GetLevel() > 1)
	setText(findTF(var_26_3, "slv/Text"), arg_26_2:GetLevel() - 1)
	setActive(findTF(var_26_3, "slv/next"), false)
	setText(findTF(var_26_3, "slv/next/Text"), arg_26_2:GetLevel() - 1)

	local var_26_4 = var_26_3:Find("tier")

	setActive(var_26_4, arg_26_2)

	local var_26_5 = arg_26_2:GetTechTier()

	eachChild(var_26_4, function(arg_27_0)
		setActive(arg_27_0, tostring(var_26_5) == arg_27_0.gameObject.name)
	end)
	updateSpWeaponInfo(var_26_0:Find("attributes/view/content"), arg_26_3, arg_26_2:GetSkillGroup())

	local var_26_6 = arg_26_1:Find("info/unique")

	setActive(var_26_6, arg_26_2:IsUnique())

	if arg_26_2:IsUnique() then
		arg_26_0:updateUnique(var_26_6, arg_26_2)
	end
end

function var_0_0.updateUnique(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_1:Find("btn_skip")
	local var_28_1 = arg_28_2:GetUniqueShips()
	local var_28_2 = ShipGroup.getDefaultShipConfig(arg_28_2:GetUniqueGroup())
	local var_28_3 = Ship.New({
		configId = var_28_2.id
	})

	setImageSprite(arg_28_1:Find("head/icon"), LoadSprite("SquareIcon/" .. var_28_3:getPainting()))
	setText(arg_28_1:Find("title"), i18n("spweapon_unique_title"))
	setText(arg_28_1:Find("btn_skip/text"), i18n("spweapon_tip_jump"))
	onButton(arg_28_0, var_28_0, function()
		arg_28_0:emit(SpWeaponInfoMediator.ON_SKIP_UNIQUE_SHIPS, {
			shipId = var_28_3.id,
			shipVOs = var_28_1
		})
	end)
end

function var_0_0.cloneSampleTo(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
	local var_30_0 = cloneTplTo(arg_30_0.sample, arg_30_1, arg_30_3)

	var_30_0.localPosition = Vector3.New(var_0_0.pos[arg_30_2][1], var_0_0.pos[arg_30_2][2], var_0_0.pos[arg_30_2][3])

	if arg_30_4 then
		var_30_0:SetSiblingIndex(arg_30_4)
	end

	return var_30_0
end

function var_0_0.willExit(arg_31_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_31_0._tf)
end

function var_0_0.onBackPressed(arg_32_0)
	arg_32_0:closeView()
end

return var_0_0
