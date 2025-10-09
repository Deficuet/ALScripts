local var_0_0 = class("CoreScenarioTemplatePage", import("view.base.BaseSubView"))
local var_0_1 = import("Mgr/Pool/PoolPlural")

function var_0_0.getUIName(arg_1_0)
	return "AEBCSScenarioPage"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.storyLayer = arg_2_0._tf:Find("Story")
	arg_2_0.top = arg_2_0._tf:Find("Top")
	arg_2_0.storyHolder = arg_2_0._tf:Find("Story/Nodes")
	arg_2_0.storyContainer = arg_2_0.storyHolder:Find("Viewport/Content")
	arg_2_0.nodes = {}
	arg_2_0.progressText = arg_2_0._tf:Find("Story/Desc/Text")
	arg_2_0.storyAward = arg_2_0._tf:Find("Story/Award")
	arg_2_0.storyNodeTpl = arg_2_0._tf:Find("Story/NodeTemplate")
	arg_2_0.oneLineTpl = arg_2_0._tf:Find("Story/OneLine")
	arg_2_0.branchHeadTpl = arg_2_0._tf:Find("Story/BranchHead")
	arg_2_0.branchCenterTpl = arg_2_0._tf:Find("Story/BranchCenter")
	arg_2_0.branchUpTpl = arg_2_0._tf:Find("Story/BranchUp")
	arg_2_0.branchDownTpl = arg_2_0._tf:Find("Story/BranchDown")
	arg_2_0.unionTailTpl = arg_2_0._tf:Find("Story/UnionTail")
	arg_2_0.unionCenterTpl = arg_2_0._tf:Find("Story/UnionCenter")
	arg_2_0.unionUpTpl = arg_2_0._tf:Find("Story/UnionUp")
	arg_2_0.unionDownTpl = arg_2_0._tf:Find("Story/UnionDown")

	setActive(arg_2_0.storyNodeTpl, false)
	setActive(arg_2_0.oneLineTpl, false)
	setActive(arg_2_0.branchHeadTpl, false)
	setActive(arg_2_0.branchCenterTpl, false)
	setActive(arg_2_0.branchUpTpl, false)
	setActive(arg_2_0.branchDownTpl, false)
	setActive(arg_2_0.unionTailTpl, false)
	setActive(arg_2_0.unionCenterTpl, false)
	setActive(arg_2_0.unionUpTpl, false)
	setActive(arg_2_0.unionDownTpl, false)

	arg_2_0.pools = {
		[arg_2_0.storyNodeTpl] = var_0_1.New(go(arg_2_0.storyNodeTpl), 0),
		[arg_2_0.oneLineTpl] = var_0_1.New(go(arg_2_0.oneLineTpl), 0),
		[arg_2_0.branchHeadTpl] = var_0_1.New(go(arg_2_0.branchHeadTpl), 0),
		[arg_2_0.branchCenterTpl] = var_0_1.New(go(arg_2_0.branchCenterTpl), 0),
		[arg_2_0.branchUpTpl] = var_0_1.New(go(arg_2_0.branchUpTpl), 0),
		[arg_2_0.branchDownTpl] = var_0_1.New(go(arg_2_0.branchDownTpl), 0),
		[arg_2_0.unionTailTpl] = var_0_1.New(go(arg_2_0.unionTailTpl), 0),
		[arg_2_0.unionCenterTpl] = var_0_1.New(go(arg_2_0.unionCenterTpl), 0),
		[arg_2_0.unionUpTpl] = var_0_1.New(go(arg_2_0.unionUpTpl), 0),
		[arg_2_0.unionDownTpl] = var_0_1.New(go(arg_2_0.unionDownTpl), 0)
	}
	arg_2_0.nodeTplWidth = arg_2_0.storyNodeTpl.rect.width
	arg_2_0.oneLineWidth = arg_2_0.oneLineTpl.rect.width
	arg_2_0.oneLineHeight = arg_2_0.oneLineTpl.rect.height
	arg_2_0.branchHeadWidth = arg_2_0.branchHeadTpl.rect.width
	arg_2_0.branchUpWidth = arg_2_0.branchUpTpl.rect.width
	arg_2_0.branchUpHeight = arg_2_0.branchUpTpl.rect.height
	arg_2_0.UnionTailWidth = arg_2_0.unionTailTpl.rect.width
	arg_2_0.activeItems = {}
	arg_2_0.displayChapterIDs = {}
	arg_2_0.chapterTFsById = {}
	arg_2_0.storyNodeTFsById = {}

	setText(arg_2_0.storyLayer:Find("Desc/Desc"), i18n("series_enemy_storyreward"))
