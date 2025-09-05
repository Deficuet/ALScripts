local var_0_0 = class("IslandHandPlantUnit", import(".IslandSlotBaseUnit"))
local var_0_1 = {
	Planting = 4,
	Locked = 1,
	Delegate = 5,
	CanHarvest = 3,
	CanPlant = 2
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:BindSlotData()

	arg_1_0.emptyName = pg.island_set.farm_empty_state_info.key_value_varchar[1]
	arg_1_0.emptyIcon = pg.island_set.farm_empty_state_info.key_value_varchar[2]
end

function var_0_0.BindSlotData(arg_2_0)
	arg_2_0.handDate = arg_2_0.data.slotData
	arg_2_0.slotType = arg_2_0.data.slotType
end

function var_0_0.CanCheckByPlayer(arg_3_0)
	return arg_3_0.data.slotType == IslandProductSystemVO.SlotType.HandPlant and arg_3_0.data.slotData ~= nil
end

function var_0_0.OnInit(arg_4_0, arg_4_1, arg_4_2)
	var_0_0.super.OnInit(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:HighLightDisPlayHandle()
end

function var_0_0.SetHighLight(arg_5_0, arg_5_1)
	arg_5_0.data:SetHighLight(arg_5_1)

	if not arg_5_0._go then
		return
	end

	local var_5_0 = GetOrAddComponent(arg_5_0._go, "HighlightController")

	if arg_5_1 then
		var_5_0:HighlightOn()
	else
		var_5_0:HighlightOff()
	end
end

function var_0_0.HighLightDisPlayHandle(arg_6_0)
	if arg_6_0.data:GetHighLight() then
		GetOrAddComponent(arg_6_0._go, "HighlightController"):HighlightOn()
	end
end

function var_0_0.GetHudInfo(arg_7_0)
	local var_7_0 = {}

	if not arg_7_0.handDate then
		var_7_0.needShowHud = false

		return var_7_0
	end

	if arg_7_0.slotType ~= IslandProductSystemVO.SlotType.HandPlant then
		return var_7_0
	end

	var_7_0.needShowHud = true

	local var_7_1 = arg_7_0.handDate:GetPlantFormulaId()

	if not var_7_1 then
		var_7_0.name = arg_7_0.emptyName
		var_7_0.itemIcon = "island/" .. arg_7_0.emptyIcon
	else
		local var_7_2 = pg.island_formula[var_7_1]

		var_7_0.name = var_7_2.name
		var_7_0.itemIcon = "island/" .. pg.island_item_data_template[var_7_2.item_id].icon
	end

	var_7_0.hudState = {}

	if arg_7_0:CanPlant() then
		var_7_0.hudState.stateText = "可种植"
	elseif arg_7_0:CanHarvest() then
		var_7_0.hudState.stateText = "可收获"
	else
		var_7_0.hudState.stateEndTime = arg_7_0.handDate.end_time
		var_7_0.hudState.stateEndText = "可收获"
	end

	return var_7_0
end

function var_0_0.CanPlant(arg_8_0)
	if arg_8_0.handDate.state == 0 then
		return true
	end

	return false
end

function var_0_0.CanHarvest(arg_9_0)
	if arg_9_0.handDate.state == 0 then
		return false
	end

	local var_9_0 = pg.TimeMgr.GetInstance()

	return arg_9_0.handDate.end_time - var_9_0:GetServerTime() < 0
end

function var_0_0.GetPlantType(arg_10_0)
	if arg_10_0.data.slotType ~= IslandProductSystemVO.SlotType.HandPlant then
		return var_0_1.Delegate
	end

	if not arg_10_0.handDate then
		return var_0_1.Locked
	end

	if arg_10_0:CanPlant() then
		return var_0_1.CanPlant
	elseif arg_10_0:CanHarvest() then
		return var_0_1.CanHarvest
	else
		return var_0_1.Planting
	end
end

function var_0_0.OnUpdate(arg_11_0)
	var_0_0.super.OnUpdate(arg_11_0)
	arg_11_0:UpdateEffect()
end

function var_0_0.UpdateEffect(arg_12_0)
	if not arg_12_0.handDate then
		return
	end

	if arg_12_0.slotType ~= IslandProductSystemVO.SlotType.HandPlant then
		return
	end

	if arg_12_0:CanHarvest() then
		if not arg_12_0.hasEffect then
			arg_12_0.hasEffect = true

			local var_12_0 = arg_12_0.handDate.formula_id
			local var_12_1 = pg.island_formula[var_12_0].collectable_vfx

			arg_12_0.effectPath = pg.island_unit_item[var_12_1].model

			local function var_12_2(arg_13_0)
				setParent(arg_13_0, arg_12_0:GetView().root)

				arg_12_0.effectGo = arg_13_0

				if not arg_12_0.hasEffect then
					arg_12_0:UnLoadEffectItemRes()

					return
				end

				arg_12_0.effectGo.transform.position = arg_12_0.position
				arg_12_0.effectGo.transform.eulerAngles = arg_12_0.rotation
			end

			arg_12_0:LoadEffectItemRes(var_12_2)
		end
	elseif arg_12_0.hasEffect then
		arg_12_0.hasEffect = false

		arg_12_0:UnLoadEffectItemRes()
	end
end

function var_0_0.OnDispose(arg_14_0)
	var_0_0.super.OnDispose(arg_14_0)

	if arg_14_0.effectGo then
		arg_14_0:UnLoadEffectItemRes()
	end
end

function var_0_0.DelegateSlotStartPerform(arg_15_0)
	arg_15_0:GetDataVO():StartDelegateSlotPerform()
	arg_15_0:LoadProductItem()
end

return var_0_0
