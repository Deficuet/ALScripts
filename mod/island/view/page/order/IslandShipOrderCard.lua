local var_0_0 = class("IslandShipOrderCard")
local var_0_1 = Color.New(0.2235294117647059, 0.7450980392156863, 1, 1)
local var_0_2 = Color.New(0.8274509803921568, 0.8274509803921568, 0.8274509803921568, 1)
local var_0_3 = Color.New(0.8588235294117647, 0.8588235294117647, 0.8588235294117647, 1)
local var_0_4 = Color.New(1, 0.6823529411764706, 0.13333333333333333, 1)
local var_0_5 = Color.New(1, 1, 1, 1)

var_0_0.EVENT_CD_END = "IslandShipOrderCard.EVENT_CD_END"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.parent = arg_1_2
	arg_1_0._tf = arg_1_1
	arg_1_0.bgTr = arg_1_1:Find("bg")
	arg_1_0.bgImg = arg_1_1:Find("bg"):GetComponent(typeof(Image))
	arg_1_0.request = arg_1_1:Find("request")
	arg_1_0.refreshBtn = arg_1_1:Find("refresh")
	arg_1_0.requestCG = GetOrAddComponent(arg_1_0.request, typeof(CanvasGroup))
	arg_1_0.uiRequestList = UIItemList.New(arg_1_1:Find("request"), arg_1_1:Find("request/tpl"))
	arg_1_0.titleTr = arg_1_1:Find("title")
	arg_1_0.titleLineImg = arg_1_1:Find("title/line"):GetComponent(typeof(Image))
	arg_1_0.titleTxt = arg_1_1:Find("title/Text"):GetComponent(typeof(Text))
	arg_1_0.loadingTr = arg_1_1:Find("state_loading")
	arg_1_0.loadingRequest = arg_1_1:Find("loading_request")
	arg_1_0.loadingAward = arg_1_1:Find("loading_award")
	arg_1_0.finishTr = arg_1_1:Find("state_finish")
	arg_1_0.award = arg_1_1:Find("award")
	arg_1_0.uiAwardList = UIItemList.New(arg_1_1:Find("award"), arg_1_1:Find("award/tpl"))
	arg_1_0.lockTr = arg_1_1:Find("state_lock")
	arg_1_0.normalTr = arg_1_1:Find("normal_award")
	arg_1_0.levelLockTr = arg_1_1:Find("state_lock/level")
	arg_1_0.levelLockTxt = arg_1_0.levelLockTr:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.resLockTr = arg_1_1:Find("state_lock/gold")
	arg_1_0.resLockTxt = arg_1_0.resLockTr:Find("content/Text"):GetComponent(typeof(Text))
	arg_1_0.timeTxt = arg_1_1:Find("loading_request/time/content/Text"):GetComponent(typeof(Text))
	arg_1_0.getBtn = arg_1_1:Find("state_finish/get")
	arg_1_0.signTr = arg_1_1:Find("sign")
	arg_1_0.resImg = arg_1_1:Find("state_lock/gold/content/icon")
	arg_1_0.reloadingTr = arg_1_1:Find("reloading")
	arg_1_0.reloadingTimerTxt = arg_1_0.reloadingTr:Find("timer/Text"):GetComponent(typeof(Text))

	setText(arg_1_1:Find("loading_award/state/Text"), i18n("island_order_get_label"))
	setText(arg_1_1:Find("normal_award/state/Text"), i18n("island_order_get_label"))
	setText(arg_1_0.getBtn:Find("Text"), i18n("island_order_get_label"))

	arg_1_0.animator = arg_1_1:GetComponent(typeof(Animation))
	arg_1_0.aniDft = arg_1_1:GetComponent(typeof(DftAniEvent))
end

