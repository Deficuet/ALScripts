local var_0_0 = class("AtelierStoreBaseMediator", import("view.base.ContextMediator"))

function var_0_0.register(arg_1_0)
	arg_1_0:bind(AtelierMaterialDetailMediator.SHOW_DETAIL, function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1:GetVersion()
		local var_2_1

		if var_2_0 == 1 then
			var_2_1 = AtelierMaterialDetailLayer
		else
			var_2_1 = AtelierMaterialDetailYumiaLayer
		end

		arg_1_0:addSubLayers(Context.New({
			mediator = AtelierMaterialDetailMediator,
			viewComponent = var_2_1,
			data = {
				material = arg_2_1
			}
		}))
	end)
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {
		AtelierCompositeMediator.OPEN_FORMULA
	}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	if var_4_0 == AtelierCompositeMediator.OPEN_FORMULA then
		arg_4_0.viewComponent:closeView()
	end
end

return var_0_0
