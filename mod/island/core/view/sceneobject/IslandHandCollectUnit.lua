local var_0_0 = class("IslandHandCollectUnit", import(".IslandSlotBaseUnit"))
local var_0_1 = require("Framework.toLua.UnityEngine.Vector3")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.slotData = arg_1_0.data.slotData
	arg_1_0.formulaId = pg.island_production_slot[arg_1_0.slotData.configId].formula[1]
	arg_1_0.maxHp = pg.island_formula[arg_1_0.formulaId].hitpoint
	arg_1_0.currentHp = arg_1_0.maxHp
end

function var_0_0.OnAttach(arg_2_0, arg_2_1)
	var_0_0.super.OnAttach(arg_2_0, arg_2_1)

	arg_2_0._tf = arg_2_0._go.transform
end

function var_0_0.OnStart(arg_3_0)
	arg_3_0:UpdateHandCollet()
end

function var_0_0.LoadEffectItem(arg_4_0)
	local var_4_0 = pg.island_formula[arg_4_0.formulaId]
	local var_4_1 = var_4_0.collectable_vfx
	local var_4_2 = var_0_1(var_4_0.vfx_offset[1][1], var_4_0.vfx_offset[1][2], var_4_0.vfx_offset[1][3])
	local var_4_3 = Quaternion.Euler(var_4_0.vfx_offset[2][1], var_4_0.vfx_offset[2][2], var_4_0.vfx_offset[2][3])

	arg_4_0.effectPath = pg.island_unit_item[var_4_1].model

	local function var_4_4(arg_5_0)
		setParent(arg_5_0, arg_4_0:GetView().root)

		arg_4_0.effectGo = arg_5_0
		arg_4_0.effectGo.transform.position = arg_4_0._tf:TransformPoint(var_4_2)
		arg_4_0.effectGo.transform.rotation = arg_4_0._tf.rotation * var_4_3
	end

	arg_4_0:LoadSceneEffectItemRes(arg_4_0.effectPath, var_4_4)
end

function var_0_0.UpdateHandCollet(arg_6_0)
	if arg_6_0.slotData:GetCanCollectTimeStamps() <= 0 then
		arg_6_0.hasEffect = true

		arg_6_0:LoadEffectItem()
	else
		if arg_6_0.hasEffect and arg_6_0.effectGo then
			arg_6_0:UnLoadSceneItemRes(arg_6_0.effectPath, arg_6_0.effectGo)
		end

		arg_6_0.hasEffect = false
	end
end

function var_0_0.GetToolId(arg_7_0)
	local var_7_0 = pg.island_production_slot[arg_7_0.slotData.configId].place
	local var_7_1 = pg.island_production_place[var_7_0].tool_list
	local var_7_2
	local var_7_3 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		if pg.island_animation_attachments[iter_7_1].unlock == 0 then
			var_7_2 = iter_7_1
		end

		if var_7_3:IsUnlockCollectTool(iter_7_1) then
			var_7_2 = iter_7_1
		end
	end

	return var_7_2
end

function var_0_0.GetAnimatorTrigger(arg_8_0)
	if pg.island_production_slot[arg_8_0.slotData.configId].place == IslandProductConst.MinePlaceId then
		return IslandConst.MINING_FLAG
	else
		return IslandConst.LOP_FLAG
	end
end

function var_0_0.TakeDamage(arg_9_0, arg_9_1)
	if arg_9_0.currentHp then
		arg_9_0.currentHp = arg_9_0.currentHp - arg_9_1
	end
end

function var_0_0.ResetHp(arg_10_0)
	arg_10_0.currentHp = arg_10_0.maxHp
end

function var_0_0.CheckCanStartColloct(arg_11_0)
	if not (arg_11_0.slotData:GetCanCollectTimeStamps() == 0) then
		local var_11_0 = arg_11_0.slotData:GetCanCollectTimeStamps() - pg.TimeMgr.GetInstance():GetServerTime()
		local var_11_1 = (function(arg_12_0)
			local var_12_0 = math.floor(arg_12_0 / 3600)
			local var_12_1 = math.floor(arg_12_0 % 3600 / 60)
			local var_12_2 = arg_12_0 % 60

			return string.format("%02d:%02d:%02d", var_12_0, var_12_1, var_12_2)
		end)(var_11_0)

		pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_log_recover", var_11_1))

		return false
	end

	return true
end

function var_0_0.GetHudInfo(arg_13_0)
	local var_13_0 = {}

	if not arg_13_0.slotData then
		var_13_0.needShowHud = false

		return var_13_0
	end

	var_13_0.needShowHud = true

	local var_13_1 = pg.island_formula[arg_13_0.formulaId]

	var_13_0.name = var_13_1.name

	local var_13_2 = arg_13_0.slotData:GetCanCollectTimeStamps() == 0 and 1 or 0

	var_13_0.numProcess = string.format("%d/%d", var_13_2, 1)
	var_13_0.itemIcon = "island/" .. pg.island_item_data_template[var_13_1.item_id].icon

	if var_13_2 == 0 then
		var_13_0.process = 0
	elseif arg_13_0.maxHp ~= 0 then
		var_13_0.process = arg_13_0.currentHp / arg_13_0.maxHp
	end

	return var_13_0
end

function var_0_0.TakeAttack(arg_14_0)
	local var_14_0 = pg.island_formula[arg_14_0.formulaId]
	local var_14_1 = var_14_0.affected_vfx[1]

	arg_14_0:NotifiyIsland(IslandProxy.GEN_RECYCLEITEM, {
		id = arg_14_0.id,
		unitId = var_14_1,
		position = arg_14_0.position,
		rotation = arg_14_0.rotation,
		recycleAssetType = IslandDelayRecycleUnitBuilder.RecycleType.ProductEffect,
		delayRecycleTime = var_14_0.affected_vfx[2],
		behaviourTree = {}
	})

	if arg_14_0.maxHp ~= 0 then
		local var_14_2 = arg_14_0:GetToolId()
		local var_14_3 = pg.island_animation_attachments[var_14_2].attack

		arg_14_0:TakeDamage(var_14_3)
		arg_14_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, tonumber(arg_14_0.id))

		if arg_14_0.currentHp < 0 then
			arg_14_0.slotData:StartColloct()
		end
	else
		arg_14_0.slotData:StartColloct()
	end
end

function var_0_0.OnDispose(arg_15_0)
	var_0_0.super.OnDispose(arg_15_0)

	if arg_15_0.effectGo then
		arg_15_0:UnLoadSceneItemRes(arg_15_0.effectPath, arg_15_0.effectGo)
	end

	arg_15_0.hasEffect = false
end

return var_0_0
