local var_0_0 = class("ShipWordHelper")
local var_0_1 = pg.ship_skin_template
local var_0_2 = pg.ship_skin_words
local var_0_3 = pg.ship_skin_words_extra
local var_0_4 = pg.ship_skin_words_add
local var_0_5 = pg.character_voice
local var_0_6 = pg.voice_actor_CN

var_0_0.WORD_TYPE_MAIN = "main"
var_0_0.WORD_TYPE_SKILL = "skill"
var_0_0.WORD_TYPE_UNLOCK = "unlock"
var_0_0.WORD_TYPE_PROFILE = "profile"
var_0_0.WORD_TYPE_DROP = "drop_descrip"
var_0_0.WORD_TYPE_MVP = "win_mvp"
var_0_0.WORD_TYPE_LOSE = "lose"
var_0_0.WORD_TYPE_UPGRADE = "upgrade"
var_0_0.CV_KEY_REPALCE = 0
var_0_0.CV_KEY_BAN = -1
var_0_0.CV_KEY_BAN_NEW = -2
var_0_0.CVBattleKey = {
	skill = "skill",
	link2 = "link2",
	lose = "lose",
	link5 = "link5",
	mvp = "mvp",
	link3 = "link3",
	link6 = "link6",
	hp = "hp",
	link1 = "link1",
	link4 = "link4",
	warcry = "warcry",
	link7 = "link7"
}

local var_0_7 = false

local function var_0_8(...)
	if var_0_7 and IsUnityEditor then
		print(...)
	end
end

local function var_0_9(arg_2_0)
	if not arg_2_0 or arg_2_0 == "" or arg_2_0 == "nil" then
		return true
	end
end

local function var_0_10(arg_3_0)
	return var_0_3[arg_3_0] ~= nil
end

local function var_0_11(arg_4_0)
	return var_0_2[arg_4_0] ~= nil
end

local function var_0_12(arg_5_0)
	local var_5_0 = var_0_1[arg_5_0].ship_group

	return ShipGroup.getDefaultSkin(var_5_0).id
end

