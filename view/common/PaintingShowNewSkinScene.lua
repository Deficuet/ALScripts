local var_0_0 = class("PaintingShowNewSkinScene", import("view.common.PaintingShowScene"))

function var_0_0.AddSubLayers(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(LatestSkinShopMediator)

	pg.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_1_0,
		context = arg_1_1
	})
end

function var_0_0.closeView(arg_2_0)
	if arg_2_0.loading then
		return
	end

	if not arg_2_0.skinLayerAdded then
		arg_2_0.skinLayerAdded = true

		arg_2_0:AddSubLayers(Context.New({
			mediator = NewSkinMediator,
			viewComponent = NewSkinLayer,
			data = {
				skinId = arg_2_0.contextData.skinId,
				timeLimit = arg_2_0.contextData.timeLimit
			}
		}))
	end

	seriesAsync({
		function(arg_3_0)
			onDelayTick(arg_3_0, 1)
		end
	}, function()
		var_0_0.super.closeView(arg_2_0)
	end)
end

return var_0_0