end

function var_0_0.SetCoreStoryPage(arg_3_0, arg_3_1)
	arg_3_0.coreStoryPage = arg_3_1
end

function var_0_0.SetActivity(arg_4_0, arg_4_1)
	arg_4_0.activity = arg_4_1

	arg_4_0:BuildStoryTree()
end

function var_0_0.BuildStoryTree(arg_5_0)
	arg_5_0.spStoryIDs = arg_5_0.activity:getConfig("config_client").storys
	arg_5_0.spStoryNodes = {}

	_.each(arg_5_0.spStoryIDs, function(arg_6_0)
		table.insert(arg_5_0.spStoryNodes, ActivitySpStoryNode.New({
			configId = arg_6_0
		}))
	end)

	arg_5_0.nodeRootList, arg_5_0.nodeChildDict = {}, {}

	_.each(arg_5_0.spStoryNodes, function(arg_7_0)
		local var_7_0 = arg_7_0:GetPreNodes()

		if #var_7_0 == 0 then
			table.insert(arg_5_0.nodeRootList, arg_7_0)
		else
			_.each(var_7_0, function(arg_8_0)
				arg_5_0.nodeChildDict[arg_8_0] = arg_5_0.nodeChildDict[arg_8_0] or {}

				table.insert(arg_5_0.nodeChildDict[arg_8_0], arg_7_0)
			end)
		end
	end)
end

function var_0_0.UpdateView(arg_9_0)
	arg_9_0:UpdateStoryNodeStatus()
	arg_9_0:UpdateStory()
	arg_9_0:Move2UnlockStory()
	arg_9_0:SwitchStoryMapAndBGM()
	setActive(arg_9_0.storyLayer, true)
	arg_9_0:TrySubmitTask()
end

function var_0_0.RecyclePools(arg_10_0)
	for iter_10_0 = #arg_10_0.activeItems, 1, -1 do
		local var_10_0 = arg_10_0.activeItems[iter_10_0]
		local var_10_1 = arg_10_0.pools[var_10_0.template]

		if var_10_0.template == arg_10_0.oneLineTpl then
			setSizeDelta(var_10_0.active, {
				x = arg_10_0.oneLineWidth,
				y = arg_10_0.oneLineHeight
			})
		end

		var_10_1:Enqueue(var_10_0.active)
	end

	table.clean(arg_10_0.activeItems)

	arg_10_0.storyNodeTFsById = {}
end