local function var_0_13(arg_6_0, arg_6_1)
	arg_6_0 = arg_6_0 or ""

	if type(arg_6_0) == "table" then
		return arg_6_0
	else
		local var_6_0 = string.split(arg_6_0, "|")

		arg_6_1[1] = arg_6_1[1] or math.random(#var_6_0)

		return var_6_0[arg_6_1[1]]
	end
end

local function var_0_14(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = var_0_12(arg_7_0)
	local var_7_1 = var_0_11(arg_7_0) and arg_7_0 or var_7_0
	local var_7_2 = var_0_2[var_7_1]

	if not var_0_2[var_7_1] then
		return nil
	end

	local var_7_3 = var_7_1 == var_7_0

	if var_7_3 and arg_7_0 ~= var_7_0 and arg_7_3 then
		arg_7_3[1] = true
	end

	local var_7_4 = var_0_13(var_7_2[arg_7_1], arg_7_2)

	if (type(var_7_4) == "table" and #var_7_4 == 0 or var_0_9(var_7_4)) and not var_7_3 then
		if arg_7_3 then
			arg_7_3[1] = true
		end

		var_7_2 = var_0_2[var_7_0]
	end

	return var_7_2
end

local function var_0_15(arg_8_0, arg_8_1, arg_8_2)
	arg_8_1 = arg_8_1 or 0

	local var_8_0

	for iter_8_0, iter_8_1 in ipairs(arg_8_0) do
		local var_8_1 = iter_8_1[1]
		local var_8_2 = iter_8_1[2]

		if var_8_1 <= arg_8_1 then
			var_8_0 = iter_8_1

			break
		end
	end

	if var_8_0 then
		return var_0_13(var_8_0[2], arg_8_2), var_8_0[1]
	end
end

local function var_0_16(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = var_0_12(arg_9_0)
	local var_9_1 = var_0_11(arg_9_0) and arg_9_0 or var_9_0
	local var_9_2 = var_0_3[var_9_1]

	if not var_9_2 then
		return nil
	end

	local var_9_3 = var_9_2[arg_9_1]

	if var_9_1 == var_9_0 and arg_9_0 ~= var_9_0 and arg_9_4 then
		arg_9_4[1] = true
	end

	if var_0_9(var_9_3) then
		return nil
	end

	return var_0_15(var_9_3, arg_9_3, arg_9_2)
end

local function var_0_17(arg_10_0)
	local var_10_0 = pg.ship_skin_words[arg_10_0]
	local var_10_1 = var_0_1[arg_10_0].ship_group
	local var_10_2 = PlayerPrefs.GetInt(CV_LANGUAGE_KEY .. var_10_1)

	if PLATFORM_CODE == PLATFORM_CH and (arg_10_0 == 407010 or arg_10_0 == 407020 or arg_10_0 == 204010 or arg_10_0 == 204040 or arg_10_0 == 9704040 or arg_10_0 == 303120 or arg_10_0 == 305070 or arg_10_0 == 307020) and var_10_2 == 2 then
		PlayerPrefs.SetInt(CV_LANGUAGE_KEY .. var_10_1, 1)
		PlayerPrefs.Save()

		var_10_2 = 1
	end

	return var_10_2
end

function var_0_0.GetLanguageSetting(arg_11_0)
	return var_0_17(arg_11_0)
end

local function var_0_18(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = "event:/cv/" .. arg_12_1 .. "/" .. arg_12_0

	if arg_12_2 then
		var_12_0 = var_12_0 .. "_" .. arg_12_2
	end

	return var_12_0
end

local function var_0_19(arg_13_0, arg_13_1)
	local var_13_0 = var_0_2[arg_13_1]

	if not var_13_0 then
		return -1
	end

	local function var_13_1(arg_14_0)
		return arg_13_0 == 2 and arg_14_0.voice_key_2 >= 0 and arg_14_0.voice_key_2 or arg_14_0.voice_key
	end

	local var_13_2 = var_13_1(var_13_0)

	if var_13_2 == 0 or var_13_2 == -2 then
		local var_13_3 = var_0_12(arg_13_1)
		local var_13_4 = var_0_2[var_13_3]

		var_13_2 = var_13_1(var_13_4)
	end

	return var_13_2
end

local function var_0_20(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	if arg_15_0 then
		local var_15_0
		local var_15_1
		local var_15_2 = var_0_17(arg_15_1)
		local var_15_3 = var_15_2 == 2 and arg_15_0.voice_key_2 or arg_15_0.voice_key
		local var_15_4 = arg_15_2 == var_0_0.WORD_TYPE_MAIN
		local var_15_5 = var_15_4 and arg_15_2 .. arg_15_3[1] or arg_15_2
		local var_15_6 = var_0_5[var_15_5]
		local var_15_7 = var_15_6 and var_15_6.resource_key

		if not var_15_7 and var_15_4 then
			var_15_7 = arg_15_2 .. "_" .. arg_15_3[1]
		end

		if var_15_3 ~= var_0_0.CV_KEY_BAN and var_15_7 then
			var_15_0 = var_0_19(var_15_2, arg_15_1)

			local var_15_8

			if arg_15_4 and var_15_3 == var_0_0.CV_KEY_REPALCE then
				local var_15_9 = var_0_1[arg_15_1].group_index

				if var_15_9 ~= 0 then
					var_15_8 = var_15_9
				end
			end

			var_15_1 = var_0_18(var_15_7, var_15_0, var_15_8)
		end

		return var_15_0, var_15_1
	end
end

local function var_0_21(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = var_0_0.ExistDifferentWord(arg_16_0, arg_16_1, arg_16_2)
	local var_16_1 = var_0_2[arg_16_0].voice_key == var_0_0.CV_KEY_BAN_NEW

	return var_16_0 and var_16_1
end

local function var_0_22(arg_17_0, arg_17_1)
	arg_17_1 = arg_17_1 or -1

	local var_17_0 = var_0_3[arg_17_0]

	if not var_17_0 or not var_17_0.main_extra or var_17_0.main_extra == "" or type(var_17_0.main_extra) == "table" and #var_17_0.main_extra == 0 then
		return nil
	end

	local var_17_1
	local var_17_2 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0.main_extra) do
		local var_17_3 = iter_17_1[1]
		local var_17_4 = iter_17_1[2]

		if var_17_3 <= arg_17_1 then
			var_17_1 = var_17_1 and var_17_1 .. "|" .. var_17_4 or var_17_4

			local var_17_5 = string.split(var_17_4, "|")

			for iter_17_2, iter_17_3 in ipairs(var_17_5) do
				var_17_2[iter_17_3] = var_17_3
			end
		end
	end

	return var_17_1, var_17_2
end

local var_0_23

local function var_0_24(arg_18_0, arg_18_1)
	local var_18_0 = var_0_2[arg_18_0]

	if not var_18_0 then
		return
	end

	if not var_18_0[arg_18_1] and var_0_4[arg_18_0] and var_0_4[arg_18_0][arg_18_1] then
		local var_18_1 = var_0_12(arg_18_0)

		if var_18_1 ~= arg_18_0 then
			var_0_24(var_18_1, arg_18_1)
		end

		setmetatable(var_0_2[arg_18_0], {
			__index = function(arg_19_0, arg_19_1)
				return var_0_4[arg_18_0][arg_19_1]
			end
		})
	end
end

function var_0_0.GetWordAndCV(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0
	local var_20_1
	local var_20_2
	local var_20_3 = {
		false
	}
	local var_20_4 = {
		arg_20_2
	}
	local var_20_5, var_20_6 = var_0_16(arg_20_0, arg_20_1, var_20_4, arg_20_4, var_20_3)

	if not var_0_9(var_20_5) then
		var_20_0 = var_20_5
		var_20_1 = var_0_14(arg_20_0, arg_20_1, var_20_4)
	else
		var_20_4 = {
			arg_20_2
		}
		var_20_3 = {
			false
		}
		var_20_1 = var_0_14(arg_20_0, arg_20_1, var_20_4, var_20_3)

		if var_0_0.WORD_TYPE_MAIN == arg_20_1 then
			local var_20_7
			local var_20_8 = {}
			local var_20_9, var_20_10 = var_0_22(arg_20_0, arg_20_4)

			if var_20_9 then
				var_20_4 = {
					arg_20_2
				}
			end

			local var_20_11

			if var_20_9 and var_20_1 and var_20_1[arg_20_1] then
				var_20_11 = var_20_1[arg_20_1] .. "|" .. var_20_9
			elseif var_20_9 and (not var_20_1 or not var_20_1[arg_20_1]) then
				var_20_11 = var_20_9
			elseif not var_20_9 and var_20_1 and var_20_1[arg_20_1] then
				var_20_11 = var_20_1[arg_20_1]
			end

			var_20_0 = var_0_13(var_20_11, var_20_4)
			var_20_2 = var_20_10 and var_20_10[var_20_0]
		elseif var_20_1 then
			var_20_0 = var_0_13(var_20_1[arg_20_1], var_20_4)
		end
	end

	local var_20_12
	local var_20_13

	if not var_0_21(arg_20_0, arg_20_1, arg_20_2) then
		var_20_12, var_20_13 = var_0_20(var_20_1, arg_20_0, arg_20_1, var_20_4, not var_20_3[1])

		if var_20_13 and not var_0_9(var_20_5) and var_20_6 then
			var_20_13 = var_20_13 .. "_ex" .. var_20_6
		elseif var_20_13 and var_20_2 then
			var_20_13 = var_20_13 .. "_ex" .. var_20_2
		end
	end

	if type(var_20_0) ~= "table" then
		if var_20_0 and arg_20_3 then
			var_20_0 = SwitchSpecialChar(var_20_0, true)
		end

		var_20_0 = var_20_0 and HXSet.hxLan(var_20_0)
	end

	var_0_8("cv:", var_20_13, "cvkey:", var_20_12, "word:", var_20_0)

	return var_20_12, var_20_13, var_20_0
end

function var_0_0.RawGetWord(arg_21_0, arg_21_1)
	return var_0_2[arg_21_0][arg_21_1]
end

function var_0_0.RawGetCVKey(arg_22_0)
	local var_22_0 = var_0_17(arg_22_0)

	return var_0_19(var_22_0, arg_22_0)
end

function var_0_0.GetDefaultSkin(arg_23_0)
	return var_0_12(arg_23_0)
end

function var_0_0.GetMainSceneWordCnt(arg_24_0, arg_24_1)
	local var_24_0 = var_0_2[arg_24_0]

	if not var_24_0 or not var_24_0[var_0_0.WORD_TYPE_MAIN] or var_24_0[var_0_0.WORD_TYPE_MAIN] == "" then
		local var_24_1 = var_0_12(arg_24_0)

		var_24_0 = var_0_2[var_24_1]
	end

	local var_24_2 = 0

	if var_24_0 and var_24_0[var_0_0.WORD_TYPE_MAIN] and var_24_0[var_0_0.WORD_TYPE_MAIN] ~= "" then
		var_24_2 = #string.split(var_24_0[var_0_0.WORD_TYPE_MAIN], "|")
	end

	local var_24_3, var_24_4 = var_0_22(arg_24_0, arg_24_1)

	if var_24_3 then
		var_24_2 = var_24_2 + table.getCount(var_24_4)
	end

	return var_24_2
end

function var_0_0.GetL2dCvCalibrate(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = var_0_1[arg_25_0]

	if not var_25_0 then
		return 0
	end

	if type(var_25_0.l2d_voice_calibrate) == "table" and var_25_0.l2d_voice_calibrate.use_event then
		return -1
	end

	if arg_25_1 == var_0_0.WORD_TYPE_MAIN then
		arg_25_1 = arg_25_1 .. "_" .. arg_25_2
	end

	return var_25_0.l2d_voice_calibrate[arg_25_1]
end

function var_0_0.GetL2dSoundEffect(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = var_0_1[arg_26_0]

	if not var_26_0 then
		return 0
	end

	if arg_26_1 == var_0_0.WORD_TYPE_MAIN then
		arg_26_1 = arg_26_1 .. "_" .. arg_26_2
	end

	return var_26_0.l2d_se[arg_26_1]
end

function var_0_0.ExistVoiceKey(arg_27_0)
	local var_27_0 = var_0_2[arg_27_0]

	return var_27_0 and var_27_0.voice_key ~= var_0_0.CV_KEY_BAN
end

function var_0_0.GetCVAuthor(arg_28_0)
	local var_28_0 = var_0_1[arg_28_0]
	local var_28_1 = var_0_17(arg_28_0) == 2 and var_28_0.voice_actor_2 or var_28_0.voice_actor
	local var_28_2 = ""

	return var_28_1 == var_0_0.CV_KEY_BAN and "-" or var_0_6[var_28_1].actor_name
end

function var_0_0.GetCVList()
	local var_29_0 = {}

	for iter_29_0, iter_29_1 in pairs(pg.character_voice) do
		if not pg.AssistantInfo.isDisableSpecialClick(iter_29_1.key) and iter_29_1.unlock_condition[1] >= 0 then
			var_29_0[#var_29_0 + 1] = setmetatable({}, {
				__index = iter_29_1
			})
		end
	end

	return var_29_0
end

function var_0_0.ExistDifferentWord(arg_30_0, arg_30_1, arg_30_2)
	if var_0_12(arg_30_0) == arg_30_0 then
		return false
	end

	local var_30_0 = var_0_2[arg_30_0]
	local var_30_1

	if string.find(arg_30_1, "main") then
		local var_30_2 = var_30_0[var_0_0.WORD_TYPE_MAIN]

		var_30_1 = string.split(var_30_2, "|")[arg_30_2]
	else
		var_30_1 = var_30_0[arg_30_1]
	end

	return not not var_30_1 and var_30_1 ~= "" and var_30_1 ~= "nil"
end

function var_0_0.ExistDifferentExWord(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = var_0_12(arg_31_0)

	if arg_31_0 == var_31_0 then
		return false
	end

	local var_31_1 = arg_31_1

	if string.find(arg_31_1, "main") then
		var_31_1 = var_0_0.WORD_TYPE_MAIN
	end

	local var_31_2 = var_0_16(arg_31_0, var_31_1, {
		arg_31_2
	}, arg_31_3)
	local var_31_3 = var_0_16(var_31_0, var_31_1, {
		arg_31_2
	}, arg_31_3)

	return not var_0_9(var_31_2) and var_31_2 ~= var_31_3
end

function var_0_0.ExistDifferentMainExWord(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = var_0_12(arg_32_0)

	if arg_32_0 == var_32_0 then
		return false
	end

	local var_32_1, var_32_2, var_32_3 = var_0_0.GetWordAndCV(arg_32_0, arg_32_1, arg_32_2, nil, arg_32_3)
	local var_32_4, var_32_5, var_32_6 = var_0_0.GetWordAndCV(var_32_0, arg_32_1, arg_32_2, nil, arg_32_3)

	return not var_0_9(var_32_3) and var_32_3 ~= var_32_6
end

function var_0_0.ExistExCv(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0, var_33_1 = var_0_16(arg_33_0, arg_33_1, {
		arg_33_2
	}, arg_33_3)

	if var_33_0 then
		return HXSet.hxLan(var_33_0), var_33_1
	end
end

function var_0_0.GetCvDataForShip(arg_34_0, arg_34_1)
	if arg_34_1 == "" then
		return nil
	end

	local var_34_0 = arg_34_0:getSkinId()
	local var_34_1 = arg_34_0:getCVIntimacy()
	local var_34_2 = string.split(arg_34_1, "_")
	local var_34_3
	local var_34_4
	local var_34_5
	local var_34_6
	local var_34_7
	local var_34_8

	if var_34_2[1] == "main" then
		var_34_3, var_34_5, var_34_4 = ShipWordHelper.GetWordAndCV(var_34_0, var_34_2[1], tonumber(var_34_2[2]), nil, var_34_1)
		var_34_6 = ShipWordHelper.GetL2dCvCalibrate(var_34_0, var_34_2[1], tonumber(var_34_2[2]))
		var_34_7 = ShipWordHelper.GetL2dSoundEffect(var_34_0, var_34_2[1], tonumber(var_34_2[2]))
	else
		var_34_3, var_34_5, var_34_4 = ShipWordHelper.GetWordAndCV(var_34_0, arg_34_1, nil, nil, var_34_1)
		var_34_6 = ShipWordHelper.GetL2dCvCalibrate(var_34_0, arg_34_1)
		var_34_7 = ShipWordHelper.GetL2dSoundEffect(var_34_0, arg_34_1)
	end

	local var_34_9 = var_34_6 == -1

	return var_34_3, var_34_5, var_34_4, var_34_6, var_34_7, var_34_9
end

return var_0_0
