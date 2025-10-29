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

	local var_2_0 = arg_2_1.isDel or false

	arg_2_0.delBtn = findTF(arg_2_0._tf, "DelBtn")

	setActive(arg_2_0.delBtn, var_2_0)

	local var_2_1 = arg_2_0.delBtn:Find("Text")

	setText(var_2_1, i18n("resource_clear_generaltext"))

	local var_2_2 = arg_2_0._tf:Find("BG")
	local var_2_3 = arg_2_0._tf:Find("BGDel")

	setActive(var_2_2, not var_2_0)
	setActive(var_2_3, var_2_0)

	local var_2_4 = arg_2_0._tf:Find("status")
	local var_2_5 = arg_2_0._tf:Find("version")

	setAnchoredPosition(var_2_4, var_2_0 and {
		y = -106
	} or {
		y = -135
	})
	setAnchoredPosition(var_2_5, var_2_0 and {
		y = -160
	} or {
		y = -198
	})
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
		local var_4_1 = pg.SettingsGroupMgr.GetInstance():GetState(var_4_0)

		if arg_3_0:isNeedUpdate() and var_4_1 ~= pg.SettingsGroupMgr.State.Updating then
			local var_4_2 = {
				var_4_0
			}
			local var_4_3 = pg.SettingsGroupMgr.GetInstance():GetTotalSize(var_4_2)
			local var_4_4 = HashUtil.BytesToString(var_4_3)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_NORMAL,
				content = string.format(i18n("group_download_tip", var_4_4)),
				onYes = function()
					pg.SettingsGroupMgr.GetInstance():StartDownload(var_4_0, var_4_2)
				end
			})
		end
	end, SFX_PANEL)

	if isActive(arg_3_0.delBtn) then
		onButton(arg_3_0, arg_3_0.delBtn, function()
			local var_6_0 = arg_3_0:GetDownloadGroup()
			local var_6_1 = GroupHelper.GetGroupMgrByName(var_6_0)
			local var_6_2 = HashUtil.BytesToString(var_6_1:GetAllCacheFileSize())
			local var_6_3 = arg_3_0:getDelTipName()
			local var_6_4 = i18n(var_6_3, var_6_2)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_CONFIRM,
				content = var_6_4,
				onYes = function()
					GroupHelper.SetGroupPrefsByName(var_6_0, DMFileChecker.Prefs.Min)

					local var_7_0 = HotfixHelper.GetAllShortPathArrInGroup(var_6_0)

					if var_7_0 and var_7_0.Length > 0 then
						HotfixHelper.DeleteFileByShortPathArr(var_6_0, var_7_0)
					end
				end
			})
		end, SFX_PANEL)
	end

	arg_3_0:Check()
end

function var_0_0.InitPrefsBar(arg_8_0)
	arg_8_0.prefsBar = findTF(arg_8_0._tf, "PrefsBar")

	setText(findTF(arg_8_0.prefsBar, "Text"), i18n("setting_group_prefs_tip"))
	setActive(arg_8_0.prefsBar, true)

	local var_8_0 = arg_8_0:GetDownloadGroup()

	arg_8_0.hideTip = true

	onToggle(arg_8_0, arg_8_0.prefsBar, function(arg_9_0)
		if Live2dConst.GetLive2DArm32MatchAble() then
			if arg_9_0 then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_8_0.prefsBar, false)
			end

			return
		end

		if arg_9_0 == true then
			GroupHelper.SetGroupPrefsByName(var_8_0, DMFileChecker.Prefs.Max)
		else
			GroupHelper.SetGroupPrefsByName(var_8_0, DMFileChecker.Prefs.Min)
		end

		if not arg_8_0.hideTip then
			pg.TipsMgr.GetInstance():ShowTips(i18n("group_prefs_switch_tip"))
		end
	end, SFX_PANEL)
	triggerToggle(arg_8_0.prefsBar, GroupHelper.GetGroupPrefsByName(var_8_0) == DMFileChecker.Prefs.Max)

	arg_8_0.hideTip = false
end

function var_0_0.Check(arg_10_0)
	arg_10_0.timer = Timer.New(function()
		arg_10_0:UpdateDownLoadState()
	end, 0.5, -1)

	arg_10_0.timer:Start()
	arg_10_0:UpdateDownLoadState()
