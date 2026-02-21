local var_0_0 = class("SardiniaSPMainPage", import("view.activity.CorePage.Helena.HelenaMainPage"))

function var_0_0.OnFirstFlush(arg_1_0)
	var_0_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0.Manual, function()
		local var_2_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = SardiniaSPMedalAlbumView
		})

		arg_1_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_2_0)
	end)
end

function var_0_0.updateUI(arg_3_0)
	if arg_3_0.shop_id then
		local var_3_0, var_3_1 = arg_3_0.timeMgr:inTime(pg.shop_template[arg_3_0.shop_id].time)
		local var_3_2

		if var_3_1 then
			local var_3_3 = arg_3_0.timeMgr:Table2ServerTime(var_3_1)

			var_3_2 = var_0_0:skinCommdityTimeStamps(var_3_3)
		end

		setActive(arg_3_0.shop_bgtime, var_3_2 and var_3_2 ~= 0)
		setText(arg_3_0.shop_time, var_3_2)
		onButton(arg_3_0, arg_3_0.shop, function()
			if var_3_2 == nil or not arg_3_0.shop_id then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			arg_3_0:emit(ActivityMediator.GO_CHANGE_SHOP)
		end)
	end

	local var_3_4, var_3_5 = arg_3_0.timeMgr:inTime(pg.activity_template[arg_3_0.activity.id].time)
	local var_3_6

	if var_3_5 then
		local var_3_7 = arg_3_0.timeMgr:Table2ServerTime(var_3_5)

		var_3_6 = var_0_0:skinCommdityTimeStamps(var_3_7)
	end

	setActive(arg_3_0.build_bgtime, var_3_6 and var_3_6 ~= 0)
	setText(arg_3_0.build_time, i18n("tolovemainpage_build_countdown"))
	onButton(arg_3_0, arg_3_0.build, function()
		if var_3_6 == nil then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
			page = BuildShipScene.PAGE_BUILD,
			projectName = BuildShipScene.PROJECTS.ACTIVITY
		})
	end)
	onButton(arg_3_0, arg_3_0.fight, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.BOSSRUSH_MAIN)
	end)
end

return var_0_0
