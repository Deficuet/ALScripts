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

	arg_3_0.spinePainting = SpinePainting.New(var_3_0, function(arg_4_0)
		arg_3_0:AdJustOrderInLayer(arg_4_0)
		arg_3_0:InitSpecialTouch()
		arg_3_1()

		if arg_3_0._initTriggerEvent then
			arg_3_0:TriggerEvent(arg_3_0._initTriggerEvent)

			arg_3_0._initTriggerEvent = nil
		end
	end)
end

function var_0_0.AdJustOrderInLayer(arg_5_0, arg_5_1)
	local var_5_0 = 0
	local var_5_1 = arg_5_0.container:GetComponent(typeof(Canvas))

	if var_5_1 and var_5_1.overrideSorting and var_5_1.sortingOrder ~= 0 then
		local var_5_2 = arg_5_0.spTF:GetComponentsInChildren(typeof(Canvas))

		for iter_5_0 = 1, var_5_2.Length do
			local var_5_3 = var_5_2[iter_5_0 - 1]

			var_5_3.overrideSorting = true
			var_5_0 = var_5_3.sortingOrder - var_5_1.sortingOrder
			var_5_3.sortingOrder = var_5_1.sortingOrder
		end
	end

	local var_5_4 = arg_5_0.bgTr:GetComponent(typeof(Canvas))

	if var_5_4 and var_5_4.overrideSorting and var_5_4.sortingOrder ~= 0 then
		local var_5_5 = arg_5_0.spBg:GetComponentsInChildren(typeof(Canvas))

		for iter_5_1 = 1, var_5_5.Length do
			local var_5_6 = var_5_5[iter_5_1 - 1]

			var_5_6.overrideSorting = true
			var_5_6.sortingOrder = var_5_6.sortingOrder - var_5_0
		end

		local var_5_7 = arg_5_0.spBg:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))

		for iter_5_2 = 1, var_5_7.Length do
			local var_5_8 = var_5_7[iter_5_2 - 1]
			local var_5_9 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_5_8) - var_5_0

			ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_5_8, var_5_9)
		end
	end
end

function var_0_0.InitSpecialTouch(arg_6_0)
	arg_6_0.specialClickDic = {}

	local var_6_0 = findTF(arg_6_0.spTF:GetChild(0), "hitArea")

	if not var_6_0 then
		return
	end

	eachChild(var_6_0, function(arg_7_0)
		if arg_7_0.name == "drag" then
			arg_6_0.dragEvent = GetOrAddComponent(arg_7_0, typeof(EventTriggerListener))

			arg_6_0.dragEvent:AddPointDownFunc(function(arg_8_0, arg_8_1)
				arg_6_0.dragActive = true
				arg_6_0.dragStart = arg_8_1.position
			end)
			arg_6_0.dragEvent:AddPointUpFunc(function(arg_9_0, arg_9_1)
				if arg_6_0.dragActive then
					arg_6_0.dragActive = false
					arg_6_0.dragOffset = Vector2(arg_6_0.dragStart.x - arg_9_1.position.x, arg_6_0.dragStart.y - arg_9_1.position.y)

					if math.abs(arg_6_0.dragOffset.x) < 200 or math.abs(arg_6_0.dragOffset.y) < 200 then
						arg_6_0.dragUp = arg_9_1.position

						if arg_6_0.spinePainting:isInAction() then
							return
						end

						if not arg_6_0.spinePainting:DoDragClick() then
							local var_9_0 = arg_6_0.uiCam:ScreenToWorldPoint(arg_9_1.position)

							for iter_9_0 = 1, #arg_6_0.specialClickDic do
								local var_9_1 = arg_6_0.specialClickDic[iter_9_0]
								local var_9_2 = var_9_1.tf:InverseTransformPoint(var_9_0)

								if math.abs(var_9_2.x) < var_9_1.bound.x / 2 and math.abs(var_9_2.y) < var_9_1.bound.y / 2 then
									arg_6_0:PrepareTriggerAction(var_9_1.name)
									arg_6_0:TriggerPersonalTask(var_9_1.task)
								end
							end
						end
					end
				end
			end)
			arg_6_0.dragEvent:AddDragFunc(function(arg_10_0, arg_10_1)
				if arg_6_0.dragActive then
					if arg_6_0.isDragAndZoomState then
						arg_6_0.dragActive = false

						return
					end

					if arg_6_0.chatting then
						arg_6_0.dragActive = false

						return
					end

					arg_6_0.dragOffset = Vector2(arg_6_0.dragStart.x - arg_10_1.position.x, arg_6_0.dragStart.y - arg_10_1.position.y)

					if math.abs(arg_6_0.dragOffset.x) > 200 or math.abs(arg_6_0.dragOffset.y) > 200 then
						arg_6_0.dragActive = false

						arg_6_0.spinePainting:DoDragTouch()
					end
				end
			end)
		else
			local var_7_0 = arg_6_0:GetSpecialTouchEvent(arg_7_0.name)

			if var_7_0 then
				table.insert(arg_6_0.specialClickDic, {
					name = var_7_0,
					task = arg_6_0.ship.groupId,
					bound = arg_7_0.sizeDelta,
					tf = arg_7_0
				})
			end

			onButton(arg_6_0, arg_7_0, function()
				if arg_6_0.spinePainting:isInAction() then
					return
				end

				local var_11_0 = arg_6_0:GetSpecialTouchEvent(arg_7_0.name)

				if arg_7_0.name == "special" then
					if arg_6_0.isDragAndZoomState then
						return
					end

					if arg_6_0.chatting then
						return
					end

					arg_6_0.spinePainting:DoSpecialTouch()
				else
					arg_6_0:TriggerEvent(var_11_0)
					arg_6_0:TriggerPersonalTask(arg_6_0.ship.groupId)
				end
			end)
		end
	end)