end

function var_0_0.UpdateDownLoadState(arg_12_0)
	local var_12_0 = arg_12_0:GetDownloadGroup()
	local var_12_1 = BundleWizard.Inst:GetGroupMgr(var_12_0)
	local var_12_2
	local var_12_3
	local var_12_4
	local var_12_5
	local var_12_6
	local var_12_7 = false
	local var_12_8 = pg.SettingsGroupMgr.GetInstance():GetState(var_12_0)
	local var_12_9
	local var_12_10
	local var_12_11

	if IsUnityEditor then
		var_12_9 = 1
		var_12_11 = 1
	else
		var_12_9 = tonumber(var_12_1.localVersion.Build)
		var_12_11 = tonumber(var_12_1.serverVersion.Build)
	end

	if var_12_8 == pg.SettingsGroupMgr.State.None then
		if var_12_9 < var_12_11 then
			var_12_3 = i18n("word_maingroup_checktoupdate")
			var_12_4 = string.format("V.%d > V.%d", var_12_9, var_12_11)
			var_12_6 = true
		else
			var_12_3 = i18n("word_maingroup_updatesuccess")
			var_12_4 = string.format("V.%d", var_12_1.CurrentVersion.Build)
			var_12_6 = false
		end

		var_12_5 = 0
		var_12_7 = false
	elseif var_12_8 == pg.SettingsGroupMgr.State.Updating then
		local var_12_12, var_12_13 = pg.SettingsGroupMgr.GetInstance():GetCountProgress(var_12_0)

		var_12_3 = i18n("word_maingroup_updating")
		var_12_4 = string.format("(%d/%d)", var_12_12, var_12_13)
		var_12_5 = var_12_12 / math.max(var_12_13, 1)
		var_12_6 = false
		var_12_7 = true
	elseif var_12_8 == pg.SettingsGroupMgr.State.Success then
		var_12_3 = i18n("word_maingroup_updatesuccess")
		var_12_4 = "V." .. var_12_1.CurrentVersion.Build
		var_12_5 = 1
		var_12_6 = false
		var_12_7 = false
	elseif var_12_8 == pg.SettingsGroupMgr.State.Fail then
		var_12_3 = i18n("word_maingroup_updatefailure")

		if var_12_9 < var_12_11 then
			var_12_4 = string.format("V.%d > V.%d", var_12_9, var_12_11)
		else
			var_12_4 = string.format("V.%d", var_12_1.CurrentVersion.Build)
		end

		var_12_5 = 0
		var_12_6 = true
		var_12_7 = false
	end

	setText(arg_12_0.loadInfo1, var_12_3)
	setText(arg_12_0.loadInfo2, var_12_4)
	setSlider(arg_12_0.loadProgress, 0, 1, var_12_5)
	setActive(arg_12_0.loadProgressHandle, var_12_5 ~= 0 and var_12_5 ~= 1)
	setActive(arg_12_0.loadDot, var_12_6)
	setActive(arg_12_0.loadLoading, var_12_7)
	setActive(arg_12_0.loadLabelNew, var_12_9 < var_12_11)
end

function var_0_0.Dispose(arg_13_0)
	pg.DelegateInfo.Dispose(arg_13_0)

	if arg_13_0.timer then
		arg_13_0.timer:Stop()

		arg_13_0.timer = nil
	end
end

function var_0_0.GetDownloadGroup(arg_14_0)
	assert(false, "overwrite me !!!")
end

function var_0_0.GetTitle(arg_15_0)
	assert(false, "overwrite me !!!")
end

function var_0_0.isNeedUpdate(arg_16_0)
	if IsUnityEditor then
		return false
	end

	local var_16_0 = arg_16_0:GetDownloadGroup()
	local var_16_1 = BundleWizard.Inst:GetGroupMgr(var_16_0)

	return tonumber(var_16_1.localVersion.Build) < tonumber(var_16_1.serverVersion.Build)
end

function var_0_0.getDelTipName(arg_17_0)
	return ({
		DORM = "resource_clear_3ddorm",
		GALLERY_PIC = "resource_clear_gallery",
		MANGA = "resource_clear_manga",
		MAP = "resource_clear_3disland"
	})[arg_17_0:GetDownloadGroup()]
end

return var_0_0
