local var_0_0 = class("ReversePacmanHomeMediator", import("view.backYard.CourtYardMediator"))

var_0_0.SET_UP = "ReversePacmanHomeMediator::SET_UP"
var_0_0.GO_GAME_SCENE = "ReversePacmanHomeMediator::GO_GAME_SCENE"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.SET_UP, function(arg_2_0, arg_2_1)
		local var_2_0 = arg_1_0:GenCourtYardData(arg_2_1)

		_courtyard = CourtYardBridge.New(var_2_0)
	end)
	arg_1_0:bind(var_0_0.GO_GAME_SCENE, function(arg_3_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.REVERSE_PACMAN_SELECT)
	end)
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		CourtYardEvent._QUIT,
		CourtYardEvent._INITED,
		GAME.REVERSE_PACMAN_HIRE_ROLE_DONE,
		GAME.REVERSE_PACMAN_REFRESH_TIP
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()
	local var_5_2 = arg_5_1:getType()

	if var_5_0 == CourtYardEvent._QUIT then
		arg_5_0.viewComponent:emit(BaseUI.ON_BACK)
	elseif var_5_0 == CourtYardEvent._INITED then
		arg_5_0.viewComponent:OnCourtYardLoaded()
	elseif var_5_0 == GAME.REVERSE_PACMAN_HIRE_ROLE_DONE then
		local var_5_3 = pg.activity_chasing_character[var_5_1]
		local var_5_4 = ShipGroup.getDefaultShipConfig(pg.ship_skin_template[var_5_3.skin_id].ship_group).id
		local var_5_5 = ReversePacmanDormShip.New({
			id = var_5_4,
			configId = var_5_4,
			skin_id = var_5_3.skin_id,
			roleID = var_5_1
		})

		_courtyard:GetController():AddShip(var_5_5, 0, 0)
		arg_5_0.viewComponent:RefreshBtns()
		arg_5_0.viewComponent:RefreshTips()
	elseif var_5_0 == GAME.REVERSE_PACMAN_REFRESH_TIP then
		arg_5_0.viewComponent:RefreshTips()
	end
end

function var_0_0.remove(arg_6_0)
	if _courtyard then
		_courtyard:Dispose()

		_courtyard = nil
	end
end

return var_0_0
