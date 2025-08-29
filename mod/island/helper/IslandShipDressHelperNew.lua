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

function var_0_0.SetShipId(arg_3_0, arg_3_1)
	arg_3_0.shipId = arg_3_1
	arg_3_0.hasTF = false
	arg_3_0.currentDressDataDic = {}
	arg_3_0.dataAfterRoleInit = {}

	arg_3_0:RemoveDressTF()
	arg_3_0:InitDressData()
end

function var_0_0.InitDressData(arg_4_0)
	local var_4_0 = {
		var_0_0.DressType.BackDecorate,
		var_0_0.DressType.Flotage,
		var_0_0.DressType.Footprint
	}
	local var_4_1 = getProxy(IslandProxy):GetIsland()

	if arg_4_0.shipId == 0 then
		local var_4_2 = var_4_1:GetDressUpAgency()

		for iter_4_0, iter_4_1 in pairs(var_4_0) do
			local var_4_3 = var_4_2:GetDressByType(iter_4_1)

			if var_4_3 then
				local var_4_4 = {
					id = var_4_3
				}

				var_4_4.colorId = 0
				arg_4_0.dataAfterRoleInit[iter_4_1] = var_4_4
			end
		end
	else
		local var_4_5 = var_4_1:GetCharacterAgency():GetShipById(arg_4_0.shipId)

		for iter_4_2, iter_4_3 in pairs(var_4_0) do
			local var_4_6 = var_4_5:GetDressByType(iter_4_3)

			if var_4_6 then
				local var_4_7 = {
					id = var_4_6
				}

				var_4_7.colorId = 0
				arg_4_0.dataAfterRoleInit[iter_4_3] = var_4_7
			end
		end
	end
end

function var_0_0.InitDressTF(arg_5_0)
	for iter_5_0, iter_5_1 in pairs(arg_5_0.dataAfterRoleInit) do
		arg_5_0:ChangeDressByType(iter_5_0, iter_5_1)
	end

	arg_5_0.dataAfterRoleInit = {}
end

