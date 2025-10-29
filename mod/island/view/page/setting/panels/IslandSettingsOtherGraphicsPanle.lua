local var_0_0 = class("IslandSettingsOtherGraphicsPanle", import("view.Setting.panels.SettingsBasePanel"))

var_0_0.EVT_UPDTAE = "IslandSettingsOtherGraphicsPanle:EVT_UPDTAE"

local var_0_1
local var_0_2
local var_0_3
local var_0_4

function var_0_0.GetUIName(arg_1_0)
	return "IslandGraphicSettingsOther"
end

function var_0_0.GetTitle(arg_2_0)
	return i18n("grapihcs3d_setting_universal")
end

function var_0_0.GetTitleEn(arg_3_0)
	return "  / STANDBY MODE SETTINGS"
end

function var_0_0.InitTitle(arg_4_0)
	setText(arg_4_0._tf:Find("title/title_point/title_text"), arg_4_0:GetTitle())
end

function var_0_0.OnInit(arg_5_0)
	var_0_1 = GraphicSettingConst.SettingType
	var_0_2 = GraphicSettingConst.assetPath
	var_0_3 = GraphicSettingConst.settings
	var_0_4 = GraphicSettingConst.SettingLevel
	arg_5_0.init = true
	arg_5_0.uilist = UIItemList.New(arg_5_0._tf:Find("options"), arg_5_0._tf:Find("options/notify_tpl"))

	arg_5_0.uilist:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_5_0:UpdateItem(arg_6_1 + 1, arg_6_2)
		end
	end)
end

function var_0_0.JumpToCustomSetting(arg_7_0, arg_7_1)
	if arg_7_0.graphicLevel == var_0_4.Custom then
		return
	end

	arg_7_0:SetPlayerPrefSetting(arg_7_1)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGraphics(4))
	PlayerPrefs.SetInt(GraphicSettingConst.PlayerGraphicLevelIsland, 4)
	pg.m02:sendNotification(IslandSettingsPage.SELECTCUSTOMGRAPHICSETTING)
end

function var_0_0.UpdateItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.list[arg_8_1]
	local var_8_1 = arg_8_2:Find("mask/Text")

	setText(var_8_1, i18n(var_8_0.settingName))

	local var_8_2 = var_8_0.settingType == var_0_1.toggle
	local var_8_3 = arg_8_2:Find("toggle")
	local var_8_4 = arg_8_2:Find("select")

	setActive(var_8_3, var_8_2)
	setActive(var_8_4, not var_8_2)

	if var_8_2 then
		local function var_8_5(arg_9_0)
			local var_9_0 = arg_9_0 and 1 or 0

			PlayerPrefs.SetInt(var_8_0.playerPrefsname .. "island", var_9_0)
		end

		local var_8_6 = arg_8_2:Find("toggle/off")
		local var_8_7 = arg_8_2:Find("toggle/on")
		local var_8_8

		local function var_8_9(arg_10_0)
			var_8_8 = arg_10_0

			SetActive(var_8_6, not arg_10_0)
			SetActive(var_8_7, arg_10_0)
		end

		onButton(arg_8_0, var_8_6, function()
			if var_8_8 == true then
				return
			end

			if var_8_0.tips then
				local var_11_0 = {}

				table.insert(var_11_0, function(arg_12_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_NORMAL,
						content = i18n(var_8_0.tips),
						onYes = function()
							arg_12_0()
						end,
						onNo = function()
							return
						end
					})
				end)
				seriesAsync(var_11_0, function()
					var_8_9(true)
					var_8_5(true)
					arg_8_0:JumpToCustomSetting(var_8_0)
				end)
			else
				var_8_9(true)
				var_8_5(true)

				if arg_8_0.customSetting and var_8_0.hasChild then
					pg.m02:sendNotification(IslandSettingsPage.SELECTCUSTOMGRAPHICSETTING)

					return
				end

				arg_8_0:JumpToCustomSetting(var_8_0)
			end
		end, SFX_CANCEL)
		onButton(arg_8_0, var_8_7, function()
			if var_8_8 == false then
				return
			end

			var_8_9(false)
			var_8_5(false)

			if arg_8_0.customSetting and var_8_0.hasChild then
				pg.m02:sendNotification(IslandSettingsPage.SELECTCUSTOMGRAPHICSETTING)

				return
			end

			arg_8_0:JumpToCustomSetting(var_8_0)
		end, SFX_CANCEL)

		local var_8_10
		local var_8_11 = arg_8_0.graphicLevel == var_0_4.Custom and PlayerPrefs.GetInt(var_8_0.playerPrefsname .. "island", -1) or nil

		if not var_8_11 or var_8_11 == -1 then
			var_8_11 = var_8_0.defaultValues[arg_8_0.graphicLevel]
		end

		var_8_9(var_8_11 == 1 or var_8_11 == true)
	else
		local var_8_12
		local var_8_13 = arg_8_0.graphicLevel == var_0_4.Custom and PlayerPrefs.GetInt(var_8_0.playerPrefsname .. "island", -1) or nil

		if not var_8_13 or var_8_13 == -1 then
			var_8_13 = var_8_0.defaultValues[arg_8_0.graphicLevel]
		end

		for iter_8_0, iter_8_1 in ipairs(var_8_0.options) do
			if iter_8_1 == var_8_13 then
				var_8_12 = iter_8_0
			end
		end

		local function var_8_14()
			local var_17_0 = var_8_12 == 1
			local var_17_1 = var_8_12 == #var_8_0.optionNames

			setActive(var_8_4:Find("leftbu"), not var_17_0)
			setActive(var_8_4:Find("leftline"), var_17_0)
			setActive(var_8_4:Find("rightbu"), not var_17_1)
			setActive(var_8_4:Find("rightline"), var_17_1)
			setText(var_8_4:Find("Text"), i18n(var_8_0.optionNames[var_8_12]))
		end

		var_8_14()
		onButton(arg_8_0, var_8_4:Find("leftbu"), function()
			var_8_12 = var_8_12 - 1

			var_8_14()
			PlayerPrefs.SetInt(var_8_0.playerPrefsname .. "island", var_8_0.options[var_8_12])
			arg_8_0:JumpToCustomSetting(var_8_0)
		end)
		onButton(arg_8_0, var_8_4:Find("rightbu"), function()
			var_8_12 = var_8_12 + 1

			var_8_14()
			PlayerPrefs.SetInt(var_8_0.playerPrefsname .. "island", var_8_0.options[var_8_12])
			arg_8_0:JumpToCustomSetting(var_8_0)
		end)
	end
