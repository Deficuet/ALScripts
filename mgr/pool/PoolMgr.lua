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
	arg_1_0.paintingCount = 0
	arg_1_0.commanderPaintingCount = 0
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
	arg_1_0.ui_tempCache = {}
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

function var_0_0.ExcessSpineChar(arg_10_0)
	local var_10_0 = 0
	local var_10_1 = 6
	local var_10_2 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.pools_plural) do
		if string.find(iter_10_0, "char/") == 1 then
			table.insert(var_10_2, iter_10_0)
		end
	end

	if var_10_1 < #var_10_2 then
		table.sort(var_10_2, function(arg_11_0, arg_11_1)
			return arg_10_0.pools_plural[arg_11_0].index > arg_10_0.pools_plural[arg_11_1].index
		end)

		for iter_10_2 = var_10_1 + 1, #var_10_2 do
			local var_10_3 = var_10_2[iter_10_2]

			arg_10_0.pools_plural[var_10_3]:Clear()

			arg_10_0.pools_plural[var_10_3] = nil
		end
	end
end

function var_0_0.GetSpineSkel(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0, var_12_1 = HXSet.autoHxShiftPath("char/" .. arg_12_1, arg_12_1)
	local var_12_2 = var_12_1 .. "_SkeletonData"

	arg_12_0:LoadAsset(var_12_0, "", typeof(Object), arg_12_2, function(arg_13_0)
		arg_12_3(arg_13_0)
	end, true)
end

function var_0_0.IsSpineSkelCached(arg_14_0, arg_14_1)
	local var_14_0 = "char/" .. arg_14_1

	return arg_14_0.pools_plural[var_14_0] ~= nil
end

local var_0_6 = {
	"ResPanel",
	"WorldResPanel"
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

function var_0_0.GetUI(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = "ui/" .. arg_15_1
	local var_15_1 = table.contains(var_0_6, arg_15_1) and 3 or 1

	arg_15_0:FromPlural(var_15_0, "", arg_15_2, var_15_1, arg_15_3)
end

function var_0_0.ReturnUI(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = "ui/" .. arg_16_1

	if IsNil(arg_16_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_16_1))
	elseif arg_16_0.pools_plural[var_16_0] then
		if table.indexof(var_0_6, arg_16_1) then
			arg_16_2.transform:SetParent(arg_16_0.root, false)
		end

		if table.indexof(var_0_7, arg_16_1) or arg_16_0.ui_tempCache[arg_16_1] then
			setActiveViaLayer(arg_16_2.transform, false)
			arg_16_0.pools_plural[var_16_0]:Enqueue(arg_16_2)
		else
			arg_16_0.pools_plural[var_16_0]:Enqueue(arg_16_2, true)

			if arg_16_0.pools_plural[var_16_0]:AllReturned() and (not arg_16_0.callbacks[var_16_0] or #arg_16_0.callbacks[var_16_0] == 0) then
				arg_16_0.pools_plural[var_16_0]:Clear()

				arg_16_0.pools_plural[var_16_0] = nil
			end
		end
	else
		var_0_4.Destroy(arg_16_2)
	end
end

function var_0_0.HasCacheUI(arg_17_0, arg_17_1)
	local var_17_0 = "ui/" .. arg_17_1

	return arg_17_0.pools_plural[var_17_0] ~= nil
end

function var_0_0.PreloadUI(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {}
	local var_18_1 = "ui/" .. arg_18_1

	if not arg_18_0.pools_plural[var_18_1] then
		table.insert(var_18_0, function(arg_19_0)
			arg_18_0:GetUI(arg_18_1, true, function(arg_20_0)
				setActive(arg_20_0, false)
				arg_18_0.pools_plural[var_18_1]:Enqueue(arg_20_0)
				arg_19_0()
			end)
		end)
	end

	seriesAsync(var_18_0, arg_18_2)
end

function var_0_0.AddTempCache(arg_21_0, arg_21_1)
	arg_21_0.ui_tempCache[arg_21_1] = true
end

function var_0_0.DelTempCache(arg_22_0, arg_22_1)
	arg_22_0.ui_tempCache[arg_22_1] = nil
end

function var_0_0.ClearAllTempCache(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.ui_tempCache) do
		if iter_23_1 then
			local var_23_0 = "ui/" .. iter_23_0

			if arg_23_0.pools_plural[var_23_0] then
				arg_23_0.pools_plural[var_23_0]:Clear()

				arg_23_0.pools_plural[var_23_0] = nil
			end
		end
	end
end

function var_0_0.PreloadPainting(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = {}
	local var_24_1 = "painting/" .. arg_24_1

	if not arg_24_0.pools_plural[var_24_1] then
		table.insert(var_24_0, function(arg_25_0)
			arg_24_0:GetPainting(arg_24_1, true, function(arg_26_0)
				arg_24_0.pools_plural[var_24_1]:Enqueue(arg_26_0)
				arg_25_0()
			end)
		end)
	end

	seriesAsync(var_24_0, arg_24_2)
end

function var_0_0.GetPainting(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = "painting/" .. arg_27_1
	local var_27_1 = var_27_0

	arg_27_0:FromPlural(var_27_0, "", arg_27_2, 1, function(arg_28_0)
		arg_28_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_27_1) then
			setActive(tf(arg_28_0):Find("face"), true)
		end

		arg_27_3(arg_28_0)
	end)
end

function var_0_0.ReturnPainting(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = "painting/" .. arg_29_1

	if IsNil(arg_29_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_29_1))
	elseif arg_29_0.pools_plural[var_29_0] then
		setActiveViaLayer(arg_29_2, true)

		local var_29_1 = tf(arg_29_2):Find("face")

		if var_29_1 then
			setActive(var_29_1, false)
		end

		arg_29_2:SetActive(false)
		arg_29_2.transform:SetParent(arg_29_0.root, false)
		arg_29_0.pools_plural[var_29_0]:Enqueue(arg_29_2)
		arg_29_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_29_2)
	end
end

function var_0_0.ExcessPainting(arg_30_0, arg_30_1)
	local var_30_0 = 0
	local var_30_1 = 4
	local var_30_2 = {}

	for iter_30_0, iter_30_1 in pairs(arg_30_0.pools_plural) do
		local var_30_3 = string.find(iter_30_0, "painting/")

		if var_30_3 and var_30_3 >= 1 then
			table.insert(var_30_2, iter_30_0)
		end
	end

	if var_30_1 < #var_30_2 then
		table.sort(var_30_2, function(arg_31_0, arg_31_1)
			return arg_30_0.pools_plural[arg_31_0].index > arg_30_0.pools_plural[arg_31_1].index
		end)

		for iter_30_2 = var_30_1 + 1, #var_30_2 do
			local var_30_4 = var_30_2[iter_30_2]

			arg_30_0.pools_plural[var_30_4]:Clear(true)

			arg_30_0.pools_plural[var_30_4] = nil
		end

		arg_30_0.paintingCount = arg_30_0.paintingCount + 1
	end

	if arg_30_1 then
		arg_30_0.paintingCount = 0
	elseif arg_30_0.paintingCount >= 10 then
		arg_30_0.paintingCount = 0

		gcAll(false)
	end
end

function var_0_0.GetPaintingWithPrefix(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4)
	local var_32_0 = arg_32_4 .. arg_32_1
	local var_32_1 = var_32_0

	arg_32_0:FromPlural(var_32_0, "", arg_32_2, 1, function(arg_33_0)
		arg_33_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_32_1) then
			setActive(tf(arg_33_0):Find("face"), true)
		end

		arg_32_3(arg_33_0)
	end)
end

function var_0_0.ReturnPaintingWithPrefix(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	local var_34_0 = arg_34_3 .. arg_34_1

	if IsNil(arg_34_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_34_1))
	elseif arg_34_0.pools_plural[var_34_0] then
		setActiveViaLayer(arg_34_2, true)

		local var_34_1 = tf(arg_34_2):Find("face")

		if var_34_1 then
			setActive(var_34_1, false)
		end

		arg_34_2:SetActive(false)
		arg_34_2.transform:SetParent(arg_34_0.root, false)
		arg_34_0.pools_plural[var_34_0]:Enqueue(arg_34_2)
		arg_34_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_34_2)
	end
end

function var_0_0.GetSprite(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	arg_35_0:FromObjPack(arg_35_1, tostring(arg_35_2), typeof(Sprite), arg_35_3, function(arg_36_0)
		arg_35_4(arg_36_0)
	end)
end

function var_0_0.DecreasSprite(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_1

	if arg_37_0.pools_pack[var_37_0] then
		arg_37_0.pools_pack[var_37_0]:Remove(arg_37_2)

		if arg_37_0.pools_pack[var_37_0]:GetAmount() <= 0 then
			arg_37_0:RemovePoolsPack(var_37_0)
		end
	end
end

function var_0_0.DestroySprite(arg_38_0, arg_38_1)
	arg_38_0:RemovePoolsPack(arg_38_1)
end

function var_0_0.DestroyAllSprite(arg_39_0)
	local var_39_0 = arg_39_0:SpriteMemUsage()
	local var_39_1 = 24

	print("cached sprite size: " .. math.ceil(var_39_0 * 10) / 10 .. "/" .. var_39_1 .. "MB")

	for iter_39_0, iter_39_1 in pairs(arg_39_0.pools_pack) do
		arg_39_0:RemovePoolsPack(iter_39_0)
	end

	var_0_5:unloadUnusedAssetBundles()
end

function var_0_0.DisplayPoolPacks(arg_40_0)
	local var_40_0

	for iter_40_0, iter_40_1 in pairs(arg_40_0.pools_pack) do
		table.insert(var_40_0, iter_40_0)

		for iter_40_2, iter_40_3 in pairs(iter_40_1.items) do
			table.insert(var_40_0, string.format("assetName:%s type:%s", iter_40_2, tostring(iter_40_1.type.FullName)))
		end
	end

	warning(table.concat(var_40_0, "\n"))
end

function var_0_0.SpriteMemUsage(arg_41_0)
	local var_41_0 = 0
	local var_41_1 = 9.5367431640625e-07
	local var_41_2 = typeof(Sprite)

	for iter_41_0, iter_41_1 in pairs(arg_41_0.pools_pack) do
		local var_41_3 = {}

		for iter_41_2, iter_41_3 in pairs(iter_41_1.items) do
			if iter_41_1.typeDic[iter_41_2] == var_41_2 then
				local var_41_4 = iter_41_1.items[iter_41_2].texture
				local var_41_5 = var_41_4.name

				if not var_41_3[var_41_5] then
					local var_41_6 = 4
					local var_41_7 = var_41_4.format

					if var_41_7 == TextureFormat.RGB24 then
						var_41_6 = 3
					elseif var_41_7 == TextureFormat.ARGB4444 or var_41_7 == TextureFormat.RGBA4444 then
						var_41_6 = 2
					elseif var_41_7 == TextureFormat.DXT5 or var_41_7 == TextureFormat.ASTC_4x4 or var_41_7 == TextureFormat.ETC2_RGBA8 then
						var_41_6 = 1
					elseif var_41_7 == TextureFormat.PVRTC_RGB4 or var_41_7 == TextureFormat.PVRTC_RGBA4 or var_41_7 == TextureFormat.ETC_RGB4 or var_41_7 == TextureFormat.ETC2_RGB or var_41_7 == TextureFormat.ASTC_6x6 or var_41_7 == TextureFormat.DXT1 then
						var_41_6 = 0.5
					end

					var_41_0 = var_41_0 + var_41_4.width * var_41_4.height * var_41_6 * var_41_1 / 8
					var_41_3[var_41_5] = true
				end
			end
		end
	end

	return var_41_0
end

local var_0_8 = 64
local var_0_9 = {
	"chapter/",
	"emoji/",
	"world/"
}

function var_0_0.GetPrefab(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4, arg_42_5)
	local var_42_0 = arg_42_1

	arg_42_0:FromPlural(arg_42_1, "", arg_42_3, arg_42_5 or var_0_8, function(arg_43_0)
		if string.find(arg_42_1, "emoji/") == 1 then
			local var_43_0 = arg_43_0:GetComponent(typeof(CriManaEffectUI))

			if var_43_0 then
				var_43_0:Pause(false)
			end
		end

		arg_43_0:SetActive(true)
		tf(arg_43_0):SetParent(arg_42_0.root, false)
		arg_42_4(arg_43_0)
	end)
end

function var_0_0.ReturnPrefab(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	local var_44_0 = arg_44_1

	if IsNil(arg_44_3) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_44_2))
	elseif arg_44_0.pools_plural[var_44_0] then
		if string.find(arg_44_1, "emoji/") == 1 then
			local var_44_1 = arg_44_3:GetComponent(typeof(CriManaEffectUI))

			if var_44_1 then
				var_44_1:Pause(true)
			end
		end

		arg_44_3:SetActive(false)
		arg_44_3.transform:SetParent(arg_44_0.root, false)
		arg_44_0.pools_plural[var_44_0]:Enqueue(arg_44_3)

		if arg_44_4 and arg_44_0.pools_plural[var_44_0].balance <= 0 and (not arg_44_0.callbacks[var_44_0] or #arg_44_0.callbacks[var_44_0] == 0) then
			arg_44_0:DestroyPrefab(arg_44_1, arg_44_2)
		end
	else
		var_0_4.Destroy(arg_44_3)
	end
end

function var_0_0.DestroyPrefab(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = arg_45_1

	if arg_45_0.pools_plural[var_45_0] then
		arg_45_0.pools_plural[var_45_0]:Clear()

		arg_45_0.pools_plural[var_45_0] = nil
	end
end

function var_0_0.DestroyAllPrefab(arg_46_0)
	local var_46_0 = {}

	for iter_46_0, iter_46_1 in pairs(arg_46_0.pools_plural) do
		if _.any(var_0_9, function(arg_47_0)
			return string.find(iter_46_0, arg_47_0) == 1
		end) then
			iter_46_1:Clear()
			table.insert(var_46_0, iter_46_0)
		end
	end

	_.each(var_46_0, function(arg_48_0)
		arg_46_0.pools_plural[arg_48_0] = nil
	end)
end

function var_0_0.DisplayPluralPools(arg_49_0)
	local var_49_0 = ""

	for iter_49_0, iter_49_1 in pairs(arg_49_0.pools_plural) do
		if #var_49_0 > 0 then
			var_49_0 = var_49_0 .. "\n"
		end

		local var_49_1 = _.map({
			iter_49_0,
			"balance",
			iter_49_1.balance,
			"currentItmes",
			#iter_49_1.items
		}, function(arg_50_0)
			return tostring(arg_50_0)
		end)

		var_49_0 = var_49_0 .. " " .. table.concat(var_49_1, " ")
	end

	warning(var_49_0)
end

function var_0_0.GetPluralStatus(arg_51_0, arg_51_1)
	if not arg_51_0.pools_plural[arg_51_1] then
		return "NIL"
	end

	local var_51_0 = arg_51_0.pools_plural[arg_51_1]
	local var_51_1 = _.map({
		arg_51_1,
		"balance",
		var_51_0.balance,
		"currentItmes",
		#var_51_0.items
	}, tostring)

	return table.concat(var_51_1, " ")
end

function var_0_0.FromPlural(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4, arg_52_5)
	local var_52_0 = arg_52_2 == "" and arg_52_1 or arg_52_1 .. "|" .. arg_52_2
	local var_52_1 = {}

	if not arg_52_0.pools_plural[var_52_0] then
		table.insert(var_52_1, function(arg_53_0)
			arg_52_0:LoadAsset(arg_52_1, arg_52_2, typeof(Object), arg_52_3, function(arg_54_0)
				if arg_54_0 == nil then
					Debugger.LogError("can not find asset: " .. arg_52_1 .. " : " .. arg_52_2)

					return
				end

				if not arg_52_0.pools_plural[var_52_0] then
					arg_52_0.pools_plural[var_52_0] = var_0_1.New(arg_54_0, arg_52_4)
				end

				arg_53_0()
			end, true)
		end)
	end

	seriesAsync(var_52_1, function()
		local var_55_0 = arg_52_0.pools_plural[var_52_0]

		var_55_0.index = arg_52_0.pluralIndex
		arg_52_0.pluralIndex = arg_52_0.pluralIndex + 1

		arg_52_5(var_55_0:Dequeue())
	end)
end

function var_0_0.FromObjPack(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4, arg_56_5)
	local var_56_0 = arg_56_1
	local var_56_1 = {}

	if not arg_56_0.pools_pack[var_56_0] then
		table.insert(var_56_1, function(arg_57_0)
			AssetBundleHelper.LoadAssetBundle(arg_56_1, arg_56_4, true, function(arg_58_0)
				arg_56_0:AddPoolsPack(arg_56_1, arg_58_0)
				arg_57_0()
			end)
		end)
	end

	seriesAsync(var_56_1, function()
		arg_56_5(arg_56_0.pools_pack[var_56_0]:Get(arg_56_2, arg_56_3))
	end)
end

function var_0_0.LoadAsset(arg_60_0, arg_60_1, arg_60_2, arg_60_3, arg_60_4, arg_60_5, arg_60_6)
	arg_60_1, arg_60_2 = HXSet.autoHxShiftPath(arg_60_1, arg_60_2)

	local var_60_0 = arg_60_1 .. "|" .. arg_60_2

	if arg_60_0.callbacks[var_60_0] then
		if not arg_60_4 then
			errorMsg("Sync Loading after async operation")
		end

		table.insert(arg_60_0.callbacks[var_60_0], arg_60_5)
	elseif arg_60_4 then
		arg_60_0.callbacks[var_60_0] = {
			arg_60_5
		}

		var_0_5:getAssetAsync(arg_60_1, arg_60_2, arg_60_3, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_61_0)
			if arg_60_0.callbacks[var_60_0] then
				local var_61_0 = arg_60_0.callbacks[var_60_0]

				arg_60_0.callbacks[var_60_0] = nil

				while next(var_61_0) do
					table.remove(var_61_0)(arg_61_0)
				end
			end
		end), arg_60_6, false)
	else
		arg_60_5(var_0_5:getAssetSync(arg_60_1, arg_60_2, arg_60_3, arg_60_6, false))
	end
end

function var_0_0.AddPoolsPack(arg_62_0, arg_62_1, arg_62_2)
	if arg_62_0.pools_pack[arg_62_1] then
		arg_62_2:Dispose()
	else
		arg_62_0.pools_pack[arg_62_1] = var_0_3.New(arg_62_1, arg_62_2)
	end
end

function var_0_0.RemovePoolsPack(arg_63_0, arg_63_1)
	if not arg_63_0.pools_pack[arg_63_1] or arg_63_0.preloadDic[arg_63_1] then
		return
	end

	arg_63_0.pools_pack[arg_63_1]:Clear()

	arg_63_0.pools_pack[arg_63_1] = nil
end

function var_0_0.PrintPools(arg_64_0)
	local var_64_0 = ""

	for iter_64_0, iter_64_1 in pairs(arg_64_0.pools_plural) do
		var_64_0 = var_64_0 .. "\n" .. iter_64_0
	end

	warning(var_64_0)
end

function var_0_0.PrintObjPack(arg_65_0)
	local var_65_0 = {}

	for iter_65_0, iter_65_1 in pairs(arg_65_0.pools_pack) do
		table.insert(var_65_0, iter_65_0)

		for iter_65_2, iter_65_3 in pairs(iter_65_1.items) do
			table.insert(var_65_0, "    :" .. iter_65_2)
		end
	end

	warning(table.concat(var_65_0, "\n"))
end

return var_0_0
