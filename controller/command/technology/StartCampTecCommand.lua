local var_0_0 = class("StartCampTecCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.tecID
	local var_1_2 = var_1_0.levelID
	local var_1_3 = pg.TimeMgr.GetInstance():DescCDTime(pg.fleet_tech_template[var_1_2].time)
	local var_1_4 = getProxy(TechnologyNationProxy)
	local var_1_5 = var_1_4:getStudyingTecItem()

	if var_1_5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("technology_uplevel_error_studying", pg.fleet_tech_group[var_1_5].name))

		return
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("technology_uplevel_error_no_res", pg.fleet_tech_template[var_1_2].cost, var_1_3, math.fmod(var_1_0.levelID, 1000) - 1, math.fmod(var_1_0.levelID, 1000)),
		onYes = function()
			if getProxy(PlayerProxy):getData().gold < pg.fleet_tech_template[var_1_2].cost then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_gold"))

				return
			end

			pg.ConnectionMgr.GetInstance():Send(64001, {
				tech_group_id = var_1_1,
				tech_id = var_1_2
			}, 64002, function(arg_3_0)
				if arg_3_0.result == 0 then
					local var_3_0 = pg.TimeMgr.GetInstance():GetServerTime() + pg.fleet_tech_template[var_1_2].time

					var_1_4:updateTecItem(var_1_1, nil, var_1_2, var_3_0)
					var_1_4:setTimer()
					arg_1_0:sendNotification(TechnologyConst.START_TEC_BTN_SUCCESS, var_1_1)
					var_1_4:refreshRedPoint()
					arg_1_0:sendNotification(TechnologyConst.UPDATE_REDPOINT_ON_TOP)

					local var_3_1 = getProxy(PlayerProxy)
					local var_3_2 = var_3_1:getData()

					var_3_2:consume({
						[id2res(1)] = pg.fleet_tech_template[var_1_2].cost
					})
					var_3_1:updatePlayer(var_3_2)
				else
					pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_cell", arg_3_0.result))
				end
			end)
		end
	})
end

return var_0_0
