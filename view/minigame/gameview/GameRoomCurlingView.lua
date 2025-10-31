local var_0_0 = class("GameRoomCurlingView", import("..BaseMiniGameView"))
local var_0_1 = "event:/ui/ddldaoshu2"
local var_0_2 = "event:/ui/taosheng"
local var_0_3 = "event:/ui/minigame_hitcake"
local var_0_4 = "event:/ui/zhengque"
local var_0_5 = "event:/ui/shibai"
local var_0_6 = 1
local var_0_7 = 2
local var_0_8 = 3
local var_0_9 = {
	20,
	40,
	60
}
local var_0_10 = 4
local var_0_11 = Vector2(-720, 0)
local var_0_12 = {
	-250,
	250
}
local var_0_13 = Vector2(-250, -42)
local var_0_14 = {
	1,
	10,
	30
}
local var_0_15 = 0.2
local var_0_16 = false
local var_0_17 = {
	walker = 0.1,
	miner = 0.2,
	wall = 0,
	oil = 0.2,
	cube = 0.2
}
local var_0_18 = {
	walker = 2,
	miner = 2,
	wall = 0,
	oil = 2,
	cube = 2
}
local var_0_19 = {
	0.5,
	5,
	10
}
local var_0_20 = {
	0.5,
	5,
	10
}
local var_0_21 = Vector2(400, -600)
local var_0_22 = Vector2(400, 500)
local var_0_23 = 1
local var_0_24 = 2
local var_0_25 = 3
local var_0_26 = 4
local var_0_27 = Vector2(617, -108)
local var_0_28 = 0.7
local var_0_29 = {
	111,
	222,
	333
}
local var_0_30 = {
	3000,
	2000,
	1000
}
local var_0_31 = 1
local var_0_32 = 2
local var_0_33 = 3
local var_0_34 = 4
local var_0_35 = {
	walker = 900,
	miner = 300,
	wall = 100,
	oil = 300,
	cube = 300
}
local var_0_36 = 1
local var_0_37 = {
	oil = {
		{
			appear = 0.8,
			num = 1
		},
		{
			appear = 0.1,
			num = 1
		}
	},
	cube = {
		{
			appear = 0.8,
			num = 1
		},
		{
			appear = 0.1,
			num = 1
		}
	},
	miner = {
		{
			appear = 1,
			num = 1
		},
		{
			appear = 0.1,
			num = 1
		}
	},
	walker = {
		appear = 1,
		path = {
			var_0_23,
			var_0_24,
			var_0_25,
			var_0_26
		}
	}
}
local var_0_38 = {
	cube = 3.5,
	miner = 3.5,
	walker = 4.5,
	oil = 3.5
}
local var_0_39 = true
local var_0_40 = "event_push"
local var_0_41 = "event_speed"
local var_0_42 = "event_hit"
local var_0_43 = "event_result"
local var_0_44 = "event_next"
local var_0_45 = "event_game_pause"
local var_0_46 = "event_game_resume"
local var_0_47 = "event_add_score"

local function var_0_48(arg_1_0, arg_1_1)
	local var_1_0 = {
		Ctor = function(arg_2_0)
			arg_2_0._tf = arg_1_0
			arg_2_0._event = arg_1_1
			arg_2_0.powerTF = findTF(arg_2_0._tf, "power")
			arg_2_0.powerSlider = GetComponent(arg_2_0.powerTF, typeof(Slider))

			arg_2_0:InitPowerSlider()

			arg_2_0.animator = GetComponent(arg_2_0._tf, typeof(Animator))
			arg_2_0.aniDft = GetComponent(arg_2_0._tf, typeof(DftAniEvent))

			arg_2_0.aniDft:SetTriggerEvent(function()
				arg_2_0:Push()
			end)

			arg_2_0.dragTrigger = GetOrAddComponent(arg_2_0._tf, "EventTriggerListener")

			arg_2_0.dragTrigger:AddPointDownFunc(function(arg_4_0, arg_4_1)
				if not arg_2_0.canClick then
					return
				end

				arg_2_0.canClick = false
				arg_2_0.charging = true
				arg_2_0.originScreenY = arg_4_1.position.y
				arg_2_0.originY = arg_2_0._tf.anchoredPosition.y

				arg_2_0:Charge()
			end)
			arg_2_0.dragTrigger:AddDragFunc(function(arg_5_0, arg_5_1)
				if not arg_2_0.charging then
					return
				end

				local var_5_0 = arg_5_1.position.y - arg_2_0.originScreenY + arg_2_0.originY

				var_5_0 = var_5_0 >= var_0_12[1] and var_5_0 or var_0_12[1]
				var_5_0 = var_5_0 <= var_0_12[2] and var_5_0 or var_0_12[2]

				setLocalPosition(arg_2_0._tf, Vector2(arg_2_0._tf.anchoredPosition.x, var_5_0))
			end)
			arg_2_0.dragTrigger:AddPointUpFunc(function(arg_6_0, arg_6_1)
				if not arg_2_0.charging then
					return
				end

				arg_2_0.charging = false

				arg_2_0.animator:SetInteger("Throw", arg_2_0.phase)
				arg_2_0.animator:SetInteger("Charge", 0)
			end)
			arg_2_0._event:bind(var_0_43, function(arg_7_0, arg_7_1, arg_7_2)
				arg_2_0.animator:SetInteger("Result", arg_7_1.result)
			end)
			arg_2_0._event:bind(var_0_44, function(arg_8_0, arg_8_1, arg_8_2)
				arg_2_0:Reset()
				arg_2_0:Start()
			end)
			arg_2_0:Reset()
		end,
		Start = function(arg_9_0)
			arg_9_0.canClick = true
		end,
		Reset = function(arg_10_0)
			setActive(arg_10_0.powerTF, false)
			setLocalPosition(arg_10_0._tf, var_0_11)
			arg_10_0.animator:SetInteger("Charge", 0)
			arg_10_0.animator:SetInteger("Throw", 0)
			arg_10_0.animator:SetInteger("Result", 0)
			arg_10_0.animator:Play("WaitA")

			arg_10_0.power = 0
			arg_10_0.phase = 0
			arg_10_0.charging = false
			arg_10_0.canClick = false
			arg_10_0.powerSlider.value = 0
		end,
		InitPowerSlider = function(arg_11_0)
			local var_11_0 = 24
			local var_11_1 = 162
			local var_11_2 = var_0_9[1] / var_0_9[3] * var_11_1

			findTF(arg_11_0.powerTF, "progress/green").sizeDelta = Vector2(var_11_2, var_11_0)

			local var_11_3 = (var_0_9[2] - var_0_9[1]) / var_0_9[3] * var_11_1

			findTF(arg_11_0.powerTF, "progress/green/yellow").sizeDelta = Vector2(var_11_3, var_11_0)

			local var_11_4 = (var_0_9[3] - var_0_9[2]) / var_0_9[3] * var_11_1

			findTF(arg_11_0.powerTF, "progress/green/yellow/red").sizeDelta = Vector2(var_11_4, var_11_0)
		end,
		Charge = function(arg_12_0)
			setActive(arg_12_0.powerTF, true)
			setActive(findTF(arg_12_0.powerTF, "binghu_huoyan"), false)

			arg_12_0.phase = var_0_6

			arg_12_0.animator:SetInteger("Charge", arg_12_0.phase)
			LeanTween.value(go(arg_12_0._tf), arg_12_0.power, var_0_9[3], var_0_10):setOnUpdate(System.Action_float(function(arg_13_0)
				arg_12_0.power = arg_13_0
				arg_12_0.powerSlider.value = arg_12_0.power / var_0_9[3]

				if arg_12_0.phase == var_0_6 and arg_12_0.power >= var_0_9[1] then
					arg_12_0.phase = var_0_7

					arg_12_0.animator:SetInteger("Charge", arg_12_0.phase)
				elseif arg_12_0.phase == var_0_7 and arg_12_0.power >= var_0_9[2] then
					arg_12_0.phase = var_0_8

					arg_12_0.animator:SetInteger("Charge", arg_12_0.phase)
					setActive(findTF(arg_12_0.powerTF, "binghu_huoyan"), true)
				end

				if not arg_12_0.charging then
					LeanTween.cancel(go(arg_12_0._tf))
				end
			end))
		end,
		Push = function(arg_14_0)
			arg_14_0._event:emit(var_0_40, {
				power = arg_14_0.power
			})
			setActive(arg_14_0.powerTF, false)
		end
	}

	var_1_0:Ctor()

	return var_1_0
