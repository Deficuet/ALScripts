local var_0_0 = class("AnniversaryIsland2023Scene", import("view.activity.BackHills.TemplateMV.BackHillTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "AnniversaryIsland2023UI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = var_0_0.super.getResource(arg_2_0)
	local var_2_1 = arg_2_0:CalculateSceneLevel()

	table.insert(var_2_0, "ui/" .. arg_2_0:getUIName() .. "_level" .. var_2_1)

	return var_2_0
end

var_0_0.edge2area = {
	default = "_SDPlace"
}
var_0_0.Buildings = {
	[24] = "craft",
	[25] = "adventure",
	[26] = "dining",
	[23] = "living"
}

function var_0_0.Ctor(arg_3_0)
	var_0_0.super.Ctor(arg_3_0)

	arg_3_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0:CalculateSceneLevel()

	arg_4_0.loader:LoadBundle("ui/" .. arg_4_0:getUIName() .. "_level" .. var_4_0, arg_4_1)
end

function var_0_0.init(arg_5_0)
	arg_5_0.top = arg_5_0._tf:Find("top")
	arg_5_0._bg = arg_5_0._tf:Find("BG")
	arg_5_0._map = arg_5_0._tf:Find("map")

	for iter_5_0 = 0, arg_5_0._map.childCount - 1 do
		local var_5_0 = arg_5_0._map:GetChild(iter_5_0)
		local var_5_1 = go(var_5_0).name

		arg_5_0["map_" .. var_5_1] = var_5_0
	end

	arg_5_0._upper = arg_5_0._tf:Find("upper")

	for iter_5_1 = 0, arg_5_0._upper.childCount - 1 do
		local var_5_2 = arg_5_0._upper:GetChild(iter_5_1)
		local var_5_3 = go(var_5_2).name

		arg_5_0["upper_" .. var_5_3] = var_5_2
	end

	arg_5_0._SDPlace = arg_5_0._tf:Find("SDPlace")
	arg_5_0.containers = {
		arg_5_0._SDPlace
	}
	arg_5_0._shipTpl = arg_5_0._map:Find("ship")
	arg_5_0.graphPath = GraphPath.New(import("GameCfg.BackHillGraphs.AnniversaryIsland2023Graph"))
end

function var_0_0.didEnter(arg_6_0)
	onButton(arg_6_0, arg_6_0._tf:Find("top/Back"), function()
		arg_6_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0._tf:Find("top/Home"), function()
		arg_6_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0._tf:Find("top/Help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.haidaojudian_help.tip
		})
	end, SFX_PANEL)

	local var_6_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2)

	arg_6_0:InitStudents(var_6_0 and var_6_0.id, 3, 4)

	for iter_6_0, iter_6_1 in pairs(arg_6_0.Buildings) do
		arg_6_0:InitFacilityCross(arg_6_0._map, arg_6_0._upper, iter_6_1, function()
			arg_6_0:emit(BackHillMediatorTemplate.GO_SUBLAYER, Context.New({
				mediator = AnniversaryIslandBuildingUpgrade2023WindowMediator,
				viewComponent = AnniversaryIslandBuildingUpgrade2023Window,
				data = {
					buildingID = iter_6_0
				}
			}))
		end)
		eachChild(arg_6_0._map:Find(iter_6_1), function(arg_11_0)
			GetComponent(arg_11_0, typeof(Image)).alphaHitTestMinimumThreshold = 0.5

			setActive(arg_11_0, false)
		end)
	end

	eachChild(arg_6_0._map:Find("xianshijianzao"), function(arg_12_0)
		GetComponent(arg_12_0, typeof(Image)).alphaHitTestMinimumThreshold = 0.5
	end)
	eachChild(arg_6_0._map:Find("huanzhuangshangdian"), function(arg_13_0)
		GetComponent(arg_13_0, typeof(Image)).alphaHitTestMinimumThreshold = 0.5
	end)
	eachChild(arg_6_0._map:Find("taskboard"), function(arg_14_0)
		GetComponent(arg_14_0, typeof(Image)).alphaHitTestMinimumThreshold = 0.5
	end)

	GetComponent(arg_6_0._map:Find("bigmap"), typeof(Image)).alphaHitTestMinimumThreshold = 0.5

	arg_6_0:InitFacilityCross(arg_6_0._map, arg_6_0._upper, "craft", function()
		arg_6_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.ANNIVERSARY_ISLAND_WORKBENCH)
	end)
	arg_6_0:InitFacilityCross(arg_6_0._map, arg_6_0._upper, "taskboard", function()
		local var_16_0 = Context.New()

		SCENE.SetSceneInfo(var_16_0, SCENE.ISLAND_TASK)
		arg_6_0:emit(BackHillMediatorTemplate.GO_SUBLAYER, var_16_0)
	end)
	arg_6_0:InitFacilityCross(arg_6_0._map, arg_6_0._upper, "bigmap", function()
		arg_6_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.ANNIVERSARY_ISLAND_SEA, {
			checkMain = true
		})
	end)
	arg_6_0:InitFacilityCross(arg_6_0._map, arg_6_0._upper, "giftmake", function()
		arg_6_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.SCULPTURE)
	end)
	arg_6_0:BindItemSkinShop()
	arg_6_0:BindItemBuildShip()
	arg_6_0:RegisterDataResponse()
	arg_6_0:UpdateView()
