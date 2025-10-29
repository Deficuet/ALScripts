local var_0_0 = class("WorldMediaCollectionMemoryDetailLayer", import(".WorldMediaCollectionSubLayer"))

function var_0_0.getUIName(arg_1_0)
	return "WorldMediaCollectionMemoryDetailUI"
end

function var_0_0.OnInit(arg_2_0)
	var_0_0.super.OnInit(arg_2_0)
	assert(arg_2_0.viewParent, "Need assign ViewParent for " .. arg_2_0.__cname)
	setActive(arg_2_0._tf:Find("ItemRect/TitleRecord"), false)
	setActive(arg_2_0._tf:Find("ItemRect/TitleMemory"), true)

	arg_2_0.memoryItemList = arg_2_0._tf:Find("ItemRect"):GetComponent("LScrollRect")

	function arg_2_0.memoryItemList.onInitItem(arg_3_0)
		arg_2_0:onInitMemoryItem(arg_3_0)
	end

	function arg_2_0.memoryItemList.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:onUpdateMemoryItem(arg_4_0, arg_4_1)
	end

	arg_2_0.memoryItems = {}

	local var_2_0 = tf(arg_2_0.memoryItemList):Find("Item")

	setActive(var_2_0, false)

	arg_2_0.loader = AutoLoader.New()
	arg_2_0.memoryItemViewport = tf(arg_2_0.memoryItemList):Find("Viewport")
	arg_2_0.memoryItemsGrid = tf(arg_2_0.memoryItemList):Find("Viewport/Content"):GetComponent(typeof(GridLayoutGroup))

	setText(arg_2_0._tf:Find("ItemRect/ProgressDesc"), i18n("world_collection_2"))

	arg_2_0.rectAnchorX = arg_2_0._tf:Find("ItemRect").anchoredPosition.x

	arg_2_0:UpdateView()
end

function var_0_0.onInitMemoryItem(arg_5_0, arg_5_1)
	if arg_5_0.exited then
		return
	end

	onButton(arg_5_0, arg_5_1, function()
		local var_6_0 = arg_5_0.memoryItems[arg_5_1]

		if var_6_0 and (var_6_0.is_open == 1 or pg.NewStoryMgr.GetInstance():IsPlayed(var_6_0.story, true)) then
			arg_5_0:PlayMemory(var_6_0)
		end
	end, SOUND_BACK)
end

function var_0_0.onUpdateMemoryItem(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0.exited then
		return
	end

	local var_7_0 = arg_7_0.memories and arg_7_0.memories[arg_7_1 + 1]

	arg_7_0.memoryItems[arg_7_2] = var_7_0

	local var_7_1 = tf(arg_7_2)

	if var_7_0.is_open == 1 or pg.NewStoryMgr.GetInstance():IsPlayed(var_7_0.story, true) then
		setActive(var_7_1:Find("normal"), true)
		setActive(var_7_1:Find("lock"), false)

		var_7_1:Find("normal/title"):GetComponent(typeof(Text)).text = var_7_0.title

		arg_7_0.loader:GetSpriteQuiet("memoryicon/" .. var_7_0.icon, "", var_7_1:Find("normal"))
		setText(var_7_1:Find("normal/id"), string.format("#%u", arg_7_1 + 1))
	else
		setActive(var_7_1:Find("normal"), false)
		setActive(var_7_1:Find("lock"), true)
		setText(var_7_1:Find("lock/condition"), var_7_0.condition)
	end
end

function var_0_0.SetStoryMask(arg_8_0, arg_8_1)
	arg_8_0.memoryMask = arg_8_1
end

function var_0_0.PlayMemory(arg_9_0, arg_9_1)
	if arg_9_1.type == 1 then
		local var_9_0 = findTF(arg_9_0.memoryMask, "pic")

		if string.len(arg_9_1.mask) > 0 then
			setActive(var_9_0, true)

			var_9_0:GetComponent(typeof(Image)).sprite = LoadSprite(arg_9_1.mask)
		else
			setActive(var_9_0, false)
		end

		setActive(arg_9_0.memoryMask, true)
		pg.NewStoryMgr.GetInstance():Play(arg_9_1.story, function()
			setActive(arg_9_0.memoryMask, false)
		end, true)
	elseif arg_9_1.type == 2 then
		local var_9_1 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_9_1.story)

		assert(var_9_1 and var_9_1 ~= 0, "Missing Story Stage ID: " .. (arg_9_1.story or "NIL"))
		arg_9_0:emit(WorldMediaCollectionMediator.BEGIN_STAGE, {
			memory = true,
			system = SYSTEM_PERFORM,
			stageId = var_9_1
		})
	end
