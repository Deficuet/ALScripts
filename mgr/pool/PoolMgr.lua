local var_0_0 = singletonClass("PoolMgr")

pg = pg or {}
pg.PoolMgr = var_0_0
PoolMgr = var_0_0

local var_0_1 = require("Mgr/Pool/PoolPlural")
local var_0_2 = require("Mgr/Pool/PoolSingleton")
local var_0_3 = require("Mgr/Pool/PoolObjPack")
local var_0_4 = require("Mgr/Pool/PoolUtil")
local var_0_5 = ResourceMgr.Inst

function var_0_0.Ctor(arg_1_0)
	arg_1_0.root = GameObject.New("__Pool__").transform
	arg_1_0.pools_plural = {}
	arg_1_0.pools_pack = {}
	arg_1_0.callbacks = {}
	arg_1_0.pluralIndex = 0
	arg_1_0.singleIndex = 0
	arg_1_0.preloadDic = {
		["ui/share/msgbox_atlas"] = 1,
		["shipyardicon/unknown"] = 1,
		["ui/commonui_atlas"] = 1,
		shipframeb = 1,
		skillframe = 1,
		energy = 1,
		["painting/mat"] = 1,
		shipstatus = 1,
		["ui/story_atlas"] = 1,
		["ui/guide_atlas"] = 1,
		["ui/share/world_common_atlas"] = 1,
		weaponframes = 1,
		attricon = 1,
		skinicon = 1,
		channel = 1,
		custom_builtin = 1,
		shiptype = 1,
		shipframe = 1
	}
	arg_1_0.keepDic = {}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	print("initializing pool manager...")

	local var_2_0 = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0.preloadDic) do
		table.insert(var_2_0, function(arg_3_0)
			AssetBundleHelper.LoadAssetBundle(iter_2_0, true, true, function(arg_4_0)
				arg_2_0:AddPoolsPack(iter_2_0, arg_4_0)
				arg_3_0()
			end)
		end)
	end

	arg_2_0:RegisterUIConst()
	seriesAsync(var_2_0, arg_2_1)
end

function var_0_0.GetSpineChar(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = {}
	local var_5_1 = "char/" .. arg_5_1

	if not arg_5_0.pools_plural[var_5_1] then
		table.insert(var_5_0, function(arg_6_0)
			arg_5_0:GetSpineSkel(arg_5_1, arg_5_2, function(arg_7_0)
				assert(arg_7_0 ~= nil, "Spine角色不存在: " .. arg_5_1)

				if not arg_5_0.pools_plural[var_5_1] then
					arg_7_0 = SpineAnimUI.AnimChar(arg_5_1, arg_7_0)

					arg_7_0:SetActive(false)
					tf(arg_7_0):SetParent(arg_5_0.root, false)

					local var_7_0 = arg_7_0:GetComponent("SkeletonGraphic")

					var_7_0.material = var_7_0.skeletonDataAsset.atlasAssets[0].materials[0]
					arg_5_0.pools_plural[var_5_1] = var_0_1.New(arg_7_0, 1)
				end

				arg_6_0()
			end)
		end)
	end

	seriesAsync(var_5_0, function()
		local var_8_0 = arg_5_0.pools_plural[var_5_1]

		var_8_0.index = arg_5_0.pluralIndex
		arg_5_0.pluralIndex = arg_5_0.pluralIndex + 1

		local var_8_1 = var_8_0:Dequeue()

		var_8_1:SetActive(true)
		arg_5_3(var_8_1)
	end)
end

function var_0_0.ReturnSpineChar(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = "char/" .. arg_9_1

	if IsNil(arg_9_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_9_1))
	elseif arg_9_0.pools_plural[var_9_0] then
		if arg_9_2:GetComponent("SkeletonGraphic").allowMultipleCanvasRenderers then
			UIUtil.ClearChildren(arg_9_2, {
				"Renderer"
			})
		else
			UIUtil.ClearChildren(arg_9_2)
		end

		setActiveViaLayer(arg_9_2.transform, true)
		arg_9_2:SetActive(false)
		arg_9_2.transform:SetParent(arg_9_0.root, false)

		arg_9_2.transform.localPosition = Vector3.New(0, 0, 0)
		arg_9_2.transform.localScale = Vector3.New(0.5, 0.5, 1)
		arg_9_2.transform.localRotation = Quaternion.identity

		arg_9_0.pools_plural[var_9_0]:Enqueue(arg_9_2)
		arg_9_0:ExcessSpineChar()
	else
		var_0_4.Destroy(arg_9_2)
	end
end

function var_0_0.ExcessSpineChar(arg_10_0, arg_10_1)
	local var_10_0 = 0
	local var_10_1 = 6
	local var_10_2 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.pools_plural) do
		if string.find(iter_10_0, "char/", nil, true) == 1 and iter_10_1:AllReturned() then
			table.insert(var_10_2, iter_10_0)
		end
	end

	if arg_10_1 then
		for iter_10_2, iter_10_3 in ipairs(var_10_2) do
			arg_10_0.pools_plural[iter_10_3]:Clear()

			arg_10_0.pools_plural[iter_10_3] = nil
		end
	elseif var_10_1 < #var_10_2 then
		gcAll()
	end
