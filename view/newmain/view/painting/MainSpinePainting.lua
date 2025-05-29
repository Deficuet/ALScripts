local var_0_0 = class("MainSpinePainting", import(".MainBasePainting"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.bgTr = arg_1_3
	arg_1_0.spTF = findTF(arg_1_1, "spinePainting")
	arg_1_0.spBg = findTF(arg_1_3, "spinePainting")
	arg_1_0.uiCam = GameObject.Find("UICamera"):GetComponent("Camera")
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
		arg_3_0:AdJustOrderInLayer(arg_4_0)
		arg_3_0:InitSpecialTouch()
		arg_3_1()

		if arg_3_0._initTriggerEvent then
			arg_3_0:TriggerEvent(arg_3_0._initTriggerEvent)

			arg_3_0._initTriggerEvent = nil
		elseif getProxy(PlayerProxy):getFlag("login") then
			getProxy(PlayerProxy):setFlag("login", nil)
			arg_3_0:PrepareTriggerAction("event_login")
		end

		arg_3_0:InitScalePart()
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
			local var_6_6 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_6_5) - var_6_0

			ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_6_5, var_6_6)
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
		if arg_7_0:getDragTouchAble(arg_8_0.name, var_7_0, false) then
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

						if arg_7_0:getDragTouchAble(arg_8_0.name, var_7_0, true) then
							var_10_0 = arg_7_0.spinePainting:readyDragAction(arg_8_0.name)
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

					if math.abs(arg_7_0.dragOffset.x) > 200 or math.abs(arg_7_0.dragOffset.y) > 200 then
						arg_7_0.dragActive = false

						arg_7_0.spinePainting:readyDragAction(arg_8_0.name)
					end
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

				if arg_7_0:getDragTouchAble(arg_8_0.name, var_7_0, true) then
					if arg_7_0.isDragAndZoomState then
						return
					end

					if arg_7_0.chatting then
						return
					end

					arg_7_0.spinePainting:readyDragAction(arg_8_0.name)
				elseif var_12_0 then
					arg_7_0:TriggerEvent(var_12_0)
					arg_7_0:TriggerPersonalTask(arg_7_0.ship.groupId)
				end
			end)
		end
	end)
end

function var_0_0.OnClick(arg_13_0)
	if arg_13_0.spinePainting:isInAction() then
		return
	end

	local var_13_0 = arg_13_0:CollectTouchEvents()

	arg_13_0:TriggerEvent(var_13_0[math.ceil(math.random(#var_13_0))])
end

function var_0_0.OnEnableTimerEvent(arg_14_0)
	return not arg_14_0.spinePainting:isInAction()
end

function var_0_0.PrepareTriggerAction(arg_15_0, arg_15_1)
	local var_15_0
	local var_15_1

	if pg.AssistantInfo.assistantEvents[arg_15_1] then
		var_15_0 = pg.AssistantInfo.assistantEvents[arg_15_1].action
		var_15_1 = arg_15_0.spinePainting:getAnimationExist(var_15_0)
	end

	if var_15_1 then
		arg_15_0.spinePainting:SetOnceAction(var_15_0, nil, function()
			arg_15_0:TryToTriggerEvent(arg_15_1)
		end, true)
	else
		arg_15_0:TryToTriggerEvent(arg_15_1)
	end
end

function var_0_0.onSpinePaintingEvent(arg_17_0, arg_17_1)
	arg_17_0:TryToTriggerEvent(arg_17_1)
	arg_17_0:TriggerPersonalTask(arg_17_0.ship.groupId)
end

function var_0_0.GetPaintingTransform(arg_18_0)
	if arg_18_0.spinePainting then
		return arg_18_0.spinePainting:GetSpineTrasform()
	end

	return nil
end

function var_0_0.GetPartScaleData(arg_19_0)
	return pg.ship_skin_template[arg_19_0.ship:getSkinId()].part_scale.spine
end

function var_0_0.GetPartStateType(arg_20_0)
	return MainPaintingView.STATE_SPINE_PAINTING
end

function var_0_0.getDragTouchAble(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = SpinePaintingConst.ship_drag_datas[arg_21_2]

	if not var_21_0 then
		return false
	end

	if var_21_0.drag_data and var_21_0.click_trigger ~= arg_21_3 then
		return false
	end

	if var_21_0.hit_area then
		return table.contains(var_21_0.hit_area, arg_21_1)
	end

	return false
end

function var_0_0.OnDisplayWorld(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.ship:getCVIntimacy()
	local var_22_1 = ShipExpressionHelper.GetExpression(arg_22_0.paintingName, arg_22_1, var_22_0, arg_22_0.ship:getSkinId())

	if var_22_1 and var_22_1 ~= "" then
		arg_22_0.spinePainting:SetAction(var_22_1, 1)
		arg_22_0.spinePainting:displayWord(true)
	end
end

function var_0_0.OnDisplayWordEnd(arg_23_0)
	var_0_0.super.OnDisplayWordEnd(arg_23_0)
	arg_23_0.spinePainting:SetEmptyAction(1)
	arg_23_0.spinePainting:displayWord(false)
end

function var_0_0.OnLongPress(arg_24_0)
	if arg_24_0.isFoldState then
		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
		shipId = arg_24_0.ship.id
	})
end

function var_0_0.PlayChangeSkinActionIn(arg_25_0, arg_25_1)
	if arg_25_0.spinePainting and arg_25_0.spinePainting:getInitFlag() then
		arg_25_0:TriggerEvent("event_login")
	else
		arg_25_0._initTriggerEvent = "event_login"
	end

	if arg_25_1 and arg_25_1.callback then
		arg_25_1.callback({
			flag = true
		})
	end
end

function var_0_0.PlayChangeSkinActionOut(arg_26_0, arg_26_1)
	if arg_26_0.spinePainting and arg_26_0.spinePainting:getAnimationExist("change_out") then
		if arg_26_0.spinePainting:ablePlayAction("change_out", false, 0) then
			arg_26_0.spinePainting:SetOnceAction("change_out", function()
				return
			end, function()
				if arg_26_1 and arg_26_1.callback then
					arg_26_1.callback({
						flag = true
					})
				end
			end, true)
		elseif arg_26_1 and arg_26_1.callback then
			arg_26_1.callback({
				flag = true
			})
		end
	elseif arg_26_1 and arg_26_1.callback then
		arg_26_1.callback({
			flag = true
		})
	end
end

function var_0_0.OnUnload(arg_29_0)
	if arg_29_0.spinePainting then
		arg_29_0.spinePainting:Dispose()

		arg_29_0.spinePainting = nil
	end

	if arg_29_0.dragEvent then
		ClearEventTrigger(arg_29_0.dragEvent)
	end
end

function var_0_0.GetOffset(arg_30_0)
	return arg_30_0.spTF.localPosition.x
end

function var_0_0.OnPuase(arg_31_0)
	if arg_31_0.spinePainting then
		arg_31_0.spinePainting:SetVisible(false)
	end
end

function var_0_0.OnResume(arg_32_0)
	if arg_32_0.spinePainting then
		arg_32_0.spinePainting:SetVisible(true)
		arg_32_0.spinePainting:SetEmptyAction(1)
	end
end

return var_0_0
