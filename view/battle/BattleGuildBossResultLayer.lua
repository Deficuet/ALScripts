local var_0_0 = class("BattleGuildBossResultLayer", import(".BattleResultLayer"))

function var_0_0.showRightBottomPanel(arg_1_0)
	var_0_0.super.showRightBottomPanel(arg_1_0)
	SetActive(arg_1_0._rightBottomPanel, false)

	local var_1_0 = arg_1_0._blurConatiner:Find("activitybossConfirmPanel")

	setActive(var_1_0, true)
	onButton(arg_1_0, var_1_0:Find("statisticsBtn"), function()
		triggerButton(arg_1_0._statisticsBtn)
	end, SFX_PANEL)
	setText(var_1_0:Find("confirmBtn/Image"), i18n("text_confirm"))
	onButton(arg_1_0, var_1_0:Find("confirmBtn"), function()
		triggerButton(arg_1_0._confirmBtn)
	end, SFX_CONFIRM)
	setText(var_1_0:Find("confirmBtn/Image"), i18n("text_confirm"))
end

function var_0_0.didEnter(arg_4_0)
	var_0_0.super.didEnter(arg_4_0)
	arg_4_0:setPoint()
end

function var_0_0.setGradeLabel(arg_5_0)
	local var_5_0 = arg_5_0._tf:Find("grade/Xyz/bg13")
	local var_5_1 = arg_5_0._tf:Find("grade/Xyz/bg14")

	setActive(var_5_0, false)

	local var_5_2 = "battlescore/grade_label_clear"

	LoadImageSpriteAsync(var_5_2, var_5_1, false)
end

function var_0_0.rankAnimaFinish(arg_6_0)
	setActive(arg_6_0._conditionBGNormal, false)
	setActive(arg_6_0._conditionBGContribute, true)
	arg_6_0:setCondition(i18n("battle_result_total_damage"), arg_6_0.contextData.statistics.specificDamage, COLOR_BLUE)
	arg_6_0:setCondition(i18n("battle_result_contribution"), arg_6_0._contributionPoint, COLOR_YELLOW)

	local var_6_0 = LeanTween.delayedCall(1, System.Action(function()
		arg_6_0._stateFlag = var_0_0.STATE_REPORTED

		SetActive(arg_6_0._bg:Find("jieuan01/tips"), true)
	end))

	table.insert(arg_6_0._delayLeanList, var_6_0.id)

	arg_6_0._stateFlag = var_0_0.STATE_REPORT
end

function var_0_0.setCondition(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = cloneTplTo(arg_8_0._conditionContributeTpl, arg_8_0._conditionContainer)

	setActive(var_8_0, false)

	local var_8_1

	var_8_0:Find("text"):GetComponent(typeof(Text)).text = setColorStr(arg_8_1, "#FFFFFFFF")
	var_8_0:Find("value"):GetComponent(typeof(Text)).text = setColorStr(arg_8_2, arg_8_3)

	local var_8_2 = arg_8_0._conditionContainer.childCount - 1

	if var_8_2 > 0 then
		local var_8_3 = LeanTween.delayedCall(var_0_0.CONDITIONS_FREQUENCE * var_8_2, System.Action(function()
			setActive(var_8_0, true)
		end))

		table.insert(arg_8_0._delayLeanList, var_8_3.id)
	else
		setActive(var_8_0, true)
	end
end

function var_0_0.setActId(arg_10_0, arg_10_1)
	return
end

function var_0_0.showRewardInfo(arg_11_0)
	arg_11_0._stateFlag = var_0_0.STATE_REWARD

	SetActive(arg_11_0._bg:Find("jieuan01/tips"), false)
	arg_11_0:displayBG()
end

function var_0_0.setPoint(arg_12_0)
	arg_12_0._contributionPoint = 0

	local var_12_0 = pg.guildset.guild_damage_resource.key_value

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.contextData.drops) do
		if iter_12_1.configId == var_12_0 then
			arg_12_0._contributionPoint = iter_12_1.count
		end
	end

	setActive(arg_12_0._tf:Find("blur_container/activitybossConfirmPanel/playAgain"), false)
end

