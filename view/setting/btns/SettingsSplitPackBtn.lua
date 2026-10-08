local var_0_0 = class("SettingsSplitPackBtn")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.mgr = pg.SplitPackDownloadMgr.GetInstance()

	arg_1_0:findUI(arg_1_1)
	arg_1_0:addListener()
	arg_1_0:check()
end

function var_0_0.Dispose(arg_2_0)
	pg.DelegateInfo.Dispose(arg_2_0)
	arg_2_0:stopTimer()
end

function var_0_0.findUI(arg_3_0, arg_3_1)
	arg_3_0._tf = arg_3_1

	local var_3_0 = findTF(arg_3_0._tf, "MainGroup/Content")

	arg_3_0.progressBar = findTF(var_3_0, "Progress")
	arg_3_0.btn = findTF(var_3_0, "Btn")
	arg_3_0.btnText = findTF(arg_3_0.btn, "Text")
	arg_3_0.loadingIcon = findTF(var_3_0, "Status/Loading")
	arg_3_0.newIcon = findTF(var_3_0, "Status/New")
	arg_3_0.finishIcon = findTF(var_3_0, "Status/Finish")

	setText(findTF(arg_3_0._tf, "Title/Text"), i18n("setting_download_basic_assets"))
	setText(findTF(var_3_0, "Title"), i18n("setting_download_basic_assets"))
end

function var_0_0.addListener(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf, function()
		if arg_4_0.mgr:GetState() == pg.SplitPackDownloadMgr.State.Fail then
			arg_4_0.mgr:StartMainDownload()
			arg_4_0:updateUI()
		end
	end, SFX_PANEL)
end

function var_0_0.check(arg_6_0)
	arg_6_0.timer = Timer.New(function()
		arg_6_0:updateUI()
	end, 0.5, -1)

	arg_6_0.timer:Start()
	arg_6_0:updateUI()
end

function var_0_0.stopTimer(arg_8_0)
	if arg_8_0.timer then
		arg_8_0.timer:Stop()

		arg_8_0.timer = nil
	end
end

function var_0_0.updateUI(arg_9_0)
	local var_9_0 = arg_9_0.mgr:GetState()
	local var_9_1 = arg_9_0.mgr:IsDownloading()
	local var_9_2 = var_9_0 == pg.SplitPackDownloadMgr.State.Success
	local var_9_3 = arg_9_0.mgr:GetProgress()
	local var_9_4 = var_9_3 and var_9_3.successCount or 0
	local var_9_5 = var_9_3 and var_9_3.totalCount or 0

	setActive(arg_9_0.loadingIcon, var_9_1)
	setActive(arg_9_0.newIcon, false)
	setActive(arg_9_0.finishIcon, var_9_2)

	if var_9_5 > 0 then
		setSlider(arg_9_0.progressBar, 0, var_9_5, var_9_2 and var_9_5 or var_9_4)
		setText(arg_9_0.btnText, (var_9_2 and var_9_5 or var_9_4) .. "/" .. var_9_5)
	else
		setSlider(arg_9_0.progressBar, 0, 1, var_9_2 and 1 or 0)
		setText(arg_9_0.btnText, (var_9_2 and 1 or 0) .. "/" .. 1)
	end

	if var_9_0 == pg.SplitPackDownloadMgr.State.Fail then
		setText(arg_9_0.btnText, i18n("setting_restart_download_btn"))
	elseif var_9_0 == pg.SplitPackDownloadMgr.State.Success then
		setText(arg_9_0.btnText, i18n("word_maingroup_updatesuccess"))
	end

	if var_9_2 then
		arg_9_0:stopTimer()
	end
end

return var_0_0
