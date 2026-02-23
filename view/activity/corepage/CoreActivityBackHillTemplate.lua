local var_0_0 = class("CoreActivityBackHillTemplate", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.loader = AutoLoader.New()
end

function var_0_0.InitFacility(arg_2_0, arg_2_1, arg_2_2)
	onButton(arg_2_0, arg_2_1, arg_2_2)
	onButton(arg_2_0, arg_2_1:Find("button"), arg_2_2)
end

function var_0_0.InitFacilityCross(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	onButton(arg_3_0, arg_3_1:Find(arg_3_3), arg_3_4, SFX_PANEL)
	onButton(arg_3_0, arg_3_2:Find(arg_3_3), arg_3_4, SFX_PANEL)
end

function var_0_0.getStudents(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {}
	local var_4_1 = getProxy(ActivityProxy):getActivityById(arg_4_0)

	if not var_4_1 then
		return var_4_0
	end

	local var_4_2 = var_4_1:getConfig("config_client")

	var_4_2 = var_4_2 and var_4_2.ships

	if var_4_2 then
		local var_4_3 = Clone(var_4_2)
		local var_4_4 = math.random(arg_4_1, arg_4_2)
		local var_4_5 = #var_4_3

		while var_4_4 > 0 and var_4_5 > 0 do
			local var_4_6 = math.random(1, var_4_5)

			table.insert(var_4_0, var_4_3[var_4_6])

			var_4_3[var_4_6] = var_4_3[var_4_5]
			var_4_5 = var_4_5 - 1
			var_4_4 = var_4_4 - 1
		end
	end

	return var_4_0
end

function var_0_0.InitStudents(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = var_0_0.getStudents(arg_5_1, arg_5_2, arg_5_3)
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.graphPath.points) do
		if not iter_5_1.outRandom then
			table.insert(var_5_1, iter_5_1)
		end
	end

	local var_5_2 = #var_5_1

	arg_5_0.academyStudents = {}

	local var_5_3 = {}

	for iter_5_2, iter_5_3 in pairs(var_5_0) do
		if not arg_5_0.academyStudents[iter_5_2] then
			local var_5_4 = cloneTplTo(arg_5_0._shipTpl, arg_5_0._map)

			var_5_4.gameObject.name = iter_5_2

			local var_5_5 = arg_5_0.ChooseRandomPos(var_5_1, var_5_2)

			var_5_2 = (var_5_2 - 2) % #var_5_1 + 1

			local var_5_6 = SummerFeastNavigationAgent.New(var_5_4.gameObject)

			var_5_6:attach()
			var_5_6:setPathFinder(arg_5_0.graphPath)
			var_5_6:SetPositionTable(var_5_3)
			var_5_6:setCurrentIndex(var_5_5 and var_5_5.id)
			var_5_6:SetOnTransEdge(function(arg_6_0, arg_6_1, arg_6_2)
				arg_6_1, arg_6_2 = math.min(arg_6_1, arg_6_2), math.max(arg_6_1, arg_6_2)

				local var_6_0 = arg_5_0[arg_5_0.edge2area[arg_6_1 .. "_" .. arg_6_2] or arg_5_0.edge2area.default]

				arg_6_0._tf:SetParent(var_6_0)
			end)
			var_5_6:updateStudent(iter_5_3)

			arg_5_0.academyStudents[iter_5_2] = var_5_6
		end
	end

	if #var_5_0 > 0 then
		arg_5_0.sortTimer = Timer.New(function()
			arg_5_0:sortStudents()
		end, 0.2, -1)

		arg_5_0.sortTimer:Start()
		arg_5_0.sortTimer.func()
	end
end

function var_0_0.ChooseRandomPos(arg_8_0, arg_8_1)
	local var_8_0 = math.random(1, arg_8_1)

	if not var_8_0 then
		return nil
	end

	pg.Tool.Swap(arg_8_0, var_8_0, arg_8_1)

	return arg_8_0[arg_8_1]
end

function var_0_0.sortStudents(arg_9_0)
	local var_9_0 = arg_9_0.containers

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		if iter_9_1.childCount > 1 then
			local var_9_1 = {}

			for iter_9_2 = 1, iter_9_1.childCount do
				local var_9_2 = iter_9_1:GetChild(iter_9_2 - 1)

				table.insert(var_9_1, {
					tf = var_9_2,
					index = iter_9_2
				})
			end

			table.sort(var_9_1, function(arg_10_0, arg_10_1)
				local var_10_0 = arg_10_0.tf.anchoredPosition.y - arg_10_1.tf.anchoredPosition.y

				if math.abs(var_10_0) < 1 then
					return arg_10_0.index < arg_10_1.index
				else
					return var_10_0 > 0
				end
			end)

			for iter_9_3, iter_9_4 in ipairs(var_9_1) do
				iter_9_4.tf:SetSiblingIndex(iter_9_3 - 1)
			end
		end
	end
end

function var_0_0.clearStudents(arg_11_0)
	if arg_11_0.sortTimer then
		arg_11_0.sortTimer:Stop()

		arg_11_0.sortTimer = nil
	end

	if arg_11_0.academyStudents then
		for iter_11_0, iter_11_1 in pairs(arg_11_0.academyStudents) do
			iter_11_1:detach()
			Destroy(iter_11_1._go)
		end

		table.clear(arg_11_0.academyStudents)
	end
end

function var_0_0.AutoFitScreen(arg_12_0)
	local var_12_0 = Screen.width / Screen.height
	local var_12_1 = 1.7777777777777777
	local var_12_2 = arg_12_0._map.rect.width
	local var_12_3 = arg_12_0._map.rect.height
	local var_12_4

	if var_12_1 <= var_12_0 then
		local var_12_5 = 1080 * var_12_0

		var_12_4 = math.clamp(var_12_5 / var_12_2, 1, 2)
	else
		local var_12_6 = 1920 / var_12_0

		var_12_4 = math.clamp(var_12_6 / var_12_3, 1, 2)
	end

	setLocalScale(arg_12_0._map, {
		x = var_12_4,
		y = var_12_4,
		z = var_12_4
	})
	setLocalScale(arg_12_0._upper, {
		x = var_12_4,
		y = var_12_4,
		z = var_12_4
	})
end

function var_0_0.IsMiniActNeedTip(arg_13_0)
	local var_13_0 = getProxy(ActivityProxy):getActivityById(arg_13_0)

	assert(var_13_0)

	return Activity.IsActivityReady(var_13_0)
end

function var_0_0.UpdateActivity(arg_14_0, arg_14_1)
	return
end

function var_0_0.BindItemActivityShop(arg_15_0)
	arg_15_0:InitFacilityCross(arg_15_0._map, arg_15_0._upper, "bujishangdian", function()
		arg_15_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.SHOP, {
			warp = NewShopsScene.TYPE_ACTIVITY
		})
	end)
end

function var_0_0.BindItemSkinShop(arg_17_0)
	arg_17_0:InitFacilityCross(arg_17_0._map, arg_17_0._upper, "huanzhuangshangdian", function()
		arg_17_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.SKINSHOP)
	end)
end

function var_0_0.BindItemBuildShip(arg_19_0)
	arg_19_0:InitFacilityCross(arg_19_0._map, arg_19_0._upper, "xianshijianzao", function()
		local var_20_0
		local var_20_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1)
		local var_20_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILD)

		if var_20_1 and not var_20_1:isEnd() then
			var_20_0 = BuildShipScene.PROJECTS.ACTIVITY
		elseif var_20_2 and not var_20_2:isEnd() then
			var_20_0 = ({
				BuildShipScene.PROJECTS.SPECIAL,
				BuildShipScene.PROJECTS.LIGHT,
				BuildShipScene.PROJECTS.HEAVY
			})[var_20_2:getConfig("config_client").id]
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_19_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.GETBOAT, {
			page = BuildShipScene.PAGE_BUILD,
			projectName = var_20_0
		})
	end)
