local var_0_0 = class("ShipModLayer", import("..base.BaseUI"))
local var_0_1 = 12

var_0_0.IGNORE_ID = 4

function var_0_0.getUIName(arg_1_0)
	return "ShipModUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "ShipMainScene"
end

function var_0_0.setShipVOs(arg_3_0, arg_3_1)
	arg_3_0.shipVOs = arg_3_1
end

function var_0_0.init(arg_4_0)
	arg_4_0.blurPanelTF = arg_4_0._tf:Find("blur_panel")
	arg_4_0.mainPanel = arg_4_0._tf:Find("blur_panel/main")
	arg_4_0.shipContainer = arg_4_0.mainPanel:Find("bg/add_ship_panel/ships")
	arg_4_0.attrsPanel = arg_4_0.mainPanel:Find("bg/property_panel/attrs")

	setText(arg_4_0.mainPanel:Find("bg/add_ship_panel/title/tip"), i18n("ship_mod_exp_to_attr_tip"))
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0.mainPanel:Find("ok_btn"), function()
		local function var_6_0()
			local var_7_0, var_7_1 = ShipStatus.ShipStatusCheck("onModify", arg_5_0.shipVO)

			if not var_7_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_7_1)

				return
			end

			if not arg_5_0.contextData.materialShipIds or #arg_5_0.contextData.materialShipIds == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_materal_no_enough"))

				return
			else
				arg_5_0:startModShip()
			end
		end

		if arg_5_0.shipVO:isActivityNpc() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("npc_strength_tip"),
				onYes = var_6_0
			})
		else
			var_6_0()
		end
	end, SFX_CONFIRM)
	onButton(arg_5_0, arg_5_0.mainPanel:Find("cancel_btn"), function()
		local var_8_0 = arg_5_0.contextData.materialShipIds

		if not var_8_0 or table.getCount(var_8_0) == 0 then
			return
		end

		arg_5_0:clearAllShip()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.mainPanel:Find("select_btn"), function()
		arg_5_0:emit(ShipModMediator.ON_AUTO_SELECT_SHIP)
	end, SFX_CANCEL)
	arg_5_0:initAttrs()

	arg_5_0.inited = true

	arg_5_0:emit(ShipModMediator.LOADEND, arg_5_0.mainPanel)
	arg_5_0:blurPanel(true)
end

function var_0_0.blurPanel(arg_10_0, arg_10_1)
	if arg_10_1 then
		arg_10_0:OverlayPanel(arg_10_0.blurPanelTF, {
			pbList = {
				arg_10_0.mainPanel:Find("bg")
			},
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		arg_10_0:UnOverlayPanel(arg_10_0.blurPanelTF, arg_10_0._tf)
	end
end

function var_0_0.startModShip(arg_11_0)
	if not arg_11_0.hasAddition then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_mod_no_addition_tip"),
			onYes = function()
				arg_11_0:emit(ShipModMediator.MOD_SHIP, arg_11_0.shipVO.id)
			end
		})
	else
		arg_11_0:emit(ShipModMediator.MOD_SHIP, arg_11_0.shipVO.id)
	end
end

function var_0_0.setShip(arg_13_0, arg_13_1)
	arg_13_0.shipVO = arg_13_1

	arg_13_0:initSelectedShips()

	if arg_13_0.inited then
		arg_13_0:initAttrs()
	end
end

function var_0_0.clearAllShip(arg_14_0)
	for iter_14_0 = 1, var_0_1 do
		local var_14_0 = arg_14_0.shipContainer:GetChild(iter_14_0 - 1)

		setActive(var_14_0:Find("IconTpl"), false)
		onButton(arg_14_0, var_14_0:Find("add"), function()
			arg_14_0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)
		end, SFX_PANEL)
	end

	arg_14_0.contextData.materialShipIds = nil

	arg_14_0:updateAttrs()
end

function var_0_0.initSelectedShips(arg_16_0)
	local var_16_0 = arg_16_0.contextData.materialShipIds or {}
	local var_16_1 = table.getCount(var_16_0)

	for iter_16_0 = 1, var_0_1 do
		local var_16_2 = arg_16_0.shipContainer:GetChild(iter_16_0 - 1)

		if iter_16_0 <= var_16_1 then
			arg_16_0:updateShip(var_16_2, var_16_0[iter_16_0])
		else
			onButton(arg_16_0, var_16_2:Find("add"), function()
				arg_16_0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)
			end, SFX_PANEL)
		end

		setActive(var_16_2:Find("IconTpl"), iter_16_0 <= var_16_1)
	end
