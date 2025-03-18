local var_0_0 = class("MedalAlbumTemplateMediator", import("view.base.ContextMediator"))

var_0_0.ON_TASK_GO = "ON_TASK_GO"
var_0_0.ON_TASK_SUBMIT = "ON_TASK_SUBMIT"

function var_0_0.register(arg_1_0)
	arg_1_0:BindEvent()

	local var_1_0 = getProxy(PlayerProxy):getRawData():getActivityMedalGroup()

	arg_1_0.viewComponent:SetMedalGroupData(var_1_0)

	if arg_1_0:GetContext().parent.mediator.__cname == "WorldMediaCollectionMediator" then
		arg_1_0.viewComponent:ShowPageBtn(true)
	else
		arg_1_0.viewComponent:ShowPageBtn(false)
	end
end

function var_0_0.BindEvent(arg_2_0)
	arg_2_0:bind(var_0_0.ON_TASK_GO, function(arg_3_0, arg_3_1)
		arg_2_0:sendNotification(GAME.TASK_GO, {
			taskVO = arg_3_1
		})
	end)
	arg_2_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_4_0, arg_4_1, arg_4_2)
		seriesAsync({
			function(arg_5_0)
				arg_2_0.awardIndex = 0
				arg_2_0.showAwards = {}

				arg_2_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
					act_id = arg_4_1:getActId(),
					task_ids = {
						arg_4_1.id
					}
				}, arg_4_2)
			end
		}, function()
			return
		end)
	end)
end

function var_0_0.listNotificationInterests(arg_7_0)
	return {
		GAME.SUBMIT_ACTIVITY_TASK_DONE
	}
end

function var_0_0.handleNotification(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getName()
	local var_8_1 = arg_8_1:getBody()

	if var_8_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= "ActivityMediator" then
			arg_8_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_8_1.awards)
		end

		arg_8_0.viewComponent:FlushTaskPanel()
	end
end

return var_0_0
