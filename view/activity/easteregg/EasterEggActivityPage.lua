local var_0_0 = class("EasterEggActivityPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	onButton(arg_1_0, arg_1_0.uiRewardBtn, function()
		return
	end, SFX_PANEL)
	setText(arg_1_0.uiComplateText, i18n("easter_egg_complate"))
	setText(arg_1_0.uiTipsText, i18n("easter_egg_tips"))
end

function var_0_0.OnFirstFlush(arg_3_0)
	for iter_3_0 = 1, arg_3_0:GetMaxBtnCnt() do
		onButton(arg_3_0, arg_3_0[string.format("uiBtn%s", iter_3_0)], function()
			local var_4_0 = getProxy(ActivityProxy):getActivityById(arg_3_0.activity.id)
			local var_4_1 = pg.activity_event_picturepuzzle[arg_3_0.activity.id].pickup_picturepuzzle[iter_3_0]

			if table.contains(var_4_0.data2_list, var_4_1) then
				arg_3_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
					viewComponent = EasterEggPopScene,
					mediator = EasterEggPopMediator,
					data = {
						id = var_4_1
					}
				}))
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					content = pg.activity_secret_template[var_4_1].page
				})
			end
		end, SFX_PANEL)
	end

	onButton(arg_3_0, arg_3_0.uiRewardBtn, function()
		local var_5_0 = getProxy(ActivityProxy):getActivityById(arg_3_0.activity.id)

		arg_3_0:emit(EasterEggView.ON_CLICK_EASTER_EGG, {
			actId = var_5_0.id,
			cmd = PuzzleActivity.CMD_COMPLETE
		})
	end, SFX_PANEL)
	arg_3_0:RefreshBtnState()
end

function var_0_0.OnUpdateFlush(arg_6_0)
	arg_6_0:RefreshBtnState()
end

function var_0_0.RefreshBtnState(arg_7_0)
	local var_7_0 = getProxy(ActivityProxy):getActivityById(arg_7_0.activity.id)
	local var_7_1 = pg.activity_event_picturepuzzle[arg_7_0.activity.id]

	for iter_7_0 = 1, arg_7_0:GetMaxBtnCnt() do
		local var_7_2 = var_7_1.pickup_picturepuzzle[iter_7_0]
		local var_7_3 = table.contains(var_7_0.data2_list, var_7_2)

		setActive(findTF(arg_7_0[string.format("uiBtn%s", iter_7_0)], "Image"), var_7_3)
		setActive(findTF(arg_7_0[string.format("uiBtn%s", iter_7_0)], "lockImage"), not var_7_3)
	end

	local var_7_4 = #var_7_0.data2_list >= #var_7_1.pickup_picturepuzzle

	setActive(arg_7_0.uiComplateImage, var_7_4)
	setGray(arg_7_0.uiRewardIcon, not var_7_4)
	setButtonEnabled(arg_7_0.uiRewardBtn, var_7_4)
	setText(arg_7_0.uiCntText, string.format("<color=#ce659f>%s</color>/%s", #var_7_0.data2_list, arg_7_0:GetMaxBtnCnt()))
end

function var_0_0.GetMaxBtnCnt(arg_8_0)
	return #pg.activity_event_picturepuzzle[arg_8_0.activity.id].pickup_picturepuzzle
end

return var_0_0
