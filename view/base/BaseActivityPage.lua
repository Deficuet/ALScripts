local var_0_0 = class("BaseActivityPage", import(".BaseSubView"))

function var_0_0.SetShareData(arg_1_0, arg_1_1)
	arg_1_0.shareData = arg_1_1
end

function var_0_0.SetUIName(arg_2_0, arg_2_1)
	arg_2_0._uiName = arg_2_1
end

function var_0_0.getUIName(arg_3_0)
	return arg_3_0._uiName
end

function var_0_0.Init(arg_4_0)
	var_0_0.super.Init(arg_4_0)

	local var_4_0, var_4_1, var_4_2 = arg_4_0:GetBgParams()

	if var_4_0 then
		GetImageSpriteFromAtlasAsync(var_4_1, var_4_2, var_4_0)
	end
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

function var_0_0.ShowOrHide(arg_6_0, arg_6_1)
	SetActive(arg_6_0._go, arg_6_1)

	if arg_6_1 then
		local var_6_0 = {}

		arg_6_0:emit(ActivityMainScene.GET_PAGE_BGM, arg_6_0.__cname, var_6_0)

		if var_6_0.bgm then
			pg.BgmMgr.GetInstance():Push(ActivityMainScene.__cname, var_6_0.bgm)
		end

		arg_6_0:OnShowFlush()
	else
		arg_6_0:OnHideFlush()
	end
end

function var_0_0.BindPageLink(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0:GetPageLink()) do
		ActivityConst.PageIdLink[iter_7_1] = arg_7_0.activity.id
	end
end

function var_0_0.SwitchOut(arg_8_0, arg_8_1)
	arg_8_1()
end

function var_0_0.getResource(arg_9_0)
	local var_9_0 = {
		"ui/" .. arg_9_0:getUIName()
	}
	local var_9_1 = {}

	arg_9_0:emit(ActivityMainScene.GET_PAGE_BGM, arg_9_0.__cname, var_9_1)

	if var_9_1.bgm then
		local var_9_2 = ResPathSupport.GetSoundResList(var_9_1.bgm)

		_.each(var_9_2, function(arg_10_0)
			table.insert(var_9_0, arg_10_0)
		end)
	end

	return var_9_0
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

function var_0_0.GetBgParams(arg_20_0)
	return nil, nil, nil
end

return var_0_0
