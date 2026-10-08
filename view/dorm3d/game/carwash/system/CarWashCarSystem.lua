local var_0_0 = class("CarWashCarSystem", import("view.dorm3d.Game.CarWash.CarWashBaseSystem"))

var_0_0.UPDATE_PHASE2_TIP = "CarWashCarSystem.UPDATE_PHASE2_TIP"
var_0_0.PLAY_PHASE2_REACTION = "CarWashCarSystem.PLAY_PHASE2_REACTION"
var_0_0.MATERIAL_INDEX = 0
var_0_0.OPAQUE_INDEX = 1
var_0_0.TRANSPARENT_INDEX = 0
var_0_0.GENERATOR_NAME = "[DECALROOT]/[DECAL GENERATOR]"
var_0_0.CAR_PREFAB_PATH = "/[MainBlock]/[Model]/scene_root/no_bake/pre_db_cw_car"
var_0_0.GLASS_CONFIG = {
	{
		regionId = "zuoglass_01",
		vfx = "pre_db_cw_car01/all/con_1/L_men/L_Bl/vfx_nxmfdoorglass01_l",
		path = "pre_db_cw_car01/all/mod/fbx_db_cw_car01_doorglass01_l"
	},
	{
		regionId = "zuoglass_02",
		vfx = "pre_db_cw_car01/all/con_1/R_men/R_Bl/vfx_nxmfdoorglass01_r",
		path = "pre_db_cw_car01/all/mod/fbx_db_cw_car01_doorglass01_r"
	},
	{
		regionId = "glass_01",
		vfx = "pre_db_cw_car01/all/con_1/vfx_nxmfglass01",
		path = "pre_db_cw_car01/all/mod/fbx_db_cw_car01_glass01"
	}
}
var_0_0.PHASE_2_VFX = "pre_db_cw_car01/all/con_1/vfx_nxmfglass02"
var_0_0.PHASE_2_RENDER = "pre_db_cw_car01/all/mod/fbx_db_cw_car01_glass01"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.mainCamera = arg_1_0:GetMainCamera()
	arg_1_0.gameState = CarWashConst.GAME_STATE.NONE
	arg_1_0.carTouchClicked = false
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(CarWashGameFlowSystem.SET_STAINS_COUNT_MAX, function(arg_3_0, arg_3_1)
		arg_2_0:InitSceneRefs()
		arg_2_0:RefreshAllGlassMaterialByRegion()
		arg_2_0:PlayIdleAnim()
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.DECREASE_STAINS_COUNT, function(arg_4_0, arg_4_1)
		onNextTick(function()
			arg_2_0:RefreshAllGlassMaterialByRegion(true)
		end)
	end)
	arg_2_0:Bind(CarWashTimelineSystem.TIMELINE_SEQUENCE_BEGIN, function(arg_6_0)
		arg_2_0:SetAllGlassTransparent()
	end)
	arg_2_0:Bind(CarWashTimelineSystem.TIMELINE_SEQUENCE_END, function(arg_7_0)
		arg_2_0:RefreshAllGlassMaterialByRegion()
		arg_2_0:PlayIdleAnim()
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_LADY_POS, function(arg_8_0, arg_8_1)
		arg_2_0.posConfig = arg_8_1.newValue
		arg_2_0.carTouchTF = nil

		arg_2_0:PlayIdleAnim()
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_GAME_STATE, function(arg_9_0, arg_9_1)
		arg_2_0.gameState = arg_9_1.newValue

		if arg_9_1.newValue == CarWashConst.GAME_STATE.PHASE_2 then
			arg_2_0.carTouchClicked = false

			arg_2_0:SetAllGlassTransparent()
		elseif arg_9_1.newValue == CarWashConst.GAME_STATE.PHASE_1 then
			arg_2_0:RefreshAllGlassMaterialByRegion()
		end

		arg_2_0:EnablePhase2(arg_9_1.newValue == CarWashConst.GAME_STATE.PHASE_2 and arg_2_0.posConfig and arg_2_0.posConfig.phase2_glass_effect == 1)
	end)
	arg_2_0:Bind(var_0_0.PLAY_PHASE2_REACTION, function(arg_10_0)
		arg_2_0:PlayPhase2Reaction()
	end)
