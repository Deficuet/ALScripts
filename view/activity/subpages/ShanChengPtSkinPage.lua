local var_0_0 = class("ShanChengPtSkinPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.shop = arg_1_0.bg:Find("go")
end

function var_0_0.OnFirstFlush(arg_2_0)
	local var_2_0 = getProxy(ActivityProxy):GetShopActivityByRes(Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = arg_2_0.activity:getConfig("config_client").pt_id
	}))

	onButton(arg_2_0, arg_2_0.shop, function()
		arg_2_0:emit(ActivityMediator.GO_SHOPS_LAYER, {
			warp = NewShopsScene.TYPE_ACTIVITY,
			actId = var_2_0 and var_2_0.id
		})
	end)
end

return var_0_0
