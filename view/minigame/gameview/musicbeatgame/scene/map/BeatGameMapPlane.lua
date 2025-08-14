local var_0_0 = class("BeatGameMapPlane", import(".BeatGameMapBase"))
local var_0_1 = 500
local var_0_2 = 0.1
local var_0_3 = 20

function var_0_0.onInit(arg_1_0)
	arg_1_0.touchTf = findTF(arg_1_0._tf, "touch")
	arg_1_0.flapTf = findTF(arg_1_0._tf, "flap")
	arg_1_0.touchTrigger = GetOrAddComponent(arg_1_0.touchTf, typeof(EventTriggerListener))
	arg_1_0.flapTrigger = GetOrAddComponent(arg_1_0.flapTf, typeof(EventTriggerListener))

	arg_1_0.touchTrigger:AddPointDownFunc(function()
		arg_1_0:keyTrigger("catch", "item_touch", "touch")
	end)
	arg_1_0.flapTrigger:AddPointDownFunc(function()
		arg_1_0:keyTrigger("refuse", "item_flap", "flap")
	end)
	arg_1_0._event:bind(MusicBeatGameEvent.KEY_CODE_DOWN, function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_1 == KeyCode.A then
			arg_1_0:keyTrigger("refuse", "item_flap", "flap")
		elseif arg_4_1 == KeyCode.D then
			arg_1_0:keyTrigger("catch", "item_touch", "touch")
		end
	end)

	arg_1_0.leftSpine = GetComponent(findTF(arg_1_0._tf, "char_left/ad/char"), typeof(SpineAnimUI))
	arg_1_0.rightSpine = GetComponent(findTF(arg_1_0._tf, "char_right/ad/char"), typeof(SpineAnimUI))
	arg_1_0.emojiTf = findTF(arg_1_0._tf, "emoji")

	setActive(arg_1_0.emojiTf, false)

	arg_1_0.beatCount = findTF(arg_1_0._tf, "beat_count")

	setActive(arg_1_0.beatCount, true)
	arg_1_0:initData()
	arg_1_0:initPosition()
	arg_1_0:initItemMap()
end

function var_0_0.initData(arg_5_0)
	arg_5_0.dymItems = {}
	arg_5_0.itemMap = {}
	arg_5_0.itemFinalMap = {}
end

function var_0_0.initPosition(arg_6_0)
	arg_6_0.content = findTF(arg_6_0._tf, "content")
	arg_6_0.startTf = findTF(arg_6_0._tf, "content/start")
	arg_6_0.endTf = findTF(arg_6_0._tf, "content/end")
	arg_6_0.startPosition = arg_6_0.startTf.anchoredPosition
end

function var_0_0.initItemMap(arg_7_0)
	local var_7_0 = arg_7_0._data.items

	for iter_7_0 = 1, #var_7_0 do
		local var_7_1 = var_7_0[iter_7_0].track_key

		if arg_7_0.itemMap[var_7_1] == nil then
			arg_7_0.itemMap[var_7_1] = {}
		elseif arg_7_0.itemFinalMap[var_7_1] == nil then
			arg_7_0.itemFinalMap[var_7_1] = {}
		end

		if var_7_0[iter_7_0].final then
			table.insert(arg_7_0.itemFinalMap[var_7_1], var_7_0[iter_7_0])
		else
			table.insert(arg_7_0.itemMap[var_7_1], var_7_0[iter_7_0])
		end
	end
end