end

local function var_0_49(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {
		Ctor = function(arg_16_0)
			arg_16_0.tpls = arg_15_0
			arg_16_0._event = arg_15_2
			arg_16_0.player = arg_15_1
			arg_16_0.scene = arg_16_0.player.parent

			arg_16_0._event:bind(var_0_40, function(arg_17_0, arg_17_1, arg_17_2)
				if arg_16_0.isPush then
					return
				end

				arg_16_0:Push(arg_17_1.power)
			end)
			arg_16_0._event:bind(var_0_44, function(arg_18_0, arg_18_1, arg_18_2)
				arg_16_0:Reset()
				arg_16_0:Start()
			end)
			arg_16_0._event:bind(var_0_45, function(arg_19_0, arg_19_1, arg_19_2)
				arg_16_0:Pause()
			end)
			arg_16_0._event:bind(var_0_46, function(arg_20_0, arg_20_1, arg_20_2)
				arg_16_0:Resume()
			end)
			arg_16_0:Reset()
		end,
		Start = function(arg_21_0)
			return
		end,
		RandomRole = function(arg_22_0)
			if arg_22_0._tf then
				arg_22_0._tf:SetParent(arg_22_0.tpls, false)
				setActive(arg_22_0._tf, false)
			end

			local var_22_0 = math.random(1, 4)

			arg_22_0._tf = arg_22_0.tpls:GetChild(var_22_0 - 1)

			setActive(arg_22_0._tf, true)

			arg_22_0.speedTF = findTF(arg_22_0._tf, "speed")

			setActive(arg_22_0.speedTF, var_0_16)

			arg_22_0.animator = GetComponent(arg_22_0._tf, typeof(Animator))
			arg_22_0.rigbody = GetComponent(arg_22_0._tf, "Rigidbody2D")
			arg_22_0.rigbody.velocity = Vector2.zero
			arg_22_0.phyItem = GetComponent(arg_22_0._tf, "Physics2DItem")

			arg_22_0.phyItem.CollisionEnter:RemoveAllListeners()
			arg_22_0.phyItem.CollisionEnter:AddListener(function(arg_23_0)
				arg_22_0:OnCollision(arg_23_0)
			end)
		end,
		Reset = function(arg_24_0)
			arg_24_0:RandomRole()

			arg_24_0.rigbody.velocity = Vector2.zero

			arg_24_0._tf:SetParent(findTF(arg_24_0.player, "chargePos"), false)
			setText(arg_24_0.speedTF, 0)
			setLocalPosition(arg_24_0._tf, Vector2.zero)
			setLocalScale(arg_24_0._tf, Vector2.one)
			arg_24_0.animator:Play("Neutral")
			arg_24_0.animator:SetBool("Stop", false)
			arg_24_0.animator:SetInteger("Result", 0)
			arg_24_0.animator:SetInteger("SpeedPhase", 0)

			arg_24_0.isPush = false
			arg_24_0.isStop = true
			arg_24_0.phase = 0
		end,
		Step = function(arg_25_0)
			if var_0_16 then
				setText(arg_25_0.speedTF, arg_25_0.rigbody.velocity:Magnitude())
			end

			if not arg_25_0.isPush or arg_25_0.isStop then
				return
			end

			local var_25_0 = arg_25_0:GetSpeed()

			arg_25_0._event:emit(var_0_41, {
				speed = var_25_0
			})

			if var_25_0 > var_0_14[1] then
				arg_25_0.animator:SetInteger("SpeedPhase", 1)
			elseif var_25_0 > var_0_14[2] then
				arg_25_0.animator:SetInteger("SpeedPhase", 2)
			elseif var_25_0 > var_0_14[3] then
				arg_25_0.animator:SetInteger("SpeedPhase", 3)
			end

			if var_25_0 < var_0_15 then
				arg_25_0.animator:SetBool("Stop", true)

				arg_25_0.isStop = true

				arg_25_0:Result()
			end
		end,
		Push = function(arg_26_0, arg_26_1)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_2)

			arg_26_0.isPush = true
			arg_26_0.isStop = false

			arg_26_0._tf:SetParent(arg_26_0.scene, true)

			local var_26_0 = Vector2(var_0_13.x - arg_26_0._tf.anchoredPosition.x, var_0_13.y - arg_26_0._tf.anchoredPosition.y)

			arg_26_0.rigbody.velocity = var_26_0:Normalize():Mul(arg_26_1)

			arg_26_0:Slip()
		end,
		Slip = function(arg_27_0)
			arg_27_0.animator:SetBool("Stop", false)

			arg_27_0.isStop = false
		end,
		OnCollision = function(arg_28_0, arg_28_1)
			arg_28_0.animator:SetTrigger("Hit")
			arg_28_0._event:emit(var_0_42)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_3)

			local var_28_0 = arg_28_1.collider.gameObject.name
			local var_28_1 = 0
			local var_28_2 = Vector2(1, 0)
			local var_28_3 = Vector2(arg_28_0.rigbody.velocity.x, arg_28_0.rigbody.velocity.y)

			if var_28_0 == "wall" then
				var_28_3:Mul(var_0_17.wall)

				var_28_1 = var_0_35.wall

				var_28_2:Mul(var_0_18.wall)
			elseif var_28_0 == "oil" then
				var_28_3:Mul(var_0_17.oil)

				var_28_1 = var_0_35.oil

				var_28_2:Mul(var_0_18.oil)
			elseif var_28_0 == "cube" then
				var_28_3:Mul(var_0_17.cube)

				var_28_1 = var_0_35.cube

				var_28_2:Mul(var_0_18.cube)
			elseif var_28_0 == "miner" then
				var_28_3:Mul(var_0_17.miner)

				var_28_1 = var_0_35.miner

				var_28_2:Mul(var_0_18.miner)
			elseif var_28_0 == "walker" then
				var_28_3:Mul(var_0_17.walker)

				var_28_1 = var_0_35.walker

				var_28_2:Mul(var_0_18.walker)
			end

			arg_28_0.rigbody.velocity = arg_28_0.rigbody.velocity:Sub(var_28_3)
			arg_28_0.rigbody.velocity = arg_28_0.rigbody.velocity:Add(var_28_2)

			local var_28_4 = arg_28_0._tf.anchoredPosition

			arg_28_0._event:emit(var_0_47, {
				score = var_28_1,
				pos = var_28_4
			})
		end,
		Result = function(arg_29_0)
			local var_29_0 = Vector2(arg_29_0._tf.anchoredPosition.x, arg_29_0._tf.anchoredPosition.y / var_0_28)
			local var_29_1 = Vector2.Distance(var_0_27, var_29_0)
			local var_29_2 = 0
			local var_29_3 = var_29_1 <= var_0_29[1] and 1 or var_29_1 <= var_0_29[2] and 2 or var_29_1 <= var_0_29[3] and 3 or 4

			arg_29_0.animator:SetInteger("Result", var_29_3)
			arg_29_0._event:emit(var_0_43, {
				result = var_29_3
			})

			if var_29_3 == 0 or var_29_3 == 4 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_5)
			else
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_4)
			end
		end,
		Pause = function(arg_30_0)
			arg_30_0.speedRecord = arg_30_0.rigbody.velocity
			arg_30_0.rigbody.velocity = Vector2.zero
			arg_30_0.animator.speed = 0
		end,
		Resume = function(arg_31_0)
			arg_31_0.rigbody.velocity = arg_31_0.speedRecord
			arg_31_0.animator.speed = 1
		end,
		GetSpeed = function(arg_32_0)
			return arg_32_0.rigbody.velocity:Magnitude()
		end
	}

	var_15_0:Ctor()

	return var_15_0
