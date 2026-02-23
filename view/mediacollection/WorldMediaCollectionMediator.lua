local var_0_0 = class("WorldMediaCollectionMediator", ContextMediator)

var_0_0.BEGIN_STAGE = "WorldMediaCollectionMediator BEGIN_STAGE"
var_0_0.ON_ADD_SUBLAYER = "WorldMediaCollectionMediator.ON_ADD_SUBLAYER"
var_0_0.OPEN_LOVE_LETTER_DISPLAY = "WorldMediaCollectionMediator.OPEN_LOVE_LETTER_DISPLAY"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.BEGIN_STAGE, function(arg_2_0, arg_2_1)
		arg_1_0.contextData.revertBgm = pg.CriMgr.GetInstance().bgmNow

		arg_1_0:sendNotification(GAME.BEGIN_STAGE, arg_2_1)
	end)
	arg_1_0:bind(var_0_0.ON_ADD_SUBLAYER, function(arg_3_0, arg_3_1)
		arg_1_0:addSubLayers(arg_3_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_LOVE_LETTER_DISPLAY, function(arg_4_0, arg_4_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = LoveLetterDisplayMediator,
			viewComponent = LoveLetterDisplayLayer,
			data = setmetatable({
				groupId = arg_4_1
			}, {
				__index = getProxy(LoveLetterProxy):GetGroupData(arg_4_1):GetLetterDataFromId()
			})
		}))
	end)
end

function var_0_0.listNotificationInterests(arg_5_0)
	return {
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_DONE,
		GAME.UNLOCK_LOVE_LETTER_DONE
	}
end

function var_0_0.handleNotification(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1:getName()
	local var_6_1 = arg_6_1:getBody()

	if var_6_0 == PlayerProxy.UPDATED then
		arg_6_0.viewComponent:UpdateView()
	elseif var_6_0 == GAME.BEGIN_STAGE_DONE then
		arg_6_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_6_1)
	elseif var_6_0 == GAME.UNLOCK_LOVE_LETTER_DONE then
		pg.EasyRedDotMgr.GetInstance():TriggerMarks("love_letter_unlock_letter")
	end
end

return var_0_0
