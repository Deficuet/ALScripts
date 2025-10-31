local var_0_0 = class("IslandVisitorAgency", import(".IslandBaseAgency"))

var_0_0.PLAYER_ADD = "IslandVisitorAgency:PLAYER_ADD"
var_0_0.PLAYER_EXIT = "IslandVisitorAgency:PLAYER_EXIT"
var_0_0.CHANGE_PLAYER_DRESS = "IslandVisitorAgency:CHANGE_DRESS"
var_0_0.VISITOR_ADD = "IslandVisitorAgency:VISITOR_ADD"
var_0_0.VISITOR_EXIT = "IslandVisitorAgency:VISITOR_EXIT"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.playerList = {}
end

function var_0_0.SetPlayerList(arg_2_0, arg_2_1)
	arg_2_0.playerList = arg_2_1
end

function var_0_0.GetPlayerList(arg_3_0)
	return arg_3_0.playerList
end

function var_0_0.GetPlayer(arg_4_0)
	for iter_4_0, iter_4_1 in pairs(arg_4_0.playerList) do
		if iter_4_1:IsSelf() then
			return iter_4_1
		end
	end

	return nil
end

function var_0_0.DeletePlayer(arg_5_0, arg_5_1)
	arg_5_0.playerList[arg_5_1] = nil

	arg_5_0:DispatchEvent(var_0_0.PLAYER_EXIT, {
		id = arg_5_1
	})
end

function var_0_0.AddPlayer(arg_6_0, arg_6_1)
	arg_6_0.playerList[arg_6_1.id] = arg_6_1

	arg_6_0:DispatchEvent(var_0_0.PLAYER_ADD, {
		player = arg_6_1
	})
end

function var_0_0.GetPlayer(arg_7_0, arg_7_1)
	return arg_7_0.playerList[arg_7_1]
end

function var_0_0.InitMapVisitorList(arg_8_0, arg_8_1)
	arg_8_0.mapVisitorList = {}

	for iter_8_0, iter_8_1 in pairs(arg_8_0.playerList) do
		if iter_8_1:IsInMap(arg_8_1) or iter_8_1:IsSelf() then
			arg_8_0.mapVisitorList[iter_8_1.id] = iter_8_1
		end
	end
end

function var_0_0.SetMapVisitorList(arg_9_0, arg_9_1)
	arg_9_0.mapVisitorList = arg_9_1
end

function var_0_0.GetMapVisitorList(arg_10_0)
	return arg_10_0.mapVisitorList
end

function var_0_0.AddMapVisitor(arg_11_0, arg_11_1)
	arg_11_0.mapVisitorList[arg_11_1.id] = arg_11_1

	arg_11_0:DispatchEvent(var_0_0.VISITOR_ADD, {
		player = arg_11_1
	})
end

function var_0_0.DeleteMapVisitor(arg_12_0, arg_12_1)
	arg_12_0.mapVisitorList[arg_12_1] = nil

	arg_12_0:DispatchEvent(var_0_0.VISITOR_EXIT, {
		id = arg_12_1
	})
end

function var_0_0.ChangeDress(arg_13_0, arg_13_1)
	arg_13_0:ChangePlayerDressData(arg_13_1)
	arg_13_0:DispatchEvent(var_0_0.CHANGE_PLAYER_DRESS, arg_13_1)
end

function var_0_0.ChangePlayerDressData(arg_14_0, arg_14_1)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.playerList) do
		if iter_14_1:IsSelf() then
			for iter_14_2, iter_14_3 in pairs(arg_14_1) do
				iter_14_1:ChangeDressUpByType(iter_14_2, iter_14_3.currentItemId)
			end
		end
	end
end

function var_0_0.GetPlayerDressData(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.playerList) do
		if iter_15_1:IsSelf() then
			return iter_15_1:GetDressupData()
		end
	end

	return {}
end

function var_0_0.GetVisitorCnt(arg_16_0)
	local var_16_0 = 0

	for iter_16_0, iter_16_1 in pairs(arg_16_0.playerList) do
		if not iter_16_1:IsSelf() then
			var_16_0 = var_16_0 + 1
		end
	end

	return var_16_0
end

return var_0_0
