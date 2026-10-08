local var_0_0 = class("Dorm3dHxHelper")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.loader = arg_1_1
	arg_1_0.materialsBySkin = {}
	arg_1_0.loadedGroups = {}
	arg_1_0.loadingGroups = {}
	arg_1_0.appliedMaterials = setmetatable({}, {
		__mode = "k"
	})
end

local function var_0_1(arg_2_0)
	local var_2_0 = pg.dorm3d_resource[arg_2_0].hx_material

	return type(var_2_0) == "table" and var_2_0 or {}
end

local function var_0_2(arg_3_0)
	return string.lower((string.gsub(arg_3_0, "%s*%(Instance%)$", "")))
end

local function var_0_3(arg_4_0)
	return string.lower((string.gsub(arg_4_0, "\\", "/")))
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = string.match(var_0_3(arg_5_1), "[^/]+$")
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0) do
		if string.match(var_0_3(iter_5_1), "[^/]+$") == var_5_0 then
			table.insert(var_5_1, iter_5_1)
		end
	end

	return #var_5_1 > 0 and table.concat(var_5_1, ", ") or "<none>"
end

function var_0_0.GetMaterialResources(arg_6_0)
	local var_6_0 = {}

	if not HXSet.isHx() then
		return var_6_0
	end

	for iter_6_0, iter_6_1 in ipairs(pg.dorm3d_resource.get_id_list_by_ship_group[arg_6_0] or {}) do
		for iter_6_2, iter_6_3 in ipairs(var_0_1(iter_6_1)) do
			if not table.contains(var_6_0, iter_6_3[1]) then
				table.insert(var_6_0, iter_6_3[1])
			end
		end
	end

	return var_6_0
end

function var_0_0.LoadMaterials(arg_7_0, arg_7_1, arg_7_2)
	if not HXSet.isHx() or arg_7_0.loadedGroups[arg_7_1] then
		existCall(arg_7_2)

		return
	end

	if arg_7_0.loadingGroups[arg_7_1] then
		table.insert(arg_7_0.loadingGroups[arg_7_1], arg_7_2)

		return
	end

	arg_7_0.loadingGroups[arg_7_1] = {
		arg_7_2
	}

	local var_7_0 = {}
	local var_7_1 = {}

	for iter_7_0, iter_7_1 in ipairs(pg.dorm3d_resource.get_id_list_by_ship_group[arg_7_1] or {}) do
		var_7_0[iter_7_1] = {}

		for iter_7_2, iter_7_3 in ipairs(var_0_1(iter_7_1)) do
			local var_7_2, var_7_3 = unpack(iter_7_3)

			var_7_1[var_7_2] = var_7_1[var_7_2] or {}

			table.insert(var_7_1[var_7_2], {
				iter_7_1,
				var_7_3
			})
		end
	end

	local var_7_4 = {}

	for iter_7_4, iter_7_5 in pairs(var_7_1) do
		table.insert(var_7_4, function(arg_8_0)
			arg_7_0.loader:LoadBundle(iter_7_4, function(arg_9_0)
				if not arg_9_0 or not EDITOR_TOOL and IsNil(arg_9_0.ab) then
					error("Missing Dorm3D HX material bundle: " .. iter_7_4)
				end

				local var_9_0 = arg_9_0:GetAllAssetNames()
				local var_9_1 = {}

				for iter_9_0, iter_9_1 in ipairs(var_9_0) do
					var_9_1[var_0_3(iter_9_1)] = iter_9_1
				end

				local var_9_2 = {}

				for iter_9_2, iter_9_3 in ipairs(iter_7_5) do
					local var_9_3, var_9_4 = unpack(iter_9_3)
					local var_9_5 = var_9_2[var_9_4]

					if not var_9_5 then
						local var_9_6 = var_9_1[var_0_3(var_9_4)]

						if not var_9_6 then
							error(string.format("Missing Dorm3D HX material asset in bundle: skin=%s bundle=%s asset=%s same-name assets=[%s]", var_9_3, iter_7_4, var_9_4, var_0_4(var_9_0, var_9_4)))
						end

						var_9_5 = arg_9_0:LoadAssetSync(var_9_6, typeof(Material), false, false)

						if IsNil(var_9_5) then
							error(string.format("Failed to load Dorm3D HX material: skin=%s bundle=%s asset=%s resolved=%s", var_9_3, iter_7_4, var_9_4, var_9_6))
						end

						var_9_2[var_9_4] = var_9_5
					end

					local var_9_7 = var_0_2(var_9_5.name)
					local var_9_8 = var_7_0[var_9_3][var_9_7]

					if var_9_8 and (var_9_8.bundle ~= iter_7_4 or var_9_8.asset ~= var_9_4) then
						error(string.format("Duplicate Dorm3D HX material name: skin=%s name=%s assets=%s / %s", var_9_3, var_9_7, var_9_8.asset, var_9_4))
					end

					var_7_0[var_9_3][var_9_7] = {
						material = var_9_5,
						bundle = iter_7_4,
						asset = var_9_4
					}
				end

				arg_8_0()
			end)
		end)
	end

	parallelAsync(var_7_4, function()
		for iter_10_0, iter_10_1 in pairs(var_7_0) do
			arg_7_0.materialsBySkin[iter_10_0] = iter_10_1
		end

		arg_7_0.loadedGroups[arg_7_1] = true

		local var_10_0 = arg_7_0.loadingGroups[arg_7_1]

		arg_7_0.loadingGroups[arg_7_1] = nil

		for iter_10_2, iter_10_3 in ipairs(var_10_0) do
			iter_10_3()
		end
	end)