local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.UpdateStoryNodeStatus(arg_11_0)
	local var_11_0 = 0
	local var_11_1 = 0
	local var_11_2 = pg.NewStoryMgr.GetInstance()
	local var_11_3 = {}

	table.Foreach(arg_11_0.spStoryIDs, function(arg_12_0, arg_12_1)
		var_11_3[arg_12_1] = {}
	end)

	local var_11_4 = arg_11_0.spStoryNodes

	for iter_11_0 = 1, #var_11_4 do
		local var_11_5 = var_11_4[iter_11_0]
		local var_11_6 = var_11_5:GetConfigID()
		local var_11_7 = var_11_5:GetPreEvent()
		local var_11_8 = false
		local var_11_9 = var_11_7 == 0 and true or var_11_3[var_11_7].status == var_0_4
		local var_11_10 = var_0_2
		local var_11_11 = var_11_5:GetStoryName()
		local var_11_12 = false

		if var_11_11 and var_11_11 ~= "" then
			var_11_12 = var_11_2:IsPlayed(var_11_11)
			var_11_0 = var_11_0 + (var_11_12 and 1 or 0)
			var_11_1 = var_11_1 + 1
		end

		if not var_11_12 and var_11_9 then
			_.each(var_11_5:GetUnlockConditions(), function(arg_13_0)
				if arg_13_0[1] == ActivitySpStoryNode.CONDITION.TIME then
					local var_13_0 = pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_13_0[2])
					local var_13_1 = pg.TimeMgr.GetInstance():GetServerTime()

					var_11_9 = var_11_9 and var_13_0 <= var_13_1
				elseif arg_13_0[1] == ActivitySpStoryNode.CONDITION.PASSCHAPTER then
					local var_13_2 = arg_13_0[2]

					var_11_9 = var_11_9 and _.all(var_13_2, function(arg_14_0)
						return getProxy(ChapterProxy):getChapterById(arg_14_0, true):isClear()
					end)
				elseif arg_13_0[1] == ActivitySpStoryNode.CONDITION.PT then
					local var_13_3 = arg_13_0[2][1]
					local var_13_4 = arg_13_0[2][2]
					local var_13_5 = arg_13_0[2][3]
					local var_13_6 = 0

					if var_13_3 == DROP_TYPE_RESOURCE then
						var_13_6 = getProxy(PlayerProxy):getRawData():getResource(arg_13_0[2])
					elseif var_13_3 == DROP_TYPE_ITEM then
						var_13_6 = getProxy(BagProxy):getItemCountById(var_13_4)
					end

					var_11_9 = var_11_9 and var_13_5 <= var_13_6
				end
			end)
		end

		if var_11_12 then
			var_11_10 = var_0_4
		elseif var_11_9 then
			var_11_10 = var_0_3
		end

		var_11_3[var_11_6].status = var_11_10
	end

	arg_11_0.storyNodeStatus = var_11_3
	arg_11_0.storyReadCount, arg_11_0.storyReadMax = var_11_0, var_11_1
end

