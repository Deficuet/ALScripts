ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleMap")

var_0_0.Battle.BattleMap = var_0_1
var_0_1.__name = "BattleMap"

local var_0_2 = pg.map_data

var_0_1.LAYERS = {
	"close",
	"mid",
	"long",
	"sky",
	"sea"
}

function var_0_1.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = GameObject.New("scenes")
	arg_1_0.mapLayerCtrls = {}
	arg_1_0.seaAnimList = {}

	local var_1_0 = pg.map_data[arg_1_1]

	assert(var_1_0, "找不到地图: " .. arg_1_1)

	for iter_1_0, iter_1_1 in ipairs(var_0_1.LAYERS) do
		local var_1_1 = GameObject.New(iter_1_1 .. "Layer")

		setParent(var_1_1, arg_1_0._go, false)

		if iter_1_1 ~= "sky" then
			local var_1_2 = GetOrAddComponent(var_1_1, "MapLayerCtrl")

			var_1_2.leftBorder = var_1_0.range_left
			var_1_2.rightBorder = var_1_0.range_right
			var_1_2.speedToLeft = var_1_0[iter_1_1 .. "_speed"] or 0
			var_1_2.speedScaler = 1
			var_1_2.mainCamera = pg.UIMgr.GetInstance().mainCameraComp

			table.insert(arg_1_0.mapLayerCtrls, var_1_2)
		end

		local var_1_3 = arg_1_0.GetMapResNames(arg_1_1, iter_1_1)
		local var_1_4 = string.split(var_1_0[iter_1_1 .. "_pos"], ";")
		local var_1_5 = string.split(var_1_0[iter_1_1 .. "_scale"], ";")

		for iter_1_2, iter_1_3 in ipairs(var_1_3) do
			local var_1_6 = var_0_0.Battle.BattleResourceManager.GetInstance():InstMap(iter_1_3)

			tf(var_1_6).localScale = string2vector3(var_1_5[iter_1_2])

			setParent(var_1_6, var_1_1, false)

			tf(var_1_6).localPosition = string2vector3(var_1_4[iter_1_2])

			local var_1_7 = var_1_6:GetComponent(typeof(SeaAnim))

			if var_1_7 then
				table.insert(arg_1_0.seaAnimList, var_1_7)
			end

			local var_1_8 = var_1_6:GetComponent(typeof(Renderer))

			if var_1_8 then
				var_1_8.sortingOrder = -1500
			end
		end

		if iter_1_1 == "sea" then
			arg_1_0._buffer = var_1_1.transform:Find("gelidai(Clone)")

			if arg_1_0._buffer then
				arg_1_0._bufferRenderer = arg_1_0._buffer:GetComponent("SpriteRenderer")
				arg_1_0._bufferRenderer.color = Color.New(1, 1, 1, 0)
				arg_1_0._bufferRenderer.sortingOrder = -1500
			end
		end
	end

	arg_1_0:UpdateSpeedScaler()

	return arg_1_0._go
end

function var_0_1.ShiftSurface(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	if arg_2_0._shiftTimer then
		return
	end

	local var_2_0 = arg_2_1
	local var_2_1

	if arg_2_2 < arg_2_1 then
		var_2_1 = -1
	elseif arg_2_1 < arg_2_2 then
		var_2_1 = 1
	else
		return
	end

	local function var_2_2()
		if (arg_2_2 - var_2_0) * var_2_1 > 0 then
			var_0_0.Battle.BattleVariable.AppendMapFactor("seaSurfaceShift", var_2_0)
			arg_2_0:updateSeaSpeed()
			arg_2_0:UpdateSpeedScaler()

			var_2_0 = var_2_0 + var_2_1
		else
			pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_2_0._shiftTimer)

			arg_2_0._shiftTimer = nil

			if arg_2_4 then
				arg_2_4()
			end
		end
	end

	arg_2_0._shiftTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", -1, arg_2_3, var_2_2, true)
end

function var_0_1.UpdateSpeedScaler(arg_4_0)
	arg_4_0:setSpeedScaler(var_0_0.Battle.BattleVariable.MapSpeedRatio)
end

function var_0_1.UpdateBufferAlpha(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1 * 0.1

	arg_5_0._bufferRenderer.color = Color.New(1, 1, 1, var_5_0)
end

function var_0_1.SetExposeLine(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	function instantiateLine(arg_7_0, arg_7_1)
		local var_7_0 = var_0_0.Battle.BattleResourceManager.GetInstance():InstMap(arg_7_1)
		local var_7_1 = arg_6_0._go.transform:Find("seaLayer")

		setParent(var_7_0, var_7_1, false)

		local var_7_2 = var_7_0:GetComponent("SpriteRenderer")
		local var_7_3 = var_7_2.bounds.extents.max

		var_7_2.sortingOrder = -1501

		local var_7_4 = tf(var_7_0).localScale

		tf(var_7_0).localScale = Vector3.New(arg_6_1 * var_7_4.x, var_7_4.y, var_7_4.z)

		local var_7_5 = tf(var_7_0).localPosition
		local var_7_6 = var_7_2.bounds.extents.x * arg_6_1

		tf(var_7_0).localPosition = Vector3.New(arg_7_0 - var_7_6, var_7_5.y, var_7_5.z)
		var_7_2.enabled = true
	end

	instantiateLine(arg_6_2, "visionLine")

	if arg_6_3 then
		instantiateLine(arg_6_3, "exposeLine")
	end
end

function var_0_1.setSpeedScaler(arg_8_0, arg_8_1)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0.mapLayerCtrls) do
		iter_8_1.speedScaler = arg_8_1
	end
end

function var_0_1.updateSeaSpeed(arg_9_0)
	local var_9_0 = var_0_0.Battle.BattleVariable.MapSpeedRatio

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.seaAnimList) do
		iter_9_1:AdjustAnimSpeed(var_9_0)
	end
end

function var_0_1.Dispose(arg_10_0)
	if arg_10_0._shiftTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_10_0._shiftTimer)
	end

	if arg_10_0._go then
		Object.Destroy(arg_10_0._go)

		arg_10_0._go = nil
		arg_10_0._buffer = nil
		arg_10_0._bufferRenderer = nil
	end
end

function var_0_1.GetMapResNames(arg_11_0, arg_11_1)
	local var_11_0 = pg.map_data[arg_11_0]

	return string.split(var_11_0[arg_11_1 .. "_shot"], ";")
end

function var_0_1.setActive(arg_12_0, arg_12_1)
	SetActive(arg_12_0._go, arg_12_1)
end
