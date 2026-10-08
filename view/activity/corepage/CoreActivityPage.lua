local var_0_0 = class("CoreActivityPage", import("view.base.BaseSubView"))

function var_0_0.SetShareData(arg_1_0, arg_1_1)
	arg_1_0.shareData = arg_1_1
end

function var_0_0.SetCoreActivityUI(arg_2_0, arg_2_1)
	arg_2_0.coreActivityUI = arg_2_1
end

function var_0_0.SetUIName(arg_3_0, arg_3_1)
	arg_3_0._uiName = arg_3_1
end

function var_0_0.getUIName(arg_4_0)
	return arg_4_0._uiName
end

function var_0_0.Flush(arg_5_0, arg_5_1)
	arg_5_0.activity = arg_5_1

	if arg_5_0:OnDataSetting() then
		return
	end

	if defaultValue(arg_5_0.isFirst, true) then
		arg_5_0.isFirst = false

		arg_5_0:BindPageLink()
		arg_5_0:OnFirstFlush()
	end

	arg_5_0:OnUpdateFlush()
end

function var_0_0.GetAwardPreviewPos(arg_6_0)
	if not arg_6_0.activity then
		return nil
	end

	return arg_6_0.activity:getConfig("config_client").AwardPreviewPos
end

function var_0_0.ShowOrHide(arg_7_0, arg_7_1)
	SetActive(arg_7_0._go, arg_7_1)

	if arg_7_1 then
		local var_7_0 = {}

		arg_7_0:emit(ActivityMainScene.GET_PAGE_BGM, arg_7_0.__cname, var_7_0)

		if var_7_0.bgm then
			pg.BgmMgr.GetInstance():Push(ActivityMainScene.__cname, var_7_0.bgm)
		end

		arg_7_0:OnShowFlush()
	else
		arg_7_0:OnHideFlush()
	end
end

function var_0_0.BindPageLink(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0:GetPageLink()) do
		ActivityConst.PageIdLink[iter_8_1] = arg_8_0.activity.id
	end
end

function var_0_0.SwitchOut(arg_9_0, arg_9_1)
	arg_9_1()
end

function var_0_0.OnInit(arg_10_0)
	return
end

function var_0_0.OnDataSetting(arg_11_0)
	return
end

function var_0_0.GetPageLink(arg_12_0)
	return {}
end

function var_0_0.OnFirstFlush(arg_13_0)
	return
end

function var_0_0.OnUpdateFlush(arg_14_0)
	return
end

function var_0_0.OnHideFlush(arg_15_0)
	return
end

function var_0_0.OnShowFlush(arg_16_0)
	return
end

function var_0_0.OnDestroy(arg_17_0)
	return
end

function var_0_0.UseSecondPage(arg_18_0, arg_18_1)
	return false
end

function var_0_0.IsShowingPopWindow(arg_19_0)
	return false
end

function var_0_0.ClosePopWindow(arg_20_0)
	return
end

function var_0_0.IsShowReminder(arg_21_0)
	return nil
end

return var_0_0
