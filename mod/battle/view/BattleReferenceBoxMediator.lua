ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleEvent
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = class("BattleReferenceBoxMediator", var_0_0.MVC.Mediator)

var_0_0.Battle.BattleReferenceBoxMediator = var_0_4
var_0_4.__name = "BattleReferenceBoxMediator"

function var_0_4.Ctor(arg_1_0)
	var_0_4.super.Ctor(arg_1_0)
end

function var_0_4.Initialize(arg_2_0)
	var_0_4.super.Initialize(arg_2_0)

	arg_2_0._dataProxy = arg_2_0._state:GetProxyByName(var_0_0.Battle.BattleDataProxy.__name)
	arg_2_0._sceneMediator = arg_2_0._state:GetSceneMediator()
	arg_2_0._boxContainer = GameObject("BoxContainer")
	arg_2_0._detailContainer = arg_2_0._state:GetUI()._tf:Find("CharacterDetailContainer").gameObject
	arg_2_0._unitBoxList = {}
	arg_2_0._bulletBoxList = {}
	arg_2_0._wallBoxList = {}
	arg_2_0._detailViewList = {}
	arg_2_0._unitBoxActive = false
	arg_2_0._bulletBoxActive = false
	arg_2_0._detailViewActive = false

	arg_2_0:initUnitEvent()
end

function var_0_4.ActiveUnitBoxes(arg_3_0, arg_3_1)
	if arg_3_1 and not arg_3_0._unitBoxActive then
		arg_3_0._unitBoxActive = true

		arg_3_0:createExistBoxes()
	elseif not arg_3_1 and arg_3_0._unitBoxActive then
		arg_3_0._unitBoxActive = false

		arg_3_0:removeAllBoxes()
	end
end

function var_0_4.ActiveBulletBoxes(arg_4_0, arg_4_1)
	if arg_4_1 and not arg_4_0._bulletBoxActive then
		arg_4_0:initBulletEvent()

		arg_4_0._bulletBoxActive = true
	elseif not arg_4_1 and arg_4_0._bulletBoxActive then
		arg_4_0:disInitBulletEvent()
		arg_4_0:removeAllBulletBoxes()

		arg_4_0._bulletBoxActive = false
	end
end

function var_0_4.ActiveUnitDetail(arg_5_0, arg_5_1)
	SetActive(arg_5_0._detailContainer, arg_5_1)

	if arg_5_1 and not arg_5_0._detailViewActive then
		for iter_5_0, iter_5_1 in ipairs(arg_5_0._dataProxy:GetFleetList()) do
			local var_5_0 = iter_5_1:GetUnitList()

			for iter_5_2, iter_5_3 in ipairs(var_5_0) do
				arg_5_0:createDetail(iter_5_3)
			end
		end

		for iter_5_4, iter_5_5 in pairs(arg_5_0._dataProxy:GetUnitList()) do
			if table.contains(var_0_0.Battle.BattleUnitDetailView.EnemyMarkList, iter_5_5:GetTemplate().id) then
				arg_5_0:createDetail(unit)
			end
		end

		arg_5_0._detailViewActive = true
	elseif not arg_5_1 and arg_5_0._detailViewActive then
		arg_5_0._detailViewActive = false

		arg_5_0:removeAllDetail()
	end
end

function var_0_4.Update(arg_6_0)
	for iter_6_0, iter_6_1 in pairs(arg_6_0._dataProxy:GetUnitList()) do
		local var_6_0 = arg_6_0._unitBoxList[iter_6_0]

		if var_6_0 then
			var_6_0.transform.localPosition = iter_6_1:GetPosition()
		end
	end

	if arg_6_0._bulletBoxActive then
		for iter_6_2, iter_6_3 in pairs(arg_6_0._dataProxy:GetBulletList()) do
			local var_6_1 = arg_6_0._bulletBoxList[iter_6_2] or arg_6_0:createBulletBox(iter_6_3)

			var_6_1.transform.localPosition = iter_6_3:GetPosition()
			var_6_1.transform.localEulerAngles = Vector3(0, -iter_6_3:GetYAngle(), 0)

			local var_6_2 = iter_6_3:GetBoxSize() * 2

			var_6_1.transform.localScale = Vector3(var_6_2.x, var_6_2.y, var_6_2.z)
		end

		for iter_6_4, iter_6_5 in pairs(arg_6_0._dataProxy:GetWallList()) do
			(arg_6_0._wallBoxList[iter_6_4] or arg_6_0:createWallBox(iter_6_5)).transform.localPosition = iter_6_5:GetPosition()
		end
	end

	if arg_6_0._detailViewActive then
		for iter_6_6, iter_6_7 in pairs(arg_6_0._detailViewList) do
			iter_6_7:Update()
		end
	end
