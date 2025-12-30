local var_0_0 = class("CoreScenarioTemplatePage", import("view.base.BaseSubView"))
local var_0_1 = import("Mgr/Pool/PoolPlural")

var_0_0.LINE_COLOR = {
	"43536c",
	"dbe7ea",
	"db6587"
}

function var_0_0.getUIName(arg_1_0)
	return "AEBCSScenarioPage"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.storyLayer = arg_2_0._tf:Find("Story")
	arg_2_0.top = arg_2_0._tf:Find("TopPage")
	arg_2_0.storyHolder = arg_2_0._tf:Find("Story/Nodes")
	arg_2_0.storyContainer = arg_2_0.storyHolder:Find("Viewport/Content")
	arg_2_0.nodes = {}
	arg_2_0.progressText = arg_2_0._tf:Find("TopPage/Desc/Text")
	arg_2_0.storyAward = arg_2_0._tf:Find("TopPage/Award")
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
	arg_2_0.unreleasedNodeTpl = arg_2_0._tf:Find("Story/UnreleasedNode")

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
	setActive(arg_2_0.unreleasedNodeTpl, false)

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
		[arg_2_0.unionDownTpl] = var_0_1.New(go(arg_2_0.unionDownTpl), 0),
		[arg_2_0.unreleasedNodeTpl] = var_0_1.New(go(arg_2_0.unreleasedNodeTpl), 0)
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
	arg_2_0.topPage = arg_2_0._tf:Find("TopPage")
	arg_2_0.backBtn = arg_2_0._tf:Find("TopPage/top/btn_back")
	arg_2_0.homeBtn = arg_2_0._tf:Find("TopPage/top/btn_home")

	onButton(arg_2_0, arg_2_0.backBtn, function()
		arg_2_0:Hide()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.homeBtn, function()
		arg_2_0.event:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	setText(arg_2_0._tf:Find("TopPage/Desc/Desc"), i18n("series_enemy_storyreward"))
end

function var_0_0.SetCoreStoryPage(arg_5_0, arg_5_1)
	arg_5_0.coreStoryPage = arg_5_1
end

function var_0_0.SetActivity(arg_6_0, arg_6_1)
	arg_6_0.activity = arg_6_1

	arg_6_0:BuildStoryTree()
end

function var_0_0.BuildStoryTree(arg_7_0)
	arg_7_0.spStoryIDs = arg_7_0.activity:getConfig("config_client").storys
	arg_7_0.spStoryNodes = {}

	_.each(arg_7_0.spStoryIDs, function(arg_8_0)
		table.insert(arg_7_0.spStoryNodes, ActivitySpStoryNode.New({
			configId = arg_8_0
		}))
	end)

	arg_7_0.nodeRootList, arg_7_0.nodeChildDict = {}, {}

	_.each(arg_7_0.spStoryNodes, function(arg_9_0)
		local var_9_0 = arg_9_0:GetPreNodes()

		if #var_9_0 == 0 then
			table.insert(arg_7_0.nodeRootList, arg_9_0)
		else
			_.each(var_9_0, function(arg_10_0)
				arg_7_0.nodeChildDict[arg_10_0] = arg_7_0.nodeChildDict[arg_10_0] or {}

				table.insert(arg_7_0.nodeChildDict[arg_10_0], arg_9_0)
			end)
		end
	end)
end

function var_0_0.IsShowRed(arg_11_0, arg_11_1)
	arg_11_0:SetActivity(arg_11_1)
	arg_11_0:UpdateStoryNodeStatus()

	local var_11_0 = false

	for iter_11_0 = 1, #arg_11_0.spStoryNodes do
		local var_11_1 = arg_11_0.spStoryNodes[iter_11_0]

		arg_11_0:checkRequireBlock(var_11_1)

		if arg_11_0.spStoryUnlockNode then
			var_11_0 = true

			break
		end
	end

	arg_11_0.spStoryUnlockNode = nil
	arg_11_0.spStoryUnreleasedNode = nil

	return var_11_0
end

function var_0_0.UpdateView(arg_12_0, arg_12_1)
	arg_12_0:UpdateStoryNodeStatus()
	arg_12_0:UpdateStory(arg_12_1)
	arg_12_0:Move2UnlockStory()
	arg_12_0:SwitchStoryMapAndBGM()
	setActive(arg_12_0.storyLayer, true)
	arg_12_0:TrySubmitTask()
end

function var_0_0.RecyclePools(arg_13_0)
	for iter_13_0 = #arg_13_0.activeItems, 1, -1 do
		local var_13_0 = arg_13_0.activeItems[iter_13_0]
		local var_13_1 = arg_13_0.pools[var_13_0.template]

		if var_13_0.template == arg_13_0.oneLineTpl then
			setSizeDelta(var_13_0.active, {
				x = arg_13_0.oneLineWidth,
				y = arg_13_0.oneLineHeight
			})
		end

		var_13_1:Enqueue(var_13_0.active)
	end

	table.clean(arg_13_0.activeItems)

	arg_13_0.storyNodeTFsById = {}
end

local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.UpdateStoryNodeStatus(arg_14_0)
	local var_14_0 = 0
	local var_14_1 = 0
	local var_14_2 = pg.NewStoryMgr.GetInstance()
	local var_14_3 = {}

	table.Foreach(arg_14_0.spStoryIDs, function(arg_15_0, arg_15_1)
		var_14_3[arg_15_1] = {}
	end)

	local var_14_4 = arg_14_0.spStoryNodes

	for iter_14_0 = 1, #var_14_4 do
		local var_14_5 = var_14_4[iter_14_0]
		local var_14_6 = var_14_5:GetConfigID()
		local var_14_7 = var_14_5:GetPreEvent()
		local var_14_8 = true
		local var_14_9 = var_0_2
		local var_14_10 = var_14_5:GetStoryName()
		local var_14_11 = false

		if var_14_10 and var_14_10 ~= "" then
			var_14_11 = var_14_2:IsPlayed(var_14_10)
			var_14_0 = var_14_0 + (var_14_11 and 1 or 0)
			var_14_1 = var_14_1 + 1
		end

		if not var_14_11 then
			_.each(var_14_5:GetUnlockConditions(), function(arg_16_0)
				if arg_16_0[1] == ActivitySpStoryNode.CONDITION.TIME then
					local var_16_0 = pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_16_0[2])
					local var_16_1 = pg.TimeMgr.GetInstance():GetServerTime()

					var_14_8 = var_14_8 and var_16_0 <= var_16_1
				elseif arg_16_0[1] == ActivitySpStoryNode.CONDITION.PASSCHAPTER then
					local var_16_2 = arg_16_0[2]

					var_14_8 = var_14_8 and _.all(var_16_2, function(arg_17_0)
						return getProxy(ChapterProxy):getChapterById(arg_17_0, true):isClear()
					end)
				elseif arg_16_0[1] == ActivitySpStoryNode.CONDITION.PT then
					local var_16_3 = arg_16_0[2][1]
					local var_16_4 = arg_16_0[2][2]
					local var_16_5 = arg_16_0[2][3]
					local var_16_6 = 0

					if var_16_3 == DROP_TYPE_RESOURCE then
						var_16_6 = getProxy(PlayerProxy):getRawData():getResource(arg_16_0[2][2])
					elseif var_16_3 == DROP_TYPE_ITEM then
						var_16_6 = getProxy(BagProxy):getItemCountById(var_16_4)
					end

					var_14_8 = var_14_8 and var_16_5 <= var_16_6
					var_14_3[var_14_6].reuqire = var_16_5
				elseif arg_16_0[1] == ActivitySpStoryNode.CONDITION.PRE_PASSED then
					var_14_8 = var_14_3[var_14_5:GetPreEvent()].status == var_0_4
				end
			end)
		end

		if var_14_11 then
			var_14_9 = var_0_4
		elseif var_14_8 then
			var_14_9 = var_0_3
		end

		var_14_3[var_14_6].status = var_14_9
	end

	arg_14_0.storyNodeStatus = var_14_3
	arg_14_0.storyReadCount, arg_14_0.storyReadMax = var_14_0, var_14_1