end

local function var_0_50(arg_33_0, arg_33_1)
	local var_33_0 = {
		Ctor = function(arg_34_0)
			arg_34_0._tf = arg_33_0
			arg_34_0._event = arg_33_1
			arg_34_0.animator = GetComponent(arg_34_0._tf, typeof(Animator))

			arg_34_0._event:bind(var_0_40, function(arg_35_0, arg_35_1, arg_35_2)
				arg_34_0:TurnLeft()
			end)
			arg_34_0._event:bind(var_0_42, function(arg_36_0, arg_36_1, arg_36_2)
				arg_34_0:Hit()
			end)
			arg_34_0._event:bind(var_0_43, function(arg_37_0, arg_37_1, arg_37_2)
				arg_34_0:Result(arg_37_1.result)
			end)
			arg_34_0._event:bind(var_0_44, function(arg_38_0, arg_38_1, arg_38_2)
				arg_34_0:Reset()
				arg_34_0:Start()
			end)
		end,
		Start = function(arg_39_0)
			return
		end,
		Reset = function(arg_40_0)
			arg_40_0.animator:SetInteger("Result", 0)
			arg_40_0.animator:Play("WaitA")
		end,
		TurnLeft = function(arg_41_0)
			arg_41_0.animator:SetTrigger("TurnLeft")
		end,
		Result = function(arg_42_0, arg_42_1)
			arg_42_0.animator:SetInteger("Result", arg_42_1)
		end,
		Hit = function(arg_43_0)
			arg_43_0.animator:SetTrigger("Hit")
		end
	}

	var_33_0:Ctor()

	return var_33_0
end

local function var_0_51(arg_44_0, arg_44_1)
	local var_44_0 = {
		Ctor = function(arg_45_0)
			arg_45_0._tf = arg_44_0
			arg_45_0._event = arg_44_1
			arg_45_0.animator = GetComponent(arg_45_0._tf, typeof(Animator))

			arg_45_0._event:bind(var_0_44, function(arg_46_0, arg_46_1, arg_46_2)
				arg_45_0:NextRound()
			end)
			arg_45_0:Reset()
		end,
		Start = function(arg_47_0)
			arg_47_0:NextRound()
		end,
		Reset = function(arg_48_0)
			arg_48_0.animator:SetInteger("Round", 0)
			arg_48_0.animator:Play("IdleA")

			arg_48_0.roundNum = 1
		end,
		NextRound = function(arg_49_0)
			arg_49_0.animator:SetInteger("Round", arg_49_0.roundNum)

			if arg_49_0.roundNum == 3 then
				arg_49_0.roundNum = 1
			else
				arg_49_0.roundNum = arg_49_0.roundNum + 1
			end
		end
	}

	var_44_0:Ctor()

	return var_44_0
end

