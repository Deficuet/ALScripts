local var_0_0 = class("MainPrevPeriodCrusingChargeTipSequence")

var_0_0.TIP = true

function var_0_0.Execute(arg_1_0, arg_1_1)
	if not PrevPeriodCrusingActivity.StaticExistPrevPeriodCrusingActivity() then
		arg_1_1()

		return
	end

	if not var_0_0.TIP then
		arg_1_1()

		return
	end

	arg_1_0.callback = arg_1_1

	arg_1_0:ShowMsgBox()
end

function var_0_0.ShowMsgBox(arg_2_0)
	arg_2_0.mediator = MainPrevPeriodCrusingChargeTipMeidator.New(arg_2_0)

	local var_2_0 = PrevPeriodCrusingChargeTipPage.New(pg.UIMgr.GetInstance().OverlayMain)

	var_2_0:ExecuteAction("Show", function()
		arg_2_0:OnClose()
	end)

	arg_2_0.chargeTipPage = var_2_0
	var_0_0.TIP = false
end

function var_0_0.OnClose(arg_4_0)
	if arg_4_0.callback then
		arg_4_0.callback()
	end

	arg_4_0.callback = nil

	if arg_4_0.mediator then
		arg_4_0.mediator:Dispose()

		arg_4_0.mediator = nil
	end
end

function var_0_0.OnChargeSuccess(arg_5_0, arg_5_1)
	local var_5_0 = Goods.Create({
		shop_id = arg_5_1.shopId
	}, Goods.TYPE_CHARGE)

	if not var_5_0:isPassItem() then
		return
	end

	seriesAsync({
		function(arg_6_0)
			arg_5_0.chargeTipPage:OnChargeScene(var_5_0, arg_6_0)
		end,
		function(arg_7_0)
			MainFetchPrevPeriodCrusingSequence.New():Execute(arg_7_0)
		end
	}, function()
		if arg_5_0.chargeTipPage and arg_5_0.chargeTipPage:GetLoaded() then
			arg_5_0.chargeTipPage:Destroy()

			arg_5_0.chargeTipPage = nil
		end
	end)
end

function var_0_0.GetCurrentCrusingAct(arg_9_0)
	local var_9_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_9_0 and not var_9_0:isEnd() then
		return var_9_0
	end

	return nil
end

return var_0_0
