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

		arg_6_0:StopEffectTimer()

		local var_6_0 = arg_6_0.slotData:GetCanCollectTimeStamps() - pg.TimeMgr.GetInstance():GetServerTime()

		arg_6_0:StartEffectTimer(var_6_0)
	end

	;(function()
		local var_7_0 = arg_6_0.slotData:GetCanCollectTimeStamps()

		if var_7_0 ~= 0 then
			local var_7_1 = var_7_0 - pg.TimeMgr.GetInstance():GetServerTime()

			arg_6_0.delayInfoTimer = Timer.New(function()
				arg_6_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, tonumber(arg_6_0.id))
			end, var_7_1, 1)

			arg_6_0.delayInfoTimer:Start()
		end
	end)()
end

function var_0_0.StartEffectTimer(arg_9_0, arg_9_1)
	arg_9_0.effectTimer = Timer.New(function()
		arg_9_0.hasEffect = true

		arg_9_0:LoadEffectItem()
	end, arg_9_1, 1)

	arg_9_0.effectTimer:Start()
end

function var_0_0.StopEffectTimer(arg_11_0)
	if arg_11_0.effectTimer ~= nil then
		arg_11_0.effectTimer:Stop()

		arg_11_0.effectTimer = nil
	end
end

function var_0_0.StopUpdateInfoTimer(arg_12_0)
	if arg_12_0.delayInfoTimer ~= nil then
		arg_12_0.delayInfoTimer:Stop()

		arg_12_0.delayInfoTimer = nil
	end
end

function var_0_0.GetToolId(arg_13_0)
	local var_13_0 = pg.island_production_slot[arg_13_0.slotData.configId].place
	local var_13_1 = pg.island_production_place[var_13_0].tool_list
	local var_13_2
	local var_13_3 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		if pg.island_animation_attachments[iter_13_1].unlock == 0 then
			var_13_2 = iter_13_1
		end

		if var_13_3:IsUnlockCollectTool(iter_13_1) then
			var_13_2 = iter_13_1
		end
	end

	return var_13_2
end

function var_0_0.GetAnimatorTrigger(arg_14_0)
	if pg.island_production_slot[arg_14_0.slotData.configId].place == IslandProductConst.MinePlaceId then
		return IslandConst.MINING_FLAG
	else
		return IslandConst.LOP_FLAG
	end
end

function var_0_0.TakeDamage(arg_15_0, arg_15_1)
	if arg_15_0.currentHp then
		arg_15_0.currentHp = arg_15_0.currentHp - arg_15_1
	end
end

function var_0_0.ResetHp(arg_16_0)
	arg_16_0.currentHp = arg_16_0.maxHp
end

function var_0_0.CheckCanStartColloct(arg_17_0)
	if not (arg_17_0.slotData:GetCanCollectTimeStamps() == 0) then
		local var_17_0 = arg_17_0.slotData:GetCanCollectTimeStamps()
		local var_17_1 = var_17_0 - pg.TimeMgr.GetInstance():GetServerTime()
		local var_17_2

		if var_17_1 > 86400 then
			var_17_2 = pg.TimeMgr.GetInstance():STimeDescC(var_17_0 or 0)
		else
			var_17_2 = os.date("%H:%M:%S", var_17_0 or 0)
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("island_production_log_recover", var_17_2))

		return false
	end

	return true
end

function var_0_0.GetHudInfo(arg_18_0)
	local var_18_0 = {}

	if not arg_18_0.slotData then
		var_18_0.needShowHud = false

		return var_18_0
	end

	var_18_0.needShowHud = true

	local var_18_1 = pg.island_formula[arg_18_0.formulaId]

	var_18_0.name = var_18_1.name

	local var_18_2 = arg_18_0.slotData:GetCanCollectTimeStamps() == 0 and 1 or 0

	var_18_0.numProcess = string.format("%d/%d", var_18_2, 1)
	var_18_0.itemIcon = "island/" .. pg.island_item_data_template[var_18_1.item_id].icon

	if var_18_2 == 0 then
		var_18_0.process = 0
	elseif arg_18_0.maxHp ~= 0 then
		var_18_0.process = arg_18_0.currentHp / arg_18_0.maxHp
	end

	return var_18_0
end

function var_0_0.TakeAttack(arg_19_0)
	local var_19_0 = pg.island_formula[arg_19_0.formulaId]
	local var_19_1 = var_19_0.affected_vfx[1]

	arg_19_0:NotifiyIsland(IslandProxy.GEN_RECYCLEITEM, {
		id = arg_19_0.id,
		unitId = var_19_1,
		position = arg_19_0.position,
		rotation = arg_19_0.rotation,
		recycleAssetType = IslandDelayRecycleUnitBuilder.RecycleType.ProductEffect,
		delayRecycleTime = var_19_0.affected_vfx[2],
		behaviourTree = {}
	})

	if arg_19_0.maxHp ~= 0 then
		local var_19_2 = arg_19_0:GetToolId()
		local var_19_3 = pg.island_animation_attachments[var_19_2].attack

		arg_19_0:TakeDamage(var_19_3)
		arg_19_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, tonumber(arg_19_0.id))

		if arg_19_0.currentHp < 0 then
			arg_19_0.slotData:StartColloct()
		end
	else
		arg_19_0.slotData:StartColloct()
	end
end

function var_0_0.OnDispose(arg_20_0)
	var_0_0.super.OnDispose(arg_20_0)

	if arg_20_0.effectGo then
		arg_20_0:UnLoadSceneItemRes(arg_20_0.effectPath, arg_20_0.effectGo)
	end

	arg_20_0:StopUpdateInfoTimer()
	arg_20_0:StopEffectTimer()

	arg_20_0.hasEffect = false

	if arg_20_0.modelDelayTimer then
		arg_20_0.modelDelayTimer:Stop()

		arg_20_0.modelDelayTimer = nil
	end
end

return var_0_0
