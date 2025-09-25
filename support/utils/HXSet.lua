HXSet = {}

local var_0_0 = HXSet

var_0_0.codeModeKey = "hx_code_mode"

if PLATFORM_CODE == PLATFORM_CH then
	var_0_0.codeMode = false
	var_0_0.antiSkinMode = true
else
	var_0_0.codeMode = true
	var_0_0.antiSkinMode = true
end

var_0_0.nameCodeMap = {}
var_0_0.nameEquipCodeMap = {}
var_0_0.nameCodeMap_EN = {
	IJN = "IRN"
}

function var_0_0.init()
	for iter_1_0, iter_1_1 in pairs(pg.name_code) do
		local var_1_0

		if iter_1_1.type == 1 then
			var_1_0 = var_0_0.nameCodeMap
		elseif iter_1_1.type == 2 then
			var_1_0 = var_0_0.nameEquipCodeMap
		else
			assert(false)
		end

		var_1_0[iter_1_1.name] = iter_1_1.code
	end

	if pg.gameset.code_switch.key_value == 1 and PlayerPrefs.HasKey(var_0_0.codeModeKey) then
		var_0_0.codeMode = PlayerPrefs.GetInt(var_0_0.codeModeKey) == 1
	end

	if PLATFORM_CODE == PLATFORM_CH then
		local var_1_1

		if IsUnityEditor then
			var_1_1 = PathMgr.getAssetBundle("../localization.txt")
		else
			var_1_1 = Application.persistentDataPath .. "/localization.txt"
		end

		if PathMgr.FileExists(var_1_1) then
			local var_1_2 = PathMgr.ReadAllLines(var_1_1)

			if string.gsub(var_1_2[0], "%w+%s*=%s*", "") == "true" then
				var_0_0.codeMode = true
			end

			local var_1_3 = "Localization_skin = false"

			if var_1_2.Length <= 1 then
				local var_1_4 = {
					var_1_2[0],
					var_1_3
				}

				System.IO.File.WriteAllLines(var_1_1, var_1_4)
			else
				var_1_3 = var_1_2[1]
			end

			if string.gsub(var_1_3, "[_%w]+%s*=%s*", "") == "true" then
				var_0_0.antiSkinMode = true
			end
		else
			System.IO.File.WriteAllText(var_1_1, "Localization = false\nLocalization_skin = false")
		end
	end

	var_0_0.update()
end

function var_0_0.calcLocalizationUse()
	if PLATFORM_CODE == PLATFORM_CH then
		local var_2_0 = "localization_use"

		if PlayerPrefs.HasKey(var_2_0) then
			PlayerPrefs.DeleteKey(var_2_0)
		end

		local var_2_1 = pg.TimeMgr.GetInstance()
		local var_2_2 = getProxy(PlayerProxy):getData().id
		local var_2_3 = "localization_time_1_" .. var_2_2
		local var_2_4 = PlayerPrefs.GetInt(var_2_3, 0)

		if var_0_0.codeMode and not var_2_1:IsSameDay(var_2_4, var_2_1:GetServerTime()) then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = CC_TYPE_99
			})
			PlayerPrefs.SetInt(var_2_3, var_2_1:GetServerTime())
		end

		local var_2_5 = "localization_time_2_" .. var_2_2
		local var_2_6 = PlayerPrefs.GetInt(var_2_5, 0)

		if var_0_0.antiSkinMode and not var_2_1:IsSameDay(var_2_6, var_2_1:GetServerTime()) then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = CC_TYPE_100
			})
			PlayerPrefs.SetInt(var_2_5, var_2_1:GetServerTime())
		end
	end
end

function var_0_0.switchCodeMode()
	if pg.gameset.code_switch.key_value == 1 or var_0_0.codeMode then
		var_0_0.codeMode = not var_0_0.codeMode

		PlayerPrefs.SetInt(var_0_0.codeModeKey, var_0_0.codeMode and 1 or 0)
		PlayerPrefs.Save()
		var_0_0.update()
		originalPrint("anti hx mode: " .. (var_0_0.codeMode and "on" or "off"))
	end
end