end

function var_0_0.GetSpineSkel(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0, var_11_1 = HXSet.autoHxShiftPath("char/" .. arg_11_1, arg_11_1)
	local var_11_2 = var_11_1 .. "_SkeletonData"

	arg_11_0:LoadAsset(var_11_0, "", typeof(Object), arg_11_2, function(arg_12_0)
		arg_11_3(arg_12_0)
	end, true)
end

function var_0_0.IsSpineSkelCached(arg_13_0, arg_13_1)
	local var_13_0 = "char/" .. arg_13_1

	return arg_13_0.pools_plural[var_13_0] ~= nil
end

local var_0_6 = {
	ResPanel = 3,
	WorldResPanel = 3
}
local var_0_7 = {
	"ResPanel",
	"WorldResPanel",
	"NewMainUI",
	"DockyardUI",
	"AwardInfoUI",
	"SkillInfoUI",
	"ItemInfoUI",
	"ShipDetailView",
	"LevelFleetSelectView",
	"Loading",
	"WorldUI"
}

function var_0_0.RegisterUIConst(arg_14_0)
	for iter_14_0, iter_14_1 in ipairs(var_0_7) do
		arg_14_0:KeepUICache(iter_14_1, true)
	end
end

function var_0_0.GetUI(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = "ui/" .. arg_15_1
	local var_15_1 = var_0_6[arg_15_1] or 1

	arg_15_0:FromPlural(var_15_0, "", arg_15_2, var_15_1, arg_15_3)
end

function var_0_0.ReturnUI(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = "ui/" .. arg_16_1

	if IsNil(arg_16_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_16_1))
	elseif arg_16_0.pools_plural[var_16_0] then
		setActiveViaLayer(arg_16_2, false)
		arg_16_2.transform:SetParent(arg_16_0.root, false)
		arg_16_0.pools_plural[var_16_0]:Enqueue(arg_16_2, true)

		if arg_16_0.pools_plural[var_16_0]:AllReturned() and (not arg_16_0.callbacks[var_16_0] or #arg_16_0.callbacks[var_16_0] == 0) then
			arg_16_0.pools_plural[var_16_0]:Clear()

			arg_16_0.pools_plural[var_16_0] = nil
		end
	else
		var_0_4.Destroy(arg_16_2)
	end
end

function var_0_0.PreloadUI(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}
	local var_17_1 = "ui/" .. arg_17_1

	if not arg_17_0.pools_plural[var_17_1] then
		table.insert(var_17_0, function(arg_18_0)
			arg_17_0:GetUI(arg_17_1, true, function(arg_19_0)
				setActive(arg_19_0, false)
				arg_17_0.pools_plural[var_17_1]:Enqueue(arg_19_0)
				arg_18_0()
			end)
		end)
	end

	seriesAsync(var_17_0, arg_17_2)
end

function var_0_0.KeepUICache(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = "ui/" .. arg_20_1

	arg_20_0.keepDic[var_20_0] = arg_20_2 or nil

	if arg_20_0.pools_plural[var_20_0] then
		arg_20_0.pools_plural[var_20_0]:SetKeep(tobool(arg_20_0.keepDic[var_20_0]))

		if arg_20_0.pools_plural[var_20_0]:AllReturned() and (not arg_20_0.callbacks[var_20_0] or #arg_20_0.callbacks[var_20_0] == 0) then
			arg_20_0.pools_plural[var_20_0]:Clear()

			arg_20_0.pools_plural[var_20_0] = nil
		end
	end
end

function var_0_0.PreloadPainting(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = {}
	local var_21_1 = "painting/" .. arg_21_1

	if not arg_21_0.pools_plural[var_21_1] then
		table.insert(var_21_0, function(arg_22_0)
			arg_21_0:GetPainting(arg_21_1, true, function(arg_23_0)
				arg_21_0.pools_plural[var_21_1]:Enqueue(arg_23_0)
				arg_22_0()
			end)
		end)
	end

	seriesAsync(var_21_0, arg_21_2)
end

function var_0_0.GetPainting(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = "painting/" .. arg_24_1
	local var_24_1 = var_24_0

	arg_24_0:FromPlural(var_24_0, "", arg_24_2, 1, function(arg_25_0)
		arg_25_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_24_1) then
			setActive(tf(arg_25_0):Find("face"), true)
		end

		arg_24_3(arg_25_0)
	end)
end

function var_0_0.ReturnPainting(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = "painting/" .. arg_26_1

	if IsNil(arg_26_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_26_1))
	elseif arg_26_0.pools_plural[var_26_0] then
		setActiveViaLayer(arg_26_2, true)

		local var_26_1 = tf(arg_26_2):Find("face")

		if var_26_1 then
			setActive(var_26_1, false)
		end

		arg_26_2:SetActive(false)
		arg_26_2.transform:SetParent(arg_26_0.root, false)
		arg_26_0.pools_plural[var_26_0]:Enqueue(arg_26_2)
		arg_26_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_26_2)
	end
end

function var_0_0.ExcessPainting(arg_27_0, arg_27_1)
	local var_27_0 = 0
	local var_27_1 = 6
	local var_27_2 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.pools_plural) do
		if string.find(iter_27_0, "painting/", nil, true) == 1 and iter_27_1:AllReturned() then
			table.insert(var_27_2, iter_27_0)
		end
	end

	if arg_27_1 then
		for iter_27_2, iter_27_3 in ipairs(var_27_2) do
			arg_27_0.pools_plural[iter_27_3]:Clear()

			arg_27_0.pools_plural[iter_27_3] = nil
		end
	elseif var_27_1 < #var_27_2 then
		gcAll(false)
	end
end

function var_0_0.GetPaintingWithPrefix(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4)
	local var_28_0 = arg_28_4 .. arg_28_1
	local var_28_1 = var_28_0

	arg_28_0:FromPlural(var_28_0, "", arg_28_2, 1, function(arg_29_0)
		arg_29_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_28_1) then
			setActive(tf(arg_29_0):Find("face"), true)
		end

		arg_28_3(arg_29_0)
	end)
end

function var_0_0.ReturnPaintingWithPrefix(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = arg_30_3 .. arg_30_1

	if IsNil(arg_30_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_30_1))
	elseif arg_30_0.pools_plural[var_30_0] then
		setActiveViaLayer(arg_30_2, true)

		local var_30_1 = tf(arg_30_2):Find("face")

		if var_30_1 then
			setActive(var_30_1, false)
		end

		arg_30_2:SetActive(false)
		arg_30_2.transform:SetParent(arg_30_0.root, false)
		arg_30_0.pools_plural[var_30_0]:Enqueue(arg_30_2)
		arg_30_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_30_2)
	end
end

function var_0_0.GetSpinePainting(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0
	local var_31_1, var_31_2 = HXSet.autoHxShift("spinePainting/", arg_31_1)

	arg_31_1 = var_31_2

	local var_31_3 = var_31_1 .. arg_31_1

	arg_31_0:FromPlural(var_31_3, "", arg_31_2, 1, function(arg_32_0)
		arg_32_0:SetActive(true)
		arg_31_3(arg_32_0)
	end)
end

function var_0_0.ReturnSpinePainting(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0
	local var_33_1, var_33_2 = HXSet.autoHxShift("spinePainting/", arg_33_1)

	arg_33_1 = var_33_2

	local var_33_3 = var_33_1 .. arg_33_1

	if IsNil(arg_33_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_33_1))
	elseif arg_33_0.pools_plural[var_33_3] then
		setActiveViaLayer(arg_33_2, true)
		arg_33_2:SetActive(false)
		arg_33_2.transform:SetParent(arg_33_0.root, false)
		arg_33_0.pools_plural[var_33_3]:Enqueue(arg_33_2)
		arg_33_0:ExcessDymPainting()
	else
		var_0_4.Destroy(arg_33_2)
	end
end

function var_0_0.GetLive2D(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	local var_34_0
	local var_34_1, var_34_2 = HXSet.autoHxShift("live2d/", arg_34_1)

	arg_34_1 = var_34_2

	local var_34_3 = var_34_1 .. arg_34_1

	arg_34_0:FromPlural(var_34_3, "", arg_34_2, 1, function(arg_35_0)
		arg_35_0:SetActive(true)
		arg_34_3(arg_35_0)
	end)
end

function var_0_0.ReturnLive2D(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0
	local var_36_1, var_36_2 = HXSet.autoHxShift("live2d/", arg_36_1)

	arg_36_1 = var_36_2

	local var_36_3 = var_36_1 .. arg_36_1

	if IsNil(arg_36_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_36_1))
	elseif arg_36_0.pools_plural[var_36_3] then
		setActiveViaLayer(arg_36_2, true)
		arg_36_2:SetActive(false)
		arg_36_2.transform:SetParent(arg_36_0.root, false)
		arg_36_0.pools_plural[var_36_3]:Enqueue(arg_36_2)
		arg_36_0:ExcessDymPainting()
	else
		var_0_4.Destroy(arg_36_2)
	end
end

local var_0_8 = {
	["live2d/"] = true,
	["spinePainting/"] = true
}
local var_0_9 = ApartmentProxy.CheckDeviceRAMEnough() and 6 or 2

function var_0_0.ExcessDymPainting(arg_37_0, arg_37_1)
	local var_37_0 = 0
	local var_37_1 = var_0_9
	local var_37_2 = {}

	for iter_37_0, iter_37_1 in pairs(arg_37_0.pools_plural) do
		local var_37_3 = string.find(iter_37_0, "/", nil, true)

		if var_37_3 and var_0_8[string.sub(iter_37_0, 1, var_37_3)] and iter_37_1:AllReturned() then
			table.insert(var_37_2, iter_37_0)
		end
	end

	if arg_37_1 then
		for iter_37_2, iter_37_3 in ipairs(var_37_2) do
			arg_37_0.pools_plural[iter_37_3]:Clear()

			arg_37_0.pools_plural[iter_37_3] = nil
		end
	elseif var_37_1 < #var_37_2 then
		gcAll(false)
	end
end

function var_0_0.GetSprite(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	arg_38_0:FromObjPack(arg_38_1, tostring(arg_38_2), typeof(Sprite), arg_38_3, function(arg_39_0)
		arg_38_4(arg_39_0)
	end)
end

function var_0_0.DecreasSprite(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_1

	if arg_40_0.pools_pack[var_40_0] then
		arg_40_0.pools_pack[var_40_0]:Remove(arg_40_2)

		if arg_40_0.pools_pack[var_40_0]:GetAmount() <= 0 then
			arg_40_0:RemovePoolsPack(var_40_0)
		end
	end
end

function var_0_0.DestroySprite(arg_41_0, arg_41_1)
	arg_41_0:RemovePoolsPack(arg_41_1)
end

function var_0_0.DestroyAllSprite(arg_42_0)
	local var_42_0 = arg_42_0:SpriteMemUsage()
	local var_42_1 = 24

	print("cached sprite size: " .. math.ceil(var_42_0 * 10) / 10 .. "/" .. var_42_1 .. "MB")

	for iter_42_0, iter_42_1 in pairs(arg_42_0.pools_pack) do
		arg_42_0:RemovePoolsPack(iter_42_0)
	end

	var_0_5:unloadUnusedAssetBundles()
end

function var_0_0.DisplayPoolPacks(arg_43_0)
	local var_43_0

	for iter_43_0, iter_43_1 in pairs(arg_43_0.pools_pack) do
		table.insert(var_43_0, iter_43_0)

		for iter_43_2, iter_43_3 in pairs(iter_43_1.items) do
			table.insert(var_43_0, string.format("assetName:%s type:%s", iter_43_2, tostring(iter_43_1.type.FullName)))
		end
	end

	warning(table.concat(var_43_0, "\n"))
end

function var_0_0.SpriteMemUsage(arg_44_0)
	local var_44_0 = 0
	local var_44_1 = 9.5367431640625e-07
	local var_44_2 = typeof(Sprite)

	for iter_44_0, iter_44_1 in pairs(arg_44_0.pools_pack) do
		local var_44_3 = {}

		for iter_44_2, iter_44_3 in pairs(iter_44_1.items) do
			if iter_44_1.typeDic[iter_44_2] == var_44_2 then
				local var_44_4 = iter_44_1.items[iter_44_2].texture
				local var_44_5 = var_44_4.name

				if not var_44_3[var_44_5] then
					local var_44_6 = 4
					local var_44_7 = var_44_4.format

					if var_44_7 == TextureFormat.RGB24 then
						var_44_6 = 3
					elseif var_44_7 == TextureFormat.ARGB4444 or var_44_7 == TextureFormat.RGBA4444 then
						var_44_6 = 2
					elseif var_44_7 == TextureFormat.DXT5 or var_44_7 == TextureFormat.ASTC_4x4 or var_44_7 == TextureFormat.ETC2_RGBA8 then
						var_44_6 = 1
					elseif var_44_7 == TextureFormat.PVRTC_RGB4 or var_44_7 == TextureFormat.PVRTC_RGBA4 or var_44_7 == TextureFormat.ETC_RGB4 or var_44_7 == TextureFormat.ETC2_RGB or var_44_7 == TextureFormat.ASTC_6x6 or var_44_7 == TextureFormat.DXT1 then
						var_44_6 = 0.5
					end

					var_44_0 = var_44_0 + var_44_4.width * var_44_4.height * var_44_6 * var_44_1 / 8
					var_44_3[var_44_5] = true
				end
			end
		end
	end

	return var_44_0
end

local var_0_10 = 64
local var_0_11 = {
	"chapter/",
	"emoji/",
	"world/"
}

function var_0_0.GetPrefab(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4, arg_45_5)
	local var_45_0 = arg_45_1

	arg_45_0:FromPlural(arg_45_1, "", arg_45_3, arg_45_5 or var_0_10, function(arg_46_0)
		if string.find(arg_45_1, "emoji/") == 1 then
			local var_46_0 = arg_46_0:GetComponent(typeof(CriManaEffectUI))

			if var_46_0 then
				var_46_0:Pause(false)
			end
		end

		arg_46_0:SetActive(true)
		tf(arg_46_0):SetParent(arg_45_0.root, false)
		arg_45_4(arg_46_0)
	end)
end

function var_0_0.ReturnPrefab(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	local var_47_0 = arg_47_1

	if IsNil(arg_47_3) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_47_2))
	elseif arg_47_0.pools_plural[var_47_0] then
		if string.find(arg_47_1, "emoji/") == 1 then
			local var_47_1 = arg_47_3:GetComponent(typeof(CriManaEffectUI))

			if var_47_1 then
				var_47_1:Pause(true)
			end
		end

		arg_47_3:SetActive(false)
		arg_47_3.transform:SetParent(arg_47_0.root, false)
		arg_47_0.pools_plural[var_47_0]:Enqueue(arg_47_3)

		if arg_47_4 and arg_47_0.pools_plural[var_47_0]:AllReturned() and (not arg_47_0.callbacks[var_47_0] or #arg_47_0.callbacks[var_47_0] == 0) then
			arg_47_0:DestroyPrefab(arg_47_1, arg_47_2)
		end
	else
		var_0_4.Destroy(arg_47_3)
	end
end

function var_0_0.DestroyPrefab(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = arg_48_1

	if arg_48_0.pools_plural[var_48_0] then
		arg_48_0.pools_plural[var_48_0]:Clear()

		arg_48_0.pools_plural[var_48_0] = nil
	end
end

function var_0_0.DestroyAllPrefab(arg_49_0)
	local var_49_0 = {}

	for iter_49_0, iter_49_1 in pairs(arg_49_0.pools_plural) do
		if _.any(var_0_11, function(arg_50_0)
			return string.find(iter_49_0, arg_50_0) == 1
		end) then
			iter_49_1:Clear()
			table.insert(var_49_0, iter_49_0)
		end
	end

	_.each(var_49_0, function(arg_51_0)
		arg_49_0.pools_plural[arg_51_0] = nil
	end)
end

function var_0_0.DisplayPluralPools(arg_52_0)
	local var_52_0 = ""

	for iter_52_0, iter_52_1 in pairs(arg_52_0.pools_plural) do
		if #var_52_0 > 0 then
			var_52_0 = var_52_0 .. "\n"
		end

		local var_52_1 = _.map({
			iter_52_0,
			"balance",
			iter_52_1.balance,
			"currentItmes",
			#iter_52_1.items
		}, function(arg_53_0)
			return tostring(arg_53_0)
		end)

		var_52_0 = var_52_0 .. " " .. table.concat(var_52_1, " ")
	end

	warning(var_52_0)
end

function var_0_0.GetPluralStatus(arg_54_0, arg_54_1)
	if not arg_54_0.pools_plural[arg_54_1] then
		return "NIL"
	end

	local var_54_0 = arg_54_0.pools_plural[arg_54_1]
	local var_54_1 = _.map({
		arg_54_1,
		"balance",
		var_54_0.balance,
		"currentItmes",
		#var_54_0.items
	}, tostring)

	return table.concat(var_54_1, " ")
end

function var_0_0.FromPlural(arg_55_0, arg_55_1, arg_55_2, arg_55_3, arg_55_4, arg_55_5)
	local var_55_0 = arg_55_2 == "" and arg_55_1 or arg_55_1 .. "|" .. arg_55_2
	local var_55_1 = {}

	if not arg_55_0.pools_plural[var_55_0] then
		table.insert(var_55_1, function(arg_56_0)
			arg_55_0:LoadAsset(arg_55_1, arg_55_2, typeof(Object), arg_55_3, function(arg_57_0)
				if arg_57_0 == nil then
					Debugger.LogError("can not find asset: " .. arg_55_1 .. " : " .. arg_55_2)

					return
				end

				if not arg_55_0.pools_plural[var_55_0] then
					arg_55_0.pools_plural[var_55_0] = var_0_1.New(arg_57_0, arg_55_4)

					arg_55_0.pools_plural[var_55_0]:SetKeep(tobool(arg_55_0.keepDic[var_55_0]))
				end

				arg_56_0()
			end, true, true)
		end)
	end

	seriesAsync(var_55_1, function()
		local var_58_0 = arg_55_0.pools_plural[var_55_0]

		var_58_0.index = arg_55_0.pluralIndex
		arg_55_0.pluralIndex = arg_55_0.pluralIndex + 1

		arg_55_5(var_58_0:Dequeue())
	end)
end

function var_0_0.FromObjPack(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4, arg_59_5)
	local var_59_0 = arg_59_1
	local var_59_1 = {}

	if not arg_59_0.pools_pack[var_59_0] then
		table.insert(var_59_1, function(arg_60_0)
			AssetBundleHelper.LoadAssetBundle(arg_59_1, arg_59_4, true, function(arg_61_0)
				arg_59_0:AddPoolsPack(arg_59_1, arg_61_0)
				arg_60_0()
			end)
		end)
	end

	seriesAsync(var_59_1, function()
		arg_59_5(arg_59_0.pools_pack[var_59_0]:Get(arg_59_2, arg_59_3))
	end)
end

function var_0_0.LoadAsset(arg_63_0, arg_63_1, arg_63_2, arg_63_3, arg_63_4, arg_63_5, arg_63_6, arg_63_7)
	arg_63_1, arg_63_2 = HXSet.autoHxShiftPath(arg_63_1, arg_63_2)

	local var_63_0 = arg_63_1 .. "|" .. arg_63_2

	if arg_63_0.callbacks[var_63_0] then
		if not arg_63_4 then
			errorMsg("Sync Loading after async operation")
		end

		table.insert(arg_63_0.callbacks[var_63_0], arg_63_5)
	elseif arg_63_4 then
		arg_63_0.callbacks[var_63_0] = {
			arg_63_5
		}

		var_0_5:getAssetAsync(arg_63_1, arg_63_2, arg_63_3, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_64_0)
			if arg_63_0.callbacks[var_63_0] then
				local var_64_0 = arg_63_0.callbacks[var_63_0]

				arg_63_0.callbacks[var_63_0] = nil

				while next(var_64_0) do
					table.remove(var_64_0)(arg_64_0)
				end
			end
		end), arg_63_6, arg_63_7 or false)
	else
		arg_63_5(var_0_5:getAssetSync(arg_63_1, arg_63_2, arg_63_3, arg_63_6, arg_63_7 or false))
	end
end

function var_0_0.AddPoolsPack(arg_65_0, arg_65_1, arg_65_2)
	if arg_65_0.pools_pack[arg_65_1] then
		arg_65_2:Dispose()
	else
		arg_65_0.pools_pack[arg_65_1] = var_0_3.New(arg_65_1, arg_65_2)
	end
end

function var_0_0.RemovePoolsPack(arg_66_0, arg_66_1)
	if not arg_66_0.pools_pack[arg_66_1] or arg_66_0.preloadDic[arg_66_1] then
		return
	end

	arg_66_0.pools_pack[arg_66_1]:Clear()

	arg_66_0.pools_pack[arg_66_1] = nil
end

function var_0_0.PrintPools(arg_67_0)
	local var_67_0 = ""

	for iter_67_0, iter_67_1 in pairs(arg_67_0.pools_plural) do
		var_67_0 = var_67_0 .. "\n" .. iter_67_0
	end

	warning(var_67_0)
end

function var_0_0.PrintObjPack(arg_68_0)
	local var_68_0 = {}

	for iter_68_0, iter_68_1 in pairs(arg_68_0.pools_pack) do
		table.insert(var_68_0, iter_68_0)

		for iter_68_2, iter_68_3 in pairs(iter_68_1.items) do
			table.insert(var_68_0, "    :" .. iter_68_2)
		end
	end

	warning(table.concat(var_68_0, "\n"))
end

return var_0_0
