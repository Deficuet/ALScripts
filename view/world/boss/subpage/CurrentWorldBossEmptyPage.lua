local var_0_0 = class("CurrentWorldBossEmptyPage", import(".BaseWorldBossEmptyPage"))

function var_0_0.getUIName(arg_1_0)
	return "CurrentWorldBossEmptyUI"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.timeTxt = arg_2_0._tf:Find("time/Text"):GetComponent(typeof(Text))

	local var_2_0 = WorldBossConst.GetCurrBossGroup() or ""

	arg_2_0:UpdateUseItemStyle(var_2_0)
end

function var_0_0.OnInit(arg_3_0)
	var_0_0.super.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.world_boss_help_meta.tip
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.progressTr, function()
		local var_5_0 = WorldBossConst.GetCurrBossItemInfo()

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			type = MSGBOX_TYPE_DROP_ITEM,
			name = var_5_0.name,
			content = var_5_0.display,
			iconPath = var_5_0.icon,
			frame = var_5_0.rarity
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("list_btn"), function()
		arg_3_0:emit(WorldBossScene.ON_SWITCH, WorldBossScene.PAGE_CHALLENGE)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.activeBtn, function()
		if WorldBossConst.CanUnlockCurrBoss() then
			local var_7_0 = WorldBossConst.GetCurrBossID()

			arg_3_0:emit(WorldBossMediator.ON_ACTIVE_BOSS, var_7_0)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_boss_item_count_noenough"))
		end
	end, SFX_PANEL)
end

function var_0_0.OnUpdate(arg_8_0)
	local var_8_0 = WorldBossConst.GetCurrBossStartTimeAndEndTime()
	local var_8_1 = pg.TimeMgr.GetInstance():inTime(var_8_0)
	local var_8_2 = var_8_1 and WorldBossConst.CanUnlockCurrBoss()

	setActive(arg_8_0.useItem, var_8_2)
	setActive(arg_8_0.noItem, not var_8_2)

	if var_8_1 then
		arg_8_0.timeTxt.text = pg.TimeMgr.GetInstance():DescDateFromConfig(var_8_0[1]) .. "~" .. pg.TimeMgr.GetInstance():DescDateFromConfig(var_8_0[2])
	else
		arg_8_0.timeTxt.text = ""
	end

	arg_8_0.metaWorldbossBtn = arg_8_0.metaWorldbossBtn or MetaWorldbossBtn.New(arg_8_0._tf:Find("archives_btn"), arg_8_0.event)
	arg_8_0.ptBtn = arg_8_0.ptBtn or WorldbossPtBtn.New(arg_8_0._tf:Find("point"))
end

function var_0_0.OnUpdateRes(arg_9_0)
	if not arg_9_0.progressTxt then
		return
	end

	local var_9_0, var_9_1, var_9_2 = WorldBossConst.GetCurrBossConsume()
	local var_9_3 = WorldBossConst.GetCurrBossItemProgress()

	arg_9_0.progressTxt.text = var_9_3 .. "/" .. var_9_2
end

function var_0_0.OnUpdatePt(arg_10_0, arg_10_1)
	if arg_10_0.ptBtn then
		arg_10_0.ptBtn:Update()
	end
end

function var_0_0.OnDestroy(arg_11_0)
	var_0_0.super.OnDestroy(arg_11_0)

	if arg_11_0.metaWorldbossBtn then
		arg_11_0.metaWorldbossBtn:Dispose()

		arg_11_0.metaWorldbossBtn = nil
	end

	if arg_11_0.ptBtn then
		arg_11_0.ptBtn:Dispose()

		arg_11_0.ptBtn = nil
	end
end

return var_0_0
