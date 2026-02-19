local var_0_0 = class("PacGameMapController")
local var_0_1 = 3

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._sceneMask = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._runningData = arg_1_3
	arg_1_0._mapTF = findTF(arg_1_0._sceneMask, "sceneContainer/scene/content/map")
	arg_1_0._grids = {}
	arg_1_0._gridDic = {}
	arg_1_0._mapTFDic = {}

	for iter_1_0 = 0, arg_1_0._mapTF.childCount - 1 do
		local var_1_0 = arg_1_0._mapTF:GetChild(iter_1_0)

		arg_1_0._mapTFDic[iter_1_0 + 1] = var_1_0
	end
end

function var_0_0.SetParent(arg_2_0)
	return
end

function var_0_0.SetPosition(arg_3_0)
	return
end

function var_0_0.SetScale(arg_4_0)
	return
end

function var_0_0.SetGridIndex(arg_5_0)
	return
end

function var_0_0.Prepare(arg_6_0)
	arg_6_0._mapData = arg_6_0._runningData:GetMapData()
	arg_6_0._activeScoreCount = 0
	arg_6_0._ignoreScore = arg_6_0._mapData.ignore_score

	arg_6_0:prepareMap()
end

function var_0_0.Start(arg_7_0)
	arg_7_0._player = arg_7_0._runningData:GetPlayer()
	arg_7_0._scoreCount = arg_7_0._runningData:GetScoreCount()
	arg_7_0._delayReflashScoreTime = nil
	arg_7_0._roles = arg_7_0._runningData:GetRoles()

	arg_7_0:reflashGridScore()
end

function var_0_0.Step(arg_8_0, arg_8_1)
	arg_8_0._deltaTime = arg_8_1

	arg_8_0:udateScoreGrid()
	arg_8_0:updateRoleLayer()
	arg_8_0:updateReflashTime()
end

function var_0_0.updateReflashTime(arg_9_0)
	if arg_9_0._delayReflashScoreTime and arg_9_0._delayReflashScoreTime >= 0 then
		arg_9_0._delayReflashScoreTime = arg_9_0._delayReflashScoreTime - arg_9_0._deltaTime

		if arg_9_0._delayReflashScoreTime <= 0 then
			arg_9_0._delayReflashScoreTime = nil

			arg_9_0:reflashGridScore()
		end
	end
end

function var_0_0.Clear(arg_10_0)
	for iter_10_0 = 1, #arg_10_0._grids do
		arg_10_0._grids[iter_10_0]:Dispose()
	end

	arg_10_0._roles = {}
	arg_10_0._grids = {}
	arg_10_0._gridDic = {}
	arg_10_0._player = nil
	arg_10_0._delayReflashScoreTime = nil
	arg_10_0._scoreCount = 0
end

function var_0_0.Stop(arg_11_0)
	return
end

function var_0_0.Resume(arg_12_0)
	return
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0._roles = {}
	arg_13_0._grids = {}
	arg_13_0._gridDic = {}
end