local function var_0_52(arg_50_0, arg_50_1)
	local var_50_0 = {
		Ctor = function(arg_51_0)
			arg_51_0._tf = arg_50_0
			arg_51_0._event = arg_50_1
			arg_51_0.config = var_0_37.miner
			arg_51_0.animator = GetComponent(arg_51_0._tf, typeof(Animator))
			arg_51_0.phyItem = GetComponent(arg_51_0._tf, "Physics2DItem")

			arg_51_0.phyItem.CollisionEnter:AddListener(function(arg_52_0)
				arg_51_0:OnCollision()
			end)

			arg_51_0.phyGrazeItem = GetComponent(findTF(arg_51_0._tf, "GrazeCollider"), "Physics2DItem")

			arg_51_0.phyGrazeItem.TriggerEnter:AddListener(function(arg_53_0)
				arg_51_0:OnGrazeTrigger(arg_53_0)
			end)
			arg_51_0._event:bind(var_0_41, function(arg_54_0, arg_54_1, arg_54_2)
				arg_51_0.hitSpeed = arg_54_1.speed
			end)
			arg_51_0:Reset()
		end,
		Start = function(arg_55_0)
			return
		end,
		Reset = function(arg_56_0)
			arg_56_0.isClash = false
			arg_56_0.hitSpeed = 0
		end,
		OnCollision = function(arg_57_0)
			arg_57_0.isClash = true

			local var_57_0 = 0

			if arg_57_0.hitSpeed > var_0_19[3] then
				var_57_0 = 3
			elseif arg_57_0.hitSpeed > var_0_19[2] then
				var_57_0 = 2
			elseif arg_57_0.hitSpeed > var_0_19[1] then
				var_57_0 = 1
			end

			arg_57_0.animator:SetInteger("Speed", var_57_0)
			arg_57_0.animator:SetTrigger("Clash")
		end,
		OnGrazeTrigger = function(arg_58_0, arg_58_1)
			if arg_58_1.gameObject.name ~= "Ayanami" then
				return
			end

			onDelayTick(function()
				if arg_58_0.isClash then
					return
				end

				arg_58_0.animator:SetTrigger("Graze")
			end, 0.3)
		end
	}

	var_50_0:Ctor()

	return var_50_0
end

local function var_0_53(arg_60_0, arg_60_1)
	local var_60_0 = {}
	local var_60_1 = 1000

	function var_60_0.Ctor(arg_61_0)
		arg_61_0._tf = arg_60_0
		arg_61_0._event = arg_60_1
		arg_61_0.config = var_0_37.walker
		arg_61_0.obstacleTF = arg_61_0._tf.parent
		arg_61_0.bgFrontTF = findTF(arg_61_0.obstacleTF.parent.parent, "bg_front")
		arg_61_0.animator = GetComponent(arg_61_0._tf, typeof(Animator))
		arg_61_0.rigbody = GetComponent(arg_61_0._tf, "Rigidbody2D")
		arg_61_0.phyItem = GetComponent(arg_61_0._tf, "Physics2DItem")

		arg_61_0.phyItem.CollisionEnter:AddListener(function(arg_62_0)
			arg_61_0:OnCollision(arg_62_0)
		end)
		arg_61_0._event:bind(var_0_41, function(arg_63_0, arg_63_1, arg_63_2)
			arg_61_0.hitSpeed = arg_63_1.speed
		end)
		arg_61_0._event:bind(var_0_45, function(arg_64_0, arg_64_1, arg_64_2)
			arg_61_0:Pause()
		end)
		arg_61_0._event:bind(var_0_46, function(arg_65_0, arg_65_1, arg_65_2)
			arg_61_0:Resume()
		end)
	end

	function var_60_0.SetPath(arg_66_0, arg_66_1)
		arg_66_0.pathType = arg_66_1
	end

	function var_60_0.Start(arg_67_0)
		arg_67_0:WalkPath()
	end

	function var_60_0.Reset(arg_68_0)
		setActive(arg_68_0._tf, false)
		setLocalPosition(arg_68_0._tf, Vector2(-1400, 0))

		arg_68_0.rigbody.velocity = Vector2.zero
		arg_68_0.isJumpDown = false
		arg_68_0.isJumpUp = false
		arg_68_0.isForwardNorth = false
		arg_68_0.isForwardSouth = false
		arg_68_0.hitSpeed = 0
		arg_68_0.pathType = 0
	end

	function var_60_0.OnCollision(arg_69_0, arg_69_1)
		arg_69_0.animator:SetTrigger("Clash")

		local var_69_0 = 0

		if arg_69_0.hitSpeed > var_0_20[3] then
			var_69_0 = 3
		elseif arg_69_0.hitSpeed > var_0_20[2] then
			var_69_0 = 2
		elseif arg_69_0.hitSpeed > var_0_20[1] then
			var_69_0 = 1
		end

		arg_69_0.animator:SetInteger("Speed", var_69_0)

		arg_69_0.rigbody.velocity = Vector2.zero
	end

	function var_60_0.WalkPath(arg_70_0)
		if arg_70_0.pathType == var_0_25 or arg_70_0.pathType == var_0_26 then
			setLocalPosition(arg_70_0._tf, var_0_21)
			arg_70_0._tf:SetParent(arg_70_0.bgFrontTF, false)

			arg_70_0.isForwardNorth = true

			arg_70_0.animator:SetBool("IsNorth", true)
			arg_70_0:WalkNorth()
		elseif arg_70_0.pathType == var_0_23 or arg_70_0.pathType == var_0_24 then
			setLocalPosition(arg_70_0._tf, var_0_22)
			arg_70_0._tf:SetParent(arg_70_0.obstacleTF, false)

			arg_70_0.isForwardSouth = true

			arg_70_0.animator:SetBool("IsSouth", true)
			arg_70_0:WalkSouth()
		end
	end

	function var_60_0.WalkNorth(arg_71_0)
		arg_71_0.animator:SetTrigger("WalkN")

		arg_71_0.rigbody.velocity = Vector2(0, 1.5)
	end

	function var_60_0.JumpNorth(arg_72_0)
		arg_72_0.animator:SetTrigger("JumpN")

		if arg_72_0.isJumpUp then
			arg_72_0:WalkNorth()
		elseif arg_72_0.pathType == var_0_26 then
			arg_72_0:WalkNorthwest()
		else
			arg_72_0:WalkNorth()
		end
	end

	function var_60_0.WalkNorthwest(arg_73_0)
		arg_73_0.animator:SetTrigger("WalkNW")

		arg_73_0.rigbody.velocity = Vector2(-1.5, 1.5)
	end

	function var_60_0.WalkSouth(arg_74_0)
		arg_74_0.animator:SetTrigger("WalkS")

		arg_74_0.rigbody.velocity = Vector2(0, -1.5)
	end

	function var_60_0.JumpSouth(arg_75_0)
		arg_75_0.animator:SetTrigger("JumpS")

		if arg_75_0.isJumpDown then
			arg_75_0:WalkSouth()
		elseif arg_75_0.pathType == var_0_24 then
			arg_75_0:WalkSouthwest()
		else
			arg_75_0:WalkSouth()
		end
	end

	function var_60_0.WalkSouthwest(arg_76_0)
		arg_76_0.animator:SetTrigger("WalkSW")

		arg_76_0.rigbody.velocity = Vector2(-1.5, -1.5)
	end

	function var_60_0.Step(arg_77_0)
		local var_77_0 = arg_77_0._tf.anchoredPosition.y

		if var_77_0 > var_60_1 or var_77_0 < -var_60_1 then
			arg_77_0.rigbody.velocity = Vector2.zero

			return
		end

		if arg_77_0.isForwardNorth then
			if not arg_77_0.isJumpDown and var_77_0 >= -470 then
				arg_77_0.isJumpDown = true

				arg_77_0:JumpNorth()
				onDelayTick(function()
					arg_77_0._tf:SetParent(arg_77_0.obstacleTF, false)
				end, 0.3)
			end

			if not arg_77_0.isJumpUp and var_77_0 >= 310 then
				arg_77_0.isJumpUp = true

				arg_77_0:JumpNorth()
			end
		end

		if arg_77_0.isForwardSouth then
			if not arg_77_0.isJumpUp and var_77_0 <= 370 then
				arg_77_0.isJumpUp = true

				arg_77_0:JumpSouth()
			end

			if not arg_77_0.isJumpDown and var_77_0 <= -420 then
				arg_77_0.isJumpDown = true

				arg_77_0:JumpSouth()
				onDelayTick(function()
					arg_77_0._tf:SetParent(arg_77_0.bgFrontTF, false)
				end, 0.3)
			end
		end
	end

	function var_60_0.Pause(arg_80_0)
		arg_80_0.speedRecord = arg_80_0.rigbody.velocity
		arg_80_0.rigbody.velocity = Vector2.zero
		arg_80_0.animator.speed = 0
	end

	function var_60_0.Resume(arg_81_0)
		arg_81_0.rigbody.velocity = arg_81_0.speedRecord
		arg_81_0.animator.speed = 1
	end

	var_60_0:Ctor()

	return var_60_0