end

function var_0_0.updateShip(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.shipVOs[arg_18_2]

	onButton(arg_18_0, arg_18_1, function()
		for iter_19_0, iter_19_1 in ipairs(arg_18_0.contextData.materialShipIds) do
			if arg_18_2 == iter_19_1 then
				local var_19_0 = arg_18_1:Find("add")

				setActive(arg_18_1:Find("IconTpl"), false)
				onButton(arg_18_0, var_19_0, function()
					arg_18_0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)
				end, SFX_PANEL)
				table.remove(arg_18_0.contextData.materialShipIds, iter_19_0)
				arg_18_0:updateAttrs()

				break
			end
		end
	end, SFX_PANEL)
	updateShip(arg_18_1:Find("IconTpl"), var_18_0, {
		initStar = true
	})
	setText(arg_18_1:Find("IconTpl/icon_bg/lv/Text"), var_18_0.level)
end

function var_0_0.initAttrs(arg_21_0)
	arg_21_0.attrTFs = {}

	for iter_21_0, iter_21_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		if arg_21_0.IGNORE_ID ~= iter_21_0 then
			local var_21_0 = arg_21_0.attrsPanel:Find("attr_" .. iter_21_0)

			arg_21_0.attrTFs[iter_21_0] = var_21_0
		end
	end

	arg_21_0:updateAttrs()
end

function var_0_0.updateAttrs(arg_22_0)
	arg_22_0.hasAddition = nil

	for iter_22_0, iter_22_1 in pairs(arg_22_0.attrTFs) do
		arg_22_0:updateAttr(iter_22_0)
	end
end

