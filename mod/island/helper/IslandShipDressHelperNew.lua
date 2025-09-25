local var_0_0 = class("IslandShipDressHelperNew")

var_0_0.DressType = {
	Flotage = 2,
	Face = 5,
	Hat = 7,
	Body = 6,
	Footprint = 3,
	BackDecorate = 1,
	Hair = 4
}
var_0_0.CommanderCustom = {
	var_0_0.DressType.Hair,
	var_0_0.DressType.Face,
	var_0_0.DressType.Body,
	var_0_0.DressType.Hat
}
var_0_0.ExtraDressType = {
	var_0_0.DressType.BackDecorate,
	var_0_0.DressType.Flotage,
	var_0_0.DressType.Footprint
}
var_0_0.ComponentType = {
	Body = 1,
	Face = 2,
	Hair = 3,
	Headware = 4
}

function var_0_0.GetInitDressByType(arg_1_0)
	local function var_1_0(arg_2_0)
		local var_2_0 = pg.island_set.default_dress.key_value_varchar

		for iter_2_0, iter_2_1 in ipairs(var_2_0) do
			if pg.island_dress_template[iter_2_1].type == arg_2_0 then
				return iter_2_1
			end
		end

		return 0
	end

	if arg_1_0 == var_0_0.DressType.Hat then
		local var_1_1 = var_1_0(var_0_0.DressType.Body)

		return pg.island_dress_template.get_id_list_by_related_dress[var_1_1][1]
	end

	return var_1_0(arg_1_0)
end