end

function var_0_0.getUIName(arg_82_0)
	return "GameRoomCurlingUI"
end

function var_0_0.didEnter(arg_83_0)
	arg_83_0:initEvent()
	arg_83_0:initData()
	arg_83_0:initUI()
	arg_83_0:initGameUI()
	arg_83_0:initController()
	arg_83_0:updateMainUI()
	arg_83_0:openMainUI()
	arg_83_0:AutoFitScreen()
end

function var_0_0.AutoFitScreen(arg_84_0)
	local var_84_0 = Screen.width / Screen.height
	local var_84_1 = 1.7777777777777777
	local var_84_2 = arg_84_0._tf:Find("bg_back")
	local var_84_3 = 2331
	local var_84_4 = var_84_2.rect.height
	local var_84_5

	if var_84_1 <= var_84_0 then
		local var_84_6 = 1080 * var_84_0

		var_84_5 = math.clamp(var_84_6 / var_84_3, 1, 2)
	else
		local var_84_7 = 1920 / var_84_0

		var_84_5 = math.clamp(var_84_7 / var_84_4, 1, 2)
	end

	setLocalScale(arg_84_0._tf, {
		x = var_84_5,
		y = var_84_5,
		z = var_84_5
	})
end

function var_0_0.initEvent(arg_85_0)
	arg_85_0:bind(var_0_43, function(arg_86_0, arg_86_1, arg_86_2)
		if arg_86_1.result ~= var_0_34 then
			arg_85_0:addScore(var_0_30[arg_86_1.result])
		end

		arg_85_0:obsFadeOut()
		onDelayTick(function()
			arg_85_0:nextRoundGame()
		end, var_0_36)
	end)
	arg_85_0:bind(var_0_47, function(arg_88_0, arg_88_1, arg_88_2)
		if arg_88_1.score and arg_88_1.score ~= 0 then
			arg_85_0:addScore(arg_88_1.score, arg_88_1.pos)
		end
	end)
end

function var_0_0.initData(arg_89_0)
	local var_89_0 = Application.targetFrameRate or 60

	if var_89_0 > 60 then
		var_89_0 = 60
	end

	arg_89_0.needManualSimulate = true
	arg_89_0.timer = Timer.New(function()
		arg_89_0:onTimer()

		if arg_89_0.needManualSimulate then
			Physics2D.Simulate(1 / var_89_0)
		end
	end, 1 / var_89_0, -1)
end

