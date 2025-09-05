local var_0_0 = class("RyzaAtelierCompositeRePage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	onButton(arg_1_0, arg_1_0:findTF("adapt/helpBtn"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("ryza_composite_help_tip")
		})
	end)
	onButton(arg_1_0, arg_1_0:findTF("adapt/storeBtn"), function()
		local var_3_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(CoreActivityMainMediator)

		addSubLayer(Context.New({
			mediator = AtelierStoreBaseMediator,
			viewComponent = AtelierStoreBaseScene,
			data = {
				activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)
			}
		}), var_3_0)
	end)
	onButton(arg_1_0, arg_1_0:findTF("adapt/atelierBtn"), function()
		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.ATELIER_COMPOSITE, {
			activityID = 50043,
			versionIndex = 1
		})
	end)
end

return var_0_0
