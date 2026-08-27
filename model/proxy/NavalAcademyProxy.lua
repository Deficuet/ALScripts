local var_0_0 = class("NavalAcademyProxy", import(".NetProxy"))

var_0_0.COURSE_START = "NavalAcademyProxy:COURSE_START"
var_0_0.COURSE_UPDATED = "NavalAcademyProxy:COURSE_UPDATED"
var_0_0.COURSE_REWARD = "NavalAcademyProxy:COURSE_REWARD"
var_0_0.COURSE_CANCEL = "NavalAcademyProxy:COURSE_CANCEL"
var_0_0.RESOURCE_UPGRADE = "NavalAcademyProxy:RESOURCE_UPGRADE"
var_0_0.RESOURCE_UPGRADE_DONE = "NavalAcademyProxy:RESOURCE_UPGRADE_DONE"
var_0_0.BUILDING_FINISH = "NavalAcademyProxy:BUILDING_FINISH"
var_0_0.START_LEARN_TACTICS = "NavalAcademyProxy:START_LEARN_TACTICS"
var_0_0.CANCEL_LEARN_TACTICS = "NavalAcademyProxy:CANCEL_LEARN_TACTICS"
var_0_0.SKILL_CLASS_POS_UPDATED = "NavalAcademyProxy:SKILL_CLASS_POS_UPDATED"

function var_0_0.register(arg_1_0)
	arg_1_0.timers = {}
	arg_1_0.students = {}
	arg_1_0.course = AcademyCourse.New()
	arg_1_0.recentShips = {}

	arg_1_0:on(22001, function(arg_2_0)
		local var_2_0 = OilResourceField.New()

		var_2_0:SetLevel(arg_2_0.oil_well_level)
		var_2_0:SetUpgradeTimeStamp(arg_2_0.oil_well_lv_up_time)

		arg_1_0._oilVO = var_2_0

		local var_2_1 = GoldResourceField.New()

		var_2_1:SetLevel(arg_2_0.gold_well_level)
		var_2_1:SetUpgradeTimeStamp(arg_2_0.gold_well_lv_up_time)

		arg_1_0._goldVO = var_2_1

		local var_2_2 = ClassResourceField.New()

		var_2_2:SetLevel(arg_2_0.class_lv)
		var_2_2:SetUpgradeTimeStamp(arg_2_0.class_lv_up_time)

		arg_1_0._classVO = var_2_2

		arg_1_0.course:update(arg_2_0.class)

		local var_2_3 = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.skill_class_list) do
			local var_2_4 = Student.New(iter_2_1)

			var_2_3[var_2_4.id] = var_2_4
		end

		arg_1_0.skillClassNum = LOCK_CLASSROOM and 2 or arg_2_0.skill_class_num or 2

		arg_1_0:setStudents(var_2_3)
		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inClass")
		arg_1_0:CheckResFields()

		arg_1_0.dailyFinsihCnt = arg_2_0.daily_finish_buff_cnt or 0
	end)
	arg_1_0:on(22013, function(arg_3_0)
		arg_1_0.course:SetProficiency(arg_3_0.proficiency)

		local var_3_0 = getProxy(PlayerProxy):getData()

		var_3_0.expField = arg_3_0.exp_in_well

		getProxy(PlayerProxy):updatePlayer(var_3_0)
		arg_1_0:sendNotification(var_0_0.COURSE_UPDATED)
	end)
end

function var_0_0.timeCall(arg_4_0)
	return {
		[ProxyRegister.DayCall] = function(arg_5_0)
			arg_4_0:setCourse(arg_4_0.course)
			arg_4_0:sendNotification(GAME.CLASS_FORCE_UPDATE)
			getProxy(NavalAcademyProxy):resetUsedDailyFinishCnt()
		end
	}
end