function var_0_0.initUI(arg_91_0)
	arg_91_0.clickMask = arg_91_0._tf:Find("ui/click_mask")
	arg_91_0.mainUI = arg_91_0._tf:Find("ui/main_ui")
	arg_91_0.listScrollRect = GetComponent(findTF(arg_91_0.mainUI, "item_list"), typeof(ScrollRect))

	onButton(arg_91_0, arg_91_0.mainUI:Find("skin_btn"), function()
		local var_92_0 = pg.mini_game[arg_91_0:GetMGData().id].simple_config_data.skin_shop_id

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP, {
			skinId = var_92_0
		})
	end, SFX_PANEL)
	onButton(arg_91_0, arg_91_0.mainUI:Find("return_btn"), function()
		arg_91_0:emit(var_0_0.ON_BACK_PRESSED)
	end, SFX_PANEL)
	onButton(arg_91_0, arg_91_0.mainUI:Find("main_btn"), function()
		arg_91_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_91_0, arg_91_0.mainUI:Find("help_btn"), function()
		local var_95_0 = arg_91_0:getGameRoomData().game_help

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = arg_91_0:getGameRoomData().game_help
		})
	end, SFX_PANEL)
	onButton(arg_91_0, arg_91_0.mainUI:Find("start_btn"), function()
		arg_91_0:readyStart()
	end, SFX_PANEL)
	onButton(arg_91_0, arg_91_0.mainUI:Find("rank_btn"), function()
		return
	end, SFX_PANEL)

	arg_91_0.totalTimes = arg_91_0:getGameTotalTime()

	local var_91_0 = arg_91_0:getGameUsedTimes() - 4 < 0 and 0 or arg_91_0:getGameUsedTimes() - 4

	scrollTo(arg_91_0.listScrollRect, 0, 1 - var_91_0 / (arg_91_0.totalTimes - 4))
	onButton(arg_91_0, arg_91_0.mainUI:Find("right_panel/arrows_up"), function()
		local var_98_0 = arg_91_0.listScrollRect.normalizedPosition.y + 1 / (arg_91_0.totalTimes - 4)

		if var_98_0 > 1 then
			var_98_0 = 1
		end

		scrollTo(arg_91_0.listScrollRect, 0, var_98_0)
	end, SFX_PANEL)
	onButton(arg_91_0, arg_91_0.mainUI:Find("right_panel/arrows_down"), function()
		local var_99_0 = arg_91_0.listScrollRect.normalizedPosition.y - 1 / (arg_91_0.totalTimes - 4)

		if var_99_0 < 0 then
			var_99_0 = 0
		end

		scrollTo(arg_91_0.listScrollRect, 0, var_99_0)
	end, SFX_PANEL)

	arg_91_0.countUI = arg_91_0._tf:Find("ui/count_ui")
	arg_91_0.countAnimator = GetComponent(arg_91_0.countUI:Find("count"), typeof(Animator))
	arg_91_0.countDft = GetOrAddComponent(arg_91_0.countUI:Find("count"), typeof(DftAniEvent))

	arg_91_0.countDft:SetTriggerEvent(function()
		return
	end)
	arg_91_0.countDft:SetEndEvent(function()
		setActive(arg_91_0.countUI, false)
		arg_91_0:startGame()
	end)

	arg_91_0.pauseUI = arg_91_0._tf:Find("ui/pause_ui")

	onButton(arg_91_0, arg_91_0.pauseUI:Find("ad/panel/sure_btn"), function()
		setActive(arg_91_0.pauseUI, false)
		arg_91_0:resumeGame()
	end, SFX_PANEL)

	arg_91_0.returnUI = arg_91_0._tf:Find("ui/return_ui")

	onButton(arg_91_0, arg_91_0.returnUI:Find("ad/panel/sure_btn"), function()
		setActive(arg_91_0.returnUI, false)
		arg_91_0:resumeGame()
		arg_91_0:endGame()
	end, SFX_PANEL)
	onButton(arg_91_0, arg_91_0.returnUI:Find("ad/panel/cancel_btn"), function()
		setActive(arg_91_0.returnUI, false)
		arg_91_0:resumeGame()
	end, SFX_PANEL)

	arg_91_0.endUI = arg_91_0._tf:Find("ui/end_ui")

	onButton(arg_91_0, arg_91_0.endUI:Find("ad/panel/end_btn"), function()
		setActive(arg_91_0.endUI, false)
		arg_91_0:openMainUI()
	end, SFX_PANEL)

	if not arg_91_0.handle then
		arg_91_0.handle = UpdateBeat:CreateListener(arg_91_0.Update, arg_91_0)
	end

	UpdateBeat:AddListener(arg_91_0.handle)
end

function var_0_0.initGameUI(arg_106_0)
	arg_106_0.gameUI = arg_106_0._tf:Find("ui/game_ui")
	arg_106_0.roundTF = arg_106_0.gameUI:Find("score_panel/round_text")
	arg_106_0.scoreTF = arg_106_0.gameUI:Find("score_panel/score_text")

	onButton(arg_106_0, arg_106_0.gameUI:Find("pause_btn"), function()
		arg_106_0:pauseGame()
		setActive(arg_106_0.pauseUI, true)
	end)
	onButton(arg_106_0, arg_106_0.gameUI:Find("return_btn"), function()
		arg_106_0:pauseGame()
		setActive(arg_106_0.returnUI, true)
	end)

	arg_106_0.scoreGroup = arg_106_0.gameUI:Find("score_group")

	setActive(arg_106_0._tf:Find("bg_front/wall"), var_0_39)
end

function var_0_0.initController(arg_109_0)
	arg_109_0.scene = arg_109_0._tf:Find("scene")
	arg_109_0.gridTF = arg_109_0._tf:Find("ui/grid")
	arg_109_0.player = var_0_48(arg_109_0.scene:Find("player"), arg_109_0)
	arg_109_0.phy = arg_109_0.scene:Find("Ayanami_phy")
	arg_109_0.drawDot = arg_109_0.scene:Find("draw_dot")
	arg_109_0.curlingTpls = arg_109_0.scene:Find("curling_Tpl")
	arg_109_0.curling = var_0_49(arg_109_0.curlingTpls, arg_109_0.player._tf, arg_109_0)
	arg_109_0.ofunya = var_0_50(arg_109_0._tf:Find("bg_back/07_Ofunya"), arg_109_0)
	arg_109_0.manjuu = var_0_51(arg_109_0._tf:Find("bg_back/08_Manjuu"), arg_109_0)
	arg_109_0.walker = var_0_53(arg_109_0.scene:Find("obstacle/walker"), arg_109_0)
	arg_109_0.obsTF = arg_109_0._tf:Find("scene/obstacle")
	arg_109_0.obsCanvas = GetComponent(arg_109_0.obsTF, typeof(CanvasGroup))
	arg_109_0.obsTpl = arg_109_0._tf:Find("scene/obstacle_Tpl")
	arg_109_0.minerGroups = arg_109_0.obsTF:Find("miner_groups")
	arg_109_0.oilGroups = arg_109_0.obsTF:Find("oil_groups")
	arg_109_0.cubeGroups = arg_109_0.obsTF:Find("cube_groups")
end

function var_0_0.updateMainUI(arg_110_0)
	local var_110_0 = arg_110_0:getGameUsedTimes()
	local var_110_1 = arg_110_0:getGameTimes()

	arg_110_0.totalTimes = arg_110_0:getGameTotalTime()

	local var_110_2 = 1 - (arg_110_0:getGameUsedTimes() - 3 < 0 and 0 or arg_110_0:getGameUsedTimes() - 3) / (arg_110_0.totalTimes - 4)

	if var_110_2 > 1 then
		var_110_2 = 1
	end

	scrollTo(arg_110_0.listScrollRect, 0, var_110_2)
end

