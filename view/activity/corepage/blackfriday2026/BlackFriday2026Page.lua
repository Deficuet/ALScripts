local var_0_0 = class("BlackFriday2026Page", import("view.activity.CorePage.PSS.PSSHei5Page"))

function var_0_0.OnFirstFlush(arg_1_0)
	var_0_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0.btn, function()
		arg_1_0:emit(ActivityMediator.OPEN_LAYER, Context.New({
			mediator = BlackFriday2026Mediator,
			viewComponent = BlackFriday2026Scene
		}))
	end, SOUND_BACK)
end

return var_0_0
