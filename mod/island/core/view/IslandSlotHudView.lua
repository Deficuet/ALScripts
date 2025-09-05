local var_0_0 = class("IslandSlotHudView", import(".IslandBaseOpView"))
local var_0_1 = 4

function var_0_0.GetUIName(arg_1_0)
	return "IslandSlotHudUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0._go = arg_2_1
	arg_2_0._tf = arg_2_1.transform
	arg_2_0.parent = arg_2_0._tf:Find("look")
	arg_2_0.hideHudDic = {}
	arg_2_0.unitHideHudQueue = {}
end

function var_0_0.Update(arg_3_0)
	if arg_3_0.currentHud then
		arg_3_0.currentHud:Update()
	end
end

function var_0_0.LateUpdate(arg_4_0)
	if arg_4_0.currentHud then
		arg_4_0.currentHud:LateUpdate()
	end
end

function var_0_0.ShowHud(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_1 == nil then
		return
	end

	if arg_5_0.currentHud then
		if arg_5_0.currentHud.unitId == arg_5_1 then
			return
		end

		arg_5_0:HideUnitHud(arg_5_0.currentHud.unitId)
	end

	arg_5_0:ShowUnitHud(arg_5_1, arg_5_2)
end

function var_0_0.UpdateHud(arg_6_0, arg_6_1)
	if arg_6_1 == nil then
		return
	end

	local var_6_0 = arg_6_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_6_1)

	if not var_6_0 then
		return
	end

	local var_6_1 = var_6_0:GetHudInfo()

	if not arg_6_0.currentHud then
		return
	end

	if arg_6_0.currentHud.unitId == arg_6_1 then
		arg_6_0.currentHud:UpdateUnitHud(var_6_1)
	end
end

function var_0_0.HideUnitHud(arg_7_0, arg_7_1)
	if not arg_7_0.currentHud then
		return
	end

	if arg_7_0.currentHud.unitId == arg_7_1 then
		arg_7_0.currentHud:HideHud()
		arg_7_0:InPool(arg_7_0.currentHud)

		arg_7_0.currentHud = nil
	end
end

function var_0_0.InPool(arg_8_0, arg_8_1)
	local var_8_0

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.unitHideHudQueue) do
		if iter_8_1 == arg_8_1.unitId then
			var_8_0 = iter_8_0
		end
	end

	if var_8_0 then
		table.remove(arg_8_0.unitHideHudQueue, var_8_0)
	end

	table.insert(arg_8_0.unitHideHudQueue, arg_8_1.unitId)

	arg_8_0.hideHudDic[arg_8_1.unitId] = arg_8_1

	if #arg_8_0.unitHideHudQueue > var_0_1 then
		local var_8_1 = arg_8_0.unitHideHudQueue[1]

		table.remove(arg_8_0.unitHideHudQueue, 1)
		arg_8_0.hideHudDic[var_8_1]:Dispose()

		arg_8_0.hideHudDic[var_8_1] = nil
	end
end

function var_0_0.ShowUnitHud(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_9_1):GetHudInfo()

	if arg_9_0.hideHudDic[arg_9_1] then
		arg_9_0.currentHud = arg_9_0.hideHudDic[arg_9_1]

		arg_9_0.currentHud:ShowUnitHud(arg_9_1, var_9_0, arg_9_2)
	else
		if not arg_9_0.currentHud then
			arg_9_0.currentHud = IslandHudPanel.New(arg_9_0.parent, arg_9_0.view)

			arg_9_0.currentHud:ShowUnitHud(arg_9_1, var_9_0, arg_9_2)
			arg_9_0.currentHud:Init()

			return
		end

		arg_9_0.currentHud:ShowUnitHud(arg_9_1, var_9_0, arg_9_2)
	end
end

function var_0_0.OnDestroy(arg_10_0)
	return
end

return var_0_0
