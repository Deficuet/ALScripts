local var_0_0 = class("FormationSuggestionShipEquipPanel", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	setText(arg_2_0.uiCopyText, i18n("formation_suggestion_info_equip_copy"))
	setScrollText(arg_2_0.uiSpUnownedText, i18n("equipcode_equipment_unowned"))
	onButton(arg_2_0, arg_2_0.uiCopyBtn, function()
		local var_3_0 = {}

		for iter_3_0, iter_3_1 in ipairs(arg_2_0.equipDataList[1]) do
			table.insert(var_3_0, Equipment.New({
				id = iter_3_1[1],
				config_id = iter_3_1[1] + iter_3_1[2],
				skinId = iter_3_1[1]
			}))
		end

		local var_3_1 = SpWeapon.New({
			id = arg_2_0.equipDataList[2][1][1] + arg_2_0.equipDataList[2][1][2]
		})
		local var_3_2 = buildEquipAndSpCode(var_3_0, var_3_1)

		UniPasteBoard.SetClipBoardString(var_3_2)
		pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_export_success"))
	end, SFX_PANEL)

	arg_2_0.equipItemList = UIItemList.New(arg_2_0.uiEquipParent, arg_2_0.uiEquipItem)
end

function var_0_0.SetData(arg_4_0, arg_4_1)
	arg_4_0.equipDataList = arg_4_1

	local var_4_0 = arg_4_1[1]

	arg_4_0.equipItemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = var_4_0[arg_5_1 + 1]
			local var_5_1 = EquipmentTools.HasEquipByGroup(pg.equip_data_template[var_5_0[1]].group)
			local var_5_2 = var_5_1 and var_5_0[1] + var_5_0[2] or var_5_0[1]
			local var_5_3 = Equipment.New({
				id = var_5_2,
				config_id = var_5_2,
				skinId = var_5_2
			})

			updateEquipment(arg_5_2, var_5_3)
			setActive(findTF(arg_5_2, "unOwned"), not var_5_1)
			setScrollText(findTF(arg_5_2, "unOwned/Text"), i18n("equipcode_equipment_unowned"))
			onButton(arg_4_0, arg_5_2, function()
				arg_4_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
					mediator = EquipmentInfoMediator,
					viewComponent = EquipmentInfoLayer,
					data = {
						equipmentId = var_5_2,
						type = EquipmentInfoMediator.TYPE_DISPLAY
					}
				}))
			end)
		end
	end)
	arg_4_0.equipItemList:align(#var_4_0)

	local var_4_1 = arg_4_1[2][1]
	local var_4_2 = EquipmentTools.HasBaseSpWeapon(var_4_1[1])
	local var_4_3 = var_4_2 and var_4_1[1] + var_4_1[2] or var_4_1[1]
	local var_4_4 = SpWeapon.New({
		id = var_4_3
	})

	UpdateSpWeaponSlot(arg_4_0.uiSpTf, var_4_4)
	setActive(arg_4_0.uiSpUnownedGo, not var_4_2)
	onButton(arg_4_0, arg_4_0.uiSpTf, function()
		arg_4_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			mediator = SpWeaponInfoMediator,
			viewComponent = SpWeaponInfoLayer,
			data = {
				spWeaponConfigId = var_4_3,
				type = SpWeaponInfoLayer.TYPE_DISPLAY
			}
		}))
	end)
end

function var_0_0.willExit(arg_8_0)
	arg_8_0.equipItemList:Dispose()
	arg_8_0:detach()
end

return var_0_0