function var_0_0.GetRecentShips(arg_6_0)
	if #arg_6_0.recentShips > 0 then
		for iter_6_0 = #arg_6_0.recentShips, 1, -1 do
			local var_6_0 = arg_6_0.recentShips[iter_6_0]
			local var_6_1 = getProxy(BayProxy):RawGetShipById(var_6_0)

			if not var_6_1 or _.all(var_6_1:getSkillList(), function(arg_7_0)
				return ShipSkill.New(var_6_1.skills[arg_7_0]):IsMaxLevel()
			end) then
				table.remove(arg_6_0.recentShips, iter_6_0)
			end
		end

		return arg_6_0.recentShips
	end

	local var_6_2 = getProxy(PlayerProxy):getRawData().id
	local var_6_3 = PlayerPrefs.GetString("NavTacticsRecentShipId" .. var_6_2)
	local var_6_4 = string.split(var_6_3, "#")

	for iter_6_1, iter_6_2 in ipairs(var_6_4) do
		local var_6_5 = tonumber(iter_6_2) or 0

		if var_6_5 > 0 then
			local var_6_6 = getProxy(BayProxy):RawGetShipById(var_6_5)

			if var_6_6 and not table.contains(arg_6_0.recentShips, var_6_5) and _.any(var_6_6:getSkillList(), function(arg_8_0)
				return not ShipSkill.New(var_6_6.skills[arg_8_0]):IsMaxLevel()
			end) then
				table.insert(arg_6_0.recentShips, var_6_5)
			end
		end
	end

	return arg_6_0.recentShips
end

function var_0_0.SaveRecentShip(arg_9_0, arg_9_1)
	if not table.contains(arg_9_0.recentShips, arg_9_1) then
		table.insert(arg_9_0.recentShips, arg_9_1)

		for iter_9_0 = 1, #arg_9_0.recentShips - 11 do
			table.remove(arg_9_0.recentShips, iter_9_0)
		end

		local var_9_0 = table.concat(arg_9_0.recentShips, "#")
		local var_9_1 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetString("NavTacticsRecentShipId" .. var_9_1, var_9_0)
		PlayerPrefs.Save()
	end
end

function var_0_0.getSkillClassNum(arg_10_0)
	return arg_10_0.skillClassNum
end

var_0_0.MAX_SKILL_CLASS_NUM = 4

function var_0_0.inCreaseKillClassNum(arg_11_0)
	arg_11_0.skillClassNum = math.min(arg_11_0.skillClassNum + 1, var_0_0.MAX_SKILL_CLASS_NUM)

	arg_11_0:sendNotification(var_0_0.SKILL_CLASS_POS_UPDATED, arg_11_0.skillClassNum)
end

function var_0_0.onRemove(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.timers) do
		iter_12_1:Stop()
	end

	arg_12_0.timers = nil

	var_0_0.super.onRemove(arg_12_0)
end

function var_0_0.ExistStudent(arg_13_0, arg_13_1)
	return arg_13_0.students[arg_13_1] ~= nil
end

function var_0_0.getStudentById(arg_14_0, arg_14_1)
	if arg_14_0.students[arg_14_1] then
		return arg_14_0.students[arg_14_1]:clone()
	end
end

function var_0_0.getStudentIdByShipId(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.students) do
		if iter_15_1.shipId == arg_15_1 then
			return iter_15_1.id
		end
	end
end

function var_0_0.getStudentByShipId(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.students) do
		if iter_16_1.shipId == arg_16_1 then
			return iter_16_1
		end
	end
end

function var_0_0.setStudents(arg_17_0, arg_17_1)
	arg_17_0.students = arg_17_1

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inTactics")
end

function var_0_0.getStudents(arg_18_0)
	return Clone(arg_18_0.students)
end

function var_0_0.RawGetStudentList(arg_19_0)
	return arg_19_0.students
end

function var_0_0.addStudent(arg_20_0, arg_20_1)
	arg_20_0.students[arg_20_1.id] = arg_20_1

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inTactics")
	arg_20_0:sendNotification(var_0_0.START_LEARN_TACTICS, Clone(arg_20_1))
end

function var_0_0.updateStudent(arg_21_0, arg_21_1)
	arg_21_0.students[arg_21_1.id] = arg_21_1

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inTactics")
end

