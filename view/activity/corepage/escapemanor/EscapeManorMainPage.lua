local var_0_0 = class("EscapeManorMainPage", import("view.activity.CorePage.Helena.HelenaMainPage"))

function var_0_0.OnFirstFlush(arg_1_0)
	var_0_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0.Manual, function()
		local var_2_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = EscapeManorMedalAlbumView
		})

		arg_1_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_2_0)
	end)
end

function var_0_0.updateUI(arg_3_0)
	var_0_0.super.updateUI(arg_3_0)
	removeOnButton(arg_3_0.fight)
	onButton(arg_3_0, arg_3_0.fight, function()
		arg_3_0:emit(ActivityMediator.ON_BOSSRUSH_MAP)
	end)
end

return var_0_0
