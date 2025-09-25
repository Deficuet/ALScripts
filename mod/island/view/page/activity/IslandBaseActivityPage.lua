local var_0_0 = class("IslandBaseActivityPage", import("view.base.BaseSubView"))

function var_0_0.SetShareData(arg_1_0, arg_1_1)
	arg_1_0.shareData = arg_1_1
end

function var_0_0.SetUIName(arg_2_0, arg_2_1)
	arg_2_0._uiName = arg_2_1
end

function var_0_0.getUIName(arg_3_0)
	return arg_3_0._uiName
end

function var_0_0.Flush(arg_4_0, arg_4_1)
	arg_4_0.activity = arg_4_1

	if arg_4_0:OnDataSetting() then
		return
	end

	if defaultValue(arg_4_0.isFirst, true) then
		arg_4_0.isFirst = false

		arg_4_0:OnFirstFlush()
	end

	arg_4_0:OnUpdateFlush()
end

function var_0_0.ShowOrHide(arg_5_0, arg_5_1)
	SetActive(arg_5_0._go, arg_5_1)

	if arg_5_1 then
		local var_5_0 = {}

		arg_5_0:emit(ActivityMainScene.GET_PAGE_BGM, arg_5_0.__cname, var_5_0)

		if var_5_0.bgm then
			pg.BgmMgr.GetInstance():Push(ActivityMainScene.__cname, var_5_0.bgm)
		end

		arg_5_0:OnShowFlush()
	else
		arg_5_0:OnHideFlush()
	end
end

function var_0_0.OnInit(arg_6_0)
	return
end

function var_0_0.OnDataSetting(arg_7_0)
	return
end

function var_0_0.OnFirstFlush(arg_8_0)
	return
end

function var_0_0.OnUpdateFlush(arg_9_0)
	return
end

function var_0_0.OnHideFlush(arg_10_0)
	return
end

function var_0_0.OnShowFlush(arg_11_0)
	return
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

function var_0_0.OnLoadLayers(arg_13_0)
	return
end

function var_0_0.OnRemoveLayers(arg_14_0)
	return
end

function var_0_0.UseSecondPage(arg_15_0, arg_15_1)
	return false
end

return var_0_0
