local var_0_0 = class("ZengKeMainPage", import("...base.BaseActivityPage"))
local var_0_1 = 71151
local var_0_2 = 50013
local var_0_3 = 50013

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.btnList = arg_1_0:findTF("btn_list", arg_1_0.bg)
	arg_1_0.build_bgtime = arg_1_0.bg:Find("btn_list/build/build_bgtime")
	arg_1_0.build_time = arg_1_0.bg:Find("btn_list/build/build_bgtime/time")
	arg_1_0.shop_bgtime = arg_1_0.bg:Find("btn_list/shop/shop_bgtime")
	arg_1_0.shop_time = arg_1_0.bg:Find("btn_list/shop/shop_bgtime/time")
	arg_1_0.Manual = arg_1_0.bg:Find("Manual")

	SetActive(arg_1_0.build_bgtime, false)
	SetActive(arg_1_0.shop_bgtime, false)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.timeMgr = pg.TimeMgr.GetInstance()
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.Manual, function()
		local var_4_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = CamouflageCityMedalAlbumView
		})

		arg_3_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_4_0)
	end)
	arg_3_0:updateUI()
	eachChild(arg_3_0.btnList, function(arg_5_0)
		arg_3_0.btnFuncList[arg_5_0.name](arg_5_0)
	end)
end

function var_0_0.OnUpdateFlush(arg_6_0)
	arg_6_0:updateUI()
end

function var_0_0.updateUI(arg_7_0)
	local var_7_0, var_7_1 = arg_7_0.timeMgr:inTime(pg.shop_template[var_0_1].time)
	local var_7_2

	if var_7_1 then
		local var_7_3 = arg_7_0.timeMgr:Table2ServerTime(var_7_1)

		var_7_2 = var_0_0:skinCommdityTimeStamps(var_7_3)
	end

	setActive(arg_7_0.shop_bgtime, var_7_2 and var_7_2 ~= 0)
	setText(arg_7_0.shop_time, var_7_2)

	local var_7_4, var_7_5 = arg_7_0.timeMgr:inTime(pg.activity_template[var_0_3].time)
	local var_7_6

	if var_7_5 then
		local var_7_7 = arg_7_0.timeMgr:Table2ServerTime(var_7_5)

		var_7_6 = var_0_0:skinCommdityTimeStamps(var_7_7)
	end

	setActive(arg_7_0.build_bgtime, var_7_6 and var_7_6 ~= 0)
	setText(arg_7_0.build_time, i18n("tolovemainpage_build_countdown"))

	local var_7_8 = arg_7_0.activity:getConfig("config_client")

	arg_7_0.btnFuncList = {
		shop = function(arg_8_0)
			onButton(arg_7_0, arg_8_0, function()
				if var_7_2 == nil then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_7_0:emit(ActivityMediator.GO_CHANGE_SHOP)
			end)
		end,
		build = function(arg_10_0)
			onButton(arg_7_0, arg_10_0, function()
				if var_7_6 == nil then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_7_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
					page = BuildShipScene.PAGE_BUILD,
					projectName = BuildShipScene.PROJECTS.ACTIVITY
				})
			end)
		end,
		fight = function(arg_12_0)
			onButton(arg_7_0, arg_12_0, function()
				arg_7_0:emit(ActivityMediator.ON_BOSSRUSH_MAP)
			end)
		end
	}
end

function var_0_0.skinCommdityTimeStamps(arg_14_0, arg_14_1)
	local var_14_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_14_1 = math.max(arg_14_1 - var_14_0, 0)

	if math.floor(var_14_1 / 86400) > 0 then
		return 0
	else
		local var_14_2 = math.floor(var_14_1 / 3600)

		if var_14_2 > 0 then
			return var_14_2 .. i18n("word_hour")
		else
			local var_14_3 = math.floor(var_14_1 / 60)

			if var_14_3 > 0 then
				return var_14_3 .. i18n("word_minute")
			else
				return var_14_1 .. i18n("word_second")
			end
		end
	end
end

return var_0_0