function var_0_0.Flush(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.slot = arg_2_1

	arg_2_0:FlushMain(arg_2_1, arg_2_2)
	arg_2_0:UpdateTimer(arg_2_1)
end

function var_0_0.FlushMain(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:SwitchMode(arg_3_1, arg_3_2)
	arg_3_0:UpdateRequest(arg_3_1)
	arg_3_0:UpdateAward(arg_3_1)
	arg_3_0:UpdateLockTip(arg_3_1)
	arg_3_0:UpdateTitle(arg_3_1)
	arg_3_0:UpdateReloadingTime(arg_3_1)
end

function var_0_0.UpdateRefreshBtn(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_1:CanRefresh()

	setGray(arg_4_0.refreshBtn, not var_4_0, true)

	local var_4_1 = arg_4_2 == IslandShipOrderPage.MODE_REQUEST_VIEW

	setActive(arg_4_0.refreshBtn, arg_4_1:IsWaiting() and var_4_1 and not arg_4_1:IsReloading())
end

function var_0_0.PlayAniamtion(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local function var_5_0()
		arg_5_0.aniDft:SetEndEvent(function()
			arg_5_0.aniDft:SetEndEvent(nil)

			if arg_5_3 then
				arg_5_3()
			end
		end)
	end

	if arg_5_1 == IslandShipOrder.OP_TYPE_UNLOCK then
		var_5_0()
		arg_5_0.animator:Play("anim_island_shiporder_unlock")
	elseif arg_5_1 == IslandShipOrder.OP_TYPE_LOADUP and arg_5_2 then
		var_5_0()
		arg_5_0.animator:Play("anim_island_shiporder_intransit")
	elseif arg_5_1 == IslandShipOrder.OP_TYPE_GET_AWARD then
		var_5_0()
		arg_5_0.animator:Play("anim_island_shiporder_next")
	else
		arg_5_3()
	end
end

function var_0_0.PlayFinishAnimation(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1 then
		local var_8_0 = Clone(arg_8_0.slot)

		var_8_0.endTime = pg.TimeMgr.GetInstance():GetServerTime() + 10

		arg_8_0:FlushMain(var_8_0, arg_8_0.mode)
	end

	arg_8_0.aniDft:SetEndEvent(nil)
	arg_8_0.aniDft:SetEndEvent(function()
		arg_8_0.aniDft:SetEndEvent(nil)

		if arg_8_1 then
			arg_8_0:FlushMain(arg_8_0.slot, arg_8_0.mode)
		end

		if arg_8_2 then
			arg_8_2()
		end
	end)
	arg_8_0.animator:Play("anim_island_shiporder_complete")
end

function var_0_0.SwitchMode(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.mode = arg_10_2

	arg_10_0:UpdateStyle(arg_10_1, arg_10_2)
	arg_10_0:UpdateRefreshBtn(arg_10_1, arg_10_2)
end

function var_0_0.UpdateTimer(arg_11_0, arg_11_1)
	arg_11_0:RemoveTimer()

	if arg_11_1:IsSubmited() and not arg_11_1:IsFinished() then
		arg_11_0:AddTimer(arg_11_1)
	elseif arg_11_1:IsFinished() then
		arg_11_0:PlayFinishAnimation(true)
	end
end

function var_0_0.RemoveTimer(arg_12_0)
	if arg_12_0.timer then
		arg_12_0.timer:Stop()

		arg_12_0.timer = nil
	end
end

function var_0_0.AddTimer(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1:GetEndTime()

	arg_13_0.timer = Timer.New(function(arg_14_0, arg_14_1, arg_14_2)
		local var_14_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_14_1 = var_13_0 - var_14_0

		arg_13_0.timeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_14_1)

		if var_14_1 <= 0 then
			arg_13_0:RemoveTimer()
			arg_13_0:PlayFinishAnimation(function()
				arg_13_0:Flush(arg_13_1, arg_13_0.mode)
			end)
		end
	end, 1, -1)

	arg_13_0.timer.func()
	arg_13_0.timer:Start()
end

function var_0_0.UpdateTitle(arg_16_0, arg_16_1)
	if arg_16_1:IsWaiting() then
		local var_16_0 = arg_16_1:GetNeedTime()

		arg_16_0.titleTxt.text = i18n("island_order_ship_worktime", pg.TimeMgr.GetInstance():DescCDTime(var_16_0))
	elseif arg_16_1:IsSubmited() and not arg_16_1:IsFinished() then
		arg_16_0.titleTxt.text = i18n("island_order_ship_working")
	elseif arg_16_1:IsFinished() then
		arg_16_0.titleTxt.text = i18n("island_order_ship_end_work")
	end
end

function var_0_0.UpdateLockTip(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:GetUnlockLevel()
	local var_17_1 = arg_17_1:GetUnlockGold()

	arg_17_0.levelLockTxt.text = i18n("island_order_ship_unlock_tip")
	arg_17_0.resLockTxt.text = "X" .. var_17_1.count .. i18n("island_order_ship_unlock_tip_2")

	local var_17_2 = pg.island_item_data_template[var_17_1.id].icon

	GetImageSpriteFromAtlasAsync("island/" .. var_17_2, "", arg_17_0.resImg)
end

function var_0_0.UpdateAward(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1:GetOrder():GetAwardList()

	arg_18_0.uiAwardList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = var_18_0[arg_19_1 + 1]
			local var_19_1 = Drop.New(var_19_0)

			updateCustomDrop(arg_19_2, Drop.New(var_19_0))
			onButton(arg_18_0.parent, arg_19_2, function()
				arg_18_0.parent:ShowMsgBox({
					title = i18n("island_word_desc"),
					type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
					dropData = var_19_1
				})
			end)
		end
	end)
	arg_18_0.uiAwardList:align(#var_18_0)
end

function var_0_0.UpdateRequest(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:GetOrder():GetConsumeList()

	arg_21_0.uiRequestList:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_21_0[arg_22_1 + 1]
			local var_22_1 = Drop.New(var_22_0)
			local var_22_2 = var_22_1.icon or var_22_1:getConfig("icon")

			GetImageSpriteFromAtlasAsync("island/" .. var_22_2, "", arg_22_2:Find("icon"))

			local var_22_3 = var_22_1.state == 1
			local var_22_4 = var_22_1:getOwnedCount()

			setText(arg_22_2:Find("cnt"), setColorStr(var_22_4 .. "/" .. var_22_1.count, (var_22_4 >= var_22_1.count or var_22_3) and "#39beff" or "#f36c6e"))
			setActive(arg_22_2:Find("finish"), var_22_3)
			setActive(arg_22_2:Find("loaded"), var_22_3)
			setActive(arg_22_2:Find("loaded_1"), false)
			setActive(arg_22_2:Find("enough"), not var_22_3 and var_22_4 >= var_22_1.count)
		end
	end)
	arg_21_0.uiRequestList:align(#var_21_0)
end

function var_0_0.UpdateStyle(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_1:IsLock()
	local var_23_1 = arg_23_1:IsWaiting()
	local var_23_2 = arg_23_1:IsFinished()
	local var_23_3 = arg_23_1:IsSubmited() and not var_23_2
	local var_23_4 = arg_23_1:CanUnlock()
	local var_23_5 = arg_23_1:IsReloading()
	local var_23_6 = arg_23_2 == IslandShipOrderPage.MODE_REQUEST_VIEW
	local var_23_7 = arg_23_2 == IslandShipOrderPage.MODE_AWARD_VIEW

	setActive(arg_23_0.loadingTr, var_23_3)
	setActive(arg_23_0.loadingRequest, var_23_3 and var_23_6)
	setActive(arg_23_0.loadingAward, var_23_3 and var_23_7)
	setActive(arg_23_0.finishTr, var_23_2 and not var_23_5)
	setActive(arg_23_0.request, not var_23_0 and var_23_6 and not var_23_2 and not var_23_5)
	setActive(arg_23_0.award, (not var_23_0 and var_23_7 or var_23_2) and not var_23_5)
	setActive(arg_23_0.lockTr, var_23_0)
	setActive(arg_23_0.normalTr, var_23_1 and var_23_7 and not var_23_5)
	setActive(arg_23_0.levelLockTr, var_23_0 and not var_23_4)
	setActive(arg_23_0.resLockTr, var_23_0 and var_23_4)
	setActive(arg_23_0.titleTr, not var_23_0 and not var_23_5)
	setActive(arg_23_0.reloadingTr, var_23_5)

	arg_23_0.requestCG.alpha = var_23_3 and 0.6 or 1
	arg_23_0.titleTr.sizeDelta = var_23_1 and Vector2(360, 39) or Vector2(155, 39)

	arg_23_0:UpdateBgColor(arg_23_1)
	arg_23_0:UpdateTitleColor(arg_23_1)
end

function var_0_0.UpdateReloadingTime(arg_24_0, arg_24_1)
	arg_24_0:RemoveReloadingTimer()

	if not arg_24_1:IsReloading() then
		return
	end

	local var_24_0 = arg_24_1:GetReloadingEndTime()

	arg_24_0.reloadingTimer = Timer.New(function()
		local var_25_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_25_1 = var_24_0 - var_25_0

		if var_25_1 <= 0 then
			arg_24_0:RemoveReloadingTimer()

			arg_24_0.reloadingTimerTxt.text = ""

			arg_24_0:Flush(arg_24_1, arg_24_0.mode)
			pg.m02:sendNotification(var_0_0.EVENT_CD_END)
		else
			arg_24_0.reloadingTimerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_25_1)
		end
	end, 1, -1)

	arg_24_0.reloadingTimer:Start()
	arg_24_0.reloadingTimer.func()
end

function var_0_0.RemoveReloadingTimer(arg_26_0)
	if arg_26_0.reloadingTimer then
		arg_26_0.reloadingTimer:Stop()

		arg_26_0.reloadingTimer = nil
	end
end

function var_0_0.UpdateBgColor(arg_27_0, arg_27_1)
	if arg_27_1:IsSubmited() and not arg_27_1:IsFinished() then
		setActive(arg_27_0.bgTr, false)

		return
	end

	setActive(arg_27_0.bgTr, true)

	arg_27_0.bgImg.color = arg_27_1:IsFinished() and var_0_1 or var_0_3
end

function var_0_0.UpdateTitleColor(arg_28_0, arg_28_1)
	if arg_28_1:IsFinished() then
		arg_28_0.titleLineImg.color = var_0_1
	elseif arg_28_1:IsSubmited() and not arg_28_1:IsFinished() then
		arg_28_0.titleLineImg.color = var_0_4
	elseif arg_28_1:IsWaiting() then
		arg_28_0.titleLineImg.color = var_0_2
	end

	arg_28_0.titleTxt.color = arg_28_1:IsWaiting() and var_0_2 or var_0_5
end

function var_0_0.Dispose(arg_29_0)
	arg_29_0:RemoveTimer()
	arg_29_0:RemoveReloadingTimer()
	arg_29_0.aniDft:SetEndEvent(nil)
end

return var_0_0