end

function var_0_0.ReplaceMaterials(arg_11_0, arg_11_1, arg_11_2)
	if not HXSet.isHx() or IsNil(arg_11_1) then
		return false
	end

	arg_11_2 = arg_11_2 or var_0_0.GetSkinIdByModelName(arg_11_1.name)

	if not arg_11_2 then
		return false
	end

	local var_11_0 = arg_11_0.materialsBySkin[arg_11_2]

	if not var_11_0 then
		if #var_0_1(arg_11_2) > 0 then
			error("Dorm3D HX materials are not loaded for skin: " .. tostring(arg_11_2))
		end

		return false
	end

	if not next(var_11_0) then
		return false
	end

	local var_11_1 = {}
	local var_11_2 = arg_11_1:GetComponentsInChildren(typeof(Renderer), true)

	table.IpairsCArray(var_11_2, function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.sharedMaterials
		local var_12_1 = arg_11_0.appliedMaterials[arg_12_1]
		local var_12_2 = false

		table.IpairsCArray(var_12_0, function(arg_13_0, arg_13_1)
			if IsNil(arg_13_1) then
				return
			end

			local var_13_0 = var_11_0[var_0_2(arg_13_1.name)]

			if not var_13_0 or arg_13_1 == var_13_0.material then
				return
			end

			if var_12_1 and var_12_1.skinId == arg_11_2 and var_12_1.materials[arg_13_0] == arg_13_1 then
				return
			end

			var_12_0[arg_13_0] = var_13_0.material
			var_12_2 = true

			warning("DORM3D HX REPLACE MATERIAL", arg_13_1.name)
		end)

		if var_12_2 then
			arg_12_1.sharedMaterials = var_12_0

			table.insert(var_11_1, arg_12_1)
		end
	end)

	if #var_11_1 == 0 then
		return false
	end

	GraphicsInterface.Instance:UpdateCharacterMaterialLst(go(arg_11_1))

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		arg_11_0.appliedMaterials[iter_11_1] = {
			skinId = arg_11_2,
			materials = iter_11_1.sharedMaterials
		}
	end

	return true
end

function var_0_0.Apply(arg_14_0, arg_14_1, arg_14_2)
	if not HXSet.isHx() or IsNil(arg_14_1) then
		return false
	end

	if var_0_0.ReplaceCharacterParts(arg_14_1, arg_14_2) then
		return true
	end

	return arg_14_0:ReplaceMaterials(arg_14_1, arg_14_2)
end

function var_0_0.GetTimelineMainCharacter()
	local var_15_0 = GameObject.Find("[actor]").transform
	local var_15_1

	table.IpairsCArray(var_15_0:GetComponentsInChildren(typeof("BLHXCharacterPropertiesController")), function(arg_16_0, arg_16_1)
		if arg_16_0 == 0 or var_0_0.GetSkinIdByModelName(arg_16_1.gameObject.name) then
			var_15_1 = arg_16_1.transform
		end
	end)

	return var_15_1
end

function var_0_0.GetSkinIdByModelName(arg_17_0)
	arg_17_0 = string.gsub(arg_17_0, "%s*%(Clone%)$", "")

	for iter_17_0, iter_17_1 in ipairs(pg.dorm3d_resource.all) do
		local var_17_0 = pg.dorm3d_resource[iter_17_1]

		if var_17_0.origin_model == arg_17_0 or var_17_0.model_id == arg_17_0 then
			return iter_17_1
		end
	end

	return nil
end

function var_0_0.ReplaceCharacterParts(arg_18_0, arg_18_1)
	if not HXSet.isHx() then
		return false
	end

	arg_18_1 = arg_18_1 or var_0_0.GetSkinIdByModelName(arg_18_0.name)

	if not arg_18_1 then
		return false
	end

	local var_18_0 = pg.dorm3d_resource[arg_18_1].hx_component

	if not var_18_0 or var_18_0 == "" or #var_18_0 == 0 then
		return false
	end

	local var_18_1 = false

	_.each(var_18_0, function(arg_19_0)
		if not checkABExist(arg_19_0) then
			warning("要替换的部件不存在", arg_19_0)

			return
		end

		GraphicsInterface.Instance:LoadCharacterComponent(go(arg_18_0), arg_19_0)
		warning("ReplaceCharacterPart", arg_19_0)

		var_18_1 = true
	end)

	return var_18_1
