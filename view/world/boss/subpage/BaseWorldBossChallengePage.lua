local var_0_0 = class("BaseWorldBossChallengePage", import("view.base.BaseSubView"))

var_0_0.Listeners = {
	onRankListUpdated = "OnRankListUpdated",
	onCacheBossUpdated = "OnCacheBossUpdated"
}

local var_0_1 = {
	[970701] = {
		411,
		777
	},
	[970702] = {
		411,
		574
	},
	[970201] = {
		296,
		610,
		0.95,
		0.95
	},
	[970703] = {
		1424,
		1267.9,
		1.7,
		1.7
	},
	[970401] = {
		480,
		635
	},
	[970402] = {
		480,
		635
	},
	[970403] = {
		510,
		611.2,
		0.95,
		0.95
	}
}

function var_0_0.Setup(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in pairs(var_0_0.Listeners) do
		arg_1_0[iter_1_0] = function(...)
			var_0_0[iter_1_1](arg_1_0, ...)
		end
	end

	arg_1_0.proxy = arg_1_1
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.rankPage = WorldBossRankPage.New(arg_3_0._tf.parent.parent, arg_3_0.event)

	arg_3_0:AddListeners(arg_3_0.proxy)
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0:UpdateEmptyCard()

	arg_4_0.scrollRect = WorldBossItemList.New(arg_4_0._tf:Find("list_panel/mask/bg/container"), arg_4_0._tf:Find("list_panel/mask/tpl"))

	arg_4_0.scrollRect:Make(function(arg_5_0, arg_5_1)
		arg_4_0:OnInitCard(arg_5_0, arg_5_1)
	end, function(arg_6_0, arg_6_1)
		arg_4_0:OnPreviewCard(arg_6_0, arg_6_1)
	end, function(arg_7_0, arg_7_1)
		arg_4_0:OnSelectCard(arg_7_0, arg_7_1)
	end)

	arg_4_0.hpSlider = arg_4_0._tf:Find("main/hp/slider"):GetComponent(typeof(Slider))
	arg_4_0.levelTxt = arg_4_0._tf:Find("main/hp/level/Text"):GetComponent(typeof(Text))
	arg_4_0.hpTxt = arg_4_0._tf:Find("main/hp/Text"):GetComponent(typeof(Text))
	arg_4_0.expiredTimeTxt = arg_4_0._tf:Find("main/time/Text"):GetComponent(typeof(Text))
	arg_4_0.mainPanel = arg_4_0._tf:Find("main")
	arg_4_0.painting = arg_4_0._tf:Find("paint")

	setActive(arg_4_0.painting, false)
	setActive(arg_4_0.mainPanel, false)

	arg_4_0.rankBtn = arg_4_0.mainPanel:Find("rank_btn")
	arg_4_0.startBtn = arg_4_0.mainPanel:Find("start_btn")
	arg_4_0.refreshBtn = arg_4_0._tf:Find("list_panel/frame/filter/refresh_btn")
	arg_4_0.refreshBtnGray = arg_4_0._tf:Find("list_panel/frame/filter/refresh_btn_gray")
	arg_4_0.cdTime = 0

	onButton(arg_4_0, arg_4_0.refreshBtn, function()
		if arg_4_0.cdTime <= pg.TimeMgr.GetInstance():GetServerTime() then
			arg_4_0.worldBossId = nil

			arg_4_0:emit(WorldBossMediator.UPDATE_CACHE_BOSS_HP, function()
				arg_4_0:OnCacheBossUpdated()
			end)
			assert(pg.gameset.world_boss_resfresh, "gameset >>>>>>>>>>world_boss_resfresh")

			local var_8_0 = pg.gameset.world_boss_resfresh.key_value

			arg_4_0.cdTime = pg.TimeMgr.GetInstance():GetServerTime() + var_8_0

			arg_4_0:RotateRefreshBtn(var_8_0)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_joint_not_refresh_frequently"))
		end
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.refreshBtnGray, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_joint_not_refresh_frequently"))
	end, SFX_PANEL)

	arg_4_0.filterToggle = arg_4_0._tf:Find("list_panel/frame/filter/toggles")
	arg_4_0.filterFlags = {
		WorldBoss.BOSS_TYPE_WORLD,
		WorldBoss.BOSS_TYPE_FRIEND,
		WorldBoss.BOSS_TYPE_GUILD
	}

	onToggle(arg_4_0, arg_4_0._tf:Find("list_panel/frame/filter/toggles/friend"), function(arg_11_0)
		arg_4_0.filterFlags[2] = arg_11_0 and WorldBoss.BOSS_TYPE_FRIEND or -1

		arg_4_0:CheckToggle()
		arg_4_0:UpdateNonProcessList()
	end, SFX_PANEL)
	GetComponent(arg_4_0._tf:Find("list_panel/frame/filter/toggles/friend/unsel"), typeof(Image)):SetNativeSize()
	GetComponent(arg_4_0._tf:Find("list_panel/frame/filter/toggles/friend/sel"), typeof(Image)):SetNativeSize()
	GetComponent(arg_4_0._tf:Find("list_panel/frame/filter/toggles/guild/sel"), typeof(Image)):SetNativeSize()
	GetComponent(arg_4_0._tf:Find("list_panel/frame/filter/toggles/guild/unsel"), typeof(Image)):SetNativeSize()
	onToggle(arg_4_0, arg_4_0._tf:Find("list_panel/frame/filter/toggles/guild"), function(arg_12_0)
		arg_4_0.filterFlags[3] = arg_12_0 and WorldBoss.BOSS_TYPE_GUILD or -1

		arg_4_0:CheckToggle()
		arg_4_0:UpdateNonProcessList()
	end, SFX_PANEL)
end

function var_0_0.UpdateEmptyCard(arg_13_0)
	local var_13_0 = arg_13_0._tf:Find("list_panel/mask/tpl")
	local var_13_1 = WorldBossConst.GetCurrBossGroup()
	local var_13_2 = var_13_0:Find("empty"):GetComponent(typeof(Image))

	var_13_2.sprite = GetSpriteFromAtlas("MetaWorldboss/" .. var_13_1, "item_04")

	var_13_2:SetNativeSize()
end

function var_0_0.CheckToggle(arg_14_0)
	if _.all(arg_14_0.filterFlags, function(arg_15_0)
		return arg_15_0 == -1
	end) then
		triggerToggle(arg_14_0._tf:Find("list_panel/frame/filter/toggles/friend"), true)
		triggerToggle(arg_14_0._tf:Find("list_panel/frame/filter/toggles/guild"), true)
	end
end

function var_0_0.GetResSuffix(arg_16_0)
	return ""
end

function var_0_0.UpdatePainting(arg_17_0, arg_17_1)
	if arg_17_0.groupId ~= arg_17_1 then
		arg_17_0.groupId = arg_17_1

		local var_17_0 = arg_17_0._tf:Find("main/label"):GetComponent(typeof(Image))

		var_17_0.sprite = GetSpriteFromAtlas("MetaWorldboss/" .. arg_17_1, "title" .. arg_17_0:GetResSuffix())

		var_17_0:SetNativeSize()
		setMetaPaintingPrefabAsync(arg_17_0.painting, arg_17_0.groupId, "lihuisha")

		local var_17_1 = WorldBossConst.MetaId2BossId(arg_17_0.groupId)
		local var_17_2 = pg.world_joint_boss_template[var_17_1].p_offset_other or var_0_1[arg_17_0.groupId]

		if var_17_2 then
			setAnchoredPosition(arg_17_0.painting, {
				x = var_17_2[1],
				y = var_17_2[2]
			})

			local var_17_3 = var_17_2[3] or 1
			local var_17_4 = var_17_2[4] or 1

			arg_17_0.painting.localScale = Vector3(var_17_3, var_17_4, 1)
		end
	end
end

function var_0_0.RotateRefreshBtn(arg_18_0, arg_18_1)
	LeanTween.rotate(rtf(arg_18_0.refreshBtn), -360, 0.5):setOnComplete(System.Action(function()
		arg_18_0.refreshBtn.localEulerAngles = Vector3(0, 0, 0)

		setActive(arg_18_0.refreshBtnGray, false)
		setActive(arg_18_0.refreshBtnGray, true)
	end))

	if arg_18_0.refreshtimer then
		arg_18_0.refreshtimer:Stop()

		arg_18_0.refreshtimer = nil
	end

	arg_18_0.refreshtimer = Timer.New(function()
		setActive(arg_18_0.refreshBtnGray, true)
		setActive(arg_18_0.refreshBtnGray, false)
	end, arg_18_1, 1)

	arg_18_0.refreshtimer:Start()
end

function var_0_0.AddListeners(arg_21_0, arg_21_1)
	arg_21_1:AddListener(WorldBossProxy.EventRankListUpdated, arg_21_0.onRankListUpdated)
	arg_21_1:AddListener(WorldBossProxy.EventCacheBossListUpdated, arg_21_0.onCacheBossUpdated)
end

function var_0_0.RemoveListeners(arg_22_0, arg_22_1)
	arg_22_1:RemoveListener(WorldBossProxy.EventRankListUpdated, arg_22_0.onRankListUpdated)
	arg_22_1:RemoveListener(WorldBossProxy.EventCacheBossListUpdated, arg_22_0.onCacheBossUpdated)
end

function var_0_0.OnCacheBossUpdated(arg_23_0)
	arg_23_0:UpdateNonProcessList()
end

function var_0_0.OnRankListUpdated(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	if arg_24_0.boss and arg_24_0.boss.id == arg_24_3 and arg_24_0.rankPage:GetLoaded() and arg_24_0.rankPage:isActive() then
		arg_24_0.rankPage:ExecuteAction("Update", arg_24_0.proxy, arg_24_0.boss.id)
	end
end

function var_0_0.Update(arg_25_0)
	arg_25_0:emit(WorldBossMediator.UPDATE_CACHE_BOSS_HP, function()
		arg_25_0:UpdateNonProcessList()
		arg_25_0:Show()
	end)
end

function var_0_0.UpdateNonProcessList(arg_27_0)
	local var_27_0 = arg_27_0.proxy:GetCacheBossList()

	local function var_27_1(arg_28_0)
		local var_28_0 = _.select(arg_27_0.filterFlags, function(arg_29_0)
			return arg_29_0 >= 0
		end)

		return _.any(var_28_0, function(arg_30_0)
			return arg_28_0:GetType() == arg_30_0
		end)
	end

	arg_27_0.displays = {}

	for iter_27_0, iter_27_1 in ipairs(var_27_0) do
		if not iter_27_1:isDeath() and not iter_27_1:IsExpired() and var_27_1(iter_27_1) and not iter_27_1:IsFullPeople() and arg_27_0:OnFilterBoss(iter_27_1) then
			table.insert(arg_27_0.displays, iter_27_1)
		end
	end

	table.sort(arg_27_0.displays, function(arg_31_0, arg_31_1)
		return arg_31_0:GetJoinTime() > arg_31_1:GetJoinTime()
	end)

	local var_27_2 = 1

	for iter_27_2, iter_27_3 in ipairs(arg_27_0.displays) do
		if iter_27_3.id == arg_27_0.contextData.worldBossId or iter_27_3.id == arg_27_0.worldBossId then
			var_27_2 = iter_27_2

			break
		end
	end

	arg_27_0.contextData.worldBossId = nil
	WorldBossScene.inOtherBossBattle = nil

	arg_27_0.scrollRect:Align(#arg_27_0.displays, var_27_2)
	setActive(arg_27_0.filterToggle, true)
	setActive(arg_27_0.refreshBtn, true)
end

function var_0_0.OnFilterBoss(arg_32_0, arg_32_1)
	return true
end

function var_0_0.OnInitCard(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_0.displays[arg_33_2 + 1]
	local var_33_1 = false
	local var_33_2 = arg_33_1:Find("tags")

	removeOnButton(arg_33_1)
	setText(arg_33_1:Find("tags/friend/Text"), "")
	setText(arg_33_1:Find("tags/guild/Text"), "")

	if var_33_0 then
		var_33_1 = var_33_0:isDeath()

		local var_33_3 = var_33_0:GetType()

		setActive(arg_33_1:Find("tags/friend"), var_33_3 == WorldBoss.BOSS_TYPE_FRIEND)
		setActive(arg_33_1:Find("tags/guild"), var_33_3 == WorldBoss.BOSS_TYPE_GUILD)
		setActive(arg_33_1:Find("tags/world"), var_33_3 == WorldBoss.BOSS_TYPE_WORLD)

		var_33_2.anchoredPosition = Vector3(0, 14, 0)

		setText(arg_33_1:Find("tags/friend/Text"), var_33_0:GetRoleName())
		setText(arg_33_1:Find("tags/guild/Text"), var_33_0:GetRoleName())
		onButton(arg_33_0, arg_33_1, function()
			arg_33_0.scrollRect:SliceTo(arg_33_1)
		end, SFX_PANEL)
		arg_33_0:UpdateCardStyle(arg_33_1, var_33_0.config.meta_id)
	end

	setActive(arg_33_1:Find("complete"), var_33_0 and var_33_1)
	setActive(arg_33_1:Find("raiding"), var_33_0 and not var_33_1)
	setActive(arg_33_1:Find("empty"), not var_33_0)
	setActive(var_33_2, var_33_0)
	setActive(arg_33_1:Find("tags/friend/Text"), false)
	setActive(arg_33_1:Find("tags/guild/Text"), false)
end

function var_0_0.UpdateCardStyle(arg_35_0, arg_35_1, arg_35_2)
	arg_35_1:Find("raiding"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("MetaWorldboss/" .. arg_35_2, "item_03")

	local var_35_0 = arg_35_1:Find("empty"):GetComponent(typeof(Image))

	var_35_0.sprite = GetSpriteFromAtlas("MetaWorldboss/" .. arg_35_2, "item_04")

	var_35_0:SetNativeSize()

	arg_35_1:Find("selected/challenging"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("MetaWorldboss/" .. arg_35_2, "item_01" .. arg_35_0:GetResSuffix())
end

function var_0_0.OnPreviewCard(arg_36_0, arg_36_1, arg_36_2)
	if arg_36_0.prevSelected and arg_36_0.prevSelected.boss then
		arg_36_0.prevSelected.childTF:Find("tags").anchoredPosition = Vector3(0, 14, 0)

		setActive(arg_36_0.prevSelected.childTF:Find("tags/friend/Text"), false)
		setActive(arg_36_0.prevSelected.childTF:Find("tags/guild/Text"), false)
		setActive(arg_36_0.prevSelected.childTF:Find("selected"), false)
	end

	local var_36_0 = arg_36_0.displays[arg_36_2 + 1]

	if var_36_0 then
		local var_36_1 = var_36_0:isDeath()

		setActive(arg_36_1:Find("selected/challenging"), not var_36_1)
		setActive(arg_36_1:Find("selected/finished"), var_36_1)

		arg_36_1:Find("tags").anchoredPosition = Vector3(-17, 41.69, 0)

		setActive(arg_36_1:Find("tags/friend/Text"), true)
		setActive(arg_36_1:Find("tags/guild/Text"), true)
		arg_36_0:UpdateMainView(var_36_0)
	end

	setActive(arg_36_1:Find("selected"), var_36_0)

	arg_36_0.prevSelected = {
		childTF = arg_36_1,
		boss = var_36_0
	}
end

function var_0_0.OnSelectCard(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0.displays[arg_37_2 + 1]

	arg_37_0.boss = var_37_0
	arg_37_0.worldBossId = nil

	if arg_37_0.boss then
		arg_37_0.worldBossId = var_37_0.id

		arg_37_0:UpdateMainView(var_37_0)
	else
		setActive(arg_37_0.mainPanel, false)
		setActive(arg_37_0.painting, false)
	end
end

function var_0_0.UpdateMainView(arg_38_0, arg_38_1, arg_38_2)
	setActive(arg_38_0.mainPanel, true)
	setActive(arg_38_0.painting, true)

	local var_38_0 = arg_38_0.proxy
	local var_38_1 = arg_38_1:isDeath()
	local var_38_2 = arg_38_1:GetLeftTime()

	onButton(arg_38_0, arg_38_0.rankBtn, function()
		arg_38_0.rankPage:ExecuteAction("Update", arg_38_0.proxy, arg_38_1.id)
	end, SFX_PANEL)

	local var_38_3 = arg_38_1:GetMaxHp()

	arg_38_0.hpSlider.value = 1
	arg_38_0.levelTxt.text = arg_38_1:GetLevel()
	arg_38_0.hpTxt.text = "HP:" .. var_38_3

	onButton(arg_38_0, arg_38_0.startBtn, function()
		arg_38_0:emit(WorldBossMediator.ON_BATTLE, arg_38_1.id, true)
	end, SFX_PANEL)
	setActive(arg_38_0.startBtn, not var_38_1 and var_38_2 > 0)
	arg_38_0:removeBattleTimer()

	if not var_38_1 and not arg_38_2 then
		arg_38_0:addBattleTimer(arg_38_1)
	end

	arg_38_0:UpdatePainting(arg_38_1.config.meta_id)
end

function var_0_0.addBattleTimer(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1:GetExpiredTime()

	if var_41_0 - pg.TimeMgr.GetInstance():GetServerTime() >= 0 then
		arg_41_0.timer = Timer.New(function()
			if arg_41_0.exited then
				arg_41_0:removeBattleTimer()

				return
			end

			local var_42_0 = var_41_0 - pg.TimeMgr.GetInstance():GetServerTime()

			if var_42_0 <= 0 then
				arg_41_0.expiredTimeTxt.text = i18n("world_word_expired")

				arg_41_0:removeBattleTimer()
				arg_41_0:UpdateMainView(arg_41_1, true)
			else
				arg_41_0.expiredTimeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_42_0)
			end
		end, 1, -1)

		arg_41_0.timer:Start()
		arg_41_0.timer.func()
	else
		arg_41_0.expiredTimeTxt.text = i18n("world_word_expired")

		arg_41_0:UpdateMainView(arg_41_1, true)
	end
end

function var_0_0.removeBattleTimer(arg_43_0)
	if arg_43_0.timer then
		arg_43_0.timer:Stop()

		arg_43_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_44_0)
	retMetaPaintingPrefab(arg_44_0.painting, arg_44_0.groupId)
	arg_44_0:RemoveListeners(arg_44_0.proxy)
	arg_44_0:removeBattleTimer()
	arg_44_0.scrollRect:Dispose()
	arg_44_0.rankPage:Destroy()

	if arg_44_0.refreshtimer then
		arg_44_0.refreshtimer:Stop()

		arg_44_0.refreshtimer = nil
	end

	arg_44_0.exited = true
end

return var_0_0
