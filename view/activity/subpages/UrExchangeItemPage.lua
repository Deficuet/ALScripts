local var_0_0 = class("UrExchangeItemPage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.exchangeBtn = arg_1_0:findTF("AD/exchange")
	arg_1_0.exchangeTip = arg_1_0:findTF("AD/exchange/tip")
	arg_1_0.battleBtn = arg_1_0:findTF("AD/battle")
	arg_1_0.taskBtn = arg_1_0:findTF("AD/task")
	arg_1_0.progress = arg_1_0:findTF("AD/progress/Image")
	arg_1_0.progressTxt = arg_1_0:findTF("AD/Text"):GetComponent(typeof(Text))
	arg_1_0.itemTF = arg_1_0:findTF("AD/item")
	arg_1_0.helpBtn = arg_1_0:findTF("AD/help")
	arg_1_0.moreBtn = arg_1_0:findTF("AD/more")

	onButton(arg_1_0, arg_1_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.ur_exchange_help_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_1_0, arg_1_0.moreBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.ur_exchange_help_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_1_0, arg_1_0.exchangeBtn, function()
		local var_4_0 = getProxy(PlayerProxy):getRawData()
		local var_4_1, var_4_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_4_0.level, "FragmentShop")

		if not var_4_1 then
			pg.TipsMgr.GetInstance():ShowTips(var_4_2)

			return
		end

		arg_1_0:emit(ActivityMediator.GO_SHOPS_LAYER_STEEET, {
			warp = NewShopsScene.TYPE_FRAGMENT
		})
	end, SFX_PANEL)
	onButton(arg_1_0, arg_1_0.battleBtn, function()
		arg_1_0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(arg_1_0, arg_1_0.taskBtn, function()
		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
end

function var_0_0.OnFirstFlush(arg_7_0)
	local var_7_0 = pg.gameset.urpt_chapter_max.description
	local var_7_1 = var_7_0[1]
	local var_7_2 = var_7_0[2]
	local var_7_3 = getProxy(BagProxy):GetLimitCntById(var_7_1)

	arg_7_0.progressTxt.text = var_7_3 .. "/" .. var_7_2

	setFillAmount(arg_7_0.progress, var_7_3 / var_7_2)
	updateDrop(arg_7_0.itemTF, Drop.New({
		count = 0,
		type = DROP_TYPE_ITEM,
		id = var_7_1
	}))
	setActive(arg_7_0.exchangeTip, NotifyTipHelper.ShouldShowUrTip())
end

function var_0_0.OnUpdateFlush(arg_8_0)
	return
end

function var_0_0.OnDestroy(arg_9_0)
	return
end

return var_0_0