function var_0_0.isHXNation(arg_4_0)
	var_0_0.nationHX = var_0_0.nationHX or {
		[Nation.US] = true,
		[Nation.JP] = true,
		[Nation.DE] = true,
		[Nation.CN] = true,
		[Nation.ITA] = true,
		[Nation.SN] = true,
		[Nation.MNF] = true,
		[Nation.META] = true
	}

	return var_0_0.nationHX[arg_4_0]
end

function var_0_0.update()
	local var_5_0 = var_0_0.codeMode and {} or var_0_0.nameCodeMap
	local var_5_1 = var_0_0.codeMode and {} or var_0_0.nameEquipCodeMap
	local var_5_2 = var_0_0.codeMode and {} or var_0_0.nameCodeMap_EN
	local var_5_3 = pg.ship_data_statistics

	pg.ship_data_statistics = setmetatable({}, {
		__index = function(arg_6_0, arg_6_1)
			local var_6_0 = var_5_3[arg_6_1]

			if var_6_0 == nil then
				return var_6_0
			elseif var_6_0.name == nil then
				arg_6_0[arg_6_1] = var_6_0

				return arg_6_0[arg_6_1]
			end

			arg_6_0[arg_6_1] = {}

			if var_0_0.isHXNation(var_6_0.nationality) and var_5_0[var_6_0.name] then
				arg_6_0[arg_6_1].name = var_5_0[var_6_0.name]
			end

			if var_6_0.english_name and #var_6_0.english_name > 0 then
				arg_6_0[arg_6_1].english_name = var_6_0.english_name

				for iter_6_0, iter_6_1 in pairs(var_5_2) do
					arg_6_0[arg_6_1].english_name = string.gsub(arg_6_0[arg_6_1].english_name or "", iter_6_0, iter_6_1)
				end
			end

			setmetatable(arg_6_0[arg_6_1], {
				__index = var_6_0
			})

			return arg_6_0[arg_6_1]
		end
	})

	local var_5_4 = pg.fleet_tech_ship_class

	pg.fleet_tech_ship_class = setmetatable({}, {
		__index = function(arg_7_0, arg_7_1)
			local var_7_0 = var_5_4[arg_7_1]

			if var_7_0 == nil then
				return var_7_0
			elseif var_7_0.name == nil then
				arg_7_0[arg_7_1] = var_7_0

				return arg_7_0[arg_7_1]
			end

			local var_7_1, var_7_2 = string.gsub(var_7_0.name, "级", "")

			if var_0_0.isHXNation(var_7_0.nation) and var_5_0[var_7_1] then
				arg_7_0[arg_7_1] = setmetatable({
					name = var_5_0[var_7_1] .. (var_7_2 > 0 and "级" or "")
				}, {
					__index = var_7_0
				})
			else
				arg_7_0[arg_7_1] = var_7_0
			end

			return arg_7_0[arg_7_1]
		end
	})

	local var_5_5 = pg.enemy_data_statistics

	pg.enemy_data_statistics = setmetatable({}, {
		__index = function(arg_8_0, arg_8_1)
			local var_8_0 = var_5_5[arg_8_1]

			if var_8_0 == nil then
				return var_8_0
			elseif var_8_0.name == nil then
				arg_8_0[arg_8_1] = var_8_0

				return arg_8_0[arg_8_1]
			end

			if var_0_0.isHXNation(var_8_0.nationality) and var_5_0[var_8_0.name] then
				arg_8_0[arg_8_1] = setmetatable({
					name = var_5_0[var_8_0.name]
				}, {
					__index = var_8_0
				})
			else
				arg_8_0[arg_8_1] = var_8_0
			end

			return arg_8_0[arg_8_1]
		end
	})

	local var_5_6 = pg.equip_data_statistics

	pg.equip_data_statistics = setmetatable({}, {
		__index = function(arg_9_0, arg_9_1)
			local var_9_0 = var_5_6[arg_9_1]

			if var_9_0 == nil then
				return var_9_0
			elseif var_9_0.name == nil then
				arg_9_0[arg_9_1] = var_9_0

				return arg_9_0[arg_9_1]
			end

			if var_5_1[var_9_0.name] then
				arg_9_0[arg_9_1] = setmetatable({
					name = var_5_1[var_9_0.name]
				}, {
					__index = var_9_0
				})
			else
				arg_9_0[arg_9_1] = var_9_0
			end

			return arg_9_0[arg_9_1]
		end
	})

	local var_5_7 = pg.island_unit_character

	pg.island_unit_character = setmetatable({}, {
		__index = function(arg_10_0, arg_10_1)
			local var_10_0 = var_5_7[arg_10_1]

			if var_10_0 == nil then
				return var_10_0
			elseif var_10_0.name == nil then
				arg_10_0[arg_10_1] = var_10_0

				return arg_10_0[arg_10_1]
			end

			arg_10_0[arg_10_1] = {}

			if var_5_0[var_10_0.name] then
				arg_10_0[arg_10_1].name = var_5_0[var_10_0.name]
			end

			setmetatable(arg_10_0[arg_10_1], {
				__index = var_10_0
			})

			return arg_10_0[arg_10_1]
		end
	})
