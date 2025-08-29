local var_0_0 = class("SettingsOtherGraphicsPanle", import(".SettingsBasePanel"))

var_0_0.EVT_UPDTAE = "SettingsOtherGraphicsPanle:EVT_UPDTAE"

local var_0_1
local var_0_2
local var_0_3
local var_0_4

function var_0_0.GetUIName(arg_1_0)
	return "GraphicSettingsOther"
end

function var_0_0.GetTitle(arg_2_0)
	return i18n("grapihcs3d_setting_universal")
end

function var_0_0.GetTitleEn(arg_3_0)
	return "  / STANDBY MODE SETTINGS"
end

function var_0_0.OnInit(arg_4_0)
	var_0_1 = GraphicSettingConst.SettingType
	var_0_2 = GraphicSettingConst.assetPath
	var_0_3 = GraphicSettingConst.settings
	var_0_4 = GraphicSettingConst.SettingLevel
	arg_4_0.init = true
	arg_4_0.uilist = UIItemList.New(arg_4_0._tf:Find("options"), arg_4_0._tf:Find("options/notify_tpl"))

	arg_4_0.uilist:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateItem(arg_5_1 + 1, arg_5_2)
		end
	end)
end

function var_0_0.JumpToCustomSetting(arg_6_0, arg_6_1)
	if arg_6_0.graphicLevel == var_0_4.Custom then
		return
	end

	arg_6_0:SetPlayerPrefSetting(arg_6_1)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGraphics(4))
	PlayerPrefs.SetInt("dorm3d_graphics_settings_new", 4)
	pg.m02:sendNotification(NewSettingsMediator.SelectCustomGraphicSetting)
end

function var_0_0.UpdateItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.list[arg_7_1]
	local var_7_1 = arg_7_2:Find("mask/Text")

	setText(var_7_1, i18n(var_7_0.settingName))

	local var_7_2 = var_7_0.settingType == var_0_1.toggle
	local var_7_3 = arg_7_2:Find("toggle")
	local var_7_4 = arg_7_2:Find("select")

	setActive(var_7_3, var_7_2)
	setActive(var_7_4, not var_7_2)

	if var_7_2 then
		local function var_7_5(arg_8_0)
			local var_8_0 = arg_8_0 and 1 or 0

			PlayerPrefs.SetInt(var_7_0.playerPrefsname, var_8_0)
		end

		local var_7_6 = arg_7_2:Find("toggle/off")
		local var_7_7 = arg_7_2:Find("toggle/on")
		local var_7_8

		local function var_7_9(arg_9_0)
			var_7_8 = arg_9_0

			SetActive(var_7_6:Find("show"), not arg_9_0)
			SetActive(var_7_7:Find("show"), arg_9_0)
		end

		onButton(arg_7_0, var_7_7, function()
			if var_7_8 == true then
				return
			end

			if var_7_0.tips then
				local var_10_0 = {}

				table.insert(var_10_0, function(arg_11_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_NORMAL,
						content = i18n(var_7_0.tips),
						onYes = function()
							arg_11_0()
						end,
						onNo = function()
							return
						end
					})
				end)
				seriesAsync(var_10_0, function()
					var_7_9(true)
					var_7_5(true)
					arg_7_0:JumpToCustomSetting(var_7_0)
				end)
			else
				var_7_9(true)
				var_7_5(true)

				if arg_7_0.customSetting and var_7_0.hasChild then
					pg.m02:sendNotification(NewSettingsMediator.SelectCustomGraphicSetting)

					return
				end

				arg_7_0:JumpToCustomSetting(var_7_0)
			end
		end, SFX_CANCEL)
		onButton(arg_7_0, var_7_6, function()
			if var_7_8 == false then
				return
			end

			var_7_9(false)
			var_7_5(false)

			if arg_7_0.customSetting and var_7_0.hasChild then
				pg.m02:sendNotification(NewSettingsMediator.SelectCustomGraphicSetting)

				return
			end

			arg_7_0:JumpToCustomSetting(var_7_0)
		end, SFX_CANCEL)

		local var_7_10
		local var_7_11 = arg_7_0.graphicLevel == var_0_4.Custom and PlayerPrefs.GetInt(var_7_0.playerPrefsname, -1) or nil

		if not var_7_11 or var_7_11 == -1 then
			var_7_11 = var_7_0.defaultValues[arg_7_0.graphicLevel]
		end

		var_7_9(var_7_11 == 1 or var_7_11 == true)
	else
		local var_7_12
		local var_7_13 = arg_7_0.graphicLevel == var_0_4.Custom and PlayerPrefs.GetInt(var_7_0.playerPrefsname, -1) or nil

		if not var_7_13 or var_7_13 == -1 then
			var_7_13 = var_7_0.defaultValues[arg_7_0.graphicLevel]
		end

		for iter_7_0, iter_7_1 in ipairs(var_7_0.options) do
			if iter_7_1 == var_7_13 then
				var_7_12 = iter_7_0
			end
		end

		local function var_7_14()
			local var_16_0 = var_7_12 == 1
			local var_16_1 = var_7_12 == #var_7_0.optionNames

			setActive(var_7_4:Find("leftbu"), not var_16_0)
			setActive(var_7_4:Find("rightbu"), not var_16_1)
			setText(var_7_4:Find("Text"), i18n(var_7_0.optionNames[var_7_12]))
		end

		var_7_14()
		onButton(arg_7_0, var_7_4:Find("leftbu"), function()
			var_7_12 = var_7_12 - 1

			var_7_14()
			PlayerPrefs.SetInt(var_7_0.playerPrefsname, var_7_0.options[var_7_12])
			arg_7_0:JumpToCustomSetting(var_7_0)
		end)
		onButton(arg_7_0, var_7_4:Find("rightbu"), function()
			var_7_12 = var_7_12 + 1

			var_7_14()
			PlayerPrefs.SetInt(var_7_0.playerPrefsname, var_7_0.options[var_7_12])
			arg_7_0:JumpToCustomSetting(var_7_0)
		end)
	end
