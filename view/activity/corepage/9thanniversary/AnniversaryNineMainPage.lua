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
		arg_2_0:emit(ActivityMediator.ON_ADD_SUBLAYER, Context.New({
			mediator = MallAwardMediator,
			viewComponent = MallAwardLayer,
			data = {
				awardHandledByParent = true,
				onExit = function()
					arg_2_0:refreshRed()
				end
			}
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnManual, function()
		local var_5_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = FujinBayMedalAlbumView
		})

		arg_2_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_5_0)
	end, SFX_PANEL)
	setText(arg_2_0.Txtmanual, i18n("anniversary_nine_main_page"))
	arg_2_0:refreshRed()
end

function var_0_0.OnUpdateFlush(arg_6_0)
	arg_6_0:refreshRed()
end

function var_0_0.refreshRed(arg_7_0)
	setActive(arg_7_0.redPoint, var_0_0.IsMallAwardTip())

	local var_7_0, var_7_1 = var_0_0.GetFujinBayMedalTaskCount()

	setActive(arg_7_0.redMalPoint, var_7_1 > 0)
end

function var_0_0.IsShowReminder(arg_8_0)
	return var_0_0.IsTip()
end

function var_0_0.IsMallAwardTip()
	local var_9_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MALL)

	if not var_9_0 or var_9_0:isEnd() then
		return false
	end

	return MallAwardLayer.IsAwardTip() or MallAwardLayer.IsInputTip() or MallAwardLayer.IsTaskTip()
end

function var_0_0.IsTip()
	return var_0_0.IsMallAwardTip() or var_0_0.IsFujinBayMedalTaskTip()
end

function var_0_0.IsFujinBayMedalTaskTip()
	local var_11_0, var_11_1 = var_0_0.GetFujinBayMedalTaskCount()

	return var_11_1 > 0
end

function var_0_0.GetFujinBayMedalTaskCount()
	local var_12_0 = FujinBayMedalAlbumView.GROUP_ID
	local var_12_1 = pg.activity_medal_group[var_12_0]
	local var_12_2 = var_12_1 and var_12_1.activity_link or {}
	local var_12_3

	for iter_12_0, iter_12_1 in ipairs(var_12_2) do
		local var_12_4 = iter_12_1[2]
		local var_12_5 = getProxy(ActivityProxy):getActivityById(var_12_4)

		if var_12_5 and not var_12_5:isEnd() then
			var_12_3 = iter_12_1[3]

			break
		end
	end

	if not var_12_3 then
		return 0, 0, 0
	end

	local var_12_6 = getProxy(TaskProxy)
	local var_12_7 = 0
	local var_12_8 = 0
	local var_12_9 = #var_12_3

	for iter_12_2, iter_12_3 in ipairs(var_12_3) do
		local var_12_10 = var_12_6:getTaskById(iter_12_3) or var_12_6:getFinishTaskById(iter_12_3)

		if var_12_10 then
			local var_12_11 = var_12_10:getTaskStatus()

			if var_12_11 == 1 then
				var_12_8 = var_12_8 + 1
				var_12_7 = var_12_7 + 1
			elseif var_12_11 == 2 then
				var_12_7 = var_12_7 + 1
			end
		end
	end

	return var_12_7, var_12_8, var_12_9
end

return var_0_0
