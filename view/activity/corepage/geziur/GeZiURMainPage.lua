local var_0_0 = class("GeZiURMainPage", import("view.activity.CorePage.Helena.HelenaMainPage"))

function var_0_0.OnFirstFlush(arg_1_0)
	var_0_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0.Manual, function()
		local var_2_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = GeZiMedalAlbumView
		})

		arg_1_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_2_0)
	end)
end

return var_0_0
