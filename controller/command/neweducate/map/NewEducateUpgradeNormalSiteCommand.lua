local var_0_0 = class("NewEducateUpgradeNormalSiteCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0 and var_1_0.callback
	local var_1_2 = var_1_0.id
	local var_1_3 = var_1_0.normalId

	if getProxy(NewEducateProxy):GetCurChar():GetFSM():CheckPriorityStystem() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("child2_priority_tip"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(29070, {
		id = var_1_2,
		work_id = var_1_3
	}, 29071, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = pg.child2_site_normal[var_1_3]
			local var_2_1 = pg.child2_site_normal.get_id_list_by_character[var_1_2]
			local var_2_2 = underscore.detect(var_2_1, function(arg_3_0)
				local var_3_0 = pg.child2_site_normal[arg_3_0]

				return var_3_0.type == var_2_0.type and var_3_0.site_lv == var_2_0.site_lv + 1
			end)

			getProxy(NewEducateProxy):GetCurChar():UpdateNormalType2Id(var_2_0.type, var_2_2)
			existCall(var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_UpgradeNormalSite: " .. arg_2_0.result)
		end
	end)
end

return var_0_0
