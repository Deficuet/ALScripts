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
	local var_3_0 = arg_3_0.container.parent
	local var_3_1 = var_3_0.rect.height * -0.5
	local var_3_2 = var_3_0:InverseTransformPoint(arg_3_0.live2dContainer.position)
	local var_3_3 = arg_3_0.live2dContainer.localScale

	return var_3_1 - (arg_3_0.live2dContainer.rect.height * -0.5 * var_3_3.y + var_3_2.y)
end

function var_0_0.OnLoad(arg_4_0, arg_4_1)
	local var_4_0 = Live2D.GenerateData({
		loadPrefs = true,
		ship = arg_4_0.ship,
		scale = Vector3(52, 52, 52),
		position = Vector3(0, 0, 100),
		parent = arg_4_0.live2dContainer
	})

	arg_4_0.actionWaiting = false

	arg_4_0:SetContainerVisible(true)

	arg_4_0.cg.blocksRaycasts = true
	arg_4_0.live2dChar = Live2D.New(var_4_0, function(arg_5_0)
		arg_4_0:AdJustOrderInLayer(arg_5_0)
		arg_4_1()

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
	end)
	arg_4_0.shipGroup = getProxy(CollectionProxy):getShipGroup(arg_4_0.ship.groupId)

	arg_4_0:UpdateContainerPosition()
	arg_4_0:AddScreenChangeTimer()
end

function var_0_0.ResetState(arg_6_0)
	if not arg_6_0.live2dChar then
		return
	end

	arg_6_0.live2dChar:resetL2dData()
end

function var_0_0.AdJustOrderInLayer(arg_7_0, arg_7_1)
	arg_7_1:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
end

function var_0_0.ResetOrderInLayer(arg_8_0)
	if not arg_8_0.live2dChar then
		return
	end

	local var_8_0 = arg_8_0.live2dChar._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_8_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

	ReflectionHelp.RefSetProperty(var_8_1, "SortingOrder", var_8_0, 0)
end

function var_0_0.AddScreenChangeTimer(arg_9_0)
	arg_9_0:RemoveScreenChangeTimer()

	if not arg_9_0:IslimitYPos() then
		return
	end

	arg_9_0.screenTimer = Timer.New(function()
		if arg_9_0.currentWidth ~= Screen.width or arg_9_0.currentHeight ~= Screen.height then
			arg_9_0.currentWidth = Screen.width
			arg_9_0.currentHeight = Screen.height

			arg_9_0:ResetContainerPosition()
			arg_9_0:UpdateContainerPosition()
		end
	end, 0.5, -1)

	arg_9_0.screenTimer:Start()
end

function var_0_0.RemoveScreenChangeTimer(arg_11_0)
	if arg_11_0.screenTimer then
		arg_11_0.screenTimer:Stop()

		arg_11_0.screenTimer = nil
	end
end

function var_0_0.UpdateContainerPosition(arg_12_0)
	local var_12_0 = arg_12_0:IslimitYPos() and arg_12_0:GetHalfBodyOffsetY() or 0
	local var_12_1 = arg_12_0.live2dContainer.localPosition

	arg_12_0.live2dContainer.localPosition = Vector3(var_12_1.x, var_12_0, var_12_1.z)
end

function var_0_0.ResetContainerPosition(arg_13_0)
	local var_13_0 = arg_13_0.live2dContainer.localPosition

	arg_13_0.live2dContainer.localPosition = Vector3(var_13_0.x, 0, 0)
end

function var_0_0.OnUnload(arg_14_0)
	if arg_14_0.live2dChar then
		arg_14_0:RemoveScreenChangeTimer()
		arg_14_0:ResetContainerPosition()

		if arg_14_0.isModifyOrder then
			arg_14_0.isModifyOrder = false

			arg_14_0:ResetOrderInLayer()
		end

		arg_14_0.cg.blocksRaycasts = false

		arg_14_0.live2dChar:Dispose()

		arg_14_0.live2dChar = nil
	end
end

