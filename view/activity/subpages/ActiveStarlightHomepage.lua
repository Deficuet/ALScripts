local var_0_0 = class("ActiveStarlightHomepage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("bg")
	arg_1_0.Build = arg_1_0:findTF("bg/Build"):GetComponent("Button")
	arg_1_0.Level = arg_1_0:findTF("bg/Level"):GetComponent("Button")
	arg_1_0.Shop = arg_1_0:findTF("bg/Shop"):GetComponent("Button")
	arg_1_0.Manual = arg_1_0:findTF("bg/Manual"):GetComponent("Button")
	arg_1_0.image = arg_1_0:findTF("bg/Manual/image")
end

function var_0_0.OnDataSetting(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("time")
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.Build, function()
		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
			page = BuildShipScene.PAGE_NEWSERVER
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.Level, function()
		arg_3_0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.Shop, function()
		arg_3_0:emit(ActivityMediator.GO_CHANGE_SHOP)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.Manual, function()
		local var_7_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = StarLightMedalAlbumView
		})

		arg_3_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_7_0)
	end, SFX_PANEL)
end

return var_0_0
