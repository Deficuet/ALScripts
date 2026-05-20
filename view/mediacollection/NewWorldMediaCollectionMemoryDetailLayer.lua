local var_0_0 = class("NewWorldMediaCollectionMemoryDetailLayer", import(".WorldMediaCollectionSubLayer"))

function var_0_0.getUIName(arg_1_0)
	return "NewWorldMediaCollectionMemoryDetailUI"
end

function var_0_0.OnInit(arg_2_0)
	var_0_0.super.OnInit(arg_2_0)
	assert(arg_2_0.viewParent, "Need assign ViewParent for " .. arg_2_0.__cname)

	arg_2_0.memoryItemList = arg_2_0._tf:Find("AD/task/ItemRect"):GetComponent("LScrollRect")
	arg_2_0.memoryItems = {}
	arg_2_0.loader = AutoLoader.New()

	setText(arg_2_0._tf:Find("AD/task/ProgressDesc"), i18n("activity_permanent_progress"))
end

function var_0_0.onInitMemoryItem(arg_3_0, arg_3_1)
	if arg_3_0.exited then
		return
	end
end

function var_0_0.onUpdateMemoryItem(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5, arg_4_6)
	if arg_4_0.exited then
		return
	end

	local var_4_0 = arg_4_0.memories and arg_4_0.memories[arg_4_1]

	arg_4_0.memoryItems[arg_4_2] = var_4_0

	local var_4_1 = tf(arg_4_2)
	local var_4_2 = var_4_0.task
	local var_4_3 = getProxy(TaskProxy)

	setText(var_4_1:Find("lock_bg/lockname"), var_4_0.condition)
	setText(var_4_1:Find("on/taskname"), var_4_0.title)
	setText(var_4_1:Find("on/num"), string.format("%02d", arg_4_1))
	setText(var_4_1:Find("deblocking/Text"), i18n("memory_unlock"))
	setText(var_4_1:Find("lock_bg/go/name"), i18n("memory_goto"))

	if arg_4_1 == 1 and not arg_4_3 and arg_4_5 < arg_4_1 and arg_4_0.groupInfo.id ~= 501 then
		setActive(var_4_1:Find("deblocking"), true)
		setActive(var_4_1:Find("lock_bg"), true)
		setActive(var_4_1:Find("lock_bg/lock"), false)
		setActive(var_4_1:Find("on"), false)
	else
		setActive(var_4_1:Find("deblocking"), false)
		setActive(var_4_1:Find("lock_bg"), arg_4_5 < arg_4_1)
		setActive(var_4_1:Find("lock_bg/go"), not arg_4_3 and arg_4_1 == arg_4_5 + 1)
		setActive(var_4_1:Find("lock_bg/lock"), arg_4_3 or arg_4_1 > arg_4_5 + 1)
		setActive(var_4_1:Find("on"), arg_4_1 <= arg_4_5)
	end

	onButton(arg_4_0, var_4_1:Find("lock_bg/go"), function()
		arg_4_0:emit(WorldMediaCollectionMediator.GO_TASK)
	end, SOUND_BACK)
	onButton(arg_4_0, var_4_1:Find("deblocking"), function()
		if arg_4_0.isFoldState then
			return
		end

		arg_4_0:emit(WorldMediaCollectionMediator.TRIGGER_PERSONAL_TASK, arg_4_4, function()
			arg_4_0:ShowSubMemories(arg_4_0.groupInfo, arg_4_0.memoryID)
		end)
	end, SOUND_BACK)
	onButton(arg_4_0, var_4_1:Find("on/play"), function()
		if var_4_0 and (var_4_0.is_open == 1 or pg.NewStoryMgr.GetInstance():IsPlayed(var_4_0.unlock_pre, true)) then
			arg_4_0:PlayMemory(var_4_0)
		end
	end, SOUND_BACK)
end

function var_0_0.SetStoryMask(arg_9_0, arg_9_1)
	arg_9_0.memoryMask = arg_9_1
end

