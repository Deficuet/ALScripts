local var_0_0 = class("CityRebuildGameMediator", import("view.base.ContextMediator"))

var_0_0.INIT_TIME = "CityRebuildGameMediator.INIT_TIME"
var_0_0.RESULT = "CityRebuildGameMediator.RESULT"
var_0_0.CHOOSE_LEVEL = "CityRebuildGameMediator.CHOOSE_LEVEL"
var_0_0.OPEN_BOOK = "CityRebuildGameMediator.OPEN_BOOK"
var_0_0.OPEN_TASKS = "CityRebuildGameMediator.OPEN_TASKS"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.INIT_TIME, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.CITY_REBUILD, {
			operation = CityRebuildProxy.INIT_TIME,
			activityId = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.RESULT, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.CITY_REBUILD, {
			operation = CityRebuildProxy.RESULT,
			activityId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.CHOOSE_LEVEL, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(GAME.CITY_REBUILD, {
			operation = CityRebuildProxy.CHOOSE_LEVEL,
			activityId = arg_4_1,
			level = arg_4_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_BOOK, function(arg_5_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = CityRebuildBookMediator,
			viewComponent = CityRebuildBookLayer,
			data = {
				page = "buff"
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_TASKS, function(arg_6_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = CityRebuildTasksMediator,
			viewComponent = CityRebuildTasksLayer
		}))
	end)
end

function var_0_0.listNotificationInterests(arg_7_0)
	return {
		GAME.CITY_REBUILD_DONE
	}
end

function var_0_0.handleNotification(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getName()
	local var_8_1 = arg_8_1:getBody()

	if var_8_0 == GAME.CITY_REBUILD_DONE then
		if var_8_1.operation == CityRebuildProxy.CHOOSE_LEVEL or var_8_1.operation == CityRebuildProxy.INIT_TIME then
			arg_8_0.viewComponent:Refresh()
		elseif var_8_1.operation == CityRebuildProxy.REBUILD_OR_START_RECRUIT or var_8_1.operation == CityRebuildProxy.END_RECRUIT or var_8_1.operation == CityRebuildProxy.UPGRADE_BUFF then
			arg_8_0.viewComponent:Refresh(true)
		elseif var_8_1.operation == CityRebuildProxy.RESULT then
			arg_8_0.viewComponent:Refresh(true)

			local var_8_2 = var_8_1.awards
			local var_8_3 = var_8_1.pt.k + var_8_1.pt.m * 1000000 + var_8_1.pt.b * 1000000000

			local function var_8_4()
				if var_8_3 > 0 then
					table.insert(var_8_2, {
						id = 65103,
						type = 2,
						count = var_8_3
					})
				end

				if #var_8_2 > 0 then
					arg_8_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_8_2)
				end
			end

			arg_8_0.viewComponent:Summary(var_8_4, var_8_3)
		end
	end
end

return var_0_0
