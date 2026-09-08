local var_0_0 = class("ShadowCityMainPage", import("view.activity.CorePage.Helena.HelenaMainPage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.rpManual = arg_1_0.Manual:Find("tip")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.Manual, function()
		local var_3_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = ShadowCityMedalAlbumView
		})

		arg_2_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_3_0)
	end)
end

function var_0_0.OnUpdateFlush(arg_4_0)
	var_0_0.super.OnUpdateFlush(arg_4_0)
	arg_4_0:updateTip()
end

function var_0_0.updateTip(arg_5_0)
	local var_5_0 = arg_5_0.activity:getConfig("config_client").medalGroupId
	local var_5_1 = getProxy(ActivityProxy):getActivityById(var_5_0):readyToAchieve()

	setActive(arg_5_0.rpManual, var_5_1)
end

return var_0_0