end

function var_0_0.UpdateActivity(arg_19_0, arg_19_1)
	arg_19_0:UpdateView()
end

function var_0_0.RegisterDataResponse(arg_20_0)
	arg_20_0.Respones = ResponsableTree.CreateShell({})

	arg_20_0.Respones:SetRawData("view", arg_20_0)

	local var_20_0 = _.values(arg_20_0.Buildings)

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		arg_20_0.Respones:AddRawListener({
			"view",
			iter_20_1
		}, function(arg_21_0, arg_21_1)
			if not arg_21_1 then
				return
			end

			setActive(arg_21_0["map_" .. iter_20_1]:Find(tostring(arg_21_1)), true)

			if arg_21_1 - 1 > 0 then
				setActive(arg_21_0["map_" .. iter_20_1]:Find(tostring(arg_21_1 - 1)), false)
			end

			local var_21_0 = arg_21_0["map_" .. iter_20_1]:Find(tostring(arg_21_1))

			arg_21_0.loader:GetSpriteQuiet("ui/" .. arg_20_0:getUIName() .. "_atlas", iter_20_1 .. "_" .. arg_21_1, var_21_0, true)

			GetComponent(arg_21_0["map_" .. iter_20_1], typeof(Button)).targetGraphic = GetComponent(var_21_0, typeof(Image))

			local var_21_1 = arg_21_0["upper_" .. iter_20_1]

			if not var_21_1 or IsNil(var_21_1:Find("Level")) then
				return
			end

			arg_21_0.loader:GetSpriteQuiet("ui/" .. arg_20_0:getUIName() .. "_atlas", tostring(arg_21_1), var_21_1:Find("Level"), true)
		end)
	end

	arg_20_0.Respones:AddRawListener(_.values(arg_20_0.Buildings), function(...)
		local var_22_0 = 0
		local var_22_1 = {
			...
		}

		for iter_22_0 = 1, table.getCount(arg_20_0.Buildings) do
			var_22_0 = var_22_0 + (var_22_1[iter_22_0] or 1)
		end

		arg_20_0.Respones.sceneLevel = math.floor(var_22_0 / 4)
	end)
	arg_20_0.Respones:AddRawListener({
		"sceneLevel",
		"view"
	}, function(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
		local var_23_0 = arg_23_1[1]
		local var_23_1 = arg_23_1[2]

		local function var_23_2(arg_24_0)
			setActive(var_23_1["map_" .. arg_24_0]:Find(tostring(var_23_0)), true)

			if arg_23_2[1] then
				setActive(var_23_1["map_" .. arg_24_0]:Find(tostring(arg_23_2[1])), false)
			end

			local var_24_0 = {
				huanzhuangshangdian = "skinshop",
				xianshijianzao = "buildship",
				taskboard = "taskboard"
			}
			local var_24_1 = var_23_1["map_" .. arg_24_0]:Find(tostring(var_23_0))

			var_23_1.loader:GetSpriteQuiet("ui/" .. arg_20_0:getUIName() .. "_level" .. var_23_0, var_24_0[arg_24_0], var_24_1, true)

			GetComponent(var_23_1["map_" .. arg_24_0], typeof(Button)).targetGraphic = GetComponent(var_24_1, typeof(Image))
		end

		var_23_2("xianshijianzao")
		var_23_2("huanzhuangshangdian")
		var_23_2("taskboard")
		var_23_1.loader:GetSpriteQuiet("ui/" .. arg_20_0:getUIName() .. "_atlas", "title_" .. var_23_0, var_23_1._tf:Find("top/Title/Number"), true)
		var_23_1.loader:GetSpriteQuiet("ui/" .. arg_20_0:getUIName() .. "_level" .. var_23_0, "bg", var_23_1._tf:Find("map"))
	end, {
		useOldRef = true
	})

	local var_20_1 = {
		"taskboard",
		"bigmap",
		"giftmake"
	}

	table.insertto(var_20_1, var_20_0)

	for iter_20_2, iter_20_3 in ipairs(var_20_1) do
		arg_20_0.Respones:AddRawListener({
			"view",
			iter_20_3 .. "Tip"
		}, function(arg_25_0, arg_25_1)
			local var_25_0 = arg_25_0["upper_" .. iter_20_3]

			if not var_25_0 or IsNil(var_25_0:Find("Tip")) then
				return
			end

			setActive(var_25_0:Find("Tip"), arg_25_1)
		end)
	end

	arg_20_0.Respones.hubData = {}

	arg_20_0.Respones:AddRawListener({
		"view",
		"hubData"
	}, function(arg_26_0, arg_26_1)
		arg_26_0.gameCountTxt.text = "X " .. arg_26_1.count
	end, {
		strict = true
	})
	arg_20_0.Respones:AddRawListener({
		"view",
		"materialCount"
	}, function(arg_27_0, arg_27_1)
		arg_27_0.materialTxt.text = arg_27_1
	end)
end

function var_0_0.PlayStory()
	local var_28_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2)
	local var_28_1 = var_28_0:GetTotalBuildingLevel()
	local var_28_2 = {
		false,
		var_28_0:getConfig("config_client").lv2Story,
		var_28_0:getConfig("config_client").lv3Story,
		var_28_0:getConfig("config_client").lv4Story
	}

	table.SerialIpairsAsync(var_28_2, function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 <= var_28_1 and arg_29_1 then
			pg.NewStoryMgr.GetInstance():Play(arg_29_1, arg_29_2)
		else
			arg_29_2()
		end
	end)