end

function var_0_0.SetPlayerPrefSetting(arg_20_0, arg_20_1)
	if arg_20_0.graphicLevel == var_0_4.Custom then
		return
	end

	for iter_20_0, iter_20_1 in ipairs(var_0_3) do
		if arg_20_1.playerPrefsname .. "island" ~= iter_20_1.playerPrefsname .. "island" then
			local var_20_0 = iter_20_1.defaultValues[arg_20_0.graphicLevel]

			if iter_20_1.settingType == var_0_1.toggle then
				local var_20_1 = var_20_0 and 1 or 0

				PlayerPrefs.SetInt(iter_20_1.playerPrefsname .. "island", var_20_1)
			else
				local var_20_2

				for iter_20_2, iter_20_3 in ipairs(iter_20_1.options) do
					if iter_20_3 == var_20_0 then
						var_20_2 = iter_20_2
					end
				end

				PlayerPrefs.SetInt(iter_20_1.playerPrefsname .. "island", iter_20_1.options[var_20_2])
			end
		end
	end
end

function var_0_0.OnUpdate(arg_21_0)
	if not arg_21_0.init then
		return
	end

	arg_21_0.playerSettingPlaySet = {}
	arg_21_0.graphicLevel = PlayerPrefs.GetInt(GraphicSettingConst.PlayerGraphicLevelIsland, 4)
	arg_21_0.customSetting = arg_21_0.graphicLevel == 4

	local var_21_0 = var_0_2[arg_21_0.graphicLevel]

	arg_21_0.list = arg_21_0:GetList()

	arg_21_0.uilist:align(#arg_21_0.list)
end

function var_0_0.RefreshPanelByGraphcLevel(arg_22_0)
	arg_22_0:OnUpdate()
end

function var_0_0.GetList(arg_23_0)
	local var_23_0 = {}

	local function var_23_1(arg_24_0)
		local var_24_0 = arg_23_0:GetParentSetting(arg_24_0.parentId)
		local var_24_1 = false

		if var_24_0 then
			local var_24_2 = arg_23_0.customSetting and PlayerPrefs.GetInt(var_24_0.playerPrefsname .. "island", -1) or nil

			if not var_24_2 or var_24_2 == -1 then
				var_24_2 = var_24_0.defaultValues[arg_23_0.graphicLevel]
			end

			var_24_1 = var_24_2 == 0
		end

		return not (arg_24_0.isShow == 0 or var_24_1)
	end

	for iter_23_0, iter_23_1 in ipairs(var_0_3) do
		if var_23_1(iter_23_1) then
			table.insert(var_23_0, iter_23_1)
		end
	end

	return var_23_0
end

function var_0_0.GetParentSetting(arg_25_0, arg_25_1)
	if not arg_25_1 then
		return
	end

	for iter_25_0, iter_25_1 in ipairs(var_0_3) do
		if iter_25_0 == arg_25_1 then
			iter_25_1.hasChild = true

			return iter_25_1
		end
	end

	return nil
end

return var_0_0
