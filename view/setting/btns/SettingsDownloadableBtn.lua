local var_0_0 = class("SettingsDownloadableBtn")

function var_0_0.InitTpl(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.tpl
	local var_1_1 = arg_1_1.container
	local var_1_2 = arg_1_1.iconSP

	arg_1_0._tf = cloneTplTo(var_1_0, var_1_1, arg_1_0:GetDownloadGroup())
	arg_1_0._go = arg_1_0._tf.gameObject

	setImageSprite(arg_1_0._tf:Find("icon"), var_1_2)
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0:InitTpl(arg_2_1)
	pg.DelegateInfo.New(arg_2_0)

	arg_2_0.loadProgress = findTF(arg_2_0._tf, "progress")
	arg_2_0.loadProgressHandle = findTF(arg_2_0._tf, "progress/handle")
	arg_2_0.loadInfo1 = findTF(arg_2_0._tf, "status")
	arg_2_0.loadInfo2 = findTF(arg_2_0._tf, "version")
	arg_2_0.loadLabelNew = findTF(arg_2_0._tf, "version/new")
	arg_2_0.loadDot = findTF(arg_2_0._tf, "new")
	arg_2_0.loadLoading = findTF(arg_2_0._tf, "loading")

	setText(arg_2_0._tf:Find("title"), arg_2_0:GetTitle())
	arg_2_0:Init()
	arg_2_0:InitPrefsBar()
end

function var_0_0.Init(arg_3_0)
	setSlider(arg_3_0.loadProgress, 0, 1, 0)
	setActive(arg_3_0.loadDot, false)
	setActive(arg_3_0.loadLoading, false)
	onButton(arg_3_0, arg_3_0._tf, function()
		if Live2dConst.GetLive2DArm32MatchAble() then
			Live2dConst.ShowLive2DArm32Tips()

			return
		end

		local var_4_0 = arg_3_0:GetDownloadGroup()
		local var_4_1 = pg.SettingsGroupMgr:GetInstance():GetState(var_4_0)

		if arg_3_0:isNeedUpdate() and var_4_1 ~= pg.SettingsGroupMgr.State.Updating then
			local var_4_2 = {
				var_4_0
			}
			local var_4_3 = pg.SettingsGroupMgr:GetInstance():GetTotalSize(var_4_2)
			local var_4_4 = HashUtil.BytesToString(var_4_3)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_NORMAL,
				content = string.format(i18n("group_download_tip", var_4_4)),
				onYes = function()
					pg.SettingsGroupMgr:GetInstance():StartDownload(var_4_0, var_4_2)
				end
			})
		end
	end, SFX_PANEL)
	arg_3_0:Check()
end

function var_0_0.InitPrefsBar(arg_6_0)
	arg_6_0.prefsBar = findTF(arg_6_0._tf, "PrefsBar")

	setText(findTF(arg_6_0.prefsBar, "Text"), i18n("setting_group_prefs_tip"))
	setActive(arg_6_0.prefsBar, true)

	local var_6_0 = arg_6_0:GetDownloadGroup()

	arg_6_0.hideTip = true

	onToggle(arg_6_0, arg_6_0.prefsBar, function(arg_7_0)
		if Live2dConst.GetLive2DArm32MatchAble() then
			if arg_7_0 then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_6_0.prefsBar, false)
			end

			return
		end

		if arg_7_0 == true then
			GroupHelper.SetGroupPrefsByName(var_6_0, DMFileChecker.Prefs.Max)
		else
			GroupHelper.SetGroupPrefsByName(var_6_0, DMFileChecker.Prefs.Min)
		end

		if not arg_6_0.hideTip then
			pg.TipsMgr.GetInstance():ShowTips(i18n("group_prefs_switch_tip"))
		end
	end, SFX_PANEL)
	triggerToggle(arg_6_0.prefsBar, GroupHelper.GetGroupPrefsByName(var_6_0) == DMFileChecker.Prefs.Max)

	arg_6_0.hideTip = false
end

