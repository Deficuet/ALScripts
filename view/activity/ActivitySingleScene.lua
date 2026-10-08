local var_0_0 = class("ActivitySingleScene", import("..base.BaseUI"))

var_0_0.EXIT = "exit"

function var_0_0.preload(arg_1_0, arg_1_1)
	arg_1_1()
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = var_0_0.super.getResource(arg_2_0)
	local var_2_1 = arg_2_0.contextData.activity

	if not var_2_1 and arg_2_0.contextData.id then
		var_2_1 = getProxy(ActivityProxy):getActivityById(arg_2_0.contextData.id)
	end

	if var_2_1 and not var_2_1:isEnd() then
		table.insertto(var_2_0, var_2_1:getPageABNames())
	end

	return var_2_0
end

function var_0_0.getUIName(arg_3_0)
	return "ActivitySingleUI"
end

function var_0_0.init(arg_4_0)
	arg_4_0.shareData = ActivityShareData.New()
	arg_4_0.pageContainer = arg_4_0._tf

	pg.UIMgr.GetInstance():OverlayPanel(arg_4_0._tf)
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:bind(var_0_0.EXIT, function(arg_6_0)
		arg_5_0:emit(var_0_0.ON_BACK)
	end)
end

function var_0_0.setPlayer(arg_7_0, arg_7_1)
	arg_7_0.shareData:SetPlayer(arg_7_1)
end

function var_0_0.setFlagShip(arg_8_0, arg_8_1)
	arg_8_0.shareData:SetFlagShip(arg_8_1)
end

function var_0_0.updateTaskLayers(arg_9_0)
	if not arg_9_0.activity then
		return
	end

	arg_9_0:updateActivity(arg_9_0.activity)
end

function var_0_0.selectActivity(arg_10_0, arg_10_1)
	arg_10_0.activity = arg_10_1

	local var_10_0 = arg_10_1:getConfig("page_info")

	if var_10_0.class_name and not arg_10_1:isEnd() then
		arg_10_0.actPage = import("view.activity.subPages." .. var_10_0.class_name).New(arg_10_0.pageContainer, arg_10_0.event, arg_10_0.contextData)

		if arg_10_0.actPage:UseSecondPage(arg_10_1) then
			arg_10_0.actPage:SetUIName(var_10_0.ui_name2)
		else
			arg_10_0.actPage:SetUIName(var_10_0.ui_name)
		end

		arg_10_0.actPage:SetShareData(arg_10_0.shareData)
		arg_10_0.actPage:Load()
		arg_10_0.actPage:ActionInvoke("Flush", arg_10_0.activity)
		arg_10_0.actPage:ActionInvoke("ShowOrHide", true)
	end
end

function var_0_0.updateActivity(arg_11_0, arg_11_1)
	if ActivityConst.PageIdLink[arg_11_1.id] then
		arg_11_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.PageIdLink[arg_11_1.id])
	end

	if arg_11_1:isShow() and arg_11_1:isCorePage(arg_11_0.contextData.coreName or "") and not arg_11_1:isEnd() and arg_11_0.activity and arg_11_0.activity.id == arg_11_1.id then
		arg_11_0.activity = arg_11_1

		arg_11_0.actPage:ActionInvoke("Flush", arg_11_1)
	end
end

function var_0_0.onBackPressed(arg_12_0)
	arg_12_0.actPage:ActionInvoke("onBackPressed")
	arg_12_0:emit(var_0_0.ON_BACK_PRESSED)
end

function var_0_0.willExit(arg_13_0)
	arg_13_0.shareData = nil

	if arg_13_0.actPage then
		arg_13_0.actPage:Destroy()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf)
end

return var_0_0
