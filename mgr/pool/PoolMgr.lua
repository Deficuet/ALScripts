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

function var_0_0.RegisterUIConst(arg_15_0)
	for iter_15_0, iter_15_1 in ipairs(var_0_7) do
		arg_15_0:KeepUICache(iter_15_1, true)
	end
end

function var_0_0.GetUI(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = "ui/" .. arg_16_1
	local var_16_1 = var_0_6[arg_16_1] or 1

	arg_16_0:FromPlural(var_16_0, "", arg_16_2, var_16_1, arg_16_3)
end

function var_0_0.ReturnUI(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = "ui/" .. arg_17_1

	if IsNil(arg_17_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_17_1))
	elseif arg_17_0.pools_plural[var_17_0] then
		arg_17_2.transform:SetParent(arg_17_0.root, false)
		arg_17_0.pools_plural[var_17_0]:Enqueue(arg_17_2, true)

		if arg_17_0.pools_plural[var_17_0]:AllReturned() and (not arg_17_0.callbacks[var_17_0] or #arg_17_0.callbacks[var_17_0] == 0) then
			arg_17_0.pools_plural[var_17_0]:Clear()

			arg_17_0.pools_plural[var_17_0] = nil
		end
	else
		var_0_4.Destroy(arg_17_2)
	end
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

function var_0_0.KeepUICache(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = "ui/" .. arg_21_1

	arg_21_0.keepDic[var_21_0] = arg_21_2 or nil

	if arg_21_0.pools_plural[var_21_0] then
		arg_21_0.pools_plural[var_21_0]:SetKeep(tobool(arg_21_0.keepDic[var_21_0]))

		if arg_21_0.pools_plural[var_21_0]:AllReturned() and (not arg_21_0.callbacks[var_21_0] or #arg_21_0.callbacks[var_21_0] == 0) then
			arg_21_0.pools_plural[var_21_0]:Clear()

			arg_21_0.pools_plural[var_21_0] = nil
		end
	end
end

function var_0_0.PreloadPainting(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = {}
	local var_22_1 = "painting/" .. arg_22_1

	if not arg_22_0.pools_plural[var_22_1] then
		table.insert(var_22_0, function(arg_23_0)
			arg_22_0:GetPainting(arg_22_1, true, function(arg_24_0)
				arg_22_0.pools_plural[var_22_1]:Enqueue(arg_24_0)
				arg_23_0()
			end)
		end)
	end

	seriesAsync(var_22_0, arg_22_2)
end

function var_0_0.GetPainting(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = "painting/" .. arg_25_1
	local var_25_1 = var_25_0

	arg_25_0:FromPlural(var_25_0, "", arg_25_2, 1, function(arg_26_0)
		arg_26_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_25_1) then
			setActive(tf(arg_26_0):Find("face"), true)
		end

		arg_25_3(arg_26_0)
	end)
end

function var_0_0.ReturnPainting(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = "painting/" .. arg_27_1

	if IsNil(arg_27_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_27_1))
	elseif arg_27_0.pools_plural[var_27_0] then
		setActiveViaLayer(arg_27_2, true)

		local var_27_1 = tf(arg_27_2):Find("face")

		if var_27_1 then
			setActive(var_27_1, false)
		end

		arg_27_2:SetActive(false)
		arg_27_2.transform:SetParent(arg_27_0.root, false)
		arg_27_0.pools_plural[var_27_0]:Enqueue(arg_27_2)
		arg_27_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_27_2)
	end
end

function var_0_0.ExcessPainting(arg_28_0, arg_28_1)
	local var_28_0 = 0
	local var_28_1 = 4
	local var_28_2 = {}

	for iter_28_0, iter_28_1 in pairs(arg_28_0.pools_plural) do
		local var_28_3 = string.find(iter_28_0, "painting/")

		if var_28_3 and var_28_3 >= 1 then
			table.insert(var_28_2, iter_28_0)
		end
	end

	if var_28_1 < #var_28_2 then
		table.sort(var_28_2, function(arg_29_0, arg_29_1)
			return arg_28_0.pools_plural[arg_29_0].index > arg_28_0.pools_plural[arg_29_1].index
		end)

		for iter_28_2 = var_28_1 + 1, #var_28_2 do
			local var_28_4 = var_28_2[iter_28_2]

			arg_28_0.pools_plural[var_28_4]:Clear(true)

			arg_28_0.pools_plural[var_28_4] = nil
		end

		arg_28_0.paintingCount = arg_28_0.paintingCount + 1
	end

	if arg_28_1 then
		arg_28_0.paintingCount = 0
	elseif arg_28_0.paintingCount >= 10 then
		arg_28_0.paintingCount = 0

		gcAll(false)
	end
end

function var_0_0.GetPaintingWithPrefix(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
	local var_30_0 = arg_30_4 .. arg_30_1
	local var_30_1 = var_30_0

	arg_30_0:FromPlural(var_30_0, "", arg_30_2, 1, function(arg_31_0)
		arg_31_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_30_1) then
			setActive(tf(arg_31_0):Find("face"), true)
		end

		arg_30_3(arg_31_0)
	end)
end

function var_0_0.ReturnPaintingWithPrefix(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = arg_32_3 .. arg_32_1

	if IsNil(arg_32_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_32_1))
	elseif arg_32_0.pools_plural[var_32_0] then
		setActiveViaLayer(arg_32_2, true)

		local var_32_1 = tf(arg_32_2):Find("face")

		if var_32_1 then
			setActive(var_32_1, false)
		end

		arg_32_2:SetActive(false)
		arg_32_2.transform:SetParent(arg_32_0.root, false)
		arg_32_0.pools_plural[var_32_0]:Enqueue(arg_32_2)
		arg_32_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_32_2)
	end
end

function var_0_0.GetSprite(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	arg_33_0:FromObjPack(arg_33_1, tostring(arg_33_2), typeof(Sprite), arg_33_3, function(arg_34_0)
		arg_33_4(arg_34_0)
	end)
end

function var_0_0.DecreasSprite(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_1

	if arg_35_0.pools_pack[var_35_0] then
		arg_35_0.pools_pack[var_35_0]:Remove(arg_35_2)

		if arg_35_0.pools_pack[var_35_0]:GetAmount() <= 0 then
			arg_35_0:RemovePoolsPack(var_35_0)
		end
	end
end

function var_0_0.DestroySprite(arg_36_0, arg_36_1)
	arg_36_0:RemovePoolsPack(arg_36_1)
end

function var_0_0.DestroyAllSprite(arg_37_0)
	local var_37_0 = arg_37_0:SpriteMemUsage()
	local var_37_1 = 24

	print("cached sprite size: " .. math.ceil(var_37_0 * 10) / 10 .. "/" .. var_37_1 .. "MB")

	for iter_37_0, iter_37_1 in pairs(arg_37_0.pools_pack) do
		arg_37_0:RemovePoolsPack(iter_37_0)
	end

	var_0_5:unloadUnusedAssetBundles()
end

function var_0_0.DisplayPoolPacks(arg_38_0)
	local var_38_0

	for iter_38_0, iter_38_1 in pairs(arg_38_0.pools_pack) do
		table.insert(var_38_0, iter_38_0)

		for iter_38_2, iter_38_3 in pairs(iter_38_1.items) do
			table.insert(var_38_0, string.format("assetName:%s type:%s", iter_38_2, tostring(iter_38_1.type.FullName)))
		end
	end

	warning(table.concat(var_38_0, "\n"))
end

function var_0_0.SpriteMemUsage(arg_39_0)
	local var_39_0 = 0
	local var_39_1 = 9.5367431640625e-07
	local var_39_2 = typeof(Sprite)

	for iter_39_0, iter_39_1 in pairs(arg_39_0.pools_pack) do
		local var_39_3 = {}

		for iter_39_2, iter_39_3 in pairs(iter_39_1.items) do
			if iter_39_1.typeDic[iter_39_2] == var_39_2 then
				local var_39_4 = iter_39_1.items[iter_39_2].texture
				local var_39_5 = var_39_4.name

				if not var_39_3[var_39_5] then
					local var_39_6 = 4
					local var_39_7 = var_39_4.format

					if var_39_7 == TextureFormat.RGB24 then
						var_39_6 = 3
					elseif var_39_7 == TextureFormat.ARGB4444 or var_39_7 == TextureFormat.RGBA4444 then
						var_39_6 = 2
					elseif var_39_7 == TextureFormat.DXT5 or var_39_7 == TextureFormat.ASTC_4x4 or var_39_7 == TextureFormat.ETC2_RGBA8 then
						var_39_6 = 1
					elseif var_39_7 == TextureFormat.PVRTC_RGB4 or var_39_7 == TextureFormat.PVRTC_RGBA4 or var_39_7 == TextureFormat.ETC_RGB4 or var_39_7 == TextureFormat.ETC2_RGB or var_39_7 == TextureFormat.ASTC_6x6 or var_39_7 == TextureFormat.DXT1 then
						var_39_6 = 0.5
					end

					var_39_0 = var_39_0 + var_39_4.width * var_39_4.height * var_39_6 * var_39_1 / 8
					var_39_3[var_39_5] = true
				end
			end
		end
	end

	return var_39_0
end

local var_0_8 = 64
local var_0_9 = {
	"chapter/",
	"emoji/",
	"world/"
}

function var_0_0.GetPrefab(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4, arg_40_5)
	local var_40_0 = arg_40_1

	arg_40_0:FromPlural(arg_40_1, "", arg_40_3, arg_40_5 or var_0_8, function(arg_41_0)
		if string.find(arg_40_1, "emoji/") == 1 then
			local var_41_0 = arg_41_0:GetComponent(typeof(CriManaEffectUI))

			if var_41_0 then
				var_41_0:Pause(false)
			end
		end

		arg_41_0:SetActive(true)
		tf(arg_41_0):SetParent(arg_40_0.root, false)
		arg_40_4(arg_41_0)
	end)
end

function var_0_0.ReturnPrefab(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4)
	local var_42_0 = arg_42_1

	if IsNil(arg_42_3) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_42_2))
	elseif arg_42_0.pools_plural[var_42_0] then
		if string.find(arg_42_1, "emoji/") == 1 then
			local var_42_1 = arg_42_3:GetComponent(typeof(CriManaEffectUI))

			if var_42_1 then
				var_42_1:Pause(true)
			end
		end

		arg_42_3:SetActive(false)
		arg_42_3.transform:SetParent(arg_42_0.root, false)
		arg_42_0.pools_plural[var_42_0]:Enqueue(arg_42_3)

		if arg_42_4 and arg_42_0.pools_plural[var_42_0].balance <= 0 and (not arg_42_0.callbacks[var_42_0] or #arg_42_0.callbacks[var_42_0] == 0) then
			arg_42_0:DestroyPrefab(arg_42_1, arg_42_2)
		end
	else
		var_0_4.Destroy(arg_42_3)
	end
end

function var_0_0.DestroyPrefab(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_1

	if arg_43_0.pools_plural[var_43_0] then
		arg_43_0.pools_plural[var_43_0]:Clear()

		arg_43_0.pools_plural[var_43_0] = nil
	end
end

function var_0_0.DestroyAllPrefab(arg_44_0)
	local var_44_0 = {}

	for iter_44_0, iter_44_1 in pairs(arg_44_0.pools_plural) do
		if _.any(var_0_9, function(arg_45_0)
			return string.find(iter_44_0, arg_45_0) == 1
		end) then
			iter_44_1:Clear()
			table.insert(var_44_0, iter_44_0)
		end
	end

	_.each(var_44_0, function(arg_46_0)
		arg_44_0.pools_plural[arg_46_0] = nil
	end)
end

function var_0_0.DisplayPluralPools(arg_47_0)
	local var_47_0 = ""

	for iter_47_0, iter_47_1 in pairs(arg_47_0.pools_plural) do
		if #var_47_0 > 0 then
			var_47_0 = var_47_0 .. "\n"
		end

		local var_47_1 = _.map({
			iter_47_0,
			"balance",
			iter_47_1.balance,
			"currentItmes",
			#iter_47_1.items
		}, function(arg_48_0)
			return tostring(arg_48_0)
		end)

		var_47_0 = var_47_0 .. " " .. table.concat(var_47_1, " ")
	end

	warning(var_47_0)
end

function var_0_0.GetPluralStatus(arg_49_0, arg_49_1)
	if not arg_49_0.pools_plural[arg_49_1] then
		return "NIL"
	end

	local var_49_0 = arg_49_0.pools_plural[arg_49_1]
	local var_49_1 = _.map({
		arg_49_1,
		"balance",
		var_49_0.balance,
		"currentItmes",
		#var_49_0.items
	}, tostring)

	return table.concat(var_49_1, " ")
end

function var_0_0.FromPlural(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4, arg_50_5)
	local var_50_0 = arg_50_2 == "" and arg_50_1 or arg_50_1 .. "|" .. arg_50_2
	local var_50_1 = {}

	if not arg_50_0.pools_plural[var_50_0] then
		table.insert(var_50_1, function(arg_51_0)
			arg_50_0:LoadAsset(arg_50_1, arg_50_2, typeof(Object), arg_50_3, function(arg_52_0)
				if arg_52_0 == nil then
					Debugger.LogError("can not find asset: " .. arg_50_1 .. " : " .. arg_50_2)

					return
				end

				if not arg_50_0.pools_plural[var_50_0] then
					arg_50_0.pools_plural[var_50_0] = var_0_1.New(arg_52_0, arg_50_4)

					arg_50_0.pools_plural[var_50_0]:SetKeep(tobool(arg_50_0.keepDic[var_50_0]))
				end

				arg_51_0()
			end, true)
		end)
	end

	seriesAsync(var_50_1, function()
		local var_53_0 = arg_50_0.pools_plural[var_50_0]

		var_53_0.index = arg_50_0.pluralIndex
		arg_50_0.pluralIndex = arg_50_0.pluralIndex + 1

		arg_50_5(var_53_0:Dequeue())
	end)
end

function var_0_0.FromObjPack(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4, arg_54_5)
	local var_54_0 = arg_54_1
	local var_54_1 = {}

	if not arg_54_0.pools_pack[var_54_0] then
		table.insert(var_54_1, function(arg_55_0)
			AssetBundleHelper.LoadAssetBundle(arg_54_1, arg_54_4, true, function(arg_56_0)
				arg_54_0:AddPoolsPack(arg_54_1, arg_56_0)
				arg_55_0()
			end)
		end)
	end

	seriesAsync(var_54_1, function()
		arg_54_5(arg_54_0.pools_pack[var_54_0]:Get(arg_54_2, arg_54_3))
	end)
end

function var_0_0.LoadAsset(arg_58_0, arg_58_1, arg_58_2, arg_58_3, arg_58_4, arg_58_5, arg_58_6)
	arg_58_1, arg_58_2 = HXSet.autoHxShiftPath(arg_58_1, arg_58_2)

	local var_58_0 = arg_58_1 .. "|" .. arg_58_2

	if arg_58_0.callbacks[var_58_0] then
		if not arg_58_4 then
			errorMsg("Sync Loading after async operation")
		end

		table.insert(arg_58_0.callbacks[var_58_0], arg_58_5)
	elseif arg_58_4 then
		arg_58_0.callbacks[var_58_0] = {
			arg_58_5
		}

		var_0_5:getAssetAsync(arg_58_1, arg_58_2, arg_58_3, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_59_0)
			if arg_58_0.callbacks[var_58_0] then
				local var_59_0 = arg_58_0.callbacks[var_58_0]

				arg_58_0.callbacks[var_58_0] = nil

				while next(var_59_0) do
					table.remove(var_59_0)(arg_59_0)
				end
			end
		end), arg_58_6, false)
	else
		arg_58_5(var_0_5:getAssetSync(arg_58_1, arg_58_2, arg_58_3, arg_58_6, false))
	end
end

function var_0_0.AddPoolsPack(arg_60_0, arg_60_1, arg_60_2)
	if arg_60_0.pools_pack[arg_60_1] then
		arg_60_2:Dispose()
	else
		arg_60_0.pools_pack[arg_60_1] = var_0_3.New(arg_60_1, arg_60_2)
	end
end

function var_0_0.RemovePoolsPack(arg_61_0, arg_61_1)
	if not arg_61_0.pools_pack[arg_61_1] or arg_61_0.preloadDic[arg_61_1] then
		return
	end

	arg_61_0.pools_pack[arg_61_1]:Clear()

	arg_61_0.pools_pack[arg_61_1] = nil
end

function var_0_0.PrintPools(arg_62_0)
	local var_62_0 = ""

	for iter_62_0, iter_62_1 in pairs(arg_62_0.pools_plural) do
		var_62_0 = var_62_0 .. "\n" .. iter_62_0
	end

	warning(var_62_0)
end

function var_0_0.PrintObjPack(arg_63_0)
	local var_63_0 = {}

	for iter_63_0, iter_63_1 in pairs(arg_63_0.pools_pack) do
		table.insert(var_63_0, iter_63_0)

		for iter_63_2, iter_63_3 in pairs(iter_63_1.items) do
			table.insert(var_63_0, "    :" .. iter_63_2)
		end
	end

	warning(table.concat(var_63_0, "\n"))
end

return var_0_0
