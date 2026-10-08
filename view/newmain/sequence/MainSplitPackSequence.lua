local var_0_0 = class("MainSplitPackSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	if not SplitPackHelper.Inst:IsSplitPackMode() then
		arg_1_1()

		return
	end

	local var_1_0 = pg.SplitPackDownloadMgr.GetInstance()

	if not var_1_0:ShouldShowTip() then
		arg_1_1()

		return
	end

	var_1_0:MarkTipShown()

	local var_1_1 = HashUtil.BytesToString(var_1_0:GetTotalSize())

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		hideClose = true,
		content = i18n("auto_download_tip", var_1_1),
		noText = pg.MsgboxMgr.TEXT_CONFIRM,
		onNo = arg_1_1,
		yesText = i18n("auto_download_btn"),
		onYes = function()
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SETTINGS, {
				page = NewSettingsScene.PAGE_RES
			})
		end
	})
end

return var_0_0
