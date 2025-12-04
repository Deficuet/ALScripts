local var_0_0 = class("GuildDynamicBG")
local var_0_1 = false
local var_0_2 = false
local var_0_3 = require("view.guild.views.DynamicBG.GuildDynamicBGConfig")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.mainScrollrect = arg_1_1:Find("scrollrect")
	arg_1_0.assistScrollrect = arg_1_1:Find("scrollrect1")
	arg_1_0.pathContainer = arg_1_1:Find("scrollrect/content/path")
	arg_1_0.nameTF = arg_1_1:Find("name")
	arg_1_0.commanderTag = arg_1_1:Find("commander_tag")
	arg_1_0.path = {}
	arg_1_0.ships = {}
	arg_1_0.furnitures = {}

	onScroll(nil, arg_1_0.mainScrollrect, function(arg_2_0)
		scrollTo(arg_1_0.assistScrollrect, arg_2_0.x / 2, arg_2_0.y)
	end)
end

function var_0_0.Init(arg_3_0, arg_3_1)
	arg_3_0.shipVOs = arg_3_1 or {}

	seriesAsync({
		function(arg_4_0)
			arg_3_0:InitPath()
			arg_4_0()
		end,
		function(arg_5_0)
			arg_3_0:InitFurnitures(arg_5_0)
		end,
		function(arg_6_0)
			if var_0_2 then
				arg_3_0:AddDebugShip(arg_6_0)
			else
				arg_3_0:InitShips(arg_6_0)
			end
		end
	}, function()
		if var_0_1 then
			arg_3_0:AddGridDebugView()
		end

		arg_3_0:SortScene()
	end)
end

function var_0_0.InitPath(arg_8_0)
	local var_8_0 = var_0_3.gridCnt[1]
	local var_8_1 = var_0_3.gridCnt[2]
	local var_8_2 = var_0_3.cantWalkPos
	local var_8_3 = Vector2(var_0_3.gridSize[1], var_0_3.gridSize[2])
	local var_8_4 = Vector2(var_0_3.gridStartPos[1], var_0_3.gridStartPos[2])

	for iter_8_0 = 0, var_8_0 - 1 do
		arg_8_0.path[iter_8_0] = {}

		for iter_8_1 = 0, var_8_1 - 1 do
			local var_8_5 = _.any(var_8_2, function(arg_9_0)
				return arg_9_0[1] == iter_8_0 and arg_9_0[2] == iter_8_1
			end)
			local var_8_6 = GuildDynamicBgPathGrid.New({
				position = Vector2(iter_8_0, iter_8_1),
				canWalk = not var_8_5,
				sizeDelta = var_8_3,
				startPosOffset = var_8_4
			})

			arg_8_0.path[iter_8_0][iter_8_1] = var_8_6
		end
	end
end

function var_0_0.GetRandomGrid(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.path) do
		for iter_10_2, iter_10_3 in pairs(iter_10_1) do
			if iter_10_3:CanWalk() then
				table.insert(var_10_0, iter_10_3)
			end
		end
	end

	return var_10_0[math.random(1, #var_10_0)]
end

function var_0_0.GetGrid(arg_11_0, arg_11_1, arg_11_2)
	return arg_11_0.path[arg_11_1][arg_11_2]
end

function var_0_0.InitFurnitures(arg_12_0, arg_12_1)
	local function var_12_0(arg_13_0, arg_13_1, arg_13_2)
		GetOrAddComponent(arg_13_1, typeof(RectTransform)).pivot = Vector2(0, 0)

		local var_13_0 = arg_12_0:GetGrid(arg_13_0.position[1], arg_13_0.position[2])

		assert(var_13_0)

		local var_13_1 = GuildDynamicFurniture.New({
			go = arg_13_1,
			grid = var_13_0,
			path = arg_12_0.path,
			size = Vector2(arg_13_0.size[1], arg_13_0.size[2]),
			offset = Vector2(arg_13_0.offset[1], arg_13_0.offset[2]),
			mode = arg_13_0.mode,
			interactionPosition = Vector2(arg_13_0.interactionPosition[1], arg_13_0.interactionPosition[2]),
			interactionDir = arg_13_0.interactionDir
		})

		table.insert(arg_12_0.furnitures, var_13_1)
		arg_13_2()
	end

	local var_12_1 = {}
	local var_12_2 = var_0_3.furnitures

	for iter_12_0, iter_12_1 in ipairs(var_12_2) do
		table.insert(var_12_1, function(arg_14_0)
			ResourceMgr.Inst:getAssetAsync("furnitrues/guild/" .. iter_12_1.name, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_15_0)
				local var_15_0 = Object.Instantiate(arg_15_0, arg_12_0.pathContainer)

				var_12_0(iter_12_1, var_15_0, arg_14_0)
			end), true, true)
		end)
	end

	seriesAsync(var_12_1, arg_12_1)
end

function var_0_0.InitShips(arg_16_0, arg_16_1)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.shipVOs) do
		table.insert(var_16_0, function(arg_17_0)
			arg_16_0:AddShip(iter_16_1, arg_17_0)
		end)
	end

	seriesAsync(var_16_0, arg_16_1)
end