function var_0_0.openMainUI(arg_111_0)
	setActive(arg_111_0.gameUI, false)
	setActive(arg_111_0.mainUI, true)
	arg_111_0:openCoinLayer(true)
	arg_111_0:updateMainUI()
end

function var_0_0.readyStart(arg_112_0)
	setActive(arg_112_0.mainUI, false)
	setActive(arg_112_0.countUI, true)
	arg_112_0:openCoinLayer(false)
	arg_112_0.countAnimator:Play("count")
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_1)
	arg_112_0:resetGame()
end

function var_0_0.resetGame(arg_113_0)
	arg_113_0.gameStartFlag = false
	arg_113_0.gamePause = false
	arg_113_0.gameEndFlag = false
	arg_113_0.scoreNum = 0
	arg_113_0.roundNum = 1

	arg_113_0.player:Reset()
	arg_113_0.curling:Reset()
	arg_113_0.ofunya:Reset()
	arg_113_0.manjuu:Reset()
	arg_113_0.walker:Reset()
end

function var_0_0.startGame(arg_114_0)
	setActive(arg_114_0.gameUI, true)
	arg_114_0:CoordinateGrid(arg_114_0.gridTF)

	arg_114_0.gameStartFlag = true

	arg_114_0.player:Start()
	arg_114_0.curling:Start()
	arg_114_0.ofunya:Start()
	arg_114_0.manjuu:Start()
	arg_114_0:staticObsStart()
	arg_114_0:updateGameUI()
	arg_114_0:timerStart()
end

