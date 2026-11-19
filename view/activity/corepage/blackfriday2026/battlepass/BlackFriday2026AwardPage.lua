local var_0_0 = class("BlackFriday2026AwardPage", import("view.activity.CorePage.PSS.Hei5.PSSHei5AwardPage"))

function var_0_0.getUIName(arg_1_0)
	return "BlackFriday2026AwardPage"
end

function var_0_0.Flush(arg_2_0, arg_2_1)
	arg_2_0:Show()

	if arg_2_1 then
		arg_2_0:UpdateActivity(arg_2_1)
	end

	arg_2_0.scrollCom:SetTotalCount(#arg_2_0.awardList)
	arg_2_0:BuildPhaseAwardScrollPos()

	arg_2_0.nextAwardIndex = nil

	local var_2_0 = #arg_2_0.activity:GetHei5UnreceiveAward() > 0

	setGray(arg_2_0.btnAll, not var_2_0)
	setActive(arg_2_0.btnAll:Find("Image"), var_2_0)
	setTextColor(arg_2_0.btnAll:Find("Text"), var_2_0 and Color.NewHex("#ffffff") or Color.NewHex("#7df39f"))
	setButtonEnabled(arg_2_0.btnAll, var_2_0)
	arg_2_0:UpdateNextAward(arg_2_0.scrollCom.value)
end

function var_0_0.UpdateAwardInfo(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_3.id < 10 then
		setText(arg_3_2:Find("Text"), "0" .. arg_3_3.id)
	else
		setText(arg_3_2:Find("Text"), arg_3_3.id)
	end

	local var_3_0 = arg_3_3.pt <= arg_3_0.pt
	local var_3_1 = Drop.Create(arg_3_3.award)

	onButton(arg_3_0, arg_3_2:Find("base"), function()
		arg_3_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
			drop = var_3_1
		})
	end, SFX_CONFIRM)
	setActive(arg_3_2:Find("base/lock"), not var_3_0)
	updateDrop(arg_3_2:Find("base/mask/IconTpl"), var_3_1)
	setActive(arg_3_2:Find("base/get"), var_3_0 and not arg_3_0.awardDic[arg_3_3.pt])
	setActive(arg_3_2:Find("base/got"), arg_3_0.awardDic[arg_3_3.pt])

	local var_3_2 = Drop.Create(arg_3_3.award_pay)

	onButton(arg_3_0, arg_3_2:Find("pay"), function()
		arg_3_0:emit(BaseUI.ON_NEW_STYLE_DROP, {
			drop = var_3_2
		})
	end, SFX_CONFIRM)
	updateDrop(arg_3_2:Find("pay/mask/IconTpl"), var_3_2)
	setActive(arg_3_2:Find("pay/no_pay"), not var_3_0 or not arg_3_0.isPay)
	setActive(arg_3_2:Find("pay/get"), arg_3_0.isPay and var_3_0 and not arg_3_0.awardPayDic[arg_3_3.pt])
	setActive(arg_3_2:Find("pay/got"), arg_3_0.awardPayDic[arg_3_3.pt])
end

return var_0_0
