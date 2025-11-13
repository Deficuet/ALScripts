local var_0_0 = class("PSSHei5AwardPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "PSSHei5AwardPage"
end

function var_0_0.UpdateActivity(arg_2_0, arg_2_1)
	arg_2_0.activity = arg_2_1 or getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_HEI5)

	for iter_2_0, iter_2_1 in pairs(arg_2_0.activity:GetHei5Info()) do
		arg_2_0[iter_2_0] = iter_2_1
	end
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0:UpdateActivity()

	local var_3_0 = arg_3_0._tf:Find("frame")

	arg_3_0.nextAwardTF = var_3_0:Find("next")
	arg_3_0.btnAll = var_3_0:Find("btns/btn_all")

	setText(arg_3_0.btnAll:Find("Text"), i18n("blackfriday_cruise_btn_all"))

	arg_3_0.scrollCom = GetComponent(var_3_0:Find("view/content"), "LScrollRect")

	function arg_3_0.scrollCom.onUpdateItem(arg_4_0, arg_4_1)
		arg_3_0:UpdateAwardInfo(arg_4_0, tf(arg_4_1), arg_3_0.awardList[arg_4_0 + 1])
	end
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.btnAll, function()
		arg_5_0:GetAllAward()
	end, SFX_CONFIRM)

	local var_5_0 = arg_5_0.scrollCom.onValueChanged

	var_5_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_5_0, var_5_0)
	var_5_0:AddListener(function(arg_7_0)
		arg_5_0:UpdateNextAward(arg_7_0.x)
	end)
end

function var_0_0.Flush(arg_8_0, arg_8_1)
	arg_8_0:Show()

	if arg_8_1 then
		arg_8_0:UpdateActivity(arg_8_1)
	end

	arg_8_0.scrollCom:SetTotalCount(#arg_8_0.awardList)
	arg_8_0:BuildPhaseAwardScrollPos()

	arg_8_0.nextAwardIndex = nil

	local var_8_0 = #arg_8_0.activity:GetHei5UnreceiveAward() > 0

	setActive(arg_8_0.btnAll, var_8_0)
	arg_8_0:UpdateNextAward(arg_8_0.scrollCom.value)
end

function var_0_0.BuildPhaseAwardScrollPos(arg_9_0)
	if arg_9_0.phasePos then
		return
	end

	arg_9_0.phasePos = {}
	arg_9_0.nextPhasePos = {}

	local var_9_0 = arg_9_0.scrollCom:HeadIndexToValue(#arg_9_0.awardList) - arg_9_0.scrollCom:HeadIndexToValue(0)
	local var_9_1 = arg_9_0.scrollCom:HeadIndexToValue(#arg_9_0.awardList - 6) - arg_9_0.scrollCom:HeadIndexToValue(0)

	for iter_9_0 = 1, #arg_9_0.awardList - 1 do
		table.insert(arg_9_0.phasePos, arg_9_0.scrollCom:HeadIndexToValue(iter_9_0 - 1) / var_9_0)
		table.insert(arg_9_0.nextPhasePos, arg_9_0.scrollCom:HeadIndexToValue(iter_9_0 - 1) / var_9_1)
	end
end

function var_0_0.IsSpecialMask(arg_10_0, arg_10_1)
	return arg_10_1 == DROP_TYPE_COMBAT_UI_STYLE or arg_10_1 == DROP_TYPE_SKIN or arg_10_1 == DROP_TYPE_EQUIPMENT_SKIN
end

function var_0_0.UpdateAwardInfo(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_3.id < 10 then
		setText(arg_11_2:Find("Text"), "0" .. arg_11_3.id)
	else
		setText(arg_11_2:Find("Text"), arg_11_3.id)
	end

	local var_11_0 = arg_11_3.pt <= arg_11_0.pt
	local var_11_1 = Drop.Create(arg_11_3.award)

	onButton(arg_11_0, arg_11_2:Find("base"), function()
		arg_11_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
			drop = var_11_1
		})
	end, SFX_CONFIRM)
	setActive(arg_11_2:Find("base/lock"), not var_11_0)
	updateDrop(arg_11_2:Find("base/mask/IconTpl"), var_11_1)
	setActive(arg_11_2:Find("base/get"), var_11_0 and not arg_11_0.awardDic[arg_11_3.pt])
	setActive(arg_11_2:Find("base/got"), arg_11_0.awardDic[arg_11_3.pt])

	local var_11_2 = Drop.Create(arg_11_3.award_pay)

	onButton(arg_11_0, arg_11_2:Find("pay"), function()
		arg_11_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
			drop = var_11_2
		})
	end, SFX_CONFIRM)
	updateDrop(arg_11_2:Find("pay/mask/IconTpl"), var_11_2)
	setActive(arg_11_2:Find("pay/no_pay"), not arg_11_0.isPay and not arg_11_0:IsSpecialMask(var_11_2.type))
	setActive(arg_11_2:Find("pay/get"), arg_11_0.isPay and var_11_0 and not arg_11_0.awardPayDic[arg_11_3.pt])
	setActive(arg_11_2:Find("pay/got"), arg_11_0.awardPayDic[arg_11_3.pt])
end

function var_0_0.UpdateNextAward(arg_14_0, arg_14_1)
	if not arg_14_0.nextPhasePos then
		return
	end

	local var_14_0 = arg_14_0.nextPhasePos[#arg_14_0.nextPhasePos] - 1
	local var_14_1 = #arg_14_0.awardList

	for iter_14_0 = var_14_1 - 1, 1, -1 do
		local var_14_2 = arg_14_0.awardList[iter_14_0]

		if arg_14_0.nextPhasePos[iter_14_0] < arg_14_1 + var_14_0 or var_14_2.pt <= arg_14_0.pt then
			break
		elseif var_14_2.isImportent then
			var_14_1 = iter_14_0
		end
	end

	arg_14_0:UpdateAwardInfo(arg_14_0.nextAwardIndex, arg_14_0.nextAwardTF, arg_14_0.awardList[var_14_1])
end

function var_0_0.GetAllAward(arg_15_0)
	local var_15_0 = arg_15_0.activity:GetHei5UnreceiveAward()

	if #var_15_0 > 0 then
		local var_15_1 = {}

		if arg_15_0:CheckLimitMax(var_15_0) then
			table.insert(var_15_1, function(arg_16_0)
				pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
					contentText = i18n("player_expResource_mail_fullBag"),
					onConfirm = arg_16_0
				})
			end)
		end

		seriesAsync(var_15_1, function()
			arg_15_0:emit(PSSHei5Mediator.EVENT_GET_AWARD_ALL)
		end)
	end
end

function var_0_0.CheckLimitMax(arg_18_0, arg_18_1)
	local var_18_0 = getProxy(PlayerProxy):getData()

	for iter_18_0, iter_18_1 in ipairs(arg_18_1) do
		if iter_18_1.type == DROP_TYPE_RESOURCE then
			if iter_18_1.id == 1 then
				if var_18_0:GoldMax(iter_18_1.count) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title"))

					return true
				end
			elseif iter_18_1.id == 2 and var_18_0:OilMax(iter_18_1.count) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title"))

				return true
			end
		elseif iter_18_1.type == DROP_TYPE_ITEM then
			local var_18_1 = Item.getConfigData(iter_18_1.id)

			if var_18_1.type == Item.EXP_BOOK_TYPE and getProxy(BagProxy):getItemCountById(iter_18_1.id) + iter_18_1.count > var_18_1.max_num then
				return true
			end
		end
	end

	return false
end

function var_0_0.OnDestroy(arg_19_0)
	return
end

return var_0_0
