local var_0_0 = class("LogoutCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	arg_1_0:sendNotification(GAME.WILL_LOGOUT)

	if PLATFORM ~= PLATFORM_WINDOWSEDITOR and PLATFORM_CHT == PLATFORM_CODE and var_1_0.code ~= SDK_EXIT_CODE then
		pg.SdkMgr.GetInstance():LogoutSDK()

		return
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_ROLE_LOGOUT)
	pg.GameTrackerMgr.GetInstance():Synchronization()

	local var_1_1 = ys.Battle.BattleState.GetInstance()

	if var_1_1:GetState() ~= ys.Battle.BattleState.BATTLE_STATE_IDLE then
		warning("stop and clean battle.")
		var_1_1:Stop("kick")
	end

	arg_1_0:sendNotification(GAME.STOP_BATTLE_LOADING, {})
	pg.NewStoryMgr:GetInstance():Quit()

	if pg.MsgboxMgr.GetInstance()._go.activeSelf then
		pg.MsgboxMgr.GetInstance():hide()
	end

	getProxy(SettingsProxy):Reset()
	originalPrint("disconnect from server...-" .. tostring(var_1_0.code))
	pg.ConnectionMgr.GetInstance():Disconnect()

	BillboardMediator.time = nil
	Map.lastMap = nil
	Map.lastMapForActivity = nil
	BuildShipScene.projectName = nil
	DockyardScene.selectAsc = nil
	DockyardScene.sortIndex = nil
	DockyardScene.typeIndex = nil
	DockyardScene.campIndex = nil
	DockyardScene.rarityIndex = nil
	DockyardScene.extraIndex = nil
	DockyardScene.commonTag = nil
	LevelMediator2.prevRefreshBossTimeTime = nil
	ActivityMainScene.FetchReturnersTime = nil
	ActivityMainScene.Data2Time = nil
	MainSkinDiscountItemTipSequence.TipFlag = nil
	COMBAT_SKIN_KEY = nil

	pg.BrightnessMgr.GetInstance():ExitManualMode()
	pg.SeriesGuideMgr.GetInstance():dispose()
	pg.NewGuideMgr.GetInstance():Exit()
	PoolMgr.GetInstance():DestroyAllPrefab()
	pg.GuildMsgBoxMgr.GetInstance():Hide()

	local var_1_2 = getProxy(UserProxy)

	if var_1_2 then
		local var_1_3 = var_1_2:getRawData()

		if var_1_3 then
			var_1_3:clear()
		end

		var_1_2:SetLoginedFlag(false)
	end

	arg_1_0:sendNotification(GAME.LOAD_SCENE, {
		context = Context.New({
			cleanStack = true,
			scene = SCENE.LOGIN,
			mediator = LoginMediator,
			viewComponent = LoginScene,
			data = var_1_0
		}),
		callback = function()
			if pg.proxyRegister then
				pg.proxyRegister:Stop()
				pg.proxyRegister:RemoveProxy(arg_1_0.facade)

				pg.proxyRegister = nil
			end

			arg_1_0.facade:removeCommand(GAME.LOAD_SCENE_DONE)
		end
	})

	if var_1_0.code ~= SDK_EXIT_CODE then
		pg.SdkMgr.GetInstance():LogoutSDK(var_1_0.code)
	end
end

return var_0_0
