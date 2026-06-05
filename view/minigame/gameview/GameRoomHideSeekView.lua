local var_0_0 = class("GameRoomHideSeekView", import("..BaseMiniGameView"))
local var_0_1 = "bar-soft"
local var_0_2 = "event:/ui/ddldaoshu2"
local var_0_3 = "event:/ui/break_out_full"
local var_0_4 = "hideseekgameui_atlas"
local var_0_5 = 60
local var_0_6 = {
	{
		25,
		0.8,
		1
	},
	{
		45,
		1.2,
		1.4
	},
	{
		60,
		1.6,
		1.8
	}
}
local var_0_7 = 100
local var_0_8 = 2
local var_0_9 = 50
local var_0_10 = 400
local var_0_11 = 400
local var_0_12 = "on_touch_furniture"
local var_0_13 = 1
local var_0_14 = 2
local var_0_15 = 3
local var_0_16 = 4
local var_0_17 = "HideSeekBath"
local var_0_18 = "HideSeekBed"
local var_0_19 = "HideSeekFridge"
local var_0_20 = "HideSeekHakoCL"
local var_0_21 = "HideSeekHakoCR"
local var_0_22 = "HideSeekUpR"
local var_0_23 = "HideSeekUpL"
local var_0_24 = "HideSeekDeskUnder"
local var_0_25 = "HideSeekSofaS"
local var_0_26 = "HideSeekSofaL"
local var_0_27 = "HideSeekHakoSL"
local var_0_28 = "HideSeekHakoSR"
local var_0_29 = "HideSeekHakoML"
local var_0_30 = "HideSeekHakoMR"
local var_0_31 = "HideSeekDeskSR"
local var_0_32 = "HideSeekDeskSL"
local var_0_33 = "HideSeekDeskStudyL"
local var_0_34 = "HideSeekDeskStudyR"
local var_0_35 = "HideSeekCushion"
local var_0_36 = "hideseekui"
local var_0_37 = 3
local var_0_38 = {
	0,
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8
}
local var_0_39 = {
	{
		name = "furniture_bath",
		pos_data_list = {
			{
				pos_name = "posBath",
				anim_name = var_0_17
			}
		},
		type = var_0_13
	},
	{
		weight = 0.2,
		name = "furniture_bed",
		pos_data_list = {
			{
				pos_name = "posBed",
				anim_name = var_0_18
			}
		},
		type = var_0_14
	},
	{
		name = "furniture_Fridge",
		time = 3,
		defaut_trigger = true,
		defaut_char_index = 9,
		weight = 0.15,
		pos_data_list = {
			{
				pos_name = "posFridge",
				anim_name = var_0_19
			}
		},
		type = var_0_15
	},
	{
		time = 4,
		name = "furniture_Hako_L1",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posHakoCL",
				anim_name = var_0_20
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Cook",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posUpR",
				anim_name = var_0_22
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Desk_Dining",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posUnder",
				anim_name = var_0_24
			},
			{
				pos_name = "posUpR",
				anim_name = var_0_22
			},
			{
				pos_name = "posUpL",
				anim_name = var_0_23
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Sofa_S",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posSofaS",
				anim_name = var_0_25
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Sofa_L",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posSofaL",
				anim_name = var_0_26
			},
			{
				pos_name = "posUpL",
				anim_name = var_0_23
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Hako_S1_3",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posHakoSL",
				anim_name = var_0_27
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Desk_S",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posDeskSL",
				anim_name = var_0_32
			},
			{
				pos_name = "posDeskSR",
				anim_name = var_0_31
			},
			{
				pos_name = "posDeskUnder",
				anim_name = var_0_24
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Hako_L2",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posHakoCL",
				anim_name = var_0_20
			},
			{
				pos_name = "posHakoCR",
				anim_name = var_0_21
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Desk_Study",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posDeskStudyL",
				anim_name = var_0_33
			},
			{
				pos_name = "posDeskStudyR",
				anim_name = var_0_34
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Hako_M1",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posHakoML",
				anim_name = var_0_29
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Hako_M2",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posHakoMR",
				anim_name = var_0_30
			}
		},
		type = var_0_13
	},
	{
		time = 4,
		name = "furniture_Hako_S2",
		hide = true,
		pos_data_list = {
			{
				pos_name = "posHakoSR",
				anim_name = var_0_28
			}
		},
		type = var_0_13
	},
	{
		name = "furniture_Manjuu_cushion",
		pos_data_list = {
			{
				pos_name = "posCushion",
				anim_name = var_0_35
			}
		},
		type = var_0_13,
		hide_tfs = {
			"img"
		}
	}
}
local var_0_40 = {
	HideSeekBath = {
		prefab = "hideseekbath",
		name = var_0_17,
		ignore_char = {}
	},
	HideSeekBed = {
		prefab = "hideseekbed",
		name = var_0_18,
		ignore_char = {}
	},
	HideSeekFridge = {
		prefab = "hideseekfridge",
		name = var_0_19,
		ignore_char = {}
	},
	HideSeekHakoCL = {
		prefab = "hideseekhakocl",
		name = var_0_20,
		ignore_char = {}
	},
	HideSeekHakoCR = {
		prefab = "hideseekhakocr",
		name = var_0_21,
		ignore_char = {}
	},
	HideSeekUpR = {
		prefab = "hideseekupr",
		name = var_0_22,
		ignore_char = {}
	},
	HideSeekUpL = {
		prefab = "hideseekupl",
		name = var_0_23,
		ignore_char = {}
	},
	HideSeekDeskUnder = {
		prefab = "hideseekdeskunder",
		name = var_0_24,
		ignore_char = {}
	},
	HideSeekSofaS = {
		prefab = "hideseeksofas",
		name = var_0_25,
		ignore_char = {}
	},
	HideSeekSofaL = {
		prefab = "hideseeksofal",
		name = var_0_26,
		ignore_char = {}
	},
	HideSeekHakoSL = {
		prefab = "hideseekhakosl",
		name = var_0_27,
		ignore_char = {}
	},
	HideSeekHakoSR = {
		prefab = "hideseekhakosr",
		name = var_0_28,
		ignore_char = {}
	},
	HideSeekDeskSL = {
		prefab = "hideseekdesksl",
		name = var_0_32,
		ignore_char = {}
	},
	HideSeekDeskSR = {
		prefab = "hideseekdesksr",
		name = var_0_31,
		ignore_char = {}
	},
	HideSeekDeskStudyL = {
		prefab = "hideseekdeskstudyl",
		name = var_0_33,
		ignore_char = {}
	},
	HideSeekDeskStudyR = {
		prefab = "hideseekdeskstudyr",
		name = var_0_34,
		ignore_char = {}
	},
	HideSeekHakoML = {
		prefab = "hideseekhakoml",
		name = var_0_29,
		ignore_char = {}
	},
	HideSeekHakoMR = {
		prefab = "hideseekhakomr",
		name = var_0_30,
		ignore_char = {}
	},
	HideSeekCushion = {
		prefab = "hideseekcushion",
		name = var_0_35,
		ignore_char = {}
	}
}
local var_0_41 = 0.1
local var_0_42 = {
	-475,
	652
}
local var_0_43 = {
	-335,
	290
}
local var_0_44 = Vector2(150, -200)
local var_0_45 = "hideseektv"
local var_0_46 = {}

