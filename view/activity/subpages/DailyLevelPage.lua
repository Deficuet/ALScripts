local var_0_0 = class("DailyLevelPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.goBtn = arg_1_0._tf:Find("bg/goBtn")
	arg_1_0.levelContant = arg_1_0._tf:Find("bg/titleText/itemList")
	arg_1_0.itemGO = arg_1_0.levelContant:Find("levelItem")

	setText(arg_1_0._tf:Find("bg/titleText"), i18n("open_today"))
	setText(arg_1_0._tf:Find("bg/goBtn/Text"), i18n("daily_level_go"))

	arg_1_0.itemList = UIItemList.New(arg_1_0.levelContant, arg_1_0.itemGO)
end

function var_0_0.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.goBtn, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
	end)
	arg_2_0.itemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_2_0.activeList[arg_4_1 + 1]

			setText(arg_4_2:Find("Text"), pg.expedition_daily_template[var_4_0].title)
		end
	end)
	arg_2_0.activity:SetLoginRedPoint()
end

function var_0_0.OnUpdateFlush(arg_5_0)
	local var_5_0 = pg.expedition_daily_template.all
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		local var_5_2 = pg.expedition_daily_template[iter_5_1]
		local var_5_3 = var_5_2.limit_period

		if var_5_2.limit_type == 1 and table.contains(var_5_2.weekday, tonumber(pg.TimeMgr.GetInstance():GetServerWeek())) and (not var_5_3 or type(var_5_3) ~= "table") then
			table.insert(var_5_1, iter_5_1)
		end
	end

	arg_5_0.activeList = var_5_1

	arg_5_0.itemList:align(#var_5_1)
end

return var_0_0
