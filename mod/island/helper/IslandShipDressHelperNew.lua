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

function var_0_0.Ctor(arg_1_0, arg_1_1)
	if arg_1_1 then
		arg_1_0.curIsland = arg_1_1
		arg_1_0.isOtherIsland = getProxy(PlayerProxy):getRawData().id ~= arg_1_0.curIsland.id
	end
end

function var_0_0.GetInitDressByType(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = pg.island_set.default_dress.key_value_varchar

		for iter_3_0, iter_3_1 in ipairs(var_3_0) do
			if pg.island_dress_template[iter_3_1].type == arg_3_0 then
				return iter_3_1
			end
		end

		return 0
	end

	if arg_2_0 == var_0_0.DressType.Hat then
		local var_2_1 = var_2_0(var_0_0.DressType.Body)

		return pg.island_dress_template.get_id_list_by_related_dress[var_2_1][1]
	end

	return var_2_0(arg_2_0)
end

function var_0_0.PreLoadVisterDressupItem(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	arg_4_0.roleTF = arg_4_1.transform
	arg_4_0.isScene = true
	arg_4_0.shipId = 0
	arg_4_0.playerId = arg_4_2
	arg_4_0.hasTF = true
	arg_4_0.currentDressDataDic = {}
	arg_4_0.pageDressTFDic = {}

	local var_4_0 = {
		var_0_0.DressType.BackDecorate,
		var_0_0.DressType.Flotage,
		var_0_0.DressType.Footprint
	}
	local var_4_1 = arg_4_3 and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()
	local var_4_2 = var_4_1:GetVisitorAgency():GetPlayer(arg_4_0.playerId)
	local var_4_3 = 0

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_4 = var_4_2:GetDressByType(iter_4_1)

		if var_4_4 and var_4_4 ~= 0 then
			local var_4_5 = {
				id = var_4_4
			}

			var_4_5.colorId = 0
			arg_4_0.currentDressDataDic[iter_4_1] = var_4_5
			var_4_3 = var_4_3 + 1
		end
	end

	arg_4_0:InitVisterCustomDressData(arg_4_2, var_4_1)

	if var_4_3 == 0 then
		arg_4_4()

		return
	end

	local var_4_6 = 0

	for iter_4_2, iter_4_3 in pairs(arg_4_0.currentDressDataDic) do
		arg_4_0:LoadDressObjectItem(iter_4_2, iter_4_3.id, function()
			var_4_6 = var_4_6 + 1

			if var_4_6 == var_4_3 then
				arg_4_4()
			end
		end)
	end
end

function var_0_0.InitVisterCustomDressData(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.commanderDressDic = {}

	local var_6_0 = arg_6_2:GetVisitorAgency():GetPlayer(arg_6_0.playerId)

	for iter_6_0, iter_6_1 in pairs(var_0_0.CommanderCustom) do
		local var_6_1 = var_6_0:GetDressByType(iter_6_1)

		if var_6_1 then
			arg_6_0.commanderDressDic[iter_6_1] = var_6_1
		end
	end
end

function var_0_0.PreLoadShipDressupItem(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0.roleTF = arg_7_1.transform
	arg_7_0.isScene = true
	arg_7_0.shipId = arg_7_2
	arg_7_0.hasTF = true
	arg_7_0.currentDressDataDic = {}
	arg_7_0.pageDressTFDic = {}

	local var_7_0 = {
		var_0_0.DressType.BackDecorate,
		var_0_0.DressType.Flotage,
		var_0_0.DressType.Footprint
	}
	local var_7_1 = getProxy(IslandProxy):GetIsland()

	if arg_7_0.shipId == 0 then
		local var_7_2 = var_7_1:GetDressUpAgency()
		local var_7_3 = 0

		for iter_7_0, iter_7_1 in ipairs(var_7_0) do
			local var_7_4 = var_7_2:GetDressByType(iter_7_1)

			if var_7_4 and var_7_4 ~= 0 then
				local var_7_5 = {
					id = var_7_4
				}

				var_7_5.colorId = 0
				arg_7_0.currentDressDataDic[iter_7_1] = var_7_5
				var_7_3 = var_7_3 + 1
			end
		end

		arg_7_0:InitCommanderCustomDressData()

		if var_7_3 == 0 then
			arg_7_3()

			return
		end

		local var_7_6 = 0

		for iter_7_2, iter_7_3 in pairs(arg_7_0.currentDressDataDic) do
			arg_7_0:LoadDressObjectItem(iter_7_2, iter_7_3.id, function()
				var_7_6 = var_7_6 + 1

				if var_7_6 == var_7_3 then
					arg_7_3()
				end
			end)
		end
	else
		if arg_7_0.isOtherIsland then
			arg_7_3()

			return
		end

		local var_7_7 = var_7_1:GetCharacterAgency()

		arg_7_0.modelData = var_7_7:GetShipById(arg_7_0.shipId):GetModel()

		local var_7_8 = 0

		for iter_7_4, iter_7_5 in pairs(var_7_0) do
			local var_7_9 = var_7_7:GetCurDressIdByShipId(arg_7_0.shipId, iter_7_5)

			if var_7_9 then
				local var_7_10 = {
					id = var_7_9.dress_id
				}

				var_7_10.colorId = 0
				arg_7_0.currentDressDataDic[iter_7_5] = var_7_10
				var_7_8 = var_7_8 + 1
			end
		end

		if var_7_8 == 0 then
			arg_7_3()

			return
		end

		local var_7_11 = 0

		for iter_7_6, iter_7_7 in pairs(arg_7_0.currentDressDataDic) do
			arg_7_0:LoadDressObjectItem(iter_7_6, iter_7_7.id, function()
				var_7_11 = var_7_11 + 1

				if var_7_11 == var_7_8 then
					arg_7_3()
				end
			end)
		end
	end
end

function var_0_0.SetShipId(arg_10_0, arg_10_1)
	arg_10_0.shipId = arg_10_1
	arg_10_0.hasTF = false
	arg_10_0.currentDressDataDic = {}
	arg_10_0.dataAfterRoleInit = {}

	arg_10_0:RemoveDressTF()
	arg_10_0:InitDressData()
end

function var_0_0.InitCommanderCustomDressData(arg_11_0)
	arg_11_0.commanderDressDic = {}

	local var_11_0 = getProxy(IslandProxy):GetIsland():GetDressUpAgency()

	for iter_11_0, iter_11_1 in pairs(var_0_0.CommanderCustom) do
		local var_11_1 = var_11_0:GetDressByType(iter_11_1)

		if var_11_1 then
			arg_11_0.commanderDressDic[iter_11_1] = var_11_1
		end
	end
end

function var_0_0.InitDressData(arg_12_0)
	local var_12_0 = {
		var_0_0.DressType.BackDecorate,
		var_0_0.DressType.Flotage,
		var_0_0.DressType.Footprint
	}
	local var_12_1 = getProxy(IslandProxy):GetIsland()

	if arg_12_0.shipId == 0 then
		local var_12_2 = var_12_1:GetDressUpAgency()

		for iter_12_0, iter_12_1 in pairs(var_12_0) do
			local var_12_3 = var_12_2:GetDressByType(iter_12_1)

			if var_12_3 then
				local var_12_4 = {
					id = var_12_3
				}

				var_12_4.colorId = 0
				arg_12_0.dataAfterRoleInit[iter_12_1] = var_12_4
			end
		end

		arg_12_0:InitCommanderCustomDressData()
	else
		local var_12_5 = var_12_1:GetCharacterAgency()

		for iter_12_2, iter_12_3 in pairs(var_12_0) do
			local var_12_6 = var_12_5:GetCurDressIdByShipId(arg_12_0.shipId, iter_12_3)

			if var_12_6 then
				local var_12_7 = {
					id = var_12_6.dress_id
				}

				var_12_7.colorId = 0
				arg_12_0.dataAfterRoleInit[iter_12_3] = var_12_7
			end
		end
	end
end

function var_0_0.InitDressTF(arg_13_0, arg_13_1)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.dataAfterRoleInit) do
		arg_13_0:ChangeDressByType(iter_13_0, iter_13_1, arg_13_1)
	end

	arg_13_0.dataAfterRoleInit = {}
end

function var_0_0.OnRoleLoaded(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_0.modelData = arg_14_2
	arg_14_0.roleTF = arg_14_1
	arg_14_0.hasTF = true

	arg_14_0:InitDressTF(arg_14_3)
end

function var_0_0.RemoveDressTF(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.pageDressTFDic or {}) do
		Object.Destroy(iter_15_1.gameObject)
	end

	arg_15_0.pageDressTFDic = {}
end

function var_0_0.ChangeCommanderPartColor(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_2 == 0 then
		GraphicsInterface.Instance:ResetCharacterComponentMaterialData(arg_16_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair)
	else
		local var_16_0 = pg.island_dress_colordiff_template[arg_16_2].model

		GraphicsInterface.Instance:SetCharacterComponentMaterialData(arg_16_0.roleTF:GetChild(0).gameObject, var_16_0)
	end
end

function var_0_0.ChangeCommanderPart(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_2.id
	local var_17_1 = arg_17_2.colorId

	arg_17_0.commanderDressDic[arg_17_1] = arg_17_2.id

	local function var_17_2()
		local var_18_0 = arg_17_0.commanderDressDic[var_0_0.DressType.Hat] or 0

		if var_18_0 == 0 then
			GraphicsInterface.Instance:SetCharacterBlendShape(arg_17_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair, 0, 0)
			GraphicsInterface.Instance:SetCharacterBlendShape(arg_17_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair, 1, 0)
		else
			local var_18_1 = pg.island_dress_template[var_18_0].sub_type - 1

			GraphicsInterface.Instance:SetCharacterBlendShape(arg_17_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair, var_18_1, 100)
			GraphicsInterface.Instance:SetCharacterBlendShape(arg_17_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair, 1 - var_18_1, 0)
		end
	end

	local function var_17_3()
		if arg_17_1 == var_0_0.DressType.Hat then
			arg_17_0:ChangeCommanderPartShow(arg_17_1, true)
			var_17_2()
		elseif arg_17_1 == var_0_0.DressType.Hair then
			var_17_2()
		elseif arg_17_1 == var_0_0.DressType.Face then
			local var_19_0 = pg.island_dress_template[var_17_0]
			local var_19_1 = var_19_0.face_clip == "" and "idle" or var_19_0.face_clip

			arg_17_0.roleTF:GetChild(0).gameObject:GetComponent(typeof(Animator)):Play(var_19_1, 4)
		end
	end

	if var_17_0 ~= 0 then
		local var_17_4 = pg.island_dress_template[var_17_0].model

		if var_17_1 == 0 or var_17_1 == nil then
			GraphicsInterface.Instance:LoadCharacterComponent(arg_17_0.roleTF:GetChild(0).gameObject, var_17_4, var_17_3)
		else
			local var_17_5 = pg.island_dress_colordiff_template[var_17_1].model

			GraphicsInterface.Instance:LoadCharacterComponentAndMaterial(arg_17_0.roleTF:GetChild(0).gameObject, var_17_4, var_17_5, var_17_3)
		end
	end

	if arg_17_1 == var_0_0.DressType.Hat and var_17_0 == 0 then
		arg_17_0:ChangeCommanderPartShow(arg_17_1, false)
		var_17_2()
	end
end

function var_0_0.LoadDressObjectItem(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = pg.island_dress_template[arg_20_2]
	local var_20_1 = var_20_0.model
	local var_20_2 = arg_20_0.shipId
	local var_20_3 = IslandAssetLoadDispatcher.Instance:Enqueue(var_20_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_21_0)
		if IsNil(arg_20_0.roleTF) then
			return
		end

		if arg_20_0.hasTF == false then
			return
		end

		if var_20_2 ~= arg_20_0.shipId then
			return
		end

		if arg_20_0.currentDressDataDic[arg_20_1].id ~= arg_20_2 then
			return
		end

		local var_21_0 = Object.Instantiate(arg_21_0)
		local var_21_1 = arg_20_0.isScene and Layer.Default or Layer.Character3D

		pg.ViewUtils.SetLayer(var_21_0.transform, var_21_1)
		switch(arg_20_1, {
			[var_0_0.DressType.BackDecorate] = function()
				local var_22_0 = arg_20_0.roleTF.transform

				if var_20_0.attachmentPoint ~= "" then
					local var_22_1 = var_20_0.attachmentPoint

					local function var_22_2(arg_23_0)
						for iter_23_0 = 0, arg_23_0.childCount - 1 do
							local var_23_0 = arg_23_0:GetChild(iter_23_0)

							if var_23_0.name == var_22_1 then
								return var_23_0
							end

							local var_23_1 = var_22_2(var_23_0, var_22_1)

							if var_23_1 then
								return var_23_1
							end
						end

						return nil
					end

					var_22_0 = var_22_2(var_22_0)
				end

				if var_20_0.offset ~= "" then
					local var_22_3 = Vector3(var_20_0.offset[1], var_20_0.offset[2], var_20_0.offset[3])

					var_21_0.transform.localPosition = var_22_3
				end

				if var_20_0.rotation ~= "" then
					local var_22_4 = Quaternion.Euler(var_20_0.rotation[1], var_20_0.rotation[2], var_20_0.rotation[3])

					var_21_0.transform.rotation = var_22_4
				end

				if var_20_0.scale ~= "" then
					local var_22_5 = Vector3(var_20_0.scale[1], var_20_0.scale[1], var_20_0.scale[1])

					var_21_0.transform.localScale = var_22_5
				end

				setParent(var_21_0, var_22_0)
			end,
			[var_0_0.DressType.Flotage] = function()
				local var_24_0

				if var_20_0.offset ~= "" then
					var_24_0 = Vector3(var_20_0.offset[1], var_20_0.offset[2], var_20_0.offset[3])

					local var_24_1 = var_21_0.name
					local var_24_2 = GameObject.New(var_24_1)

					setParent(var_21_0.transform, var_24_2.transform, false)

					var_21_0 = var_24_2
					var_21_0.transform.position = arg_20_0.roleTF:GetChild(0).transform:TransformPoint(var_24_0)
				end

				if var_20_0.scale ~= "" then
					local var_24_3 = Vector3(var_20_0.scale[1], var_20_0.scale[1], var_20_0.scale[1])

					var_21_0.transform.localScale = var_24_3
				end

				local var_24_4 = Vector3(0, 0, 0)

				if var_20_0.rotation ~= "" then
					var_24_4 = Vector3(var_20_0.rotation[1], var_20_0.rotation[2], var_20_0.rotation[3])
				end

				var_21_0.transform.rotation = var_24_4

				local var_24_5 = GetOrAddComponent(var_21_0, typeof(DressFlow))
				local var_24_6 = pg.island_set.island_dress_follow_param.key_value_varchar

				var_24_5.target = arg_20_0.roleTF
				var_24_5.offset = var_24_0
				var_24_5.delayTime = var_24_6[1]
				var_24_5.lerpSpeed = var_24_6[2]
				var_24_5.recordInterval = var_24_6[3]
				var_24_5.rotationOffest = var_24_4
			end,
			[var_0_0.DressType.Footprint] = function()
				local var_25_0 = Vector3(0, 0, 0)

				if var_20_0.offset ~= "" then
					var_25_0 = Vector3(var_20_0.offset[1], var_20_0.offset[2], var_20_0.offset[3])
				end

				setParent(var_21_0, arg_20_0.roleTF)

				var_21_0.transform.localPosition = var_25_0
			end
		})

		arg_20_0.pageDressTFDic[arg_20_2] = var_21_0

		existCall(arg_20_3, var_21_0)
	end), true, true)

	table.insert(arg_20_0.loadingIdList or {}, var_20_3)
end

function var_0_0.ChangeDressObject(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = arg_26_2.id
	local var_26_1 = arg_26_0.currentDressDataDic[arg_26_1] and arg_26_0.currentDressDataDic[arg_26_1].id or 0

	if var_26_1 then
		if var_26_1 == var_26_0 then
			return
		end

		if var_26_1 ~= 0 then
			local var_26_2 = arg_26_0.pageDressTFDic[var_26_1]

			if var_26_2 then
				Object.Destroy(var_26_2)

				arg_26_0.pageDressTFDic[var_26_1] = nil
			end

			arg_26_0.currentDressDataDic[arg_26_1] = nil
		end
	end

	if var_26_0 == 0 then
		return
	end

	arg_26_0.currentDressDataDic[arg_26_1] = arg_26_2

	arg_26_0:LoadDressObjectItem(arg_26_1, var_26_0, arg_26_3)
end

function var_0_0.ChangeDressByType(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	if not arg_27_0.hasTF then
		arg_27_0.dataAfterRoleInit[arg_27_1] = arg_27_2

		return
	end

	if table.contains(var_0_0.CommanderCustom, arg_27_1) then
		arg_27_0:ChangeCommanderPart(arg_27_1, arg_27_2)
	else
		arg_27_0:ChangeDressObject(arg_27_1, arg_27_2, arg_27_3)
	end
end

function var_0_0.ChangeCommanderPartShow(arg_28_0, arg_28_1, arg_28_2)
	if not arg_28_0.hasTF then
		return
	end

	GraphicsInterface.Instance:SetCharacterComponentShow(arg_28_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Headware, arg_28_2)
end

function var_0_0.ChangeModelTransfromByUnitId(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = pg.island_unit_character[arg_29_1]

	arg_29_0.hasTF = false

	arg_29_0:RemoveDressTF()

	arg_29_0.dataAfterRoleInit = arg_29_0.currentDressDataDic
	arg_29_0.currentDressDataDic = {}

	local var_29_1 = arg_29_0.roleTF:GetChild(0).gameObject

	_IslandCore:GetPoolMgr():ReturnCharacterModel(arg_29_0.modelData.model, arg_29_0.modelData.animator, var_29_1, true)

	arg_29_0.modelData = {
		model = var_29_0.model,
		animator = var_29_0.animator,
		personal_ani = var_29_0.personal_ani
	}

	_IslandCore:GetPoolMgr():GetCharacterModel(arg_29_0.modelData.model, arg_29_0.modelData.animator, function(arg_30_0)
		arg_29_0.hasTF = true

		local var_30_0 = arg_29_0.isScene and Layer.Default or Layer.Character3D

		pg.ViewUtils.SetLayer(arg_30_0.transform, var_30_0)
		setParent(arg_30_0.transform, arg_29_0.roleTF, false)
		arg_29_0:InitDressTF()

		if arg_29_3 then
			local var_30_1 = arg_29_0.modelData.personal_ani

			if var_30_1 and var_30_1 ~= "" then
				local var_30_2 = GetOrAddComponent(arg_29_0.roleTF.transform:GetChild(0), typeof(Animator))

				for iter_30_0 = 1, var_30_2.layerCount do
					var_30_2:CrossFadeInFixedTime(var_30_1, 0, iter_30_0 - 1)
				end
			end
		end

		existCall(arg_29_2, arg_29_0.roleTF)
	end, true)
end

function var_0_0.ChangeModelTransfromByUnitIdAndChangeDress(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4, arg_31_5)
	local var_31_0 = pg.island_unit_character[arg_31_1]

	arg_31_0.hasTF = false

	arg_31_0:RemoveDressTF()

	arg_31_0.dataAfterRoleInit = arg_31_0.currentDressDataDic

	for iter_31_0, iter_31_1 in ipairs(arg_31_2 or {}) do
		local var_31_1 = pg.island_dress_template[iter_31_1].type

		if arg_31_0.dataAfterRoleInit[var_31_1].id == iter_31_1 then
			arg_31_0.dataAfterRoleInit[var_31_1] = nil
		end
	end

	for iter_31_2, iter_31_3 in ipairs(arg_31_3 or {}) do
		local var_31_2 = pg.island_dress_template[iter_31_3].type

		arg_31_0.dataAfterRoleInit[var_31_2] = {
			colorId = 0,
			id = iter_31_3
		}
	end

	arg_31_0.currentDressDataDic = {}

	local var_31_3 = arg_31_0.roleTF:GetChild(0).gameObject

	_IslandCore:GetPoolMgr():ReturnCharacterModel(arg_31_0.modelData.model, arg_31_0.modelData.animator, var_31_3, true)

	arg_31_0.modelData = {
		model = var_31_0.model,
		animator = var_31_0.animator,
		personal_ani = var_31_0.personal_ani
	}

	_IslandCore:GetPoolMgr():GetCharacterModel(arg_31_0.modelData.model, arg_31_0.modelData.animator, function(arg_32_0)
		arg_31_0.hasTF = true

		local var_32_0 = arg_31_0.isScene and Layer.Default or Layer.Character3D

		pg.ViewUtils.SetLayer(arg_32_0.transform, var_32_0)
		setParent(arg_32_0.transform, arg_31_0.roleTF, false)
		arg_31_0:InitDressTF()

		if arg_31_5 then
			local var_32_1 = arg_31_0.modelData.personal_ani

			if var_32_1 and var_32_1 ~= "" then
				local var_32_2 = GetOrAddComponent(arg_31_0.roleTF.transform:GetChild(0), typeof(Animator))

				for iter_32_0 = 1, var_32_2.layerCount do
					var_32_2:CrossFadeInFixedTime(var_32_1, 0, iter_32_0 - 1)
				end
			end
		end

		existCall(arg_31_4, arg_31_0.roleTF)
	end, true)
end

function var_0_0.Destroy(arg_33_0)
	arg_33_0.curIsland = nil

	arg_33_0:RemoveDressTF()

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.loadingIdList or {}) do
		IslandAssetLoadDispatcher.Instance:Cancel(iter_33_1)
	end

	arg_33_0.loadingIdList = nil
end

function var_0_0.ResetDressUp(arg_34_0)
	local var_34_0 = getProxy(IslandProxy):GetIsland()

	if arg_34_0.shipId == 0 then
		local var_34_1 = {
			var_0_0.DressType.BackDecorate,
			var_0_0.DressType.Flotage,
			var_0_0.DressType.Footprint
		}
		local var_34_2 = var_34_0:GetDressUpAgency()

		for iter_34_0, iter_34_1 in ipairs(var_34_1) do
			local var_34_3 = var_34_2:GetDressByType(iter_34_1) or 0
			local var_34_4 = 0

			arg_34_0:ChangeDressByType(iter_34_1, {
				id = var_34_3,
				colorId = var_34_4
			})
		end
	else
		local var_34_5 = var_34_0:GetCharacterAgency()
		local var_34_6 = {
			var_0_0.DressType.BackDecorate,
			var_0_0.DressType.Flotage,
			var_0_0.DressType.Footprint
		}

		for iter_34_2, iter_34_3 in ipairs(var_34_6) do
			local var_34_7 = var_34_5:GetCurDressIdByShipId(arg_34_0.shipId, iter_34_3) or {}

			arg_34_0:ChangeDressByType(iter_34_3, {
				colorId = 0,
				id = var_34_7.dress_id or 0
			})
		end
	end
end

return var_0_0