end

function var_0_0.SetPlayerPrefSetting(arg_19_0, arg_19_1)
	if arg_19_0.graphicLevel == var_0_4.Custom then
		return
	end

	for iter_19_0, iter_19_1 in ipairs(var_0_3) do
		if arg_19_1.playerPrefsname ~= iter_19_1.playerPrefsname then
			local var_19_0 = iter_19_1.defaultValues[arg_19_0.graphicLevel]

			if iter_19_1.settingType == var_0_1.toggle then
				local var_19_1 = var_19_0 and 1 or 0

				PlayerPrefs.SetInt(iter_19_1.playerPrefsname, var_19_1)
			else
				local var_19_2

				for iter_19_2, iter_19_3 in ipairs(iter_19_1.options) do
					if iter_19_3 == var_19_0 then
						var_19_2 = iter_19_2
					end
				end

				PlayerPrefs.SetInt(iter_19_1.playerPrefsname, iter_19_1.options[var_19_2])
			end
		end
	end
end

function var_0_0.OnUpdate(arg_20_0)
	if not arg_20_0.init then
		return
	end

	arg_20_0.playerSettingPlaySet = {}
	arg_20_0.graphicLevel = PlayerPrefs.GetInt("dorm3d_graphics_settings_new", 4)
	arg_20_0.customSetting = arg_20_0.graphicLevel == 4

	local var_20_0 = var_0_2[arg_20_0.graphicLevel]

	arg_20_0.list = arg_20_0:GetList()

	arg_20_0.uilist:align(#arg_20_0.list)
end

function var_0_0.RefreshPanelByGraphcLevel(arg_21_0)
	arg_21_0:OnUpdate()
end

function var_0_0.GetList(arg_22_0)
	local var_22_0 = {}

	local function var_22_1(arg_23_0)
		local var_23_0 = arg_22_0:GetParentSetting(arg_23_0.parentId)
		local var_23_1 = false

		if var_23_0 then
			local var_23_2 = arg_22_0.customSetting and PlayerPrefs.GetInt(var_23_0.playerPrefsname, -1) or nil

			if not var_23_2 or var_23_2 == -1 then
				var_23_2 = var_23_0.defaultValues[arg_22_0.graphicLevel]
			end

			var_23_1 = var_23_2 == 0
		end

		return not (arg_23_0.isShow == 0 or var_23_1)
	end

	for iter_22_0, iter_22_1 in ipairs(var_0_3) do
		if var_22_1(iter_22_1) then
			table.insert(var_22_0, iter_22_1)
		end
	end

	return var_22_0
end

function var_0_0.GetParentSetting(arg_24_0, arg_24_1)
	if not arg_24_1 then
		return
	end

	for iter_24_0, iter_24_1 in ipairs(var_0_3) do
		if iter_24_0 == arg_24_1 then
			iter_24_1.hasChild = true

			return iter_24_1
		end
	end

	return nil
end

return var_0_0