function var_0_0.AddShip(arg_18_0, arg_18_1, arg_18_2)
	local function var_18_0(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
		local var_19_0 = arg_19_2:GetModel()

		arg_19_2:SetParent(arg_18_0.pathContainer)
		arg_19_2:SetLocalScale(Vector3(0.5, 0.5, 1))

		local var_19_1 = GuildDynamicBgShip.New({
			stand = arg_19_0.stand,
			auto = arg_19_0.auto,
			go = var_19_0,
			grid = arg_19_1,
			path = arg_18_0.path,
			furnitures = arg_18_0.furnitures,
			name = arg_19_0.name,
			isCommander = arg_19_0.isCommander,
			char = arg_19_2
		})

		var_19_1:SetOnMoveCallBack(function()
			arg_18_0:SortScene()
		end)
		table.insert(arg_18_0.ships, var_19_1)
		arg_19_3()
	end

	local var_18_1 = arg_18_1:getPrefab()
	local var_18_2 = arg_18_0:GetRandomGrid()

	if not var_18_2 then
		arg_18_2()
	end

	var_18_2:Lock()

	local var_18_3 = SpineAnimChar.New()

	var_18_3:SetPaint(var_18_1)
	var_18_3:Load(true, function(arg_21_0)
		if IsNil(arg_18_0.nameTF) then
			arg_21_0:Dispose()

			return
		end

		local var_21_0 = arg_21_0:GetModel()

		var_21_0.name = var_18_1

		cloneTplTo(arg_18_0.nameTF, var_21_0.transform, "name")

		if arg_18_1.isCommander then
			cloneTplTo(arg_18_0.commanderTag, var_21_0.transform, "tag")
		end

		var_18_0(arg_18_1, var_18_2, arg_21_0, arg_18_2)
	end)
end

function var_0_0.ExitShip(arg_22_0, arg_22_1)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.ships) do
		if iter_22_1.name == arg_22_1 then
			iter_22_1:Dispose()

			arg_22_0.ships[iter_22_0] = nil

			break
		end
	end
end

function var_0_0.SortScene(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0.ships) do
		table.insert(var_23_0, {
			obj = iter_23_1,
			position = iter_23_1.grid.position
		})
	end

	for iter_23_2, iter_23_3 in pairs(arg_23_0.furnitures) do
		table.insert(var_23_0, {
			obj = iter_23_3,
			position = iter_23_3.grid.position
		})
	end

	table.sort(var_23_0, function(arg_24_0, arg_24_1)
		if arg_24_0.position.y == arg_24_1.position.y then
			return arg_24_0.position.x < arg_24_1.position.x
		else
			return arg_24_0.position.y > arg_24_1.position.y
		end
	end)

	for iter_23_4, iter_23_5 in ipairs(var_23_0) do
		iter_23_5.obj:SetAsLastSibling()
	end
end

function var_0_0.Dispose(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.ships) do
		iter_25_1:Dispose()
	end

	for iter_25_2, iter_25_3 in pairs(arg_25_0.furnitures) do
		iter_25_3:Dispose()
	end

	if var_0_1 then
		if arg_25_0.timer then
			arg_25_0.timer:Stop()

			arg_25_0.timer = nil
		end

		if arg_25_0.timer1 then
			arg_25_0.timer1:Stop()

			arg_25_0.timer1 = nil
		end
	end
end

function var_0_0.AddGridDebugView(arg_26_0)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0.path) do
		var_26_0[iter_26_0] = {}

		for iter_26_2, iter_26_3 in pairs(iter_26_1) do
			local var_26_1 = GameObject.New()

			SetParent(var_26_1, arg_26_0.pathContainer)

			local var_26_2 = GetOrAddComponent(var_26_1, typeof(RectTransform))
			local var_26_3 = GetOrAddComponent(var_26_1, typeof(Image))

			var_26_2.sizeDelta = iter_26_3.sizeDelta
			var_26_2.pivot = Vector2(0, 0)
			var_26_2.localPosition = iter_26_3.localPosition
			var_26_0[iter_26_0][iter_26_2] = var_26_3
			var_26_1.name = iter_26_3.position.x .. "-" .. iter_26_3.position.y

			setActive(var_26_1, true)
		end
	end

	arg_26_0.timer = Timer.New(function()
		for iter_27_0, iter_27_1 in pairs(arg_26_0.path) do
			for iter_27_2, iter_27_3 in pairs(iter_27_1) do
				local var_27_0

				if iter_27_3:IsLock() then
					var_27_0 = Color.New(1, 0, 0, 0.3)
				elseif not iter_27_3:CanWalk() then
					var_27_0 = Color.New(0.5, 0.5, 0.5, 0.3)
				else
					var_27_0 = Color.New(1, 1, 1, 0.3)
				end

				var_26_0[iter_27_0][iter_27_2].color = var_27_0
			end
		end
	end, 1, -1)

	arg_26_0.timer:Start()
	arg_26_0.timer.func()
end

function var_0_0.AddDebugShip(arg_28_0, arg_28_1)
	local var_28_0 = Ship.New({
		id = 0,
		configId = 301284,
		name = "001"
	})

	var_28_0.stand = true
	arg_28_0.shipVOs = {
		var_28_0
	}

	arg_28_0:InitShips(function()
		arg_28_0.timer1 = Timer.New(function()
			if Input.GetKeyDown(KeyCode.A) then
				arg_28_0.ships[1]:MoveLeft()
			end

			if Input.GetKeyDown(KeyCode.S) then
				arg_28_0.ships[1]:MoveDown()
			end

			if Input.GetKeyDown(KeyCode.W) then
				arg_28_0.ships[1]:MoveUp()
			end

			if Input.GetKeyDown(KeyCode.D) then
				arg_28_0.ships[1]:MoveRight()
			end
		end, Time.deltaTime, -1)

		arg_28_0.timer1:Start()
		arg_28_0.timer1.func()
		arg_28_1()
	end)
end

return var_0_0
