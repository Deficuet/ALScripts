local var_0_0 = class("AnniversaryNineMainPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.AD = arg_1_0._tf:Find("AD")
	arg_1_0.btnGo = arg_1_0.AD:Find("title/btn_act")
	arg_1_0.btnManual = arg_1_0.AD:Find("TopPage/top/manual")
	arg_1_0.Txtmanual = arg_1_0.btnManual:Find("Text")
	arg_1_0.redPoint = arg_1_0.btnGo:Find("red_point")
	arg_1_0.redMalPoint = arg_1_0.btnManual:Find("tip")
end

function var_0_0.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.btnGo, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.MALL_MAP)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnManual, function()
		local var_4_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = FujinBayMedalAlbumView
		})

		arg_2_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_4_0)
	end, SFX_PANEL)
	setText(arg_2_0.Txtmanual, i18n("anniversary_nine_main_page"))
	arg_2_0:refreshRed()
end

function var_0_0.OnUpdateFlush(arg_5_0)
	arg_5_0:refreshRed()
end

function var_0_0.refreshRed(arg_6_0)
	setActive(arg_6_0.redPoint, MallMapScene.IsEntranceTip())

	local var_6_0, var_6_1 = var_0_0.GetFujinBayMedalTaskCount()

	setActive(arg_6_0.redMalPoint, var_6_1 > 0)
end

function var_0_0.IsShowReminder(arg_7_0)
	return var_0_0.IsTip()
end

function var_0_0.IsTip()
	return MallMapScene.IsEntranceTip() or var_0_0.IsFujinBayMedalTaskTip()
end

function var_0_0.IsFujinBayMedalTaskTip()
	local var_9_0, var_9_1 = var_0_0.GetFujinBayMedalTaskCount()

	return var_9_1 > 0
end

function var_0_0.GetFujinBayMedalTaskCount()
	local var_10_0 = FujinBayMedalAlbumView.GROUP_ID
	local var_10_1 = pg.activity_medal_group[var_10_0]
	local var_10_2 = var_10_1 and var_10_1.activity_link or {}
	local var_10_3

	for iter_10_0, iter_10_1 in ipairs(var_10_2) do
		local var_10_4 = iter_10_1[2]
		local var_10_5 = getProxy(ActivityProxy):getActivityById(var_10_4)

		if var_10_5 and not var_10_5:isEnd() then
			var_10_3 = iter_10_1[3]

			break
		end
	end

	if not var_10_3 then
		return 0, 0, 0
	end

	local var_10_6 = getProxy(TaskProxy)
	local var_10_7 = 0
	local var_10_8 = 0
	local var_10_9 = #var_10_3

	for iter_10_2, iter_10_3 in ipairs(var_10_3) do
		local var_10_10 = var_10_6:getTaskById(iter_10_3) or var_10_6:getFinishTaskById(iter_10_3)

		if var_10_10 then
			local var_10_11 = var_10_10:getTaskStatus()

			if var_10_11 == 1 then
				var_10_8 = var_10_8 + 1
				var_10_7 = var_10_7 + 1
			elseif var_10_11 == 2 then
				var_10_7 = var_10_7 + 1
			end
		end
	end

	return var_10_7, var_10_8, var_10_9
end

return var_0_0
