local var_0_0 = class("ActivityMallOPCommand", pm.SimpleCommand)

var_0_0.CMD = {
	INPUT_GOLD = 4,
	COMPLETE_ORDER = 2,
	TRIGGER_POINT = 6,
	SET_FLOOR_STAFF = 7,
	START_ORDER = 1,
	SETTLE_ROUND = 3,
	GET_STAFF_DATA = 8
}

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback
	local var_1_2 = getProxy(ActivityProxy)
	local var_1_3 = var_1_0.activity_id
	local var_1_4 = var_1_2:getActivityById(var_1_3)

	if not var_1_4 or var_1_4:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = var_1_0.activity_id,
		cmd = var_1_0.cmd or 0,
		arg1 = var_1_0.arg1 or 0,
		arg2 = var_1_0.arg2 or 0,
		arg_list = var_1_0.arg_list or {}
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_2:getActivityById(var_1_3)
			local var_2_1 = var_2_0:GetLevelData().level
			local var_2_2 = var_2_1

			switch(var_1_0.cmd, {
				[var_0_0.CMD.START_ORDER] = function()
					var_2_0:OnStartOrderDone(var_1_0.arg1, arg_2_0.number[1], var_1_0.arg_list)

					for iter_3_0, iter_3_1 in ipairs(MallOrder.GetCost(var_1_0.arg1)) do
						reducePlayerOwn(iter_3_1)
					end
				end,
				[var_0_0.CMD.COMPLETE_ORDER] = function()
					var_2_2 = arg_2_0.number[1]

					var_2_0:OnCompleteOrderDone(var_1_0.arg1)
				end,
				[var_0_0.CMD.SETTLE_ROUND] = function()
					var_2_2 = arg_2_0.number[1]

					var_2_0:NextRound(arg_2_0.number)
				end,
				[var_0_0.CMD.INPUT_GOLD] = function()
					var_2_0:ReduceGold(var_1_0.arg1)
					pg.TipsMgr.GetInstance():ShowTips(i18n("mall_gold_input_success_tip"))
				end,
				[var_0_0.CMD.TRIGGER_POINT] = function()
					var_2_0:OnTriggerPointDone(var_1_0.arg1)
				end,
				[var_0_0.CMD.SET_FLOOR_STAFF] = function()
					var_2_0:OnUpdateFloorStaffDone(var_1_0.arg_list)
				end,
				[var_0_0.CMD.GET_STAFF_DATA] = function()
					assert(#arg_2_0.number % 2 == 0, "staff attr data must be even")
					var_2_0:SetStaffExtraData(var_1_0.arg1, arg_2_0.number)
				end
			})

			if var_2_2 ~= var_2_1 then
				var_2_0:OnUpgradeDone(var_2_2)
			end

			var_1_2:updateActivity(var_2_0)

			local var_2_3 = {}
			local var_2_4 = PlayerConst.addTranDrop(arg_2_0.award_list)

			arg_1_0:sendNotification(GAME.ACTIVITY_MALL_OP_DONE, {
				cmd = var_1_0.cmd,
				awards = var_2_4,
				levels = {
					var_2_1,
					var_2_2
				},
				completeOrderId = var_1_0.cmd == var_0_0.CMD.COMPLETE_ORDER and var_1_0.arg1 or 0
			})
			existCall(var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
