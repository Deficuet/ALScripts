local var_0_0 = class("IslandProductSystem", import("Mod.Island.Core.View.SceneObject.IslandSceneUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.scheduleList = {}
end

function var_0_0.OnStart(arg_2_0)
	local var_2_0 = arg_2_0.data:GetDelegateSlotUnits()

	for iter_2_0, iter_2_1 in pairs(var_2_0) do
		local var_2_1 = {
			commissionSlotId = iter_2_0,
			unitIds = iter_2_1
		}

		arg_2_0:StartDelegation(var_2_1)
	end
end

function var_0_0.StartDelegation(arg_3_0, arg_3_1)
	table.insert(arg_3_0.scheduleList, arg_3_1)
end

function var_0_0.ExecuteDelegation(arg_4_0, arg_4_1)
	switch(arg_4_0.data.productPlaceId, {
		[IslandProductConst.FisheryPlaceId] = function()
			arg_4_0:ExecuteDelegateFish(arg_4_1)
		end
	})
end

function var_0_0.ExecuteDelegateFish(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.commissionSlotId
	local var_6_1 = pg.island_production_commission[var_6_0].performanceObjid
	local var_6_2 = arg_6_1.unitIds

	for iter_6_0, iter_6_1 in ipairs(var_6_2) do
		local var_6_3 = arg_6_0:GetView():GetUnitModuleWithType(IslandConst.UNIT_LIST_DELEGATE_UNIT, iter_6_1)

		if var_6_3 then
			var_6_3:SetFishPonds(var_6_1)
			var_6_3:StartFishing()
		end
	end
end

function var_0_0.EndDelegation(arg_7_0, arg_7_1)
	return
end

function var_0_0.OnUpdate(arg_8_0)
	if #arg_8_0.scheduleList <= 0 then
		return
	end

	if not arg_8_0:GetView():IsLoaded() then
		return
	end

	local var_8_0 = table.remove(arg_8_0.scheduleList, 1)

	arg_8_0:ExecuteDelegation(var_8_0)
end

function var_0_0.OnDestroy(arg_9_0)
	table.clear(arg_9_0.scheduleList)
end

return var_0_0