function var_0_0.OnClick(arg_15_0)
	local var_15_0

	if arg_15_0.live2dChar and arg_15_0.live2dChar.state == Live2D.STATE_INITED and not arg_15_0.live2dChar.ignoreReact then
		if not Input.mousePosition then
			return
		end

		local var_15_1 = arg_15_0.live2dChar:GetTouchPart()

		if var_15_1 > 0 then
			local var_15_2 = arg_15_0:GetTouchEvent(var_15_1)

			var_15_0 = var_15_2[math.ceil(math.random(#var_15_2))]
		else
			local var_15_3 = arg_15_0:GetIdleEvents()

			var_15_0 = var_15_3[math.floor(math.Random(0, #var_15_3)) + 1]
		end
	end

	if var_15_0 then
		arg_15_0:TriggerEvent(var_15_0)
	end
end

function var_0_0._TriggerEvent(arg_16_0, arg_16_1)
	if not arg_16_1 then
		return
	end

	if arg_16_0.actionWaiting then
		return
	end

	local var_16_0 = arg_16_0:GetEventConfig(arg_16_1)

	local function var_16_1(arg_17_0)
		if arg_17_0 then
			if var_16_0.dialog ~= "" then
				arg_16_0:DisplayWord(var_16_0.dialog)
			else
				arg_16_0:TriggerNextEventAuto()
			end
		end

		arg_16_0.actionWaiting = false
	end

	local var_16_2, var_16_3, var_16_4, var_16_5, var_16_6, var_16_7 = ShipWordHelper.GetCvDataForShip(arg_16_0.ship, var_16_0.dialog)
	local var_16_8 = var_16_0.action
	local var_16_9 = var_16_0.dialog
	local var_16_10 = string.gsub(var_16_9, "main_", "main")

	if arg_16_0.ship.propose and pg.character_voice[var_16_10] and arg_16_0.shipGroup and arg_16_0.shipGroup:VoiceReplayCodition(pg.character_voice[var_16_10]) and arg_16_0.live2dChar:checkActionExist(var_16_8 .. "_ex") then
		var_16_8 = var_16_8 .. "_ex"
	end

	if not var_16_7 then
		arg_16_0.actionWaiting = true

		local var_16_11 = arg_16_0.live2dChar:TriggerAction(var_16_8)

		var_16_1(var_16_11)
	else
		arg_16_0.actionWaiting = true

		if not var_16_4 or var_16_4 == nil or var_16_4 == "" or var_16_4 == "nil" then
			arg_16_0.actionWaiting = false

			var_16_1(true)
		end

		if not arg_16_0.live2dChar:TriggerAction(var_16_8, nil, nil, var_16_1) then
			arg_16_0.actionWaiting = false
		end
	end
end

function var_0_0.PlayCV(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	arg_18_0:RemoveSeTimer()

	if arg_18_1 then
		arg_18_0.seTimer = Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/" .. arg_18_1[1])
		end, arg_18_1[2], 1)

		arg_18_0.seTimer:Start()
	end

	local var_18_0 = ShipWordHelper.RawGetCVKey(arg_18_0.ship:getSkinId())
	local var_18_1 = pg.CriMgr.GetCVBankName(var_18_0)

	arg_18_0.cvLoader:Load(var_18_1, arg_18_3, arg_18_2, arg_18_4)
end

function var_0_0.RemoveSeTimer(arg_20_0)
	if arg_20_0.seTimer then
		arg_20_0.seTimer:Stop()

		arg_20_0.seTimer = nil
	end
end

function var_0_0.PlayChangeSkinActionIn(arg_21_0, arg_21_1)
	if arg_21_0.live2dChar:IsLoaded() then
		if arg_21_0.live2dChar:checkActionExist("change_in") then
			arg_21_0:TriggerEvent("event_change_in")
		else
			arg_21_0:TriggerEvent("event_login")
		end
	else
		arg_21_0._initTriggerAction = {
			"event_change_in",
			"event_login"
		}
	end

	if arg_21_1 and arg_21_1.callback then
		arg_21_1.callback({
			flag = true
		})
	end
end

function var_0_0.PlayChangeSkinActionOut(arg_22_0, arg_22_1)
	if arg_22_0.live2dChar:IsLoaded() and arg_22_0.live2dChar:checkActionExist("change_out") then
		arg_22_0:playSkinOut(arg_22_1)
	elseif arg_22_1 and arg_22_1.callback then
		arg_22_1.callback({
			flag = true
		})
	end
end

function var_0_0.playSkinOut(arg_23_0, arg_23_1)
	local function var_23_0()
		if arg_23_1 and arg_23_1.callback then
			arg_23_1.callback({
				flag = true
			})
		end
	end

	if not arg_23_0.live2dChar:TriggerAction("change_out", function()
		return
	end, false, function()
		if var_23_0 then
			var_23_0()

			var_23_0 = nil
		end
	end) and var_23_0 then
		var_23_0()

		var_23_0 = nil
	end
end

function var_0_0.OnDisplayWorld(arg_27_0)
	return
end

function var_0_0.OnPuase(arg_28_0)
	arg_28_0:RemoveScreenChangeTimer()
	arg_28_0:ResetContainerPosition()

	arg_28_0.actionWaiting = false

	arg_28_0.live2dChar:SetVisible(false)
end

function var_0_0.OnUpdateShip(arg_29_0, arg_29_1)
	if arg_29_1 then
		arg_29_0.live2dChar:updateShip(arg_29_1)
	end
end

function var_0_0.SetContainerVisible(arg_30_0, arg_30_1)
	setActive(arg_30_0.live2dContainer, arg_30_1)
end

function var_0_0.OnResume(arg_31_0)
	arg_31_0:SetContainerVisible(true)
	arg_31_0:AddScreenChangeTimer()
	arg_31_0:UpdateContainerPosition()
	arg_31_0.live2dChar:SetVisible(true)
	arg_31_0.live2dChar:UpdateAtomSource()
end

function var_0_0.Dispose(arg_32_0)
	var_0_0.super.Dispose(arg_32_0)
	arg_32_0:RemoveSeTimer()
	arg_32_0:RemoveScreenChangeTimer()

	if arg_32_0.eventTrigger then
		ClearEventTrigger(arg_32_0.eventTrigger)
	end
end

function var_0_0.GetOffset(arg_33_0)
	return arg_33_0.live2dContainer.localPosition.x
end

function var_0_0.GetCenterPos(arg_34_0)
	return arg_34_0.live2dContainer.position
end

function var_0_0.IslimitYPos(arg_35_0)
	local var_35_0 = arg_35_0.ship:getPainting()

	return var_35_0 == "biaoqiang" or var_35_0 == "z23" or var_35_0 == "lafei" or var_35_0 == "lingbo" or var_35_0 == "mingshi" or var_35_0 == "xuefeng"
end

return var_0_0