end

function var_0_4.initUnitEvent(arg_7_0)
	arg_7_0._dataProxy:RegisterEventListener(arg_7_0, var_0_1.ADD_UNIT, arg_7_0.onAddUnit)
	arg_7_0._dataProxy:RegisterEventListener(arg_7_0, var_0_1.REMOVE_UNIT, arg_7_0.onRemoveUnit)
end

function var_0_4.disInitUnitEvent(arg_8_0)
	arg_8_0._dataProxy:UnregisterEventListener(arg_8_0, var_0_1.ADD_UNIT)
	arg_8_0._dataProxy:UnregisterEventListener(arg_8_0, var_0_1.REMOVE_UNIT)
end

function var_0_4.onAddUnit(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.Data.type
	local var_9_1 = arg_9_1.Data.unit

	if arg_9_0._unitBoxActive then
		local var_9_2 = arg_9_0:createBox(var_9_1)

		arg_9_0._unitBoxList[var_9_1:GetUniqueID()] = var_9_2
	end

	if arg_9_0._detailViewActive then
		if var_9_0 == var_0_2.UnitType.PLAYER_UNIT then
			arg_9_0:createDetail(var_9_1)
		elseif table.contains(var_0_0.Battle.BattleUnitDetailView.EnemyMarkList, var_9_1:GetTemplate().id) then
			arg_9_0:createDetail(var_9_1)
		end
	end
end

function var_0_4.createBox(arg_10_0, arg_10_1)
	local var_10_0
	local var_10_1
	local var_10_2
	local var_10_3 = arg_10_1:GetIFF() == 1 and "_friendly" or "_foe"
	local var_10_4 = arg_10_1:GetBoxSize()

	if var_10_4.range then
		var_10_0 = arg_10_0._sceneMediator:InstantiateCharacterComponent("Cylinder" .. var_10_3)
	else
		var_10_0 = arg_10_0._sceneMediator:InstantiateCharacterComponent("Cube" .. var_10_3)
		var_10_4 = var_10_4 * 2
	end

	var_10_0.transform:SetParent(arg_10_0._boxContainer.transform)

	var_10_0.layer = LayerMask.NameToLayer("Default")

	if var_10_4.range then
		var_10_0.transform.localScale = Vector3(var_10_4.range * 2, var_10_4.tickness * 2, var_10_4.range * 2)
	else
		var_10_0.transform.localScale = Vector3(var_10_4.x, var_10_4.y, var_10_4.z)
	end

	SetActive(var_10_0, true)

	return var_10_0
end

function var_0_4.createExistBoxes(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0._dataProxy:GetUnitList()) do
		arg_11_0._unitBoxList[iter_11_0] = arg_11_0:createBox(iter_11_1)
	end
end

function var_0_4.createDetail(arg_12_0, arg_12_1)
	local var_12_0 = var_0_0.Battle.BattleUnitDetailView.New()
	local var_12_1 = arg_12_1:GetIFF()
	local var_12_2 = arg_12_0._state:GetUI()._tf:Find("CharacterDetailContainer/" .. arg_12_1:GetIFF())
	local var_12_3 = arg_12_0._sceneMediator:InstantiateCharacterComponent("CharacterDetailContainer/detailPanel")

	var_12_3.transform:SetParent(var_12_2, true)
	var_12_0:ConfigSkin(var_12_3)
	var_12_0:SetUnit(arg_12_1)

	arg_12_0._detailViewList[arg_12_1:GetUniqueID()] = var_12_0

	return var_12_0
end

function var_0_4.onRemoveUnit(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.Data.type

	if arg_13_0._unitBoxActive then
		arg_13_0:removeBox(arg_13_1.Data.UID)
	end

	if arg_13_0._detailViewActive and (var_13_0 ~= var_0_2.UnitType.PLAYER_UNIT or var_13_0 ~= var_0_2.UnitType.ENEMY_UNIT or var_13_0 ~= var_0_2.UnitType.BOSS_UNIT) and arg_13_0._detailViewList[arg_13_1.Data.UID] then
		arg_13_0:removeDetail(arg_13_1.Data.UID)
	end
end

function var_0_4.removeBox(arg_14_0, arg_14_1)
	GameObject.Destroy(arg_14_0._unitBoxList[arg_14_1])

	arg_14_0._unitBoxList[arg_14_1] = nil
end

function var_0_4.removeDetail(arg_15_0, arg_15_1)
	arg_15_0._detailViewList[arg_15_1]:Dispose()

	arg_15_0._detailViewList[arg_15_1] = nil
end

function var_0_4.removeAllBoxes(arg_16_0)
	for iter_16_0, iter_16_1 in pairs(arg_16_0._dataProxy:GetUnitList()) do
		arg_16_0:removeBox(iter_16_0)
	end
end

function var_0_4.removeAllDetail(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0._detailViewList) do
		arg_17_0:removeDetail(iter_17_0)
	end
end

function var_0_4.initBulletEvent(arg_18_0)
	arg_18_0._dataProxy:RegisterEventListener(arg_18_0, var_0_1.REMOVE_BULLET, arg_18_0.onRemoveBullet)
end

function var_0_4.disInitBulletEvent(arg_19_0)
	arg_19_0._dataProxy:UnregisterEventListener(arg_19_0, var_0_1.REMOVE_BULLET)
end

function var_0_4.onRemoveBullet(arg_20_0, arg_20_1)
	arg_20_0:removeBulletBox(arg_20_1.Data.UID)
end

function var_0_4.removeBulletBox(arg_21_0, arg_21_1)
	GameObject.Destroy(arg_21_0._bulletBoxList[arg_21_1])

	arg_21_0._bulletBoxList[arg_21_1] = nil
end

function var_0_4.removeAllBulletBoxes(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0._bulletBoxList) do
		arg_22_0:removeBulletBox(iter_22_0)
	end
end

function var_0_4.createBulletBox(arg_23_0, arg_23_1)
	local var_23_0

	if arg_23_1:GetIFF() == 1 then
		var_23_0 = arg_23_0._sceneMediator:InstantiateCharacterComponent("Cube_friendly")
	else
		var_23_0 = arg_23_0._sceneMediator:InstantiateCharacterComponent("Cube_foe")
	end

	var_23_0.transform:SetParent(arg_23_0._boxContainer.transform)

	var_23_0.layer = LayerMask.NameToLayer("Default")

	local var_23_1 = arg_23_1:GetBoxSize() * 2

	var_23_0.transform.localScale = Vector3(var_23_1.x, var_23_1.y, var_23_1.z)

	SetActive(var_23_0, true)

	arg_23_0._bulletBoxList[arg_23_1:GetUniqueID()] = var_23_0

	return var_23_0
end

function var_0_4.createWallBox(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:createBox(arg_24_1)

	arg_24_0._wallBoxList[arg_24_1:GetUniqueID()] = var_24_0

	return var_24_0
end

function var_0_4.Dispose(arg_25_0)
	arg_25_0:disInitUnitEvent()

	for iter_25_0, iter_25_1 in pairs(arg_25_0._unitBoxList) do
		GameObject.Destroy(iter_25_1)
	end

	for iter_25_2, iter_25_3 in pairs(arg_25_0._bulletBoxList) do
		GameObject.Destroy(iter_25_3)
	end

	for iter_25_4, iter_25_5 in pairs(arg_25_0._wallBoxList) do
		GameObject.Destroy(iter_25_5)
	end

	arg_25_0._unitBoxList = nil
	arg_25_0._wallBoxList = nil
	arg_25_0._bulletBoxList = nil

	arg_25_0:removeAllDetail()

	arg_25_0._detailViewList = nil

	GameObject.Destroy(arg_25_0._boxContainer)
	var_0_4.super.Dispose(arg_25_0)
end
