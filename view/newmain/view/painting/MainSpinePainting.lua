local var_0_0 = class("MainSpinePainting", import(".MainBasePainting"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.bgTr = arg_1_3
	arg_1_0.spTF = findTF(arg_1_1, "spinePainting")
	arg_1_0.spBg = findTF(arg_1_3, "spinePainting")
	arg_1_0.uiCam = GameObject.Find("UICamera"):GetComponent("Camera")
	arg_1_0._initCallback = {}
end

function var_0_0.GetCenterPos(arg_2_0)
	return arg_2_0.spTF.position
end

function var_0_0.OnLoad(arg_3_0, arg_3_1)
	local var_3_0 = SpinePainting.GenerateData({
		ship = arg_3_0.ship,
		position = Vector3(0, 0, 0),
		parent = arg_3_0.spTF,
		effectParent = arg_3_0.spBg
	})

	arg_3_0:ClearScalePart()

	arg_3_0.spinePainting = SpinePainting.New(var_3_0, function(arg_4_0)
		if not arg_3_0.spinePainting then
			arg_3_0.spinePainting = arg_4_0
		end

		arg_3_0:AdJustOrderInLayer(arg_4_0)
		arg_3_0:InitSpecialTouch()

		for iter_4_0, iter_4_1 in ipairs(arg_3_0._initCallback) do
			iter_4_1()
		end

		arg_3_0._initCallback = {}

		if getProxy(PlayerProxy):getFlag("login") then
			getProxy(PlayerProxy):setFlag("login", nil)
			arg_3_0:TriggerEvent("event_login")
		end

		arg_3_0:InitScalePart()

		if arg_3_1 then
			arg_3_1(arg_3_0)
		end
	end)

	arg_3_0.spinePainting:setEventTriggerCallback(function(arg_5_0)
		arg_3_0:onSpinePaintingEvent(arg_5_0)
	end)
end

function var_0_0.AdJustOrderInLayer(arg_6_0, arg_6_1)
	local var_6_0 = 0
	local var_6_1 = arg_6_0.container:GetComponent(typeof(Canvas))

	if var_6_1 and var_6_1.overrideSorting and var_6_1.sortingOrder ~= 0 then
		local var_6_2 = arg_6_0.spTF:GetComponentsInChildren(typeof(Canvas)):ToTable()

		for iter_6_0, iter_6_1 in ipairs(var_6_2) do
			iter_6_1.overrideSorting = true
			var_6_0 = iter_6_1.sortingOrder - var_6_1.sortingOrder
			iter_6_1.sortingOrder = var_6_1.sortingOrder
		end
	end

	local var_6_3 = arg_6_0.bgTr:GetComponent(typeof(Canvas))

	if var_6_3 and var_6_3.overrideSorting and var_6_3.sortingOrder ~= 0 then
		local var_6_4 = arg_6_0.spBg:GetComponentsInChildren(typeof(Canvas)):ToTable()

		for iter_6_2, iter_6_3 in ipairs(var_6_4) do
			iter_6_3.overrideSorting = true
			iter_6_3.sortingOrder = iter_6_3.sortingOrder - var_6_0
		end

		local var_6_5 = arg_6_0.spBg:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()

		for iter_6_4, iter_6_5 in ipairs(var_6_5) do
			iter_6_5.sortingOrder = iter_6_5.sortingOrder - var_6_0
		end
	end
end

function var_0_0.InitSpecialTouch(arg_7_0)
	local var_7_0 = arg_7_0.ship:getPainting()

	arg_7_0.specialClickDic = {}

	local var_7_1 = findTF(arg_7_0.spTF:GetChild(0), "hitArea")

	if not var_7_1 then
		return
	end

	eachChild(var_7_1, function(arg_8_0)
		if arg_7_0:getDragTouchAble(arg_8_0.name, var_7_0) then
			arg_7_0.dragEvent = GetOrAddComponent(arg_8_0, typeof(EventTriggerListener))

			arg_7_0.dragEvent:AddPointDownFunc(function(arg_9_0, arg_9_1)
				arg_7_0.dragActive = true
				arg_7_0.dragStart = arg_9_1.position
			end)
			arg_7_0.dragEvent:AddPointUpFunc(function(arg_10_0, arg_10_1)
				if arg_7_0.dragActive then
					arg_7_0.dragActive = false
					arg_7_0.dragOffset = Vector2(arg_7_0.dragStart.x - arg_10_1.position.x, arg_7_0.dragStart.y - arg_10_1.position.y)

					if math.abs(arg_7_0.dragOffset.x) < 200 or math.abs(arg_7_0.dragOffset.y) < 200 then
						arg_7_0.dragUp = arg_10_1.position

						if arg_7_0.spinePainting:isInAction() then
							return
						end

						local var_10_0

						if arg_7_0:getDragTouchAble(arg_8_0.name, var_7_0) then
							var_10_0 = arg_7_0.spinePainting:readyDragAction(arg_8_0.name, false)
						end

						if not var_10_0 then
							local var_10_1 = arg_7_0.uiCam:ScreenToWorldPoint(arg_10_1.position)

							for iter_10_0 = 1, #arg_7_0.specialClickDic do
								local var_10_2 = arg_7_0.specialClickDic[iter_10_0]
								local var_10_3 = var_10_2.tf:InverseTransformPoint(var_10_1)

								if math.abs(var_10_3.x) < var_10_2.bound.x / 2 and math.abs(var_10_3.y) < var_10_2.bound.y / 2 then
									arg_7_0:PrepareTriggerAction(var_10_2.name)
									arg_7_0:TriggerPersonalTask(var_10_2.task)
								end
							end
						end
					end
				end
			end)
			arg_7_0.dragEvent:AddDragFunc(function(arg_11_0, arg_11_1)
				if arg_7_0.dragActive then
					if arg_7_0.isDragAndZoomState then
						arg_7_0.dragActive = false

						return
					end

					if arg_7_0.chatting then
						arg_7_0.dragActive = false

						return
					end

					arg_7_0.dragOffset = Vector2(arg_7_0.dragStart.x - arg_11_1.position.x, arg_7_0.dragStart.y - arg_11_1.position.y)

					if (math.abs(arg_7_0.dragOffset.x) > 200 or math.abs(arg_7_0.dragOffset.y) > 200) and arg_7_0.spinePainting:readyDragAction(arg_8_0.name, true) then
						arg_7_0.dragActive = false
					end

					arg_7_0.spinePainting:OnDragMove(arg_8_0.name, arg_7_0.dragOffset)
				end
			end)
		else
			local var_8_0 = arg_7_0:GetSpecialTouchEvent(arg_8_0.name)

			if var_8_0 then
				table.insert(arg_7_0.specialClickDic, {
					name = var_8_0,
					task = arg_7_0.ship.groupId,
					bound = arg_8_0.sizeDelta,
					tf = arg_8_0
				})
			end

			onButton(arg_7_0, arg_8_0, function()
				if arg_7_0.spinePainting:isInAction() then
					return
				end

				local var_12_0 = arg_7_0:GetSpecialTouchEvent(arg_8_0.name)

				if arg_7_0:getDragTouchAble(arg_8_0.name, var_7_0) then
					if arg_7_0.isDragAndZoomState then
						return
					end

					if arg_7_0.chatting then
						return
					end

					arg_7_0.spinePainting:readyDragAction(arg_8_0.name, false)
				elseif var_12_0 and not arg_7_0._asmrFlag then
					arg_7_0:TriggerEvent(var_12_0)
					arg_7_0:TriggerPersonalTask(arg_7_0.ship.groupId)
				end
			end)
		end
	end)
end

function var_0_0.OnPaintingFade(arg_13_0, arg_13_1)
	if arg_13_0.spinePainting then
		arg_13_0.spinePainting:UpdateGraphic()
	end
end

function var_0_0.OnClick(arg_14_0)
	if arg_14_0.spinePainting:isInAction() or arg_14_0._asmrFlag then
		return
	end

	local var_14_0 = arg_14_0:CollectTouchEvents()

	arg_14_0:TriggerEvent(var_14_0[math.ceil(math.random(#var_14_0))])
end

function var_0_0.OnEnableTimerEvent(arg_15_0)
	return not arg_15_0.spinePainting:isInAction() and not arg_15_0._asmrFlag
end

function var_0_0.PrepareTriggerAction(arg_16_0, arg_16_1)
	if arg_16_0._asmrFlag then
		return
	end

	local var_16_0
	local var_16_1 = false
	local var_16_2 = ""

	if pg.AssistantInfo.GetAssistantEvents(arg_16_1) then
		var_16_0 = pg.AssistantInfo.GetAssistantEvents(arg_16_1).action
		var_16_1 = arg_16_0.spinePainting:getAnimationExist(var_16_0)
		var_16_2 = arg_16_0.spinePainting:getIdleName()
	end

	if var_16_1 and var_16_2 == "normal" then
		arg_16_0.spinePainting:SetOnceAction(var_16_0, nil, function()
			arg_16_0:TryToTriggerEvent(arg_16_1)
		end, true)
	else
		arg_16_0:TryToTriggerEvent(arg_16_1)
	end
end

function var_0_0.GetEventExit(arg_18_0, arg_18_1)
	local var_18_0 = false

	if pg.AssistantInfo.GetAssistantEvents(arg_18_1) then
		local var_18_1 = pg.AssistantInfo.GetAssistantEvents(arg_18_1).action

		var_18_0 = arg_18_0.spinePainting:getAnimationExist(var_18_1)
	end

	return var_18_0
end

function var_0_0.TryToTriggerEvent(arg_19_0, arg_19_1)
	arg_19_0:_TriggerEvent(arg_19_1)
end

function var_0_0.onSpinePaintingEvent(arg_20_0, arg_20_1)
	arg_20_0:TryToTriggerEvent(arg_20_1)
	arg_20_0:TriggerPersonalTask(arg_20_0.ship.groupId)
end

function var_0_0.GetPaintingTransform(arg_21_0)
	if arg_21_0.spinePainting then
		return arg_21_0.spinePainting:GetSpineTransform()
	end

	return nil
end

function var_0_0.GetPartScaleData(arg_22_0)
	return pg.ship_skin_template[arg_22_0.ship:getSkinId()].part_scale.spine
end

function var_0_0.GetPartStateType(arg_23_0)
	return MainPaintingView.STATE_SPINE_PAINTING
end

function var_0_0.getDragTouchAble(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = SpinePaintingConst.ship_drag_datas[arg_24_2]

	if not var_24_0 then
		return false
	end

	if var_24_0.hit_area then
		return table.contains(var_24_0.hit_area, arg_24_1)
	end

	return false
end

function var_0_0.OnDisplayWorld(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.ship:getCVIntimacy()
	local var_25_1 = ShipExpressionHelper.GetExpression(arg_25_0.paintingName, arg_25_1, var_25_0, arg_25_0.ship:getSkinId())

	if var_25_1 and var_25_1 ~= "" then
		arg_25_0.spinePainting:SetAction(var_25_1, 1)
		arg_25_0.spinePainting:displayWord(true)
	end
end

function var_0_0.OnDisplayWordEnd(arg_26_0)
	var_0_0.super.OnDisplayWordEnd(arg_26_0)
	arg_26_0.spinePainting:SetEmptyAction(1)
	arg_26_0.spinePainting:displayWord(false)
end

function var_0_0.OnLongPress(arg_27_0)
	if arg_27_0.isFoldState then
		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
		shipId = arg_27_0.ship.id
	})
end

function var_0_0.PlayChangeSkinActionIn(arg_28_0, arg_28_1)
	if arg_28_0.spinePainting then
		local function var_28_0()
			if arg_28_1 and arg_28_1.callback then
				arg_28_1.callback({
					flag = true
				})
			end
		end

		local function var_28_1()
			local var_30_0 = arg_28_0.spinePainting:GetDragDataConfig("change_in_hit")

			if var_30_0 and #var_30_0 > 0 then
				arg_28_0.spinePainting:readyDragAction(var_30_0, false)
				var_28_0()
			elseif arg_28_0.spinePainting:getAnimationExist("change_in") and arg_28_0.spinePainting:checkActionPlayAble("change_in", false, 0) then
				arg_28_0.spinePainting:SetOnceAction("change_in", nil, function()
					var_28_0()
				end, true)
			else
				arg_28_0:TriggerEvent("event_login")
				var_28_0()
			end
		end

		if arg_28_0.spinePainting:getInitFlag() then
			var_28_1()
		else
			arg_28_0:pullInitCallback(var_28_1)
		end
	end
end

function var_0_0.pullInitCallback(arg_32_0, arg_32_1)
	table.insert(arg_32_0._initCallback, arg_32_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_33_0, arg_33_1)
	if arg_33_0.spinePainting and arg_33_0.spinePainting:getAnimationExist("change_out") then
		if arg_33_0.spinePainting:checkActionPlayAble("change_out", false, 0) then
			arg_33_0.spinePainting:SetOnceAction("change_out", function()
				return
			end, function()
				if arg_33_1 and arg_33_1.callback then
					arg_33_1.callback({
						flag = true
					})
				end
			end, true)
		elseif arg_33_1 and arg_33_1.callback then
			arg_33_1.callback({
				flag = true
			})
		end
	elseif arg_33_1 and arg_33_1.callback then
		arg_33_1.callback({
			flag = true
		})
	end
end

function var_0_0.OnUnload(arg_36_0)
	if arg_36_0.spinePainting then
		arg_36_0.spinePainting:Dispose()

		arg_36_0.spinePainting = nil
	end

	if arg_36_0.dragEvent then
		ClearEventTrigger(arg_36_0.dragEvent)
	end
end

function var_0_0.GetOffset(arg_37_0)
	return arg_37_0.spTF.localPosition.x
end

function var_0_0.OnPause(arg_38_0)
	if arg_38_0.spinePainting then
		arg_38_0.spinePainting:SetVisible(false)
	end
end

function var_0_0.OnResume(arg_39_0)
	if arg_39_0.spinePainting then
		arg_39_0.spinePainting:SetVisible(true)
		arg_39_0.spinePainting:SetEmptyAction(1)
		arg_39_0:emit(NewMainScene.PAINTING_LOAD_COMPLETE)
	end
end

return var_0_0
