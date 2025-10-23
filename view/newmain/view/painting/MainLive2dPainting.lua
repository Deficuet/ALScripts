local var_0_0 = class("MainLive2dPainting", import(".MainBasePainting"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.live2dContainer = arg_1_1:Find("live2d")
	arg_1_0.cg = arg_1_0.live2dContainer:GetComponent(typeof(CanvasGroup))
	arg_1_0.currentWidth = Screen.width
	arg_1_0.currentHeight = Screen.height
	arg_1_0.isModifyOrder = false
	arg_1_0.actionWaiting = false
	arg_1_0.eventTrigger = GetOrAddComponent(arg_1_0.live2dContainer, typeof(EventTriggerListener))

	arg_1_0.eventTrigger:AddPointClickFunc(function()
		arg_1_0:OnClick()
		arg_1_0:TriggerPersonalTask(arg_1_0.ship.groupId)
	end)
end

function var_0_0.GetHalfBodyOffsetY(arg_3_0)
	if not arg_3_0:IslimitYPos() then
		return 0
	end

	return MainPaintingShift.GetHalfBodyOffsetY(arg_3_0.container.parent, arg_3_0.live2dContainer)
end

function var_0_0.OnLoad(arg_4_0, arg_4_1)
	local var_4_0 = Live2D.GenerateData({
		loadPrefs = true,
		ship = arg_4_0.ship,
		position = Vector3(0, 0, 100),
		parent = arg_4_0.live2dContainer
	})

	arg_4_0.actionWaiting = false

	arg_4_0:SetContainerVisible(true)

	arg_4_0.cg.blocksRaycasts = true
	arg_4_0.live2dChar = Live2D.New(var_4_0, function(arg_5_0)
		arg_4_0:AdJustOrderInLayer(arg_5_0)

		if arg_4_0._initTriggerAction then
			for iter_5_0, iter_5_1 in ipairs(arg_4_0._initTriggerAction) do
				local var_5_0 = pg.AssistantInfo.assistantEvents[iter_5_1].action

				if arg_4_0.live2dChar:checkActionExist(var_5_0) then
					arg_4_0.live2dChar:TriggerAction(var_5_0)

					arg_4_0._initTriggerAction = nil

					break
				end
			end

			arg_4_0._initTriggerAction = nil
		end

		arg_4_1()
	end)
	arg_4_0.shipGroup = getProxy(CollectionProxy):getShipGroup(arg_4_0.ship.groupId)

	arg_4_0:UpdateContainerPosition()
	arg_4_0:AddScreenChangeTimer()

	arg_4_0.cvLoaded = false

	arg_4_0:preloadCv(function()
		arg_4_0.cvLoaded = true

		if arg_4_0.pretriggerEvent then
			arg_4_0:_TriggerEvent(arg_4_0.pretriggerEvent)

			arg_4_0.pretriggerEvent = nil
		end
	end)
end

function var_0_0.ResetState(arg_7_0)
	if not arg_7_0.live2dChar then
		return
	end

	arg_7_0.live2dChar:resetL2dData()
end

function var_0_0.AdJustOrderInLayer(arg_8_0, arg_8_1)
	arg_8_1:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
end

function var_0_0.ResetOrderInLayer(arg_9_0)
	if not arg_9_0.live2dChar then
		return
	end

	local var_9_0 = arg_9_0.live2dChar._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_9_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

	ReflectionHelp.RefSetProperty(var_9_1, "SortingOrder", var_9_0, 0)
end

function var_0_0.AddScreenChangeTimer(arg_10_0)
	arg_10_0:RemoveScreenChangeTimer()

	if not arg_10_0:IslimitYPos() then
		return
	end

	arg_10_0.screenTimer = Timer.New(function()
		if arg_10_0.currentWidth ~= Screen.width or arg_10_0.currentHeight ~= Screen.height then
			arg_10_0.currentWidth = Screen.width
			arg_10_0.currentHeight = Screen.height

			arg_10_0:ResetContainerPosition()
			arg_10_0:UpdateContainerPosition()
		end
	end, 0.5, -1)

	arg_10_0.screenTimer:Start()
end

function var_0_0.RemoveScreenChangeTimer(arg_12_0)
	if arg_12_0.screenTimer then
		arg_12_0.screenTimer:Stop()

		arg_12_0.screenTimer = nil
	end
end

function var_0_0.UpdateContainerPosition(arg_13_0)
	local var_13_0 = arg_13_0:IslimitYPos() and arg_13_0:GetHalfBodyOffsetY() or 0
	local var_13_1 = arg_13_0.live2dContainer.localPosition

	arg_13_0.live2dContainer.localPosition = Vector3(var_13_1.x, var_13_0, var_13_1.z)
end

function var_0_0.ResetContainerPosition(arg_14_0)
	local var_14_0 = arg_14_0.live2dContainer.localPosition

	arg_14_0.live2dContainer.localPosition = Vector3(var_14_0.x, arg_14_0:GetHalfBodyOffsetY(), 0)
end

function var_0_0.OnUnload(arg_15_0)
	if arg_15_0.live2dChar then
		arg_15_0:RemoveScreenChangeTimer()
		arg_15_0:ResetContainerPosition()

		if arg_15_0.isModifyOrder then
			arg_15_0.isModifyOrder = false

			arg_15_0:ResetOrderInLayer()
		end

		arg_15_0.cg.blocksRaycasts = false

		arg_15_0.live2dChar:saveLive2dData()
		arg_15_0.live2dChar:Dispose()

		arg_15_0.live2dChar = nil
	end
end

function var_0_0.OnClick(arg_16_0)
	local var_16_0

	if arg_16_0.live2dChar and arg_16_0.live2dChar.state == Live2D.STATE_INITED and not arg_16_0.live2dChar.ignoreReact then
		if not Input.mousePosition then
			return
		end

		local var_16_1 = arg_16_0.live2dChar:GetTouchPart()

		if var_16_1 > 0 then
			local var_16_2 = arg_16_0:GetTouchEvent(var_16_1)

			var_16_0 = var_16_2[math.ceil(math.random(#var_16_2))]
		else
			local var_16_3 = arg_16_0:GetIdleEvents()

			var_16_0 = var_16_3[math.floor(math.Random(0, #var_16_3)) + 1]
		end
	end

	if var_16_0 then
		arg_16_0:TriggerEvent(var_16_0)
	end
end

function var_0_0._TriggerEvent(arg_17_0, arg_17_1)
	if not arg_17_0.cvLoaded then
		arg_17_0.pretriggerEvent = arg_17_1

		return
	end

	if not arg_17_1 then
		return
	end

	if arg_17_0.actionWaiting then
		return
	end

	local var_17_0 = arg_17_0:GetEventConfig(arg_17_1)

	local function var_17_1(arg_18_0)
		if arg_18_0 then
			if var_17_0.dialog ~= "" then
				arg_17_0:DisplayWord(var_17_0.dialog)
			else
				arg_17_0:TriggerNextEventAuto()
			end
		end

		arg_17_0.actionWaiting = false
	end

	local var_17_2, var_17_3, var_17_4, var_17_5, var_17_6, var_17_7 = ShipWordHelper.GetCvDataForShip(arg_17_0.ship, var_17_0.dialog)
	local var_17_8 = var_17_0.action
	local var_17_9 = var_17_0.dialog
	local var_17_10 = string.gsub(var_17_9, "main_", "main")

	if arg_17_0.ship.propose and pg.character_voice[var_17_10] and arg_17_0.shipGroup and arg_17_0.shipGroup:VoiceReplayCodition(pg.character_voice[var_17_10]) and arg_17_0.live2dChar:checkActionExist(var_17_8 .. "_ex") then
		var_17_8 = var_17_8 .. "_ex"
	end

	if not var_17_7 then
		arg_17_0.actionWaiting = true

		local var_17_11 = arg_17_0.live2dChar:TriggerAction(var_17_8)

		var_17_1(var_17_11)
	else
		arg_17_0.actionWaiting = true

		if not var_17_4 or var_17_4 == nil or var_17_4 == "" or var_17_4 == "nil" then
			arg_17_0.actionWaiting = false

			var_17_1(true)
		end

		if not arg_17_0.live2dChar:TriggerAction(var_17_8, nil, nil, var_17_1) then
			arg_17_0.actionWaiting = false
		end
	end
end

function var_0_0.PlayCV(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	arg_19_0:RemoveSeTimer()

	if arg_19_1 then
		arg_19_0.seTimer = Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/" .. arg_19_1[1])
		end, arg_19_1[2], 1)

		arg_19_0.seTimer:Start()
	end

	local var_19_0 = ShipWordHelper.RawGetCVKey(arg_19_0.ship:getSkinId())
	local var_19_1 = pg.CriMgr.GetCVBankName(var_19_0)

	arg_19_0.cvLoader:Load(var_19_1, arg_19_3, arg_19_2, arg_19_4)
end

function var_0_0.RemoveSeTimer(arg_21_0)
	if arg_21_0.seTimer then
		arg_21_0.seTimer:Stop()

		arg_21_0.seTimer = nil
	end
end

function var_0_0.PlayChangeSkinActionIn(arg_22_0, arg_22_1)
	if arg_22_0.live2dChar:IsLoaded() then
		if arg_22_0.live2dChar:checkActionExist("change_in") then
			arg_22_0:TriggerEvent("event_change_in")
		else
			arg_22_0:TriggerEvent("event_login")
		end
	else
		arg_22_0._initTriggerAction = {
			"event_change_in",
			"event_login"
		}
	end

	if arg_22_1 and arg_22_1.callback then
		arg_22_1.callback({
			flag = true
		})
	end
end

function var_0_0.PlayChangeSkinActionOut(arg_23_0, arg_23_1)
	if arg_23_0.live2dChar:IsLoaded() and arg_23_0.live2dChar:checkActionExist("change_out") then
		arg_23_0:playSkinOut(arg_23_1)
	elseif arg_23_1 and arg_23_1.callback then
		arg_23_1.callback({
			flag = true
		})
	end
end

function var_0_0.playSkinOut(arg_24_0, arg_24_1)
	local function var_24_0()
		if arg_24_1 and arg_24_1.callback then
			arg_24_1.callback({
				flag = true
			})
		end
	end

	if not arg_24_0.live2dChar:TriggerAction("change_out", function()
		return
	end, false, function()
		if var_24_0 then
			var_24_0()

			var_24_0 = nil
		end
	end) and var_24_0 then
		var_24_0()

		var_24_0 = nil
	end
end

function var_0_0.OnDisplayWorld(arg_28_0)
	return
end

function var_0_0.OnPause(arg_29_0)
	arg_29_0:RemoveScreenChangeTimer()
	arg_29_0:ResetContainerPosition()

	arg_29_0.actionWaiting = false

	arg_29_0:OnUnload()
end

function var_0_0.OnUpdateShip(arg_30_0, arg_30_1)
	if arg_30_1 then
		arg_30_0.live2dChar:updateShip(arg_30_1)
	end
end

function var_0_0.SetContainerVisible(arg_31_0, arg_31_1)
	return
end

function var_0_0.OnResume(arg_32_0)
	arg_32_0:SetContainerVisible(true)
	arg_32_0:AddScreenChangeTimer()
	arg_32_0:UpdateContainerPosition()
	onNextTick(function()
		if arg_32_0.ship then
			arg_32_0:Load(arg_32_0.ship)
		end
	end)
end

function var_0_0.Dispose(arg_34_0)
	var_0_0.super.Dispose(arg_34_0)
	arg_34_0:RemoveSeTimer()
	arg_34_0:RemoveScreenChangeTimer()

	if arg_34_0.eventTrigger then
		ClearEventTrigger(arg_34_0.eventTrigger)
	end
end

function var_0_0.GetOffset(arg_35_0)
	return arg_35_0.live2dContainer.localPosition.x
end

function var_0_0.GetCenterPos(arg_36_0)
	return arg_36_0.live2dContainer.position
end

function var_0_0.IslimitYPos(arg_37_0)
	return MainPaintingShift.IsLimitYPos(arg_37_0.ship:getPainting())
end

return var_0_0
