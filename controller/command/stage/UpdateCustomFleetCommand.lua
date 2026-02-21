local var_0_0 = class("UpdateCustomFleetCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().chapterId
	local var_1_1 = getProxy(BayProxy):getRawData()
	local var_1_2 = getProxy(ChapterProxy):getChapterById(var_1_0)
	local var_1_3 = Chapter.PackEliteFleetInfo(var_1_2.eliteFleetList)

	pg.ConnectionMgr.GetInstance():Send(13107, {
		id = var_1_0,
		fleet = var_1_3
	}, 13108, function(arg_2_0)
		if arg_2_0.result == 0 then
			-- block empty
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("update_custom_fleet", arg_2_0.result))
		end
	end)
end

return var_0_0
