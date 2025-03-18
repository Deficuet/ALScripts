local var_0_0 = class("TouchCakeScene")
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5

var_0_0.EVENT_ACTION_PROP = "event action prop"
var_0_0.EVENT_ACTION_CAKE = "event action cake"
var_0_0.EVENT_ACTION_WIELD = "event action wield"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_5 = TouchCakeGameVo
	arg_1_0._tf = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0.sceneMask = findTF(arg_1_0._tf, "sceneMask")
	arg_1_0.sceneContent = findTF(arg_1_0._tf, "sceneMask/sceneContainer")

	local function var_1_0(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:onSceneEventCall(arg_2_0, arg_2_1, arg_2_2)
	end

	arg_1_0:showContainer(false)

	local var_1_1 = findTF(arg_1_0.sceneContent, "scene/content/cakeContent")

	arg_1_0.cakeController = TouchCakeTowerController.New(var_1_1, var_1_0)

	local var_1_2 = findTF(arg_1_0.sceneContent, "scene/content/charContent")

	arg_1_0.charController = TouchCakeCharController.New(var_1_2, var_1_0)

	local var_1_3 = findTF(arg_1_0.sceneContent, "scene/content/effectContent")

	arg_1_0.effectController = TouchCakeEffectController.New(var_1_3, var_1_0)
end

function var_0_0.onSceneEventCall(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_1 == TouchCakeScene.EVENT_ACTION_PROP then
		local var_3_0 = arg_3_2.prop
		local var_3_1 = var_3_0.data.dizzi
		local var_3_2 = var_3_0.data.guard
		local var_3_3 = var_3_0.data.boom
		local var_3_4 = var_3_0.data.score
		local var_3_5 = arg_3_0.charController:getDirect()

		if var_3_0.direct == var_3_5 then
			if arg_3_3 then
				arg_3_3(true)
			end

			if var_3_4 and var_3_4 >= 0 then
				local var_3_6 = arg_3_0:getScore(var_3_4, var_0_5.comboNum)

				arg_3_0._event:emit(TouchCakeGameEvent.ADD_SCORE, var_3_6)
			end

			if var_3_2 and var_3_2 > 0 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_5.SFX_COUNT_PERFECT)
				arg_3_0.charController:guard(var_3_2)
			end

			if var_3_1 and var_3_1 > 0 and arg_3_0.charController:dizzi(var_3_1) then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_5.SFX_COUNT_STEP)
				arg_3_0._event:emit(TouchCakeGameEvent.PLAYER_DIZZI, var_3_4)
			end

			if var_3_3 and var_3_3 > 0 and not arg_3_0.charController:getGuard() then
				arg_3_0.effectController:showBoom(var_3_3, 0.1)
				arg_3_0._event:emit(TouchCakeGameEvent.PLAYER_BOOM)
			end
		elseif arg_3_3 then
			arg_3_3(false)
		end
	elseif arg_3_1 == TouchCakeScene.EVENT_ACTION_WIELD then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_5.SFX_COUNT_THROW)
		arg_3_0.cakeController:touchBottomCake(arg_3_2, arg_3_3)
	elseif arg_3_1 == TouchCakeScene.EVENT_ACTION_CAKE then
		local var_3_7 = arg_3_2.cake.score

		if var_3_7 and var_3_7 >= 0 then
			arg_3_0._event:emit(TouchCakeGameEvent.ADD_COMBO)

			local var_3_8 = arg_3_0:getScore(var_3_7, var_0_5.comboNum)

			arg_3_0._event:emit(TouchCakeGameEvent.ADD_SCORE, var_3_8)
		end
	end
end

function var_0_0.start(arg_4_0)
	arg_4_0.touchTimeCache = -1

	arg_4_0:showContainer(true)
	arg_4_0.cakeController:start()
	arg_4_0.charController:start()
	arg_4_0.effectController:start()
end

function var_0_0.step(arg_5_0)
	if arg_5_0.touchTimeCache and arg_5_0.touchTimeCache > 0 then
		arg_5_0.touchTimeCache = arg_5_0.touchTimeCache - var_0_5.deltaTime

		if arg_5_0.touchTimeCache <= 0 then
			arg_5_0.touchTimeCache = -1

			arg_5_0:touchDirect(arg_5_0.touchDirectCache, true)
		end
	end

	arg_5_0.cakeController:step()
	arg_5_0.charController:step()
	arg_5_0.effectController:step()
end

function var_0_0.clear(arg_6_0)
	return
end

function var_0_0.stop(arg_7_0)
	arg_7_0.cakeController:stop()
	arg_7_0.charController:stop()
	arg_7_0.effectController:stop()
end

function var_0_0.resume(arg_8_0)
	arg_8_0.cakeController:resume()
	arg_8_0.charController:resume()
	arg_8_0.effectController:resume()
end

function var_0_0.setGameOver(arg_9_0)
	return
end

function var_0_0.dispose(arg_10_0)
	arg_10_0.cakeController:dispose()
	arg_10_0.charController:dispose()
end

function var_0_0.showContainer(arg_11_0, arg_11_1)
	setActive(arg_11_0.sceneMask, arg_11_1)
end

function var_0_0.press(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_1 == KeyCode.A and arg_12_2 then
		arg_12_0:touchDirect(-1, false)
	elseif arg_12_1 == KeyCode.D and arg_12_2 then
		arg_12_0:touchDirect(1, false)
	end
end

function var_0_0.getScore(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_2 <= 0 then
		arg_13_2 = 1
	end

	for iter_13_0 = #TouchCakeGameConst.score_rate_count, 1, -1 do
		local var_13_0 = TouchCakeGameConst.score_rate_count[iter_13_0][1]
		local var_13_1 = TouchCakeGameConst.score_rate_count[iter_13_0][2]

		if var_13_0 <= arg_13_2 then
			return math.floor(arg_13_1 * var_13_1)
		end
	end

	return arg_13_1
end

function var_0_0.touchDirect(arg_14_0, arg_14_1, arg_14_2)
	if not arg_14_0.charController:getTouchAble() or not arg_14_0.cakeController:getTouchAble() then
		if not arg_14_2 then
			arg_14_0.touchTimeCache = 0.1
			arg_14_0.touchDirectCache = arg_14_1
		end

		return
	end

	arg_14_0.touchTimeCache = -1

	if arg_14_1 == -1 then
		arg_14_0.charController:onTouchLeft()
	elseif arg_14_1 == 1 then
		arg_14_0.charController:onTouchRight()
	end
end

return var_0_0
