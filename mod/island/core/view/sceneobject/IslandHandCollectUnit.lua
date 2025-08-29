local var_0_0 = class("IslandHandCollectUnit", import(".IslandSlotBaseUnit"))
local var_0_1 = require("Framework.toLua.UnityEngine.Vector3")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.slotData = arg_1_0.data.slotData

	if arg_1_0.data.formula_id then
		arg_1_0.maxHp = pg.island_formula[arg_1_0.data.formula_id].hitpoint
		arg_1_0.currentHp = arg_1_0.maxHp
	end
end

function var_0_0.GetToolId(arg_2_0)
	local var_2_0 = pg.island_production_slot[arg_2_0.slotData.configId].place
	local var_2_1 = pg.island_production_place[var_2_0].tool_list
	local var_2_2
	local var_2_3 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_2_0, iter_2_1 in ipairs(var_2_1) do
		if pg.island_animation_attachments[iter_2_1].unlock == 0 then
			var_2_2 = iter_2_1
		end

		if var_2_3:IsUnlockCollectTool(iter_2_1) then
			var_2_2 = iter_2_1
		end
	end

	return var_2_2
end

function var_0_0.GetAnimatorTrigger(arg_3_0)
	if pg.island_production_slot[arg_3_0.slotData.configId].place == 401 then
		return IslandConst.MINING_FLAG
	else
		return IslandConst.LOP_FLAG
	end
end

function var_0_0.TakeDamage(arg_4_0, arg_4_1)
	if arg_4_0.currentHp then
		arg_4_0.currentHp = arg_4_0.currentHp - arg_4_1
	end
end

function var_0_0.ResetHp(arg_5_0)
	arg_5_0.currentHp = arg_5_0.maxHp
end

function var_0_0.StartColloct(arg_6_0, arg_6_1)
	if arg_6_0.slotData:GetCanCollectTime() <= 0 then
		pg.TipsMgr.GetInstance():ShowTips("可采集次数为0,等会再来")

		return 0
	end

	if arg_6_0.maxHp ~= 0 then
		local var_6_0 = pg.island_animation_attachments[arg_6_1].attack

		arg_6_0:TakeDamage(var_6_0)

		if arg_6_0.currentHp < 0 then
			arg_6_0.slotData:StartColloct()

			return 3
		end

		return 2
	else
		arg_6_0.slotData:StartColloct()

		return 3
	end
end

function var_0_0.GetHudInfo(arg_7_0)
	local var_7_0 = {}

	if not arg_7_0.slotData then
		var_7_0.needShowHud = false

		return var_7_0
	end

	var_7_0.needShowHud = true

	local var_7_1 = pg.island_formula[arg_7_0.data.formula_id]

	var_7_0.name = var_7_1.name
	var_7_0.numProcess = string.format("%d/%d", arg_7_0.slotData:GetCanCollectTime(), arg_7_0.slotData:GetCollectMaxTime())
	var_7_0.itemIcon = "island/" .. pg.island_item_data_template[var_7_1.item_id].icon

	if arg_7_0.slotData:GetCanCollectTime() == 0 then
		var_7_0.process = 0
	elseif arg_7_0.maxHp ~= 0 then
		var_7_0.process = arg_7_0.currentHp / arg_7_0.maxHp
	end

	return var_7_0
end

function var_0_0.UpdateEffect(arg_8_0)
	if not arg_8_0.slotData then
		return
	end

	if arg_8_0.slotData:GetCanCollectTime() > 0 then
		if not arg_8_0.hasEffect then
			arg_8_0.hasEffect = true

			local var_8_0 = arg_8_0.data.formula_id
			local var_8_1 = pg.island_formula[var_8_0]
			local var_8_2 = var_8_1.collectable_vfx

			arg_8_0.effectPath = pg.island_unit_item[var_8_2].model

			local function var_8_3(arg_9_0)
				setParent(arg_9_0, arg_8_0:GetView().root)

				arg_8_0.effectGo = arg_9_0

				if not arg_8_0.hasEffect then
					arg_8_0:UnLoadEffectItemRes()

					return
				end

				local var_9_0 = arg_8_0.position

				if var_8_1.vfx_offset then
					var_9_0 = arg_8_0.position + var_0_1.New(var_8_1.vfx_offset[1], var_8_1.vfx_offset[2], var_8_1.vfx_offset[3])
				end

				arg_8_0.effectGo.transform.position = var_9_0
				arg_8_0.effectGo.transform.eulerAngles = arg_8_0.rotation
			end

			arg_8_0:LoadEffectItemRes(var_8_3)
		end
	elseif arg_8_0.hasEffect then
		arg_8_0.hasEffect = false

		arg_8_0:UnLoadEffectItemRes()
	end
end

function var_0_0.OnUpdate(arg_10_0)
	var_0_0.super.OnUpdate(arg_10_0)
	arg_10_0:UpdateEffect()
end

function var_0_0.OnDispose(arg_11_0)
	var_0_0.super.OnDispose(arg_11_0)

	if arg_11_0.effectGo then
		arg_11_0:UnLoadEffectItemRes()
	end
end

return var_0_0
