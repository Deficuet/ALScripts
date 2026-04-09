local var_0_0 = class("IslandCheaterTavernCardViewManager")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.uiContainer = arg_1_1

	arg_1_0:CreateCardMainRoot()
	arg_1_0:CreateOtherCardRoot()

	if not arg_1_0.luHandle then
		arg_1_0.luHandle = UpdateBeat:CreateListener(arg_1_0.UpDateHandler, arg_1_0)

		UpdateBeat:AddListener(arg_1_0.luHandle)
	end

	arg_1_0.layerMask = LayerMask.GetMask("Island")
	arg_1_0.cardPoolMgr = CardPoolMgr.New()
	arg_1_0.curveX = LoadAny("island/jumpcurve/CardCurveX", "", typeof(JumpCurve)).curve
	arg_1_0.curveY = LoadAny("island/jumpcurve/CardCurveY", "", typeof(JumpCurve)).curve
	arg_1_0.curveZ = LoadAny("island/jumpcurve/CardCurveZ", "", typeof(JumpCurve)).curve
end

function var_0_0.SetMainPlayerSeat(arg_2_0, arg_2_1)
	arg_2_0.mainPlayerSeat = arg_2_1
end

function var_0_0.UpDateHandler(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(arg_3_0.cardKeyDic or {}) do
		iter_3_1:Update()
	end

	for iter_3_2, iter_3_3 in pairs(arg_3_0.otherPlayerCardDic or {}) do
		for iter_3_4, iter_3_5 in pairs(iter_3_3) do
			iter_3_5:Update()
		end
	end

	for iter_3_6, iter_3_7 in ipairs(arg_3_0.tableCardList or {}) do
		iter_3_7:Update()
	end

	arg_3_0:UpdateCardMainRootPos()

	if not Input.GetMouseButtonDown(0) then
		return
	end

	if not IsNil(UnityEngine.EventSystems.EventSystem.current.currentSelectedGameObject) and UnityEngine.EventSystems.EventSystem.current:IsPointerOverGameObject() then
		return
	end

	local var_3_0 = Input.mousePosition
	local var_3_1 = CheatTavernCameraMgr.instance._mainCamera:ScreenPointToRay(var_3_0)
	local var_3_2, var_3_3 = Physics.Raycast(var_3_1, hit, 1000, arg_3_0.layerMask)

	if var_3_2 then
		local var_3_4 = var_3_3.collider.gameObject:GetComponent(typeof(CheaterTavernCard))

		if var_3_4 == nil then
			return
		end

		local var_3_5 = var_3_4.key

		if var_3_4.parm == 0 then
			return
		end

		local var_3_6 = arg_3_0.selectCardKey[var_3_5] or false

		if not var_3_6 then
			local var_3_7 = 0

			for iter_3_8, iter_3_9 in pairs(arg_3_0.selectCardKey) do
				if iter_3_9 then
					var_3_7 = var_3_7 + 1
				end
			end

			if var_3_7 >= IslandCheaterTavernConst.putCountMax then
				return
			end
		end

		arg_3_0:UpdateSelectCard(var_3_5, not var_3_6)
	end
end

function var_0_0.UpdateSelectCard(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.cardKeyDic[arg_4_1]

	if var_4_0 == nil then
		return
	end

	arg_4_0.selectCardKey[arg_4_1] = arg_4_2

	var_4_0:SetSelected(arg_4_2)
end

function var_0_0.GetSelectCardKeyList(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.selectCardKey) do
		if iter_5_1 and arg_5_0.cardKeyDic[iter_5_0] then
			table.insert(var_5_0, iter_5_0)
		end
	end

	arg_5_0.selectCardKey = {}

	return var_5_0
end

function var_0_0.InitMainCard(arg_6_0, arg_6_1)
	arg_6_0.tableCardList = {}
	arg_6_0.selectCardKey = {}
	arg_6_0.cardDataList = arg_6_1
	arg_6_0.cardKeyDic = {}

	local var_6_0 = #arg_6_1

	for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
		local var_6_1 = iter_6_1.id
		local var_6_2 = iter_6_1.key
		local var_6_3 = MainCardItem.New({
			id = var_6_1,
			key = var_6_2,
			index = iter_6_0,
			mainPlayerSeat = arg_6_0.mainPlayerSeat,
			allCount = var_6_0
		}, arg_6_0.cardPoolMgr, arg_6_0.CardMainRoot.transform)

		arg_6_0.cardKeyDic[var_6_2] = var_6_3

		var_6_3:SetCurveOffsetY(arg_6_0.curveX, arg_6_0.curveY, arg_6_0.curveZ)
	end
end

function var_0_0.InitOtherPlayerCard(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.otherPlayerCardDic or {}) do
		for iter_7_2, iter_7_3 in pairs(iter_7_1 or {}) do
			iter_7_3:Destroy()
		end
	end

	arg_7_0.otherPlayerCardDic = {}

	for iter_7_4, iter_7_5 in ipairs(arg_7_1) do
		if not iter_7_5:IsOut() then
			local var_7_0 = iter_7_5.seat

			arg_7_0.otherPlayerCardDic[iter_7_5.user_id] = {}

			local var_7_1 = iter_7_5:GetCardNum()

			for iter_7_6 = 1, var_7_1 do
				local var_7_2 = arg_7_0.seatOherRootDic[var_7_0]
				local var_7_3 = MainCardItem.New({
					id = 0,
					key = 0,
					index = iter_7_6,
					mainPlayerSeat = arg_7_0.mainPlayerSeat,
					allCount = var_7_1
				}, arg_7_0.cardPoolMgr, var_7_2)

				var_7_3:SetCurveOffsetY(arg_7_0.curveX, arg_7_0.curveY, arg_7_0.curveZ)

				arg_7_0.otherPlayerCardDic[iter_7_5.user_id][iter_7_6] = var_7_3
			end
		end
	end
end

function var_0_0.RefreshMainCard(arg_8_0, arg_8_1)
	local var_8_0 = #arg_8_1

	arg_8_0.cardDataList = arg_8_1

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		local var_8_1 = iter_8_1.key
		local var_8_2 = arg_8_0.cardKeyDic[var_8_1]

		var_8_2:SetIndex(iter_8_0)
		var_8_2:SetAllCount(var_8_0)
		var_8_2:InitCardView()
	end
end

function var_0_0.PutDownMainCard(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		local var_9_0 = arg_9_0.cardKeyDic[iter_9_1]

		if var_9_0 then
			var_9_0:MoveToTable(iter_9_0, #arg_9_1)

			if not IslandCheaterTavernConst.putCardTest then
				arg_9_0.cardKeyDic[iter_9_1] = nil

				table.insert(arg_9_0.tableCardList, var_9_0)
			end
		end
	end
end

function var_0_0.OtherPlayerPutCard(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.otherPlayerCardDic[arg_10_1] or {}
	local var_10_1 = #var_10_0
	local var_10_2 = var_10_1 - arg_10_2 + 1
	local var_10_3 = 1

	for iter_10_0 = var_10_2, var_10_1 do
		local var_10_4 = var_10_0[iter_10_0]

		if var_10_4 then
			var_10_4:MoveToTable(var_10_3, arg_10_2)

			var_10_3 = var_10_3 + 1
			var_10_0[iter_10_0] = nil

			table.insert(arg_10_0.tableCardList, var_10_4)
		end
	end
end

function var_0_0.OtherPlayerCardDestroy(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.otherPlayerCardDic[arg_11_1] or {}

	for iter_11_0, iter_11_1 in pairs(var_11_0) do
		iter_11_1:Destroy()
	end
end

function var_0_0.PlayerCardSetActive(arg_12_0, arg_12_1, arg_12_2)
	if getProxy(PlayerProxy):getRawData().id == arg_12_1 then
		for iter_12_0, iter_12_1 in pairs(arg_12_0.cardKeyDic or {}) do
			iter_12_1:SetActive(arg_12_2)
		end
	else
		local var_12_0 = arg_12_0.otherPlayerCardDic[arg_12_1] or {}

		for iter_12_2, iter_12_3 in pairs(var_12_0) do
			iter_12_3:SetActive(arg_12_2)
		end
	end
end

function var_0_0.FlipTableCard(arg_13_0, arg_13_1)
	local var_13_0 = #arg_13_0.tableCardList

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.tableCardList) do
		local var_13_1 = arg_13_1[iter_13_0]

		iter_13_1:FlipTableCard(var_13_1, iter_13_0, var_13_0)
	end
end

function var_0_0.ClearTableCard(arg_14_0)
	if arg_14_0.tableCardList == nil then
		return
	end

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.tableCardList) do
		iter_14_1:Destroy()
	end

	table.clear(arg_14_0.tableCardList)
end

function var_0_0.DestroyMainCard(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.cardKeyDic or {}) do
		iter_15_1:Destroy()
	end

	arg_15_0.cardKeyDic = {}
	arg_15_0.selectCardKey = {}
	arg_15_0.cardDataList = {}
end

function var_0_0.CreateCardMainRoot(arg_16_0)
	arg_16_0.CardMainRoot = GameObject.New("CardMainRoot")

	arg_16_0:UpdateCardMainRootPos()
end

function var_0_0.CreateOtherCardRoot(arg_17_0)
	arg_17_0.seatOherRootDic = {}

	for iter_17_0 = 1, 4 do
		local var_17_0 = iter_17_0

		arg_17_0.seatOherRootDic[iter_17_0] = GameObject.New(tostring(iter_17_0)).transform

		local var_17_1 = 10110000 + iter_17_0
		local var_17_2 = pg.island_world_objects[var_17_1]
		local var_17_3 = var_17_2.param.position[1]
		local var_17_4 = var_17_2.param.position[3]
		local var_17_5 = {
			1,
			0,
			-1,
			0
		}
		local var_17_6 = {
			0,
			-1,
			0,
			1
		}
		local var_17_7 = var_17_3 + var_17_5[var_17_0] * IslandCheaterTavernConst.horOffset
		local var_17_8 = var_17_4 + var_17_6[var_17_0] * IslandCheaterTavernConst.horOffset
		local var_17_9 = {
			-90,
			0,
			90,
			180
		}
		local var_17_10 = Vector3(var_17_7, IslandCheaterTavernConst.verOffset, var_17_8)

		arg_17_0.seatOherRootDic[iter_17_0].position = var_17_10
		arg_17_0.seatOherRootDic[iter_17_0].rotation = Quaternion.Euler(var_17_2.param.rotation[1], var_17_9[var_17_0], var_17_2.param.rotation[3])
	end
end

function var_0_0.UpdateCardMainRootPos(arg_18_0)
	local var_18_0 = GameObject.Find("UICamera"):GetComponent(typeof(Camera)):WorldToScreenPoint(arg_18_0.uiContainer.position)
	local var_18_1 = IslandCheaterTavernConst.cardOffsetToCamara
	local var_18_2 = CheatTavernCameraMgr.instance._mainCamera:ScreenToWorldPoint(Vector3(var_18_0.x, var_18_0.y, var_18_1))

	arg_18_0.CardMainRoot.transform.localPosition = Vector3(var_18_2.x, var_18_2.y, var_18_2.z)
	arg_18_0.CardMainRoot.transform.rotation = CheatTavernCameraMgr.instance._mainCamera.transform.rotation
end

function var_0_0.Destroy(arg_19_0)
	UpdateBeat:RemoveListener(arg_19_0.luHandle)

	if arg_19_0.CardMainRoot then
		GameObject.Destroy(arg_19_0.CardMainRoot)

		arg_19_0.CardMainRoot = nil
	end

	for iter_19_0, iter_19_1 in pairs(arg_19_0.seatOherRootDic) do
		if iter_19_1 then
			GameObject.Destroy(iter_19_1.gameObject)
		end
	end

	arg_19_0.seatOherRootDic = {}

	for iter_19_2, iter_19_3 in pairs(arg_19_0.otherPlayerCardDic or {}) do
		for iter_19_4, iter_19_5 in pairs(iter_19_3) do
			iter_19_5:Destroy()
		end
	end

	for iter_19_6, iter_19_7 in pairs(arg_19_0.cardKeyDic or {}) do
		iter_19_7:Destroy()
	end

	for iter_19_8, iter_19_9 in ipairs(arg_19_0.tableCardList or {}) do
		iter_19_9:Destroy()
	end

	arg_19_0.cardPoolMgr:Destroy()
end

return var_0_0