end

function var_0_0.BindItemBattle(arg_21_0)
	arg_21_0:InitFacilityCross(arg_21_0._map, arg_21_0._upper, "tebiezuozhan", function()
		local var_22_0 = getProxy(ChapterProxy)
		local var_22_1, var_22_2 = var_22_0:getLastMapForActivity()

		if not var_22_1 or not var_22_0:getMapById(var_22_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			arg_21_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_22_2,
				mapIdx = var_22_1
			})
		end
	end)
end

function var_0_0.UpdateBuildingTip(arg_23_0, arg_23_1, arg_23_2)
	if not arg_23_1 then
		return false
	end

	local var_23_0 = arg_23_1:GetBuildingLevel(arg_23_2)
	local var_23_1 = pg.activity_event_building[arg_23_2]

	if not var_23_1 or var_23_0 >= #var_23_1.buff then
		return false
	end

	local var_23_2 = var_23_1.material[var_23_0]

	return _.all(var_23_2, function(arg_24_0)
		local var_24_0 = arg_24_0[1]
		local var_24_1 = arg_24_0[2]
		local var_24_2 = arg_24_0[3]
		local var_24_3 = 0

		if var_24_0 == DROP_TYPE_VITEM then
			local var_24_4 = AcessWithinNull(Item.getConfigData(var_24_1), "link_id")

			assert(var_24_4 == arg_23_1.id)

			var_24_3 = arg_23_1:GetMaterialCount(var_24_1)
		elseif var_24_0 > DROP_TYPE_USE_ACTIVITY_DROP then
			local var_24_5 = AcessWithinNull(pg.activity_drop_type[var_24_0], "activity_id")

			assert(var_24_5)

			bagAct = getProxy(ActivityProxy):getActivityById(var_24_5)
			var_24_3 = bagAct:getVitemNumber(var_24_1)
		end

		return var_24_2 <= var_24_3
	end)
end

function var_0_0.UpdateView(arg_25_0)
	return
end

return var_0_0
