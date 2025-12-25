local var_0_0 = class("MainSilentChecker", import("view.base.BaseEventLogic"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0._silentRunFlag = true
end

function var_0_0.SetUp(arg_2_0)
	arg_2_0:Clear()

	arg_2_0.inactivityTimeout = SettingsMainScenePanel.GetEnterFlagShipTime()
	arg_2_0.lastActivityTime = Time.time

	if not arg_2_0.handle then
		arg_2_0.handle = UpdateBeat:CreateListener(arg_2_0.Update, arg_2_0)
	end

	UpdateBeat:AddListener(arg_2_0.handle)

	arg_2_0.isFoldState = false

	arg_2_0:bind(NewMainScene.FOLD, function(arg_3_0, arg_3_1)
		arg_2_0.isFoldState = arg_3_1
	end)
end

function var_0_0.Update(arg_4_0)
	if IsUnityEditor then
		if Input.anyKeyDown then
			arg_4_0.lastActivityTime = Time.time
		end
	elseif Input.touchCount > 0 then
		arg_4_0.lastActivityTime = Time.time
	end

	if Time.time - arg_4_0.lastActivityTime > arg_4_0.inactivityTimeout then
		arg_4_0:EnterState()
	end
end

function var_0_0.EnterState(arg_5_0)
	if arg_5_0:AnyOverlayShowing() then
		arg_5_0.lastActivityTime = Time.time

		return
	end

	if arg_5_0._silentRunFlag then
		arg_5_0:Clear()
		arg_5_0:emit(NewMainScene.ENTER_SILENT_VIEW)
	end
end

function var_0_0.AnyOverlayShowing(arg_6_0)
	local var_6_0 = getProxy(ContextProxy):getCurrentContext()
	local var_6_1 = pg.LayerWeightMgr.GetInstance().uiOrigin

	return pg.NewStoryMgr.GetInstance():IsRunning() or pg.NewGuideMgr.GetInstance():IsBusy() or isActive(pg.MsgboxMgr.GetInstance()._tf) or var_6_0:hasChild() or var_6_1.childCount > 0 or arg_6_0.isFoldState
end

function var_0_0.Clear(arg_7_0)
	if arg_7_0.handle then
		UpdateBeat:RemoveListener(arg_7_0.handle)

		arg_7_0.handle = nil
	end

	arg_7_0:disposeEvent()

	arg_7_0.isFoldState = false
end

function var_0_0.Disable(arg_8_0)
	arg_8_0:Clear()
end

function var_0_0.SetSilentRun(arg_9_0, arg_9_1)
	arg_9_0._silentRunFlag = arg_9_1
end

function var_0_0.Dispose(arg_10_0)
	arg_10_0:Disable()
end

return var_0_0