end

function var_0_0.checkRequireBlock(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1:GetConfigID()
	local var_18_1 = arg_18_0.storyNodeStatus[var_18_0]

	if var_18_1.reuqire and var_18_1.status ~= var_0_4 and arg_18_1:GetCleanAnimator() then
		if var_18_1.status == var_0_2 then
			arg_18_0.spStoryUnreleasedNode = arg_18_1

			return false
		elseif var_18_1.status == var_0_3 then
			local var_18_2 = getProxy(PlayerProxy):getRawData().id

			if PlayerPrefs.GetInt("player_" .. var_18_2 .. "_activity_spStoryNodeID_" .. var_18_0 .. "_unlock", 0) == 0 then
				arg_18_0.spStoryUnlockNode = arg_18_1

				return false
			end
		end
	end

	return true
end

function var_0_0.UpdateStory(arg_19_0, arg_19_1)
	arg_19_0:RecyclePools()

	local var_19_0 = arg_19_0.LINE_COLOR
	local var_19_1 = 0
	local var_19_2 = 150
	local var_19_3 = 150
	local var_19_4 = arg_19_0.nodeTplWidth
	local var_19_5 = arg_19_0.oneLineWidth
	local var_19_6 = arg_19_0.branchHeadWidth
	local var_19_7 = arg_19_0.branchUpWidth
	local var_19_8 = arg_19_0.branchUpHeight
	local var_19_9 = arg_19_0.UnionTailWidth
	local var_19_10 = 95
	local var_19_11 = 82
	local var_19_12 = 20
	local var_19_13 = 0
	local var_19_14 = pg.NewStoryMgr.GetInstance()

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.nodeRootList) do
		local var_19_15 = {
			{
				node = iter_19_1,
				nodePos = Vector2.New(var_19_2, (iter_19_0 - 1) * 400)
			}
		}

		local function var_19_16()
			local var_20_0 = table.remove(var_19_15, 1)
			local var_20_1 = var_20_0.node

			if not arg_19_0:checkRequireBlock(var_20_1) then
				var_19_13 = var_20_0.nodePos.x + var_19_3

				return false
			end

			local var_20_2 = var_20_1:GetConfigID()

			;(function()
				local var_21_0 = arg_19_0:DequeItem(arg_19_0.storyNodeTpl, arg_19_1)

				var_21_0.name = var_20_2

				setAnchoredPosition(var_21_0, var_20_0.nodePos)

				arg_19_0.storyNodeTFsById[var_20_2] = {
					nodeTF = tf(var_21_0)
				}
			end)()

			local var_20_3 = arg_19_0.nodeChildDict[var_20_2] or {}

			if #var_20_3 == 0 then
				var_19_13 = var_20_0.nodePos.x + var_19_4 + var_19_3
			elseif #var_20_3 == 1 then
				local var_20_4 = var_20_3[1]
				local var_20_5 = var_20_4:GetConfigID()
				local var_20_6 = arg_19_0:DequeItem(arg_19_0.oneLineTpl, arg_19_1)

				var_20_6.name = string.format("Line%s_%s", var_20_2, var_20_5)

				setAnchoredPosition(var_20_6, var_20_0.nodePos + Vector2.New(var_19_4 + var_19_12, 0))

				nextPos = tf(var_20_6).anchoredPosition + Vector2.New(var_19_5 + var_19_10, 0)

				local var_20_7 = arg_19_0.storyNodeStatus[var_20_5].status
				local var_20_8 = tf(var_20_6):Find("mask/Lines")

				eachChild(var_20_8, function(arg_22_0)
					setImageColor(arg_22_0, Color.NewHex(var_19_0[var_20_7]))
				end)
				table.insert(var_19_15, {
					node = var_20_4,
					nodePos = nextPos
				})
			elseif #var_20_3 > 1 then
				local var_20_9 = {}
				local var_20_10

				table.Ipairs(var_20_3, function(arg_23_0, arg_23_1)
					local var_23_0 = 0
					local var_23_1 = arg_23_1

					local function var_23_2()
						var_23_0 = var_23_0 + 1

						local var_24_0 = arg_19_0.nodeChildDict[var_23_1:GetConfigID()]

						assert(#var_24_0 <= 1)

						local var_24_1 = var_24_0[1]

						if var_24_1 and #var_24_1:GetPreNodes() == 1 then
							var_23_1 = var_24_1

							return true
						else
							var_20_10 = var_24_1
						end
					end

					while var_23_2() do
						-- block empty
					end

					var_20_9[arg_23_0] = var_23_0
				end)

				local var_20_11 = _.max(var_20_9)
				local var_20_12 = var_20_11 * (var_19_4 + var_19_10 + var_19_12) + (var_20_11 - 1) * var_19_5
				local var_20_13 = var_20_0.nodePos + Vector2.New(var_19_4 + var_19_12, 0)

				;(function()
					local var_25_0 = arg_19_0:DequeItem(arg_19_0.branchHeadTpl, arg_19_1)

					setAnchoredPosition(var_25_0, var_20_13)

					var_20_13 = var_20_13 + Vector2.New(var_19_6, 0)

					local var_25_1 = arg_19_0.storyNodeStatus[var_20_3[1]:GetConfigID()].status
					local var_25_2 = tf(var_25_0):Find("mask/Lines")

					eachChild(var_25_2, function(arg_26_0)
						setImageColor(arg_26_0, Color.NewHex(var_19_0[var_25_1]))
					end)
				end)()

				local var_20_14

				table.Ipairs(var_20_3, function(arg_27_0, arg_27_1)
					local var_27_0 = var_19_5

					if var_20_9[arg_27_0] < var_20_11 then
						local var_27_1 = var_20_9[arg_27_0]

						var_27_0 = (var_20_12 - var_27_1 * (var_19_4 + var_19_10 + var_19_12)) / (var_27_1 + 1)
					end

					local var_27_2 = arg_27_1:GetConfigID()
					local var_27_3 = var_20_13

					;(function()
						local var_28_0

						if arg_27_0 == 1 then
							var_28_0 = arg_19_0:DequeItem(arg_19_0.branchUpTpl, arg_19_1)

							setAnchoredPosition(var_28_0, var_27_3)

							var_27_3 = var_27_3 + Vector2.New(var_19_7, var_19_8)

							if var_20_9[arg_27_0] < var_20_11 then
								setSizeDelta(var_28_0, {
									x = var_19_7 + var_27_0,
									y = var_19_8
								})

								local var_28_1 = tf(var_28_0):Find("Line_1").sizeDelta

								var_28_1.x = var_28_1.x + var_27_0

								setSizeDelta(tf(var_28_0):Find("Line_1"), var_28_1)

								var_27_3 = var_27_3 + Vector2.New(var_27_0, 0)
							end
						elseif arg_27_0 == 3 or arg_27_0 == 2 and #var_20_3 == 2 then
							var_28_0 = arg_19_0:DequeItem(arg_19_0.branchDownTpl, arg_19_1)

							setAnchoredPosition(var_28_0, var_27_3)

							var_27_3 = var_27_3 + Vector2.New(var_19_7, -var_19_8)

							if var_20_9[arg_27_0] < var_20_11 then
								setSizeDelta(var_28_0, {
									x = var_19_7 + var_27_0,
									y = var_19_8
								})

								local var_28_2 = tf(var_28_0):Find("Line_1").sizeDelta

								var_28_2.x = var_28_2.x + var_27_0

								setSizeDelta(tf(var_28_0):Find("Line_1"), var_28_2)

								var_27_3 = var_27_3 + Vector2.New(var_27_0, 0)
							end
						else
							var_28_0 = arg_19_0:DequeItem(arg_19_0.branchCenterTpl, arg_19_1)

							setAnchoredPosition(var_28_0, var_27_3)

							var_27_3 = var_27_3 + Vector2.New(var_19_7, 0)

							if var_20_9[arg_27_0] < var_20_11 then
								local var_28_3 = tf(var_28_0).sizeDelta

								var_28_3.x = var_28_3.x + var_27_0

								setSizeDelta(var_28_0, var_28_3)

								var_27_3 = var_27_3 + Vector2.New(var_27_0, 0)
							end
						end

						var_28_0.name = string.format("Branch%s_%s", var_20_2, var_27_2)

						local var_28_4 = arg_19_0.storyNodeStatus[var_27_2].status
						local var_28_5 = tf(var_28_0):Find("mask/Lines")

						eachChild(var_28_5, function(arg_29_0)
							setImageColor(arg_29_0, Color.NewHex(var_19_0[var_28_4]))
						end)
					end)()

					var_27_3 = var_27_3 + Vector2.New(var_19_10, 0)

					if not arg_19_0:checkRequireBlock(arg_27_1) then
						var_19_13 = var_27_3.x
						var_20_14 = true

						return
					end

					local var_27_4 = arg_19_0:DequeItem(arg_19_0.storyNodeTpl, arg_19_1)

					var_27_4.name = var_27_2

					setAnchoredPosition(var_27_4, var_27_3)

					arg_19_0.storyNodeTFsById[var_27_2] = {
						nodeTF = tf(var_27_4)
					}
					var_27_3 = var_27_3 + Vector2.New(var_19_4 + var_19_12, 0)

					local var_27_5 = arg_19_0.nodeChildDict[var_27_2][1]
					local var_27_6 = arg_27_1

					local function var_27_7()
						if not var_27_5 or var_27_5 == var_20_10 then
							return
						end

						local var_30_0 = arg_19_0:DequeItem(arg_19_0.oneLineTpl, arg_19_1)

						var_30_0.name = string.format("Line%s_%s", var_27_6:GetConfigID(), var_27_5:GetConfigID())

						setAnchoredPosition(var_30_0, var_27_3)

						var_27_3 = var_27_3 + Vector2.New(var_27_0 + var_19_10, 0)

						setSizeDelta(var_30_0, {
							x = var_27_0,
							y = arg_19_0.oneLineHeight
						})

						local var_30_1 = arg_19_0.storyNodeStatus[var_27_5:GetConfigID()].status
						local var_30_2 = tf(var_30_0):Find("mask/Lines")

						eachChild(var_30_2, function(arg_31_0)
							setImageColor(arg_31_0, Color.NewHex(var_19_0[var_30_1]))
						end)

						if not arg_19_0:checkRequireBlock(var_27_5) then
							var_19_13 = var_27_3.x
							var_20_14 = true

							return
						end

						local var_30_3 = arg_19_0:DequeItem(arg_19_0.storyNodeTpl, arg_19_1)

						var_30_3.name = var_27_5:GetConfigID()

						setAnchoredPosition(var_30_3, var_27_3)

						arg_19_0.storyNodeTFsById[var_27_5:GetConfigID()] = {
							nodeTF = tf(var_30_3)
						}
						var_27_3 = var_27_3 + Vector2.New(var_19_4 + var_19_12, 0)
						var_27_5, var_27_6 = arg_19_0.nodeChildDict[var_27_5:GetConfigID()][1], var_27_5

						return true
					end

					while var_27_7() do
						-- block empty
					end

					if var_20_10 then
						local var_27_8

						if arg_27_0 == 1 then
							var_27_8 = arg_19_0:DequeItem(arg_19_0.unionUpTpl, arg_19_1)

							setAnchoredPosition(var_27_8, var_27_3)

							if var_20_9[arg_27_0] < var_20_11 then
								setSizeDelta(var_27_8, {
									x = var_19_7 + var_27_0,
									y = var_19_8
								})

								local var_27_9 = tf(var_27_8):Find("Line_1").sizeDelta

								var_27_9.x = var_27_9.x + var_27_0

								setSizeDelta(tf(var_27_8):Find("Line_1"), var_27_9)

								var_27_3 = var_27_3 + Vector2.New(var_27_0, 0)
							end
						elseif arg_27_0 == 3 or arg_27_0 == 2 and #var_20_3 == 2 then
							var_27_8 = arg_19_0:DequeItem(arg_19_0.unionDownTpl, arg_19_1)

							setAnchoredPosition(var_27_8, var_27_3)

							if var_20_9[arg_27_0] < var_20_11 then
								setSizeDelta(var_27_8, {
									x = var_19_7 + var_27_0,
									y = var_19_8
								})

								local var_27_10 = tf(var_27_8):Find("Line_1").sizeDelta

								var_27_10.x = var_27_10.x + var_27_0

								setSizeDelta(tf(var_27_8):Find("Line_1"), var_27_10)

								var_27_3 = var_27_3 + Vector2.New(var_27_0, 0)
							end
						else
							var_27_8 = arg_19_0:DequeItem(arg_19_0.unionCenterTpl, arg_19_1)

							setAnchoredPosition(var_27_8, var_27_3)

							if var_20_9[arg_27_0] < var_20_11 then
								local var_27_11 = tf(var_27_8).sizeDelta

								var_27_11.x = var_27_11.x + var_27_0

								setSizeDelta(var_27_8, var_27_11)

								var_27_3 = var_27_3 + Vector2.New(var_27_0, 0)
							end
						end

						var_27_8.name = string.format("Union%s_%s", var_27_6:GetConfigID(), var_20_10:GetConfigID())

						local var_27_12 = arg_19_0.storyNodeStatus[var_20_10:GetConfigID()].status
						local var_27_13 = tf(var_27_8):Find("mask/Lines")

						eachChild(var_27_13, function(arg_32_0)
							setImageColor(arg_32_0, Color.NewHex(var_19_0[var_27_12]))
						end)
					end
				end)

				if var_20_14 then
					return false
				end

				var_20_13 = var_20_13 + Vector2.New(var_20_12 + var_19_7, 0)

				if var_20_10 then
					(function()
						var_20_13 = var_20_13 + Vector2.New(var_19_7, 0)

						local var_33_0 = arg_19_0:DequeItem(arg_19_0.unionTailTpl, arg_19_1)

						setAnchoredPosition(var_33_0, var_20_13)

						var_20_13 = var_20_13 + Vector2.New(var_19_9 + var_19_11, 0)

						local var_33_1 = arg_19_0.storyNodeStatus[var_20_10:GetConfigID()].status
						local var_33_2 = tf(var_33_0):Find("mask/Lines")

						eachChild(var_33_2, function(arg_34_0)
							setImageColor(arg_34_0, Color.NewHex(var_19_0[var_33_1]))
						end)
					end)()
					table.insert(var_19_15, {
						node = var_20_10,
						nodePos = var_20_13
					})
				else
					var_19_13 = var_20_13 + var_19_3
				end
			end

			return next(var_19_15)
		end

		while var_19_16() do
			-- block empty
		end

		var_19_1 = math.max(var_19_1, var_19_13)
	end

	setSizeDelta(arg_19_0.storyContainer, {
		x = var_19_1
	})

	if arg_19_0.spStoryUnreleasedNode or arg_19_0.spStoryUnlockNode then
		local var_19_17 = tf(arg_19_0:DequeItem(arg_19_0.unreleasedNodeTpl), arg_19_1)

		setAnchoredPosition(var_19_17, {
			y = 0,
			x = var_19_13
		})

		local var_19_18

		if arg_19_0.spStoryUnreleasedNode then
			local var_19_19 = arg_19_0.storyNodeStatus[arg_19_0.spStoryUnreleasedNode:GetConfigID()].reuqire

			setText(var_19_17:Find("text"), i18n("scenario_unlock_pt_require", var_19_19))

			var_19_18 = arg_19_0.spStoryUnreleasedNode:GetCleanAnimator()
		elseif arg_19_0.spStoryUnlockNode then
			setText(var_19_17:Find("text"), i18n("scenario_unlock"))

			local var_19_20 = arg_19_0.spStoryUnlockNode:GetConfigID()

			onButton(arg_19_0, var_19_17:Find("btn_unlock"), function()
				local var_35_0 = getProxy(PlayerProxy):getRawData().id

				PlayerPrefs.SetInt("player_" .. var_35_0 .. "_activity_spStoryNodeID_" .. var_19_20 .. "_unlock", 1)
				arg_19_0:UpdateView(true)

				arg_19_0.needFocusStory = true

				arg_19_0:Move2UnlockStory()
			end)

			var_19_18 = arg_19_0.spStoryUnlockNode:GetCleanAnimator()
		end

		ResourceMgr.Inst:getAssetAsync("ui/" .. var_19_18, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_36_0)
			local var_36_0 = Instantiate(arg_36_0)
			local var_36_1 = Vector3.New(-525, 0, 0)

			tf(var_36_0).localPosition = var_36_1

			setParent(var_36_0, var_19_17)
			WorldConst.ArrayEffectOrder(var_19_17, 200)
		end), true, true)
	end

	arg_19_0.spStoryUnreleasedNode = nil
	arg_19_0.spStoryUnlockNode = nil

	local var_19_21 = arg_19_0.spStoryNodes

	for iter_19_2 = 1, #var_19_21 do
		local var_19_22 = var_19_21[iter_19_2]
		local var_19_23 = var_19_22:GetConfigID()

		if arg_19_0.storyNodeTFsById[var_19_23] then
			local var_19_24 = arg_19_0.storyNodeStatus[var_19_23].status
			local var_19_25 = arg_19_0.storyNodeTFsById[var_19_23].nodeTF
			local var_19_26 = var_19_25:Find("info/bk/title_form/title")

			if var_19_24 == var_0_2 then
				setScrollText(var_19_26, HXSet.hxLan(var_19_22:GetUnlockDesc()))
				setTextAlpha(var_19_26, 0.5)
			else
				setScrollText(var_19_26, HXSet.hxLan(var_19_22:GetDisplayName()))
				setTextAlpha(var_19_26, 1)
			end

			local var_19_27 = var_19_22:GetType()

			setActive(var_19_25:Find("circle/lock"), var_19_24 == var_0_2)

			if var_19_24 == var_0_2 then
				setActive(var_19_25:Find("circle/Story"), false)
				setActive(var_19_25:Find("circle/Battle"), false)
				setText(var_19_25:Find(""))
			elseif var_19_27 == ActivitySpStoryNode.NODE_TYPE.STORY then
				setActive(var_19_25:Find("circle/Story"), var_19_27 == ActivitySpStoryNode.NODE_TYPE.STORY)
				setActive(var_19_25:Find("circle/Battle"), var_19_27 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
				setActive(var_19_25:Find("circle/Story/Done"), var_19_24 == var_0_4)
			elseif var_19_27 == ActivitySpStoryNode.NODE_TYPE.BATTLE then
				setActive(var_19_25:Find("circle/Story"), var_19_27 == ActivitySpStoryNode.NODE_TYPE.STORY)
				setActive(var_19_25:Find("circle/Battle"), var_19_27 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
				setActive(var_19_25:Find("circle/Battle/Done"), var_19_24 == var_0_4)
			end

			setActive(var_19_25:Find("circle/bk/Inactive"), var_19_24 == var_0_2)
			setActive(var_19_25:Find("circle/bk/Active"), var_19_24 == var_0_3)
			setActive(var_19_25:Find("circle/bk/Readed"), var_19_24 == var_0_4)
			setActive(var_19_25:Find("info/bk/BG/Inactive"), var_19_24 == var_0_2)
			setActive(var_19_25:Find("info/bk/BG/Active"), var_19_24 ~= var_0_2)
			onButton(arg_19_0, var_19_25, function()
				if var_19_24 == var_0_2 then
					return
				end

				local var_37_0 = var_19_22:GetStoryName()

				arg_19_0:PlayStory(var_37_0, function()
					arg_19_0:UpdateView(true)

					arg_19_0.needFocusStory = true

					arg_19_0:Move2UnlockStory()
				end, true)
			end)
		end
	end

	local var_19_28 = arg_19_0.storyReadCount
	local var_19_29 = arg_19_0.storyReadMax

	setText(arg_19_0.progressText, var_19_28 .. "/" .. var_19_29)
	setActive(arg_19_0.storyAward, tobool(arg_19_0.storyTask))

	if arg_19_0.storyTask then
		local var_19_30 = arg_19_0.storyTask:getConfig("award_display")
		local var_19_31 = Drop.New({
			type = var_19_30[1][1],
			id = var_19_30[1][2],
			count = var_19_30[1][3]
		})

		updateDrop(arg_19_0.storyAward:Find("IconTpl"), var_19_31)

		local var_19_32 = arg_19_0.storyTask:getTaskStatus()

		setActive(arg_19_0.storyAward:Find("get"), var_19_32 == 1)
		setActive(arg_19_0.storyAward:Find("got"), var_19_32 == 2)
		onButton(arg_19_0, arg_19_0.storyAward, function()
			arg_19_0.coreStoryPage:emit(BaseUI.ON_DROP, var_19_31)
		end)
	end
end

function var_0_0.DequeItem(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_0.pools[arg_40_1]:Dequeue()

	table.insert(arg_40_0.activeItems, {
		template = arg_40_1,
		active = var_40_0
	})
	setActive(var_40_0, true)
	setParent(var_40_0, arg_40_0.storyContainer)

	local var_40_1 = var_40_0:GetComponent(typeof(Animation))

	if var_40_1 then
		var_40_1.enabled = not arg_40_2
	end

	return var_40_0
end

function var_0_0.Move2UnlockStory(arg_41_0)
	if not arg_41_0.needFocusStory then
		return
	end

	arg_41_0.needFocusStory = nil

	local var_41_0 = arg_41_0.spStoryNodes
	local var_41_1

	for iter_41_0 = #var_41_0, 1, -1 do
		local var_41_2 = var_41_0[iter_41_0]
		local var_41_3 = var_41_2:GetConfigID()
		local var_41_4 = arg_41_0.storyNodeStatus[var_41_3]

		if var_41_4.status > var_0_2 and (not var_41_4.reuqire or not var_41_2:GetCleanAnimator()) then
			var_41_1 = var_41_3

			break
		end
	end

	local var_41_5 = arg_41_0.storyNodeTFsById[var_41_1].nodeTF
	local var_41_6 = arg_41_0.storyNodeTpl.rect.width
	local var_41_7 = var_41_5.anchoredPosition.x + var_41_6 * 0.5 - arg_41_0.storyContainer.parent.rect.width * 0.5
	local var_41_8 = math.clamp(var_41_7, 0, math.max(0, arg_41_0.storyContainer.rect.width - arg_41_0.storyContainer.parent.rect.width))

	setAnchoredPosition(arg_41_0.storyContainer, {
		x = -var_41_8
	})
end

function var_0_0.SwitchStoryMapAndBGM(arg_42_0)
	local var_42_0 = arg_42_0.activity:getConfig("config_client").default_background
	local var_42_1 = arg_42_0.activity:getConfig("config_client").default_bgm
	local var_42_2
	local var_42_3 = arg_42_0.spStoryNodes

	for iter_42_0 = 1, #var_42_3 do
		local var_42_4 = var_42_3[iter_42_0]
		local var_42_5 = var_42_4:GetConfigID()

		if arg_42_0.storyNodeStatus[var_42_5].status == var_0_4 then
			local var_42_6 = var_42_4:GetCleanAnimator()

			var_42_0 = var_42_4:GetCleanBG() ~= "" and var_42_4:GetCleanBG() or var_42_0

			if var_42_4:GetCleanBGM() ~= "" then
				var_42_1 = var_42_4:GetCleanBGM() or var_42_1
			end
		else
			break
		end
	end

	if var_42_0 ~= nil and var_42_0 ~= "" then
		arg_42_0.coreStoryPage:SwitchBG({
			{
				BG = var_42_0
			}
		})
	end

	if var_42_1 ~= nil and var_42_1 ~= "" then
		pg.BgmMgr.GetInstance():Push(arg_42_0.__cname, var_42_1)
	end
end

function var_0_0.TrySubmitTask(arg_43_0)
	local var_43_0 = true

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.spStoryNodes) do
		local var_43_1 = iter_43_1:GetStoryName()

		if var_43_1 and var_43_1 ~= "" then
			var_43_0 = var_43_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_43_1)
		end

		if not var_43_0 then
			break
		end
	end

	if var_43_0 and arg_43_0.storyTask and arg_43_0.storyTask:getTaskStatus() == 1 then
		arg_43_0.coreStoryPage:emit(ActivityMediator.ON_TASK_SUBMIT, arg_43_0.storyTask)

		return
	end
end

function var_0_0.PlayStory(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	if not arg_44_1 then
		return existCall(arg_44_2)
	end

	local var_44_0 = pg.NewStoryMgr.GetInstance()
	local var_44_1 = var_44_0:IsPlayed(arg_44_1)

	seriesAsync({
		function(arg_45_0)
			if var_44_1 and not arg_44_3 then
				return arg_45_0()
			end

			local var_45_0 = tonumber(arg_44_1)

			if var_45_0 and var_45_0 > 0 then
				arg_44_0.coreStoryPage:emit(ActivityMediator.GO_PERFORM_COMBAT, {
					stageId = var_45_0
				})
			else
				var_44_0:Play(arg_44_1, arg_45_0, arg_44_3)
			end
		end,
		function(arg_46_0, ...)
			existCall(arg_44_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_47_0)
	local var_47_0 = arg_47_0.activity:getConfig("config_client").task_id
	local var_47_1 = getProxy(TaskProxy):getTaskVO(var_47_0)

	if not var_47_1 then
		errorMsg("Missing Activity Task ID : " .. var_47_0)
	end

	arg_47_0.storyTask = var_47_1 or Task.New({
		id = var_47_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_48_0)
	arg_48_0:UpdateView()
end

function var_0_0.Show(arg_49_0)
	var_0_0.super.Show(arg_49_0)
	arg_49_0:OverlayPanel(arg_49_0._tf)
	arg_49_0:OverlayPanel(arg_49_0.topPage, {
		stopTop = true
	})
end

function var_0_0.Hide(arg_50_0)
	arg_50_0:UnOverlayPanel(arg_50_0.topPage, arg_50_0._tf)
	arg_50_0:UnOverlayPanel(arg_50_0._tf, arg_50_0._parentTf)
	var_0_0.super.Hide(arg_50_0)
end

function var_0_0.OnDestroy(arg_51_0)
	arg_51_0:RecyclePools()

	for iter_51_0, iter_51_1 in pairs(arg_51_0.pools) do
		iter_51_1:Clear()
	end
end

return var_0_0
