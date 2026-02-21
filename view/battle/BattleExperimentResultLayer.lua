local var_0_0 = class("BattleExperimentResultLayer", import(".BattleContributionResultLayer"))

function var_0_0.setPoint(arg_1_0)
	arg_1_0._contributionPoint = 0
end

function var_0_0.skip(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0._delayLeanList) do
		LeanTween.cancel(iter_2_1)
	end

	if arg_2_0._stateFlag == var_0_0.STATE_RANK_ANIMA then
		-- block empty
	elseif arg_2_0._stateFlag == var_0_0.STATE_REPORT then
		local var_2_0 = arg_2_0._conditionContainer.childCount

		while var_2_0 > 0 do
			SetActive(arg_2_0._conditionContainer:GetChild(var_2_0 - 1), true)

			var_2_0 = var_2_0 - 1
		end

		SetActive(arg_2_0._bg:Find("jieuan01/tips"), true)

		arg_2_0._stateFlag = var_0_0.STATE_REPORTED
	elseif arg_2_0._stateFlag == var_0_0.STATE_REPORTED then
		arg_2_0:displayBG()
		SetActive(arg_2_0._bg:Find("jieuan01/tips"), false)
	end
end

function var_0_0.displayBG(arg_3_0)
	local var_3_0 = rtf(arg_3_0._grade)

	LeanTween.moveX(rtf(arg_3_0._conditions), 1300, var_0_0.DURATION_MOVE)
	LeanTween.scale(arg_3_0._grade, Vector3(0.6, 0.6, 0), var_0_0.DURATION_MOVE)
	LeanTween.moveLocal(go(var_3_0), arg_3_0._gradeUpperLeftPos, var_0_0.DURATION_MOVE):setOnComplete(System.Action(function()
		arg_3_0:displayShips()
		arg_3_0:showRightBottomPanel()
		triggerButton(arg_3_0._statisticsBtn)
		arg_3_0:skipAtkAnima(arg_3_0._atkContainerNext)
		arg_3_0:skipAtkAnima(arg_3_0._atkContainer)
		setActive(arg_3_0._statisticsBtn, false)

		arg_3_0._stateFlag = var_0_0.STATE_DISPLAY
	end))
	setActive(arg_3_0._bg:Find("jieuan01/Bomb"), false)
end

function var_0_0.closeStatistics(arg_5_0)
	return
end

function var_0_0.displayShips(arg_6_0)
	arg_6_0._expTFs = {}
	arg_6_0._nameTxts = {}
	arg_6_0._initExp = {}
	arg_6_0._skipExp = {}
	arg_6_0._subSkipExp = {}
	arg_6_0._subCardAnimaFuncList = {}

	local var_6_0 = {}
	local var_6_1 = arg_6_0.shipVOs

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		var_6_0[iter_6_1.id] = iter_6_1
	end

	local var_6_2 = arg_6_0.contextData.statistics

	for iter_6_2, iter_6_3 in ipairs(var_6_1) do
		if var_6_2[iter_6_3.id] then
			var_6_2[iter_6_3.id].vo = iter_6_3
		end
	end

	local var_6_3 = arg_6_0.contextData.oldMainShips
	local var_6_4 = 0

	for iter_6_4, iter_6_5 in ipairs(var_6_3) do
		local var_6_5 = var_6_2[iter_6_5.id]

		if var_6_5 and var_6_4 < var_6_5.output then
			arg_6_0.mvpShipVO = iter_6_5
			var_6_4 = var_6_5.output
		end
	end

	arg_6_0._atkFuncs = {}
	arg_6_0._commonAtkTplList = {}
	arg_6_0._subAtkTplList = {}

	local var_6_6
	local var_6_7

	SetActive(arg_6_0._atkToggle, #var_6_3 > 6)

	if #var_6_3 > 6 then
		onToggle(arg_6_0, arg_6_0._atkToggle, function(arg_7_0)
			SetActive(arg_6_0._atkContainer, arg_7_0)
			SetActive(arg_6_0._atkContainerNext, not arg_7_0)

			if arg_7_0 then
				arg_6_0:skipAtkAnima(arg_6_0._atkContainerNext)
			else
				arg_6_0:skipAtkAnima(arg_6_0._atkContainer)
			end
		end, SFX_PANEL)
	end

	local var_6_8 = {}
	local var_6_9 = {}

	for iter_6_6, iter_6_7 in ipairs(var_6_3) do
		local var_6_10 = var_6_0[iter_6_7.id]

		if var_6_2[iter_6_7.id] then
			local var_6_11 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(iter_6_7.configId).type
			local var_6_12 = table.contains(ShipType.SubShipType, var_6_11)
			local var_6_13
			local var_6_14
			local var_6_15 = 0
			local var_6_16

			if iter_6_6 > 6 then
				var_6_14 = arg_6_0._atkContainerNext
				var_6_16 = 7
			else
				var_6_14 = arg_6_0._atkContainer
				var_6_16 = 1
			end

			local var_6_17 = cloneTplTo(arg_6_0._atkTpl, var_6_14)
			local var_6_18 = var_6_17.localPosition

			var_6_18.x = var_6_18.x + (iter_6_6 - var_6_16) * 74
			var_6_18.y = var_6_18.y + (iter_6_6 - var_6_16) * -124
			var_6_17.localPosition = var_6_18

			local var_6_19 = var_6_17:Find("result/mask/icon")
			local var_6_20 = var_6_17:Find("result/type")

			var_6_19:GetComponent(typeof(Image)).sprite = LoadSprite("herohrzicon/" .. iter_6_7:getPainting())

			local var_6_21 = var_6_2[iter_6_7.id].output / var_6_4
			local var_6_22 = GetSpriteFromAtlas("shiptype", shipType2print(iter_6_7:getShipType()))

			setImageSprite(var_6_20, var_6_22, true)
			arg_6_0:setAtkAnima(var_6_17, var_6_14, var_6_21, var_6_4, arg_6_0.mvpShipVO == iter_6_7, var_6_2[iter_6_7.id].output, var_6_2[iter_6_7.id].kill_count)

			if iter_6_7.id == var_6_2._flagShipID then
				arg_6_0.flagShipVO = iter_6_7
			end
		end
	end
end

return var_0_0