function var_0_0.createDymItem(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.track
	local var_8_1 = arg_8_1.final
	local var_8_2 = arg_8_0:getItemData(var_8_0.key_flag, var_8_1)
	local var_8_3 = arg_8_0:createItemTf(var_8_2.prefab)
	local var_8_4 = GetComponent(var_8_3, typeof(Animator))

	var_8_4.speed = 0

	table.insert(arg_8_0.dymItems, {
		check = true,
		data = var_8_2,
		tf = var_8_3,
		anim = var_8_4,
		track = var_8_0
	})
end

function var_0_0.getItemData(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0

	if arg_9_2 then
		var_9_0 = arg_9_0.itemFinalMap[arg_9_1]
	else
		var_9_0 = arg_9_0.itemMap[arg_9_1]
	end

	return var_9_0[math.random(1, #var_9_0)]
end

function var_0_0.createItemTf(arg_10_0, arg_10_1)
	local var_10_0 = tf(instantiate(findTF(arg_10_0._tf, arg_10_1)))

	setParent(var_10_0, arg_10_0.content)
	setActive(var_10_0, false)

	var_10_0.anchoredPosition = arg_10_0.startTf.anchoredPosition

	return var_10_0
end

function var_0_0.keyTrigger(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_0.finalEnd then
		return
	end

	if arg_11_0.triggerCd then
		return
	end

	arg_11_0.triggerCd = var_0_2

	arg_11_0:setCharAnimation(arg_11_0.leftSpine, arg_11_1, 0, function()
		arg_11_0:setCharAnimation(arg_11_0.leftSpine, "idle", 0, function()
			return
		end)
	end, function()
		local var_14_0 = arg_11_0:getCheckDymItem()

		if var_14_0 then
			arg_11_0._event:emit(MusicBeatGameEvent.TRACK_EVENT_MATCH, var_14_0.track, function(arg_15_0, arg_15_1)
				if arg_15_0 then
					var_14_0.trigger = true
					var_14_0.anim.speed = 1

					var_14_0.anim:Play(arg_11_2, -1)

					if var_14_0.data.act == arg_11_3 then
						var_14_0.typeMatch = true

						arg_11_0._event:emit(MusicBeatGameEvent.ADD_SCORE, {
							num = var_14_0.data.score
						})
						arg_11_0:setEmoji("success")
						arg_11_0:changeLife(1)
					else
						if var_14_0.data.act == "flap" and arg_11_3 ~= "flap" then
							var_14_0.typeMatch = false

							arg_11_0:setCharAnimation(arg_11_0.leftSpine, "shock", 0, function()
								arg_11_0:setCharAnimation(arg_11_0.leftSpine, "idle", 0)
							end)
							arg_11_0:changeLife(-1)
						end

						arg_11_0:setEmoji("fail")
					end

					local var_15_0

					if var_14_0.typeMatch then
						if var_14_0.data.act == "flap" then
							var_15_0 = MusicBeatGameConst.sfx_plane_success_hit
						elseif var_14_0.data.act == "touch" then
							var_15_0 = MusicBeatGameConst.sfx_plane_success_touch
						end
					elseif var_14_0.data.act == "flap" then
						var_15_0 = MusicBeatGameConst.sfx_plane_faild_hit
					elseif var_14_0.data.act == "touch" then
						var_15_0 = MusicBeatGameConst.sfx_plane_faild_touch
					end

					if var_15_0 then
						print("play Effect sound " .. var_15_0)
						pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_15_0)
					end
				end
			end)
		end
	end)
end

function var_0_0.onStart(arg_17_0)
	arg_17_0.triggerCd = nil
	arg_17_0.finalEnd = false

	onNextTick(function()
		if arg_17_0.leftSpine then
			arg_17_0.leftSpine:Resume()
		end

		if arg_17_0.rightSpine then
			arg_17_0.rightSpine:Resume()
		end
	end)

	arg_17_0.lifeCount = var_0_3

	arg_17_0:changeLife(0)
	arg_17_0:setCharAnimation(arg_17_0.leftSpine, "idle", 0, function()
		return
	end, function()
		return
	end)
	arg_17_0:setCharAnimation(arg_17_0.rightSpine, "idle", 0, function()
		return
	end, function()
		return
	end)
end

function var_0_0.onStartTrack(arg_23_0, arg_23_1)
	arg_23_0:createDymItem(arg_23_1)
end

function var_0_0.onStep(arg_24_0)
	if arg_24_0.triggerCd then
		arg_24_0.triggerCd = arg_24_0.triggerCd - arg_24_0._gameVo.deltaTime

		if arg_24_0.triggerCd <= 0 then
			arg_24_0.triggerCd = nil
		end
	end

	local var_24_0 = arg_24_0._gameVo:getCriInfoTime()

	if var_24_0 ~= -1 then
		for iter_24_0 = #arg_24_0.dymItems, 1, -1 do
			local var_24_1 = arg_24_0.dymItems[iter_24_0]
			local var_24_2 = var_24_1.data.distance_time
			local var_24_3 = var_24_1.track.begin_time
			local var_24_4 = var_24_3 - var_24_0

			if var_24_1.active then
				if not var_24_1.trigger then
					local var_24_5 = 1 - (var_24_3 + var_0_1 - var_24_0) / (var_24_1.data.distance_time + var_0_1)

					if var_24_5 >= 0 and var_24_5 <= 1 then
						var_24_1.anim:Play("item_fly", -1, var_24_5)
					end
				end

				if var_24_3 <= var_24_0 and var_24_0 - var_24_3 > var_0_1 then
					var_24_1.active = false
					var_24_1.remove = true
				end

				if var_24_1.check and not var_24_1.trigger and var_24_0 - var_24_3 > MusicBeatGameConst.beat_offset then
					var_24_1.check = false

					if not var_24_1.trigger then
						arg_24_0:setEmoji("miss")

						if var_24_1.data.act == "flap" then
							arg_24_0:changeLife(-1)
						end
					end
				end
			elseif var_24_1.remove == true then
				if var_24_1.data.final then
					arg_24_0.finalEnd = true

					local var_24_6
					local var_24_7 = var_24_1.typeMatch and "final_correct" or "final_wrong"

					arg_24_0:setCharAnimation(arg_24_0.leftSpine, var_24_7, 0, function()
						arg_24_0.leftSpine:Pause()
					end)
					arg_24_0:setCharAnimation(arg_24_0.rightSpine, var_24_7, 0, function()
						arg_24_0.rightSpine:Pause()
					end)
				end

				local var_24_8 = table.remove(arg_24_0.dymItems, iter_24_0)

				Destroy(var_24_8.tf)

				var_24_8.tf = nil
				var_24_8.anim = nil
				var_24_8.track = nil
			elseif var_24_4 > 0 and var_24_4 <= var_24_2 then
				arg_24_0:activeDymItem(var_24_1)
			elseif not var_24_1.throw and var_24_4 > 0 and var_24_4 <= var_24_2 + 100 then
				var_24_1.throw = true

				arg_24_0:setCharAnimation(arg_24_0.rightSpine, "throw", 0, function()
					arg_24_0:setCharAnimation(arg_24_0.rightSpine, "idle", 0, nil, nil)
				end, nil)
			elseif var_24_4 <= var_24_2 / 2 or var_24_3 <= var_24_0 and not var_24_1.active then
				var_24_1.remove = true
			end
		end
	end
end

function var_0_0.changeLife(arg_28_0, arg_28_1)
	arg_28_0.lifeCount = arg_28_0.lifeCount + arg_28_1

	if arg_28_0.lifeCount <= 0 then
		arg_28_0._event:emit(MusicBeatGameEvent.GAME_OVER)
	end

	setText(findTF(arg_28_0.beatCount, "text"), arg_28_0.lifeCount)
end

function var_0_0.setEmoji(arg_29_0, arg_29_1)
	setActive(arg_29_0.emojiTf, false)
	arg_29_0:setChildVisible(findTF(arg_29_0.emojiTf, "ad"), false)

	if arg_29_1 then
		setActive(arg_29_0.emojiTf, true)
		setActive(findTF(arg_29_0.emojiTf, "ad/" .. arg_29_1), true)
	end
end

function var_0_0.setChildVisible(arg_30_0, arg_30_1, arg_30_2)
	for iter_30_0 = 1, arg_30_1.childCount do
		local var_30_0 = arg_30_1:GetChild(iter_30_0 - 1)

		setActive(var_30_0, arg_30_2)
	end
end

function var_0_0.getCheckDymItem(arg_31_0)
	for iter_31_0 = 1, #arg_31_0.dymItems do
		local var_31_0 = arg_31_0.dymItems[iter_31_0]

		if var_31_0.check and not var_31_0.trigger then
			return var_31_0
		end
	end

	return nil
end

function var_0_0.activeDymItem(arg_32_0, arg_32_1)
	setActive(arg_32_1.tf, true)

	arg_32_1.active = true
end

function var_0_0.setCharAnimation(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4, arg_33_5)
	if arg_33_1 then
		arg_33_1:SetActionCallBack(nil)
		arg_33_1:SetActionCallBack(function(arg_34_0)
			if arg_34_0 == "finish" and arg_33_4 then
				arg_33_1:SetActionCallBack(nil)
				arg_33_4()
			elseif arg_34_0 == "action" and arg_33_5 then
				arg_33_5()
			end
		end)
	end

	if arg_33_1 == arg_33_0.leftSpine then
		print("set action" .. arg_33_2)
	end

	arg_33_1:SetAction(arg_33_2, arg_33_3)
end

function var_0_0.onClear(arg_35_0)
	for iter_35_0 = 1, #arg_35_0.dymItems do
		if arg_35_0.dymItems[iter_35_0].tf then
			Destroy(arg_35_0.dymItems[iter_35_0].tf)

			arg_35_0.dymItems[iter_35_0].tf = nil
			arg_35_0.dymItems[iter_35_0].anim = nil
		end
	end

	arg_35_0.dymItems = {}
end

function var_0_0.onDispose(arg_36_0)
	return
end

return var_0_0