function var_0_0.updateAttr(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.attrTFs[arg_23_1]
	local var_23_1 = var_23_0:Find("info")
	local var_23_2 = var_23_0:GetComponent(typeof(CanvasGroup))
	local var_23_3 = ShipModAttr.ID_TO_ATTR[arg_23_1]
	local var_23_4 = arg_23_0.shipVO:getModAttrTopLimit(var_23_3)
	local var_23_5 = intProperties(arg_23_0.shipVO:getShipProperties())
	local var_23_6 = arg_23_0:getMaterialShips(arg_23_0.contextData.materialShipIds)
	local var_23_7 = var_0_0.getExpAddition(arg_23_0.shipVO, var_23_6, var_23_3)
	local var_23_8 = arg_23_0.shipVO:getModExpRatio(var_23_3)
	local var_23_9 = math.max(arg_23_0.shipVO:getModExpRatio(var_23_3), 1)

	if var_23_7 ~= 0 then
		arg_23_0.hasAddition = true
	end

	local var_23_10 = arg_23_0.shipVO:getModAttrBaseMax(var_23_3)
	local var_23_11 = arg_23_0.getRemainExp(arg_23_0.shipVO, var_23_3)
	local var_23_12 = math.max(math.min(math.floor((var_23_11 + var_23_7) / var_23_9), var_23_10 - var_23_5[var_23_3]), 0)

	setText(var_23_1:Find("info_container/addition"), "+" .. var_23_12)
	setText(var_23_1:Find("info_container/name"), AttributeType.Type2Name(var_23_3))
	setText(var_23_1:Find("max_container/Text"), var_23_10)
	setText(var_23_1:Find("info_container/value"), var_23_5[var_23_3])

	var_23_2.alpha = var_23_5[var_23_3] == 0 and 0.3 or 1

	local var_23_13 = var_23_1:Find("prev_slider"):GetComponent(typeof(Slider))

	arg_23_0:setSliderValue(var_23_13, (var_23_7 + var_23_11) / var_23_9)

	local var_23_14 = var_23_11 / var_23_9
	local var_23_15 = var_23_11 + var_23_7 .. "/" .. var_23_8

	if var_23_10 == var_23_5[var_23_3] and var_23_5[var_23_3] ~= 0 then
		var_23_14 = 1
		var_23_15 = "MAX"
	end

	local var_23_16 = var_23_1:Find("cur_slider"):GetComponent(typeof(Slider))

	arg_23_0:setSliderValue(var_23_16, var_23_14)
	setText(var_23_0:Find("exp_container/Text"), var_23_15)
end

function var_0_0.modAttrAnim(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = arg_24_3 or 0.3
	local var_24_1 = intProperties(arg_24_1:getShipProperties())
	local var_24_2 = intProperties(arg_24_2:getShipProperties())

	arg_24_0.tweens = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.attrTFs) do
		local var_24_3 = ShipModAttr.ID_TO_ATTR[iter_24_0]
		local var_24_4 = arg_24_1:getModAttrTopLimit(var_24_3)
		local var_24_5 = arg_24_0.shipVO:getModAttrBaseMax(var_24_3)

		if var_24_4 == 0 then
			arg_24_0:updateAttr(iter_24_0)
		else
			local var_24_6 = arg_24_0.attrTFs[iter_24_0]
			local var_24_7 = var_24_6:Find("info")
			local var_24_8 = var_24_7:Find("info_container/value")
			local var_24_9 = var_24_1[var_24_3] - var_24_2[var_24_3]
			local var_24_10 = math.max(arg_24_1:getModExpRatio(var_24_3), 1)
			local var_24_11 = var_24_7:Find("cur_slider")
			local var_24_12 = var_24_7:Find("prev_slider")
			local var_24_13 = var_24_11:GetComponent(typeof(Slider))
			local var_24_14 = var_24_12:GetComponent(typeof(Slider))
			local var_24_15 = arg_24_0.getRemainExp(arg_24_1, var_24_3)
			local var_24_16 = var_24_7:Find("info_container/addition")
			local var_24_17 = var_24_6:Find("exp_container/Text")

			arg_24_0:setSliderValue(var_24_14, 0)
			setText(var_24_6:Find("exp_container/Text"), var_24_15 .. "/" .. var_24_10)

			local function var_24_18(arg_25_0, arg_25_1)
				setText(var_24_8, arg_25_0)
				setText(var_24_16, "+" .. arg_25_1)
			end

			if var_24_9 >= 1 then
				local var_24_19 = var_24_2[var_24_3]

				arg_24_0:tweenValue(var_24_13, var_24_13.value, 1, var_24_0, nil, function(arg_26_0)
					arg_24_0:setSliderValue(var_24_13, arg_26_0)
				end, function()
					pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_BREAK_OUT_FULL)

					var_24_19 = var_24_19 + 1

					var_24_18(var_24_19, var_24_1[var_24_3] - var_24_19)

					local var_27_0 = var_24_1[var_24_3] - var_24_19

					if var_27_0 > 0 then
						arg_24_0:tweenValue(var_24_13, 0, 1, var_24_0, nil, function(arg_28_0)
							arg_24_0:setSliderValue(var_24_13, arg_28_0)
						end, function()
							pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_BREAK_OUT_FULL)

							var_24_19 = var_24_19 + 1

							var_24_18(var_24_19, var_24_1[var_24_3] - var_24_19)

							if var_24_19 == var_24_1[var_24_3] then
								arg_24_0:tweenValue(var_24_13, 0, var_24_15 / var_24_10, var_24_0, nil, function(arg_30_0)
									arg_24_0:setSliderValue(var_24_13, arg_30_0)
								end, function()
									if var_24_5 == var_24_1[var_24_3] then
										arg_24_0:setSliderValue(var_24_13, 1)
										setText(var_24_17, "MAX")
									end
								end)
							end
						end, var_27_0)
					else
						arg_24_0:tweenValue(var_24_13, 0, var_24_15 / var_24_10, var_24_0, nil, function(arg_32_0)
							arg_24_0:setSliderValue(var_24_13, arg_32_0)
						end, function()
							if var_24_5 == var_24_1[var_24_3] then
								arg_24_0:setSliderValue(var_24_13, 1)
								setText(var_24_17, "MAX")
							end
						end)
					end
				end)
			else
				arg_24_0:tweenValue(var_24_13, var_24_13.value, var_24_15 / var_24_10, var_24_0, nil, function(arg_34_0)
					arg_24_0:setSliderValue(var_24_13, arg_34_0)
				end, function()
					if var_24_5 == var_24_1[var_24_3] then
						arg_24_0:setSliderValue(var_24_13, 1)
						setText(var_24_17, "MAX")
					end
				end)
			end
		end
	end
