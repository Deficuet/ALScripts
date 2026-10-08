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

function var_0_0.findTF(arg_2_0, arg_2_1, arg_2_2)
	return findTF(arg_2_2 or arg_2_0._tf, arg_2_1)
end

function var_0_0.OnDataSetting(arg_3_0)
	arg_3_0.timeMgr = pg.TimeMgr.GetInstance()
end

function var_0_0.OnFirstFlush(arg_4_0)
	onButton(arg_4_0, arg_4_0.Manual, function()
		arg_4_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.WORLD_COLLECTION, {
			page = WorldMediaCollectionScene.PAGE_ALBUM
		})
	end)
	arg_4_0:updateUI()
	eachChild(arg_4_0.btnList, function(arg_6_0)
		arg_4_0.btnFuncList[arg_6_0.name](arg_6_0)
	end)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	arg_7_0:updateUI()
end

function var_0_0.updateUI(arg_8_0)
	local var_8_0 = false
	local var_8_1, var_8_2 = arg_8_0.timeMgr:inTime(ShopConst.GetShopConfig(var_0_1).time)
	local var_8_3

	if var_8_2 then
		local var_8_4 = arg_8_0.timeMgr:Table2ServerTime(var_8_2)

		var_8_3 = var_0_0:skinCommdityTimeStamps(var_8_4)
	end

	local var_8_5, var_8_6 = arg_8_0.timeMgr:inTime(pg.activity_template[var_0_3].time)
	local var_8_7 = 0

	if var_8_6 then
		local var_8_8 = arg_8_0.timeMgr:Table2ServerTime(var_8_6)

		var_8_7 = var_0_0:skinCommdityTimeStamps(var_8_8)
	end

	if var_8_3 and var_8_3 ~= 0 then
		setActive(arg_8_0.shop_bgtime, true)
		setText(arg_8_0.shop_time, var_8_3)
	else
		setActive(arg_8_0.shop_bgtime, false)
	end

	if var_8_7 and var_8_7 ~= 0 then
		setActive(arg_8_0.build_bgtime, true)
		setText(arg_8_0.build_time, i18n("tolovemainpage_build_countdown"))
	else
		setActive(arg_8_0.build_bgtime, false)
	end

	local var_8_9 = arg_8_0.activity:getConfig("config_client")

	arg_8_0.btnFuncList = {
		shop = function(arg_9_0)
			onButton(arg_8_0, arg_9_0, function()
				if var_8_3 == nil then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_8_0:emit(ActivityMediator.GO_CHANGE_SHOP)
			end)
		end,
		build = function(arg_11_0)
			onButton(arg_8_0, arg_11_0, function()
				if var_8_7 == nil then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

					return
				end

				arg_8_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
					page = BuildShipScene.PAGE_BUILD,
					projectName = BuildShipScene.PROJECTS.ACTIVITY
				})
			end)
		end,
		fight = function(arg_13_0)
			onButton(arg_8_0, arg_13_0, function()
				arg_8_0:emit(ActivityMediator.BATTLE_OPERA)
			end)
		end
	}
end

function var_0_0.skinCommdityTimeStamps(arg_15_0, arg_15_1)
	local var_15_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_15_1 = math.max(arg_15_1 - var_15_0, 0)

	if math.floor(var_15_1 / 86400) > 0 then
		return 0
	else
		local var_15_2 = math.floor(var_15_1 / 3600)

		if var_15_2 > 0 then
			return i18n("time_remaining_tip") .. var_15_2 .. i18n("word_hour")
		else
			local var_15_3 = math.floor(var_15_1 / 60)

			if var_15_3 > 0 then
				return i18n("time_remaining_tip") .. var_15_3 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_15_1 .. i18n("word_second")
			end
		end
	end
end

return var_0_0