function var_0_0.Check(arg_8_0)
	arg_8_0.timer = Timer.New(function()
		arg_8_0:UpdateDownLoadState()
	end, 0.5, -1)

	arg_8_0.timer:Start()
	arg_8_0:UpdateDownLoadState()
end

function var_0_0.UpdateDownLoadState(arg_10_0)
	local var_10_0 = arg_10_0:GetDownloadGroup()
	local var_10_1 = BundleWizard.Inst:GetGroupMgr(var_10_0)
	local var_10_2
	local var_10_3
	local var_10_4
	local var_10_5
	local var_10_6
	local var_10_7 = false
	local var_10_8 = pg.SettingsGroupMgr:GetInstance():GetState(var_10_0)
	local var_10_9
	local var_10_10
	local var_10_11

	if IsUnityEditor then
		var_10_9 = 1
		var_10_11 = 1
	else
		var_10_9 = tonumber(var_10_1.localVersion.Build)
		var_10_11 = tonumber(var_10_1.serverVersion.Build)
	end

	if var_10_8 == pg.SettingsGroupMgr.State.None then
		if var_10_9 < var_10_11 then
			var_10_3 = i18n("word_maingroup_checktoupdate")
			var_10_4 = string.format("V.%d > V.%d", var_10_9, var_10_11)
			var_10_6 = true
		else
			var_10_3 = i18n("word_maingroup_updatesuccess")
			var_10_4 = string.format("V.%d", var_10_1.CurrentVersion.Build)
			var_10_6 = false
		end

		var_10_5 = 0
		var_10_7 = false
	elseif var_10_8 == pg.SettingsGroupMgr.State.Updating then
		local var_10_12, var_10_13 = pg.SettingsGroupMgr:GetInstance():GetCountProgress(var_10_0)

		var_10_3 = i18n("word_maingroup_updating")
		var_10_4 = string.format("(%d/%d)", var_10_12, var_10_13)
		var_10_5 = var_10_12 / math.max(var_10_13, 1)
		var_10_6 = false
		var_10_7 = true
	elseif var_10_8 == pg.SettingsGroupMgr.State.Success then
		var_10_3 = i18n("word_maingroup_updatesuccess")
		var_10_4 = "V." .. var_10_1.CurrentVersion.Build
		var_10_5 = 1
		var_10_6 = false
		var_10_7 = false
	elseif var_10_8 == pg.SettingsGroupMgr.State.Fail then
		var_10_3 = i18n("word_maingroup_updatefailure")

		if var_10_9 < var_10_11 then
			var_10_4 = string.format("V.%d > V.%d", var_10_9, var_10_11)
		else
			var_10_4 = string.format("V.%d", var_10_1.CurrentVersion.Build)
		end

		var_10_5 = 0
		var_10_6 = true
		var_10_7 = false
	end

	setText(arg_10_0.loadInfo1, var_10_3)
	setText(arg_10_0.loadInfo2, var_10_4)
	setSlider(arg_10_0.loadProgress, 0, 1, var_10_5)
	setActive(arg_10_0.loadProgressHandle, var_10_5 ~= 0 and var_10_5 ~= 1)
	setActive(arg_10_0.loadDot, var_10_6)
	setActive(arg_10_0.loadLoading, var_10_7)
	setActive(arg_10_0.loadLabelNew, var_10_9 < var_10_11)
end

function var_0_0.Dispose(arg_11_0)
	pg.DelegateInfo.Dispose(arg_11_0)

	if arg_11_0.timer then
		arg_11_0.timer:Stop()

		arg_11_0.timer = nil
	end
end

function var_0_0.GetDownloadGroup(arg_12_0)
	assert(false, "overwrite me !!!")
end

function var_0_0.GetTitle(arg_13_0)
	assert(false, "overwrite me !!!")
end

function var_0_0.isNeedUpdate(arg_14_0)
	local var_14_0 = arg_14_0:GetDownloadGroup()
	local var_14_1 = BundleWizard.Inst:GetGroupMgr(var_14_0)

	return tonumber(var_14_1.localVersion.Build) < tonumber(var_14_1.serverVersion.Build)
end

return var_0_0