end

function var_0_0.ShowHolyLight(arg_20_0, arg_20_1, arg_20_2)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0) do
		if iter_20_1 then
			GetOrAddComponent(iter_20_1, typeof(DormAnimationEventDispatcher))
		end
	end

	if not HXSet.isHx() then
		return false
	end

	arg_20_2 = arg_20_2 or false

	local var_20_0 = {}

	for iter_20_2, iter_20_3 in ipairs(arg_20_0) do
		if iter_20_3 then
			local var_20_1 = var_0_0.GetSkinIdByModelName(iter_20_3.name)

			if var_20_1 then
				for iter_20_4, iter_20_5 in ipairs(pg.dorm3d_holylight.get_id_list_by_skin_id[var_20_1] or {}) do
					table.insert(var_20_0, {
						iter_20_3,
						pg.dorm3d_holylight[iter_20_5]
					})
				end
			end
		end
	end

	UIItemList.StaticAlign(arg_20_1, arg_20_1:GetChild(0), #var_20_0, function(arg_21_0, arg_21_1, arg_21_2)
		local var_21_0, var_21_1 = unpack(var_20_0[arg_21_1 + 1])
		local var_21_2 = arg_21_2:GetComponent(typeof(HolyLightController))

		var_21_2.targetBone = var_21_0:Find(var_21_1.target_bone)
		var_21_2.localAxis = Vector3(unpack(var_21_1.axis))
		var_21_2.invertAxis = var_21_1.invert ~= 0
		var_21_2.defaultAxisThreshold = var_21_1.default_threshold
		var_21_2.axisThreshold = var_21_2.defaultAxisThreshold
		var_21_2.rotationOffset = Vector3(unpack(var_21_1.rotation_offset))

		GetSpriteFromAtlasAsync(var_21_1.texture, "", function(arg_22_0)
			local var_22_0 = arg_21_2:GetComponent(typeof(Image))

			var_22_0.sprite = arg_22_0
			var_22_0.color = Color.New(unpack(var_21_1.color))
		end)

		var_21_2.baseSize = Vector2(unpack(var_21_1.base_size))
		var_21_2.useRaycastOcclusion = arg_20_2
		var_21_2.targetDispatcher = GetOrAddComponent(var_21_0, typeof(DormAnimationEventDispatcher))
	end)
end

function var_0_0.SetModelHolyLightActive(arg_23_0, arg_23_1, arg_23_2)
	if not HXSet.isHx() then
		return false
	end

	if not arg_23_0 or IsNil(arg_23_0) or not arg_23_1 or IsNil(arg_23_1) then
		return false
	end

	local var_23_0 = false

	for iter_23_0 = 0, arg_23_1.childCount - 1 do
		local var_23_1 = arg_23_1:GetChild(iter_23_0)
		local var_23_2 = var_23_1:GetComponent(typeof(HolyLightController))
		local var_23_3 = var_23_2 and var_23_2.targetBone

		if var_23_3 and not IsNil(var_23_3) and var_23_3:IsChildOf(arg_23_0) then
			setActive(var_23_1, arg_23_2)

			var_23_0 = true
		end
	end

	return var_23_0
end

function var_0_0.GetHolyLightScreenShotInfo(arg_24_0)
	local var_24_0 = {}
	local var_24_1 = {}

	for iter_24_0 = 0, arg_24_0.childCount - 1 do
		local var_24_2 = arg_24_0:GetChild(iter_24_0).gameObject

		if isActive(var_24_2) then
			local var_24_3, var_24_4, var_24_5 = var_24_2:GetComponent(typeof(HolyLightController)):GetScreenShotInfo(nil, nil)

			if var_24_3 then
				table.insert(var_24_0, var_24_4)
				table.insert(var_24_1, var_24_5)
			end
		end
	end

	return var_24_1, var_24_0
end

function var_0_0.HideCharacterPart(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = var_0_0.GetSkinIdByModelName(arg_25_0.name)

	warning("HideCharacterPart skinId", var_25_0)

	if not var_25_0 then
		return
	end

	local var_25_1 = Dorm3dSkin.New({
		configId = var_25_0
	})

	if arg_25_2 and not var_25_1:ShouldApplyHiddenPartInTimeline() then
		return
	end

	local var_25_2 = var_25_1:GetGroupId()

	arg_25_1 = arg_25_1 or getProxy(ApartmentProxy):getApartment(var_25_2):GetHiddenParts(var_25_0)

	local var_25_3, var_25_4 = var_25_1:GetActiveAndHiddenPartNames(arg_25_1)

	_.each(var_25_3, function(arg_26_0)
		setActive(arg_25_0:Find(arg_26_0), true)
	end)
	_.each(var_25_4, function(arg_27_0)
		setActive(arg_25_0:Find(arg_27_0), false)
	end)
end

return var_0_0
