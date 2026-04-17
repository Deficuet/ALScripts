local var_0_0 = class("MainCardItem")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.isLoaded = false

	arg_1_0:Init(arg_1_1, arg_1_2, arg_1_3)
end

function var_0_0.Init(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.key = arg_2_1.key
	arg_2_0.id = arg_2_1.id
	arg_2_0.index = arg_2_1.index
	arg_2_0.hasSend = false
	arg_2_0.cardPoolMgr = arg_2_2

	if arg_2_1.allCount then
		arg_2_0:SetAllCount(arg_2_1.allCount)
	end

	if arg_2_3 then
		arg_2_0:SetUIRoot(arg_2_3)
	end

	arg_2_0.mainPlayerSeat = arg_2_1.mainPlayerSeat

	local function var_2_0(arg_3_0)
		arg_2_0.tf = tf(arg_3_0)
		arg_2_0.isLoaded = true

		local var_3_0 = arg_2_0.tf:GetComponent(typeof(ItemList))

		arg_2_0.selectedCardTf = var_3_0.prefabItem[0]
		arg_2_0.unSelectedCardTf = var_3_0.prefabItem[1]

		arg_2_0:SetSelected(false)

		local var_3_1 = GetOrAddComponent(arg_3_0, typeof(CheaterTavernCard))

		var_3_1.key = arg_2_0.key
		var_3_1.parm = arg_2_0.id

		arg_2_0:InitCardView()
	end

	arg_2_0.cardPoolMgr:GetCardGameObjectById(arg_2_0.id, var_2_0)
end

function var_0_0.SetIndex(arg_4_0, arg_4_1)
	arg_4_0.index = arg_4_1
end

function var_0_0.SetUIRoot(arg_5_0, arg_5_1)
	arg_5_0.rootTransform = arg_5_1
end

function var_0_0.SetAllCount(arg_6_0, arg_6_1)
	arg_6_0.allCount = arg_6_1
end

function var_0_0.SetCurveOffsetY(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0.cureveX = arg_7_1
	arg_7_0.cureveY = arg_7_2
	arg_7_0.cureveZ = arg_7_3
end

function var_0_0.InitCardView(arg_8_0)
	if arg_8_0.hasSend then
		return
	end

	setActive(arg_8_0.tf.gameObject, true)

	local var_8_0 = 0.001
	local var_8_1 = arg_8_0.index

	setParent(arg_8_0.tf, arg_8_0.rootTransform, false)

	local var_8_2 = var_8_1 - (arg_8_0.allCount + 1) / 2
	local var_8_3 = math.ceil(math.abs(var_8_2)) * IslandCheaterTavernConst.cardRoationOffset

	if var_8_2 < 0 then
		var_8_3 = -var_8_3
	end

	setLocalRotation(arg_8_0.tf, Quaternion.Euler(0, 180, var_8_3))

	local var_8_4 = arg_8_0.allCount
	local var_8_5 = IslandCheaterTavernConst.cardWidth
	local var_8_6 = IslandCheaterTavernConst.cardSpace
	local var_8_7 = -(var_8_4 * var_8_5 + (var_8_4 - 1) * var_8_6) / 2 + var_8_5 / 2 + (var_8_1 - 1) * (var_8_5 + var_8_6)
	local var_8_8 = 0.01
	local var_8_9 = -(var_8_2 * var_8_2) * var_8_8

	setLocalPosition(arg_8_0.tf, Vector3(var_8_7, var_8_9, -var_8_0 * (var_8_1 - 1)))
	setLocalScale(arg_8_0.tf, Vector3(1, 1, 1))
end

function var_0_0.SetSelected(arg_9_0, arg_9_1)
	arg_9_0.isSelected = arg_9_1

	if arg_9_0.isSelected then
		setLocalPosition(arg_9_0.tf, Vector3(arg_9_0.tf.localPosition.x, arg_9_0.tf.localPosition.y + 0.02, arg_9_0.tf.localPosition.z))
		setActive(arg_9_0.selectedCardTf, true)
		setActive(arg_9_0.unSelectedCardTf, false)
	else
		setLocalPosition(arg_9_0.tf, Vector3(arg_9_0.tf.localPosition.x, arg_9_0.tf.localPosition.y - 0.02, arg_9_0.tf.localPosition.z))
		setActive(arg_9_0.selectedCardTf, false)
		setActive(arg_9_0.unSelectedCardTf, true)
	end
end

function var_0_0.Update(arg_10_0)
	if not arg_10_0.isLoaded then
		return
	end

	arg_10_0:UpdateMoveToTable()
	arg_10_0:UpdateFlipTableCard()
end

function var_0_0.UpdateMoveToTable(arg_11_0)
	if not arg_11_0.moveToTable then
		return
	end

	if not arg_11_0.isLoaded then
		return
	end

	arg_11_0.deltaTime = Time.deltaTime + arg_11_0.deltaTime

	local var_11_0 = arg_11_0.deltaTime / IslandCheaterTavernConst.moveToTableTime
	local var_11_1 = arg_11_0.cureveZ:Evaluate(var_11_0)
	local var_11_2 = Vector3.Lerp(arg_11_0.startPos, arg_11_0.endPos, var_11_1)

	if arg_11_0.mainPlayerSeat == 1 then
		var_11_2.z = var_11_2.z + arg_11_0.cureveX:Evaluate(var_11_0) * 0.3
	elseif arg_11_0.mainPlayerSeat == 2 then
		var_11_2.x = var_11_2.x + arg_11_0.cureveX:Evaluate(var_11_0) * 0.3
	elseif arg_11_0.mainPlayerSeat == 3 then
		var_11_2.z = var_11_2.z - arg_11_0.cureveX:Evaluate(var_11_0) * 0.3
	else
		var_11_2.x = var_11_2.x - arg_11_0.cureveX:Evaluate(var_11_0) * 0.3
	end

	var_11_2.y = var_11_2.y + arg_11_0.cureveY:Evaluate(var_11_0) * 0.3
	arg_11_0.tf.position = var_11_2
	arg_11_0.tf.rotation = Quaternion.Slerp(arg_11_0.startRotation, arg_11_0.endRotation, var_11_1)
	arg_11_0.tf.localScale = Vector3.Lerp(arg_11_0.startScale, arg_11_0.endScale, var_11_1)

	if var_11_0 >= 1 then
		arg_11_0.moveToTable = false

		if IslandCheaterTavernConst.putCardTest then
			onDelayTick(function()
				arg_11_0.tf.position = arg_11_0.startPos

				arg_11_0:SetSelected(false)

				arg_11_0.tf.rotation = arg_11_0.startRotation
				arg_11_0.tf.localScale = arg_11_0.startScale
			end, 1)
		end
	end
end

function var_0_0.MoveToTable(arg_13_0, arg_13_1, arg_13_2)
	if not arg_13_0.isLoaded then
		return
	end

	setActive(arg_13_0.selectedCardTf, false)

	arg_13_0.hasSend = true
	arg_13_0.moveToTable = true
	arg_13_0.deltaTime = 0
	arg_13_0.startPos = arg_13_0.tf.position
	arg_13_0.startScale = arg_13_0.tf.localScale
	arg_13_0.startRotation = arg_13_0.tf.rotation

	local var_13_0 = IslandCheaterTavernConst.cardWidth * 2
	local var_13_1 = 0
	local var_13_2 = -(arg_13_2 * var_13_0 + (arg_13_2 - 1) * var_13_1) / 2 + var_13_0 / 2 + (arg_13_1 - 1) * (var_13_0 + var_13_1)
	local var_13_3 = 0
	local var_13_4 = 0
	local var_13_5 = 0.001 * arg_13_1

	if arg_13_0.mainPlayerSeat % 2 == 0 then
		var_13_3 = var_13_2
	else
		var_13_4 = var_13_2
	end

	arg_13_0.endPos = Vector3(6.29 + var_13_3, 0.92 + var_13_5, 2.11 + var_13_4)

	local var_13_6 = IslandCheaterTavernConst.seatRotatonY[arg_13_0.mainPlayerSeat]

	arg_13_0.endRotation = Quaternion.Euler(90, var_13_6, 0)
	arg_13_0.endScale = Vector3(2, 2, 2)
end

function var_0_0.UpdateFlipTableCard(arg_14_0)
	if not arg_14_0.isFliping then
		return
	end

	arg_14_0.flipDeltaTime = arg_14_0.flipDeltaTime + Time.deltaTime

	local var_14_0 = math.min(arg_14_0.flipDeltaTime / IslandCheaterTavernConst.FlipCardTime, 1)
	local var_14_1 = Mathf.Lerp(0, 180, var_14_0)

	arg_14_0.tf.rotation = arg_14_0.startFlipRotation * Quaternion.AngleAxis(var_14_1, arg_14_0.localUp)

	if var_14_0 >= 1 then
		arg_14_0.isFliping = false
	end
end

function var_0_0.FlipTableCard(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	if arg_15_0.id ~= arg_15_1 then
		local var_15_0 = arg_15_0.tf.position
		local var_15_1 = arg_15_0.tf.rotation
		local var_15_2 = arg_15_0.tf.localScale

		arg_15_0.cardPoolMgr:ReturnGameObjectById(arg_15_0.id, arg_15_0.tf.gameObject)

		arg_15_0.tf = nil

		local function var_15_3(arg_16_0)
			arg_15_0.tf = arg_16_0.transform

			local var_16_0 = arg_15_0.tf:GetComponent(typeof(ItemList))

			arg_15_0.selectedCardTf = var_16_0.prefabItem[0]

			setActive(arg_15_0.selectedCardTf, false)

			arg_15_0.tf.position = var_15_0
			arg_15_0.tf.rotation = var_15_1
			arg_15_0.tf.localScale = var_15_2
		end

		arg_15_0.cardPoolMgr:GetCardGameObjectById(arg_15_1, var_15_3, true)

		arg_15_0.id = arg_15_1
	end

	setParent(arg_15_0.tf, nil)

	arg_15_0.isFliping = true
	arg_15_0.deltaTime = 0
	arg_15_0.flipDeltaTime = 0
	arg_15_0.startPos = arg_15_0.tf.position

	local var_15_4 = IslandCheaterTavernConst.seatRotatonY[arg_15_0.mainPlayerSeat]

	arg_15_0.startFlipRotation = Quaternion.Euler(90, var_15_4, 0)
	arg_15_0.localUp = arg_15_0.startFlipRotation * Vector3.forward

	local var_15_5 = IslandCheaterTavernConst.cardWidth * 2
	local var_15_6 = 0
	local var_15_7 = -(arg_15_3 * var_15_5 + (arg_15_3 - 1) * var_15_6) / 2 + var_15_5 / 2 + (arg_15_2 - 1) * (var_15_5 + var_15_6)
	local var_15_8 = 0
	local var_15_9 = 0
	local var_15_10 = 0.001 * arg_15_2

	if arg_15_0.mainPlayerSeat % 2 == 0 then
		var_15_8 = var_15_7
	else
		var_15_9 = var_15_7
	end

	arg_15_0.tf.position = Vector3(6.29 + var_15_8, 0.92 + var_15_10, 2.11 + var_15_9)
end

function var_0_0.SetActive(arg_17_0, arg_17_1)
	setActive(arg_17_0.tf, arg_17_1)
end

function var_0_0.Destroy(arg_18_0)
	if IsNil(arg_18_0.tf) then
		return
	end

	arg_18_0.selectedCardTf = nil
	arg_18_0.unSelectedCardTf = nil

	arg_18_0.cardPoolMgr:ReturnGameObjectById(arg_18_0.id, arg_18_0.tf.gameObject)

	arg_18_0.tf = nil
end

return var_0_0