function var_0_0.deleteStudent(arg_22_0, arg_22_1)
	arg_22_0.students[arg_22_1] = nil

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inTactics")
	arg_22_0:sendNotification(var_0_0.CANCEL_LEARN_TACTICS, arg_22_1)
end

function var_0_0.GetOilVO(arg_23_0)
	return arg_23_0._oilVO
end

function var_0_0.GetGoldVO(arg_24_0)
	return arg_24_0._goldVO
end

function var_0_0.GetClassVO(arg_25_0)
	return arg_25_0._classVO
end

function var_0_0.getCourse(arg_26_0)
	return Clone(arg_26_0.course)
end

function var_0_0.setCourse(arg_27_0, arg_27_1)
	arg_27_0.course = arg_27_1

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inClass")
end

function var_0_0.GetShipIDs(arg_28_0)
	return {}
end

function var_0_0.CheckResFields(arg_29_0)
	if arg_29_0._oilVO:IsStarting() then
		arg_29_0:AddResFieldListener(arg_29_0._oilVO)
	end

	if arg_29_0._goldVO:IsStarting() then
		arg_29_0:AddResFieldListener(arg_29_0._goldVO)
	end

	if arg_29_0._classVO:IsStarting() then
		arg_29_0:AddResFieldListener(arg_29_0._classVO)
	end
end