function var_0_0.OnRoleLoaded(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.modelData = arg_6_2
	arg_6_0.roleTF = arg_6_1
	arg_6_0.hasTF = true

	arg_6_0:InitDressTF()
end

function var_0_0.RemoveDressTF(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.pageDressTFDic or {}) do
		Object.Destroy(iter_7_1.gameObject)
	end

	arg_7_0.pageDressTFDic = {}
end

function var_0_0.ChangeCommanderPartColor(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_2 == 0 then
		GraphicsInterface.Instance:ResetCharacterComponentMaterialData(arg_8_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Hair)
	else
		local var_8_0 = pg.island_dress_colordiff_template[arg_8_2].model

		GraphicsInterface.Instance:SetCharacterComponentMaterialData(arg_8_0.roleTF:GetChild(0).gameObject, var_8_0)
	end
end

function var_0_0.ChangeCommanderPart(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_2.id
	local var_9_1 = arg_9_2.colorId

	local function var_9_2()
		if arg_9_1 == var_0_0.DressType.Hat then
			arg_9_0:ChangeCommanderPartShow(arg_9_1, true)
		end
	end

	if var_9_0 ~= 0 then
		local var_9_3 = pg.island_dress_template[var_9_0].model

		if var_9_1 == 0 or var_9_1 == nil then
			GraphicsInterface.Instance:LoadCharacterComponent(arg_9_0.roleTF:GetChild(0).gameObject, var_9_3, var_9_2)
		else
			local var_9_4 = pg.island_dress_colordiff_template[var_9_1].model

			GraphicsInterface.Instance:LoadCharacterComponentAndMaterial(arg_9_0.roleTF:GetChild(0).gameObject, var_9_3, var_9_4, var_9_2)
		end
	end

	if arg_9_1 == var_0_0.DressType.Hat and var_9_0 == 0 then
		arg_9_0:ChangeCommanderPartShow(arg_9_1, false)
	end
end

function var_0_0.ChangeDressObject(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_2.id
	local var_11_1 = arg_11_0.currentDressDataDic[arg_11_1] and arg_11_0.currentDressDataDic[arg_11_1].id or 0

	if var_11_1 then
		if var_11_1 == var_11_0 then
			return
		end

		if var_11_1 ~= 0 then
			local var_11_2 = arg_11_0.pageDressTFDic[var_11_1]

			if var_11_2 then
				Object.Destroy(var_11_2)

				arg_11_0.pageDressTFDic[var_11_1] = nil
			end

			arg_11_0.currentDressDataDic[arg_11_1] = nil
		end
	end

	if var_11_0 == 0 then
		return
	end

	arg_11_0.currentDressDataDic[arg_11_1] = arg_11_2

	local var_11_3 = pg.island_dress_template[var_11_0]
	local var_11_4 = var_11_3.model
	local var_11_5 = arg_11_0.shipId

	ResourceMgr.Inst:getAssetAsync(var_11_4, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_12_0)
		if var_11_5 ~= arg_11_0.shipId then
			return
		end

		if arg_11_0.currentDressDataDic[arg_11_1].id ~= var_11_0 then
			return
		end

		local var_12_0 = Object.Instantiate(arg_12_0)

		pg.ViewUtils.SetLayer(var_12_0.transform, Layer.Character3D)
		switch(arg_11_1, {
			[var_0_0.DressType.BackDecorate] = function()
				local var_13_0 = arg_11_0.roleTF.transform

				if var_11_3.attachmentPoint ~= "" then
					local var_13_1 = var_11_3.attachmentPoint

					local function var_13_2(arg_14_0)
						for iter_14_0 = 0, arg_14_0.childCount - 1 do
							local var_14_0 = arg_14_0:GetChild(iter_14_0)

							if var_14_0.name == var_13_1 then
								return var_14_0
							end

							local var_14_1 = var_13_2(var_14_0, var_13_1)

							if var_14_1 then
								return var_14_1
							end
						end

						return nil
					end

					var_13_0 = var_13_2(var_13_0)
				end

				if var_11_3.offset ~= "" then
					local var_13_3 = Vector3(var_11_3.offset[1], var_11_3.offset[2], var_11_3.offset[3])

					var_12_0.transform.localPosition = var_13_3
				end

				if var_11_3.rotation ~= "" then
					local var_13_4 = Quaternion.Euler(var_11_3.rotation[1], var_11_3.rotation[2], var_11_3.rotation[3])

					var_12_0.transform.rotation = var_13_4
				end

				if var_11_3.scale ~= "" then
					local var_13_5 = Vector3(var_11_3.scale[1], var_11_3.scale[1], var_11_3.scale[1])

					var_12_0.transform.localScale = var_13_5
				end

				setParent(var_12_0, var_13_0)
			end,
			[var_0_0.DressType.Flotage] = function()
				local var_15_0

				if var_11_3.offset ~= "" then
					var_15_0 = Vector3(var_11_3.offset[1], var_11_3.offset[2], var_11_3.offset[3])

					local var_15_1 = var_12_0.name
					local var_15_2 = GameObject.New(var_15_1)

					setParent(var_12_0.transform, var_15_2.transform, false)

					var_12_0 = var_15_2
					var_12_0.transform.position = arg_11_0.roleTF.position + var_15_0
				end

				local var_15_3 = GetOrAddComponent(var_12_0, typeof(DressFlow))

				var_15_3.target = arg_11_0.roleTF
				var_15_3.offset = var_15_0
				var_15_3.delayTime = 0.01
			end,
			[var_0_0.DressType.Footprint] = function()
				local var_16_0 = Vector3(0, 0, 0)

				if var_11_3.offset ~= "" then
					var_16_0 = Vector3(var_11_3.offset[1], var_11_3.offset[2], var_11_3.offset[3])
				end

				setParent(var_12_0, arg_11_0.roleTF)

				var_12_0.transform.localPosition = var_16_0
			end
		})

		arg_11_0.pageDressTFDic[var_11_0] = var_12_0
	end), true, true)
end

function var_0_0.ChangeDressByType(arg_17_0, arg_17_1, arg_17_2)
	if not arg_17_0.hasTF then
		arg_17_0.dataAfterRoleInit[arg_17_1] = arg_17_2

		return
	end

	if table.contains(var_0_0.CommanderCustom, arg_17_1) then
		arg_17_0:ChangeCommanderPart(arg_17_1, arg_17_2)
	else
		arg_17_0:ChangeDressObject(arg_17_1, arg_17_2)
	end
end

function var_0_0.ChangeCommanderPartShow(arg_18_0, arg_18_1, arg_18_2)
	if not arg_18_0.hasTF then
		return
	end

	GraphicsInterface.Instance:SetCharacterComponentShow(arg_18_0.roleTF:GetChild(0).gameObject, var_0_0.ComponentType.Headware, arg_18_2)
end

function var_0_0.ChangeModelTransfromByUnitId(arg_19_0, arg_19_1)
	local var_19_0 = pg.island_unit_character[arg_19_1]

	arg_19_0.hasTF = false

	arg_19_0:RemoveDressTF()

	arg_19_0.dataAfterRoleInit = arg_19_0.currentDressDataDic
	arg_19_0.currentDressDataDic = {}

	local var_19_1 = arg_19_0.roleTF:GetChild(0).gameObject

	_IslandCore:GetPoolMgr():ReturnCharacterModel(arg_19_0.modelData.model, arg_19_0.modelData.animator, var_19_1, true)

	arg_19_0.modelData = {
		model = var_19_0.model,
		animator = var_19_0.animator
	}

	_IslandCore:GetPoolMgr():GetCharacterModel(arg_19_0.modelData.model, arg_19_0.modelData.animator, function(arg_20_0)
		arg_19_0.hasTF = true

		pg.ViewUtils.SetLayer(arg_20_0.transform, Layer.Character3D)
		setParent(arg_20_0.transform, arg_19_0.roleTF, false)
		arg_19_0:InitDressTF()
	end, true)
end

function var_0_0.Destroy(arg_21_0)
	arg_21_0:RemoveDressTF()
end

return var_0_0
