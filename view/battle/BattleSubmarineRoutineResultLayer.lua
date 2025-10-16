local var_0_0 = class("BattleSubmarineRoutineResultLayer", import(".BattleResultLayer"))

function var_0_0.rankAnimaFinish(arg_1_0)
	local var_1_0 = arg_1_0._tf:Find("main/conditions")

	SetActive(var_1_0, true)
	SetActive(var_1_0:Find("bg16/bg_extra"), true)

	local var_1_1 = arg_1_0.contextData.statistics.subRunResult

	arg_1_0:setCondition(i18n("battle_result_base_score"), "+" .. var_1_1.basePoint, COLOR_BLUE, true)
	arg_1_0:setCondition(i18n("battle_result_dead_score", var_1_1.deadCount), "-" .. var_1_1.losePoint, COLOR_BLUE, true)
	arg_1_0:setCondition(i18n("battle_result_score", var_1_1.score), "+" .. var_1_1.point, COLOR_BLUE, true)
	arg_1_0:setCondition(i18n("battle_result_score_total"), var_1_1.total, COLOR_YELLOW)

	local var_1_2 = LeanTween.delayedCall(1, System.Action(function()
		arg_1_0._stateFlag = var_0_0.STATE_REPORTED

		SetActive(arg_1_0._bg:Find("jieuan01/tips"), true)
	end))

	table.insert(arg_1_0._delayLeanList, var_1_2.id)

	arg_1_0._stateFlag = var_0_0.STATE_REPORT
end

function var_0_0.setCondition(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	local var_3_0 = cloneTplTo(arg_3_0._conditionSubTpl, arg_3_0._conditionContainer)

	setActive(var_3_0, false)

	local var_3_1

	var_3_0:Find("text"):GetComponent(typeof(Text)).text = setColorStr(arg_3_1, "#FFFFFFFF")
	var_3_0:Find("value"):GetComponent(typeof(Text)).text = setColorStr(arg_3_2, arg_3_3)

	if arg_3_4 then
		local var_3_2 = "resources/condition_check"

		arg_3_0:setSpriteTo(var_3_2, var_3_0:Find("checkBox"), true)
	else
		setActive(var_3_0:Find("checkBox"), false)
	end

	local var_3_3 = arg_3_0._conditionContainer.childCount - 1

	if var_3_3 > 0 then
		local var_3_4 = LeanTween.delayedCall(var_0_0.CONDITIONS_FREQUENCE * var_3_3, System.Action(function()
			setActive(var_3_0, true)
		end))

		table.insert(arg_3_0._delayLeanList, var_3_4.id)
	else
		setActive(var_3_0, true)
	end
end

function var_0_0.displayBG(arg_5_0)
	local var_5_0 = rtf(arg_5_0._grade)

	LeanTween.moveX(rtf(arg_5_0._conditions), 1300, var_0_0.DURATION_MOVE)
	LeanTween.scale(arg_5_0._grade, Vector3(0.6, 0.6, 0), var_0_0.DURATION_MOVE)
	LeanTween.moveLocal(go(var_5_0), arg_5_0._gradeUpperLeftPos, var_0_0.DURATION_MOVE):setOnComplete(System.Action(function()
		arg_5_0:displayShips()
		arg_5_0:displayPlayerInfo()
		arg_5_0:playSubExEnter()
	end))
	setActive(arg_5_0._bg:Find("jieuan01/Bomb"), false)
end

function var_0_0.showRightBottomPanel(arg_7_0)
	var_0_0.super.showRightBottomPanel(arg_7_0)
	setText(arg_7_0._playerBonusExp, "+" .. arg_7_0:calcPlayerProgress())
	SetActive(arg_7_0._subToggle, false)
end

return var_0_0
