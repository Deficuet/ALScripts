local var_0_0 = class("ActivityBanProxy", import(".NetProxy"))

var_0_0.TYPE = {
	SCENE = 1
}

function var_0_0.register(arg_1_0)
	arg_1_0:on(11039, function(arg_2_0)
		if arg_2_0.result == 0 then
			arg_1_0:SetData(arg_2_0.ban_list)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

function var_0_0.SetData(arg_3_0, arg_3_1)
	arg_3_0.banList = {}
	arg_3_0.banMediatorDic = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		table.insert(arg_3_0.banList, iter_3_1)

		local var_3_0 = pg.activity_ban[iter_3_1]

		if var_3_0.type == var_0_0.TYPE.SCENE then
			local var_3_1 = var_3_0.mediator
			local var_3_2 = type(var_3_0.data) == "table" and var_3_0.data or {}

			if not arg_3_0.banMediatorDic[var_3_1] then
				arg_3_0.banMediatorDic[var_3_1] = {}
			end

			table.insert(arg_3_0.banMediatorDic[var_3_1], var_3_2)
		end
	end
end

function var_0_0.GetBanMediatorDic(arg_4_0)
	return arg_4_0.banMediatorDic or {}
end

function var_0_0.GetBanList(arg_5_0)
	return arg_5_0.banList or {}
end

function var_0_0.IsBan(arg_6_0)
	local var_6_0 = getProxy(ActivityBanProxy):GetBanList()

	return table.contains(var_6_0, arg_6_0)
end

return var_0_0
