local var_0_0 = class("WorldMediaCollectionAlbumGroupLayer", import(".WorldMediaCollectionSubLayer"))

var_0_0.ALBUM_TYPE_BASE = 1
var_0_0.ALBUM_TYPE_LOVE_LETTER = 2

function var_0_0.getUIName(arg_1_0)
	return "WorldMediaCollectionAlbumGroupUI"
end

function var_0_0.OnInit(arg_2_0)
	var_0_0.super.OnInit(arg_2_0)
	assert(arg_2_0.viewParent, "Need assign ViewParent for " .. arg_2_0.__cname)

	arg_2_0.albumGroups = _.map(pg.activity_medal_group.all, function(arg_3_0)
		return pg.activity_medal_group[arg_3_0]
	end)
	arg_2_0.albumGroupList = arg_2_0._tf:Find("GroupRect"):GetComponent("LScrollRect")

	function arg_2_0.albumGroupList.onInitItem(arg_4_0)
		arg_2_0:onInitAlbumGroup(arg_4_0)
	end

	function arg_2_0.albumGroupList.onUpdateItem(arg_5_0, arg_5_1)
		arg_2_0:onUpdateAlbumGroup(arg_5_0 + 1, arg_5_1)
	end

	arg_2_0.albumGroupInfos = {}

	local var_2_0 = tf(arg_2_0.albumGroupList):Find("GroupItem")

	setActive(var_2_0, false)

	arg_2_0.albumGroupViewport = tf(arg_2_0.albumGroupList):Find("Viewport")
	arg_2_0.albumGroupsGrid = tf(arg_2_0.albumGroupList):Find("Viewport/Content"):GetComponent(typeof(GridLayoutGroup))
	arg_2_0.loader = AutoLoader.New()

	setText(arg_2_0._tf:Find("top/expireCheckBox/text"), i18n("word_show_expire_content"))

	arg_2_0.showExpireBtn = arg_2_0._tf:Find("top/expireCheckBox/click")
	arg_2_0.showExpireCheckBox = arg_2_0._tf:Find("top/expireCheckBox/checkBox/check")
	arg_2_0.showExpire = false

	setActive(arg_2_0.showExpireCheckBox, arg_2_0.showExpire)
	onButton(arg_2_0, arg_2_0.showExpireBtn, function()
		arg_2_0.showExpire = not arg_2_0.showExpire

		setActive(arg_2_0.showExpireCheckBox, arg_2_0.showExpire)
		arg_2_0:ExpireFilter()
		arg_2_0:UpdateView()
	end)

	arg_2_0.rectAnchorX = arg_2_0._tf:Find("GroupRect").anchoredPosition.x

	onToggle(arg_2_0, arg_2_0.toggleBase, function(arg_7_0)
		if arg_7_0 then
			arg_2_0:SetPage(false)
		end
	end, SFX_PANEL)
	onToggle(arg_2_0, arg_2_0.toggleLoveLetter, function(arg_8_0)
		if arg_8_0 then
			arg_2_0:SetPage(true)
		end
	end, SFX_PANEL)

	arg_2_0.initDic = {}
	arg_2_0.cardItems = {}
	arg_2_0.cardList = arg_2_0.rtScrollRect:GetComponent("LScrollRect")

	function arg_2_0.cardList.onInitItem(arg_9_0)
		arg_2_0:onInitCard(arg_9_0)
	end

	function arg_2_0.cardList.onUpdateItem(arg_10_0, arg_10_1)
		arg_2_0:onUpdateCard(arg_10_0, arg_10_1)
	end

	function arg_2_0.cardList.onReturnItem(arg_11_0, arg_11_1)
		arg_2_0:onReturnCard(arg_11_0, arg_11_1)
	end

	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_2_0.toggleLoveLetter:Find("tip"), {
		"love_letter_unlock_letter"
	}, function(arg_12_0)
		setActive(arg_12_0, getProxy(LoveLetterProxy):IsTipUnlockLetter())
	end)

	if arg_2_0.contextData.albumType == var_0_0.ALBUM_TYPE_LOVE_LETTER then
		triggerToggle(arg_2_0.toggleLoveLetter, true)
	else
		triggerToggle(arg_2_0.toggleBase, true)
	end
end

function var_0_0.SetPage(arg_13_0, arg_13_1)
	setActive(arg_13_0.rtGroupRect, not arg_13_1)
	setActive(arg_13_0.rtExpireCheckBox, not arg_13_1)
	setActive(arg_13_0.rtLoveLetterPanel, arg_13_1)

	if not arg_13_0.initDic[arg_13_1] then
		switch(arg_13_1, {
			[false] = function()
				arg_13_0:ExpireFilter()
				arg_13_0:UpdateView()
			end,
			[true] = function()
				arg_13_0:updateLoveLetterPage()
			end
		}, nil)

		arg_13_0.initDic[arg_13_1] = true
	end
end

function var_0_0.onInitAlbumGroup(arg_16_0, arg_16_1)
	if arg_16_0.exited then
		return
	end

	onButton(arg_16_0, arg_16_1, function()
		local var_17_0 = arg_16_0.albumGroupInfos[arg_16_1]

		if var_17_0 then
			arg_16_0.viewParent:ShowAlbum(var_17_0)
		end
	end, SOUND_BACK)
end

