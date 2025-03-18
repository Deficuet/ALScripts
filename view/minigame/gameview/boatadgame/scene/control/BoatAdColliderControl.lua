local var_0_0 = class("BoatAdColliderControl")
local var_0_1
local var_0_2

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_1 = BoatAdGameVo
	var_0_2 = BoatAdGameConst
	arg_1_0._tf = arg_1_1
	arg_1_0._eventCall = arg_1_2
end

function var_0_0.start(arg_2_0)
	arg_2_0._itemMoveSpeed = var_0_1.item_move_speed
end

function var_0_0.step(arg_3_0, arg_3_1)
	local var_3_0 = var_0_1.GetGameChar()
	local var_3_1 = var_0_1.GetGameItems()
	local var_3_2 = var_0_1.GetGameEnemys()
	local var_3_3, var_3_4 = var_3_0:getWorldColliderData()
	local var_3_5 = var_3_0:getPosition()
	local var_3_6 = var_3_0:getMoveCount()
	local var_3_7 = var_3_0:getHp()
	local var_3_8 = var_3_0:getLine()

	for iter_3_0 = 1, #var_3_1 do
		local var_3_9 = var_3_1[iter_3_0]
		local var_3_10, var_3_11 = var_3_9:getWorldColliderData()
		local var_3_12 = var_3_9:getPosition()
		local var_3_13 = var_3_9:getMoveCount()
		local var_3_14 = var_3_9:getBuff()
		local var_3_15 = var_3_9:getLine()
		local var_3_16 = var_3_9:getConfig("ad")
		local var_3_17 = var_3_9:getConfig("guard")
		local var_3_18 = var_3_9:getConfig("speed_down")
		local var_3_19 = false

		if not var_3_9:getTouchFlag() and var_3_12.y > var_3_5.y and not var_3_19 then
			if not var_3_14 then
				if var_0_1.CheckRectCollider(var_3_3, var_3_10, var_3_4, var_3_11) then
					var_3_19 = true
				end
			elseif var_3_14 and var_3_15 ~= var_3_8 then
				local var_3_20 = var_0_2.buff_touch_width[var_3_13]

				if var_3_5.x >= var_3_20[1] and var_3_5.x <= var_3_20[2] and var_0_1.CheckRectCollider(var_3_3, var_3_10, var_3_4, var_3_11) then
					var_3_19 = true
				end
			end
		end

		if var_3_19 then
			var_3_9:setTouch(true)

			if var_3_9:getScore() and var_3_9:getScore() > 0 then
				arg_3_0._eventCall(BoatAdGameEvent.ADD_SCORE, var_3_9:getScore())
			end

			if var_3_9:getHp() ~= 0 then
				if var_3_9:getHp() < 0 or var_3_9:getConfig("hp_type") == var_0_2.hp_type_div then
					pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_1.SFX_SOUND_SHIBAI)
				elseif not var_3_16 then
					pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_1.SFX_SOUND_GREAT)
				end

				var_3_0:changeHp(var_3_9:getHp(), var_3_9:getConfig("hp_type"))
			end

			var_3_0:setLine(var_3_9:getLine())

			if var_3_16 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_1.SFX_SOUND_PERFECT)
				arg_3_0._eventCall(BoatAdGameEvent.PLAY_AD)
			end

			if var_3_17 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_1.SFX_SOUND_GREAT)
				var_3_0:addGuard(var_3_17)
			end

			if var_3_18 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_1.SFX_SOUND_GREAT)
				arg_3_0._eventCall(BoatAdGameEvent.SPEED_DOWN, var_3_18)
			end

			return
		end
	end

	if not var_3_0:getBattle() then
		for iter_3_1 = 1, #var_3_2 do
			local var_3_21 = var_3_2[iter_3_1]
			local var_3_22 = var_3_21:getPosition()
			local var_3_23 = var_3_21:getLine()

			if var_3_21:getLife() and var_3_22.y > var_3_5.y - 30 then
				local var_3_24 = var_3_21:getMoveCount()
				local var_3_25 = var_3_21:getBoss()
				local var_3_26, var_3_27 = var_3_21:getWorldColliderData()

				if var_0_1.CheckRectCollider(var_3_3, var_3_26, var_3_4, var_3_27) then
					local var_3_28 = var_3_21:getHp()

					var_3_0:battle(var_3_28, var_3_25)
					var_3_21:battle(var_3_7)
					var_3_0:setLine(var_3_21:getLine())
					LuaHelper.Vibrate()

					return
				end
			end
		end
	end
end

function var_0_0.dispose(arg_4_0)
	return
end

function var_0_0.clear(arg_5_0)
	return
end

return var_0_0