function var_0_0.PreLoadVisterDressupItem(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	arg_3_0.roleTF = arg_3_1.transform
	arg_3_0.isScene = true
	arg_3_0.shipId = 0
	arg_3_0.playerId = arg_3_2
	arg_3_0.hasTF = true
	arg_3_0.currentDressDataDic = {}
	arg_3_0.pageDressTFDic = {}

	local var_3_0 = {
		var_0_0.DressType.BackDecorate,
		var_0_0.DressType.Flotage,
		var_0_0.DressType.Footprint
	}
	local var_3_1 = arg_3_3 and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()
	local var_3_2 = var_3_1:GetVisitorAgency():GetPlayer(arg_3_0.playerId)
	local var_3_3 = 0

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_4 = var_3_2:GetDressByType(iter_3_1)

		if var_3_4 and var_3_4 ~= 0 then
			local var_3_5 = {
				id = var_3_4
			}

			var_3_5.colorId = 0
			arg_3_0.currentDressDataDic[iter_3_1] = var_3_5
			var_3_3 = var_3_3 + 1
		end
	end

	arg_3_0:InitVisterCustomDressData(arg_3_2, var_3_1)

	if var_3_3 == 0 then
		arg_3_4()

		return
	end

	local var_3_6 = 0

	for iter_3_2, iter_3_3 in pairs(arg_3_0.currentDressDataDic) do
		arg_3_0:LoadDressObjectItem(iter_3_2, iter_3_3.id, function()
			var_3_6 = var_3_6 + 1

			if var_3_6 == var_3_3 then
				arg_3_4()
			end
		end)
	end
end

function var_0_0.InitVisterCustomDressData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.commanderDressDic = {}

	local var_5_0 = arg_5_2:GetVisitorAgency():GetPlayer(arg_5_0.playerId)

	for iter_5_0, iter_5_1 in pairs(var_0_0.CommanderCustom) do
		local var_5_1 = var_5_0:GetDressByType(iter_5_1)

		if var_5_1 then
			arg_5_0.commanderDressDic[iter_5_1] = var_5_1
		end
	end
end

function var_0_0.PreLoadShipDressupItem(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.roleTF = arg_6_1.transform
	arg_6_0.isScene = true
	arg_6_0.shipId = arg_6_2
	arg_6_0.hasTF = true
	arg_6_0.currentDressDataDic = {}
	arg_6_0.pageDressTFDic = {}

	local var_6_0 = {
		var_0_0.DressType.BackDecorate,
		var_0_0.DressType.Flotage,
		var_0_0.DressType.Footprint
	}
	local var_6_1 = getProxy(IslandProxy):GetIsland()

	if arg_6_0.shipId == 0 then
		local var_6_2 = var_6_1:GetDressUpAgency()
		local var_6_3 = 0

		for iter_6_0, iter_6_1 in ipairs(var_6_0) do
			local var_6_4 = var_6_2:GetDressByType(iter_6_1)

			if var_6_4 and var_6_4 ~= 0 then
				local var_6_5 = {
					id = var_6_4
				}

				var_6_5.colorId = 0
				arg_6_0.currentDressDataDic[iter_6_1] = var_6_5
				var_6_3 = var_6_3 + 1
			end
		end

		arg_6_0:InitCommanderCustomDressData()

		if var_6_3 == 0 then
			arg_6_3()

			return
		end

		local var_6_6 = 0

		for iter_6_2, iter_6_3 in pairs(arg_6_0.currentDressDataDic) do
			arg_6_0:LoadDressObjectItem(iter_6_2, iter_6_3.id, function()
				var_6_6 = var_6_6 + 1

				if var_6_6 == var_6_3 then
					arg_6_3()
				end
			end)
		end
	else
		local var_6_7 = var_6_1:GetCharacterAgency()

		arg_6_0.modelData = var_6_7:GetShipById(arg_6_0.shipId):GetModel()

		local var_6_8 = 0

		for iter_6_4, iter_6_5 in pairs(var_6_0) do
			local var_6_9 = var_6_7:GetCurDressIdByShipId(arg_6_0.shipId, iter_6_5)

			if var_6_9 and dressId ~= 0 then
				local var_6_10 = {
					id = var_6_9.dress_id
				}

				var_6_10.colorId = 0
				arg_6_0.currentDressDataDic[iter_6_5] = var_6_10
				var_6_8 = var_6_8 + 1
			end
		end

		if var_6_8 == 0 then
			arg_6_3()

			return
		end

		local var_6_11 = 0

		for iter_6_6, iter_6_7 in pairs(arg_6_0.currentDressDataDic) do
			arg_6_0:LoadDressObjectItem(iter_6_6, iter_6_7.id, function()
				var_6_11 = var_6_11 + 1

				if var_6_11 == var_6_8 then
					arg_6_3()
				end
			end)
		end
	end
end

function var_0_0.SetShipId(arg_9_0, arg_9_1)
	arg_9_0.shipId = arg_9_1
	arg_9_0.hasTF = false
	arg_9_0.currentDressDataDic = {}
	arg_9_0.dataAfterRoleInit = {}

	arg_9_0:RemoveDressTF()
	arg_9_0:InitDressData()
end

function var_0_0.InitCommanderCustomDressData(arg_10_0)
	arg_10_0.commanderDressDic = {}

	local var_10_0 = getProxy(IslandProxy):GetIsland():GetDressUpAgency()

	for iter_10_0, iter_10_1 in pairs(var_0_0.CommanderCustom) do
		local var_10_1 = var_10_0:GetDressByType(iter_10_1)

		if var_10_1 then
			arg_10_0.commanderDressDic[iter_10_1] = var_10_1
		end
	end
end

function var_0_0.InitDressData(arg_11_0)
	local var_11_0 = {
		var_0_0.DressType.BackDecorate,
		var_0_0.DressType.Flotage,
		var_0_0.DressType.Footprint
	}
	local var_11_1 = getProxy(IslandProxy):GetIsland()

	if arg_11_0.shipId == 0 then
		local var_11_2 = var_11_1:GetDressUpAgency()

		for iter_11_0, iter_11_1 in pairs(var_11_0) do
			local var_11_3 = var_11_2:GetDressByType(iter_11_1)

			if var_11_3 then
				local var_11_4 = {
					id = var_11_3
				}

				var_11_4.colorId = 0
				arg_11_0.dataAfterRoleInit[iter_11_1] = var_11_4
			end
		end

		arg_11_0:InitCommanderCustomDressData()
	else
		local var_11_5 = var_11_1:GetCharacterAgency()

		for iter_11_2, iter_11_3 in pairs(var_11_0) do
			local var_11_6 = var_11_5:GetCurDressIdByShipId(arg_11_0.shipId, iter_11_3)

			if var_11_6 then
				local var_11_7 = {
					id = var_11_6.dress_id
				}

				var_11_7.colorId = 0
				arg_11_0.dataAfterRoleInit[iter_11_3] = var_11_7
			end
		end
	end
end

function var_0_0.InitDressTF(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.dataAfterRoleInit) do
		arg_12_0:ChangeDressByType(iter_12_0, iter_12_1)
	end

	arg_12_0.dataAfterRoleInit = {}
end

function var_0_0.OnRoleLoaded(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.modelData = arg_13_2
	arg_13_0.roleTF = arg_13_1
	arg_13_0.hasTF = true

	arg_13_0:InitDressTF()
end

function var_0_0.RemoveDressTF(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.pageDressTFDic or {}) do
		Object.Destroy(iter_14_1.gameObject)
	end

	arg_14_0.pageDressTFDic = {}
end

function var_0_0.ChangeCommanderPartColor(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_2 == 0 then
		GraphicsInterface.Instance:ResetCharacterComponentMaterialData(arg_15_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair)
	else
		local var_15_0 = pg.island_dress_colordiff_template[arg_15_2].model

		GraphicsInterface.Instance:SetCharacterComponentMaterialData(arg_15_0.roleTF:GetChild(0).gameObject, var_15_0)
	end
end

function var_0_0.ChangeCommanderPart(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_2.id
	local var_16_1 = arg_16_2.colorId

	arg_16_0.commanderDressDic[arg_16_1] = arg_16_2.id

	local function var_16_2()
		local var_17_0 = arg_16_0.commanderDressDic[var_0_0.DressType.Hat] or 0

		if var_17_0 == 0 then
			GraphicsInterface.Instance:SetCharacterBlendShape(arg_16_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair, 0, 0)
			GraphicsInterface.Instance:SetCharacterBlendShape(arg_16_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair, 1, 0)
		else
			local var_17_1 = pg.island_dress_template[var_17_0].sub_type - 1

			GraphicsInterface.Instance:SetCharacterBlendShape(arg_16_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair, var_17_1, 100)
			GraphicsInterface.Instance:SetCharacterBlendShape(arg_16_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair, 1 - var_17_1, 0)
		end
	end

	local function var_16_3()
		if arg_16_1 == var_0_0.DressType.Hat then
			arg_16_0:ChangeCommanderPartShow(arg_16_1, true)
			var_16_2()
		elseif arg_16_1 == var_0_0.DressType.Hair then
			var_16_2()
		elseif arg_16_1 == var_0_0.DressType.Face then
			local var_18_0 = pg.island_dress_template[var_16_0]
			local var_18_1 = var_18_0.face_clip == "" and "idle" or var_18_0.face_clip

			arg_16_0.roleTF:GetChild(0).gameObject:GetComponent(typeof(Animator)):Play(var_18_1, 4)
		end
	end

	if var_16_0 ~= 0 then
		local var_16_4 = pg.island_dress_template[var_16_0].model

		if var_16_1 == 0 or var_16_1 == nil then
			GraphicsInterface.Instance:LoadCharacterComponent(arg_16_0.roleTF:GetChild(0).gameObject, var_16_4, var_16_3)
		else
			local var_16_5 = pg.island_dress_colordiff_template[var_16_1].model

			GraphicsInterface.Instance:LoadCharacterComponentAndMaterial(arg_16_0.roleTF:GetChild(0).gameObject, var_16_4, var_16_5, var_16_3)
		end
	end

	if arg_16_1 == var_0_0.DressType.Hat and var_16_0 == 0 then
		arg_16_0:ChangeCommanderPartShow(arg_16_1, false)
		var_16_2()
	end
end

function var_0_0.LoadDressObjectItem(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = pg.island_dress_template[arg_19_2]
	local var_19_1 = var_19_0.model
	local var_19_2 = arg_19_0.shipId
	local var_19_3 = IslandAssetLoadDispatcher.Instance:Enqueue(var_19_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_20_0)
		if var_19_2 ~= arg_19_0.shipId then
			return
		end

		if arg_19_0.currentDressDataDic[arg_19_1].id ~= arg_19_2 then
			return
		end

		local var_20_0 = Object.Instantiate(arg_20_0)
		local var_20_1 = arg_19_0.isScene and Layer.Default or Layer.Character3D

		pg.ViewUtils.SetLayer(var_20_0.transform, var_20_1)
		switch(arg_19_1, {
			[var_0_0.DressType.BackDecorate] = function()
				local var_21_0 = arg_19_0.roleTF.transform

				if var_19_0.attachmentPoint ~= "" then
					local var_21_1 = var_19_0.attachmentPoint

					local function var_21_2(arg_22_0)
						for iter_22_0 = 0, arg_22_0.childCount - 1 do
							local var_22_0 = arg_22_0:GetChild(iter_22_0)

							if var_22_0.name == var_21_1 then
								return var_22_0
							end

							local var_22_1 = var_21_2(var_22_0, var_21_1)

							if var_22_1 then
								return var_22_1
							end
						end

						return nil
					end

					var_21_0 = var_21_2(var_21_0)
				end

				if var_19_0.offset ~= "" then
					local var_21_3 = Vector3(var_19_0.offset[1], var_19_0.offset[2], var_19_0.offset[3])

					var_20_0.transform.localPosition = var_21_3
				end

				if var_19_0.rotation ~= "" then
					local var_21_4 = Quaternion.Euler(var_19_0.rotation[1], var_19_0.rotation[2], var_19_0.rotation[3])

					var_20_0.transform.rotation = var_21_4
				end

				if var_19_0.scale ~= "" then
					local var_21_5 = Vector3(var_19_0.scale[1], var_19_0.scale[1], var_19_0.scale[1])

					var_20_0.transform.localScale = var_21_5
				end

				setParent(var_20_0, var_21_0)
			end,
			[var_0_0.DressType.Flotage] = function()
				local var_23_0

				if var_19_0.offset ~= "" then
					var_23_0 = Vector3(var_19_0.offset[1], var_19_0.offset[2], var_19_0.offset[3])

					local var_23_1 = var_20_0.name
					local var_23_2 = GameObject.New(var_23_1)

					setParent(var_20_0.transform, var_23_2.transform, false)

					var_20_0 = var_23_2
					var_20_0.transform.position = arg_19_0.roleTF:GetChild(0).transform:TransformPoint(var_23_0)
				end

				if var_19_0.scale ~= "" then
					local var_23_3 = Vector3(var_19_0.scale[1], var_19_0.scale[1], var_19_0.scale[1])

					var_20_0.transform.localScale = var_23_3
				end

				local var_23_4 = Vector3(0, 0, 0)

				if var_19_0.rotation ~= "" then
					var_23_4 = Vector3(var_19_0.rotation[1], var_19_0.rotation[2], var_19_0.rotation[3])
				end

				var_20_0.transform.rotation = var_23_4

				local var_23_5 = GetOrAddComponent(var_20_0, typeof(DressFlow))
				local var_23_6 = pg.island_set.island_dress_follow_param.key_value_varchar

				var_23_5.target = arg_19_0.roleTF
				var_23_5.offset = var_23_0
				var_23_5.delayTime = var_23_6[1]
				var_23_5.lerpSpeed = var_23_6[2]
				var_23_5.recordInterval = var_23_6[3]
				var_23_5.rotationOffest = var_23_4
			end,
			[var_0_0.DressType.Footprint] = function()
				local var_24_0 = Vector3(0, 0, 0)

				if var_19_0.offset ~= "" then
					var_24_0 = Vector3(var_19_0.offset[1], var_19_0.offset[2], var_19_0.offset[3])
				end

				setParent(var_20_0, arg_19_0.roleTF)

				var_20_0.transform.localPosition = var_24_0
			end
		})

		arg_19_0.pageDressTFDic[arg_19_2] = var_20_0

		existCall(arg_19_3)
	end), true, true)

	table.insert(arg_19_0.loadingIdList or {}, var_19_3)
end

function var_0_0.ChangeDressObject(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_2.id
	local var_25_1 = arg_25_0.currentDressDataDic[arg_25_1] and arg_25_0.currentDressDataDic[arg_25_1].id or 0

	if var_25_1 then
		if var_25_1 == var_25_0 then
			return
		end

		if var_25_1 ~= 0 then
			local var_25_2 = arg_25_0.pageDressTFDic[var_25_1]

			if var_25_2 then
				Object.Destroy(var_25_2)

				arg_25_0.pageDressTFDic[var_25_1] = nil
			end

			arg_25_0.currentDressDataDic[arg_25_1] = nil
		end
	end

	if var_25_0 == 0 then
		return
	end

	arg_25_0.currentDressDataDic[arg_25_1] = arg_25_2

	arg_25_0:LoadDressObjectItem(arg_25_1, var_25_0)
end

function var_0_0.ChangeDressByType(arg_26_0, arg_26_1, arg_26_2)
	if not arg_26_0.hasTF then
		arg_26_0.dataAfterRoleInit[arg_26_1] = arg_26_2

		return
	end

	if table.contains(var_0_0.CommanderCustom, arg_26_1) then
		arg_26_0:ChangeCommanderPart(arg_26_1, arg_26_2)
	else
		arg_26_0:ChangeDressObject(arg_26_1, arg_26_2)
	end
end

function var_0_0.ChangeCommanderPartShow(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_0.hasTF then
		return
	end

	GraphicsInterface.Instance:SetCharacterComponentShow(arg_27_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Headware, arg_27_2)
end

function var_0_0.ChangeModelTransfromByUnitId(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = pg.island_unit_character[arg_28_1]

	arg_28_0.hasTF = false

	arg_28_0:RemoveDressTF()

	arg_28_0.dataAfterRoleInit = arg_28_0.currentDressDataDic
	arg_28_0.currentDressDataDic = {}

	local var_28_1 = arg_28_0.roleTF:GetChild(0).gameObject

	_IslandCore:GetPoolMgr():ReturnCharacterModel(arg_28_0.modelData.model, arg_28_0.modelData.animator, var_28_1, true)

	arg_28_0.modelData = {
		model = var_28_0.model,
		animator = var_28_0.animator,
		personal_ani = var_28_0.personal_ani
	}

	_IslandCore:GetPoolMgr():GetCharacterModel(arg_28_0.modelData.model, arg_28_0.modelData.animator, function(arg_29_0)
		arg_28_0.hasTF = true

		local var_29_0 = arg_28_0.isScene and Layer.Default or Layer.Character3D

		pg.ViewUtils.SetLayer(arg_29_0.transform, var_29_0)
		setParent(arg_29_0.transform, arg_28_0.roleTF, false)
		arg_28_0:InitDressTF()

		if arg_28_3 then
			local var_29_1 = arg_28_0.modelData.personal_ani

			if var_29_1 and var_29_1 ~= "" then
				local var_29_2 = GetOrAddComponent(arg_28_0.roleTF.transform:GetChild(0), typeof(Animator))

				for iter_29_0 = 1, var_29_2.layerCount do
					var_29_2:CrossFadeInFixedTime(var_29_1, 0, iter_29_0 - 1)
				end
			end
		end

		existCall(arg_28_2, arg_28_0.roleTF)
	end, true)
end

function var_0_0.ChangeModelTransfromByUnitIdAndChangeDress(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4, arg_30_5)
	local var_30_0 = pg.island_unit_character[arg_30_1]

	arg_30_0.hasTF = false

	arg_30_0:RemoveDressTF()

	arg_30_0.dataAfterRoleInit = arg_30_0.currentDressDataDic

	for iter_30_0, iter_30_1 in ipairs(arg_30_2 or {}) do
		local var_30_1 = pg.island_dress_template[iter_30_1].type

		if arg_30_0.dataAfterRoleInit[var_30_1].id == iter_30_1 then
			arg_30_0.dataAfterRoleInit[var_30_1] = nil
		end
	end

	for iter_30_2, iter_30_3 in ipairs(arg_30_3 or {}) do
		local var_30_2 = pg.island_dress_template[iter_30_3].type

		arg_30_0.dataAfterRoleInit[var_30_2] = {
			colorId = 0,
			id = iter_30_3
		}
	end

	arg_30_0.currentDressDataDic = {}

	local var_30_3 = arg_30_0.roleTF:GetChild(0).gameObject

	_IslandCore:GetPoolMgr():ReturnCharacterModel(arg_30_0.modelData.model, arg_30_0.modelData.animator, var_30_3, true)

	arg_30_0.modelData = {
		model = var_30_0.model,
		animator = var_30_0.animator,
		personal_ani = var_30_0.personal_ani
	}

	_IslandCore:GetPoolMgr():GetCharacterModel(arg_30_0.modelData.model, arg_30_0.modelData.animator, function(arg_31_0)
		arg_30_0.hasTF = true

		local var_31_0 = arg_30_0.isScene and Layer.Default or Layer.Character3D

		pg.ViewUtils.SetLayer(arg_31_0.transform, var_31_0)
		setParent(arg_31_0.transform, arg_30_0.roleTF, false)
		arg_30_0:InitDressTF()

		if arg_30_5 then
			local var_31_1 = arg_30_0.modelData.personal_ani

			if var_31_1 and var_31_1 ~= "" then
				local var_31_2 = GetOrAddComponent(arg_30_0.roleTF.transform:GetChild(0), typeof(Animator))

				for iter_31_0 = 1, var_31_2.layerCount do
					var_31_2:CrossFadeInFixedTime(var_31_1, 0, iter_31_0 - 1)
				end
			end
		end

		existCall(arg_30_4, arg_30_0.roleTF)
	end, true)
end

function var_0_0.Destroy(arg_32_0)
	arg_32_0:RemoveDressTF()

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.loadingIdList or {}) do
		IslandAssetLoadDispatcher.Instance:Cancel(iter_32_1)
	end

	arg_32_0.loadingIdList = nil
end

function var_0_0.ResetDressUp(arg_33_0)
	local var_33_0 = getProxy(IslandProxy):GetIsland()

	if arg_33_0.shipId == 0 then
		local var_33_1 = {
			var_0_0.DressType.BackDecorate,
			var_0_0.DressType.Flotage,
			var_0_0.DressType.Footprint
		}
		local var_33_2 = var_33_0:GetDressUpAgency()

		for iter_33_0, iter_33_1 in ipairs(var_33_1) do
			local var_33_3 = var_33_2:GetDressByType(iter_33_1) or 0
			local var_33_4 = 0

			arg_33_0:ChangeDressByType(iter_33_1, {
				id = var_33_3,
				colorId = var_33_4
			})
		end
	else
		local var_33_5 = var_33_0:GetCharacterAgency()
		local var_33_6 = {
			var_0_0.DressType.BackDecorate,
			var_0_0.DressType.Flotage,
			var_0_0.DressType.Footprint
		}

		for iter_33_2, iter_33_3 in ipairs(var_33_6) do
			local var_33_7 = var_33_5:GetCurDressIdByShipId(arg_33_0.shipId, iter_33_3) or {}

			arg_33_0:ChangeDressByType(iter_33_3, {
				colorId = 0,
				id = var_33_7.dress_id or 0
			})
		end
	end
end

return var_0_0