local function var_0_47(arg_1_0, arg_1_1)
	local var_1_0 = {
		ctor = function(arg_2_0)
			arg_2_0._event = arg_1_1
			arg_2_0._sceneTf = arg_1_0
			arg_2_0._tplContainer = findTF(arg_1_0, "tplPos")
			var_0_46 = Clone(var_0_38)
			arg_2_0._furnituresPools = {}

			for iter_2_0 = 1, #var_0_39 do
				local var_2_0 = Clone(var_0_39[iter_2_0])
				local var_2_1 = findTF(arg_2_0._sceneTf, var_0_39[iter_2_0].name)

				table.insert(arg_2_0._furnituresPools, {
					activeIndex = 0,
					data = var_2_0,
					tf = var_2_1
				})
			end

			arg_2_0._unActiveFurnitures = {}
			arg_2_0._activeFurnitures = {}
			arg_2_0._furnitureAnimTfPool = {}
			arg_2_0._animTplDic = {}
		end,
		start = function(arg_3_0)
			arg_3_0.timeStep = 0

			arg_3_0:clear()

			arg_3_0.timeAppear = 0
			arg_3_0.additiveScore = var_0_7

			for iter_3_0 = #arg_3_0._furnituresPools, 1, -1 do
				local var_3_0 = arg_3_0._furnituresPools[iter_3_0]

				if var_3_0.data.type == var_0_14 then
					if math.random() <= var_3_0.data.weight then
						arg_3_0:appearChar(var_3_0.data.name)
					end

					var_3_0.initFlag = true

					table.insert(arg_3_0._unActiveFurnitures, arg_3_0:getFunitureFromPool(var_3_0.data.name))
				elseif var_3_0.data.type == var_0_15 then
					arg_3_0:appearChar(var_3_0.data.name)
				end
			end
		end,
		step = function(arg_4_0)
			arg_4_0.timeStep = arg_4_0.timeStep + Time.deltaTime

			local var_4_0 = false

			if arg_4_0.timeAppear <= 0 then
				var_4_0 = true

				local var_4_1 = var_0_5 - arg_4_0.timeStep

				arg_4_0.timeAppear = nil

				for iter_4_0 = 1, #var_0_6 do
					if not arg_4_0.timeAppear and var_4_1 < var_0_6[iter_4_0][1] or iter_4_0 == #var_0_6 then
						local var_4_2 = var_0_6[iter_4_0][2]
						local var_4_3 = var_0_6[iter_4_0][3]

						arg_4_0.timeAppear = math.random() * (var_4_3 - var_4_2) + var_4_2

						break
					end
				end

				arg_4_0.timeAppear = not arg_4_0.timeAppear and 2 or arg_4_0.timeAppear
			else
				arg_4_0.timeAppear = arg_4_0.timeAppear - Time.deltaTime
			end

			for iter_4_1 = #arg_4_0._activeFurnitures, 1, -1 do
				local var_4_4 = arg_4_0._activeFurnitures[iter_4_1]

				if var_4_4.time then
					var_4_4.time = var_4_4.time - Time.deltaTime

					if var_4_4.time <= 0 then
						arg_4_0:setFurnitureTimeEvent(var_4_4)
					end
				end
			end

			if var_4_0 then
				arg_4_0:appearChar()
			end
		end,
		setFurnitureTimeEvent = function(arg_5_0, arg_5_1)
			if arg_5_1.data.type == var_0_15 then
				arg_5_0:returnCharIndex(arg_5_1.charIndex)

				if math.random() <= arg_5_1.data.weight and #var_0_46 > 0 then
					arg_5_1.charIndex = table.remove(var_0_46, math.random(1, #var_0_46))
				else
					arg_5_1.charIndex = arg_5_1.data.defaut_char_index
				end

				arg_5_1.readyToRemove = false
				arg_5_1.time = arg_5_1.data.time

				GetComponent(findTF(arg_5_1.animTf, "anim"), typeof(Animator)):SetInteger("charIndex", arg_5_1.charIndex)
			elseif arg_5_1.data.type == var_0_13 then
				if arg_5_1.data.hide and not arg_5_1.readyToRemove then
					arg_5_1.time = 2
					arg_5_1.readyToRemove = true

					local var_5_0 = findTF(arg_5_1.animTf, "anim")

					GetComponent(var_5_0, typeof(Animator)):SetTrigger("hide")
				else
					arg_5_0:returnFurniture(arg_5_1)
				end
			elseif arg_5_1.data.type == var_0_14 then
				if arg_5_1.charIndex then
					arg_5_0:returnCharIndex(arg_5_1.charIndex)

					if arg_5_1.animTf then
						setActive(findTF(arg_5_1.animTf, "collider"), false)
					end

					arg_5_1.charIndex = nil
					arg_5_1.time = nil
				end
			else
				arg_5_0:returnFurniture(arg_5_1)
			end
		end,
		returnCharIndex = function(arg_6_0, arg_6_1)
			if not table.contains(var_0_46, arg_6_1) and table.contains(var_0_38, arg_6_1) then
				table.insert(var_0_46, arg_6_1)
			end
		end,
		appearChar = function(arg_7_0, arg_7_1)
			if #var_0_46 <= 0 then
				return
			end

			if #arg_7_0._furnituresPools <= 0 then
				return
			end

			local var_7_0

			if arg_7_1 then
				var_7_0 = arg_7_0:getFunitureFromPool(arg_7_1)
			end

			var_7_0 = var_7_0 or table.remove(arg_7_0._furnituresPools, math.random(1, #arg_7_0._furnituresPools))

			local var_7_1 = var_7_0.data
			local var_7_2 = var_7_1.pos_data_list[math.random(1, #var_7_1.pos_data_list)]
			local var_7_3 = var_7_2.pos_name
			local var_7_4 = var_7_2.anim_name
			local var_7_5 = arg_7_0:getActiveIndex()
			local var_7_6 = var_0_40[var_7_4]

			if not var_7_6 then
				print("警告，没有找到" .. var_7_4 .. "的动画数据")
				arg_7_0:returnFurniture(var_7_0)

				return
			end

			local var_7_7

			if var_7_0.data.type == var_0_15 then
				var_7_7 = var_7_0.data.defaut_char_index
			else
				var_7_7 = table.remove(var_0_46, math.random(1, #var_0_46))
			end

			var_7_0.charIndex = var_7_7

			if table.contains(var_7_6.ignore_char, var_7_7) then
				arg_7_0:returnFurniture(var_7_0)

				return
			elseif var_7_0.data.type == var_0_14 and var_7_0.initFlag then
				arg_7_0:returnFurniture(var_7_0)

				return
			end

			var_7_0.posData = var_7_2
			var_7_0.activeIndex = var_7_5
			var_7_0.animData = var_7_6

			table.insert(arg_7_0._activeFurnitures, var_7_0)
			arg_7_0:getAnimTfByPosData(var_7_2, var_7_5, function(arg_8_0, arg_8_1)
				if arg_8_1 ~= var_7_0.activeIndex then
					arg_7_0:returnAnimTf(var_7_4, arg_8_0)

					return
				end

				if var_7_0.data.hide_tfs then
					for iter_8_0 = 1, #var_7_0.data.hide_tfs do
						setActive(findTF(var_7_0.tf, var_7_0.data.hide_tfs[iter_8_0]), false)
					end
				end

				local var_8_0 = findTF(var_7_0.tf, var_7_3)

				SetParent(arg_8_0, var_8_0)
				setActive(arg_8_0, true)
				setActive(findTF(arg_8_0, "collider"), true)

				arg_8_0.anchoredPosition = Vector2(0, 0)
				var_7_0.animTf = arg_8_0

				arg_7_0:prepareAnim(var_7_0)
			end)
		end,
		getFunitureFromPool = function(arg_9_0, arg_9_1)
			for iter_9_0 = 1, #arg_9_0._furnituresPools do
				if arg_9_0._furnituresPools[iter_9_0].data.name == arg_9_1 then
					return table.remove(arg_9_0._furnituresPools, iter_9_0)
				end
			end

			return nil
		end,
		prepareAnim = function(arg_10_0, arg_10_1)
			if not arg_10_1.animData or not arg_10_1.animTf then
				return
			end

			local var_10_0 = arg_10_1.animData
			local var_10_1 = arg_10_1.animTf

			arg_10_1.time = arg_10_1.data.time

			local var_10_2 = GetComponent(findTF(var_10_1, "anim"), typeof(Animator))

			var_10_2:SetInteger("charIndex", arg_10_1.charIndex)

			if arg_10_1.data.type ~= var_0_15 then
				var_10_2:SetTrigger("trigger")
			end

			GetOrAddComponent(findTF(var_10_1, "collider"), typeof(EventTriggerListener)):AddPointDownFunc(function(arg_11_0, arg_11_1, arg_11_2)
				if arg_10_1.readyToRemove then
					return
				end

				if arg_10_1.data.type == var_0_15 and arg_10_1.data.defaut_char_index == arg_10_1.charIndex and not arg_10_1.data.defaut_trigger then
					return
				end

				local var_11_0 = false

				if arg_10_1.data.type == var_0_15 and arg_10_1.data.defaut_char_index == arg_10_1.charIndex then
					var_11_0 = true
				end

				if not var_11_0 then
					local var_11_1 = arg_10_0:getScore()

					pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_3)
					arg_10_0._event:emit(var_0_12, {
						score = var_11_1,
						pos = arg_11_1.position
					})
				end

				arg_10_1.readyToRemove = true

				var_10_2:SetTrigger("next")

				arg_10_1.time = arg_10_1.data.time or 3
			end)
		end,
		getScore = function(arg_12_0)
			if not arg_12_0.additiveScore then
				arg_12_0.additiveScore = var_0_7
			end

			if arg_12_0.scoreTime and arg_12_0.timeStep - arg_12_0.scoreTime < var_0_8 then
				arg_12_0.additiveScore = arg_12_0.additiveScore + var_0_9
			else
				arg_12_0.additiveScore = var_0_7
			end

			if arg_12_0.additiveScore >= var_0_10 then
				arg_12_0.additiveScore = var_0_10
			end

			arg_12_0.scoreTime = arg_12_0.timeStep

			return arg_12_0.additiveScore
		end,
		getAnimTfByPosData = function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
			local var_13_0 = arg_13_1.anim_name

			if arg_13_0._furnitureAnimTfPool and arg_13_0._furnitureAnimTfPool[var_13_0] and #arg_13_0._furnitureAnimTfPool[var_13_0] > 0 then
				arg_13_3(table.remove(arg_13_0._furnitureAnimTfPool[var_13_0], 1), arg_13_2)

				return
			end

			return arg_13_0:createAnimTf(var_13_0, arg_13_2, arg_13_3)
		end,
		returnFurniture = function(arg_14_0, arg_14_1)
			if not arg_14_1 then
				return
			end

			if arg_14_1.charIndex then
				arg_14_0:returnCharIndex(arg_14_1.charIndex)

				arg_14_1.charIndex = nil
			end

			if arg_14_1.animData and arg_14_1.animTf then
				local var_14_0 = arg_14_1.animData.name

				arg_14_0:returnAnimTf(var_14_0, arg_14_1.animTf)
			end

			if arg_14_1.data.hide_tfs then
				for iter_14_0 = 1, #arg_14_1.data.hide_tfs do
					setActive(findTF(arg_14_1.tf, arg_14_1.data.hide_tfs[iter_14_0]), true)
				end
			end

			arg_14_1.animTf = nil
			arg_14_1.animData = nil
			arg_14_1.activeIndex = nil
			arg_14_1.readyToRemove = false
			arg_14_1.time = nil

			for iter_14_1 = #arg_14_0._activeFurnitures, 1, -1 do
				if arg_14_0._activeFurnitures[iter_14_1] == arg_14_1 then
					table.insert(arg_14_0._furnituresPools, table.remove(arg_14_0._activeFurnitures, iter_14_1))
				end
			end

			for iter_14_2 = #arg_14_0._unActiveFurnitures, 1, -1 do
				if arg_14_0._unActiveFurnitures[iter_14_2] == arg_14_1 then
					table.insert(arg_14_0._furnituresPools, table.remove(arg_14_0._unActiveFurnitures, iter_14_2))
				end
			end

			local var_14_1 = false

			for iter_14_3 = 1, #arg_14_0._furnituresPools do
				if arg_14_0._furnituresPools[iter_14_3] == arg_14_1 then
					var_14_1 = true
				end
			end

			if not var_14_1 then
				table.insert(arg_14_0._furnituresPools, arg_14_1)
			end
		end,
		returnAnimTf = function(arg_15_0, arg_15_1, arg_15_2)
			if not arg_15_0._furnitureAnimTfPool[arg_15_1] then
				arg_15_0._furnitureAnimTfPool[arg_15_1] = {}
			end

			setActive(arg_15_2, false)
			table.insert(arg_15_0._furnitureAnimTfPool[arg_15_1], arg_15_2)
		end,
		createAnimTf = function(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
			local var_16_0 = var_0_40[arg_16_1]

			if not var_16_0 then
				return nil
			end

			local var_16_1 = var_16_0.prefab
			local var_16_2 = var_16_0.name

			if arg_16_0._animTplDic[var_16_2] then
				arg_16_3(tf(Instantiate(arg_16_0._animTplDic[var_16_2])), arg_16_2)
			else
				LoadAndInstantiateAsync(var_0_36, var_16_1, function(arg_17_0)
					if not arg_17_0 then
						print("找不到资源" .. var_16_2)

						return
					end

					if arg_16_0.destroyFlag then
						Destroy(arg_17_0)

						return
					end

					arg_16_0._animTplDic[var_16_2] = arg_17_0

					SetParent(tf(arg_17_0), arg_16_0._tplContainer)
					arg_16_3(tf(Instantiate(arg_16_0._animTplDic[var_16_2])), arg_16_2)
				end)
			end
		end,
		getActiveIndex = function(arg_18_0)
			if not arg_18_0._activeIndex then
				arg_18_0._activeIndex = 0
			end

			arg_18_0._activeIndex = arg_18_0._activeIndex + 1

			return arg_18_0._activeIndex
		end,
		clear = function(arg_19_0)
			for iter_19_0 = #arg_19_0._activeFurnitures, 1, -1 do
				arg_19_0:returnFurniture(arg_19_0._activeFurnitures[iter_19_0])
			end

			for iter_19_1 = #arg_19_0._unActiveFurnitures, 1, -1 do
				arg_19_0:returnFurniture(arg_19_0._unActiveFurnitures[iter_19_1])
			end

			for iter_19_2 = 1, #arg_19_0._furnituresPools do
				local var_19_0 = arg_19_0._furnituresPools[iter_19_2]

				if var_19_0.data.type == var_0_14 then
					var_19_0.initFlag = false
				end
			end

			arg_19_0._activeFurnitures = {}
			var_0_46 = Clone(var_0_38)
		end,
		destroy = function(arg_20_0)
			arg_20_0:clear()

			for iter_20_0 = 1, #arg_20_0._furnitureAnimTfPool do
				local var_20_0 = arg_20_0._furnitureAnimTfPool[iter_20_0].animTf

				if var_20_0 then
					local var_20_1 = GetOrAddComponent(findTF(var_20_0, "collider"), typeof(EventTriggerListener))

					ClearEventTrigger(var_20_1)
				end
			end

			arg_20_0.destroyFlag = true
		end
	}

	var_1_0:ctor()

	return var_1_0
end

local var_0_48 = {
	{
		start = true,
		name = "posMoveRole_1",
		switch_parent = true,
		finish = true,
		finish_weight = 1,
		next = {
			"posMoveRole_2"
		}
	},
	{
		finish = false,
		name = "posMoveRole_2",
		start = false,
		next = {
			"posMoveRole_1",
			"posMoveRole_3",
			"posMoveRole_4"
		}
	},
	{
		finish = false,
		name = "posMoveRole_3",
		start = false,
		finish_weight = 1,
		next = {
			"posMoveRole_2",
			"posMoveRole_5"
		}
	},
	{
		finish = true,
		name = "posMoveRole_4",
		start = true,
		finish_weight = 1,
		next = {
			"posMoveRole_2"
		}
	},
	{
		finish = false,
		name = "posMoveRole_5",
		start = false,
		finish_weight = 1,
		next = {
			"posMoveRole_3",
			"posMoveRole_6",
			"posMoveRole_9"
		}
	},
	{
		finish = false,
		name = "posMoveRole_6",
		start = false,
		finish_weight = 1,
		next = {
			"posMoveRole_5",
			"posMoveRole_7",
			"posMoveRole_8"
		}
	},
	{
		start = true,
		name = "posMoveRole_7",
		switch_parent = true,
		finish = true,
		finish_weight = 1,
		next = {
			"posMoveRole_6"
		}
	},
	{
		finish = true,
		name = "posMoveRole_8",
		start = true,
		finish_weight = 1,
		next = {
			"posMoveRole_6"
		}
	},
	{
		finish = true,
		name = "posMoveRole_9",
		start = true,
		finish_weight = 1,
		next = {
			"posMoveRole_5"
		}
	}
}
local var_0_49 = {
	5,
	10
}
local var_0_50 = 300
local var_0_51 = 200

local function var_0_52(arg_21_0, arg_21_1)
	local var_21_0 = {
		ctor = function(arg_22_0)
			arg_22_0._tf = arg_21_0
			arg_22_0._event = arg_21_1
			arg_22_0._roleTf = findTF(arg_22_0._tf, "fushun")
			arg_22_0._roleAnimator = GetComponent(findTF(arg_22_0._roleTf, "img/anim"), typeof(Animator))
			arg_22_0._dftEvent = GetComponent(findTF(arg_22_0._roleTf, "img/anim"), typeof(DftAniEvent))

			arg_22_0._dftEvent:SetEndEvent(function(arg_23_0)
				setActive(arg_22_0._roleTf, false)
				arg_22_0:clear()
			end)

			arg_22_0._eventTrigger = GetOrAddComponent(findTF(arg_22_0._roleTf, "img/collider"), typeof(EventTriggerListener))

			arg_22_0._eventTrigger:AddPointDownFunc(function(arg_24_0, arg_24_1, arg_24_2)
				if arg_22_0.removeRoleFlag then
					return
				end

				pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_3)
				arg_22_0._event:emit(var_0_12, {
					score = var_0_11,
					pos = arg_24_1.position
				})

				arg_22_0.removeRoleFlag = true

				arg_22_0:setRoleAnimatorTrigger("touch")
			end)

			arg_22_0._roleShowData = {}
			arg_22_0._roleShowStartData = {}

			for iter_22_0 = 1, #var_0_48 do
				if var_0_48[iter_22_0].start then
					table.insert(arg_22_0._roleShowStartData, Clone(var_0_48[iter_22_0]))
				end

				local var_22_0 = Clone(var_0_48[iter_22_0])

				arg_22_0._roleShowData[var_22_0.name] = var_22_0
			end

			arg_22_0._active = false
			arg_22_0._targetPos = Vector2(0, 0)
			arg_22_0._currentTargetData = nil
			arg_22_0._currentTargetPos = nil
		end,
		setRoleAnimatorTrigger = function(arg_25_0, arg_25_1, arg_25_2)
			if not arg_25_2 then
				arg_25_0._roleAnimator:SetTrigger(arg_25_1)
			else
				arg_25_0._roleAnimator:ResetTrigger(arg_25_1)
			end
		end,
		start = function(arg_26_0)
			arg_26_0.showTime = math.random() * (var_0_49[2] - var_0_49[1]) + var_0_49[1]

			arg_26_0:clear()
		end,
		step = function(arg_27_0)
			if arg_27_0.showTime > 0 then
				arg_27_0.showTime = arg_27_0.showTime - Time.deltaTime

				if arg_27_0.showTime <= 0 then
					arg_27_0.showTime = 0

					arg_27_0:checkShow()
				end
			end

			if arg_27_0._currentTargetData and not arg_27_0.removeRoleFlag then
				local var_27_0 = arg_27_0._roleTf.anchoredPosition
				local var_27_1 = var_0_50 * math.cos(arg_27_0._moveAngle) * Time.deltaTime
				local var_27_2 = var_0_50 * math.sin(arg_27_0._moveAngle) * Time.deltaTime

				if arg_27_0._roleDirectX == 1 and arg_27_0._roleDirectX * var_27_1 + var_27_0.x > arg_27_0._currentTargetPos.x then
					var_27_0.x = var_27_0.x + arg_27_0._roleDirectX * var_27_1
					arg_27_0._roleDirectX = nil
				elseif arg_27_0._roleDirectX == -1 and arg_27_0._roleDirectX * var_27_1 + var_27_0.x < arg_27_0._currentTargetPos.x then
					var_27_0.x = var_27_0.x + arg_27_0._roleDirectX * var_27_1
					arg_27_0._roleDirectX = nil
				elseif arg_27_0._roleDirectX then
					var_27_0.x = var_27_0.x + arg_27_0._roleDirectX * var_27_1
				end

				if arg_27_0._roleDirectY == 1 and arg_27_0._roleDirectY * var_27_2 + var_27_0.y > arg_27_0._currentTargetPos.y then
					var_27_0.y = var_27_0.y + arg_27_0._roleDirectY * var_27_2
					arg_27_0._roleDirectY = nil
				elseif arg_27_0._roleDirectY == -1 and arg_27_0._roleDirectY * var_27_2 + var_27_0.y < arg_27_0._currentTargetPos.y then
					var_27_0.y = var_27_0.y + arg_27_0._roleDirectY * var_27_2
					arg_27_0._roleDirectY = nil
				elseif arg_27_0._roleDirectY then
					var_27_0.y = var_27_0.y + arg_27_0._roleDirectY * var_27_2
				end

				arg_27_0._roleTf.anchoredPosition = var_27_0

				if arg_27_0._roleDirectX == nil and arg_27_0._roleDirectY == nil then
					arg_27_0:setRoleNext()
				end
			end
		end,
		setRoleStatus = function(arg_28_0, arg_28_1)
			setActive(arg_28_0._roleTf, true)

			if arg_28_1 then
				arg_28_0:setRoleAnimatorTrigger("change", true)
				arg_28_0:setRoleAnimatorTrigger("hide", true)
				arg_28_0:setRoleAnimatorTrigger("show")
			else
				arg_28_0:setRoleAnimatorTrigger("change")
			end

			arg_28_0._roleAnimator:SetInteger("directX", arg_28_0._roleDirectX)
			arg_28_0._roleAnimator:SetInteger("directY", arg_28_0._roleDirectY)
		end,
		setRoleNext = function(arg_29_0, arg_29_1)
			if arg_29_1 or not arg_29_0._currentTargetData.finish then
				local var_29_0

				if not arg_29_1 then
					var_29_0 = arg_29_0._currentData.name
					var_29_0 = arg_29_0._currentData.name
					arg_29_0._currentData = arg_29_0._currentTargetData
				end

				local var_29_1 = Clone(arg_29_0._currentData.next)

				if var_29_0 then
					for iter_29_0 = #var_29_1, 1, -1 do
						if var_29_1[iter_29_0] == var_29_0 then
							table.remove(var_29_1, iter_29_0)
						end
					end
				end

				if #var_29_1 == 0 then
					arg_29_0:clear()

					return
				end

				local var_29_2 = var_29_1[math.random(1, #var_29_1)]

				arg_29_0._currentTargetData = arg_29_0._roleShowData[var_29_2]

				local var_29_3 = findTF(arg_29_0._tf, arg_29_0._currentData.name)
				local var_29_4 = findTF(arg_29_0._tf, arg_29_0._currentTargetData.name)

				if arg_29_0._currentTargetData and arg_29_0._currentTargetData.switch_parent then
					setParent(arg_29_0._roleTf, var_29_4)
				else
					setParent(arg_29_0._roleTf, var_29_3)
				end

				local var_29_5 = findTF(var_29_3, "rolePos")

				arg_29_0._roleTf.anchoredPosition = var_29_5.anchoredPosition
				arg_29_0._currentTargetPos = findTF(arg_29_0._tf, arg_29_0._currentTargetData.name .. "/rolePos").anchoredPosition
				arg_29_0._roleDirectX = arg_29_0._currentTargetPos.x > arg_29_0._roleTf.anchoredPosition.x and 1 or -1
				arg_29_0._roleDirectY = arg_29_0._currentTargetPos.y > arg_29_0._roleTf.anchoredPosition.y and 1 or -1
				arg_29_0._moveAngle = math.atan(math.abs(arg_29_0._currentTargetPos.y - arg_29_0._roleTf.anchoredPosition.y) / math.abs(arg_29_0._currentTargetPos.x - arg_29_0._roleTf.anchoredPosition.x))
				arg_29_0.removeRoleFlag = false

				arg_29_0:setRoleStatus(arg_29_1)
			elseif arg_29_0._currentTargetData.finish then
				arg_29_0:clear()
			end
		end,
		checkShow = function(arg_30_0)
			if arg_30_0._active and not table.contains(var_0_46, var_0_37) then
				return
			end

			for iter_30_0 = #var_0_46, 1, -1 do
				if var_0_46[iter_30_0] == var_0_37 then
					table.remove(var_0_46, iter_30_0)
				end
			end

			arg_30_0._active = true
			arg_30_0._currentData = arg_30_0._roleShowStartData[math.random(1, #arg_30_0._roleShowStartData)]

			arg_30_0:setRoleNext(true)
		end,
		clear = function(arg_31_0)
			arg_31_0._currentTargetData = nil
			arg_31_0._currentTargetPos = nil

			if not table.contains(var_0_46, var_0_37) then
				table.insert(var_0_46, var_0_37)
			end

			if isActive(arg_31_0._roleTf) then
				arg_31_0:setRoleAnimatorTrigger("hide")

				arg_31_0.removeRoleFlag = true

				setActive(arg_31_0._roleTf, false)
			end

			arg_31_0.showTime = math.random() * (var_0_49[2] - var_0_49[1]) + var_0_49[1]
			arg_31_0._active = false
		end,
		destroy = function(arg_32_0)
			return
		end
	}

	var_21_0:ctor()

	return var_21_0
end

local var_0_53 = {
	"boot00",
	"boot01",
	"boot02"
}
local var_0_54 = {
	"game00",
	"game01",
	"game02"
}
local var_0_55 = {
	"tv00",
	"tv01",
	"tv02",
	"tv03",
	"tv04",
	"tv05",
	"tv06",
	"tv07",
	"tv08",
	"tv09",
	"tv10",
	"tv11",
	"tv12",
	"tv13",
	"tv14"
}
local var_0_56 = {
	1,
	3
}

local function var_0_57(arg_33_0, arg_33_1)
	local var_33_0 = {
		ctor = function(arg_34_0)
			arg_34_0._tf = arg_33_0
			arg_34_0._event = arg_33_1
			arg_34_0.loadedFlag = false
			arg_34_0._tvTf = nil
			arg_34_0._active = false
			arg_34_0._tvAnimator = nil

			onButton(arg_34_0._event, findTF(arg_34_0._tf, "collider"), function()
				if arg_34_0.loadedFlag then
					return
				end

				arg_34_0._active = not arg_34_0._active

				arg_34_0:updateUI()
			end, SFX_CANCEL)
		end,
		start = function(arg_36_0)
			arg_36_0._active = true

			arg_36_0:updateUI()

			if not arg_36_0.loadedFlag then
				LoadAndInstantiateAsync(var_0_36, var_0_45, function(arg_37_0)
					if not arg_37_0 then
						print("tv资源加载失败")

						return
					end

					if arg_36_0.destroyFlag then
						Destroy(arg_37_0)

						return
					end

					arg_36_0.loadedFlag = true
					arg_36_0._tvTf = tf(arg_37_0)
					arg_36_0._tvAnimator = GetComponent(findTF(arg_36_0._tvTf, "anim"), typeof(Animator))

					GetComponent(findTF(arg_36_0._tvTf, "anim"), typeof(DftAniEvent)):SetEndEvent(function()
						arg_36_0:onTvComplete()
					end)
					onButton(arg_36_0._event, findTF(arg_36_0._tvTf, "collider"), function()
						arg_36_0._active = not arg_36_0._active

						arg_36_0:updateUI()
					end)
					setParent(arg_36_0._tvTf, findTF(arg_36_0._tf, "posTv"))
					arg_36_0:updateUI()
					arg_36_0:setTvData()
				end)
			else
				arg_36_0:setTvData()
			end
		end,
		setTvData = function(arg_40_0)
			arg_40_0.playIndex = 1
			arg_40_0.playTvData = {}

			local var_40_0 = math.random(var_0_56[1], var_0_56[2])
			local var_40_1 = Clone(var_0_55)
			local var_40_2 = Clone(var_0_53)
			local var_40_3 = Clone(var_0_54)

			for iter_40_0 = 1, var_40_0 do
				table.insert(arg_40_0.playTvData, table.remove(var_40_1, math.random(1, #var_40_1)))
			end

			table.insert(arg_40_0.playTvData, table.remove(var_40_2, math.random(1, #var_40_2)))
			table.insert(arg_40_0.playTvData, table.remove(var_40_3, math.random(1, #var_40_3)))
			arg_40_0._tvAnimator:Play(arg_40_0.playTvData[arg_40_0.playIndex], -1, 0)
		end,
		onTvComplete = function(arg_41_0)
			if not arg_41_0.playIndex and not arg_41_0.playTvData and #arg_41_0.playTvData == 0 then
				return
			end

			if arg_41_0._tvAnimator then
				arg_41_0.playIndex = arg_41_0.playIndex + 1

				if arg_41_0.playIndex > #arg_41_0.playTvData then
					arg_41_0.playIndex = #arg_41_0.playTvData
				end

				arg_41_0._tvAnimator:Play(arg_41_0.playTvData[arg_41_0.playIndex], -1, 0)
			end
		end,
		step = function(arg_42_0)
			if arg_42_0._tvAnimator and arg_42_0._tvAnimator.speed == 0 then
				arg_42_0._tvAnimator.speed = 1
			end
		end,
		pause = function(arg_43_0)
			if arg_43_0._tvAnimator then
				arg_43_0._tvAnimator.speed = 0
			end
		end,
		updateUI = function(arg_44_0)
			if arg_44_0.loadedFlag then
				setActive(findTF(arg_44_0._tf, "on"), false)
				setActive(findTF(arg_44_0._tf, "off"), false)

				if not arg_44_0.tvCanvas then
					arg_44_0.tvCanvas = GetComponent(findTF(arg_44_0._tvTf, "anim"), typeof(CanvasGroup))
				end

				arg_44_0.tvCanvas.alpha = arg_44_0._active and 1 or 0
			else
				setActive(findTF(arg_44_0._tf, "on"), arg_44_0._active)
				setActive(findTF(arg_44_0._tf, "off"), not arg_44_0._active)
			end
		end,
		destroy = function(arg_45_0)
			arg_45_0.destroyFlag = true
		end,
		clear = function(arg_46_0)
			return
		end
	}

	var_33_0:ctor()

	return var_33_0
end

function var_0_0.getUIName(arg_47_0)
	return "GameRoomHideSeekUI"
end

function var_0_0.getBGM(arg_48_0)
	return var_0_1
end

function var_0_0.didEnter(arg_49_0)
	arg_49_0:initEvent()
	arg_49_0:initData()
	arg_49_0:initUI()
	arg_49_0:initGameUI()
	arg_49_0:initController()
	arg_49_0:updateMenuUI()
	arg_49_0:openMenuUI()
end

function var_0_0.initEvent(arg_50_0)
	if not arg_50_0.uiCam then
		arg_50_0.uiCam = GameObject.Find("UICamera"):GetComponent("Camera")
	end

	arg_50_0:bind(var_0_12, function(arg_51_0, arg_51_1, arg_51_2)
		arg_50_0:addScore(arg_51_1.score)
		arg_50_0:showScore(arg_51_1)
	end)
end

function var_0_0.showScore(arg_52_0, arg_52_1)
	local var_52_0

	if #arg_52_0.showScoresPool > 0 then
		var_52_0 = table.remove(arg_52_0.showScoresPool, 1)
	else
		var_52_0 = tf(Instantiate(arg_52_0.showScoreTpl))

		setParent(var_52_0, arg_52_0.sceneFrontContainer)
		GetComponent(findTF(var_52_0, "anim"), typeof(DftAniEvent)):SetEndEvent(function()
			for iter_53_0 = #arg_52_0.showScores, 1, -1 do
				if var_52_0 == arg_52_0.showScores[iter_53_0] then
					table.insert(arg_52_0.showScoresPool, table.remove(arg_52_0.showScores, iter_53_0))
				end
			end
		end)
	end

	setText(findTF(var_52_0, "anim"), "+" .. tostring(arg_52_1.score))

	local var_52_1 = arg_52_0.uiCam:ScreenToWorldPoint(arg_52_1.pos)

	var_52_0.anchoredPosition = arg_52_0.sceneFrontContainer:InverseTransformPoint(var_52_1)

	setActive(var_52_0, false)
	setActive(var_52_0, true)
	table.insert(arg_52_0.showScores, var_52_0)
end

function var_0_0.onEventHandle(arg_54_0, arg_54_1)
	return
end

function var_0_0.initData(arg_55_0)
	local var_55_0 = Application.targetFrameRate or 60

	if var_55_0 > 60 then
		var_55_0 = 60
	end

	arg_55_0.timer = Timer.New(function()
		arg_55_0:onTimer()
	end, 1 / var_55_0, -1)
	arg_55_0.showScores = {}
	arg_55_0.showScoresPool = {}
end

function var_0_0.initUI(arg_57_0)
	arg_57_0.backSceneTf = findTF(arg_57_0._tf, "scene_background")
	arg_57_0.sceneContainer = findTF(arg_57_0._tf, "sceneMask/sceneContainer")
	arg_57_0.sceneFrontContainer = findTF(arg_57_0._tf, "sceneMask/sceneContainer/scene_front")
	arg_57_0.clickMask = findTF(arg_57_0._tf, "clickMask")
	arg_57_0.bg = findTF(arg_57_0._tf, "bg")
	arg_57_0.countUI = findTF(arg_57_0._tf, "pop/CountUI")
	arg_57_0.countAnimator = GetComponent(findTF(arg_57_0.countUI, "count"), typeof(Animator))
	arg_57_0.countDft = GetOrAddComponent(findTF(arg_57_0.countUI, "count"), typeof(DftAniEvent))

	arg_57_0.countDft:SetTriggerEvent(function()
		return
	end)
	arg_57_0.countDft:SetEndEvent(function()
		setActive(arg_57_0.countUI, false)
		arg_57_0:gameStart()
	end)

	arg_57_0.leaveUI = findTF(arg_57_0._tf, "pop/LeaveUI")

	onButton(arg_57_0, findTF(arg_57_0.leaveUI, "ad/btnOk"), function()
		arg_57_0:resumeGame()
		arg_57_0:onGameOver()
	end, SFX_CANCEL)
	onButton(arg_57_0, findTF(arg_57_0.leaveUI, "ad/btnCancel"), function()
		arg_57_0:resumeGame()
	end, SFX_CANCEL)

	arg_57_0.pauseUI = findTF(arg_57_0._tf, "pop/pauseUI")

	onButton(arg_57_0, findTF(arg_57_0.pauseUI, "ad/btnOk"), function()
		setActive(arg_57_0.pauseUI, false)
		arg_57_0:resumeGame()
	end, SFX_CANCEL)

	arg_57_0.settlementUI = findTF(arg_57_0._tf, "pop/SettleMentUI")

	onButton(arg_57_0, findTF(arg_57_0.settlementUI, "ad/btnOver"), function()
		setActive(arg_57_0.settlementUI, false)
		arg_57_0:openMenuUI()
	end, SFX_CANCEL)

	arg_57_0.menuUI = findTF(arg_57_0._tf, "pop/menuUI")
	arg_57_0.battleScrollRect = GetComponent(findTF(arg_57_0.menuUI, "battList"), typeof(ScrollRect))
	arg_57_0.totalTimes = arg_57_0:getGameTotalTime()

	local var_57_0 = arg_57_0:getGameUsedTimes() - 4 < 0 and 0 or arg_57_0:getGameUsedTimes() - 4

	scrollTo(arg_57_0.battleScrollRect, 0, 1 - var_57_0 / (arg_57_0.totalTimes - 4))
	onButton(arg_57_0, findTF(arg_57_0.menuUI, "rightPanelBg/arrowUp"), function()
		local var_64_0 = arg_57_0.battleScrollRect.normalizedPosition.y + 1 / (arg_57_0.totalTimes - 4)

		if var_64_0 > 1 then
			var_64_0 = 1
		end

		scrollTo(arg_57_0.battleScrollRect, 0, var_64_0)
	end, SFX_CANCEL)
	onButton(arg_57_0, findTF(arg_57_0.menuUI, "rightPanelBg/arrowDown"), function()
		local var_65_0 = arg_57_0.battleScrollRect.normalizedPosition.y - 1 / (arg_57_0.totalTimes - 4)

		if var_65_0 < 0 then
			var_65_0 = 0
		end

		scrollTo(arg_57_0.battleScrollRect, 0, var_65_0)
	end, SFX_CANCEL)
	onButton(arg_57_0, findTF(arg_57_0.menuUI, "btnBack"), function()
		arg_57_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_57_0, findTF(arg_57_0.menuUI, "btnRule"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = arg_57_0:getGameRoomData().game_help
		})
	end, SFX_CANCEL)
	onButton(arg_57_0, findTF(arg_57_0.menuUI, "btnStart"), function()
		setActive(arg_57_0.menuUI, false)
		arg_57_0:readyStart()
	end, SFX_CANCEL)

	local var_57_1 = findTF(arg_57_0.menuUI, "tplBattleItem")

	arg_57_0.battleItems = {}

	for iter_57_0 = 1, 7 do
		local var_57_2 = tf(instantiate(var_57_1))

		var_57_2.name = "battleItem_" .. iter_57_0

		setParent(var_57_2, findTF(arg_57_0.menuUI, "battList/Viewport/Content"))

		local var_57_3 = iter_57_0

		GetSpriteFromAtlasAsync("ui/minigameui/" .. var_0_4, "battleDesc" .. var_57_3, function(arg_69_0)
			setImageSprite(findTF(var_57_2, "state_open/buttomDesc"), arg_69_0, true)
			setImageSprite(findTF(var_57_2, "state_clear/buttomDesc"), arg_69_0, true)
			setImageSprite(findTF(var_57_2, "state_current/buttomDesc"), arg_69_0, true)
			setImageSprite(findTF(var_57_2, "state_closed/buttomDesc"), arg_69_0, true)
		end)
		setActive(var_57_2, true)
		table.insert(arg_57_0.battleItems, var_57_2)
	end

	if not arg_57_0.handle and IsUnityEditor then
		arg_57_0.handle = UpdateBeat:CreateListener(arg_57_0.Update, arg_57_0)

		UpdateBeat:AddListener(arg_57_0.handle)
	end
end

function var_0_0.initGameUI(arg_70_0)
	arg_70_0.gameUI = findTF(arg_70_0._tf, "ui/gameUI")
	arg_70_0.showScoreTpl = findTF(arg_70_0.sceneFrontContainer, "score")

	setActive(arg_70_0.showScoreTpl, false)
	onButton(arg_70_0, findTF(arg_70_0.gameUI, "topRight/btnStop"), function()
		arg_70_0:stopGame()
		setActive(arg_70_0.pauseUI, true)
	end)
	onButton(arg_70_0, findTF(arg_70_0.gameUI, "btnLeave"), function()
		arg_70_0:stopGame()
		setActive(arg_70_0.leaveUI, true)
	end)

	arg_70_0.gameTimeS = findTF(arg_70_0.gameUI, "top/time/s")
	arg_70_0.scoreTf = findTF(arg_70_0.gameUI, "top/score")
	arg_70_0.sceneContainer.anchoredPosition = Vector2(0, 0)

	local var_70_0 = GetOrAddComponent(arg_70_0.sceneContainer, typeof(EventTriggerListener))
	local var_70_1
	local var_70_2

	arg_70_0.velocityXSmoothing = Vector2(0, 0)
	arg_70_0.offsetPosition = arg_70_0.sceneContainer.anchoredPosition

	var_70_0:AddBeginDragFunc(function(arg_73_0, arg_73_1)
		var_70_1 = arg_73_1.position
		var_70_2 = arg_70_0.sceneContainer.anchoredPosition
		arg_70_0.velocityXSmoothing = Vector2(0, 0)
		arg_70_0.offsetPosition = arg_70_0.sceneContainer.anchoredPosition
	end)
	var_70_0:AddDragFunc(function(arg_74_0, arg_74_1)
		arg_70_0.offsetPosition.x = arg_74_1.position.x - var_70_1.x + var_70_2.x
		arg_70_0.offsetPosition.y = arg_74_1.position.y - var_70_1.y + var_70_2.y
		arg_70_0.offsetPosition.x = arg_70_0.offsetPosition.x > var_0_42[2] and var_0_42[2] or arg_70_0.offsetPosition.x
		arg_70_0.offsetPosition.x = arg_70_0.offsetPosition.x < var_0_42[1] and var_0_42[1] or arg_70_0.offsetPosition.x
		arg_70_0.offsetPosition.y = arg_70_0.offsetPosition.y > var_0_43[2] and var_0_43[2] or arg_70_0.offsetPosition.y
		arg_70_0.offsetPosition.y = arg_70_0.offsetPosition.y < var_0_43[1] and var_0_43[1] or arg_70_0.offsetPosition.y
	end)
	var_70_0:AddDragEndFunc(function(arg_75_0, arg_75_1)
		return
	end)
end

function var_0_0.initController(arg_76_0)
	arg_76_0.furnitureCtrl = var_0_47(findTF(arg_76_0.sceneContainer, "scene"), arg_76_0)
	arg_76_0.moveRoleCtrl = var_0_52(findTF(arg_76_0.sceneContainer, "scene"), arg_76_0)
	arg_76_0.tvCtrl = var_0_57(findTF(arg_76_0.sceneContainer, "scene/furniture_tv"), arg_76_0)
end

function var_0_0.Update(arg_77_0)
	arg_77_0:AddDebugInput()
end

function var_0_0.AddDebugInput(arg_78_0)
	if arg_78_0.gameStop or arg_78_0.settlementFlag then
		return
	end

	if IsUnityEditor and Input.GetKeyDown(KeyCode.S) then
		-- block empty
	end
end

function var_0_0.updateMenuUI(arg_79_0)
	local var_79_0 = arg_79_0:getGameUsedTimes()
	local var_79_1 = arg_79_0:getGameTimes()

	for iter_79_0 = 1, #arg_79_0.battleItems do
		setActive(findTF(arg_79_0.battleItems[iter_79_0], "state_open"), false)
		setActive(findTF(arg_79_0.battleItems[iter_79_0], "state_closed"), false)
		setActive(findTF(arg_79_0.battleItems[iter_79_0], "state_clear"), false)
		setActive(findTF(arg_79_0.battleItems[iter_79_0], "state_current"), false)

		if iter_79_0 <= var_79_0 then
			setActive(findTF(arg_79_0.battleItems[iter_79_0], "state_clear"), true)
		elseif iter_79_0 == var_79_0 + 1 and var_79_1 >= 1 then
			setActive(findTF(arg_79_0.battleItems[iter_79_0], "state_current"), true)
		elseif var_79_0 < iter_79_0 and iter_79_0 <= var_79_0 + var_79_1 then
			setActive(findTF(arg_79_0.battleItems[iter_79_0], "state_open"), true)
		else
			setActive(findTF(arg_79_0.battleItems[iter_79_0], "state_closed"), true)
		end
	end

	arg_79_0.totalTimes = arg_79_0:getGameTotalTime()

	local var_79_2 = 1 - (arg_79_0:getGameUsedTimes() - 3 < 0 and 0 or arg_79_0:getGameUsedTimes() - 3) / (arg_79_0.totalTimes - 4)

	if var_79_2 > 1 then
		var_79_2 = 1
	end

	scrollTo(arg_79_0.battleScrollRect, 0, var_79_2)
	setActive(findTF(arg_79_0.menuUI, "btnStart/tip"), var_79_1 > 0)
	arg_79_0:CheckGet()
end

function var_0_0.CheckGet(arg_80_0)
	setActive(findTF(arg_80_0.menuUI, "got"), false)

	if arg_80_0:getUltimate() and arg_80_0:getUltimate() ~= 0 then
		setActive(findTF(arg_80_0.menuUI, "got"), true)
	end

	if arg_80_0:getUltimate() == 0 then
		if arg_80_0:getGameTotalTime() > arg_80_0:getGameUsedTimes() then
			return
		end

		pg.m02:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = arg_80_0:GetMGHubData().id,
			cmd = MiniGameOPCommand.CMD_ULTIMATE,
			args1 = {}
		})
		setActive(findTF(arg_80_0.menuUI, "got"), true)
	end
end

function var_0_0.openMenuUI(arg_81_0)
	setActive(findTF(arg_81_0.sceneContainer, "scene_front"), false)
	setActive(findTF(arg_81_0.sceneContainer, "scene_background"), false)
	setActive(findTF(arg_81_0.sceneContainer, "scene"), false)
	setActive(arg_81_0.gameUI, false)
	setActive(arg_81_0.menuUI, true)
	setActive(arg_81_0.bg, true)
	arg_81_0:openCoinLayer(true)
	arg_81_0:updateMenuUI()
end

function var_0_0.clearUI(arg_82_0)
	setActive(arg_82_0.sceneContainer, false)
	setActive(arg_82_0.settlementUI, false)
	setActive(arg_82_0.countUI, false)
	setActive(arg_82_0.menuUI, false)
	setActive(arg_82_0.gameUI, false)
end

function var_0_0.readyStart(arg_83_0)
	setActive(arg_83_0.countUI, true)
	arg_83_0.countAnimator:Play("count")
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_2)
	arg_83_0:openCoinLayer(false)
end

function var_0_0.gameStart(arg_84_0)
	setActive(findTF(arg_84_0.sceneContainer, "scene_front"), true)
	setActive(findTF(arg_84_0.sceneContainer, "scene_background"), true)
	setActive(findTF(arg_84_0.sceneContainer, "scene"), true)
	setActive(arg_84_0.bg, false)

	arg_84_0.sceneContainer.anchoredPosition = var_0_44
	arg_84_0.offsetPosition = var_0_44

	setActive(arg_84_0.gameUI, true)

	arg_84_0.gameStartFlag = true
	arg_84_0.scoreNum = 0
	arg_84_0.nextPositionIndex = 2
	arg_84_0.gameStepTime = 0
	arg_84_0.heart = 3
	arg_84_0.gameTime = var_0_5

	for iter_84_0 = #arg_84_0.showScores, 1, -1 do
		if not table.contains(arg_84_0.showScoresPool, arg_84_0.showScores[iter_84_0]) then
			local var_84_0 = table.remove(arg_84_0.showScores, iter_84_0)

			table.insert(arg_84_0.showScoresPool, var_84_0)
		end
	end

	for iter_84_1 = #arg_84_0.showScoresPool, 1, -1 do
		setActive(arg_84_0.showScoresPool[iter_84_1], false)
	end

	arg_84_0:updateGameUI()
	arg_84_0:timerStart()
	arg_84_0:controllerStart()
end

function var_0_0.controllerStart(arg_85_0)
	if arg_85_0.furnitureCtrl then
		arg_85_0.furnitureCtrl:start()
	end

	if arg_85_0.moveRoleCtrl then
		arg_85_0.moveRoleCtrl:start()
	end

	if arg_85_0.tvCtrl then
		arg_85_0.tvCtrl:start()
	end
end

function var_0_0.getGameTimes(arg_86_0)
	return arg_86_0:GetMGHubData().count
end

function var_0_0.getGameUsedTimes(arg_87_0)
	return arg_87_0:GetMGHubData().usedtime
end

function var_0_0.getUltimate(arg_88_0)
	return arg_88_0:GetMGHubData().ultimate
end

function var_0_0.getGameTotalTime(arg_89_0)
	return (arg_89_0:GetMGHubData():getConfig("reward_need"))
end

function var_0_0.changeSpeed(arg_90_0, arg_90_1)
	return
end

function var_0_0.onTimer(arg_91_0)
	arg_91_0:gameStep()
end

function var_0_0.gameStep(arg_92_0)
	arg_92_0.gameTime = arg_92_0.gameTime - Time.deltaTime

	if arg_92_0.gameTime < 0 then
		arg_92_0.gameTime = 0
	end

	arg_92_0.gameStepTime = arg_92_0.gameStepTime + Time.deltaTime

	arg_92_0:controllerStep()
	arg_92_0:updateGameUI()

	if arg_92_0.gameTime <= 0 then
		arg_92_0:onGameOver()

		return
	end
end

function var_0_0.controllerStep(arg_93_0)
	if arg_93_0.furnitureCtrl then
		arg_93_0.furnitureCtrl:step()
	end

	if arg_93_0.moveRoleCtrl then
		arg_93_0.moveRoleCtrl:step()
	end

	if arg_93_0.tvCtrl then
		arg_93_0.tvCtrl:step()
	end
end

function var_0_0.timerStart(arg_94_0)
	if not arg_94_0.timer.running then
		arg_94_0.timer:Start()
	end
end

function var_0_0.timerStop(arg_95_0)
	if arg_95_0.timer.running then
		arg_95_0.timer:Stop()

		if arg_95_0.tvCtrl then
			arg_95_0.tvCtrl:pause()
		end
	end
end

function var_0_0.updateGameUI(arg_96_0)
	setText(arg_96_0.scoreTf, arg_96_0.scoreNum)
	setText(arg_96_0.gameTimeS, math.ceil(arg_96_0.gameTime))

	arg_96_0.sceneContainer.anchoredPosition, arg_96_0.velocityXSmoothing = Vector2.SmoothDamp(arg_96_0.sceneContainer.anchoredPosition, arg_96_0.offsetPosition, arg_96_0.velocityXSmoothing, var_0_41)
end

function var_0_0.addScore(arg_97_0, arg_97_1)
	arg_97_0.scoreNum = arg_97_0.scoreNum + arg_97_1

	if arg_97_0.scoreNum < 0 then
		arg_97_0.scoreNum = 0
	end
end

function var_0_0.onGameOver(arg_98_0)
	if arg_98_0.settlementFlag then
		return
	end

	arg_98_0:timerStop()

	arg_98_0.settlementFlag = true

	setActive(arg_98_0.clickMask, true)
	LeanTween.delayedCall(go(arg_98_0._tf), 0.1, System.Action(function()
		arg_98_0.settlementFlag = false
		arg_98_0.gameStartFlag = false

		setActive(arg_98_0.clickMask, false)
		arg_98_0:showSettlement()
	end))
end

function var_0_0.showSettlement(arg_100_0)
	setActive(arg_100_0.settlementUI, true)
	GetComponent(findTF(arg_100_0.settlementUI, "ad"), typeof(Animator)):Play("settlement", -1, 0)

	local var_100_0 = arg_100_0.scoreNum
	local var_100_1 = getProxy(GameRoomProxy):getRoomScore(arg_100_0:getGameRoomData().id)

	setActive(findTF(arg_100_0.settlementUI, "ad/new"), var_100_1 < var_100_0)

	if var_100_1 <= var_100_0 then
		var_100_1 = var_100_0

		arg_100_0:StoreDataToServer({
			var_100_1
		})
	end

	local var_100_2 = findTF(arg_100_0.settlementUI, "ad/highText")
	local var_100_3 = findTF(arg_100_0.settlementUI, "ad/currentText")

	setText(var_100_2, var_100_1)
	setText(var_100_3, var_100_0)

	arg_100_0.sendSuccessFlag = true

	arg_100_0:SendSuccess(var_100_0)
end

function var_0_0.resumeGame(arg_101_0)
	arg_101_0.gameStop = false

	setActive(arg_101_0.leaveUI, false)
	arg_101_0:changeSpeed(1)
	arg_101_0:timerStart()
end

function var_0_0.stopGame(arg_102_0)
	arg_102_0.gameStop = true

	arg_102_0:timerStop()
	arg_102_0:changeSpeed(0)
end

function var_0_0.onBackPressed(arg_103_0)
	if not arg_103_0.gameStartFlag then
		arg_103_0:emit(var_0_0.ON_BACK_PRESSED)
	else
		if arg_103_0.settlementFlag then
			return
		end

		if isActive(arg_103_0.pauseUI) then
			setActive(arg_103_0.pauseUI, false)
		end

		arg_103_0:stopGame()
		setActive(arg_103_0.leaveUI, true)
	end
end

function var_0_0.willExit(arg_104_0)
	if arg_104_0.handle then
		UpdateBeat:RemoveListener(arg_104_0.handle)
	end

	if arg_104_0._tf and LeanTween.isTweening(go(arg_104_0._tf)) then
		LeanTween.cancel(go(arg_104_0._tf))
	end

	arg_104_0:destroyController()

	if arg_104_0.timer and arg_104_0.timer.running then
		arg_104_0.timer:Stop()
	end

	Time.timeScale = 1
	arg_104_0.timer = nil
end

function var_0_0.destroyController(arg_105_0)
	if arg_105_0.furnitureCtrl then
		arg_105_0.furnitureCtrl:destroy()
	end

	if arg_105_0.moveRoleCtrl then
		arg_105_0.moveRoleCtrl:destroy()
	end

	if arg_105_0.tvCtrl then
		arg_105_0.tvCtrl:destroy()
	end
end

return var_0_0
