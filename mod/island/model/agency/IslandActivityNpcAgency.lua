local var_0_0 = class("IslandActivityNpcAgency", import(".IslandBaseAgency"))

var_0_0.ACTIVITY_NPC_ADD = "IslandActivityNpcAgency:ACTIVITY_NPC_ADD"
var_0_0.ACTIVITY_NPC_UPDATE = "IslandActivityNpcAgency:ACTIVITY_NPC_UPDATE"
var_0_0.ACTIVITY_NPC_DEL = "IslandActivityNpcAgency:ACTIVITY_NPC_DEL"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.activityNpcs = {}
end

function var_0_0.InitNpcList(arg_2_0, arg_2_1)
	arg_2_0.activityNpcs = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
		arg_2_0.activityNpcs[iter_2_1.id] = iter_2_1.object_id
	end
end

function var_0_0.GetNpcList(arg_3_0)
	return arg_3_0.activityNpcs
end

function var_0_0.GetNpcObjects(arg_4_0)
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in pairs(arg_4_0.activityNpcs) do
		table.insert(var_4_0, iter_4_1)
	end

	return var_4_0
end

function var_0_0.AddNpc(arg_5_0, arg_5_1)
	if not arg_5_0:IncludeNpc(arg_5_1) then
		arg_5_0.activityNpcs[arg_5_1.id] = arg_5_1.object_id

		arg_5_0:DispatchEvent(var_0_0.ACTIVITY_NPC_ADD, arg_5_1.object_id)
	end
end

function var_0_0.UpdateNpc(arg_6_0, arg_6_1)
	if arg_6_0:IncludeNpc(arg_6_1) then
		local var_6_0 = arg_6_0.activityNpcs[arg_6_1.id]

		arg_6_0.activityNpcs[arg_6_1.id] = arg_6_1.object_id

		arg_6_0:DispatchEvent(var_0_0.ACTIVITY_NPC_UPDATE, var_6_0, arg_6_1.object_id)
	end
end

function var_0_0.RemoveNpc(arg_7_0, arg_7_1)
	if arg_7_0:IncludeNpc(arg_7_1) then
		local var_7_0 = arg_7_0.activityNpcs[arg_7_1.id]

		arg_7_0.activityNpcs[arg_7_1.id] = nil

		arg_7_0:DispatchEvent(var_0_0.ACTIVITY_NPC_DEL, var_7_0)
	end
end

function var_0_0.IncludeNpc(arg_8_0, arg_8_1)
	return arg_8_0.activityNpcs[npcId] ~= nil
end

return var_0_0