end

function var_0_0.OnClick(arg_12_0)
	if arg_12_0.spinePainting:isInAction() then
		return
	end

	local var_12_0 = arg_12_0:CollectTouchEvents()

	arg_12_0:TriggerEvent(var_12_0[math.ceil(math.random(#var_12_0))])
end

function var_0_0.OnEnableTimerEvent(arg_13_0)
	return not arg_13_0.spinePainting:isInAction()
end

function var_0_0.PrepareTriggerAction(arg_14_0, arg_14_1)
	local var_14_0
	local var_14_1

	if pg.AssistantInfo.assistantEvents[arg_14_1] then
		var_14_0 = pg.AssistantInfo.assistantEvents[arg_14_1].action

		local var_14_2 = SpinePaintingConst.ship_action_extend[arg_14_0.spinePainting:getPaintingName()]

		if var_14_2 and table.contains(var_14_2, var_14_0) then
			var_14_1 = true
		end
	end

	if var_14_1 then
		arg_14_0.spinePainting:SetOnceAction(var_14_0, nil, function()
			arg_14_0:TryToTriggerEvent(arg_14_1)
		end, true)
	else
		arg_14_0:TryToTriggerEvent(arg_14_1)
	end
end

function var_0_0.OnDisplayWorld(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.ship:getCVIntimacy()
	local var_16_1 = ShipExpressionHelper.GetExpression(arg_16_0.paintingName, arg_16_1, var_16_0, arg_16_0.ship.skinId)

	if var_16_1 ~= "" then
		arg_16_0.spinePainting:SetAction(var_16_1, 1)
		arg_16_0.spinePainting:displayWord(true)
	end
end

function var_0_0.OnDisplayWordEnd(arg_17_0)
	var_0_0.super.OnDisplayWordEnd(arg_17_0)
	arg_17_0.spinePainting:SetEmptyAction(1)
	arg_17_0.spinePainting:displayWord(false)
end

function var_0_0.OnLongPress(arg_18_0)
	if arg_18_0.isFoldState then
		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
		shipId = arg_18_0.ship.id
	})
end

function var_0_0.PlayChangeSkinActionIn(arg_19_0, arg_19_1)
	if arg_19_0.spinePainting and arg_19_0.spinePainting:getInitFlag() then
		arg_19_0:TriggerEvent("event_login")
	else
		arg_19_0._initTriggerEvent = "event_login"
	end

	if arg_19_1 and arg_19_1.callback then
		arg_19_1.callback({
			flag = true
		})
	end
end

function var_0_0.PlayChangeSkinActionOut(arg_20_0, arg_20_1)
	if arg_20_1 and arg_20_1.callback then
		arg_20_1.callback({
			flag = true
		})
	end
end

function var_0_0.OnUnload(arg_21_0)
	if arg_21_0.spinePainting then
		arg_21_0.spinePainting:Dispose()

		arg_21_0.spinePainting = nil
	end

	if arg_21_0.dragEvent then
		ClearEventTrigger(arg_21_0.dragEvent)
	end
end

function var_0_0.GetOffset(arg_22_0)
	return arg_22_0.spTF.localPosition.x
end

function var_0_0.OnPuase(arg_23_0)
	if arg_23_0.spinePainting then
		arg_23_0.spinePainting:SetVisible(false)
	end
end

function var_0_0.OnResume(arg_24_0)
	if arg_24_0.spinePainting then
		arg_24_0.spinePainting:SetVisible(true)
		arg_24_0.spinePainting:SetEmptyAction(1)
	end
end

return var_0_0