function var_0_0.UpdateStory(arg_15_0)
	arg_15_0:RecyclePools()

	local var_15_0 = {
		"43536c",
		"dbe7ea",
		"db6587"
	}
	local var_15_1 = 0
	local var_15_2 = 150
	local var_15_3 = 150
	local var_15_4 = arg_15_0.nodeTplWidth
	local var_15_5 = arg_15_0.oneLineWidth
	local var_15_6 = arg_15_0.branchHeadWidth
	local var_15_7 = arg_15_0.branchUpWidth
	local var_15_8 = arg_15_0.branchUpHeight
	local var_15_9 = arg_15_0.UnionTailWidth
	local var_15_10 = 95
	local var_15_11 = 82
	local var_15_12 = 20

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.nodeRootList) do
		local var_15_13 = 0
		local var_15_14 = {
			{
				node = iter_15_1,
				nodePos = Vector2.New(var_15_2, (iter_15_0 - 1) * 400)
			}
		}

		local function var_15_15()
			local var_16_0 = table.remove(var_15_14, 1)
			local var_16_1 = var_16_0.node:GetConfigID()

			;(function()
				local var_17_0 = arg_15_0:DequeItem(arg_15_0.storyNodeTpl)

				var_17_0.name = var_16_1

				setAnchoredPosition(var_17_0, var_16_0.nodePos)

				arg_15_0.storyNodeTFsById[var_16_1] = {
					nodeTF = tf(var_17_0)
				}
			end)()

			local var_16_2 = arg_15_0.nodeChildDict[var_16_1] or {}

			if #var_16_2 == 0 then
				var_15_13 = var_16_0.nodePos.x + var_15_4 + var_15_3
			elseif #var_16_2 == 1 then
				local var_16_3 = var_16_2[1]
				local var_16_4 = var_16_3:GetConfigID()
				local var_16_5 = arg_15_0:DequeItem(arg_15_0.oneLineTpl)

				var_16_5.name = string.format("Line%s_%s", var_16_1, var_16_4)

				setAnchoredPosition(var_16_5, var_16_0.nodePos + Vector2.New(var_15_4 + var_15_12, 0))

				nextPos = tf(var_16_5).anchoredPosition + Vector2.New(var_15_5 + var_15_10, 0)

				local var_16_6 = arg_15_0.storyNodeStatus[var_16_4].status

				eachChild(tf(var_16_5):Find("mask/Lines"), function(arg_18_0)
					setImageColor(arg_18_0, Color.NewHex(var_15_0[var_16_6]))
				end)
				table.insert(var_15_14, {
					node = var_16_3,
					nodePos = nextPos
				})
			elseif #var_16_2 > 1 then
				local var_16_7 = {}
				local var_16_8

				table.Ipairs(var_16_2, function(arg_19_0, arg_19_1)
					local var_19_0 = 0
					local var_19_1 = arg_19_1

					local function var_19_2()
						var_19_0 = var_19_0 + 1

						local var_20_0 = arg_15_0.nodeChildDict[var_19_1:GetConfigID()]

						assert(#var_20_0 <= 1)

						local var_20_1 = var_20_0[1]

						if var_20_1 and #var_20_1:GetPreNodes() == 1 then
							var_19_1 = var_20_1

							return true
						else
							var_16_8 = var_20_1
						end
					end

					while var_19_2() do
						-- block empty
					end

					var_16_7[arg_19_0] = var_19_0
				end)

				local var_16_9 = _.max(var_16_7)
				local var_16_10 = var_16_9 * (var_15_4 + var_15_10 + var_15_12) + (var_16_9 - 1) * var_15_5
				local var_16_11 = var_16_0.nodePos + Vector2.New(var_15_4 + var_15_12, 0)

				;(function()
					local var_21_0 = arg_15_0:DequeItem(arg_15_0.branchHeadTpl)

					setAnchoredPosition(var_21_0, var_16_11)

					var_16_11 = var_16_11 + Vector2.New(var_15_6, 0)

					local var_21_1 = arg_15_0.storyNodeStatus[var_16_2[1]:GetConfigID()].status

					eachChild(tf(var_21_0):Find("mask/Lines"), function(arg_22_0)
						setImageColor(arg_22_0, Color.NewHex(var_15_0[var_21_1]))
					end)
				end)()
				table.Ipairs(var_16_2, function(arg_23_0, arg_23_1)
					local var_23_0 = var_15_5

					if var_16_7[arg_23_0] < var_16_9 then
						local var_23_1 = var_16_7[arg_23_0]

						var_23_0 = (var_16_10 - var_23_1 * (var_15_4 + var_15_10 + var_15_12)) / (var_23_1 + 1)
					end

					local var_23_2 = arg_23_1:GetConfigID()
					local var_23_3 = var_16_11

					;(function()
						local var_24_0

						if arg_23_0 == 1 then
							var_24_0 = arg_15_0:DequeItem(arg_15_0.branchUpTpl)

							setAnchoredPosition(var_24_0, var_23_3)

							var_23_3 = var_23_3 + Vector2.New(var_15_7, var_15_8)

							if var_16_7[arg_23_0] < var_16_9 then
								setSizeDelta(var_24_0, {
									x = var_15_7 + var_23_0,
									y = var_15_8
								})

								local var_24_1 = tf(var_24_0):Find("Line_1").sizeDelta

								var_24_1.x = var_24_1.x + var_23_0

								setSizeDelta(tf(var_24_0):Find("Line_1"), var_24_1)

								var_23_3 = var_23_3 + Vector2.New(var_23_0, 0)
							end
						elseif arg_23_0 == 3 or arg_23_0 == 2 and #var_16_2 == 2 then
							var_24_0 = arg_15_0:DequeItem(arg_15_0.branchDownTpl)

							setAnchoredPosition(var_24_0, var_23_3)

							var_23_3 = var_23_3 + Vector2.New(var_15_7, -var_15_8)

							if var_16_7[arg_23_0] < var_16_9 then
								setSizeDelta(var_24_0, {
									x = var_15_7 + var_23_0,
									y = var_15_8
								})

								local var_24_2 = tf(var_24_0):Find("Line_1").sizeDelta

								var_24_2.x = var_24_2.x + var_23_0

								setSizeDelta(tf(var_24_0):Find("Line_1"), var_24_2)

								var_23_3 = var_23_3 + Vector2.New(var_23_0, 0)
							end
						else
							var_24_0 = arg_15_0:DequeItem(arg_15_0.branchCenterTpl)

							setAnchoredPosition(var_24_0, var_23_3)

							var_23_3 = var_23_3 + Vector2.New(var_15_7, 0)

							if var_16_7[arg_23_0] < var_16_9 then
								local var_24_3 = tf(var_24_0).sizeDelta

								var_24_3.x = var_24_3.x + var_23_0

								setSizeDelta(var_24_0, var_24_3)

								var_23_3 = var_23_3 + Vector2.New(var_23_0, 0)
							end
						end

						var_24_0.name = string.format("Branch%s_%s", var_16_1, var_23_2)

						local var_24_4 = arg_15_0.storyNodeStatus[var_23_2].status

						eachChild(tf(var_24_0):Find("mask/Lines"), function(arg_25_0)
							setImageColor(arg_25_0, Color.NewHex(var_15_0[var_24_4]))
						end)
					end)()

					var_23_3 = var_23_3 + Vector2.New(var_15_10, 0)

					local var_23_4 = arg_15_0:DequeItem(arg_15_0.storyNodeTpl)

					var_23_4.name = var_23_2

					setAnchoredPosition(var_23_4, var_23_3)

					arg_15_0.storyNodeTFsById[var_23_2] = {
						nodeTF = tf(var_23_4)
					}
					var_23_3 = var_23_3 + Vector2.New(var_15_4 + var_15_12, 0)

					local var_23_5 = arg_15_0.nodeChildDict[var_23_2][1]
					local var_23_6 = arg_23_1

					local function var_23_7()
						if not var_23_5 or var_23_5 == var_16_8 then
							return
						end

						local var_26_0 = arg_15_0:DequeItem(arg_15_0.oneLineTpl)

						var_26_0.name = string.format("Line%s_%s", var_23_6:GetConfigID(), var_23_5:GetConfigID())

						setAnchoredPosition(var_26_0, var_23_3)

						var_23_3 = var_23_3 + Vector2.New(var_23_0 + var_15_10, 0)

						setSizeDelta(var_26_0, {
							x = var_23_0,
							y = arg_15_0.oneLineHeight
						})

						local var_26_1 = arg_15_0.storyNodeStatus[var_23_5:GetConfigID()].status

						eachChild(tf(var_26_0):Find("mask/Lines"), function(arg_27_0)
							setImageColor(arg_27_0, Color.NewHex(var_15_0[var_26_1]))
						end)

						local var_26_2 = arg_15_0:DequeItem(arg_15_0.storyNodeTpl)

						var_26_2.name = var_23_5:GetConfigID()

						setAnchoredPosition(var_26_2, var_23_3)

						arg_15_0.storyNodeTFsById[var_23_5:GetConfigID()] = {
							nodeTF = tf(var_26_2)
						}
						var_23_3 = var_23_3 + Vector2.New(var_15_4 + var_15_12, 0)
						var_23_5, var_23_6 = arg_15_0.nodeChildDict[var_23_5:GetConfigID()][1], var_23_5

						return true
					end

					while var_23_7() do
						-- block empty
					end

					if var_16_8 then
						local var_23_8

						if arg_23_0 == 1 then
							var_23_8 = arg_15_0:DequeItem(arg_15_0.unionUpTpl)

							setAnchoredPosition(var_23_8, var_23_3)

							if var_16_7[arg_23_0] < var_16_9 then
								setSizeDelta(var_23_8, {
									x = var_15_7 + var_23_0,
									y = var_15_8
								})

								local var_23_9 = tf(var_23_8):Find("Line_1").sizeDelta

								var_23_9.x = var_23_9.x + var_23_0

								setSizeDelta(tf(var_23_8):Find("Line_1"), var_23_9)

								var_23_3 = var_23_3 + Vector2.New(var_23_0, 0)
							end
						elseif arg_23_0 == 3 or arg_23_0 == 2 and #var_16_2 == 2 then
							var_23_8 = arg_15_0:DequeItem(arg_15_0.unionDownTpl)

							setAnchoredPosition(var_23_8, var_23_3)

							if var_16_7[arg_23_0] < var_16_9 then
								setSizeDelta(var_23_8, {
									x = var_15_7 + var_23_0,
									y = var_15_8
								})

								local var_23_10 = tf(var_23_8):Find("Line_1").sizeDelta

								var_23_10.x = var_23_10.x + var_23_0

								setSizeDelta(tf(var_23_8):Find("Line_1"), var_23_10)

								var_23_3 = var_23_3 + Vector2.New(var_23_0, 0)
							end
						else
							var_23_8 = arg_15_0:DequeItem(arg_15_0.unionCenterTpl)

							setAnchoredPosition(var_23_8, var_23_3)

							if var_16_7[arg_23_0] < var_16_9 then
								local var_23_11 = tf(var_23_8).sizeDelta

								var_23_11.x = var_23_11.x + var_23_0

								setSizeDelta(var_23_8, var_23_11)

								var_23_3 = var_23_3 + Vector2.New(var_23_0, 0)
							end
						end

						var_23_8.name = string.format("Union%s_%s", var_23_6:GetConfigID(), var_16_8:GetConfigID())

						local var_23_12 = arg_15_0.storyNodeStatus[var_16_8:GetConfigID()].status

						eachChild(tf(var_23_8):Find("mask/Lines"), function(arg_28_0)
							setImageColor(arg_28_0, Color.NewHex(var_15_0[var_23_12]))
						end)
					end
				end)

				var_16_11 = var_16_11 + Vector2.New(var_16_10 + var_15_7, 0)

				if var_16_8 then
					(function()
						var_16_11 = var_16_11 + Vector2.New(var_15_7, 0)

						local var_29_0 = arg_15_0:DequeItem(arg_15_0.unionTailTpl)

						setAnchoredPosition(var_29_0, var_16_11)

						var_16_11 = var_16_11 + Vector2.New(var_15_9 + var_15_11, 0)

						local var_29_1 = arg_15_0.storyNodeStatus[var_16_8:GetConfigID()].status

						eachChild(tf(var_29_0):Find("mask/Lines"), function(arg_30_0)
							setImageColor(arg_30_0, Color.NewHex(var_15_0[var_29_1]))
						end)
					end)()
					table.insert(var_15_14, {
						node = var_16_8,
						nodePos = var_16_11
					})
				else
					var_15_13 = var_16_11 + var_15_3
				end
			end

			return next(var_15_14)
		end

		while var_15_15() do
			-- block empty
		end

		var_15_1 = math.max(var_15_1, var_15_13)
	end

	setSizeDelta(arg_15_0.storyContainer, {
		x = var_15_1
	})

	local var_15_16 = arg_15_0.spStoryNodes

	for iter_15_2 = 1, #var_15_16 do
		local var_15_17 = var_15_16[iter_15_2]
		local var_15_18 = var_15_17:GetConfigID()
		local var_15_19 = arg_15_0.storyNodeStatus[var_15_18].status
		local var_15_20 = arg_15_0.storyNodeTFsById[var_15_18].nodeTF
		local var_15_21 = var_15_20:Find("info/bk/title_form/title")

		if var_15_19 == var_0_2 then
			setScrollText(var_15_21, HXSet.hxLan(var_15_17:GetUnlockDesc()))
			setTextAlpha(var_15_21, 0.5)
		else
			setScrollText(var_15_21, HXSet.hxLan(var_15_17:GetDisplayName()))
			setTextAlpha(var_15_21, 1)
		end

		local var_15_22 = var_15_17:GetType()

		setActive(var_15_20:Find("circle/lock"), var_15_19 == var_0_2)

		if var_15_19 == var_0_2 then
			setActive(var_15_20:Find("circle/Story"), false)
			setActive(var_15_20:Find("circle/Battle"), false)
			setText(var_15_20:Find(""))
		elseif var_15_22 == ActivitySpStoryNode.NODE_TYPE.STORY then
			setActive(var_15_20:Find("circle/Story"), var_15_22 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_15_20:Find("circle/Battle"), var_15_22 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_15_20:Find("circle/Story/Done"), var_15_19 == var_0_4)
		elseif var_15_22 == ActivitySpStoryNode.NODE_TYPE.BATTLE then
			setActive(var_15_20:Find("circle/Story"), var_15_22 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_15_20:Find("circle/Battle"), var_15_22 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_15_20:Find("circle/Battle/Done"), var_15_19 == var_0_4)
		end

		setActive(var_15_20:Find("circle/bk/Inactive"), var_15_19 == var_0_2)
		setActive(var_15_20:Find("circle/bk/Active"), var_15_19 == var_0_3)
		setActive(var_15_20:Find("circle/bk/Readed"), var_15_19 == var_0_4)
		setActive(var_15_20:Find("info/bk/BG/Inactive"), var_15_19 == var_0_2)
		setActive(var_15_20:Find("info/bk/BG/Active"), var_15_19 ~= var_0_2)
		onButton(arg_15_0, var_15_20, function()
			if var_15_19 == var_0_2 then
				return
			end

			local var_31_0 = var_15_17:GetStoryName()

			arg_15_0:PlayStory(var_31_0, function()
				arg_15_0:UpdateView()

				arg_15_0.needFocusStory = true

				arg_15_0:Move2UnlockStory()
			end, true)
		end)
	end

	local var_15_23 = arg_15_0.storyReadCount
	local var_15_24 = arg_15_0.storyReadMax

	setText(arg_15_0.progressText, var_15_23 .. "/" .. var_15_24)
	setActive(arg_15_0.storyAward, tobool(arg_15_0.storyTask))

	if arg_15_0.storyTask then
		local var_15_25 = arg_15_0.storyTask:getConfig("award_display")
		local var_15_26 = Drop.New({
			type = var_15_25[1][1],
			id = var_15_25[1][2],
			count = var_15_25[1][3]
		})

		updateDrop(arg_15_0.storyAward:Find("IconTpl"), var_15_26)

		local var_15_27 = arg_15_0.storyTask:getTaskStatus()

		setActive(arg_15_0.storyAward:Find("get"), var_15_27 == 1)
		setActive(arg_15_0.storyAward:Find("got"), var_15_27 == 2)
		onButton(arg_15_0, arg_15_0.storyAward, function()
			arg_15_0.coreStoryPage:emit(BaseUI.ON_DROP, var_15_26)
		end)
	end
end

function var_0_0.DequeItem(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0.pools[arg_34_1]:Dequeue()

	table.insert(arg_34_0.activeItems, {
		template = arg_34_1,
		active = var_34_0
	})
	setActive(var_34_0, true)
	setParent(var_34_0, arg_34_0.storyContainer)

	return var_34_0
end

function var_0_0.Move2UnlockStory(arg_35_0)
	if not arg_35_0.needFocusStory then
		return
	end

	arg_35_0.needFocusStory = nil

	local var_35_0 = arg_35_0.spStoryNodes
	local var_35_1

	for iter_35_0 = #var_35_0, 1, -1 do
		local var_35_2 = var_35_0[iter_35_0]:GetConfigID()

		if arg_35_0.storyNodeStatus[var_35_2].status > var_0_2 then
			var_35_1 = var_35_2

			break
		end
	end

	local var_35_3 = arg_35_0.storyNodeTFsById[var_35_1].nodeTF
	local var_35_4 = arg_35_0.storyNodeTpl.rect.width
	local var_35_5 = var_35_3.anchoredPosition.x + var_35_4 * 0.5 - arg_35_0.storyContainer.parent.rect.width * 0.5
	local var_35_6 = math.clamp(var_35_5, 0, math.max(0, arg_35_0.storyContainer.rect.width - arg_35_0.storyContainer.parent.rect.width))

	setAnchoredPosition(arg_35_0.storyContainer, {
		x = -var_35_6
	})
end

function var_0_0.SwitchStoryMapAndBGM(arg_36_0)
	local var_36_0 = arg_36_0.activity:getConfig("config_client").default_background
	local var_36_1 = arg_36_0.activity:getConfig("config_client").default_bgm
	local var_36_2
	local var_36_3 = arg_36_0.spStoryNodes

	for iter_36_0 = 1, #var_36_3 do
		local var_36_4 = var_36_3[iter_36_0]
		local var_36_5 = var_36_4:GetConfigID()

		if arg_36_0.storyNodeStatus[var_36_5].status == var_0_4 then
			local var_36_6 = var_36_4:GetCleanAnimator()

			var_36_0 = var_36_4:GetCleanBG() ~= "" and var_36_4:GetCleanBG() or var_36_0

			if var_36_4:GetCleanBGM() ~= "" then
				var_36_1 = var_36_4:GetCleanBGM() or var_36_1
			end
		else
			break
		end
	end

	if var_36_0 ~= nil and var_36_0 ~= "" then
		arg_36_0.coreStoryPage:SwitchBG({
			{
				BG = var_36_0
			}
		})
	end

	if var_36_1 ~= nil and var_36_1 ~= "" then
		pg.BgmMgr.GetInstance():Push(arg_36_0.__cname, var_36_1)
	end
end

function var_0_0.TrySubmitTask(arg_37_0)
	local var_37_0 = true

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.spStoryNodes) do
		local var_37_1 = iter_37_1:GetStoryName()

		if var_37_1 and var_37_1 ~= "" then
			var_37_0 = var_37_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_37_1)
		end

		if not var_37_0 then
			break
		end
	end

	if var_37_0 and arg_37_0.storyTask and arg_37_0.storyTask:getTaskStatus() == 1 then
		arg_37_0.coreStoryPage:emit(ActivityMediator.ON_TASK_SUBMIT, arg_37_0.storyTask)

		return
	end
