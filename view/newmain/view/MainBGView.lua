local var_0_0 = class("MainBGView", import("..base.MainBaseView"))
local var_0_1 = {
	{
		{
			0,
			5
		},
		"bg_main_night"
	},
	{
		{
			5,
			8
		},
		"bg_main_twilight"
	},
	{
		{
			8,
			16
		},
		"bg_main_day"
	},
	{
		{
			16,
			19
		},
		"bg_main_twilight"
	},
	{
		{
			19,
			24
		},
		"bg_main_night"
	}
}
local var_0_2 = 0

function var_0_0.GetBgAndBgm()
	local var_1_0 = var_0_1
	local var_1_1 = getProxy(ActivityProxy):RawGetActivityById(pg.gameset.dayandnight_bgm.key_value)

	if var_1_1 and not var_1_1:isEnd() then
		var_1_0 = pg.gameset.dayandnight_bgm.description
	end

	local var_1_2 = pg.TimeMgr.GetInstance():GetServerHour()

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		local var_1_3 = iter_1_1[1]

		if var_1_2 >= var_1_3[1] and var_1_2 < var_1_3[2] then
			return iter_1_1[2], iter_1_1[3]
		end
	end
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	var_0_0.super.Ctor(arg_2_0, arg_2_1, nil)

	arg_2_0._tf = arg_2_1
	arg_2_0._go = arg_2_1.gameObject
	arg_2_0.paintingCanvases = {
		arg_2_1.parent.parent:Find("paintBg"):GetComponent(typeof(Canvas)),
		arg_2_1.parent.parent:Find("paint"):GetComponent(typeof(Canvas))
	}
	arg_2_0.isSpecialBg = false
	arg_2_0.isloading = false
end

function var_0_0.getUIName(arg_3_0)
	return "MainBGView"
end

function var_0_0.Init(arg_4_0, arg_4_1)
	arg_4_0.ship = arg_4_1

	arg_4_0:ClearSpecailBg()

	local var_4_0 = arg_4_1:getShipBgPrint()

	arg_4_0.isSpecialBg = var_4_0 ~= arg_4_1:rarity2bgPrintForGet()

	local var_4_1, var_4_2 = MainPaintingView.GetAssistantStatus(arg_4_1)

	arg_4_0._showBg = var_4_2

	if arg_4_0.isSpecialBg and var_4_2 then
		arg_4_0:SetSpecailBg(var_4_0)
		arg_4_0:ClearMapBg()
		arg_4_0:ClearCommonBg()
	elseif var_0_2 and var_0_2 ~= 0 then
		local var_4_3 = pg.expedition_data_by_map[var_0_2]

		assert(var_4_3, "expedition_data_by_map >>> " .. var_0_2)

		local var_4_4 = var_4_3.bg .. "_" .. var_4_3.ani_name

		if arg_4_0.mapLoaderKey ~= var_4_4 then
			arg_4_0:ClearMapBg()

			arg_4_0.mapLoaderKey = var_4_4

			arg_4_0:SetMapBg(var_4_3.bg, var_4_3.ani_name)
		end

		arg_4_0:ClearCommonBg()
	else
		local var_4_5 = var_0_0.GetBgAndBgm()

		if arg_4_0.commonBg == var_4_5 then
			return
		end

		arg_4_0:SetCommonBg(var_4_5)
		arg_4_0:ClearMapBg()

		arg_4_0.commonBg = var_4_5
	end
end

function var_0_0.ClearCommonBg(arg_5_0)
	arg_5_0.commonBg = nil
end

function var_0_0.Refresh(arg_6_0, arg_6_1)
	arg_6_0:Init(arg_6_1)
end

function var_0_0.SetSpecailBg(arg_7_0, arg_7_1)
	arg_7_0.isloading = true

	local var_7_0 = var_0_0.GetBgAndBgm()

	pg.DynamicBgMgr.GetInstance():LoadBg(arg_7_0, arg_7_1, arg_7_0._tf.parent, arg_7_0._tf, function(arg_8_0)
		arg_7_0:SetCommonBg(var_7_0)
		setActive(arg_7_0._tf, true)
		tf(arg_8_0):SetAsLastSibling()

		arg_7_0.isloading = false
		arg_8_0.transform.localPosition = Vector3(0, 0, 200)
	end, function()
		arg_7_0.isloading = false
	end)
end

function var_0_0.SetMapBg(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.isloading = true
	arg_10_0.effectGo = nil

	parallelAsync({
		function(arg_11_0)
			PoolMgr.GetInstance():GetSprite("levelmap/" .. arg_10_1, "", true, function(arg_12_0)
				setImageSprite(arg_10_0._tf, arg_12_0)
				arg_11_0()
			end)
		end,
		function(arg_13_0)
			if not arg_10_2 or arg_10_2 == "" then
				arg_13_0()

				return
			end

			PoolMgr.GetInstance():GetPrefab("ui/" .. arg_10_2, "", true, function(arg_14_0)
				setParent(arg_14_0, arg_10_0._tf)
				arg_10_0:AdjustMapEffect(arg_14_0)

				arg_10_0.effectGo = arg_14_0

				arg_13_0()
			end)
		end
	}, function()
		arg_10_0.isloading = false
	end)
end

function var_0_0.ClearMapBg(arg_16_0)
	if not IsNil(arg_16_0.effectGo) then
		Object.Destroy(arg_16_0.effectGo)

		arg_16_0.effectGo = nil
	end

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.paintingCanvases) do
		iter_16_1.overrideSorting = false
		iter_16_1.sortingOrder = 0
	end

	arg_16_0.mapLoaderKey = nil
end

function var_0_0.AdjustMapEffect(arg_17_0, arg_17_1)
	local var_17_0 = -math.huge
	local var_17_1 = arg_17_1:GetComponentsInChildren(typeof(Canvas)):ToTable()

	for iter_17_0, iter_17_1 in ipairs(var_17_1) do
		if var_17_0 < iter_17_1.sortingOrder then
			var_17_0 = iter_17_1.sortingOrder
		end
	end

	local var_17_2 = arg_17_1:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer")):ToTable()

	for iter_17_2, iter_17_3 in ipairs(var_17_2) do
		local var_17_3 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", iter_17_3)

		if var_17_0 < var_17_3 then
			var_17_0 = var_17_3
		end
	end

	for iter_17_4, iter_17_5 in ipairs(arg_17_0.paintingCanvases) do
		iter_17_5.overrideSorting = true
		iter_17_5.sortingOrder = var_17_0 + (iter_17_4 == 3 and 2 or 1)
	end
end

function var_0_0.SetCommonBg(arg_18_0, arg_18_1)
	setActive(arg_18_0._tf, false)
	setActive(arg_18_0._tf, true)

	local var_18_0 = arg_18_0._tf:GetComponent(typeof(Image)).sprite

	setImageSprite(arg_18_0._tf, LoadSprite("commonbg/" .. arg_18_1, ""))

	if var_18_0 then
		Resources.UnloadAsset(var_18_0.texture)
	end
end

function var_0_0.ClearSpecailBg(arg_19_0)
	if arg_19_0.isSpecialBg then
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_19_0:getUIName())

		arg_19_0.isSpecialBg = false
	end
end

function var_0_0.IsLoading(arg_20_0)
	return arg_20_0.isloading
end

function var_0_0.Disable(arg_21_0)
	arg_21_0:ClearSpecailBg()
end

function var_0_0.Dispose(arg_22_0)
	var_0_0.super.Dispose(arg_22_0)
	arg_22_0:ClearSpecailBg()
	arg_22_0:ClearMapBg()
end

return var_0_0
