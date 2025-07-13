local var_0_0 = class("JiuJiuExpeditionCollectionMediator", import("...base.ContextMediator"))

var_0_0.ON_GET = "JiuJiuExpeditionCollectionMediator:ON_GET"

local var_0_1 = 691

function var_0_0.register(arg_1_0)
	if PLATFORM_CODE == PLATFORM_JP then
		arg_1_0:bind(var_0_0.ON_GET, function(arg_2_0, arg_2_1)
			pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 4,
				activity_id = var_0_1
			})
		end)
	end

	local var_1_0, var_1_1, var_1_2, var_1_3 = JiuJiuExpeditionCollectionMediator.GetCollectionData()

	arg_1_0.viewComponent:SetData(var_1_0, var_1_1, var_1_2, var_1_3)
end

function var_0_0.GetCollectionData()
	local var_3_0 = 1
	local var_3_1 = pg.activity_event_adventure[var_3_0]
	local var_3_2 = var_3_1.boss_list
	local var_3_3 = {}
	local var_3_4 = getProxy(ActivityProxy):getActivityById(var_0_1)
	local var_3_5 = var_3_4.data1
	local var_3_6 = var_3_4.data1_list
	local var_3_7 = var_3_4:getConfig("config_data")

	if var_3_5 == 0 then
		var_3_5 = #var_3_7 + 1
	end

	for iter_3_0 = 1, #var_3_7 do
		local var_3_8 = pg.activity_event_chequer[var_3_7[iter_3_0]].list_boss

		if iter_3_0 < var_3_5 then
			for iter_3_1 = 1, #var_3_8 do
				table.insert(var_3_3, var_3_8[iter_3_1])
			end
		elseif iter_3_0 == var_3_5 and var_3_6 and #var_3_6 > 0 then
			for iter_3_2 = 1, #var_3_6 do
				local var_3_9 = var_3_6[iter_3_2]

				if bit.band(var_3_9, ActivityConst.EXPEDITION_TYPE_BOSS) ~= 0 and bit.band(var_3_9, ActivityConst.EXPEDITION_TYPE_GOT) ~= 0 then
					local var_3_10 = bit.rshift(var_3_9, 4)

					table.insert(var_3_3, var_3_10)
				end
			end
		end
	end

	local var_3_11 = 0

	for iter_3_3 = 1, #var_3_1.boss_list do
		local var_3_12 = var_3_1.boss_list[iter_3_3]
		local var_3_13 = 0

		for iter_3_4 = 1, #var_3_12 do
			if table.contains(var_3_3, var_3_12[iter_3_4]) then
				var_3_13 = var_3_13 + 1
			end
		end

		if var_3_13 == #var_3_12 then
			var_3_11 = var_3_11 + 1
		end
	end

	print("collection")
	print(var_3_4)
	print(var_3_4.data1)

	local var_3_14 = var_3_4.data2_list[1] or var_3_11

	return var_3_2, var_3_3, var_3_11, var_3_14
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		ActivityProxy.ACTIVITY_UPDATED
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()

	if var_5_0 == ActivityProxy.ACTIVITY_UPDATED and var_5_1.id == var_0_1 then
		local var_5_2, var_5_3, var_5_4, var_5_5 = JiuJiuExpeditionCollectionMediator.GetCollectionData()

		arg_5_0.viewComponent:SetData(var_5_2, var_5_3, var_5_4, var_5_5)
		arg_5_0.viewComponent:updateBooks()
		arg_5_0.viewComponent:UpdateTip()
		arg_5_0.viewComponent:OpenBook(var_5_5 + 1)
	end
end

return var_0_0