function var_0_0.prepareMap(arg_14_0)
	local var_14_0 = arg_14_0._mapData.grid_list
	local var_14_1 = arg_14_0._mapData.grid_width
	local var_14_2 = arg_14_0._mapData.grid_height
	local var_14_3 = arg_14_0._mapData.map_bound
	local var_14_4 = arg_14_0._mapData.horizontal
	local var_14_5 = arg_14_0._mapData.vertical
	local var_14_6 = arg_14_0._mapData.offset

	arg_14_0._mapTF.anchoredPosition = Vector2(-var_14_3[1] / 2 + var_14_1 / 2 + var_14_6[1], var_14_3[2] / 2 - var_14_2 / 2 + var_14_6[2])

	for iter_14_0 = 1, #var_14_0 do
		local var_14_7 = var_14_0[iter_14_0]

		for iter_14_1 = 1, #var_14_7 do
			local var_14_8 = var_14_7[iter_14_1]

			if var_14_8 == 0 then
				var_14_8 = PacGameConst.default_grid
			end

			local var_14_9 = PacGameConst.grid_data[var_14_8]
			local var_14_10 = arg_14_0._runningData:GetTplItemFromPool(var_14_9.prefab, arg_14_0._mapTFDic[iter_14_0])
			local var_14_11 = var_14_4 * (iter_14_0 - 1) + iter_14_1
			local var_14_12 = var_14_7[iter_14_1]
			local var_14_13 = PacGameGrid.New(var_14_10, var_14_11, var_14_12)
			local var_14_14 = Vector2((iter_14_1 - 1) * var_14_1, -(iter_14_0 - 1) * var_14_2)

			var_14_13:SetPosition(var_14_14)
			var_14_13:SetActive(true)
			var_14_13:SetVH(iter_14_0, iter_14_1)
			table.insert(arg_14_0._grids, var_14_13)

			arg_14_0._gridDic[var_14_11] = var_14_13
		end
	end

	arg_14_0._runningData:SetGrids(arg_14_0._grids, arg_14_0._gridDic)
	arg_14_0._runningData:SetMapTFDic(arg_14_0._mapTFDic)
end

function var_0_0.reflashGridScore(arg_15_0)
	if arg_15_0._runningData:GetEditor() then
		return
	end

	arg_15_0._activeScoreCount = 0

	for iter_15_0 = 1, #arg_15_0._grids do
		local var_15_0 = arg_15_0._grids[iter_15_0]
		local var_15_1 = var_15_0:GetIndex()

		if var_15_0:HasScore() then
			if not table.contains(arg_15_0._ignoreScore, var_15_1) then
				arg_15_0._activeScoreCount = arg_15_0._activeScoreCount + 1

				var_15_0:SetScoreFlag(true)
			else
				var_15_0:SetScoreFlag(false)
			end
		end
	end
end

function var_0_0.udateScoreGrid(arg_16_0)
	if arg_16_0._activeScoreCount <= 0 and not arg_16_0._delayReflashScoreTime then
		arg_16_0._delayReflashScoreTime = 2
	end

	if arg_16_0._delayCheckReflashCount == nil then
		arg_16_0._delayCheckReflashCount = 10
	end

	if arg_16_0._delayCheckReflashCount and not arg_16_0._delayReflashScoreTime then
		arg_16_0._delayCheckReflashCount = arg_16_0._delayCheckReflashCount - arg_16_0._deltaTime

		if arg_16_0._delayCheckReflashCount <= 0 then
			arg_16_0._delayCheckReflashCount = nil

			if arg_16_0._gridDic then
				local var_16_0 = 0

				for iter_16_0, iter_16_1 in pairs(arg_16_0._gridDic) do
					if iter_16_1 and iter_16_1:GetScoreFlag() then
						var_16_0 = var_16_0 + 1
					end
				end

				if var_16_0 == 0 then
					warning("吃完所有珠子，准备刷新")

					arg_16_0._delayReflashScoreTime = 2
				end
			end
		end
	end

	local var_16_1 = arg_16_0._player:GetGridIndex()
	local var_16_2 = arg_16_0._gridDic[var_16_1]

	if var_16_2 and var_16_2:GetScoreFlag() then
		var_16_2:SetScoreFlag(false)

		arg_16_0._activeScoreCount = arg_16_0._activeScoreCount - 1

		arg_16_0._event(PacGameScene.GET_SCORE, var_16_2:GetScore(), nil)
	end
end

function var_0_0.updateRoleLayer(arg_17_0)
	for iter_17_0 = 1, #arg_17_0._roles do
		local var_17_0 = arg_17_0._roles[iter_17_0]
		local var_17_1 = var_17_0:GetGridIndexNext()
		local var_17_2 = arg_17_0._gridDic[var_17_1]

		if var_17_2 then
			local var_17_3, var_17_4 = var_17_2:GetVH()

			if var_17_0:GetParent() ~= arg_17_0._mapTFDic[var_17_3] then
				var_17_0:SetParent(arg_17_0._mapTFDic[var_17_3])
			end
		end
	end
end

return var_0_0
