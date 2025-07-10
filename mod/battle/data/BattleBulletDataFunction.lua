ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = pg.bullet_template
local var_0_3 = pg.barrage_template

var_0_0.Battle.BattleDataFunction = var_0_0.Battle.BattleDataFunction or {}

local var_0_4 = var_0_0.Battle.BattleDataFunction
local var_0_5 = var_0_1.UnitDir.LEFT
local var_0_6 = var_0_1.UnitDir.RIGHT

function var_0_4.CreateBattleBulletData(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = var_0_4.GetBulletTmpDataFromID(arg_1_1)
	local var_1_1 = var_1_0.type

	if var_1_0.extra_param.currentdrop then
		arg_1_4 = arg_1_2:GetPosition()
	end

	local var_1_2, var_1_3 = var_0_4.generateBulletFuncs[var_1_1](arg_1_0, var_1_0, arg_1_2, arg_1_3, arg_1_4)

	var_1_2:SetTemplateData(var_1_0)
	var_1_2:SetAttr(arg_1_2._attr)
	var_1_2:SetBuffTrigger(arg_1_2)
	var_1_2:SetWeapon(arg_1_3)

	if arg_1_3 and arg_1_3:GetStandHost() then
		local var_1_4 = arg_1_3:GetStandHost():GetAttr()

		var_1_2:SetStandHostAttr(var_1_4)
	end

	local var_1_5 = var_1_2:IsIngoreCld()

	if var_1_5 ~= nil then
		local var_1_6 = not var_1_5

		var_1_2:SetIsCld(var_1_6)

		var_1_3 = var_1_6
	end

	return var_1_2, var_1_3
end

function var_0_4.GetBulletTmpDataFromID(arg_2_0)
	assert(var_0_2[arg_2_0] ~= nil, "找不到子弹配置：id = " .. arg_2_0)

	return var_0_2[arg_2_0]
end

function var_0_4.GetBarrageTmpDataFromID(arg_3_0)
	assert(var_0_3[arg_3_0] ~= nil, "找不到弹幕配置：id = " .. arg_3_0)

	return var_0_3[arg_3_0]
end

function var_0_4.GetConvertedBarrageTableFromID(arg_4_0, arg_4_1)
	assert(var_0_3[arg_4_0] ~= nil, "获取转换弹幕数据失败，找不到弹幕原型配置：id = " .. arg_4_0)

	if var_0_4.ConvertedBarrageTableList[arg_4_0] == nil or var_0_4.ConvertedBarrageTableList[arg_4_0][arg_4_1] == nil then
		var_0_4.ConvertSpecificBarrage(arg_4_0, arg_4_1)
	end

	return var_0_4.ConvertedBarrageTableList[arg_4_0]
end

function var_0_4.GenerateTransBarrage(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {}
	local var_5_1 = var_0_4.GetBarrageTmpDataFromID(arg_5_0)

	while var_5_1.trans_ID ~= -1 do
		local var_5_2 = var_5_1.trans_ID

		var_5_1 = var_0_4.GetBarrageTmpDataFromID(var_5_2)

		local var_5_3 = {
			transStartDelay = var_5_1.first_delay + var_5_1.delay * arg_5_2 + var_5_1.delta_delay * arg_5_2
		}

		if var_5_1.offset_prioritise then
			var_5_3.transAimPosX = var_5_1.offset_x + var_5_1.delta_offset_x * arg_5_2
			var_5_3.transAimPosZ = var_5_1.offset_z + var_5_1.delta_offset_z * arg_5_2
		else
			var_5_3.transAimAngle = var_5_1.angle + var_5_1.delta_angle * arg_5_2

			if arg_5_1 == -1 then
				var_5_3.transAimAngle = var_5_3.transAimAngle + 180
			end
		end

		var_5_0[#var_5_0 + 1] = var_5_3
	end

	return var_5_0
end

function var_0_4._createCannonBullet(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	local var_6_0 = var_0_0.Battle.BattleCannonBulletUnit.New(arg_6_0, arg_6_2:GetIFF())

	var_6_0:SetIsCld(true)

	return var_6_0, true
end

function var_0_4._createBombBullet(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	local var_7_0 = var_0_0.Battle.BattleBombBulletUnit.New(arg_7_0, arg_7_2:GetIFF())

	var_7_0:SetAttr(arg_7_2._attr)
	var_7_0:SetTemplateData(arg_7_1)

	if arg_7_4:EqualZero() then
		arg_7_4 = arg_7_2:GetPosition():Clone()

		local var_7_1 = arg_7_3:GetTemplateData().range

		if arg_7_2:GetDirection() == var_0_1.UnitDir.RIGHT then
			arg_7_4.x = arg_7_4.x + var_7_1
		else
			arg_7_4.x = arg_7_4.x - var_7_1
		end
	end

	var_7_0:SetExplodePosition(arg_7_4)
	var_7_0:SetIsCld(false)

	return var_7_0, false
end

function var_0_4._createStrayBullet(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	local var_8_0 = var_0_0.Battle.BattleStrayBulletUnit.New(arg_8_0, arg_8_2:GetIFF())

	var_8_0:SetIsCld(true)

	return var_8_0, true
end

function var_0_4._createTorpedoBullet(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = var_0_0.Battle.BattleTorpedoBulletUnit.New(arg_9_0, arg_9_2:GetIFF())

	var_9_0:SetExplodePosition(arg_9_4)
	var_9_0:SetIsCld(true)

	return var_9_0, true
end

function var_0_4._createDirectBullet(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	local var_10_0 = var_0_0.Battle.BattleAntiAirBulletUnit.New(arg_10_0, arg_10_2:GetIFF())

	var_10_0:SetIsCld(false)

	return var_10_0, false
end

function var_0_4._createAntiAirBullet(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = var_0_0.Battle.BattleAntiAirBulletUnit.New(arg_11_0, arg_11_2:GetIFF())

	var_11_0:SetIsCld(false)

	return var_11_0, false
end

function var_0_4._createAntiSeaBullet(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	local var_12_0 = var_0_0.Battle.BattleAntiSeaBulletUnit.New(arg_12_0, arg_12_2:GetIFF())

	var_12_0:SetIsCld(false)

	return var_12_0, false
end

function var_0_4._createSharpnelBullet(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	local var_13_0 = var_0_0.Battle.BattleShrapnelBulletUnit.New(arg_13_0, arg_13_2:GetIFF())

	var_13_0:SetExplodePosition(arg_13_4)
	var_13_0:SetSrcHost(arg_13_2)
	var_13_0:SetIsCld(true)

	return var_13_0, true
end

function var_0_4._createEffectBullet(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	local var_14_0 = var_0_0.Battle.BattleEffectBulletUnit.New(arg_14_0, arg_14_2:GetIFF())

	var_14_0:SetTemplateData(arg_14_1)
	var_14_0:SetIsCld(false)
	var_14_0:SetImmuneCLS(true)

	if arg_14_1.attach_buff[1].flare then
		var_14_0:spawnArea(true)
	end

	return var_14_0, false
end

function var_0_4._createBeamBullet(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = var_0_0.Battle.BattleAntiAirBulletUnit.New(arg_15_0, arg_15_2:GetIFF())

	var_15_0:SetIsCld(false)

	return var_15_0, false
end

function var_0_4._createGravitationBullet(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	local var_16_0 = var_0_0.Battle.BattleGravitationBulletUnit.New(arg_16_0, arg_16_2:GetIFF())

	var_16_0:SetExplodePosition(arg_16_4)
	var_16_0:SetIsCld(true)
	var_16_0:SetImmuneCLS(true)

	return var_16_0, true
end

function var_0_4._createMissile(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = var_0_0.Battle.BattleMissileUnit.New(arg_17_0, arg_17_2:GetIFF())

	var_17_0:SetAttr(arg_17_2._attr)
	var_17_0:SetTemplateData(arg_17_1)
	var_17_0:SetImmuneCLS(true)
	var_17_0:SetIsCld(false)

	return var_17_0, false
end

function var_0_4._createSpaceLaser(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	local var_18_0 = var_0_0.Battle.BattleSpaceLaserUnit.New(arg_18_0, arg_18_2:GetIFF())

	var_18_0:SetIsCld(true)
	var_18_0:SetImmuneCLS(true)

	return var_18_0, true
end

function var_0_4._createScaleBullet(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	local var_19_0 = var_0_0.Battle.BattleScaleBulletUnit.New(arg_19_0, arg_19_2:GetIFF())

	var_19_0:SetIsCld(true)

	return var_19_0, true
end

function var_0_4._createAAMissile(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0 = var_0_0.Battle.BattleTrackingAAMissileUnit.New(arg_20_0, arg_20_2:GetIFF())

	var_20_0:SetIsCld(true)

	return var_20_0, true
end

var_0_4.generateBulletFuncs = {}
var_0_4.generateBulletFuncs[var_0_1.BulletType.CANNON] = var_0_4._createCannonBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.BOMB] = var_0_4._createBombBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.TORPEDO] = var_0_4._createTorpedoBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.DIRECT] = var_0_4._createDirectBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.ANTI_AIR] = var_0_4._createAntiAirBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.ANTI_SEA] = var_0_4._createAntiSeaBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.SHRAPNEL] = var_0_4._createSharpnelBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.STRAY] = var_0_4._createStrayBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.EFFECT] = var_0_4._createEffectBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.BEAM] = var_0_4._createBeamBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.G_BULLET] = var_0_4._createGravitationBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.ELECTRIC_ARC] = var_0_4._createDirectBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.MISSILE] = var_0_4._createMissile
var_0_4.generateBulletFuncs[var_0_1.BulletType.SPACE_LASER] = var_0_4._createSpaceLaser
var_0_4.generateBulletFuncs[var_0_1.BulletType.SCALE] = var_0_4._createScaleBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.TRIGGER_BOMB] = var_0_4._createBombBullet
var_0_4.generateBulletFuncs[var_0_1.BulletType.AAMissile] = var_0_4._createAAMissile

function var_0_4.ConvertSpecificBarrage(arg_21_0, arg_21_1)
	local var_21_0

	var_21_0[arg_21_1], var_21_0 = var_0_4.barrageInteration(pg.barrage_template[arg_21_0], arg_21_1), var_0_4.ConvertedBarrageTableList[arg_21_0] or {}
	var_0_4.ConvertedBarrageTableList[arg_21_0] = var_21_0
end

function var_0_4.ClearConvertedBarrage()
	var_0_4.ConvertedBarrageTableList = {}
end

function var_0_4.barrageInteration(arg_23_0, arg_23_1)
	local var_23_0 = 1
	local var_23_1 = arg_23_0.primal_repeat
	local var_23_2 = {}
	local var_23_3 = arg_23_0.offset_x
	local var_23_4 = arg_23_0.offset_z
	local var_23_5 = arg_23_0.angle
	local var_23_6 = arg_23_0.delay
	local var_23_7 = arg_23_0.delta_offset_x
	local var_23_8 = arg_23_0.delta_offset_z
	local var_23_9 = arg_23_0.delta_angle
	local var_23_10 = arg_23_0.delta_delay

	for iter_23_0 = 0, var_23_1 do
		local var_23_11 = {
			OffsetX = var_23_3 * arg_23_1,
			OffsetZ = var_23_4,
			Angle = var_23_5,
			Delay = var_23_6
		}

		table.insert(var_23_2, var_23_11)

		var_23_3 = var_23_3 + var_23_7
		var_23_4 = var_23_4 + var_23_8
		var_23_5 = var_23_5 + var_23_9
		var_23_6 = var_23_6 + var_23_10
	end

	return var_23_2
end

var_0_4.ClearConvertedBarrage()
