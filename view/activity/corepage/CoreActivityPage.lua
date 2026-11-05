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

function var_0_0.Init(arg_5_0)
	var_0_0.super.Init(arg_5_0)

	local var_5_0, var_5_1, var_5_2 = arg_5_0:GetBgParams()

	if var_5_0 then
		GetImageSpriteFromAtlasAsync(var_5_1, var_5_2, var_5_0)
	end
end

function var_0_0.Flush(arg_6_0, arg_6_1)
	arg_6_0.activity = arg_6_1

	if arg_6_0:OnDataSetting() then
		return
	end

	if defaultValue(arg_6_0.isFirst, true) then
		arg_6_0.isFirst = false

		arg_6_0:BindPageLink()
		arg_6_0:OnFirstFlush()
	end

	arg_6_0:OnUpdateFlush()
end

function var_0_0.GetAwardPreviewPos(arg_7_0)
	if not arg_7_0.activity then
		return nil
	end

	return arg_7_0.activity:getConfig("config_client").AwardPreviewPos
end

function var_0_0.ShowOrHide(arg_8_0, arg_8_1)
	SetActive(arg_8_0._go, arg_8_1)

	if arg_8_1 then
		local var_8_0 = {}

		arg_8_0:emit(ActivityMainScene.GET_PAGE_BGM, arg_8_0.__cname, var_8_0)

		if var_8_0.bgm then
			pg.BgmMgr.GetInstance():Push(ActivityMainScene.__cname, var_8_0.bgm)
		end

		arg_8_0:OnShowFlush()
	else
		arg_8_0:OnHideFlush()
	end
end

function var_0_0.BindPageLink(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0:GetPageLink()) do
		ActivityConst.PageIdLink[iter_9_1] = arg_9_0.activity.id
	end
end

function var_0_0.SwitchOut(arg_10_0, arg_10_1)
	arg_10_1()
end

function var_0_0.OnInit(arg_11_0)
	return
end

function var_0_0.OnDataSetting(arg_12_0)
	return
end

function var_0_0.GetPageLink(arg_13_0)
	return {}
end

function var_0_0.OnFirstFlush(arg_14_0)
	return
end

function var_0_0.OnUpdateFlush(arg_15_0)
	return
end

function var_0_0.OnHideFlush(arg_16_0)
	return
end

function var_0_0.OnShowFlush(arg_17_0)
	return
end

function var_0_0.OnDestroy(arg_18_0)
	return
end

function var_0_0.UseSecondPage(arg_19_0, arg_19_1)
	return false
end

function var_0_0.IsShowingPopWindow(arg_20_0)
	return false
end

function var_0_0.ClosePopWindow(arg_21_0)
	return
end

function var_0_0.IsShowReminder(arg_22_0)
	return nil
end

function var_0_0.GetBgParams(arg_23_0)
	return nil, nil, nil
end

return var_0_0
