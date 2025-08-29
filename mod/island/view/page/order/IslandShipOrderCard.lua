local var_0_0 = class("IslandShipOrderCard")
local var_0_1 = Color.New(0.2235294117647059, 0.7450980392156863, 1, 1)
local var_0_2 = Color.New(0.8274509803921568, 0.8274509803921568, 0.8274509803921568, 1)
local var_0_3 = Color.New(0.8588235294117647, 0.8588235294117647, 0.8588235294117647, 1)
local var_0_4 = Color.New(1, 0.6823529411764706, 0.13333333333333333, 1)
local var_0_5 = Color.New(1, 1, 1, 1)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._tf = arg_1_1
	arg_1_0.bgTr = arg_1_1:Find("bg")
	arg_1_0.bgImg = arg_1_1:Find("bg"):GetComponent(typeof(Image))
	arg_1_0.request = arg_1_1:Find("request")
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
end

function var_0_0.PlayAniamtion(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local function var_4_0()
		arg_4_0.aniDft:SetEndEvent(function()
			arg_4_0.aniDft:SetEndEvent(nil)

			if arg_4_3 then
				arg_4_3()
			end
		end)
	end

	if arg_4_1 == IslandShipOrder.OP_TYPE_UNLOCK then
		var_4_0()
		arg_4_0.animator:Play("anim_island_shiporder_unlock")
	elseif arg_4_1 == IslandShipOrder.OP_TYPE_LOADUP and arg_4_2 then
		var_4_0()
		arg_4_0.animator:Play("anim_island_shiporder_intransit")
	elseif arg_4_1 == IslandShipOrder.OP_TYPE_GET_AWARD then
		var_4_0()
		arg_4_0.animator:Play("anim_island_shiporder_next")
	else
		arg_4_3()
	end
end

function var_0_0.PlayFinishAnimation(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 then
		local var_7_0 = Clone(arg_7_0.slot)

		var_7_0.endTime = pg.TimeMgr.GetInstance():GetServerTime() + 10

		arg_7_0:FlushMain(var_7_0, arg_7_0.mode)
	end

	arg_7_0.aniDft:SetEndEvent(nil)
	arg_7_0.aniDft:SetEndEvent(function()
		arg_7_0.aniDft:SetEndEvent(nil)

		if arg_7_1 then
			arg_7_0:FlushMain(arg_7_0.slot, arg_7_0.mode)
		end

		if arg_7_2 then
			arg_7_2()
		end
	end)
	arg_7_0.animator:Play("anim_island_shiporder_complete")
end

function var_0_0.SwitchMode(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.mode = arg_9_2

	arg_9_0:UpdateStyle(arg_9_1, arg_9_2)
end

function var_0_0.UpdateTimer(arg_10_0, arg_10_1)
	arg_10_0:RemoveTimer()

	if arg_10_1:IsSubmited() and not arg_10_1:IsFinished() then
		arg_10_0:AddTimer(arg_10_1)
	elseif arg_10_1:IsFinished() then
		arg_10_0:PlayFinishAnimation(true)
	end
end

function var_0_0.RemoveTimer(arg_11_0)
	if arg_11_0.timer then
		arg_11_0.timer:Stop()

		arg_11_0.timer = nil
	end
end

function var_0_0.AddTimer(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:GetEndTime()

	arg_12_0.timer = Timer.New(function(arg_13_0, arg_13_1, arg_13_2)
		local var_13_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_13_1 = var_12_0 - var_13_0

		arg_12_0.timeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_13_1)

		if var_13_1 <= 0 then
			arg_12_0:RemoveTimer()
			arg_12_0:PlayFinishAnimation(function()
				arg_12_0:Flush(arg_12_1, arg_12_0.mode)
			end)
		end
	end, 1, -1)

	arg_12_0.timer.func()
	arg_12_0.timer:Start()
end

function var_0_0.UpdateTitle(arg_15_0, arg_15_1)
	if arg_15_1:IsWaiting() then
		local var_15_0 = arg_15_1:GetNeedTime()

		arg_15_0.titleTxt.text = i18n("island_order_ship_worktime", pg.TimeMgr.GetInstance():DescCDTime(var_15_0))
	elseif arg_15_1:IsSubmited() and not arg_15_1:IsFinished() then
		arg_15_0.titleTxt.text = i18n("island_order_ship_working")
	elseif arg_15_1:IsFinished() then
		arg_15_0.titleTxt.text = i18n("island_order_ship_end_work")
	end
end

function var_0_0.UpdateLockTip(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1:GetUnlockLevel()
	local var_16_1 = arg_16_1:GetUnlockGold()

	arg_16_0.levelLockTxt.text = i18n("island_order_ship_unlock_tip")
	arg_16_0.resLockTxt.text = "X" .. var_16_1.count .. i18n("island_order_ship_unlock_tip_2")

	local var_16_2 = pg.island_item_data_template[var_16_1.id].icon

	GetImageSpriteFromAtlasAsync("island/" .. var_16_2, "", arg_16_0.resImg)
end

function var_0_0.UpdateAward(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:GetOrder():GetAwardList()

	arg_17_0.uiAwardList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = var_17_0[arg_18_1 + 1]

			updateCustomDrop(arg_18_2, Drop.New(var_18_0))
		end
	end)
	arg_17_0.uiAwardList:align(#var_17_0)
end

function var_0_0.UpdateRequest(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1:GetOrder():GetConsumeList()

	arg_19_0.uiRequestList:make(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventUpdate then
			local var_20_0 = var_19_0[arg_20_1 + 1]
			local var_20_1 = Drop.New(var_20_0)
			local var_20_2 = var_20_1.icon or var_20_1:getConfig("icon")

			GetImageSpriteFromAtlasAsync("island/" .. var_20_2, "", arg_20_2:Find("icon"))

			local var_20_3 = var_20_1.state == 1
			local var_20_4 = var_20_1:getOwnedCount()

			setText(arg_20_2:Find("cnt"), setColorStr(var_20_4 .. "/" .. var_20_1.count, (var_20_4 >= var_20_1.count or var_20_3) and "#39beff" or "#f36c6e"))
			setActive(arg_20_2:Find("finish"), var_20_3)
			setActive(arg_20_2:Find("loaded"), var_20_3)
			setActive(arg_20_2:Find("loaded_1"), false)
			setActive(arg_20_2:Find("enough"), not var_20_3 and var_20_4 >= var_20_1.count)
		end
	end)
	arg_19_0.uiRequestList:align(#var_19_0)
end

function var_0_0.UpdateStyle(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_1:IsLock()
	local var_21_1 = arg_21_1:IsWaiting()
	local var_21_2 = arg_21_1:IsFinished()
	local var_21_3 = arg_21_1:IsSubmited() and not var_21_2
	local var_21_4 = arg_21_1:CanUnlock()
	local var_21_5 = arg_21_2 == IslandShipOrderPage.MODE_REQUEST_VIEW
	local var_21_6 = arg_21_2 == IslandShipOrderPage.MODE_AWARD_VIEW

	setActive(arg_21_0.loadingTr, var_21_3)
	setActive(arg_21_0.loadingRequest, var_21_3 and var_21_5)
	setActive(arg_21_0.loadingAward, var_21_3 and var_21_6)
	setActive(arg_21_0.finishTr, var_21_2)
	setActive(arg_21_0.request, not var_21_0 and var_21_5 and not var_21_2)
	setActive(arg_21_0.award, not var_21_0 and var_21_6 or var_21_2)
	setActive(arg_21_0.lockTr, var_21_0)
	setActive(arg_21_0.normalTr, var_21_1 and var_21_6)
	setActive(arg_21_0.levelLockTr, var_21_0 and not var_21_4)
	setActive(arg_21_0.resLockTr, var_21_0 and var_21_4)
	setActive(arg_21_0.titleTr, not var_21_0)

	arg_21_0.requestCG.alpha = var_21_3 and 0.6 or 1
	arg_21_0.titleTr.sizeDelta = var_21_1 and Vector2(360, 39) or Vector2(155, 39)

	arg_21_0:UpdateBgColor(arg_21_1)
	arg_21_0:UpdateTitleColor(arg_21_1)
end

function var_0_0.UpdateBgColor(arg_22_0, arg_22_1)
	if arg_22_1:IsSubmited() and not arg_22_1:IsFinished() then
		setActive(arg_22_0.bgTr, false)

		return
	end

	setActive(arg_22_0.bgTr, true)

	arg_22_0.bgImg.color = arg_22_1:IsFinished() and var_0_1 or var_0_3
end

function var_0_0.UpdateTitleColor(arg_23_0, arg_23_1)
	if arg_23_1:IsFinished() then
		arg_23_0.titleLineImg.color = var_0_1
	elseif arg_23_1:IsSubmited() and not arg_23_1:IsFinished() then
		arg_23_0.titleLineImg.color = var_0_4
	elseif arg_23_1:IsWaiting() then
		arg_23_0.titleLineImg.color = var_0_2
	end

	arg_23_0.titleTxt.color = arg_23_1:IsWaiting() and var_0_2 or var_0_5
end

function var_0_0.Dispose(arg_24_0)
	arg_24_0:RemoveTimer()
	arg_24_0.aniDft:SetEndEvent(nil)
end

return var_0_0