end

function var_0_0.OnUpdate(arg_11_0, arg_11_1)
	if arg_11_0.gameState ~= CarWashConst.GAME_STATE.PHASE_2 then
		return
	end

	arg_11_0:Emit(var_0_0.UPDATE_PHASE2_TIP, arg_11_0:GetPhase2TipInfo())
end

function var_0_0.OnDispose(arg_12_0)
	arg_12_0.mainCamera = nil
	arg_12_0.carTF = nil
	arg_12_0.carAnimator = nil
	arg_12_0.posConfig = nil
	arg_12_0.carTouchTF = nil
	arg_12_0.glassInfos = nil
	arg_12_0.randomDecalGenerator = nil
	arg_12_0.phase2VFX = nil
	arg_12_0.phase2Render = nil
end

function var_0_0.InitSceneRefs(arg_13_0)
	local var_13_0 = GameObject.Find(var_0_0.CAR_PREFAB_PATH)

	assert(var_13_0, "CarWash car prefab not found: " .. var_0_0.CAR_PREFAB_PATH)

	arg_13_0.carTF = var_13_0.transform
	arg_13_0.carAnimator = arg_13_0.carTF:GetChild(0):GetComponent(typeof(Animator))
	arg_13_0.glassInfos = {}

	local var_13_1 = GameObject.Find(var_0_0.GENERATOR_NAME)

	assert(var_13_1, "CarWash RandomDecalGenerator object not found: " .. var_0_0.GENERATOR_NAME)

	arg_13_0.randomDecalGenerator = var_13_1:GetComponent(typeof(RandomDecalGenerator))

	assert(arg_13_0.randomDecalGenerator, "RandomDecalGenerator component not found on " .. var_0_0.GENERATOR_NAME)

	for iter_13_0, iter_13_1 in ipairs(var_0_0.GLASS_CONFIG) do
		local var_13_2 = arg_13_0.carTF:Find(iter_13_1.path)

		assert(var_13_2, "CarWash glass object not found: " .. tostring(iter_13_1.path))

		local var_13_3 = var_13_2:GetComponent(typeof(MaterialSwitcher))

		assert(var_13_3, "MaterialSwitcher component not found on " .. tostring(iter_13_1.path))

		local var_13_4 = arg_13_0.randomDecalGenerator:GetRegionRootById(iter_13_1.regionId)

		assert(var_13_4, "CarWash glass decal region not found: " .. tostring(iter_13_1.regionId))

		local var_13_5 = arg_13_0.carTF:Find(iter_13_1.vfx)

		assert(var_13_5, "CarWash glass vfx not found: " .. tostring(iter_13_1.vfx))
		setActive(var_13_5, false)
		table.insert(arg_13_0.glassInfos, {
			switcher = var_13_3,
			regionId = iter_13_1.regionId,
			regionTF = var_13_4,
			vfxTF = var_13_5
		})
	end

	arg_13_0.phase2VFX = arg_13_0.carTF:Find(var_0_0.PHASE_2_VFX)

	local var_13_6 = arg_13_0.carTF:Find(var_0_0.PHASE_2_RENDER)

	assert(arg_13_0.phase2VFX, "CarWash phase2 vfx not found: " .. var_0_0.PHASE_2_VFX)
	assert(var_13_6, "CarWash phase2 renderer not found: " .. var_0_0.PHASE_2_RENDER)

	arg_13_0.phase2Render = var_13_6:GetComponent(typeof(SkinnedMeshRenderer))

	assert(arg_13_0.phase2Render, "CarWash phase2 MeshRenderer not found: " .. var_0_0.PHASE_2_RENDER)
end

