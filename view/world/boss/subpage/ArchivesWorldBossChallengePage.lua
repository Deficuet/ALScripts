local var_0_0 = class("ArchivesWorldBossChallengePage", import(".BaseWorldBossChallengePage"))

function var_0_0.getUIName(arg_1_0)
	return "ArchivesWorldBossChallengeUI"
end

function var_0_0.OnFilterBoss(arg_2_0, arg_2_1)
	return not WorldBossConst._IsCurrBoss(arg_2_1)
end

function var_0_0.GetResSuffix(arg_3_0)
	return "_archives"
end

function var_0_0.OnLoaded(arg_4_0)
	var_0_0.super.OnLoaded(arg_4_0)

	arg_4_0.switchBtn = arg_4_0._tf:Find("detail_btn")
	arg_4_0.currentChallengeBtn = arg_4_0._tf:Find("current_list_btn")
	arg_4_0.tipTr = arg_4_0._tf:Find("tip")

	setText(arg_4_0.tipTr, i18n("world_boss_archives_boss_tip"))
end

function var_0_0.OnInit(arg_5_0)
	var_0_0.super.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.switchBtn, function()
		local var_6_0 = nowWorld():GetBossProxy():GetSelfBoss()

		if var_6_0 and WorldBossConst._IsCurrBoss(var_6_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("current_boss_was_opened"))
		else
			arg_5_0:emit(WorldBossScene.ON_SWITCH, WorldBossScene.PAGE_ARCHIVES)
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.currentChallengeBtn, function()
		arg_5_0:emit(WorldBossScene.ON_SWITCH, WorldBossScene.PAGE_CHALLENGE)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.world_archives_boss_help.tip
		})
	end, SFX_PANEL)
end

function var_0_0.UpdateEmptyCard(arg_9_0)
	local var_9_0 = arg_9_0._tf:Find("list_panel/mask/tpl"):Find("empty"):GetComponent(typeof(Image))

	if WorldBossConst.GetAchieveState() == WorldBossConst.ACHIEVE_STATE_STARTING then
		local var_9_1 = WorldBossConst.GetArchivesId()
		local var_9_2 = WorldBossConst.BossId2MetaId(var_9_1)

		var_9_0.sprite = GetSpriteFromAtlas("MetaWorldboss/" .. var_9_2, "item_04")
	else
		var_9_0.sprite = GetSpriteFromAtlas("MetaWorldboss/extra_empty", "")
	end

	var_9_0:SetNativeSize()
end

return var_0_0
