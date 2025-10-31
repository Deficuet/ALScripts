local var_0_0 = class("WorldMediaCollectionAlbumGroupLayer", import(".WorldMediaCollectionSubLayer"))

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

	setText(arg_2_0._tf:Find("top/title/text"), i18n("word_limited_activity"))
	setText(arg_2_0._tf:Find("top/expireCheckBox/text"), i18n("word_show_expire_content"))

	arg_2_0.showExpireBtn = arg_2_0._tf:Find("top/expireCheckBox/click")
	arg_2_0.showExpireCheckBox = arg_2_0._tf:Find("top/expireCheckBox/checkBox/check")
	arg_2_0.showExpire = true

	onButton(arg_2_0, arg_2_0.showExpireBtn, function()
		arg_2_0.showExpire = not arg_2_0.showExpire

		arg_2_0:ExpireFilter()
		arg_2_0:UpdateView()
		setActive(arg_2_0.showExpireCheckBox, arg_2_0.showExpire)
	end)
	triggerButton(arg_2_0.showExpireBtn)

	arg_2_0.rectAnchorX = arg_2_0._tf:Find("GroupRect").anchoredPosition.x

	arg_2_0:UpdateView(arg_2_0.showExpireBtn)
end

function var_0_0.onInitAlbumGroup(arg_7_0, arg_7_1)
	if arg_7_0.exited then
		return
	end

	onButton(arg_7_0, arg_7_1, function()
		local var_8_0 = arg_7_0.albumGroupInfos[arg_7_1]

		if var_8_0 then
			arg_7_0.viewParent:ShowAlbum(var_8_0)
		end
	end, SOUND_BACK)
end

function var_0_0.onUpdateAlbumGroup(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0.exited then
		return
	end

	local var_9_0 = arg_9_0.albumGroups[arg_9_1]

	arg_9_0.albumGroupInfos[arg_9_2] = var_9_0

	arg_9_0.loader:GetSpriteQuiet(var_9_0.entrance_picture, "", tf(arg_9_2):Find("BG"))

	local var_9_1 = ActivityMedalGroup.IsMedalGroupCollectionGrey(var_9_0.id) and ActivityMedalGroup.GetMedalGroupStateByID(var_9_0.id) < ActivityMedalGroup.STATE_ACTIVE

	setActive(tf(arg_9_2):Find("expireMask"), var_9_1)
end

function var_0_0.Return2MemoryGroup(arg_10_0)
	local var_10_0 = 0
	local var_10_1 = arg_10_0:GetIndexRatio(var_10_0)

	arg_10_0.albumGroupList:SetTotalCount(#arg_10_0.albumGroups, var_10_1)
end

function var_0_0.SwitchReddotMemory(arg_11_0)
	local var_11_0 = 0
	local var_11_1 = getProxy(PlayerProxy):getRawData().id

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.albumGroups) do
		if PlayerPrefs.GetInt("ALBUM_GROUP_NOTIFICATION" .. var_11_1 .. " " .. iter_11_1.id, 0) == 1 then
			var_11_0 = iter_11_0

			break
		end
	end

	if var_11_0 == 0 then
		return
	end

	local var_11_2 = arg_11_0:GetIndexRatio(var_11_0)

	arg_11_0.albumGroupList:SetTotalCount(#arg_11_0.albumGroups, var_11_2)
end

function var_0_0.GetIndexRatio(arg_12_0, arg_12_1)
	local var_12_0 = 0

	if arg_12_1 > 0 then
		local var_12_1 = arg_12_0.albumGroupList
		local var_12_2 = arg_12_0.albumGroupsGrid.cellSize.y + arg_12_0.albumGroupsGrid.spacing.y
		local var_12_3 = arg_12_0.albumGroupsGrid.constraintCount
		local var_12_4 = var_12_2 * math.ceil(#arg_12_0.albumGroups / var_12_3)

		var_12_0 = (var_12_2 * math.floor((arg_12_1 - 1) / var_12_3) + var_12_1.paddingFront) / (var_12_4 - arg_12_0.albumGroupViewport.rect.height)
		var_12_0 = Mathf.Clamp01(var_12_0)
	end

	return var_12_0
end

function var_0_0.ExpireFilter(arg_13_0)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(pg.activity_medal_group.all) do
		local var_13_1 = pg.activity_medal_group[iter_13_1]
		local var_13_2 = ActivityMedalGroup.GetMedalGroupStateByID(var_13_1.id)

		if arg_13_0.showExpire or var_13_2 >= ActivityMedalGroup.STATE_ACTIVE then
			table.insert(var_13_0, var_13_1)
		end
	end

	arg_13_0.albumGroups = var_13_0
end

function var_0_0.UpdateView(arg_14_0)
	local var_14_0 = WorldMediaCollectionScene.WorldRecordLock()

	setAnchoredPosition(arg_14_0._tf:Find("GroupRect"), {
		x = var_14_0 and 0 or arg_14_0.rectAnchorX
	})
	arg_14_0.albumGroupList:SetTotalCount(#arg_14_0.albumGroups, 0)
end

return var_0_0