function var_0_0.PlayMemory(arg_10_0, arg_10_1)
	if arg_10_1.type == 1 then
		local var_10_0 = findTF(arg_10_0.memoryMask, "pic")

		if string.len(arg_10_1.mask) > 0 then
			setActive(var_10_0, true)

			var_10_0:GetComponent(typeof(Image)).sprite = LoadSprite(arg_10_1.mask)
		else
			setActive(var_10_0, false)
		end

		setActive(arg_10_0.memoryMask, true)
		pg.NewStoryMgr.GetInstance():ReViewPlay(arg_10_1.story, function()
			setActive(arg_10_0.memoryMask, false)
		end, true)
	elseif arg_10_1.type == 2 then
		local var_10_1 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_10_1.story)

		assert(var_10_1 and var_10_1 ~= 0, "Missing Story Stage ID: " .. (arg_10_1.story or "NIL"))
		arg_10_0:emit(WorldMediaCollectionMediator.BEGIN_STAGE, {
			memory = true,
			system = SYSTEM_PERFORM,
			stageId = var_10_1
		})
	end
end

function var_0_0.ShowSubMemories(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.groupInfo = arg_12_1
	arg_12_0.memoryID = arg_12_2
	arg_12_0.contextData.memoryGroup = arg_12_1.id
	arg_12_0.memories = _.map(arg_12_1.memories, function(arg_13_0)
		return pg.memory_template[arg_13_0]
	end)

	local var_12_0 = getProxy(CollectionProxy)
	local var_12_1 = arg_12_1.ship_group
	local var_12_2 = ShipGroup.getDefaultShipConfig(var_12_1)
	local var_12_3 = var_12_0 and var_12_0.shipGroups[var_12_1] == nil

	setText(arg_12_0._tf:Find("AD/icon_bg/painting/name_bg/name"), var_12_2.name)
	SetActive(arg_12_0._tf:Find("AD/icon_bg/painting/name_bg/off"), var_12_3)

	local var_12_4 = arg_12_0._tf:Find("AD/icon_bg/painting")
	local var_12_5 = pg.ship_skin_template[var_12_2.skin_id].painting

	setPaintingPrefabAsync(var_12_4, var_12_5, "duihua", function(arg_14_0)
		arg_12_0.rtPaint = arg_14_0
	end)

	local var_12_6 = 0

	arg_12_0.memoryIds = _.map(arg_12_1.memories, function(arg_15_0)
		local var_15_0 = pg.memory_template[arg_15_0].number
		local var_15_1 = var_15_0 and var_15_0 > 0

		if not var_15_1 then
			var_12_6 = var_12_6 + 1
		end

		return var_15_1 and var_15_0 or var_12_6
	end)

	local var_12_7 = 0

	if arg_12_2 then
		local var_12_8 = 0

		for iter_12_0 = 1, #arg_12_0.memories do
			if arg_12_0.memories[iter_12_0].id == arg_12_2 then
				var_12_8 = iter_12_0

				break
			end
		end

		if var_12_8 > 0 then
			local var_12_9 = arg_12_0.memoryItemList
			local var_12_10 = arg_12_0.memoryItemsGrid.cellSize.y + arg_12_0.memoryItemsGrid.spacing.y
			local var_12_11 = arg_12_0.memoryItemsGrid.constraintCount
			local var_12_12 = var_12_10 * math.ceil(#arg_12_0.memories / var_12_11)

			var_12_7 = (var_12_10 * math.floor((var_12_8 - 1) / var_12_11) + var_12_9.paddingFront) / (var_12_12 - arg_12_0.memoryItemViewport.rect.height)
			var_12_7 = Mathf.Clamp01(var_12_7)
		end
	end

	local var_12_13 = #arg_12_0.memories
	local var_12_14 = _.reduce(arg_12_0.memories, 0, function(arg_16_0, arg_16_1)
		if arg_16_1.is_open == 1 or pg.NewStoryMgr.GetInstance():IsPlayed(arg_16_1.story, true) then
			arg_16_0 = arg_16_0 + 1
		end

		return arg_16_0
	end)

	setText(arg_12_0._tf:Find("AD/task/ProgressText"), var_12_14 .. "/" .. var_12_13)
	setText(arg_12_0._tf:Find("AD/task/headline_bg/headline_name"), arg_12_1.title)

	function arg_12_0.memoryItemList.onUpdateItem(arg_17_0, arg_17_1)
		arg_12_0:onUpdateMemoryItem(arg_17_0 + 1, arg_17_1, var_12_3, var_12_1, var_12_14, var_12_13)
	end

	arg_12_0.memoryItemList:SetTotalCount(#arg_12_0.memories, var_12_7)
end

function var_0_0.CleanList(arg_18_0)
	arg_18_0.memories = nil

	arg_18_0.memoryItemList:SetTotalCount(0)
end

function var_0_0.UpdateView(arg_19_0)
	return
end

return var_0_0
