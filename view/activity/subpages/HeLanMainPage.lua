local var_0_0 = class("HeLanMainPage", import("...base.BaseActivityPage"))
local var_0_1 = 71132
local var_0_2 = 5901
local var_0_3 = 5901

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.btnList = arg_1_0.bg:Find("btn_list")
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
		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.WORLD_COLLECTION, {
			page = WorldMediaCollectionScene.PAGE_ALBUM
		})
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
	local var_7_0 = false
	local var_7_1, var_7_2 = arg_7_0.timeMgr:inTime(pg.shop_template[var_0_1].time)
	local var_7_3

	if var_7_2 then
		local var_7_4 = arg_7_0.timeMgr:Table2ServerTime(var_7_2)

		var_7_3 = var_0_0:skinCommdityTimeStamps(var_7_4)
	end

	local var_7_5, var_7_6 = arg_7_0.timeMgr:inTime(pg.activity_template[var_0_3].time)
	local var_7_7 = 0

	if var_7_6 then
		local var_7_8 = arg_7_0.timeMgr:Table2ServerTime(var_7_6)

		var_7_7 = var_0_0:skinCommdityTimeStamps(var_7_8)
	end

	if var_7_3 and var_7_3 ~= 0 then
		setActive(arg_7_0.shop_bgtime, true)
		setText(arg_7_0.shop_time, var_7_3)
	else
		setActive(arg_7_0.shop_bgtime, false)
	end

	if var_7_7 and var_7_7 ~= 0 then
		setActive(arg_7_0.build_bgtime, true)
		setText(arg_7_0.build_time, i18n("tolovemainpage_build_countdown"))
	else
		setActive(arg_7_0.build_bgtime, false)
	end

	local var_7_9 = arg_7_0.activity:getConfig("config_client")

	arg_7_0.btnFuncList = {
		shop = function(arg_8_0)
			onButton(arg_7_0, arg_8_0, function()
				if var_7_3 == nil then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_7_0:emit(ActivityMediator.GO_CHANGE_SHOP)
			end)
		end,
		build = function(arg_10_0)
			onButton(arg_7_0, arg_10_0, function()
				if var_7_7 == nil then
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
				arg_7_0:emit(ActivityMediator.BATTLE_OPERA)
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
			return i18n("time_remaining_tip") .. var_14_2 .. i18n("word_hour")
		else
			local var_14_3 = math.floor(var_14_1 / 60)

			if var_14_3 > 0 then
				return i18n("time_remaining_tip") .. var_14_3 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_14_1 .. i18n("word_second")
			end
		end
	end
end

return var_0_0