function var_0_0.PlayIdleAnim(arg_14_0)
	if not arg_14_0.carAnimator or not arg_14_0.posConfig then
		return
	end

	local var_14_0 = arg_14_0.posConfig.car_idle_anim

	if not var_14_0 or var_14_0 == "" then
		return
	end

	arg_14_0.carAnimator:CrossFadeInFixedTime(var_14_0, 0, 0)
end

function var_0_0.GetPhase2TipInfo(arg_15_0)
	if arg_15_0.carTouchClicked or not arg_15_0.carTF or not arg_15_0.posConfig then
		return nil
	end

	local var_15_0 = arg_15_0.posConfig.car_touch_anim

	if not var_15_0 or not var_15_0[1] or var_15_0[1] == "" or not var_15_0[2] or var_15_0[2] == "" then
		return nil
	end

	if not arg_15_0.carTouchTF then
		arg_15_0.carTouchTF = arg_15_0.carTF:Find(var_15_0[1])

		assert(arg_15_0.carTouchTF, "CarWash car touch node not found: " .. tostring(var_15_0[1]))
	end

	local var_15_1 = arg_15_0.mainCamera:WorldToScreenPoint(arg_15_0.carTouchTF.position)

	return {
		isCar = true,
		screenPosition = var_15_1,
		visible = var_15_1.z > 0
	}
end

function var_0_0.PlayPhase2Reaction(arg_16_0)
	if arg_16_0.gameState ~= CarWashConst.GAME_STATE.PHASE_2 then
		return
	end

	if arg_16_0.carTouchClicked or not arg_16_0.posConfig then
		return
	end

	local var_16_0 = arg_16_0.posConfig.car_touch_anim

	if not var_16_0 or not var_16_0[2] or var_16_0[2] == "" then
		return
	end

	arg_16_0.carTouchClicked = true

	arg_16_0:Emit(var_0_0.UPDATE_PHASE2_TIP, nil)

	if arg_16_0.carAnimator then
		arg_16_0.carAnimator:CrossFadeInFixedTime(var_16_0[2], 0, 0)
	end
end

function var_0_0.RefreshAllGlassMaterialByRegion(arg_17_0, arg_17_1)
	if not arg_17_0.glassInfos then
		return
	end

	for iter_17_0, iter_17_1 in pairs(arg_17_0.glassInfos) do
		iter_17_1.regionTF = arg_17_0.randomDecalGenerator and arg_17_0.randomDecalGenerator:GetRegionRootById(iter_17_1.regionId) or nil

		if iter_17_1.regionTF then
			arg_17_0:SetGlassTransparent(iter_17_1, iter_17_1.regionTF.childCount == 0, arg_17_1)
		else
			warning("CarWash glass decal region not found: " .. tostring(iter_17_1.regionId))
		end
	end
end

function var_0_0.SetAllGlassTransparent(arg_18_0)
	if not arg_18_0.glassInfos then
		return
	end

	for iter_18_0, iter_18_1 in pairs(arg_18_0.glassInfos) do
		arg_18_0:SetGlassTransparent(iter_18_1, true)
	end
end

function var_0_0.SetGlassTransparent(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if arg_19_3 and arg_19_2 and not arg_19_1.isTransparent then
		setActive(arg_19_1.vfxTF, true)
	end

	local var_19_0 = arg_19_2 and var_0_0.TRANSPARENT_INDEX or var_0_0.OPAQUE_INDEX

	arg_19_1.switcher:ReplaceMaterial(var_0_0.MATERIAL_INDEX, var_19_0)

	arg_19_1.isTransparent = arg_19_2
end

function var_0_0.EnablePhase2(arg_20_0, arg_20_1)
	if arg_20_0.phase2VFX then
		setActive(arg_20_0.phase2VFX, arg_20_1)
	end

	if arg_20_0.phase2Render then
		arg_20_0.phase2Render.enabled = not arg_20_1
	end
end

return var_0_0
