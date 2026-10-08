local var_0_0 = class("WorldCruiseAwardPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "WorldCruiseAwardPage"
end

function var_0_0.UpdateActivity(arg_2_0, arg_2_1)
	arg_2_0.activity = arg_2_1 or getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	for iter_2_0, iter_2_1 in pairs(arg_2_0.activity:GetCrusingInfo()) do
		arg_2_0[iter_2_0] = iter_2_1
	end
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0:UpdateActivity()

	local var_3_0 = arg_3_0._tf:Find("frame")

	arg_3_0.nextAwardTF = var_3_0:Find("next")
	arg_3_0.btnAll = var_3_0:Find("btns/btn_all")

	setText(arg_3_0.btnAll:Find("Text"), i18n("cruise_btn_all"))

	arg_3_0.btnPay = var_3_0:Find("btns/btn_pay")

	setText(arg_3_0.btnPay:Find("Text"), i18n("cruise_btn_pay"))

	arg_3_0.btnPayPrev = var_3_0:Find("btns/btn_pay_prev")

	setText(arg_3_0.btnPayPrev:Find("Text"), i18n("cruise_btn_pay_prev"))

	arg_3_0.scrollCom = GetComponent(var_3_0:Find("view/content"), "LScrollRect")

	function arg_3_0.scrollCom.onUpdateItem(arg_4_0, arg_4_1)
		arg_3_0:UpdateAwardInfo(arg_4_0, tf(arg_4_1), arg_3_0.awardList[arg_4_0 + 1])
	end
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.btnAll, function()
		arg_5_0:GetAllAward()
	end, SFX_CONFIRM)
	onButton(arg_5_0, arg_5_0.btnPay, function()
		arg_5_0.contextData.windowForCharge:ExecuteAction("ShowBuyWindow")
	end, SFX_CONFIRM)
	onButton(arg_5_0, arg_5_0.btnPayPrev, function()
		arg_5_0.contextData.prevChargePage:ExecuteAction("ShowBuyWindow")
	end, SFX_CONFIRM)

	local var_5_0 = arg_5_0.scrollCom.onValueChanged

	var_5_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_5_0, var_5_0)
	var_5_0:AddListener(function(arg_9_0)
		arg_5_0:UpdateNextAward(arg_9_0.x)
	end)
end

function var_0_0.Flush(arg_10_0, arg_10_1)
	arg_10_0:Show()

	if arg_10_1 then
		arg_10_0:UpdateActivity(arg_10_1)
	end

	arg_10_0:UpdateBtnPayPrev()
	arg_10_0.scrollCom:SetTotalCount(#arg_10_0.awardList - 1)
	arg_10_0:BuildPhaseAwardScrollPos()

	if arg_10_0.phase == 0 then
		arg_10_0.scrollCom:ScrollTo(0)
	elseif arg_10_0.phase == #arg_10_0.awardList then
		arg_10_0.scrollCom:ScrollTo(1)
	else
		arg_10_0.scrollCom:ScrollTo(math.clamp(arg_10_0.phasePos[arg_10_0.phase], 0, 1), true)
	end

	arg_10_0.nextAwardIndex = nil

	local var_10_0 = #arg_10_0.activity:GetCrusingUnreceiveAward() > 0

	setActive(arg_10_0.btnAll, var_10_0)
	setActive(arg_10_0.btnPay, not arg_10_0.isPay)

	if not arg_10_0.isPay then
		local var_10_1 = WorldCruiseChargePage.GetPassID()

		if not pg.TimeMgr.GetInstance():inTime(pg.pay_data_display[var_10_1].time) then
			setActive(arg_10_0.btnPay, false)
		end
	end

	arg_10_0:UpdateNextAward(arg_10_0.scrollCom.value)
end

function var_0_0.UpdateBtnPayPrev(arg_11_0)
	local var_11_0 = PrevPeriodCrusingActivity.StaticExistPrevPeriodCrusingActivity()

	setActive(arg_11_0.btnPayPrev, var_11_0)
end

function var_0_0.BuildPhaseAwardScrollPos(arg_12_0)
	if arg_12_0.phasePos then
		return
	end

	arg_12_0.phasePos = {}
	arg_12_0.nextPhasePos = {}

	local var_12_0 = arg_12_0.scrollCom:HeadIndexToValue(#arg_12_0.awardList) - arg_12_0.scrollCom:HeadIndexToValue(0)
	local var_12_1 = arg_12_0.scrollCom:HeadIndexToValue(#arg_12_0.awardList - 6) - arg_12_0.scrollCom:HeadIndexToValue(0)

	for iter_12_0 = 1, #arg_12_0.awardList - 1 do
		table.insert(arg_12_0.phasePos, arg_12_0.scrollCom:HeadIndexToValue(iter_12_0 - 1) / var_12_0)
		table.insert(arg_12_0.nextPhasePos, arg_12_0.scrollCom:HeadIndexToValue(iter_12_0 - 1) / var_12_1)
	end
end

function var_0_0.IsSpecialMask(arg_13_0, arg_13_1)
	return arg_13_1 == DROP_TYPE_COMBAT_UI_STYLE or arg_13_1 == DROP_TYPE_SKIN or arg_13_1 == DROP_TYPE_EQUIPMENT_SKIN
end

function var_0_0.IsSkinFrame(arg_14_0, arg_14_1)
	return arg_14_1 == DROP_TYPE_SKIN or arg_14_1 == DROP_TYPE_EQUIPMENT_SKIN
end

function var_0_0.IsBattleUIFrame(arg_15_0, arg_15_1)
	return arg_15_1 == DROP_TYPE_COMBAT_UI_STYLE
end

function var_0_0.UpdateAwardInfo(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_2:Find("bg_cur") then
		setActive(arg_16_2:Find("bg_cur"), arg_16_1 + 2 == arg_16_0.phase)
	end

	setText(arg_16_2:Find("Text"), arg_16_3.id)

	local var_16_0 = arg_16_3.pt <= arg_16_0.pt
	local var_16_1 = Drop.Create(arg_16_3.award)

	onButton(arg_16_0, arg_16_2:Find("base"), function()
		arg_16_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
			drop = var_16_1
		})
	end, SFX_CONFIRM)
	updateDrop(arg_16_2:Find("base/mask/IconTpl"), var_16_1)
	setActive(arg_16_2:Find("base/frame_skin"), arg_16_0:IsSkinFrame(var_16_1.type))
	setActive(arg_16_2:Find("base/frame_ui"), arg_16_0:IsBattleUIFrame(var_16_1.type))
	setActive(arg_16_2:Find("base/lock"), not var_16_0)
	setActive(arg_16_2:Find("base/get"), var_16_0 and not arg_16_0.awardDic[arg_16_3.pt])
	setActive(arg_16_2:Find("base/got"), arg_16_0.awardDic[arg_16_3.pt] and not arg_16_0:IsSpecialMask(var_16_1.type))
	setActive(arg_16_2:Find("base/got_frame"), arg_16_0.awardDic[arg_16_3.pt] and arg_16_0:IsSpecialMask(var_16_1.type))

	local var_16_2 = Drop.Create(arg_16_3.award_pay)

	onButton(arg_16_0, arg_16_2:Find("pay"), function()
		arg_16_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
			drop = var_16_2
		})
	end, SFX_CONFIRM)
	updateDrop(arg_16_2:Find("pay/mask/IconTpl"), var_16_2)
	setActive(arg_16_2:Find("pay/frame_skin"), arg_16_0:IsSkinFrame(var_16_2.type))
	setActive(arg_16_2:Find("pay/frame_ui"), arg_16_0:IsBattleUIFrame(var_16_2.type))
	setActive(arg_16_2:Find("pay/no_pay"), not arg_16_0.isPay and not arg_16_0:IsSpecialMask(var_16_2.type))
	setActive(arg_16_2:Find("pay/no_pay_frame"), not arg_16_0.isPay and arg_16_0:IsSpecialMask(var_16_2.type))
	setActive(arg_16_2:Find("pay/lock"), not var_16_0 or not arg_16_0.isPay)
	setActive(arg_16_2:Find("pay/get"), arg_16_0.isPay and var_16_0 and not arg_16_0.awardPayDic[arg_16_3.pt])
	setActive(arg_16_2:Find("pay/got"), arg_16_0.awardPayDic[arg_16_3.pt] and not arg_16_0:IsSpecialMask(var_16_2.type))
	setActive(arg_16_2:Find("pay/got_frame"), arg_16_0.awardPayDic[arg_16_3.pt] and arg_16_0:IsSpecialMask(var_16_2.type))
