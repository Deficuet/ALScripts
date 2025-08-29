local var_0_0 = class("IslandGatherCollectAgency", import(".IslandBaseAgency"))

var_0_0.AddGatherUnit = "IslandGatherCollectAgency:AddGatherUnit"
var_0_0.RemoveGatherUnit = "IslandGatherCollectAgency:RemoveGatherUnit"
var_0_0.ShowTpye = {
	FriendSee = 2,
	OnlySelf = 1,
	FriendSeeAndSign = 3
}

function var_0_0.OnInit(arg_1_0)
	return
end

function var_0_0.InitGatherData(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.island_id = arg_2_2
	arg_2_0.gatherDic = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.gather_list) do
		arg_2_0.gatherDic[iter_2_1.id] = IslandWildGatherData.New(iter_2_1, arg_2_3)
	end

	arg_2_0.collectDic = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.fragment_list) do
		arg_2_0.collectDic[iter_2_3.id] = IslandCollectFragmentData.New(iter_2_3, arg_2_3)
	end
end

function var_0_0.UpdateGatherData(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_1.gather_list) do
		local var_3_0
		local var_3_1
		local var_3_2
		local var_3_3

		if iter_3_1.push_type == 1 then
			if arg_3_0.gatherDic[iter_3_1.id] then
				var_3_0, var_3_1, var_3_2, var_3_3 = arg_3_0.gatherDic[iter_3_1.id]:UpdateData(iter_3_1)
			end
		elseif iter_3_1.push_type == 2 then
			if not arg_3_0.gatherDic[iter_3_1.id] then
				arg_3_0.gatherDic[iter_3_1.id] = IslandWildGatherData.New(iter_3_1)
				var_3_0 = true
				var_3_2 = arg_3_0.gatherDic[iter_3_1.id].pos
			end
		elseif arg_3_0.gatherDic[iter_3_1.id] then
			var_3_3 = arg_3_0.gatherDic[iter_3_1.id].pos
			arg_3_0.gatherDic[iter_3_1.id] = nil
			var_3_1 = true
		end

		if var_3_1 then
			arg_3_0:DispatchEvent(var_0_0.RemoveGatherUnit, {
				unitId = var_3_3
			})
		end

		if var_3_0 then
			arg_3_0:DispatchEvent(var_0_0.AddGatherUnit, {
				unitId = var_3_2
			})
		end
	end
end

function var_0_0.UpdateCollectFragmentData(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_1.gather_list) do
		local var_4_0
		local var_4_1
		local var_4_2
		local var_4_3

		if iter_4_1.push_type == 1 then
			if arg_4_0.collectDic[iter_4_1.id] then
				var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_0.collectDic[iter_4_1.id]:UpdateData(iter_4_1)
				unitId = arg_4_0.collectDic[iter_4_1.id].pos
			end
		elseif iter_4_1.push_type == 2 then
			if not arg_4_0.collectDic[iter_4_1.id] then
				arg_4_0.collectDic[iter_4_1.id] = IslandCollectFragmentData.New(iter_4_1)
				var_4_0 = true
				var_4_2 = arg_4_0.collectDic[iter_4_1.id].pos
			end
		elseif arg_4_0.collectDic[iter_4_1.id] then
			var_4_1 = true
			var_4_3 = arg_4_0.collectDic[iter_4_1.id].pos
			arg_4_0.collectDic[iter_4_1.id] = nil
		end

		if var_4_1 then
			arg_4_0:DispatchEvent(var_0_0.RemoveGatherUnit, {
				unitId = var_4_3
			})
		end

		if var_4_0 then
			arg_4_0:DispatchEvent(var_0_0.AddGatherUnit, {
				unitId = var_4_2
			})
		end
	end
end

function var_0_0.GetUnitList(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.gatherDic) do
		if iter_5_1:IsShow() then
			table.insert(var_5_0, {
				unitId = iter_5_1.pos,
				gatherType = IslandConst.UNIT_TYPE_ITEM_GATHER_ITEM
			})
		end
	end

	for iter_5_2, iter_5_3 in pairs(arg_5_0.collectDic) do
		if iter_5_3:IsShow() then
			table.insert(var_5_0, {
				unitId = iter_5_3.pos,
				gatherType = IslandConst.UNIT_TYPE_ITEM_WILD_COLLECT_ITEM
			})
		end
	end

	return var_5_0
end

function var_0_0.GetGatherDataByUnitId(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in pairs(arg_6_0.gatherDic) do
		if iter_6_1.pos == arg_6_1 then
			return iter_6_1
		end
	end

	return nil
end

function var_0_0.GetCollectDataByUnitId(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.collectDic) do
		if iter_7_1.pos == arg_7_1 then
			return iter_7_1
		end
	end

	return nil
end

function var_0_0.CheckGatherCanSign(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0:GetGatherDataByUnitId(arg_8_1)

	if not var_8_0 then
		return false
	end

	return var_8_0:CheckGatherCanShow(arg_8_1)
end

function var_0_0.IsSelf(arg_9_0, arg_9_1)
	return getProxy(PlayerProxy):getRawData().id == arg_9_1
end

return var_0_0