function var_0_0.onUpdateAlbumGroup(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_0.exited then
		return
	end

	local var_18_0 = arg_18_0.albumGroups[arg_18_1]

	arg_18_0.albumGroupInfos[arg_18_2] = var_18_0

	arg_18_0.loader:GetSpriteQuiet(var_18_0.entrance_picture, "", tf(arg_18_2):Find("BG"))

	local var_18_1 = ActivityMedalGroup.IsMedalGroupCollectionGrey(var_18_0.id) and ActivityMedalGroup.GetMedalGroupStateByID(var_18_0.id) < ActivityMedalGroup.STATE_ACTIVE

	setActive(tf(arg_18_2):Find("expireMask"), var_18_1)
end

function var_0_0.Return2MemoryGroup(arg_19_0)
	local var_19_0 = 0
	local var_19_1 = arg_19_0:GetIndexRatio(var_19_0)

	arg_19_0.albumGroupList:SetTotalCount(#arg_19_0.albumGroups, var_19_1)
end

function var_0_0.SwitchReddotMemory(arg_20_0)
	local var_20_0 = 0
	local var_20_1 = getProxy(PlayerProxy):getRawData().id

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.albumGroups) do
		if PlayerPrefs.GetInt("ALBUM_GROUP_NOTIFICATION" .. var_20_1 .. " " .. iter_20_1.id, 0) == 1 then
			var_20_0 = iter_20_0

			break
		end
	end

	if var_20_0 == 0 then
		return
	end

	local var_20_2 = arg_20_0:GetIndexRatio(var_20_0)

	arg_20_0.albumGroupList:SetTotalCount(#arg_20_0.albumGroups, var_20_2)
end

function var_0_0.GetIndexRatio(arg_21_0, arg_21_1)
	local var_21_0 = 0

	if arg_21_1 > 0 then
		local var_21_1 = arg_21_0.albumGroupList
		local var_21_2 = arg_21_0.albumGroupsGrid.cellSize.y + arg_21_0.albumGroupsGrid.spacing.y
		local var_21_3 = arg_21_0.albumGroupsGrid.constraintCount
		local var_21_4 = var_21_2 * math.ceil(#arg_21_0.albumGroups / var_21_3)

		var_21_0 = (var_21_2 * math.floor((arg_21_1 - 1) / var_21_3) + var_21_1.paddingFront) / (var_21_4 - arg_21_0.albumGroupViewport.rect.height)
		var_21_0 = Mathf.Clamp01(var_21_0)
	end

	return var_21_0
end

function var_0_0.ExpireFilter(arg_22_0)
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in ipairs(pg.activity_medal_group.all) do
		local var_22_1 = pg.activity_medal_group[iter_22_1]
		local var_22_2 = ActivityMedalGroup.GetMedalGroupStateByID(var_22_1.id)

		if arg_22_0.showExpire or var_22_2 >= ActivityMedalGroup.STATE_ACTIVE then
			table.insert(var_22_0, var_22_1)
		end
	end

	arg_22_0.albumGroups = var_22_0
end

function var_0_0.UpdateView(arg_23_0)
	local var_23_0 = WorldMediaCollectionScene.WorldRecordLock()

	setAnchoredPosition(arg_23_0._tf:Find("GroupRect"), {
		x = var_23_0 and 0 or arg_23_0.rectAnchorX
	})
	arg_23_0.albumGroupList:SetTotalCount(#arg_23_0.albumGroups, 0)
end

function var_0_0.updateLoveLetterPage(arg_24_0)
	arg_24_0.cardInfos = getProxy(LoveLetterProxy):GetDisplayLetterList()

	onDelayTick(function()
		arg_24_0.cardList.enabled = true

		arg_24_0.cardList:SetTotalCount(#arg_24_0.cardInfos, 0)
	end, 0.001)
end

function var_0_0.onInitCard(arg_26_0, arg_26_1)
	local var_26_0 = LoveLetterShipCard.New(arg_26_1)

	arg_26_0.cardItems[arg_26_1] = var_26_0

	onButton(arg_26_0, var_26_0.go, function()
		if var_26_0.shipGroup then
			arg_26_0:emit(WorldMediaCollectionMediator.OPEN_LOVE_LETTER_DISPLAY, var_26_0.shipGroup.id)
		end
	end)
end

function var_0_0.onUpdateCard(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.cardItems[arg_28_2]

	if not var_28_0 then
		arg_28_0:onInitCard(arg_28_2)

		var_28_0 = arg_28_0.cardItems[arg_28_2]
	end

	local var_28_1 = arg_28_1 + 1
	local var_28_2 = arg_28_0.cardInfos[var_28_1]

	var_28_0:update(var_28_2)
	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_28_2.transform:Find("content/pick_up"), {
		"love_letter_unlock_letter"
	}, function(arg_29_0)
		local var_29_0 = getProxy(LoveLetterProxy):GetGroupData(var_28_2.id)

		setActive(arg_29_0, underscore.any(var_29_0:GetDisplayLetterList(), function(arg_30_0)
			return not var_29_0:GetLetterUnlock(arg_30_0)
		end))
	end)
end

function var_0_0.onReturnCard(arg_31_0, arg_31_1, arg_31_2)
	if arg_31_0.exited then
		return
	end

	local var_31_0 = arg_31_0.cardItems[arg_31_2]

	if var_31_0 then
		var_31_0:clear()
	end

	arg_31_0.cardItems[arg_31_2] = nil
end

function var_0_0.OnDestroy(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.cardItems) do
		pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(iter_32_0.transform:Find("content/pick_up"))
	end

	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_32_0.toggleLoveLetter:Find("tip"))
end

return var_0_0
