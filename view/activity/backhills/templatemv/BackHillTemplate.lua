local var_0_0 = class("BackHillTemplate", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return arg_1_0.UIName
end

function var_0_0.init(arg_2_0)
	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.willExit(arg_3_0)
	arg_3_0.loader:Clear()
end

function var_0_0.InitFacility(arg_4_0, arg_4_1, arg_4_2)
	onButton(arg_4_0, arg_4_1, arg_4_2)
	onButton(arg_4_0, arg_4_1:Find("button"), arg_4_2)
end

function var_0_0.InitFacilityCross(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	onButton(arg_5_0, arg_5_1:Find(arg_5_3), arg_5_4, SFX_PANEL)
	onButton(arg_5_0, arg_5_2:Find(arg_5_3), arg_5_4, SFX_PANEL)
end

function var_0_0.getStudents(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {}
	local var_6_1 = getProxy(ActivityProxy):getActivityById(arg_6_0)

	if not var_6_1 then
		return var_6_0
	end

	local var_6_2 = var_6_1:getConfig("config_client")

	var_6_2 = var_6_2 and var_6_2.ships

	if var_6_2 then
		local var_6_3 = Clone(var_6_2)
		local var_6_4 = math.random(arg_6_1, arg_6_2)
		local var_6_5 = #var_6_3

		while var_6_4 > 0 and var_6_5 > 0 do
			local var_6_6 = math.random(1, var_6_5)

			table.insert(var_6_0, var_6_3[var_6_6])

			var_6_3[var_6_6] = var_6_3[var_6_5]
			var_6_5 = var_6_5 - 1
			var_6_4 = var_6_4 - 1
		end
	end

	return var_6_0
end

function var_0_0.InitStudents(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = var_0_0.getStudents(arg_7_1, arg_7_2, arg_7_3)
	local var_7_1 = {}

	for iter_7_0, iter_7_1 in pairs(arg_7_0.graphPath.points) do
		if not iter_7_1.outRandom then
			table.insert(var_7_1, iter_7_1)
		end
	end

	local var_7_2 = #var_7_1

	arg_7_0.academyStudents = {}

	local var_7_3 = {}

	for iter_7_2, iter_7_3 in pairs(var_7_0) do
		if not arg_7_0.academyStudents[iter_7_2] then
			local var_7_4 = cloneTplTo(arg_7_0._shipTpl, arg_7_0._map)

			var_7_4.gameObject.name = iter_7_2

			local var_7_5 = arg_7_0.ChooseRandomPos(var_7_1, var_7_2)

			var_7_2 = (var_7_2 - 2) % #var_7_1 + 1

			local var_7_6 = SummerFeastNavigationAgent.New(var_7_4.gameObject, true)

			var_7_6:attach()
			var_7_6:setPathFinder(arg_7_0.graphPath)
			var_7_6:SetPositionTable(var_7_3)
			var_7_6:setCurrentIndex(var_7_5 and var_7_5.id)
			var_7_6:SetOnTransEdge(function(arg_8_0, arg_8_1, arg_8_2)
				arg_8_1, arg_8_2 = math.min(arg_8_1, arg_8_2), math.max(arg_8_1, arg_8_2)

				local var_8_0 = arg_7_0[arg_7_0.edge2area[arg_8_1 .. "_" .. arg_8_2] or arg_7_0.edge2area.default]

				arg_8_0._tf:SetParent(var_8_0)
			end)
			var_7_6:updateStudent(iter_7_3)

			arg_7_0.academyStudents[iter_7_2] = var_7_6
		end
	end

	if #var_7_0 > 0 then
		arg_7_0.sortTimer = Timer.New(function()
			arg_7_0:sortStudents()
		end, 0.2, -1)

		arg_7_0.sortTimer:Start()
		arg_7_0.sortTimer.func()
	end
end

function var_0_0.ChooseRandomPos(arg_10_0, arg_10_1)
	local var_10_0 = math.random(1, arg_10_1)

	if not var_10_0 then
		return nil
	end

	pg.Tool.Swap(arg_10_0, var_10_0, arg_10_1)

	return arg_10_0[arg_10_1]
end

function var_0_0.sortStudents(arg_11_0)
	local var_11_0 = arg_11_0.containers

	for iter_11_0, iter_11_1 in pairs(var_11_0) do
		if iter_11_1.childCount > 1 then
			local var_11_1 = {}

			for iter_11_2 = 1, iter_11_1.childCount do
				local var_11_2 = iter_11_1:GetChild(iter_11_2 - 1)

				table.insert(var_11_1, {
					tf = var_11_2,
					index = iter_11_2
				})
			end

			table.sort(var_11_1, function(arg_12_0, arg_12_1)
				local var_12_0 = arg_12_0.tf.anchoredPosition.y - arg_12_1.tf.anchoredPosition.y

				if math.abs(var_12_0) < 1 then
					return arg_12_0.index < arg_12_1.index
				else
					return var_12_0 > 0
				end
			end)

			for iter_11_3, iter_11_4 in ipairs(var_11_1) do
				iter_11_4.tf:SetSiblingIndex(iter_11_3 - 1)
			end
		end
	end
end

function var_0_0.clearStudents(arg_13_0)
	if arg_13_0.sortTimer then
		arg_13_0.sortTimer:Stop()

		arg_13_0.sortTimer = nil
	end

	if arg_13_0.academyStudents then
		for iter_13_0, iter_13_1 in pairs(arg_13_0.academyStudents) do
			iter_13_1:detach()
			Destroy(iter_13_1._go)
		end

		table.clear(arg_13_0.academyStudents)
	end
end

function var_0_0.AutoFitScreen(arg_14_0)
	local var_14_0 = Screen.width / Screen.height
	local var_14_1 = 1.7777777777777777
	local var_14_2 = arg_14_0._map.rect.width
	local var_14_3 = arg_14_0._map.rect.height
	local var_14_4

	if var_14_1 <= var_14_0 then
		local var_14_5 = 1080 * var_14_0

		var_14_4 = math.clamp(var_14_5 / var_14_2, 1, 2)
	else
		local var_14_6 = 1920 / var_14_0

		var_14_4 = math.clamp(var_14_6 / var_14_3, 1, 2)
	end

	setLocalScale(arg_14_0._map, {
		x = var_14_4,
		y = var_14_4,
		z = var_14_4
	})
	setLocalScale(arg_14_0._upper, {
		x = var_14_4,
		y = var_14_4,
		z = var_14_4
	})
end

function var_0_0.IsMiniActNeedTip(arg_15_0)
	local var_15_0 = getProxy(ActivityProxy):getActivityById(arg_15_0)

	assert(var_15_0)

	return Activity.IsActivityReady(var_15_0)
end

function var_0_0.UpdateActivity(arg_16_0, arg_16_1)
	return
end

function var_0_0.BindItemActivityShop(arg_17_0)
	arg_17_0:InitFacilityCross(arg_17_0._map, arg_17_0._upper, "bujishangdian", function()
		arg_17_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.SHOP, {
			warp = NewShopsScene.TYPE_ACTIVITY
		})
	end)
end

function var_0_0.BindItemSkinShop(arg_19_0)
	arg_19_0:InitFacilityCross(arg_19_0._map, arg_19_0._upper, "huanzhuangshangdian", function()
		arg_19_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.SKINSHOP)
	end)
end

function var_0_0.BindItemBuildShip(arg_21_0)
	arg_21_0:InitFacilityCross(arg_21_0._map, arg_21_0._upper, "xianshijianzao", function()
		local var_22_0
		local var_22_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1)
		local var_22_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILD)

		if var_22_1 and not var_22_1:isEnd() then
			var_22_0 = BuildShipScene.PROJECTS.ACTIVITY
		elseif var_22_2 and not var_22_2:isEnd() then
			var_22_0 = ({
				BuildShipScene.PROJECTS.SPECIAL,
				BuildShipScene.PROJECTS.LIGHT,
				BuildShipScene.PROJECTS.HEAVY
			})[var_22_2:getConfig("config_client").id]
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_21_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.GETBOAT, {
			page = BuildShipScene.PAGE_BUILD,
			projectName = var_22_0
		})
	end)