function var_0_0.displayShips(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = arg_13_0.shipVOs

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		var_13_0[iter_13_1.id] = iter_13_1
	end

	local var_13_2 = arg_13_0.contextData.statistics

	for iter_13_2, iter_13_3 in ipairs(var_13_1) do
		if var_13_2[iter_13_3.id] then
			var_13_2[iter_13_3.id].vo = iter_13_3
		end
	end

	local var_13_3
	local var_13_4

	if var_13_2.mvpShipID and var_13_2.mvpShipID ~= 0 then
		var_13_3 = var_13_2[var_13_2.mvpShipID]
		var_13_4 = var_13_3.output
	else
		var_13_4 = 0
	end

	local var_13_5 = arg_13_0.contextData.oldMainShips

	arg_13_0._atkFuncs = {}

	local var_13_6
	local var_13_7

	SetActive(arg_13_0._atkToggle, #var_13_5 > 6)

	if #var_13_5 > 6 then
		onToggle(arg_13_0, arg_13_0._atkToggle, function(arg_14_0)
			SetActive(arg_13_0._atkContainer, arg_14_0)
			SetActive(arg_13_0._atkContainerNext, not arg_14_0)

			if arg_14_0 then
				arg_13_0:skipAtkAnima(arg_13_0._atkContainerNext)
			else
				arg_13_0:skipAtkAnima(arg_13_0._atkContainer)
			end
		end, SFX_PANEL)
	end

	local var_13_8 = {}
	local var_13_9 = {}

	for iter_13_4, iter_13_5 in ipairs(var_13_5) do
		local var_13_10 = var_13_0[iter_13_5.id] or iter_13_5

		if var_13_2[iter_13_5.id] then
			local var_13_11 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(iter_13_5.configId).type
			local var_13_12 = table.contains(ShipType.SubShipType, var_13_11)
			local var_13_13
			local var_13_14
			local var_13_15 = 0
			local var_13_16

			if iter_13_4 > 6 then
				var_13_14 = arg_13_0._atkContainerNext
				var_13_16 = 7
			else
				var_13_14 = arg_13_0._atkContainer
				var_13_16 = 1
			end

			local var_13_17 = cloneTplTo(arg_13_0._atkTpl, var_13_14)
			local var_13_18 = var_13_17.localPosition

			var_13_18.x = var_13_18.x + (iter_13_4 - var_13_16) * 74
			var_13_18.y = var_13_18.y + (iter_13_4 - var_13_16) * -124
			var_13_17.localPosition = var_13_18

			local var_13_19 = findTF(var_13_17, "result/stars")
			local var_13_20 = findTF(var_13_17, "result/stars/star_tpl")
			local var_13_21 = iter_13_5:getStar()
			local var_13_22 = iter_13_5:getMaxStar()

			while var_13_22 > 0 do
				local var_13_23 = cloneTplTo(var_13_20, var_13_19)

				SetActive(var_13_23:Find("empty"), var_13_21 < var_13_22)
				SetActive(var_13_23:Find("star"), var_13_22 <= var_13_21)

				var_13_22 = var_13_22 - 1
			end

			local var_13_24 = var_13_17:Find("result/mask/icon")
			local var_13_25 = var_13_17:Find("result/type")

			var_13_24:GetComponent(typeof(Image)).sprite = LoadSprite("herohrzicon/" .. iter_13_5:getPainting())

			local var_13_26 = var_13_2[iter_13_5.id].output / var_13_4
			local var_13_27 = GetSpriteFromAtlas("shiptype", shipType2print(iter_13_5:getShipType()))

			setImageSprite(var_13_25, var_13_27, true)
			arg_13_0:setAtkAnima(var_13_17, var_13_14, var_13_26, var_13_4, var_13_3 and iter_13_5.id == var_13_3.id, var_13_2[iter_13_5.id].output, var_13_2[iter_13_5.id].kill_count)

			local var_13_28
			local var_13_29 = false

			if var_13_3 and iter_13_5.id == var_13_3.id then
				var_13_29 = true
				arg_13_0.mvpShipVO = iter_13_5

				local var_13_30
				local var_13_31
				local var_13_32

				if arg_13_0.contextData.score > 1 then
					local var_13_33, var_13_34

					var_13_33, var_13_32, var_13_34 = ShipWordHelper.GetWordAndCV(arg_13_0.mvpShipVO.skinId, ShipWordHelper.WORD_TYPE_MVP, nil, nil, arg_13_0.mvpShipVO:getCVIntimacy())
				else
					local var_13_35, var_13_36

					var_13_35, var_13_32, var_13_36 = ShipWordHelper.GetWordAndCV(arg_13_0.mvpShipVO.skinId, ShipWordHelper.WORD_TYPE_LOSE)
				end

				if var_13_32 then
					arg_13_0:stopVoice()
					pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_13_32, function(arg_15_0)
						arg_13_0._currentVoice = arg_15_0
					end)
				end
			end

			if iter_13_5.id == var_13_2._flagShipID then
				arg_13_0.flagShipVO = iter_13_5
			end

			local var_13_37
			local var_13_38 = arg_13_0.shipBuff and arg_13_0.shipBuff[iter_13_5:getGroupId()]

			if arg_13_0.expBuff or var_13_38 then
				var_13_37 = arg_13_0.expBuff and arg_13_0.expBuff:getConfig("name") or var_13_38 and i18n("Word_Ship_Exp_Buff")
			end

			local var_13_39

			if not var_13_12 then
				local var_13_40 = cloneTplTo(arg_13_0._extpl, arg_13_0._expContainer)

				var_13_39 = BattleResultShipCard.New(var_13_40)

				table.insert(arg_13_0._shipResultCardList, var_13_39)

				if var_13_7 then
					var_13_7:ConfigCallback(function()
						var_13_39:Play()
					end)
				else
					var_13_39:Play()
				end

				var_13_7 = var_13_39
			else
				local var_13_41 = cloneTplTo(arg_13_0._extpl, arg_13_0._subExpContainer)

				var_13_39 = BattleResultShipCard.New(var_13_41)

				table.insert(arg_13_0._subShipResultCardList, var_13_39)

				if not var_13_6 then
					arg_13_0._subFirstExpCard = var_13_39
				else
					var_13_6:ConfigCallback(function()
						var_13_39:Play()
					end)
				end

				var_13_6 = var_13_39
			end

			var_13_39:SetShipVO(iter_13_5, var_13_10, var_13_29, var_13_37)
		end
	end

	if var_13_7 then
		var_13_7:ConfigCallback(function()
			arg_13_0._stateFlag = var_0_0.STATE_DISPLAYED

			if not arg_13_0._subFirstExpCard then
				arg_13_0:skip()
			end
		end)
	end

	if var_13_6 then
		var_13_6:ConfigCallback(function()
			arg_13_0._stateFlag = var_0_0.STATE_SUB_DISPLAYED

			arg_13_0:skip()
		end)
	end
end

return var_0_0