end

function var_0_0.hxLan(arg_11_0, arg_11_1)
	return string.gsub(arg_11_0 or "", "{namecode:(%d+).-}", function(arg_12_0)
		local var_12_0 = pg.name_code[tonumber(arg_12_0)]

		return var_12_0 and ((var_0_0.codeMode or arg_11_1) and var_12_0.name or var_12_0.code)
	end)
end

function var_0_0.isHx()
	return not var_0_0.codeMode
end

function var_0_0.isHxSkin()
	return not var_0_0.antiSkinMode
end

function var_0_0.isHxPropose()
	return not var_0_0.codeMode and PLATFORM_CODE == PLATFORM_CH and LOCK_PROPOSE_SHIP
end

var_0_0.hxPathList = {
	"live2d",
	"painting",
	"shipYardIcon",
	"paintingface",
	"char",
	"shipmodels",
	"technologycard",
	"shipdesignicon",
	"herohrzicon",
	"skinunlockanim"
}
var_0_0.folderBundle = {
	"paintingface"
}

function var_0_0.needShift(arg_16_0)
	for iter_16_0, iter_16_1 in ipairs(var_0_0.hxPathList) do
		if string.find(arg_16_0, iter_16_1) then
			return true
		end
	end

	return false
end

function var_0_0.isFolderBundle(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(var_0_0.folderBundle) do
		if string.find(arg_17_0, iter_17_1) then
			return true
		end
	end

	return false
end

function var_0_0.autoHxShift(arg_18_0, arg_18_1)
	if var_0_0.isHx() then
		if string.find(arg_18_0, "live2d") then
			if checkABExist(arg_18_0 .. arg_18_1 .. "_hx") then
				return arg_18_0, arg_18_1 .. "_hx"
			elseif pg.l2dhx[arg_18_1] then
				return arg_18_0, arg_18_1 .. "_hx"
			end
		end

		if var_0_0.needShift(arg_18_0) then
			local var_18_0 = arg_18_0 .. arg_18_1

			if checkABExist(var_18_0 .. "_hx") then
				return arg_18_0, arg_18_1 .. "_hx"
			end
		end
	end

	return arg_18_0, arg_18_1
end

function var_0_0.autoHxShiftPath(arg_19_0, arg_19_1, arg_19_2)
	if var_0_0.isHx() then
		if string.find(arg_19_0, "live2d") then
			if arg_19_2 then
				local var_19_0 = string.gsub(arg_19_0, "live2d/", "")

				if pg.l2dhx[var_19_0] then
					return arg_19_0 .. "_hx"
				end
			elseif checkABExist(arg_19_0 .. "_hx") then
				return arg_19_0 .. "_hx"
			else
				local var_19_1 = string.gsub(arg_19_0, "live2d/", "")

				if pg.l2dhx[var_19_1] then
					return arg_19_0 .. "_hx"
				end
			end
		end

		if var_0_0.needShift(arg_19_0) and checkABExist(arg_19_0 .. "_hx") then
			if var_0_0.isFolderBundle(arg_19_0) then
				return arg_19_0 .. "_hx", arg_19_1
			elseif arg_19_1 and #arg_19_1 > 0 then
				return arg_19_0 .. "_hx", arg_19_1 .. "_hx"
			else
				return arg_19_0 .. "_hx", arg_19_1
			end
		end
	end

	return arg_19_0, arg_19_1
end

var_0_0.init()