end

function var_0_0.BindItemBattle(arg_23_0)
	arg_23_0:InitFacilityCross(arg_23_0._map, arg_23_0._upper, "tebiezuozhan", function()
		local var_24_0 = getProxy(ChapterProxy)
		local var_24_1, var_24_2 = var_24_0:getLastMapForActivity()

		if not var_24_1 or not var_24_0:getMapById(var_24_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			arg_23_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_24_2,
				mapIdx = var_24_1
			})
		end
	end)
end

function var_0_0.UpdateBuildingTip(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_1 then
		return false
	end

	local var_25_0 = arg_25_1:GetBuildingLevel(arg_25_2)
	local var_25_1 = pg.activity_event_building[arg_25_2]

	if not var_25_1 or var_25_0 >= #var_25_1.buff then
		return false
	end

	local var_25_2 = var_25_1.material[var_25_0]

	return _.all(var_25_2, function(arg_26_0)
		local var_26_0 = arg_26_0[1]
		local var_26_1 = arg_26_0[2]
		local var_26_2 = arg_26_0[3]
		local var_26_3 = 0

		if var_26_0 == DROP_TYPE_VITEM then
			local var_26_4 = AcessWithinNull(Item.getConfigData(var_26_1), "link_id")

			assert(var_26_4 == arg_25_1.id)

			var_26_3 = arg_25_1:GetMaterialCount(var_26_1)
		elseif var_26_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_26_5 = AcessWithinNull(pg.activity_drop_type[var_26_0], "activity_id")

			assert(var_26_5)

			bagAct = getProxy(ActivityProxy):getActivityById(var_26_5)
			var_26_3 = bagAct:getVitemNumber(var_26_1)
		end

		return var_26_2 <= var_26_3
	end)
end

function var_0_0.UpdateView(arg_27_0)
	return
end

return var_0_0