end

function var_0_0.UpdateView(arg_30_0)
	AnniversaryIsland2023Scene.PlayStory()

	local var_30_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2)

	for iter_30_0, iter_30_1 in pairs(arg_30_0.Buildings) do
		arg_30_0.Respones[iter_30_1] = var_30_0.data1KeyValueList[2][iter_30_0] or 1
		arg_30_0.Respones[iter_30_1 .. "Tip"] = arg_30_0:UpdateBuildingTip(var_30_0, iter_30_0)
	end

	local var_30_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORKBENCH)

	arg_30_0.Respones.craftTip = arg_30_0.Respones.craftTip or var_30_1:HasAvaliableFormula() and getProxy(SettingsProxy):IsTipWorkbenchDaily()

	local function var_30_2()
		local var_31_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND)

		return Activity.IsActivityReady(var_31_0)
	end

	arg_30_0.Respones.bigmapTip = tobool(var_30_2())

	local function var_30_3()
		return getProxy(ActivityTaskProxy):getActTaskTip(ActivityConst.ISLAND_TASK_ID)
	end

	arg_30_0.Respones.taskboardTip = tobool(var_30_3())

	local function var_30_4()
		local var_33_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SCULPTURE)

		return Activity.IsActivityReady(var_33_0)
	end

	arg_30_0.Respones.giftmakeTip = tobool(var_30_4())
end

function var_0_0.CalculateSceneLevel(arg_34_0)
	return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2):GetTotalBuildingLevel()
end

function var_0_0.UpdateBuildingTip(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = var_0_0.super.UpdateBuildingTip(arg_35_0, arg_35_1, arg_35_2)

	if var_35_0 then
		local var_35_1 = arg_35_1.data1KeyValueList[2][arg_35_2] or 1

		var_35_0 = var_35_0 and var_35_1 <= arg_35_1:GetTotalBuildingLevel()
	end

	return var_35_0
end

function var_0_0.willExit(arg_36_0)
	arg_36_0:clearStudents()
	var_0_0.super.willExit(arg_36_0)
end

function var_0_0.IsShowMainTip(arg_37_0)
	if arg_37_0 and not arg_37_0:isEnd() then
		local function var_37_0()
			local var_38_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND)

			return Activity.IsActivityReady(var_38_0)
		end

		local function var_37_1()
			local var_39_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2)

			for iter_39_0, iter_39_1 in ipairs(var_39_0:GetBuildingIds()) do
				if AnniversaryIsland2023Scene.UpdateBuildingTip(nil, var_39_0, iter_39_1) then
					return true
				end
			end

			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORKBENCH):HasAvaliableFormula() and getProxy(SettingsProxy):IsTipWorkbenchDaily() then
				return true
			end
		end

		local function var_37_2()
			return getProxy(ActivityTaskProxy):getActTaskTip(ActivityConst.ISLAND_TASK_ID)
		end

		local function var_37_3()
			local var_41_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SCULPTURE)

			return Activity.IsActivityReady(var_41_0)
		end

		return var_37_0() or var_37_1() or var_37_2() or var_37_3()
	end
end

return var_0_0
