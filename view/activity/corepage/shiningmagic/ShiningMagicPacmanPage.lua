local var_0_0 = class("ShiningMagicPacmanPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.AD = arg_1_0._tf:Find("AD")
	arg_1_0.btnGo = arg_1_0.AD:Find("btn_act")
	arg_1_0.btnManual = arg_1_0.AD:Find("TopPage/top/manual")
	arg_1_0.Txtmanual = arg_1_0.btnManual:Find("Text")
	arg_1_0.redPoint = arg_1_0.btnGo:Find("red_point")
	arg_1_0.redMalPoint = arg_1_0.btnManual:Find("tip")
end

function var_0_0.OnFirstFlush(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("config_client").medal_group_id
	local var_2_1 = arg_2_0.coreActivityUI:GetActivityIdByPageClass("ShiningMagicInvitationPage")

	if arg_2_0:GetMallActOpen() then
		onButton(arg_2_0, arg_2_0.btnGo, function()
			local var_3_0 = getProxy(ActivityProxy):getActivityById(var_2_1)

			if not (not var_3_0 or var_3_0:isEnd()) then
				updateActivityTaskStatus(var_3_0)

				local var_3_1, var_3_2 = getActivityTask(var_3_0, true)

				if var_3_1 and var_3_2 and not var_3_2:isFinish() then
					pg.m02:sendNotification(GAME.UPDATE_TASK_PROGRESS, {
						taskId = var_3_1
					})
				end
			end

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.REVERSE_PACMAN_HOME)
		end, SFX_PANEL)
	else
		onButton(arg_2_0, arg_2_0.btnGo, function()
			arg_2_0:emit(ActivityMediator.ON_ADD_SUBLAYER, Context.New({
				mediator = ReversePacmanTaskMediator,
				viewComponent = ReversePacmanTaskScene,
				data = {
					awardHandledByParent = true,
					onExit = function()
						arg_2_0:refreshRed()
					end
				}
			}))
		end, SFX_PANEL)
	end

	onButton(arg_2_0, arg_2_0.btnManual, function()
		local var_6_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = arg_2_0:GetMedalGropClassById(var_2_0)
		})

		arg_2_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_6_0)
	end, SFX_PANEL)
	setText(arg_2_0.Txtmanual, i18n("anniversary_nine_main_page"))
	arg_2_0:refreshRed()
end

function var_0_0.GetMallActOpen(arg_7_0)
	local var_7_0 = ReversePacmanTools.GetActivity()

	return var_7_0 ~= nil and not var_7_0:isEnd()
end

function var_0_0.OnUpdateFlush(arg_8_0)
	arg_8_0:refreshRed()
end

function var_0_0.refreshRed(arg_9_0)
	local var_9_0 = arg_9_0.activity:getConfig("config_client")

	if var_9_0.is_showMedal then
		local var_9_1 = var_9_0.medal_group_id

		setActive(arg_9_0.redMalPoint, ActivityMedalGroup.showTip(var_9_1))
	end

	setActive(arg_9_0.redPoint, ReversePacmanTools.GetActivity():readyToAchieve())
end

function var_0_0.GetMedalGropClassById(arg_10_0, arg_10_1)
	local var_10_0 = pg.activity_medal_group[arg_10_1].ui_prefab.scene

	return _G[var_10_0]
end

return var_0_0