function var_0_0.StartUpGradeSuccess(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1:bindConfigTable()[arg_30_1:GetLevel()].time

	arg_30_1:SetUpgradeTimeStamp(pg.TimeMgr.GetInstance():GetServerTime() + var_30_0)
	arg_30_0:AddResFieldListener(arg_30_1)
	arg_30_0.facade:sendNotification(var_0_0.RESOURCE_UPGRADE, {
		resVO = arg_30_1
	})
end

function var_0_0.AddResFieldListener(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1._upgradeTimeStamp - pg.TimeMgr.GetInstance():GetServerTime()

	if var_31_0 > 0 then
		local var_31_1 = arg_31_1:GetUpgradeType()

		if arg_31_0.timers[var_31_1] then
			arg_31_0.timers[var_31_1]:Stop()

			arg_31_0.timers[var_31_1] = nil
		end

		arg_31_0.timers[var_31_1] = Timer.New(function()
			arg_31_0:UpgradeFinish()
			arg_31_0.timers[var_31_1]:Stop()

			arg_31_0.timers[var_31_1] = nil
		end, var_31_0, 1)

		arg_31_0.timers[var_31_1]:Start()
	end
end

function var_0_0.UpgradeFinish(arg_33_0)
	if arg_33_0._goldVO:GetDuration() and arg_33_0._goldVO:GetDuration() <= 0 then
		local var_33_0 = arg_33_0._goldVO:bindConfigTable()[arg_33_0._goldVO:GetLevel()].store

		arg_33_0._goldVO:SetLevel(arg_33_0._goldVO:GetLevel() + 1)
		arg_33_0._goldVO:SetUpgradeTimeStamp(0)

		local var_33_1 = arg_33_0._goldVO:bindConfigTable()[arg_33_0._goldVO:GetLevel()].store

		arg_33_0:sendNotification(var_0_0.RESOURCE_UPGRADE_DONE, {
			field = arg_33_0._goldVO,
			value = var_33_1 - var_33_0
		})
	end

	if arg_33_0._oilVO:GetDuration() and arg_33_0._oilVO:GetDuration() <= 0 then
		local var_33_2 = arg_33_0._oilVO:bindConfigTable()[arg_33_0._oilVO:GetLevel()].store

		arg_33_0._oilVO:SetLevel(arg_33_0._oilVO:GetLevel() + 1)
		arg_33_0._oilVO:SetUpgradeTimeStamp(0)

		local var_33_3 = arg_33_0._oilVO:bindConfigTable()[arg_33_0._oilVO:GetLevel()].store

		arg_33_0:sendNotification(var_0_0.RESOURCE_UPGRADE_DONE, {
			field = arg_33_0._oilVO,
			value = var_33_3 - var_33_2
		})
	end

	if arg_33_0._classVO:GetDuration() and arg_33_0._classVO:GetDuration() <= 0 then
		local var_33_4 = arg_33_0._classVO:bindConfigTable()[arg_33_0._classVO:GetLevel()].store
		local var_33_5 = arg_33_0._classVO:bindConfigTable()[arg_33_0._classVO:GetLevel()].proficency_get_percent
		local var_33_6 = arg_33_0._classVO:bindConfigTable()[arg_33_0._classVO:GetLevel()].proficency_cost_per_min

		arg_33_0._classVO:SetLevel(arg_33_0._classVO:GetLevel() + 1)
		arg_33_0._classVO:SetUpgradeTimeStamp(0)

		local var_33_7 = arg_33_0._classVO:bindConfigTable()[arg_33_0._classVO:GetLevel()].store
		local var_33_8 = arg_33_0._classVO:bindConfigTable()[arg_33_0._classVO:GetLevel()].proficency_get_percent
		local var_33_9 = arg_33_0._classVO:bindConfigTable()[arg_33_0._classVO:GetLevel()].proficency_cost_per_min

		arg_33_0:sendNotification(var_0_0.RESOURCE_UPGRADE_DONE, {
			field = arg_33_0._classVO,
			value = var_33_7 - var_33_4,
			rate = var_33_8 - var_33_5,
			exp = (var_33_9 - var_33_6) * 60
		})
	end
end

function var_0_0.isResourceFieldUpgradeConditionSatisfy(arg_34_0)
	local var_34_0 = getProxy(PlayerProxy):getData()

	if arg_34_0:GetOilVO():CanUpgrade(var_34_0.level, var_34_0.gold) or arg_34_0:GetGoldVO():CanUpgrade(var_34_0.level, var_34_0.gold) or arg_34_0:GetClassVO():CanUpgrade(var_34_0.level, var_34_0.gold) then
		return true
	end

	return false
end

function var_0_0.AddCourseProficiency(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0:getCourse()
	local var_35_1 = arg_35_0:GetClassVO()
	local var_35_2 = var_35_1:GetExp2ProficiencyRatio() * var_35_0:getExtraRate()
	local var_35_3 = var_35_0:GetProficiency() + math.floor(arg_35_1 * var_35_2 * 0.01)
	local var_35_4 = math.min(var_35_3, var_35_1:GetMaxProficiency())

	var_35_0:SetProficiency(var_35_4)
	arg_35_0:setCourse(var_35_0)
end

function var_0_0.AddProficiency(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0:getCourse()

	var_36_0:SetProficiency(math.min(var_36_0:GetProficiency() + arg_36_1, arg_36_0:GetClassVO():GetMaxProficiency()))
	arg_36_0:setCourse(var_36_0)
end

function var_0_0.fillStudens(arg_37_0, arg_37_1)
	local var_37_0 = pg.gameset.academy_random_ship_count.key_value
	local var_37_1 = {}

	for iter_37_0, iter_37_1 in pairs(arg_37_1) do
		var_37_1[iter_37_1.groupId] = true
		var_37_0 = var_37_0 - 1
	end

	local var_37_2 = pg.gameset.academy_random_ship_coldtime.key_value

	if not arg_37_0._timeStamp or var_37_2 < os.time() - arg_37_0._timeStamp then
		arg_37_0._studentsFiller = nil
	end

	if not arg_37_0._studentsFiller then
		local var_37_3 = math.random(1, var_37_0)

		arg_37_0._timeStamp = os.time()
		arg_37_0._studentsFiller = {}

		local var_37_4 = getProxy(CollectionProxy):getGroups()
		local var_37_5 = getProxy(BayProxy)
		local var_37_6 = getProxy(ShipSkinProxy):getSkinList()
		local var_37_7 = {}

		for iter_37_2, iter_37_3 in pairs(var_37_4) do
			if not table.contains(var_37_1, iter_37_2) then
				var_37_7[#var_37_7 + 1] = iter_37_2
			end
		end

		local var_37_8 = #var_37_7

		while var_37_3 > 0 and var_37_8 > 0 do
			local var_37_9 = math.random(#var_37_7)
			local var_37_10 = var_37_7[var_37_9]
			local var_37_11 = var_37_4[var_37_10]
			local var_37_12 = var_37_10 * 10 + 1
			local var_37_13 = 10000000000 + var_37_12
			local var_37_14 = ShipGroup.getSkinList(var_37_10)
			local var_37_15 = {}
			local var_37_16
			local var_37_17 = {}

			for iter_37_4, iter_37_5 in ipairs(var_37_14) do
				local var_37_18 = iter_37_5.skin_type

				if var_37_18 == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_37_6, iter_37_5.id) or var_37_18 == ShipSkin.SKIN_TYPE_REMAKE and var_37_11.trans or var_37_18 == ShipSkin.SKIN_TYPE_PROPOSE and var_37_11.married == 1 then
					var_37_17[#var_37_17 + 1] = iter_37_5.id
				end

				var_37_16 = var_37_17[math.random(#var_37_17)]
			end

			local var_37_19 = {
				id = var_37_13,
				groupId = var_37_10,
				configId = var_37_12,
				skin_id = var_37_16
			}

			table.remove(var_37_7, var_37_9)

			var_37_8 = var_37_8 - 1
			var_37_3 = var_37_3 - 1
			arg_37_0._studentsFiller[#arg_37_0._studentsFiller + 1] = var_37_19
		end
	end

	for iter_37_6, iter_37_7 in ipairs(arg_37_0._studentsFiller) do
		arg_37_1[#arg_37_1 + 1] = Ship.New(iter_37_7)
	end

	return arg_37_1
end

function var_0_0.IsShowTip(arg_38_0)
	local var_38_0 = getProxy(PlayerProxy)

	if var_38_0 and var_38_0:getData() and arg_38_0:isResourceFieldUpgradeConditionSatisfy() then
		return true
	end

	local var_38_1 = getProxy(ShopsProxy)

	if var_38_1 then
		local var_38_2 = var_38_1:getShopStreet()

		if var_38_2 and var_38_2:isUpdateGoods() then
			return true
		end
	end

	local var_38_3 = pg.TimeMgr.GetInstance():GetServerTime()

	for iter_38_0, iter_38_1 in pairs(arg_38_0.students) do
		if var_38_3 >= iter_38_1:getFinishTime() then
			return true
		end
	end

	if getProxy(CollectionProxy):unclaimTrophyCount() > 0 then
		return true
	end

	local var_38_4 = getProxy(TaskProxy)

	if _.any(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST), function(arg_39_0)
		local var_39_0 = arg_39_0:getTaskShip()
		local var_39_1 = var_39_0 and var_38_4:getAcademyTask(var_39_0.groupId) or nil
		local var_39_2 = var_38_4:getTaskById(var_39_1)
		local var_39_3 = var_38_4:getFinishTaskById(var_39_1)

		return var_39_0 and (var_39_1 and not var_39_2 and not var_39_3 or var_39_2 and var_39_2:isFinish())
	end) then
		return true
	end

	return false
end

function var_0_0.getDailyFinishCnt(arg_40_0)
	local var_40_0 = _.detect(BuffHelper.GetBuffsByActivityType(ActivityConst.ACTIVITY_TYPE_BUFF), function(arg_41_0)
		return arg_41_0:getConfig("benefit_type") == "skill_learn_time"
	end)

	return (var_40_0 and tonumber(var_40_0:getConfig("benefit_effect")) or 0) - arg_40_0.dailyFinsihCnt
end

function var_0_0.updateUsedDailyFinishCnt(arg_42_0)
	arg_42_0.dailyFinsihCnt = arg_42_0.dailyFinsihCnt + 1
end

function var_0_0.resetUsedDailyFinishCnt(arg_43_0)
	arg_43_0.dailyFinsihCnt = 0
end

return var_0_0