end

function var_0_0.UpdateNextAward(arg_19_0, arg_19_1)
	if not arg_19_0.nextPhasePos then
		return
	end

	local var_19_0 = arg_19_0.nextPhasePos[#arg_19_0.nextPhasePos] - 1
	local var_19_1 = #arg_19_0.awardList

	for iter_19_0 = var_19_1 - 1, 1, -1 do
		local var_19_2 = arg_19_0.awardList[iter_19_0]

		if arg_19_0.nextPhasePos[iter_19_0] < arg_19_1 + var_19_0 or var_19_2.pt <= arg_19_0.pt then
			break
		elseif var_19_2.isImportent then
			var_19_1 = iter_19_0
		end
	end

	if arg_19_0.nextAwardIndex ~= var_19_1 then
		arg_19_0.nextAwardIndex = var_19_1

		arg_19_0:UpdateAwardInfo(arg_19_0.nextAwardIndex, arg_19_0.nextAwardTF, arg_19_0.awardList[var_19_1])
	end
end

function var_0_0.GetAllAward(arg_20_0)
	local var_20_0 = arg_20_0.activity:GetCrusingUnreceiveAward()

	if #var_20_0 > 0 then
		local var_20_1 = {}

		if arg_20_0:CheckLimitMax(var_20_0) then
			table.insert(var_20_1, function(arg_21_0)
				pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
					contentText = i18n("player_expResource_mail_fullBag"),
					onConfirm = arg_21_0
				})
			end)
		end

		seriesAsync(var_20_1, function()
			arg_20_0:emit(WorldCruiseMediator.EVENT_GET_AWARD_ALL)
		end)
	end
end

function var_0_0.CheckLimitMax(arg_23_0, arg_23_1)
	local var_23_0 = getProxy(PlayerProxy):getData()

	for iter_23_0, iter_23_1 in ipairs(arg_23_1) do
		if iter_23_1.type == DROP_TYPE_RESOURCE then
			if iter_23_1.id == 1 then
				if var_23_0:GoldMax(iter_23_1.count) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title"))

					return true
				end
			elseif iter_23_1.id == 2 and var_23_0:OilMax(iter_23_1.count) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title"))

				return true
			end
		elseif iter_23_1.type == DROP_TYPE_ITEM then
			local var_23_1 = Item.getConfigData(iter_23_1.id)

			if var_23_1.type == Item.EXP_BOOK_TYPE and getProxy(BagProxy):getItemCountById(iter_23_1.id) + iter_23_1.count > var_23_1.max_num then
				return true
			end
		end
	end

	return false
end

function var_0_0.OnDestroy(arg_24_0)
	return
end

return var_0_0
