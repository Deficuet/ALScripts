local var_0_0 = class("EducateBuyCollectCommand", pm.SimpleCommand)

var_0_0.TYPE = {
	ENDING = 1,
	POLAROID = 3,
	MEMORY = 2
}

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.id
	local var_1_3 = var_1_0.cost
	local var_1_4 = getProxy(PlayerProxy)
	local var_1_5 = var_1_4:getData()

	if var_1_3 > var_1_5.gold then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	local var_1_6 = getProxy(EducateProxy)

	if var_1_1 == var_0_0.TYPE.ENDING and table.contains(var_1_6:GetAllEndings(), var_1_2) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_already owned"))

		return
	end

	if var_1_1 == var_0_0.TYPE.MEMORY and table.contains(var_1_6:GetMemories(), var_1_2) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_already owned"))

		return
	end

	if var_1_1 == var_0_0.TYPE.POLAROID and table.contains(var_1_6:GetPolaroidList(), var_1_2) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_already owned"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(27049, {
		type = var_1_1,
		ids = var_1_2
	}, 27050, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_5:consume({
				gold = var_1_3
			})
			var_1_4:updatePlayer(var_1_5)
			switch(var_1_1, {
				[var_0_0.TYPE.ENDING] = function()
					var_1_6:AddEndingFromBuy(var_1_2)
					var_1_6:AddEndingBuyCnt()
				end,
				[var_0_0.TYPE.MEMORY] = function()
					var_1_6:AddMemory(var_1_2)
					var_1_6:AddMemoryBuyCnt()
				end,
				[var_0_0.TYPE.POLAROID] = function()
					local var_5_0 = pg.child_polaroid[var_1_2].group
					local var_5_1 = pg.child_polaroid.get_id_list_by_group[var_5_0]

					for iter_5_0, iter_5_1 in ipairs(var_5_1) do
						var_1_6:AddPolaroid(iter_5_1)
					end

					var_1_6:AddPolaroidBuyCnt()
				end
			})
			pg.TipsMgr.GetInstance():ShowTips(i18n("child_buy_collect_success"))
			arg_1_0:sendNotification(GAME.EDUCATE_BUY_COLLECT_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("educate buy collect error: ", arg_2_0.result))
		end
	end)
end

return var_0_0