function var_0_0.staticObsStart(arg_115_0)
	setActive(arg_115_0.obsTF, true)

	arg_115_0.obsCanvas.alpha = 1

	arg_115_0.walker:Reset()

	local var_115_0 = math.random()
	local var_115_1 = var_0_37.walker

	if var_115_0 <= var_115_1.appear then
		setActive(arg_115_0.walker._tf, true)
		setLocalScale(arg_115_0.walker._tf, Vector2(var_0_38.walker, var_0_38.walker))

		local var_115_2 = var_115_1.path[math.random(1, #var_115_1.path)]

		arg_115_0.walker:SetPath(var_115_2)

		local var_115_3 = {}

		if var_115_2 == var_0_26 then
			var_115_3 = {
				8,
				11,
				12,
				14,
				15,
				18,
				17,
				21
			}
		elseif var_115_2 == var_0_24 then
			var_115_3 = {
				5,
				9,
				10,
				14,
				15,
				19,
				20,
				24
			}
		end

		local function var_115_4(arg_116_0)
			for iter_116_0, iter_116_1 in ipairs(var_115_3) do
				if arg_116_0 == iter_116_1 then
					return true
				end
			end

			return false
		end

		local var_115_5 = {}

		for iter_115_0, iter_115_1 in ipairs(arg_115_0.grids) do
			if not var_115_4(iter_115_0) then
				table.insert(var_115_5, iter_115_1)
			end
		end

		arg_115_0.grids = var_115_5

		arg_115_0.walker:Start()
	end

	removeAllChildren(arg_115_0.oilGroups)

	for iter_115_2, iter_115_3 in ipairs(var_0_37.oil) do
		if math.random() <= iter_115_3.appear then
			for iter_115_4 = 1, iter_115_3.num do
				local var_115_6 = cloneTplTo(arg_115_0.obsTpl:Find("oil_Tpl"), arg_115_0.oilGroups, "oil")

				setActive(var_115_6, true)

				local var_115_7 = math.random(1, #arg_115_0.grids)

				setLocalPosition(var_115_6, Vector2(arg_115_0.grids[var_115_7].x, arg_115_0.grids[var_115_7].y))
				setLocalScale(var_115_6, Vector2(var_0_38.oil, var_0_38.oil))
				table.remove(arg_115_0.grids, var_115_7)
			end
		end
	end

	removeAllChildren(arg_115_0.cubeGroups)

	for iter_115_5, iter_115_6 in ipairs(var_0_37.cube) do
		if math.random() <= iter_115_6.appear then
			for iter_115_7 = 1, iter_115_6.num do
				local var_115_8 = cloneTplTo(arg_115_0.obsTpl:Find("cube_Tpl"), arg_115_0.cubeGroups, "cube")

				setActive(var_115_8, true)

				local var_115_9 = math.random(1, #arg_115_0.grids)

				setLocalPosition(var_115_8, Vector2(arg_115_0.grids[var_115_9].x, arg_115_0.grids[var_115_9].y))
				setLocalScale(var_115_8, Vector2(var_0_38.cube, var_0_38.cube))
				table.remove(arg_115_0.grids, var_115_9)
			end
		end
	end

	removeAllChildren(arg_115_0.minerGroups)

	arg_115_0.minerControls = {}

	for iter_115_8, iter_115_9 in ipairs(var_0_37.miner) do
		if math.random() <= iter_115_9.appear then
			for iter_115_10 = 1, iter_115_9.num do
				local var_115_10 = cloneTplTo(arg_115_0.obsTpl:Find("miner_Tpl"), arg_115_0.minerGroups, "miner")

				setActive(var_115_10, true)

				local var_115_11 = var_0_52(var_115_10, arg_115_0)

				table.insert(arg_115_0.minerControls, var_115_11)

				local var_115_12 = math.random(1, #arg_115_0.grids)

				setLocalPosition(var_115_10, Vector2(arg_115_0.grids[var_115_12].x, arg_115_0.grids[var_115_12].y))
				setLocalScale(var_115_10, Vector2(var_0_38.miner, var_0_38.miner))
				table.remove(arg_115_0.grids, var_115_12)
			end
		end
	end
end

function var_0_0.obsFadeOut(arg_117_0)
	arg_117_0:managedTween(LeanTween.value, function()
		setActive(arg_117_0.obsTF, false)
	end, go(arg_117_0.obsTF), 1, 0, 0.5):setOnUpdate(System.Action_float(function(arg_119_0)
		arg_117_0.obsCanvas.alpha = arg_119_0
	end))
end

function var_0_0.Update(arg_120_0)
	arg_120_0:AddDebugInput()
end

function var_0_0.AddDebugInput(arg_121_0)
	if arg_121_0.gamePause or arg_121_0.gameEndFlag then
		return
	end

	if IsUnityEditor then
		-- block empty
	end
end

function var_0_0.changeSpeed(arg_122_0, arg_122_1)
	return
end

function var_0_0.onTimer(arg_123_0)
	arg_123_0.curling:Step()
	arg_123_0.walker:Step()
	arg_123_0:updateGameUI()
end

function var_0_0.timerStart(arg_124_0)
	if not arg_124_0.timer.running then
		arg_124_0.timer:Start()
	end
end

function var_0_0.timerStop(arg_125_0)
	if arg_125_0.timer.running then
		arg_125_0.timer:Stop()
	end
end

function var_0_0.updateGameUI(arg_126_0)
	setText(arg_126_0.scoreTF, arg_126_0.scoreNum)
	setText(arg_126_0.roundTF, "Round " .. arg_126_0.roundNum)
end

function var_0_0.addScore(arg_127_0, arg_127_1, arg_127_2)
	local var_127_0 = cloneTplTo(arg_127_0.gameUI:Find("score_tf"), arg_127_0.scoreGroup)

	if arg_127_2 then
		setLocalPosition(var_127_0, arg_127_2)
	else
		setLocalPosition(var_127_0, Vector2(432, 144))
	end

	setActive(var_127_0, false)
	setActive(var_127_0, true)
	setText(var_127_0, "+" .. arg_127_1)

	arg_127_0.scoreNum = arg_127_0.scoreNum + arg_127_1
end

function var_0_0.pauseGame(arg_128_0)
	arg_128_0.gamePause = true

	arg_128_0:timerStop()
	arg_128_0:changeSpeed(0)
	arg_128_0:pauseManagedTween()
	arg_128_0:emit(var_0_45)
end

function var_0_0.resumeGame(arg_129_0)
	arg_129_0.gamePause = false

	arg_129_0:changeSpeed(1)
	arg_129_0:timerStart()
	arg_129_0:resumeManagedTween()
	arg_129_0:emit(var_0_46)
end

function var_0_0.nextRoundGame(arg_130_0)
	removeAllChildren(arg_130_0.scoreGroup)

	if arg_130_0.roundNum == 3 then
		arg_130_0:endGame()
	else
		arg_130_0.roundNum = arg_130_0.roundNum + 1

		arg_130_0:CoordinateGrid(arg_130_0.gridTF)
		arg_130_0:staticObsStart()
		arg_130_0:emit(var_0_44)
	end
end

function var_0_0.endGame(arg_131_0)
	if arg_131_0.gameEndFlag then
		return
	end

	arg_131_0:timerStop()

	arg_131_0.gameEndFlag = true

	setActive(arg_131_0.clickMask, true)
	arg_131_0:managedTween(LeanTween.delayedCall, function()
		arg_131_0.gameEndFlag = false
		arg_131_0.gameStartFlag = false

		setActive(arg_131_0.clickMask, false)
		arg_131_0:showEndUI()
	end, 0.1, nil)
end

function var_0_0.showEndUI(arg_133_0)
	setActive(arg_133_0.endUI, true)

	local var_133_0 = arg_133_0.scoreNum
	local var_133_1 = getProxy(MiniGameProxy):GetHighScore(arg_133_0:GetMGData().id)
	local var_133_2 = var_133_1 and #var_133_1 > 0 and var_133_1[1] or 0

	if not var_133_1 or not (#var_133_1 > 1) or not var_133_1[2] then
		local var_133_3 = 0
	end

	setActive(arg_133_0.endUI:Find("ad/panel/cur_score/new"), var_133_2 < var_133_0)

	if var_133_2 <= var_133_0 then
		var_133_2 = var_133_0

		arg_133_0:StoreDataToServer({
			var_133_2
		})
	end

	local var_133_4 = arg_133_0.endUI:Find("ad/panel/highest_score")
	local var_133_5 = arg_133_0.endUI:Find("ad/panel/cur_score")

	setText(var_133_4, var_133_2)
	setText(var_133_5, var_133_0)
	arg_133_0:SendSuccess(var_133_0 or 0)
end

function var_0_0.CoordinateGrid(arg_134_0, arg_134_1)
	local var_134_0 = Vector2(150, 150)
	local var_134_1 = arg_134_1.rect.width
	local var_134_2 = arg_134_1.rect.height
	local var_134_3 = Vector2(arg_134_1.anchoredPosition.x - var_134_1 / 2, arg_134_1.anchoredPosition.y - var_134_2 / 2)
	local var_134_4 = math.modf(var_134_2 / var_134_0.y)
	local var_134_5 = var_134_2 % var_134_0.y / (var_134_4 + 1)
	local var_134_6 = math.modf(var_134_1 / var_134_0.x)
	local var_134_7 = var_134_1 % var_134_0.x / (var_134_6 + 1)

	arg_134_0.grids = {}

	for iter_134_0 = 1, var_134_6 do
		for iter_134_1 = 1, var_134_4 do
			local var_134_8 = var_134_3.x + iter_134_0 * (var_134_7 + var_134_0.x) - var_134_0.x / 2
			local var_134_9 = var_134_3.y + iter_134_1 * (var_134_5 + var_134_0.y) - var_134_0.y / 2

			table.insert(arg_134_0.grids, Vector2(var_134_8, var_134_9))
		end
	end
end

function var_0_0.getGameTimes(arg_135_0)
	return arg_135_0:GetMGHubData().count
end

function var_0_0.getGameUsedTimes(arg_136_0)
	return arg_136_0:GetMGHubData().usedtime
end

function var_0_0.getUltimate(arg_137_0)
	return arg_137_0:GetMGHubData().ultimate
end

function var_0_0.getGameTotalTime(arg_138_0)
	return (arg_138_0:GetMGHubData():getConfig("reward_need"))
end

function var_0_0.onBackPressed(arg_139_0)
	if not arg_139_0.gameStartFlag then
		arg_139_0:emit(var_0_0.ON_BACK_PRESSED)
	else
		if arg_139_0.gameEndFlag then
			return
		end

		if isActive(arg_139_0.pauseUI) then
			setActive(arg_139_0.pauseUI, false)
		end

		arg_139_0:pauseGame()
		setActive(arg_139_0.returnUI, true)
	end
end

function var_0_0.willExit(arg_140_0)
	if arg_140_0.handle then
		UpdateBeat:RemoveListener(arg_140_0.handle)
	end

	arg_140_0:cleanManagedTween()

	if arg_140_0.timer and arg_140_0.timer.running then
		arg_140_0.timer:Stop()
	end

	Time.timeScale = 1
	arg_140_0.timer = nil
end

return var_0_0
