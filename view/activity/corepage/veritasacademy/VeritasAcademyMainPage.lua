local var_0_0 = class("VeritasAcademyMainPage", import("view.activity.CorePage.Helena.HelenaMainPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.super.OnInit(arg_1_0)

	arg_1_0.rpManual = arg_1_0.Manual:Find("tip")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	removeOnButton(arg_2_0.Manual)
	onButton(arg_2_0, arg_2_0.Manual, function()
		local var_3_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = arg_2_0:GetMedalAlbumView()
		})

		arg_2_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_3_0)
	end)
end

function var_0_0.updateUI(arg_4_0)
	var_0_0.super.updateUI(arg_4_0)
	removeOnButton(arg_4_0.fight)
	onButton(arg_4_0, arg_4_0.fight, function()
		arg_4_0:emit(ActivityMediator.ON_BOSSRUSH_MAP)
	end)
end

function var_0_0.GetMedalAlbumView(arg_6_0)
	return VeritasAcademyMedalAlbumView
end

return var_0_0
