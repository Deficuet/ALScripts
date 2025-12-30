local var_0_0 = class("WinterFestival2025SkinReSellPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.rtSkinCoupon = arg_1_0._tf:Find("AD/skin_coupon")
	arg_1_0.rtLogin = arg_1_0._tf:Find("AD/login")
	arg_1_0.btnShop = arg_1_0._tf:Find("AD/btn_shop")
	arg_1_0.btnGift = arg_1_0._tf:Find("AD/btn_gift")
	arg_1_0.btnHelp = arg_1_0._tf:Find("AD/btn_help")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.couponItemId = arg_2_0.activity:getConfig("config_client").item_id
	arg_2_0.couponGet = arg_2_0.activity:getData1()

	local var_2_0 = getProxy(ActivityProxy):getActivityById(Item.getConfigData(arg_2_0.couponItemId).link_id)

	arg_2_0.couponCount = var_2_0 and not var_2_0:isEnd() and var_2_0:GetCanUsageCnt() or 0
	arg_2_0.subActivity = getProxy(ActivityProxy):getActivityById(arg_2_0.activity:getConfig("config_client").sub_act_id)
	arg_2_0.nday = arg_2_0.subActivity.data3
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = arg_2_0.subActivity:getConfig("config_data")

	return updateActivityTaskStatus(arg_2_0.subActivity)
end

function var_0_0.GetPageLink(arg_3_0)
	local var_3_0 = arg_3_0.activity:getConfig("config_client").sub_act_id

	return {
		var_3_0
	}
end

function var_0_0.OnFirstFlush(arg_4_0)
	onButton(arg_4_0, arg_4_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = arg_4_0:GetTips()
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.btnShop, function()
		arg_4_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP, {
			page = NewSkinShopScene.PAGE_RETURN
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.btnGift, function()
		arg_4_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.CHARGE, {
			wrap = arg_4_0:GetGiftShopType()
		})
	end, SFX_PANEL)

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.taskGroup) do
		local var_4_0 = iter_4_1[1]
		local var_4_1 = arg_4_0.taskProxy:getTaskVO(var_4_0) or Task.New({
			id = var_4_0
		})
		local var_4_2 = arg_4_0.rtLogin:GetChild(iter_4_0 - 1)

		setText(var_4_2:Find("day/Text"), "DAY" .. iter_4_0)

		local var_4_3 = Drop.Create(var_4_1:getConfig("award_display")[1])

		updateDrop(var_4_2:Find("IconTpl"), var_4_3)
		onButton(arg_4_0, var_4_2:Find("get"), function()
			arg_4_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_4_1)
		end, SFX_CONFIRM)
		onButton(arg_4_0, var_4_2, function()
			arg_4_0:emit(BaseUI.ON_DROP, var_4_3)
		end)
	end

	onButton(arg_4_0, arg_4_0.rtSkinCoupon:Find("icon/get"), function()
		arg_4_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_4_0.activity.id
		})
	end, SFX_CONFIRM)
end

function var_0_0.OnUpdateFlush(arg_11_0)
	local var_11_0 = false

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.taskGroup) do
		local var_11_1 = iter_11_1[1]
		local var_11_2 = arg_11_0.taskProxy:getTaskVO(var_11_1) or Task.New({
			id = var_11_1
		})
		local var_11_3 = arg_11_0.rtLogin:GetChild(iter_11_0 - 1)
		local var_11_4 = var_11_2:isReceive()

		setActive(var_11_3:Find("got"), var_11_4 or iter_11_0 < arg_11_0.nday)
		setActive(var_11_3:Find("get"), not var_11_0 and not var_11_4 and iter_11_0 == arg_11_0.nday)

		var_11_0 = var_11_0 or isActive(var_11_3:Find("get"))
	end

	local var_11_5 = Drop.New({
		type = 8,
		id = arg_11_0.couponItemId,
		count = arg_11_0.couponGet
	})

	onButton(arg_11_0, arg_11_0.rtSkinCoupon:Find("icon"), function()
		arg_11_0:emit(BaseUI.ON_DROP, var_11_5)
	end, SFX_CONFIRM)
	updateDrop(arg_11_0.rtSkinCoupon:Find("icon/IconTpl"), var_11_5)
	setActive(arg_11_0.rtSkinCoupon:Find("icon/get"), arg_11_0.couponGet > 0)
	setText(arg_11_0.rtSkinCoupon:Find("count"), arg_11_0:GetCouponCountText())
	setActive(arg_11_0.rtSkinCoupon:Find("icon/get"), arg_11_0.couponGet > 0)
end

function var_0_0.GetTips(arg_13_0)
	return pg.gametip.SkinDiscountHelp_Winter.tip
end

function var_0_0.GetCouponCountText(arg_14_0)
	return arg_14_0.couponCount
end

function var_0_0.GetGiftShopType(arg_15_0)
	return ChargeScene.TYPE_PICK
end

return var_0_0