end

function var_0_0.tweenValue(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7, arg_36_8)
	assert(not arg_36_0.exited, "tween after ui exited")

	if not arg_36_0.tweens then
		return
	end

	arg_36_0.tweens[arg_36_1] = arg_36_1

	LeanTween.cancel(go(arg_36_1))

	local var_36_0 = LeanTween.value(go(arg_36_1), arg_36_2, arg_36_3, arg_36_4):setOnUpdate(System.Action_float(function(arg_37_0)
		if arg_36_6 then
			arg_36_6(arg_37_0)
		end
	end)):setDelay(arg_36_5 or 0):setOnComplete(System.Action(function()
		if arg_36_7 then
			arg_36_7()
		end
	end))

	if arg_36_8 and arg_36_8 > 0 then
		var_36_0:setRepeat(arg_36_8)
	end
end

function var_0_0.getBuffExp()
	local var_39_0 = BuffHelper.GetShipModExpBuff()
	local var_39_1 = 0

	for iter_39_0, iter_39_1 in ipairs(var_39_0) do
		var_39_1 = math.max(iter_39_1 and iter_39_1:getConfig("benefit_effect") / 100 or 0, var_39_1)
	end

	return var_39_1
end

function var_0_0.getModExpAdditions(arg_40_0, arg_40_1)
	local var_40_0 = pg.ship_data_template
	local var_40_1 = var_40_0[arg_40_0.configId].group_type
	local var_40_2 = pg.ship_data_strengthen
	local var_40_3 = {}
	local var_40_4 = var_0_0.getBuffExp()

	for iter_40_0, iter_40_1 in pairs(ShipModAttr.ID_TO_ATTR) do
		local var_40_5 = 0

		if iter_40_0 ~= ShipModLayer.IGNORE_ID then
			for iter_40_2, iter_40_3 in pairs(arg_40_1) do
				local var_40_6 = var_40_0[iter_40_3.configId]
				local var_40_7 = var_40_6.strengthen_id

				assert(var_40_2[var_40_7], "ship_data_strengthen>>" .. var_40_7)

				local var_40_8 = var_40_2[var_40_7].attr_exp[iter_40_0 - 1]

				if var_40_6.group_type == var_40_1 then
					var_40_8 = var_40_8 * 2
				end

				var_40_5 = var_40_5 + var_40_8
			end
		end

		var_40_3[iter_40_1] = math.floor(var_40_5 * (1 + var_40_4))
	end

	return var_40_3
end

function var_0_0.getMaterialShips(arg_41_0, arg_41_1)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_1 or {}) do
		table.insert(var_41_0, arg_41_0.shipVOs[iter_41_1])
	end

	return var_41_0
end

function var_0_0.getExpAddition(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = var_0_0.getModExpAdditions(arg_42_0, arg_42_1)

	if arg_42_0:getModAttrTopLimit(arg_42_2) == 0 then
		return 0, 0
	else
		local var_42_1 = Clone(arg_42_0)

		var_42_1:addModAttrExp(arg_42_2, var_42_0[arg_42_2])

		return var_42_1:getModProperties(arg_42_2) - arg_42_0:getModProperties(arg_42_2)
	end
end

function var_0_0.getRemainExp(arg_43_0, arg_43_1)
	local var_43_0 = math.max(arg_43_0:getModExpRatio(arg_43_1), 1)

	return arg_43_0:getModProperties(arg_43_1) % var_43_0
end

function var_0_0.setSliderValue(arg_44_0, arg_44_1, arg_44_2)
	arg_44_1.value = arg_44_2 == 0 and arg_44_2 or math.max(arg_44_2, 0.08)
end

function var_0_0.willExit(arg_45_0)
	arg_45_0:blurPanel(false)

	for iter_45_0, iter_45_1 in pairs(arg_45_0.tweens or {}) do
		LeanTween.cancel(go(iter_45_1))
	end

	arg_45_0.tweens = nil
end

function var_0_0.onBackPressed(arg_46_0)
	arg_46_0:emit(BaseUI.ON_BACK_PRESSED, true)
end

return var_0_0