end

function var_0_0.ShowSubMemories(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.contextData.memoryGroup = arg_11_1.id
	arg_11_0.memories = _.map(arg_11_1.memories, function(arg_12_0)
		return pg.memory_template[arg_12_0]
	end)

	local var_11_0 = 0

	if arg_11_2 then
		local var_11_1 = 0

		for iter_11_0 = 1, #arg_11_0.memories do
			if arg_11_0.memories[iter_11_0].id == arg_11_2 then
				var_11_1 = iter_11_0

				break
			end
		end

		if var_11_1 > 0 then
			local var_11_2 = arg_11_0.memoryItemList
			local var_11_3 = arg_11_0.memoryItemsGrid.cellSize.y + arg_11_0.memoryItemsGrid.spacing.y
			local var_11_4 = arg_11_0.memoryItemsGrid.constraintCount
			local var_11_5 = var_11_3 * math.ceil(#arg_11_0.memories / var_11_4)

			var_11_0 = (var_11_3 * math.floor((var_11_1 - 1) / var_11_4) + var_11_2.paddingFront) / (var_11_5 - arg_11_0.memoryItemViewport.rect.height)
			var_11_0 = Mathf.Clamp01(var_11_0)
		end
	end

	arg_11_0.memoryItemList:SetTotalCount(#arg_11_0.memories, var_11_0)

	local var_11_6 = #arg_11_0.memories
	local var_11_7 = _.reduce(arg_11_0.memories, 0, function(arg_13_0, arg_13_1)
		if arg_13_1.is_open == 1 or pg.NewStoryMgr.GetInstance():IsPlayed(arg_13_1.story, true) then
			arg_13_0 = arg_13_0 + 1
		end

		return arg_13_0
	end)

	setText(arg_11_0._tf:Find("ItemRect/ProgressText"), var_11_7 .. "/" .. var_11_6)

	local var_11_8 = _.filter(pg.re_map_template.all, function(arg_14_0)
		return pg.re_map_template[arg_14_0].memory_group == arg_11_1.id
	end)
	local var_11_9 = var_11_7 < var_11_6 and #var_11_8 > 0

	setActive(arg_11_0._tf:Find("ItemRect/UnlockTip"), var_11_9)

	if var_11_9 then
		local var_11_10 = _.map(_.sort(Map.GetRearChaptersOfRemaster(var_11_8[1])), function(arg_15_0)
			return getProxy(ChapterProxy):getChapterById(arg_15_0, true):getConfig("chapter_name")
		end)

		setText(arg_11_0._tf:Find("ItemRect/UnlockTip"), i18n("levelScene_remaster_unlock_tip", arg_11_1.title, table.concat(var_11_10, "/")))
	end
end

function var_0_0.CleanList(arg_16_0)
	arg_16_0.memories = nil

	arg_16_0.memoryItemList:SetTotalCount(0)
end

function var_0_0.UpdateView(arg_17_0)
	local var_17_0 = WorldMediaCollectionScene.WorldRecordLock()

	setAnchoredPosition(arg_17_0._tf:Find("ItemRect"), {
		x = var_17_0 and 0 or arg_17_0.rectAnchorX
	})
end

return var_0_0
