local var_0_0 = class("ALYMainPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.AD = arg_1_0:findTF("bg")
	arg_1_0.list = arg_1_0:findTF("list", arg_1_0.AD)
	arg_1_0.build = arg_1_0:findTF("build", arg_1_0.list)
	arg_1_0.fight = arg_1_0:findTF("fight", arg_1_0.list)
	arg_1_0.shop = arg_1_0:findTF("shop", arg_1_0.list)
end

function var_0_0.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.build, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
			page = BuildShipScene.PAGE_BUILD,
			projectName = BuildShipScene.PROJECTS.ACTIVITY
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.fight, function()
		arg_2_0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.shop, function()
		arg_2_0:emit(ActivityMediator.GO_CHANGE_SHOP)
	end, SFX_PANEL)
	setText(arg_2_0:findTF("Text (Legacy)", arg_2_0.build), i18n("yumia_main_tip_1"))
	setText(arg_2_0:findTF("Text (Legacy)", arg_2_0.fight), i18n("yumia_main_tip_2"))
	setText(arg_2_0:findTF("Text (Legacy)", arg_2_0.shop), i18n("yumia_main_tip_3"))
end

function var_0_0.OnDestroy(arg_6_0)
	if arg_6_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_6_0.camEventId)

		arg_6_0.camEventId = nil
	end
end

return var_0_0