end

function var_0_0.PlayStory(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	if not arg_38_1 then
		return existCall(arg_38_2)
	end

	local var_38_0 = pg.NewStoryMgr.GetInstance()
	local var_38_1 = var_38_0:IsPlayed(arg_38_1)

	seriesAsync({
		function(arg_39_0)
			if var_38_1 and not arg_38_3 then
				return arg_39_0()
			end

			local var_39_0 = tonumber(arg_38_1)

			if var_39_0 and var_39_0 > 0 then
				arg_38_0.coreStoryPage:emit(ActivityMediator.GO_PERFORM_COMBAT, {
					stageId = var_39_0
				})
			else
				var_38_0:Play(arg_38_1, arg_39_0, arg_38_3)
			end
		end,
		function(arg_40_0, ...)
			existCall(arg_38_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_41_0)
	local var_41_0 = arg_41_0.activity:getConfig("config_client").task_id
	local var_41_1 = getProxy(TaskProxy):getTaskVO(var_41_0)

	if not var_41_1 then
		errorMsg("Missing Activity Task ID : " .. var_41_0)
	end

	arg_41_0.storyTask = var_41_1 or Task.New({
		id = var_41_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_42_0)
	arg_42_0:UpdateView()
end

function var_0_0.OnDestroy(arg_43_0)
	arg_43_0:RecyclePools()

	for iter_43_0, iter_43_1 in pairs(arg_43_0.pools) do
		iter_43_1:Clear()
	end
end

return var_0_0
