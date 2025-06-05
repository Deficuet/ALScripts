local var_0_0 = class("MainRemoveNpcSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(BayProxy)

	if not var_1_0.isClearNpc then
		local var_1_1 = getProxy(ActivityProxy)

		for iter_1_0, iter_1_1 in pairs(var_1_0:getRawData()) do
			if iter_1_1:isActivityNpc() and not var_1_1:IsActivityNotEnd(iter_1_1.activityNpc) then
				local var_1_2 = iter_1_1:clone()

				arg_1_0:UnloadEquipments(var_1_2)
				arg_1_0:CheckChapters(var_1_2)
				arg_1_0:CheckFormations(var_1_2)
				arg_1_0:CheckNavTactics(var_1_2)
				var_1_0:removeShipById(var_1_2.id)
			end
		end

		var_1_0.isClearNpc = true
	end

	arg_1_1()
end

function var_0_0.UnloadEquipments(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(EquipmentProxy)
	local var_2_1 = arg_2_1.equipments

	for iter_2_0, iter_2_1 in pairs(var_2_1) do
		if iter_2_1 then
			arg_2_1:updateEquip(iter_2_0, nil)
			var_2_0:addEquipmentById(iter_2_1.id, 1)
		end

		if arg_2_1:getEquipSkin(iter_2_0) ~= 0 then
			arg_2_1:updateEquipmentSkin(iter_2_0, 0)
			var_2_0:addEquipmentSkin(iter_2_1.skinId, 1)
		end
	end

	local var_2_2 = arg_2_1:GetSpWeapon()

	if var_2_2 then
		arg_2_1:UpdateSpWeapon(nil)
		var_2_0:AddSpWeapon(var_2_2)
	end
end

function var_0_0.CheckChapters(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(ChapterProxy):getActiveChapter()

	if var_3_0 then
		local var_3_1 = var_3_0.fleets

		for iter_3_0, iter_3_1 in pairs(var_3_1) do
			if iter_3_1:containsShip(arg_3_1.id) then
				pg.m02:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRetreat
				})

				break
			end
		end
	end
end

function var_0_0.CheckFormations(arg_4_0, arg_4_1)
	local var_4_0 = getProxy(FleetProxy)
	local var_4_1 = var_4_0:getData()

	for iter_4_0, iter_4_1 in pairs(var_4_1) do
		if iter_4_1:containShip(arg_4_1) then
			iter_4_1:removeShip(arg_4_1)
			var_4_0:updateFleet(iter_4_1)
		end
	end
end

function var_0_0.CheckNavTactics(arg_5_0, arg_5_1)
	local var_5_0 = getProxy(NavalAcademyProxy)
	local var_5_1 = var_5_0:getStudents()

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		if iter_5_1.shipId == arg_5_1.id then
			var_5_0:deleteStudent(iter_5_1.id)

			break
		end
	end
end

return var_0_0
