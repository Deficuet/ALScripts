local var_0_0 = class("Dorm3dHxHelper")

function var_0_0.GetTimelineMainCharacter()
	local var_1_0 = GameObject.Find("[actor]").transform
	local var_1_1

	table.IpairsCArray(var_1_0:GetComponentsInChildren(typeof("BLHXCharacterPropertiesController")), function(arg_2_0, arg_2_1)
		if var_0_0.GetSkinIdByModelName(arg_2_1.gameObject.name) then
			var_1_1 = arg_2_1.transform
		end
	end)

	return var_1_1
end

function var_0_0.GetSkinIdByModelName(arg_3_0)
	arg_3_0 = string.gsub(arg_3_0, "%s*%(Clone%)$", "")

	for iter_3_0, iter_3_1 in ipairs(pg.dorm3d_resource.all) do
		local var_3_0 = pg.dorm3d_resource[iter_3_1]

		if var_3_0.origin_model == arg_3_0 or var_3_0.model_id == arg_3_0 then
			return iter_3_1
		end
	end

	return nil
end

function var_0_0.ReplaceCharacterParts(arg_4_0)
	if not HXSet.isHx() then
		return false
	end

	local var_4_0 = var_0_0.GetSkinIdByModelName(arg_4_0.name)

	if not var_4_0 then
		return false
	end

	local var_4_1 = pg.dorm3d_resource[var_4_0].hx_component

	if not var_4_1 or var_4_1 == "" or #var_4_1 == 0 then
		return false
	end

	local var_4_2 = false

	_.each(var_4_1, function(arg_5_0)
		if not checkABExist(arg_5_0) then
			warning("要替换的部件不存在", arg_5_0)

			return
		end

		GraphicsInterface.Instance:LoadCharacterComponent(go(arg_4_0), arg_5_0)
		warning("ReplaceCharacterPart", arg_5_0)

		var_4_2 = true
	end)

	return var_4_2
end

function var_0_0.ShowHolyLight(arg_6_0, arg_6_1, arg_6_2)
	if not HXSet.isHx() then
		return false
	end

	arg_6_2 = arg_6_2 or false

	local var_6_0 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_0) do
		if iter_6_1 then
			local var_6_1 = var_0_0.GetSkinIdByModelName(iter_6_1.name)

			if var_6_1 then
				for iter_6_2, iter_6_3 in ipairs(pg.dorm3d_holylight.get_id_list_by_skin_id[var_6_1] or {}) do
					table.insert(var_6_0, {
						iter_6_1,
						pg.dorm3d_holylight[iter_6_3]
					})
				end
			end
		end
	end

	UIItemList.StaticAlign(arg_6_1, arg_6_1:GetChild(0), #var_6_0, function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0, var_7_1 = unpack(var_6_0[arg_7_1 + 1])
		local var_7_2 = arg_7_2:GetComponent(typeof(HolyLightController))

		var_7_2.targetBone = var_7_0:Find(var_7_1.target_bone)
		var_7_2.localAxis = Vector3(unpack(var_7_1.axis))
		var_7_2.invertAxis = var_7_1.invert ~= 0
		var_7_2.defaultAxisThreshold = var_7_1.default_threshold
		var_7_2.axisThreshold = var_7_2.defaultAxisThreshold
		var_7_2.rotationOffset = Vector3(unpack(var_7_1.rotation_offset))

		GetSpriteFromAtlasAsync(var_7_1.texture, "", function(arg_8_0)
			local var_8_0 = arg_7_2:GetComponent(typeof(Image))

			var_8_0.sprite = arg_8_0
			var_8_0.color = Color.New(unpack(var_7_1.color))
		end)

		var_7_2.baseSize = Vector2(unpack(var_7_1.base_size))
		var_7_2.useRaycastOcclusion = arg_6_2
		var_7_2.targetDispatcher = GetOrAddComponent(var_7_0, typeof(DormAnimationEventDispatcher))
	end)
end

function var_0_0.GetHolyLightScreenShotInfo(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = {}

	for iter_9_0 = 0, arg_9_0.childCount - 1 do
		local var_9_2 = arg_9_0:GetChild(iter_9_0).gameObject

		if isActive(var_9_2) then
			local var_9_3, var_9_4, var_9_5 = var_9_2:GetComponent(typeof(HolyLightController)):GetScreenShotInfo(nil, nil)

			if var_9_3 then
				table.insert(var_9_0, var_9_4)
				table.insert(var_9_1, var_9_5)
			end
		end
	end

	return var_9_1, var_9_0
end

return var_0_0
