local var_0_0 = UnityEngine

function flog(arg_1_0, arg_1_1)
	if arg_1_0 and arg_1_1 and pg.ConnectionMgr.GetInstance():isConnected() then
		pg.m02:sendNotification(GAME.SEND_CMD, {
			cmd = "log",
			arg1 = arg_1_0,
			arg2 = arg_1_1
		})
	end
end

function throttle(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0
	local var_2_1
	local var_2_2
	local var_2_3 = 0

	local function var_2_4()
		var_2_3 = arg_2_2 and Time.unscaledTime or 0
		var_2_0 = nil
		var_2_2 = arg_2_0(unpackEx(var_2_1))

		if not var_2_0 then
			var_2_1 = nil
		end
	end

	return function(...)
		local var_4_0 = Time.unscaledTime

		if not var_2_3 and not arg_2_2 then
			var_2_3 = var_4_0
		end

		local var_4_1 = arg_2_1 - (var_4_0 - var_2_3)

		var_2_1 = packEx(...)

		if var_4_1 <= 0 or var_4_1 > arg_2_1 then
			if var_2_0 then
				var_2_0:Stop()

				var_2_0 = nil
			end

			var_2_3 = var_4_0
			var_2_2 = arg_2_0(unpackEx(var_2_1))

			if not var_2_0 then
				var_2_1 = nil
			end
		elseif not var_2_0 and arg_2_2 then
			var_2_0 = Timer.New(var_2_4, var_4_1, 1)

			var_2_0:Start()
		end

		return var_2_2
	end
end

function debounce(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0
	local var_5_1
	local var_5_2
	local var_5_3
	local var_5_4

	local function var_5_5()
		local var_6_0 = Time.unscaledTime - var_5_2

		if var_6_0 < arg_5_1 and var_6_0 > 0 then
			var_5_0 = Timer.New(var_5_5, arg_5_1 - var_6_0, 1)

			var_5_0:Start()
		else
			var_5_0 = nil

			if not arg_5_2 then
				var_5_3 = arg_5_0(unpackEx(var_5_1))

				if not var_5_0 then
					var_5_1 = nil
				end
			else
				arg_5_2 = false
			end
		end
	end

	return function(...)
		var_5_1 = packEx(...)
		var_5_2 = Time.unscaledTime

		local var_7_0 = arg_5_2 and not var_5_0

		if not var_5_0 then
			var_5_0 = Timer.New(var_5_5, arg_5_1, 1)

			var_5_0:Start()
		end

		if var_7_0 then
			var_5_3 = arg_5_0(unpackEx(var_5_1))
			var_5_1 = nil
		end

		return var_5_3
	end
end

function createLog(arg_8_0, arg_8_1)
	if LOG and arg_8_1 then
		return function(...)
			print(arg_8_0 .. ": ", ...)
		end
	else
		print(arg_8_0 .. ": log disabled")

		return function()
			return
		end
	end
end

function getProxy(arg_11_0)
	assert(pg.m02, "game is not started")

	return pg.m02:retrieveProxy(arg_11_0.__cname)
end

function LoadAndInstantiateAsync(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	arg_12_4 = defaultValue(arg_12_4, true)
	arg_12_3 = defaultValue(arg_12_3, true)
	arg_12_0, arg_12_1 = HXSet.autoHxShift(arg_12_0 .. "/", arg_12_1)

	ResourceMgr.Inst:getAssetAsync(arg_12_0 .. arg_12_1, "", var_0_0.Events.UnityAction_UnityEngine_Object(function(arg_13_0)
		local var_13_0 = Instantiate(arg_13_0)

		arg_12_2(var_13_0)
	end), arg_12_3, arg_12_4)
end

function LoadAndInstantiateSync(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_3 = defaultValue(arg_14_3, true)
	arg_14_2 = defaultValue(arg_14_2, true)
	arg_14_0, arg_14_1 = HXSet.autoHxShift(arg_14_0 .. "/", arg_14_1)

	local var_14_0 = ResourceMgr.Inst:getAssetSync(arg_14_0 .. arg_14_1, "", arg_14_2, arg_14_3)

	return (Instantiate(var_14_0))
end

local var_0_1 = {}

function LoadSprite(arg_15_0, arg_15_1)
	return LoadAny(arg_15_0, arg_15_1, typeof(Sprite))
end

function LoadSpriteAtlasAsync(arg_16_0, arg_16_1, arg_16_2)
	LoadAnyAsync(arg_16_0, arg_16_1, typeof(Sprite), arg_16_2)
end

function LoadSpriteAsync(arg_17_0, arg_17_1)
	LoadSpriteAtlasAsync(arg_17_0, "", arg_17_1)
end

function LoadAny(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0, arg_18_1 = HXSet.autoHxShiftPath(arg_18_0, arg_18_1)

	return AssetBundleHelper.LoadAsset(arg_18_0, arg_18_1, arg_18_2, false, nil, true)
end

function LoadAnyAsync(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_0, arg_19_1 = HXSet.autoHxShiftPath(arg_19_0, arg_19_1)

	AssetBundleHelper.LoadAsset(arg_19_0, arg_19_1, arg_19_2, true, arg_19_3, true)
end

function LoadImageSpriteAtlasAsync(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = arg_20_2:GetComponent(typeof(Image))

	var_20_0.enabled = false
	var_0_1[var_20_0] = arg_20_0

	LoadSpriteAtlasAsync(arg_20_0, arg_20_1, function(arg_21_0)
		if not IsNil(var_20_0) and var_0_1[var_20_0] == arg_20_0 then
			var_0_1[var_20_0] = nil
			var_20_0.enabled = true
			var_20_0.sprite = arg_21_0

			if arg_20_3 then
				var_20_0:SetNativeSize()
			end
		end
	end)
end

function LoadImageSpriteAsync(arg_22_0, arg_22_1, arg_22_2)
	LoadImageSpriteAtlasAsync(arg_22_0, nil, arg_22_1, arg_22_2)
end

function GetSpriteFromAtlas(arg_23_0, arg_23_1)
	local var_23_0

	arg_23_0, arg_23_1 = HXSet.autoHxShiftPath(arg_23_0, arg_23_1)

	PoolMgr.GetInstance():GetSprite(arg_23_0, arg_23_1, false, function(arg_24_0)
		var_23_0 = arg_24_0
	end)

	return var_23_0
end

function GetSpriteFromAtlasAsync(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0, arg_25_1 = HXSet.autoHxShiftPath(arg_25_0, arg_25_1)

	PoolMgr.GetInstance():GetSprite(arg_25_0, arg_25_1, true, function(arg_26_0)
		arg_25_2(arg_26_0)
	end)
end

function GetImageSpriteFromAtlasAsync(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	arg_27_0, arg_27_1 = HXSet.autoHxShiftPath(arg_27_0, arg_27_1)

	local var_27_0 = arg_27_2:GetComponent(typeof(Image))

	var_27_0.enabled = false
	var_0_1[var_27_0] = arg_27_0 .. arg_27_1

	GetSpriteFromAtlasAsync(arg_27_0, arg_27_1, function(arg_28_0)
		if not IsNil(var_27_0) and var_0_1[var_27_0] == arg_27_0 .. arg_27_1 then
			var_0_1[var_27_0] = nil
			var_27_0.enabled = true
			var_27_0.sprite = arg_28_0

			if arg_27_3 then
				var_27_0:SetNativeSize()
			end
		end
	end)
end

function SetAction(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = GetComponent(arg_29_0, "SkeletonGraphic").AnimationState

	var_29_0:SetAnimation(0, arg_29_1, defaultValue(arg_29_2, true))
	var_29_0:Update(Time.deltaTime)
end

function SetActionCallback(arg_30_0, arg_30_1)
	GetOrAddComponent(arg_30_0, typeof(SpineAnimUI)):SetActionCallBack(arg_30_1)
end

function emojiText(arg_31_0, arg_31_1)
	local var_31_0 = GetComponent(arg_31_0, "TextMesh")
	local var_31_1 = GetComponent(arg_31_0, "MeshRenderer")
	local var_31_2 = Shader.Find("UI/Unlit/Transparent")
	local var_31_3 = var_31_1.materials
	local var_31_4 = {
		var_31_3[0]
	}
	local var_31_5 = {}
	local var_31_6 = 0
	local var_31_7 = {}
	local var_31_8 = string.gsub(arg_31_1, "#(%d+)#", function(arg_32_0)
		if not var_31_5[arg_32_0] then
			var_31_6 = var_31_6 + 1
			var_31_7["emoji" .. arg_32_0] = Material.New(var_31_2)

			table.insert(var_31_4, mat)

			var_31_5[arg_32_0] = var_31_6

			local var_32_0 = var_31_6
		end

		return "<quad material=" .. var_31_6 .. " />"
	end)
	local var_31_9 = AssetBundleHelper.LoadManyAssets("emojis", underscore.keys(var_31_7), nil, false, nil, true)

	for iter_31_0, iter_31_1 in pairs(var_31_7) do
		iter_31_1.mainTexture = var_31_9[iter_31_0]
	end

	var_31_0.text = var_31_8
	var_31_1.materials = var_31_4
end

function setPaintingImg(arg_33_0, arg_33_1)
	local var_33_0 = LoadSprite("painting/" .. arg_33_1) or LoadSprite("painting/unknown")

	setImageSprite(arg_33_0, var_33_0)
	resetAspectRatio(arg_33_0)
end

function setPaintingPrefab(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	local var_34_0 = findTF(arg_34_0, "fitter")

	assert(var_34_0, "请添加子物体fitter")
	removeAllChildren(var_34_0)

	local var_34_1 = GetOrAddComponent(var_34_0, "PaintingScaler")

	var_34_1.FrameName = arg_34_2 or ""
	var_34_1.Tween = 1

	local var_34_2 = arg_34_1

	if not arg_34_3 and checkABExist("painting/" .. arg_34_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_34_1, 0) ~= 0 then
		arg_34_1 = arg_34_1 .. "_n"
	end

	PoolMgr.GetInstance():GetPainting(arg_34_1, false, function(arg_35_0)
		setParent(arg_35_0, var_34_0, false)

		local var_35_0 = findTF(arg_35_0, "Touch")

		if not IsNil(var_35_0) then
			setActive(var_35_0, false)
		end

		local var_35_1 = findTF(arg_35_0, "hx")

		if not IsNil(var_35_1) then
			setActive(var_35_1, HXSet.isHx())
		end

		ShipExpressionHelper.SetExpression(var_34_0:GetChild(0), var_34_2)
	end)
	PaintingShiftTransform(var_34_0, arg_34_2, arg_34_4)
end

local var_0_2 = {}

function setPaintingPrefabAsync(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	local var_36_0 = arg_36_1

	if checkABExist("painting/" .. arg_36_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_36_1, 0) ~= 0 then
		arg_36_1 = arg_36_1 .. "_n"
	end

	LoadPaintingPrefabAsync(arg_36_0, var_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
end

function LoadPaintingPrefabAsync(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4, arg_37_5)
	local var_37_0 = findTF(arg_37_0, "fitter")

	assert(var_37_0, "请添加子物体fitter")
	removeAllChildren(var_37_0)

	local var_37_1 = GetOrAddComponent(var_37_0, "PaintingScaler")

	var_37_1.FrameName = arg_37_3 or ""
	var_37_1.Tween = 1
	var_0_2[arg_37_0] = arg_37_2

	PoolMgr.GetInstance():GetPainting(arg_37_2, true, function(arg_38_0)
		if IsNil(arg_37_0) or var_0_2[arg_37_0] ~= arg_37_2 then
			PoolMgr.GetInstance():ReturnPainting(arg_37_2, arg_38_0)

			return
		else
			setParent(arg_38_0, var_37_0, false)

			var_0_2[arg_37_0] = nil

			ShipExpressionHelper.SetExpression(arg_38_0, arg_37_1)
		end

		local var_38_0 = findTF(arg_38_0, "Touch")

		if not IsNil(var_38_0) then
			setActive(var_38_0, false)
		end

		local var_38_1 = findTF(arg_38_0, "Drag")

		if not IsNil(var_38_1) then
			setActive(var_38_1, false)
		end

		local var_38_2 = findTF(arg_38_0, "hx")

		if not IsNil(var_38_2) then
			setActive(var_38_2, HXSet.isHx())
		end

		if arg_37_4 then
			arg_37_4()
		end
	end)
	PaintingShiftTransform(var_37_0, arg_37_3, arg_37_5)
end

local var_0_3 = {
	pifu = "skin_card_shift",
	biandui = "formation_shift"
}

function PaintingShiftTransform(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0.parent:GetComponent(typeof(RectTransform))
	local var_39_1 = var_0_3[arg_39_1]

	if var_39_1 ~= nil and arg_39_2 ~= nil then
		local var_39_2 = pg.ship_skin_newmainui_shift[arg_39_2.skinID]

		if var_39_2 then
			local var_39_3 = var_39_2[var_39_1]

			var_39_0.localEulerAngles = Vector3(0, 0, var_39_3[5] and var_39_3[5] or 0)

			return
		end
	end

	var_39_0.localEulerAngles = Vector3(0, 0, 0)
end

function retPaintingPrefab(arg_40_0, arg_40_1, arg_40_2)
	if arg_40_0 and arg_40_1 then
		local var_40_0 = findTF(arg_40_0, "fitter")

		if var_40_0 and var_40_0.childCount > 0 then
			local var_40_1 = var_40_0:GetChild(0)

			if not IsNil(var_40_1) then
				local var_40_2 = findTF(var_40_1, "Touch")

				if not IsNil(var_40_2) then
					eachChild(var_40_2, function(arg_41_0)
						local var_41_0 = arg_41_0:GetComponent(typeof(Button))

						if not IsNil(var_41_0) then
							removeOnButton(arg_41_0)
						end
					end)
				end

				if not arg_40_2 then
					PoolMgr.GetInstance():ReturnPainting(string.gsub(var_40_1.name, "%(Clone%)", ""), var_40_1.gameObject)
				else
					PoolMgr.GetInstance():ReturnPaintingWithPrefix(string.gsub(var_40_1.name, "%(Clone%)", ""), var_40_1.gameObject, arg_40_2)
				end
			end
		end

		var_0_2[arg_40_0] = nil
	end
end

function checkPaintingPrefab(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4)
	local var_42_0 = findTF(arg_42_0, "fitter")

	assert(var_42_0, "请添加子物体fitter")
	removeAllChildren(var_42_0)

	local var_42_1 = GetOrAddComponent(var_42_0, "PaintingScaler")

	var_42_1.FrameName = arg_42_2 or ""
	var_42_1.Tween = 1

	local var_42_2 = arg_42_4 or "painting/"
	local var_42_3 = arg_42_1

	if not arg_42_3 and checkABExist(var_42_2 .. arg_42_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_42_1, 0) ~= 0 then
		arg_42_1 = arg_42_1 .. "_n"
	end

	return var_42_0, arg_42_1, var_42_3
end

function onLoadedPaintingPrefab(arg_43_0)
	local var_43_0 = arg_43_0.paintingTF
	local var_43_1 = arg_43_0.fitterTF
	local var_43_2 = arg_43_0.defaultPaintingName

	setParent(var_43_0, var_43_1, false)

	local var_43_3 = findTF(var_43_0, "Touch")

	if not IsNil(var_43_3) then
		setActive(var_43_3, false)
	end

	local var_43_4 = findTF(var_43_0, "hx")

	if not IsNil(var_43_4) then
		setActive(var_43_4, HXSet.isHx())
	end

	ShipExpressionHelper.SetExpression(var_43_1:GetChild(0), var_43_2)
end

function onLoadedPaintingPrefabAsync(arg_44_0)
	local var_44_0 = arg_44_0.paintingTF
	local var_44_1 = arg_44_0.fitterTF
	local var_44_2 = arg_44_0.objectOrTransform
	local var_44_3 = arg_44_0.paintingName
	local var_44_4 = arg_44_0.defaultPaintingName
	local var_44_5 = arg_44_0.callback

	if IsNil(var_44_2) or var_0_2[var_44_2] ~= var_44_3 then
		PoolMgr.GetInstance():ReturnPainting(var_44_3, var_44_0)

		return
	else
		setParent(var_44_0, var_44_1, false)

		var_0_2[var_44_2] = nil

		ShipExpressionHelper.SetExpression(var_44_0, var_44_4)
	end

	local var_44_6 = findTF(var_44_0, "Touch")

	if not IsNil(var_44_6) then
		setActive(var_44_6, false)
	end

	local var_44_7 = findTF(var_44_0, "hx")

	if not IsNil(var_44_7) then
		setActive(var_44_7, HXSet.isHx())
	end

	if var_44_5 then
		var_44_5()
	end
end

function setCommanderPaintingPrefab(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0, var_45_1, var_45_2 = checkPaintingPrefab(arg_45_0, arg_45_1, arg_45_2, arg_45_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_45_1, false, function(arg_46_0)
		local var_46_0 = {
			paintingTF = arg_46_0,
			fitterTF = var_45_0,
			defaultPaintingName = var_45_2
		}

		onLoadedPaintingPrefab(var_46_0)
	end, "commanderpainting/")
end

function setCommanderPaintingPrefabAsync(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	local var_47_0, var_47_1, var_47_2 = checkPaintingPrefab(arg_47_0, arg_47_1, arg_47_2, arg_47_4)

	var_0_2[arg_47_0] = var_47_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_47_1, true, function(arg_48_0)
		local var_48_0 = {
			paintingTF = arg_48_0,
			fitterTF = var_47_0,
			objectOrTransform = arg_47_0,
			paintingName = var_47_1,
			defaultPaintingName = var_47_2,
			callback = arg_47_3
		}

		onLoadedPaintingPrefabAsync(var_48_0)
	end, "commanderpainting/")
end

function retCommanderPaintingPrefab(arg_49_0, arg_49_1)
	retPaintingPrefab(arg_49_0, arg_49_1, "commanderpainting/")
end

function setMetaPaintingPrefab(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	local var_50_0, var_50_1, var_50_2 = checkPaintingPrefab(arg_50_0, arg_50_1, arg_50_2, arg_50_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_50_1, false, function(arg_51_0)
		local var_51_0 = {
			paintingTF = arg_51_0,
			fitterTF = var_50_0,
			defaultPaintingName = var_50_2
		}

		onLoadedPaintingPrefab(var_51_0)
	end, "metapainting/")
end

function setMetaPaintingPrefabAsync(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4)
	local var_52_0, var_52_1, var_52_2 = checkPaintingPrefab(arg_52_0, arg_52_1, arg_52_2, arg_52_4)

	var_0_2[arg_52_0] = var_52_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_52_1, true, function(arg_53_0)
		local var_53_0 = {
			paintingTF = arg_53_0,
			fitterTF = var_52_0,
			objectOrTransform = arg_52_0,
			paintingName = var_52_1,
			defaultPaintingName = var_52_2,
			callback = arg_52_3
		}

		onLoadedPaintingPrefabAsync(var_53_0)
	end, "metapainting/")
end

function retMetaPaintingPrefab(arg_54_0, arg_54_1)
	retPaintingPrefab(arg_54_0, arg_54_1, "metapainting/")
end

function setGuildPaintingPrefab(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	local var_55_0, var_55_1, var_55_2 = checkPaintingPrefab(arg_55_0, arg_55_1, arg_55_2, arg_55_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_55_1, false, function(arg_56_0)
		local var_56_0 = {
			paintingTF = arg_56_0,
			fitterTF = var_55_0,
			defaultPaintingName = var_55_2
		}

		onLoadedPaintingPrefab(var_56_0)
	end, "guildpainting/")
end

function setGuildPaintingPrefabAsync(arg_57_0, arg_57_1, arg_57_2, arg_57_3, arg_57_4)
	local var_57_0, var_57_1, var_57_2 = checkPaintingPrefab(arg_57_0, arg_57_1, arg_57_2, arg_57_4)

	var_0_2[arg_57_0] = var_57_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_57_1, true, function(arg_58_0)
		local var_58_0 = {
			paintingTF = arg_58_0,
			fitterTF = var_57_0,
			objectOrTransform = arg_57_0,
			paintingName = var_57_1,
			defaultPaintingName = var_57_2,
			callback = arg_57_3
		}

		onLoadedPaintingPrefabAsync(var_58_0)
	end, "guildpainting/")
end

function retGuildPaintingPrefab(arg_59_0, arg_59_1)
	retPaintingPrefab(arg_59_0, arg_59_1, "guildpainting/")
end

function setShopPaintingPrefab(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	local var_60_0, var_60_1, var_60_2 = checkPaintingPrefab(arg_60_0, arg_60_1, arg_60_2, arg_60_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_60_1, false, function(arg_61_0)
		local var_61_0 = {
			paintingTF = arg_61_0,
			fitterTF = var_60_0,
			defaultPaintingName = var_60_2
		}

		onLoadedPaintingPrefab(var_61_0)
	end, "shoppainting/")
end

function retShopPaintingPrefab(arg_62_0, arg_62_1)
	retPaintingPrefab(arg_62_0, arg_62_1, "shoppainting/")
end

function setBuildPaintingPrefabAsync(arg_63_0, arg_63_1, arg_63_2, arg_63_3, arg_63_4)
	local var_63_0, var_63_1, var_63_2 = checkPaintingPrefab(arg_63_0, arg_63_1, arg_63_2, arg_63_4)

	var_0_2[arg_63_0] = var_63_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_63_1, true, function(arg_64_0)
		local var_64_0 = {
			paintingTF = arg_64_0,
			fitterTF = var_63_0,
			objectOrTransform = arg_63_0,
			paintingName = var_63_1,
			defaultPaintingName = var_63_2,
			callback = arg_63_3
		}

		onLoadedPaintingPrefabAsync(var_64_0)
	end, "buildpainting/")
end

function retBuildPaintingPrefab(arg_65_0, arg_65_1)
	retPaintingPrefab(arg_65_0, arg_65_1, "buildpainting/")
end

function setColorCount(arg_66_0, arg_66_1, arg_66_2)
	setText(arg_66_0, string.format(arg_66_1 < arg_66_2 and "<color=" .. COLOR_RED .. ">%d</color>/%d" or "%d/%d", arg_66_1, arg_66_2))
end

function customColorCount(arg_67_0, arg_67_1, arg_67_2, arg_67_3, arg_67_4)
	arg_67_0.text = _customColorCount(arg_67_1, arg_67_2, arg_67_3, arg_67_4)
end

function _customColorCount(arg_68_0, arg_68_1, arg_68_2, arg_68_3)
	local var_68_0 = arg_68_0 < arg_68_1 and arg_68_3 or arg_68_2

	return string.format("<color=" .. var_68_0 .. ">%d</color>/%d" or "%d/%d", arg_68_0, arg_68_1)
end

function setColorStr(arg_69_0, arg_69_1)
	return "<color=" .. arg_69_1 .. ">" .. arg_69_0 .. "</color>"
end

function setSizeStr(arg_70_0, arg_70_1)
	local var_70_0, var_70_1 = string.gsub(arg_70_0, "[<]size=%d+[>]", "<size=" .. arg_70_1 .. ">")

	if var_70_1 == 0 then
		var_70_0 = "<size=" .. arg_70_1 .. ">" .. var_70_0 .. "</size>"
	end

	return var_70_0
end

function getBgm(arg_71_0, arg_71_1)
	local var_71_0 = pg.voice_bgm[arg_71_0]

	if pg.CriMgr.GetInstance():IsDefaultBGM() then
		return var_71_0 and var_71_0.default_bgm or nil
	elseif var_71_0 then
		if var_71_0.special_bgm and type(var_71_0.special_bgm) == "table" and #var_71_0.special_bgm > 0 and _.all(var_71_0.special_bgm, function(arg_72_0)
			return type(arg_72_0) == "table" and #arg_72_0 > 2 and type(arg_72_0[2]) == "number"
		end) then
			local var_71_1 = Clone(var_71_0.special_bgm)

			table.sort(var_71_1, function(arg_73_0, arg_73_1)
				return arg_73_0[2] > arg_73_1[2]
			end)

			local var_71_2 = ""

			_.each(var_71_1, function(arg_74_0)
				if var_71_2 ~= "" then
					return
				end

				local var_74_0 = arg_74_0[1]
				local var_74_1 = arg_74_0[3]

				switch(var_74_0, {
					function()
						local var_75_0 = var_74_1[1]
						local var_75_1 = var_74_1[2]

						if #var_75_0 == 1 then
							if var_75_0[1] ~= "always" then
								return
							end
						elseif not pg.TimeMgr.GetInstance():inTime(var_75_0) then
							return
						end

						_.each(var_75_1, function(arg_76_0)
							if var_71_2 ~= "" then
								return
							end

							if #arg_76_0 == 2 and pg.TimeMgr.GetInstance():inPeriod(arg_76_0[1]) then
								var_71_2 = arg_76_0[2]
							elseif #arg_76_0 == 3 and pg.TimeMgr.GetInstance():inPeriod(arg_76_0[1], arg_76_0[2]) then
								var_71_2 = arg_76_0[3]
							end
						end)
					end,
					function()
						local var_77_0 = false
						local var_77_1 = ""

						_.each(var_74_1, function(arg_78_0)
							if #arg_78_0 ~= 2 or var_77_0 then
								return
							end

							if pg.NewStoryMgr.GetInstance():IsPlayed(arg_78_0[1]) then
								var_71_2 = arg_78_0[2]

								if var_71_2 ~= "" then
									var_77_1 = var_71_2
								else
									var_71_2 = var_77_1
								end
							else
								var_77_0 = true
							end
						end)
					end,
					function()
						if not arg_71_1 then
							return
						end

						_.each(var_74_1, function(arg_80_0)
							if #arg_80_0 == 2 and arg_80_0[1] == arg_71_1 then
								var_71_2 = arg_80_0[2]

								return
							end
						end)
					end
				})
			end)

			return var_71_2 ~= "" and var_71_2 or var_71_0.bgm
		else
			return var_71_0 and var_71_0.bgm or nil
		end
	else
		return nil
	end
end

function playStory(arg_81_0, arg_81_1)
	pg.NewStoryMgr.GetInstance():Play(arg_81_0, arg_81_1)
end

function errorMessage(arg_82_0)
	local var_82_0 = ERROR_MESSAGE[arg_82_0]

	if var_82_0 == nil then
		var_82_0 = ERROR_MESSAGE[9999] .. ":" .. arg_82_0
	end

	return var_82_0
end

function errorTip(arg_83_0, arg_83_1, ...)
	local var_83_0 = pg.gametip[arg_83_0 .. "_error"]
	local var_83_1

	if var_83_0 then
		var_83_1 = var_83_0.tip
	else
		var_83_1 = pg.gametip.common_error.tip
	end

	local var_83_2 = arg_83_0 .. "_error_" .. arg_83_1

	if pg.gametip[var_83_2] then
		local var_83_3 = i18n(var_83_2, ...)

		return var_83_1 .. var_83_3
	else
		local var_83_4 = "common_error_" .. arg_83_1

		if pg.gametip[var_83_4] then
			local var_83_5 = i18n(var_83_4, ...)

			return var_83_1 .. var_83_5
		else
			local var_83_6 = errorMessage(arg_83_1)

			return var_83_1 .. arg_83_1 .. ":" .. var_83_6
		end
	end
end

function colorNumber(arg_84_0, arg_84_1)
	local var_84_0 = "@COLOR_SCOPE"
	local var_84_1 = {}

	arg_84_0 = string.gsub(arg_84_0, "<color=#%x+>", function(arg_85_0)
		table.insert(var_84_1, arg_85_0)

		return var_84_0
	end)
	arg_84_0 = string.gsub(arg_84_0, "%d+%.?%d*%%*", function(arg_86_0)
		return "<color=" .. arg_84_1 .. ">" .. arg_86_0 .. "</color>"
	end)

	if #var_84_1 > 0 then
		local var_84_2 = 0

		return (string.gsub(arg_84_0, var_84_0, function(arg_87_0)
			var_84_2 = var_84_2 + 1

			return var_84_1[var_84_2]
		end))
	else
		return arg_84_0
	end
end

function getBounds(arg_88_0)
	local var_88_0 = LuaHelper.GetWorldCorners(rtf(arg_88_0))
	local var_88_1 = Bounds.New(var_88_0[0], Vector3.zero)

	var_88_1:Encapsulate(var_88_0[2])

	return var_88_1
end

local function var_0_4(arg_89_0, arg_89_1)
	arg_89_0.localScale = Vector3.one
	arg_89_0.anchorMin = Vector2.zero
	arg_89_0.anchorMax = Vector2.one
	arg_89_0.offsetMin = Vector2(arg_89_1[1], arg_89_1[2])
	arg_89_0.offsetMax = Vector2(-arg_89_1[3], -arg_89_1[4])
end

local var_0_5 = {
	frame4_0 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame5_0 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame4_1 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame_design = {
		-16.5,
		-2.5,
		-3.5,
		-16.5
	},
	frame_skin = {
		-16.5,
		-2.5,
		-3.5,
		-16.5
	},
	frame_npc = {
		-4,
		-4,
		-4,
		-4
	},
	frame_store = {
		-17,
		-3,
		-3,
		-18
	},
	frame_prop = {
		-11,
		-12,
		-14,
		-14
	},
	frame_prop_meta = {
		-11,
		-12,
		-14,
		-14
	},
	frame_battle_ui = {
		-16,
		-3.4,
		-2.6,
		-31
	},
	other = {
		-2.5,
		-4.5,
		-3,
		-4.5
	},
	frame_dorm = {
		-16.5,
		-2.5,
		-3.5,
		-16.5
	}
}
local var_0_6 = {
	["IconColorful(Clone)"] = 1,
	["Item_duang5(Clone)"] = 99,
	specialFrame = 2
}

function setFrame(arg_90_0, arg_90_1, arg_90_2)
	arg_90_1 = tostring(arg_90_1)

	local var_90_0, var_90_1 = unpack((string.split(arg_90_1, "_")))

	if var_90_1 or tonumber(var_90_0) > 5 then
		arg_90_2 = arg_90_2 or "frame" .. arg_90_1
	end

	GetImageSpriteFromAtlasAsync("weaponframes", "frame", arg_90_0)

	local var_90_2 = arg_90_2 and Color.white or Color.NewHex(ItemRarity.Rarity2FrameHexColor(var_90_0 and tonumber(var_90_0) or ItemRarity.Gray))

	setImageColor(arg_90_0, var_90_2)

	local var_90_3 = findTF(arg_90_0, "specialFrame")

	if arg_90_2 then
		if var_90_3 then
			setActive(var_90_3, true)
		else
			var_90_3 = cloneTplTo(arg_90_0, arg_90_0, "specialFrame")

			removeAllChildren(var_90_3)
		end

		var_0_4(var_90_3, var_0_5[arg_90_2] or var_0_5.other)
		GetImageSpriteFromAtlasAsync("weaponframes", arg_90_2, var_90_3)
	elseif var_90_3 then
		setActive(var_90_3, false)
	end
end

function setIconColorful(arg_91_0, arg_91_1, arg_91_2, arg_91_3)
	arg_91_3 = arg_91_3 or {
		[ItemRarity.SSR] = {
			name = "IconColorful",
			active = function(arg_92_0, arg_92_1)
				return not arg_92_1.noIconColorful and arg_92_0 == ItemRarity.SSR
			end
		}
	}

	local var_91_0 = findTF(arg_91_0, "icon_bg/frame")

	for iter_91_0, iter_91_1 in pairs(arg_91_3) do
		local var_91_1 = iter_91_1.name
		local var_91_2 = iter_91_1.active(arg_91_1, arg_91_2)
		local var_91_3 = var_91_0:Find(var_91_1 .. "(Clone)")

		if var_91_3 then
			setActive(var_91_3, var_91_2)
		elseif var_91_2 then
			LoadAndInstantiateAsync("ui", string.lower(var_91_1), function(arg_93_0)
				if IsNil(arg_91_0) or var_91_0:Find(var_91_1 .. "(Clone)") then
					Object.Destroy(arg_93_0)
				else
					local var_93_0 = var_0_6[arg_93_0.name] or 999
					local var_93_1 = underscore.range(var_91_0.childCount):chain():map(function(arg_94_0)
						return var_91_0:GetChild(arg_94_0 - 1)
					end):map(function(arg_95_0)
						return var_0_6[arg_95_0.name] or 0
					end):value()
					local var_93_2 = 0

					for iter_93_0 = #var_93_1, 1, -1 do
						if var_93_0 > var_93_1[iter_93_0] then
							var_93_2 = iter_93_0

							break
						end
					end

					setParent(arg_93_0, var_91_0)
					tf(arg_93_0):SetSiblingIndex(var_93_2)
					setActive(arg_93_0, var_91_2)
				end
			end)
		end
	end
end

function setIconStars(arg_96_0, arg_96_1, arg_96_2)
	local var_96_0 = findTF(arg_96_0, "icon_bg/startpl")
	local var_96_1 = findTF(arg_96_0, "icon_bg/stars")

	if var_96_1 and var_96_0 then
		setActive(var_96_1, false)
		setActive(var_96_0, false)
	end

	if not var_96_1 or not arg_96_1 then
		return
	end

	for iter_96_0 = 1, math.max(arg_96_2, var_96_1.childCount) do
		setActive(iter_96_0 > var_96_1.childCount and cloneTplTo(var_96_0, var_96_1) or var_96_1:GetChild(iter_96_0 - 1), iter_96_0 <= arg_96_2)
	end

	setActive(var_96_1, true)
end

local function var_0_7(arg_97_0, arg_97_1)
	local var_97_0 = findTF(arg_97_0, "icon_bg/slv")

	if not IsNil(var_97_0) then
		setActive(var_97_0, arg_97_1 > 0)
		setText(findTF(var_97_0, "Text"), arg_97_1)
	end
end

function setIconName(arg_98_0, arg_98_1, arg_98_2)
	local var_98_0 = findTF(arg_98_0, "name")

	if not IsNil(var_98_0) then
		setText(var_98_0, arg_98_1)
		setTextAlpha(var_98_0, (arg_98_2.hideName or arg_98_2.anonymous) and 0 or 1)
	end
end

function setIconCount(arg_99_0, arg_99_1)
	local var_99_0 = findTF(arg_99_0, "icon_bg/count")

	if not IsNil(var_99_0) then
		setText(var_99_0, arg_99_1 and (type(arg_99_1) ~= "number" or arg_99_1 > 0) and arg_99_1 or "")
	end
end

function updateEquipment(arg_100_0, arg_100_1, arg_100_2)
	arg_100_2 = arg_100_2 or {}

	assert(arg_100_1, "equipmentVo can not be nil.")

	local var_100_0 = EquipmentRarity.Rarity2Print(arg_100_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_100_0, findTF(arg_100_0, "icon_bg"))
	setFrame(findTF(arg_100_0, "icon_bg/frame"), var_100_0)

	local var_100_1 = findTF(arg_100_0, "icon_bg/icon")

	var_0_4(var_100_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. arg_100_1:getConfig("icon"), "", var_100_1)
	setIconStars(arg_100_0, true, arg_100_1:getConfig("rarity"))
	var_0_7(arg_100_0, arg_100_1:getConfig("level") - 1)
	setIconName(arg_100_0, arg_100_1:getConfig("name"), arg_100_2)
	setIconCount(arg_100_0, arg_100_1.count)
	setIconColorful(arg_100_0, arg_100_1:getConfig("rarity") - 1, arg_100_2)
end

function updateItem(arg_101_0, arg_101_1, arg_101_2)
	arg_101_2 = arg_101_2 or {}

	local var_101_0 = ItemRarity.Rarity2Print(arg_101_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_101_0, findTF(arg_101_0, "icon_bg"))

	local var_101_1

	if arg_101_1:getConfig("type") == 9 then
		var_101_1 = "frame_design"
	elseif arg_101_1:getConfig("type") == 100 then
		var_101_1 = "frame_dorm"
	elseif arg_101_2.frame then
		var_101_1 = arg_101_2.frame
	end

	setFrame(findTF(arg_101_0, "icon_bg/frame"), var_101_0, var_101_1)

	local var_101_2 = findTF(arg_101_0, "icon_bg/icon")
	local var_101_3 = arg_101_1.icon or arg_101_1:getConfig("icon")

	if arg_101_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		assert(arg_101_1.extra, "without extra data")

		var_101_3 = "SquareIcon/" .. ShipGroup.getDefaultSkin(arg_101_1.extra).painting
	end

	GetImageSpriteFromAtlasAsync(var_101_3, "", var_101_2)
	setIconStars(arg_101_0, false)
	setIconName(arg_101_0, arg_101_1:getName(), arg_101_2)
	setIconColorful(arg_101_0, arg_101_1:getConfig("rarity"), arg_101_2)
end

function updateIslandUnlock(arg_102_0, arg_102_1)
	local var_102_0 = arg_102_1:getConfigTable().cmd_icon
	local var_102_1 = IslandItemRarity.Rarity2FrameName(ItemRarity.Gold)

	GetImageSpriteFromAtlasAsync("islandframe", var_102_1, findTF(arg_102_0, "icon_bg"))

	if not IsNil(findTF(arg_102_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("islandframe", var_102_1, findTF(arg_102_0, "icon_bg/frame"))
	end

	setActive(findTF(arg_102_0, "icon_bg/count_bg/count"), false)
	GetImageSpriteFromAtlasAsync(var_102_0, "", findTF(arg_102_0, "icon_bg/icon"))
	setIconName(arg_102_0, "", {})
end

function updateIslandItem(arg_103_0, arg_103_1)
	local var_103_0 = arg_103_1:getConfigTable().rarity
	local var_103_1 = arg_103_1:getConfigTable().icon
	local var_103_2 = arg_103_1:getConfigTable().name
	local var_103_3 = IslandItemRarity.Rarity2FrameName(var_103_0)

	GetImageSpriteFromAtlasAsync("islandframe", var_103_3, findTF(arg_103_0, "icon_bg"))

	if not IsNil(findTF(arg_103_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("islandframe", var_103_3, findTF(arg_103_0, "icon_bg/frame"))
	end

	setActive(findTF(arg_103_0, "icon_bg/count_bg"), arg_103_1.count > 0)
	setText(findTF(arg_103_0, "icon_bg/count_bg/count"), arg_103_1.count)
	GetImageSpriteFromAtlasAsync(var_103_1, "", findTF(arg_103_0, "icon_bg/icon"))
	setIconName(arg_103_0, var_103_2, {})
end

function updateWorldItem(arg_104_0, arg_104_1, arg_104_2)
	arg_104_2 = arg_104_2 or {}

	local var_104_0 = ItemRarity.Rarity2Print(arg_104_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_104_0, findTF(arg_104_0, "icon_bg"))
	setFrame(findTF(arg_104_0, "icon_bg/frame"), var_104_0)

	local var_104_1 = findTF(arg_104_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_104_1.icon or arg_104_1:getConfig("icon"), "", var_104_1)
	setIconStars(arg_104_0, false)
	setIconName(arg_104_0, arg_104_1:getConfig("name"), arg_104_2)
	setIconColorful(arg_104_0, arg_104_1:getConfig("rarity"), arg_104_2)
end

function updateWorldCollection(arg_105_0, arg_105_1, arg_105_2)
	arg_105_2 = arg_105_2 or {}

	assert(arg_105_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_105_1.id)

	local var_105_0 = arg_105_1:getDropRarity()
	local var_105_1 = ItemRarity.Rarity2Print(var_105_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_105_1, findTF(arg_105_0, "icon_bg"))
	setFrame(findTF(arg_105_0, "icon_bg/frame"), var_105_1)

	local var_105_2 = findTF(arg_105_0, "icon_bg/icon")
	local var_105_3 = WorldCollectionProxy.GetCollectionType(arg_105_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_105_3, "", var_105_2)
	setIconStars(arg_105_0, false)
	setIconName(arg_105_0, arg_105_1:getName(), arg_105_2)
	setIconColorful(arg_105_0, var_105_0, arg_105_2)
end

function updateWorldBuff(arg_106_0, arg_106_1, arg_106_2)
	arg_106_2 = arg_106_2 or {}

	local var_106_0 = pg.world_SLGbuff_data[arg_106_1]

	assert(var_106_0, "找不到大世界buff配置: " .. arg_106_1)

	local var_106_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_106_1, findTF(arg_106_0, "icon_bg"))
	setFrame(findTF(arg_106_0, "icon_bg/frame"), var_106_1)

	local var_106_2 = findTF(arg_106_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_106_0.icon, "", var_106_2)

	local var_106_3 = arg_106_0:Find("icon_bg/stars")

	if not IsNil(var_106_3) then
		setActive(var_106_3, false)
	end

	local var_106_4 = findTF(arg_106_0, "name")

	if not IsNil(var_106_4) then
		setText(var_106_4, var_106_0.name)
	end

	local var_106_5 = findTF(arg_106_0, "icon_bg/count")

	if not IsNil(var_106_5) then
		SetActive(var_106_5, false)
	end
end

function updateShip(arg_107_0, arg_107_1, arg_107_2)
	arg_107_2 = arg_107_2 or {}

	local var_107_0 = arg_107_1:rarity2bgPrint()
	local var_107_1 = arg_107_1:getPainting()

	if arg_107_2.anonymous then
		var_107_0 = "1"
		var_107_1 = "unknown"
	end

	if arg_107_2.unknown_small then
		var_107_1 = "unknown_small"
	end

	local var_107_2 = findTF(arg_107_0, "icon_bg/new")

	if var_107_2 then
		if arg_107_2.isSkin then
			setActive(var_107_2, not arg_107_2.isTimeLimit and arg_107_2.isNew)
		else
			setActive(var_107_2, arg_107_1.virgin)
		end
	end

	local var_107_3 = findTF(arg_107_0, "icon_bg/timelimit")

	if var_107_3 then
		setActive(var_107_3, arg_107_2.isTimeLimit)
	end

	local var_107_4 = findTF(arg_107_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_107_2.isSkin and "_skin" or var_107_0), var_107_4)

	local var_107_5 = findTF(arg_107_0, "icon_bg/frame")
	local var_107_6

	if arg_107_1.isNpc then
		var_107_6 = "frame_npc"
	elseif arg_107_1:ShowPropose() then
		var_107_6 = "frame_prop"

		if arg_107_1:isMetaShip() then
			var_107_6 = var_107_6 .. "_meta"
		end
	elseif arg_107_2.isSkin then
		var_107_6 = "frame_skin"
	end

	setFrame(var_107_5, var_107_0, var_107_6)

	if arg_107_2.gray then
		setGray(var_107_4, true, true)
	end

	local var_107_7 = findTF(arg_107_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_107_2.Q and "QIcon/" or "SquareIcon/") .. var_107_1, "", var_107_7)

	local var_107_8 = findTF(arg_107_0, "icon_bg/lv")

	if var_107_8 then
		setActive(var_107_8, not arg_107_1.isNpc)

		if not arg_107_1.isNpc then
			local var_107_9 = findTF(var_107_8, "Text")

			if var_107_9 and arg_107_1.level then
				setText(var_107_9, arg_107_1.level)
			end
		end
	end

	local var_107_10 = findTF(arg_107_0, "ship_type")

	if var_107_10 then
		setActive(var_107_10, true)
		setImageSprite(var_107_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_107_1:getShipType())))
	end

	local var_107_11 = var_107_4:Find("npc")

	if not IsNil(var_107_11) then
		if var_107_2 and go(var_107_2).activeSelf then
			setActive(var_107_11, false)
		else
			setActive(var_107_11, arg_107_1:isActivityNpc())
		end
	end

	local var_107_12 = arg_107_0:Find("group_locked")

	if var_107_12 then
		setActive(var_107_12, not arg_107_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_107_1.groupId))
	end

	setIconStars(arg_107_0, arg_107_2.initStar, arg_107_1:getStar())
	setIconName(arg_107_0, arg_107_2.isSkin and arg_107_1:GetSkinConfig().name or arg_107_1:getName(), arg_107_2)
	setIconColorful(arg_107_0, arg_107_2.isSkin and ItemRarity.Gold or arg_107_1:getRarity() - 1, arg_107_2)
end

function updateCommander(arg_108_0, arg_108_1, arg_108_2)
	arg_108_2 = arg_108_2 or {}

	local var_108_0 = arg_108_1:getDropRarity()
	local var_108_1 = ItemRarity.Rarity2Print(var_108_0)
	local var_108_2 = arg_108_1:getConfig("painting")

	if arg_108_2.anonymous then
		var_108_1 = 1
		var_108_2 = "unknown"
	end

	local var_108_3 = findTF(arg_108_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_108_1, var_108_3)

	local var_108_4 = findTF(arg_108_0, "icon_bg/frame")

	setFrame(var_108_4, var_108_1)

	if arg_108_2.gray then
		setGray(var_108_3, true, true)
	end

	local var_108_5 = findTF(arg_108_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_108_2, "", var_108_5)
	setIconStars(arg_108_0, arg_108_2.initStar, 0)
	setIconName(arg_108_0, arg_108_1:getName(), arg_108_2)
end

function updateStrategy(arg_109_0, arg_109_1, arg_109_2)
	arg_109_2 = arg_109_2 or {}

	local var_109_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_109_0, findTF(arg_109_0, "icon_bg"))
	setFrame(findTF(arg_109_0, "icon_bg/frame"), var_109_0)

	local var_109_1 = findTF(arg_109_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_109_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_109_1:getIcon(), "", var_109_1)
	setIconStars(arg_109_0, false)
	setIconName(arg_109_0, arg_109_1:getName(), arg_109_2)
	setIconColorful(arg_109_0, ItemRarity.Gray, arg_109_2)
end

function updateFurniture(arg_110_0, arg_110_1, arg_110_2)
	arg_110_2 = arg_110_2 or {}

	local var_110_0 = arg_110_1:getDropRarity()
	local var_110_1 = ItemRarity.Rarity2Print(var_110_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_110_1, findTF(arg_110_0, "icon_bg"))
	setFrame(findTF(arg_110_0, "icon_bg/frame"), var_110_1)

	local var_110_2 = findTF(arg_110_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_110_1:getIcon(), "", var_110_2)
	setIconStars(arg_110_0, false)
	setIconName(arg_110_0, arg_110_1:getName(), arg_110_2)
	setIconColorful(arg_110_0, var_110_0, arg_110_2)
end

function updateSpWeapon(arg_111_0, arg_111_1, arg_111_2)
	arg_111_2 = arg_111_2 or {}

	assert(arg_111_1, "spWeaponVO can not be nil.")
	assert(isa(arg_111_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_111_0 = ItemRarity.Rarity2Print(arg_111_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_111_0, findTF(arg_111_0, "icon_bg"))
	setFrame(findTF(arg_111_0, "icon_bg/frame"), var_111_0)

	local var_111_1 = findTF(arg_111_0, "icon_bg/icon")

	var_0_4(var_111_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_111_1:GetIconPath(), "", var_111_1)
	setIconStars(arg_111_0, true, arg_111_1:GetRarity())
	var_0_7(arg_111_0, arg_111_1:GetLevel() - 1)
	setIconName(arg_111_0, arg_111_1:GetName(), arg_111_2)
	setIconCount(arg_111_0, arg_111_1.count)
	setIconColorful(arg_111_0, arg_111_1:GetRarity(), arg_111_2)
end

function UpdateSpWeaponSlot(arg_112_0, arg_112_1, arg_112_2)
	local var_112_0 = ItemRarity.Rarity2Print(arg_112_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_112_0, findTF(arg_112_0, "Icon/Mask/icon_bg"))

	local var_112_1 = findTF(arg_112_0, "Icon/Mask/icon_bg/icon")

	arg_112_2 = arg_112_2 or {
		16,
		16,
		16,
		16
	}

	var_0_4(var_112_1, arg_112_2)
	GetImageSpriteFromAtlasAsync(arg_112_1:GetIconPath(), "", var_112_1)

	local var_112_2 = arg_112_1:GetLevel() - 1
	local var_112_3 = findTF(arg_112_0, "Icon/LV")

	setActive(var_112_3, var_112_2 > 0)
	setText(findTF(var_112_3, "Text"), var_112_2)
end

function updateDorm3dFurniture(arg_113_0, arg_113_1, arg_113_2)
	arg_113_2 = arg_113_2 or {}

	local var_113_0 = arg_113_1:getDropRarity()
	local var_113_1 = ItemRarity.Rarity2Print(var_113_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_113_1, findTF(arg_113_0, "icon_bg"))
	setFrame(findTF(arg_113_0, "icon_bg/frame"), var_113_1)

	local var_113_2 = findTF(arg_113_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_113_1:getIcon(), "", var_113_2)
	setIconStars(arg_113_0, false)
	setIconName(arg_113_0, arg_113_1:getName(), arg_113_2)
	setIconColorful(arg_113_0, var_113_0, arg_113_2)
end

function updateDorm3dGift(arg_114_0, arg_114_1, arg_114_2)
	arg_114_2 = arg_114_2 or {}

	local var_114_0 = arg_114_1:getDropRarity()
	local var_114_1 = ItemRarity.Rarity2Print(var_114_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_114_1, arg_114_0:Find("icon_bg"))
	setFrame(arg_114_0:Find("icon_bg/frame"), var_114_1)

	local var_114_2 = arg_114_0:Find("icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_114_1:getIcon(), "", var_114_2)
	setIconStars(arg_114_0, false)
	setIconName(arg_114_0, arg_114_1:getName(), arg_114_2)
	setIconColorful(arg_114_0, var_114_0, arg_114_2)
end

function updateDorm3dSkin(arg_115_0, arg_115_1, arg_115_2)
	arg_115_2 = arg_115_2 or {}

	local var_115_0 = arg_115_1:getDropRarity()
	local var_115_1 = ItemRarity.Rarity2Print(var_115_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_115_1, arg_115_0:Find("icon_bg"))
	setFrame(arg_115_0:Find("icon_bg/frame"), var_115_1)

	local var_115_2 = arg_115_0:Find("icon_bg/icon")

	setIconStars(arg_115_0, false)
	setIconName(arg_115_0, arg_115_1:getName(), arg_115_2)
	setIconColorful(arg_115_0, var_115_0, arg_115_2)
end

function updateDorm3dIcon(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_1:getDropRarityDorm()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_116_0), arg_116_0)

	local var_116_1 = arg_116_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_116_1:getIcon(), "", var_116_1)
	setText(arg_116_0:Find("count/Text"), "x" .. arg_116_1.count)
	setText(arg_116_0:Find("name/Text"), arg_116_1:getName())
end

local var_0_8

function findCullAndClipWorldRect(arg_117_0)
	if #arg_117_0 == 0 then
		return false
	end

	local var_117_0 = arg_117_0[1].canvasRect

	for iter_117_0 = 1, #arg_117_0 do
		var_117_0 = rectIntersect(var_117_0, arg_117_0[iter_117_0].canvasRect)
	end

	if var_117_0.width <= 0 or var_117_0.height <= 0 then
		return false
	end

	var_0_8 = var_0_8 or GameObject.Find("UICamera/Canvas").transform

	local var_117_1 = var_0_8:TransformPoint(Vector3(var_117_0.x, var_117_0.y, 0))
	local var_117_2 = var_0_8:TransformPoint(Vector3(var_117_0.x + var_117_0.width, var_117_0.y + var_117_0.height, 0))

	return true, Vector4(var_117_1.x, var_117_1.y, var_117_2.x, var_117_2.y)
end

function rectIntersect(arg_118_0, arg_118_1)
	local var_118_0 = math.max(arg_118_0.x, arg_118_1.x)
	local var_118_1 = math.min(arg_118_0.x + arg_118_0.width, arg_118_1.x + arg_118_1.width)
	local var_118_2 = math.max(arg_118_0.y, arg_118_1.y)
	local var_118_3 = math.min(arg_118_0.y + arg_118_0.height, arg_118_1.y + arg_118_1.height)

	if var_118_0 <= var_118_1 and var_118_2 <= var_118_3 then
		return var_0_0.Rect.New(var_118_0, var_118_2, var_118_1 - var_118_0, var_118_3 - var_118_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_119_0)
	local var_119_0 = {}

	for iter_119_0, iter_119_1 in ipairs(arg_119_0) do
		local var_119_1 = Drop.Create(iter_119_1)

		var_119_1.count = var_119_1.count or 1

		if var_119_1.type == DROP_TYPE_EMOJI then
			table.insert(var_119_0, var_119_1:getName())
		else
			table.insert(var_119_0, var_119_1:getName() .. "x" .. var_119_1.count)
		end
	end

	return table.concat(var_119_0, "、")
end

function updateDrop(arg_120_0, arg_120_1, arg_120_2)
	Drop.Change(arg_120_1)

	arg_120_2 = arg_120_2 or {}

	local var_120_0 = {
		{
			"icon_bg/slv"
		},
		{
			"icon_bg/frame/specialFrame"
		},
		{
			"ship_type",
			DROP_TYPE_SHIP
		},
		{
			"icon_bg/new",
			DROP_TYPE_SHIP
		},
		{
			"icon_bg/npc",
			DROP_TYPE_SHIP
		},
		{
			"group_locked",
			DROP_TYPE_SHIP
		}
	}
	local var_120_1

	for iter_120_0, iter_120_1 in ipairs(var_120_0) do
		local var_120_2 = arg_120_0:Find(iter_120_1[1])

		if arg_120_1.type ~= iter_120_1[2] and not IsNil(var_120_2) then
			setActive(var_120_2, false)
		end
	end

	if not IsNil(arg_120_0:Find("icon_bg/frame")) then
		arg_120_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

		setIconColorful(arg_120_0, arg_120_1:getDropRarity(), arg_120_2, {
			[ItemRarity.Gold] = {
				name = "Item_duang5",
				active = function(arg_121_0, arg_121_1)
					return arg_121_1.fromAwardLayer and arg_121_0 >= ItemRarity.Gold
				end
			}
		})
		var_0_4(findTF(arg_120_0, "icon_bg/icon"), {
			2,
			2,
			2,
			2
		})
	end

	arg_120_1:UpdateDropTpl(arg_120_0, arg_120_2)
	setIconCount(arg_120_0, arg_120_2.count or arg_120_1:getCount())
end

function updateBuff(arg_122_0, arg_122_1, arg_122_2)
	arg_122_2 = arg_122_2 or {}

	local var_122_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_122_0, findTF(arg_122_0, "icon_bg"))

	local var_122_1 = pg.benefit_buff_template[arg_122_1]

	setFrame(findTF(arg_122_0, "icon_bg/frame"), var_122_0)
	setText(findTF(arg_122_0, "icon_bg/count"), 1)

	local var_122_2 = findTF(arg_122_0, "icon_bg/icon")
	local var_122_3 = var_122_1.icon

	GetImageSpriteFromAtlasAsync(var_122_3, "", var_122_2)
	setIconStars(arg_122_0, false)
	setIconName(arg_122_0, var_122_1.name, arg_122_2)
	setIconColorful(arg_122_0, ItemRarity.Gold, arg_122_2)
end

function updateAttire(arg_123_0, arg_123_1, arg_123_2, arg_123_3)
	local var_123_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_123_0, findTF(arg_123_0, "icon_bg"))
	setFrame(findTF(arg_123_0, "icon_bg/frame"), var_123_0)

	local var_123_1 = findTF(arg_123_0, "icon_bg/icon")
	local var_123_2

	if arg_123_1 == AttireConst.TYPE_CHAT_FRAME then
		var_123_2 = "chat_frame"
	elseif arg_123_1 == AttireConst.TYPE_ICON_FRAME then
		var_123_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_123_2, "", var_123_1)
	setIconName(arg_123_0, arg_123_2.name, arg_123_3)
end

function updateAttireCombatUI(arg_124_0, arg_124_1, arg_124_2, arg_124_3)
	local var_124_0 = arg_124_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_124_0, findTF(arg_124_0, "icon_bg"))
	setFrame(findTF(arg_124_0, "icon_bg/frame"), var_124_0, "frame_battle_ui")

	local var_124_1 = findTF(arg_124_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_124_2.display_icon, "", var_124_1)
	setIconName(arg_124_0, arg_124_2.name, arg_124_3)
end

function updateActivityMedal(arg_125_0, arg_125_1, arg_125_2)
	local var_125_0 = ItemRarity.Rarity2Print(arg_125_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_125_0, findTF(arg_125_0, "icon_bg"))
	setFrame(findTF(arg_125_0, "icon_bg/frame"), var_125_0)

	local var_125_1 = findTF(arg_125_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_125_1.icon, "", var_125_1)
	setIconName(arg_125_0, arg_125_1.name, arg_125_2)
end

function updateCover(arg_126_0, arg_126_1, arg_126_2)
	local var_126_0 = arg_126_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_126_0, findTF(arg_126_0, "icon_bg"))
	setFrame(findTF(arg_126_0, "icon_bg/frame"), var_126_0)

	local var_126_1 = findTF(arg_126_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_126_1:getIcon(), "", var_126_1)
	setIconName(arg_126_0, arg_126_1:getName(), arg_126_2)
	setIconStars(arg_126_0, false)
end

function updateEmoji(arg_127_0, arg_127_1, arg_127_2)
	local var_127_0 = findTF(arg_127_0, "icon_bg/icon")
	local var_127_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_127_1, "", var_127_0)

	local var_127_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_127_2, findTF(arg_127_0, "icon_bg"))
	setFrame(findTF(arg_127_0, "icon_bg/frame"), var_127_2)
	setIconName(arg_127_0, arg_127_1.name, arg_127_2)
end

function updateEquipmentSkin(arg_128_0, arg_128_1, arg_128_2)
	arg_128_2 = arg_128_2 or {}

	local var_128_0 = EquipmentRarity.Rarity2Print(arg_128_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_128_0, findTF(arg_128_0, "icon_bg"))
	setFrame(findTF(arg_128_0, "icon_bg/frame"), var_128_0, "frame_skin")

	local var_128_1 = findTF(arg_128_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_128_1.icon, "", var_128_1)
	setIconStars(arg_128_0, false)
	setIconName(arg_128_0, arg_128_1.name, arg_128_2)
	setIconCount(arg_128_0, arg_128_1.count)
	setIconColorful(arg_128_0, arg_128_1.rarity - 1, arg_128_2)
end

function NoPosMsgBox(arg_129_0, arg_129_1, arg_129_2, arg_129_3)
	local var_129_0
	local var_129_1 = {}

	if arg_129_1 then
		table.insert(var_129_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_129_1
		})
	end

	if arg_129_2 then
		table.insert(var_129_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_129_2
		})
	end

	if arg_129_3 then
		table.insert(var_129_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_129_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_129_0,
		custom = var_129_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_130_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_130_0 and var_130_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_130_0
			})
		else
			pg.m02:sendNotification(EquipmentMediator.BATCHDESTROY_MODE)

			return
		end
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
		warp = StoreHouseConst.WARP_TO_WEAPON,
		mode = StoreHouseConst.DESTROY
	})
end

function OpenSpWeaponPage()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_131_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_131_0 and var_131_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_131_0
			})
		else
			pg.m02:sendNotification(EquipmentMediator.SWITCH_TO_SPWEAPON_PAGE)

			return
		end
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
		warp = StoreHouseConst.WARP_TO_WEAPON,
		mode = StoreHouseConst.SPWEAPON
	})
end

function openDockyardClear()
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
		blockLock = true,
		mode = DockyardScene.MODE_DESTROY,
		leftTopInfo = i18n("word_destroy"),
		selectedMax = getGameset("ship_select_limit")[1],
		onShip = ShipStatus.canDestroyShip,
		ignoredIds = pg.ShipFlagMgr.GetInstance():FilterShips({
			isActivityNpc = true
		})
	})
end

function openDockyardIntensify()
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
		mode = DockyardScene.MODE_OVERVIEW,
		onClick = function(arg_134_0, arg_134_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_134_0.id,
				shipVOs = arg_134_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_135_0, arg_135_1, arg_135_2)
	if arg_135_2 then
		local var_135_0 = ""

		for iter_135_0, iter_135_1 in ipairs(arg_135_2) do
			local var_135_1 = Item.getConfigData(iter_135_1[1])

			var_135_0 = var_135_0 .. i18n(iter_135_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_135_1.name, iter_135_1[2])

			if iter_135_0 < #arg_135_2 then
				var_135_0 = var_135_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_135_0 ~= "" then
			arg_135_0 = arg_135_0 .. "\n" .. i18n("text_noRes_tip", var_135_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_135_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_135_1, arg_135_2)
		end
	})
end

function shoppingBatch(arg_137_0, arg_137_1, arg_137_2, arg_137_3, arg_137_4)
	local var_137_0 = pg.shop_template[arg_137_0]

	assert(var_137_0, "shop_template中找不到商品id：" .. arg_137_0)

	local var_137_1 = getProxy(PlayerProxy):getData()[id2res(var_137_0.resource_type)]
	local var_137_2 = arg_137_1.price or var_137_0.resource_num
	local var_137_3 = math.floor(var_137_1 / var_137_2)

	var_137_3 = var_137_3 <= 0 and 1 or var_137_3
	var_137_3 = arg_137_2 ~= nil and arg_137_2 < var_137_3 and arg_137_2 or var_137_3

	local var_137_4 = true
	local var_137_5 = 1

	if var_137_0 ~= nil and arg_137_1.id then
		print(var_137_3 * var_137_0.num, "--", var_137_3)
		assert(Item.getConfigData(arg_137_1.id), "item config should be existence")

		local var_137_6 = Item.New({
			id = arg_137_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_137_1.id
			},
			addNum = var_137_0.num,
			maxNum = var_137_3 * var_137_0.num,
			defaultNum = var_137_0.num,
			numUpdate = function(arg_138_0, arg_138_1)
				var_137_5 = math.floor(arg_138_1 / var_137_0.num)

				local var_138_0 = var_137_5 * var_137_2

				if var_138_0 > var_137_1 then
					setText(arg_138_0, i18n(arg_137_3, var_138_0, arg_138_1, COLOR_RED, var_137_6))

					var_137_4 = false
				else
					setText(arg_138_0, i18n(arg_137_3, var_138_0, arg_138_1, COLOR_GREEN, var_137_6))

					var_137_4 = true
				end
			end,
			onYes = function()
				if var_137_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_137_0,
						count = var_137_5
					})
				elseif arg_137_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_137_4))
					pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_140_0, arg_140_1, arg_140_2, arg_140_3, arg_140_4)
	local var_140_0 = pg.shop_template[arg_140_0]

	assert(var_140_0, "shop_template中找不到商品id：" .. arg_140_0)

	local var_140_1 = getProxy(PlayerProxy):getData()[id2res(var_140_0.resource_type)]
	local var_140_2 = arg_140_1.price or var_140_0.resource_num
	local var_140_3 = math.floor(var_140_1 / var_140_2)

	var_140_3 = var_140_3 <= 0 and 1 or var_140_3
	var_140_3 = arg_140_2 ~= nil and arg_140_2 < var_140_3 and arg_140_2 or var_140_3

	local var_140_4 = true
	local var_140_5 = 1

	if var_140_0 ~= nil and arg_140_1.id then
		print(var_140_3 * var_140_0.num, "--", var_140_3)
		assert(Item.getConfigData(arg_140_1.id), "item config should be existence")

		local var_140_6 = Item.New({
			id = arg_140_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_140_1.id
			}),
			price = var_140_2,
			addNum = var_140_0.num,
			maxNum = var_140_3 * var_140_0.num,
			defaultNum = var_140_0.num,
			numUpdate = function(arg_141_0, arg_141_1)
				var_140_5 = math.floor(arg_141_1 / var_140_0.num)

				local var_141_0 = var_140_5 * var_140_2

				if var_141_0 > var_140_1 then
					setTextInNewStyleBox(arg_141_0, i18n(arg_140_3, var_141_0, arg_141_1, COLOR_RED, var_140_6))

					var_140_4 = false
				else
					setTextInNewStyleBox(arg_141_0, i18n(arg_140_3, var_141_0, arg_141_1, "#238C40FF", var_140_6))

					var_140_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_140_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_140_0,
								count = var_140_5
							})
						elseif arg_140_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_140_4))
						else
							pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
						end
					end,
					sound = SFX_CONFIRM
				}
			}
		})
	end
end

function gotoChargeScene(arg_143_0, arg_143_1)
	local var_143_0 = getProxy(ContextProxy)
	local var_143_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_143_1.mediator, ChargeMediator) then
		var_143_1.mediator:getViewComponent():switchSubViewByTogger(arg_143_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_143_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_143_1
		})
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
end

function clearDrop(arg_144_0)
	local var_144_0 = findTF(arg_144_0, "icon_bg")
	local var_144_1 = findTF(arg_144_0, "icon_bg/frame")
	local var_144_2 = findTF(arg_144_0, "icon_bg/icon")
	local var_144_3 = findTF(arg_144_0, "icon_bg/icon/icon")

	clearImageSprite(var_144_0)
	clearImageSprite(var_144_1)
	clearImageSprite(var_144_2)

	if var_144_3 then
		clearImageSprite(var_144_3)
	end
end

local var_0_9 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_145_0, arg_145_1, arg_145_2, arg_145_3)
	local var_145_0 = findTF(arg_145_0, "skill")
	local var_145_1 = findTF(arg_145_0, "lock")
	local var_145_2 = findTF(arg_145_0, "unknown")

	if arg_145_1 then
		setActive(var_145_0, true)
		setActive(var_145_2, false)
		setActive(var_145_1, not arg_145_2)
		LoadImageSpriteAsync("skillicon/" .. arg_145_1.icon, findTF(var_145_0, "icon"))

		local var_145_3 = arg_145_1.color or "blue"

		setText(findTF(var_145_0, "name"), shortenString(getSkillName(arg_145_1.id), arg_145_3 or 8))

		local var_145_4 = findTF(var_145_0, "level")

		setText(var_145_4, "LEVEL: " .. (arg_145_2 and arg_145_2.level or "??"))
		setTextColor(var_145_4, var_0_9[var_145_3])
	else
		setActive(var_145_0, false)
		setActive(var_145_2, true)
		setActive(var_145_1, false)
	end
end

local var_0_10 = true

function onBackButton(arg_146_0, arg_146_1, arg_146_2, arg_146_3)
	local var_146_0 = GetOrAddComponent(arg_146_1, "UILongPressTrigger")

	assert(arg_146_2, "callback should exist")

	var_146_0.longPressThreshold = defaultValue(arg_146_3, 1)

	local function var_146_1(arg_147_0)
		return function()
			if var_0_10 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_148_0, var_148_1 = arg_146_2()

			if var_148_0 then
				arg_147_0(var_148_1)
			end
		end
	end

	local var_146_2 = var_146_0.onReleased

	pg.DelegateInfo.Add(arg_146_0, var_146_2)
	var_146_2:RemoveAllListeners()
	var_146_2:AddListener(var_146_1(function(arg_149_0)
		arg_149_0:emit(BaseUI.ON_BACK)
	end))

	local var_146_3 = var_146_0.onLongPressed

	pg.DelegateInfo.Add(arg_146_0, var_146_3)
	var_146_3:RemoveAllListeners()
	var_146_3:AddListener(var_146_1(function(arg_150_0)
		arg_150_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_153_0)
	local var_153_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_153_1, var_153_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_153_0)

	return var_153_1 * 86400 + (var_153_2 + arg_153_0) * 3600
end

function GetPerceptualSize(arg_154_0, arg_154_1)
	local function var_154_0(arg_155_0)
		if not arg_155_0 then
			return 0, 1
		elseif arg_155_0 > 240 then
			return 4, 1
		elseif arg_155_0 > 225 then
			return 3, 1
		elseif arg_155_0 > 192 then
			return 2, 1
		elseif arg_155_0 < 126 then
			return 1, arg_154_1 or 0.5
		else
			return 1, 1
		end
	end

	if type(arg_154_0) == "number" then
		return var_154_0(arg_154_0)
	end

	local var_154_1 = 1
	local var_154_2 = 0
	local var_154_3 = 0
	local var_154_4 = #arg_154_0

	while var_154_1 <= var_154_4 do
		local var_154_5 = string.byte(arg_154_0, var_154_1)
		local var_154_6, var_154_7 = var_154_0(var_154_5)

		var_154_1 = var_154_1 + var_154_6
		var_154_2 = var_154_2 + var_154_7
	end

	return var_154_2
end

function shortenString(arg_156_0, arg_156_1, arg_156_2)
	local var_156_0 = 1
	local var_156_1 = 0
	local var_156_2 = 0
	local var_156_3 = #arg_156_0

	while var_156_0 <= var_156_3 do
		local var_156_4 = string.byte(arg_156_0, var_156_0)
		local var_156_5, var_156_6 = GetPerceptualSize(var_156_4, arg_156_2)

		var_156_0 = var_156_0 + var_156_5
		var_156_1 = var_156_1 + var_156_6

		if arg_156_1 <= math.ceil(var_156_1) then
			var_156_2 = var_156_0

			break
		end
	end

	if var_156_2 == 0 or var_156_3 < var_156_2 then
		return arg_156_0
	end

	return string.sub(arg_156_0, 1, var_156_2 - 1) .. ".."
end

function shouldShortenString(arg_157_0, arg_157_1)
	local var_157_0 = 1
	local var_157_1 = 0
	local var_157_2 = 0
	local var_157_3 = #arg_157_0

	while var_157_0 <= var_157_3 do
		local var_157_4 = string.byte(arg_157_0, var_157_0)
		local var_157_5, var_157_6 = GetPerceptualSize(var_157_4)

		var_157_0 = var_157_0 + var_157_5
		var_157_1 = var_157_1 + var_157_6

		if arg_157_1 <= math.ceil(var_157_1) then
			var_157_2 = var_157_0

			break
		end
	end

	if var_157_2 == 0 or var_157_3 < var_157_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_158_0, arg_158_1, arg_158_2, arg_158_3)
	local var_158_0 = true
	local var_158_1, var_158_2 = utf8_to_unicode(arg_158_0)
	local var_158_3 = filterEgyUnicode(filterSpecChars(arg_158_0))
	local var_158_4 = wordVer(arg_158_0)

	if not checkSpaceValid(arg_158_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_158_3[1]))

		var_158_0 = false
	elseif var_158_4 > 0 or var_158_3 ~= arg_158_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_158_3[4]))

		var_158_0 = false
	elseif var_158_2 < arg_158_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_158_3[2]))

		var_158_0 = false
	elseif arg_158_2 < var_158_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_158_3[3]))

		var_158_0 = false
	end

	return var_158_0
end

function checkSpaceValid(arg_159_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_159_0 = string.gsub(arg_159_0, " ", "")

	return arg_159_0 == string.gsub(var_159_0, "　", "")
end

function filterSpecChars(arg_160_0)
	local var_160_0 = {}
	local var_160_1 = 0
	local var_160_2 = 0
	local var_160_3 = 0
	local var_160_4 = 1

	while var_160_4 <= #arg_160_0 do
		local var_160_5 = string.byte(arg_160_0, var_160_4)

		if not var_160_5 then
			break
		end

		if var_160_5 >= 48 and var_160_5 <= 57 or var_160_5 >= 65 and var_160_5 <= 90 or var_160_5 == 95 or var_160_5 >= 97 and var_160_5 <= 122 then
			table.insert(var_160_0, string.char(var_160_5))
		elseif var_160_5 >= 228 and var_160_5 <= 233 then
			local var_160_6 = string.byte(arg_160_0, var_160_4 + 1)
			local var_160_7 = string.byte(arg_160_0, var_160_4 + 2)

			if var_160_6 and var_160_7 and var_160_6 >= 128 and var_160_6 <= 191 and var_160_7 >= 128 and var_160_7 <= 191 then
				var_160_4 = var_160_4 + 2

				table.insert(var_160_0, string.char(var_160_5, var_160_6, var_160_7))

				var_160_1 = var_160_1 + 1
			end
		elseif var_160_5 == 45 or var_160_5 == 40 or var_160_5 == 41 then
			table.insert(var_160_0, string.char(var_160_5))
		elseif var_160_5 == 194 then
			local var_160_8 = string.byte(arg_160_0, var_160_4 + 1)

			if var_160_8 == 183 then
				var_160_4 = var_160_4 + 1

				table.insert(var_160_0, string.char(var_160_5, var_160_8))

				var_160_1 = var_160_1 + 1
			end
		elseif var_160_5 == 239 then
			local var_160_9 = string.byte(arg_160_0, var_160_4 + 1)
			local var_160_10 = string.byte(arg_160_0, var_160_4 + 2)

			if var_160_9 == 188 and (var_160_10 == 136 or var_160_10 == 137) then
				var_160_4 = var_160_4 + 2

				table.insert(var_160_0, string.char(var_160_5, var_160_9, var_160_10))

				var_160_1 = var_160_1 + 1
			end
		elseif var_160_5 == 206 or var_160_5 == 207 then
			local var_160_11 = string.byte(arg_160_0, var_160_4 + 1)

			if var_160_5 == 206 and var_160_11 >= 177 or var_160_5 == 207 and var_160_11 <= 134 then
				var_160_4 = var_160_4 + 1

				table.insert(var_160_0, string.char(var_160_5, var_160_11))

				var_160_1 = var_160_1 + 1
			end
		elseif var_160_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_160_12 = string.byte(arg_160_0, var_160_4 + 1)
			local var_160_13 = string.byte(arg_160_0, var_160_4 + 2)

			if var_160_12 and var_160_13 and var_160_12 > 128 and var_160_12 <= 191 and var_160_13 >= 128 and var_160_13 <= 191 then
				var_160_4 = var_160_4 + 2

				table.insert(var_160_0, string.char(var_160_5, var_160_12, var_160_13))

				var_160_2 = var_160_2 + 1
			end
		elseif var_160_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_160_14 = string.byte(arg_160_0, var_160_4 + 1)
			local var_160_15 = string.byte(arg_160_0, var_160_4 + 2)

			if var_160_14 and var_160_15 and var_160_14 >= 128 and var_160_14 <= 191 and var_160_15 >= 128 and var_160_15 <= 191 then
				var_160_4 = var_160_4 + 2

				table.insert(var_160_0, string.char(var_160_5, var_160_14, var_160_15))

				var_160_3 = var_160_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_160_4 ~= 1 and var_160_5 == 32 and string.byte(arg_160_0, var_160_4 + 1) ~= 32 then
				table.insert(var_160_0, string.char(var_160_5))
			end

			if var_160_5 >= 192 and var_160_5 <= 223 then
				local var_160_16 = string.byte(arg_160_0, var_160_4 + 1)

				var_160_4 = var_160_4 + 1

				if var_160_5 == 194 and var_160_16 and var_160_16 >= 128 then
					table.insert(var_160_0, string.char(var_160_5, var_160_16))
				elseif var_160_5 == 195 and var_160_16 and var_160_16 <= 191 then
					table.insert(var_160_0, string.char(var_160_5, var_160_16))
				end
			end
		end

		var_160_4 = var_160_4 + 1
	end

	return table.concat(var_160_0), var_160_1 + var_160_2 + var_160_3
end

function filterEgyUnicode(arg_161_0)
	arg_161_0 = string.gsub(arg_161_0, "�[�-�][�-�]", "")
	arg_161_0 = string.gsub(arg_161_0, "�[�-�]", "")

	return arg_161_0
end

function shiftPanel(arg_162_0, arg_162_1, arg_162_2, arg_162_3, arg_162_4, arg_162_5, arg_162_6, arg_162_7, arg_162_8)
	arg_162_3 = arg_162_3 or 0.2

	if arg_162_5 then
		LeanTween.cancel(go(arg_162_0))
	end

	local var_162_0 = rtf(arg_162_0)

	arg_162_1 = arg_162_1 or var_162_0.anchoredPosition.x
	arg_162_2 = arg_162_2 or var_162_0.anchoredPosition.y

	local var_162_1 = LeanTween.move(var_162_0, Vector3(arg_162_1, arg_162_2, 0), arg_162_3)

	arg_162_7 = arg_162_7 or LeanTweenType.easeInOutSine

	var_162_1:setEase(arg_162_7)

	if arg_162_4 then
		var_162_1:setDelay(arg_162_4)
	end

	if arg_162_6 then
		GetOrAddComponent(arg_162_0, "CanvasGroup").blocksRaycasts = false
	end

	var_162_1:setOnComplete(System.Action(function()
		if arg_162_8 then
			arg_162_8()
		end

		if arg_162_6 then
			GetOrAddComponent(arg_162_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_162_1
end

function TweenValue(arg_164_0, arg_164_1, arg_164_2, arg_164_3, arg_164_4, arg_164_5, arg_164_6, arg_164_7)
	local var_164_0 = LeanTween.value(go(arg_164_0), arg_164_1, arg_164_2, arg_164_3):setOnUpdate(System.Action_float(function(arg_165_0)
		if arg_164_5 then
			arg_164_5(arg_165_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_164_6 then
			arg_164_6()
		end
	end)):setDelay(arg_164_4 or 0)

	if arg_164_7 and arg_164_7 > 0 then
		var_164_0:setRepeat(arg_164_7)
	end

	return var_164_0
end

function rotateAni(arg_167_0, arg_167_1, arg_167_2)
	return LeanTween.rotate(rtf(arg_167_0), 360 * arg_167_1, arg_167_2):setLoopClamp()
end

function blinkAni(arg_168_0, arg_168_1, arg_168_2, arg_168_3)
	return LeanTween.alpha(rtf(arg_168_0), arg_168_3 or 0, arg_168_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_168_2 or 0)
end

function scaleAni(arg_169_0, arg_169_1, arg_169_2, arg_169_3)
	return LeanTween.scale(rtf(arg_169_0), arg_169_3 or 0, arg_169_1):setLoopPingPong(arg_169_2 or 0)
end

function floatAni(arg_170_0, arg_170_1, arg_170_2, arg_170_3)
	local var_170_0 = arg_170_0.localPosition.y + arg_170_1

	return LeanTween.moveY(rtf(arg_170_0), var_170_0, arg_170_2):setLoopPingPong(arg_170_3 or 0)
end

local var_0_11 = tostring

function tostring(arg_171_0)
	if arg_171_0 == nil then
		return "nil"
	end

	local var_171_0 = var_0_11(arg_171_0)

	if var_171_0 == nil then
		if type(arg_171_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_171_0
end

function wordVer(arg_172_0, arg_172_1)
	if arg_172_0.match(arg_172_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_172_0
	end

	arg_172_1 = arg_172_1 or {}

	local var_172_0 = filterEgyUnicode(arg_172_0)

	if #var_172_0 ~= #arg_172_0 then
		if arg_172_1.isReplace then
			arg_172_0 = var_172_0
		else
			return 1
		end
	end

	local var_172_1 = wordSplit(arg_172_0)
	local var_172_2 = pg.word_template
	local var_172_3 = pg.word_legal_template

	arg_172_1.isReplace = arg_172_1.isReplace or false
	arg_172_1.replaceWord = arg_172_1.replaceWord or "*"

	local var_172_4 = #var_172_1
	local var_172_5 = 1
	local var_172_6 = ""
	local var_172_7 = 0

	while var_172_5 <= var_172_4 do
		local var_172_8, var_172_9, var_172_10 = wordLegalMatch(var_172_1, var_172_3, var_172_5)

		if var_172_8 then
			var_172_5 = var_172_9
			var_172_6 = var_172_6 .. var_172_10
		else
			local var_172_11, var_172_12, var_172_13 = wordVerMatch(var_172_1, var_172_2, arg_172_1, var_172_5, "", false, var_172_5, "")

			if var_172_11 then
				var_172_5 = var_172_12
				var_172_7 = var_172_7 + 1

				if arg_172_1.isReplace then
					var_172_6 = var_172_6 .. var_172_13
				end
			else
				if arg_172_1.isReplace then
					var_172_6 = var_172_6 .. var_172_1[var_172_5]
				end

				var_172_5 = var_172_5 + 1
			end
		end
	end

	if arg_172_1.isReplace then
		return var_172_7, var_172_6
	else
		return var_172_7
	end
end

function wordLegalMatch(arg_173_0, arg_173_1, arg_173_2, arg_173_3, arg_173_4)
	if arg_173_2 > #arg_173_0 then
		return arg_173_3, arg_173_2, arg_173_4
	end

	local var_173_0 = arg_173_0[arg_173_2]
	local var_173_1 = arg_173_1[var_173_0]

	arg_173_4 = arg_173_4 == nil and "" or arg_173_4

	if var_173_1 then
		if var_173_1.this then
			return wordLegalMatch(arg_173_0, var_173_1, arg_173_2 + 1, true, arg_173_4 .. var_173_0)
		else
			return wordLegalMatch(arg_173_0, var_173_1, arg_173_2 + 1, false, arg_173_4 .. var_173_0)
		end
	else
		return arg_173_3, arg_173_2, arg_173_4
	end
end

local var_0_12 = string.byte("a")
local var_0_13 = string.byte("z")
local var_0_14 = string.byte("A")
local var_0_15 = string.byte("Z")

local function var_0_16(arg_174_0)
	if not arg_174_0 then
		return arg_174_0
	end

	local var_174_0 = string.byte(arg_174_0)

	if var_174_0 > 128 then
		return
	end

	if var_174_0 >= var_0_12 and var_174_0 <= var_0_13 then
		return string.char(var_174_0 - 32)
	elseif var_174_0 >= var_0_14 and var_174_0 <= var_0_15 then
		return string.char(var_174_0 + 32)
	else
		return arg_174_0
	end
end

function wordVerMatch(arg_175_0, arg_175_1, arg_175_2, arg_175_3, arg_175_4, arg_175_5, arg_175_6, arg_175_7)
	if arg_175_3 > #arg_175_0 then
		return arg_175_5, arg_175_6, arg_175_7
	end

	local var_175_0 = arg_175_0[arg_175_3]
	local var_175_1 = arg_175_1[var_175_0]

	if var_175_1 then
		local var_175_2, var_175_3, var_175_4 = wordVerMatch(arg_175_0, var_175_1, arg_175_2, arg_175_3 + 1, arg_175_2.isReplace and arg_175_4 .. arg_175_2.replaceWord or arg_175_4, var_175_1.this or arg_175_5, var_175_1.this and arg_175_3 + 1 or arg_175_6, var_175_1.this and (arg_175_2.isReplace and arg_175_4 .. arg_175_2.replaceWord or arg_175_4) or arg_175_7)

		if var_175_2 then
			return var_175_2, var_175_3, var_175_4
		end
	end

	local var_175_5 = var_0_16(var_175_0)
	local var_175_6 = arg_175_1[var_175_5]

	if var_175_5 ~= var_175_0 and var_175_6 then
		local var_175_7, var_175_8, var_175_9 = wordVerMatch(arg_175_0, var_175_6, arg_175_2, arg_175_3 + 1, arg_175_2.isReplace and arg_175_4 .. arg_175_2.replaceWord or arg_175_4, var_175_6.this or arg_175_5, var_175_6.this and arg_175_3 + 1 or arg_175_6, var_175_6.this and (arg_175_2.isReplace and arg_175_4 .. arg_175_2.replaceWord or arg_175_4) or arg_175_7)

		if var_175_7 then
			return var_175_7, var_175_8, var_175_9
		end
	end

	return arg_175_5, arg_175_6, arg_175_7
end

function wordSplit(arg_176_0)
	local var_176_0 = {}

	for iter_176_0 in arg_176_0.gmatch(arg_176_0, "[\x01-\x7F�-�][�-�]*") do
		var_176_0[#var_176_0 + 1] = iter_176_0
	end

	return var_176_0
end

function contentWrap(arg_177_0, arg_177_1, arg_177_2)
	local var_177_0 = LuaHelper.WrapContent(arg_177_0, arg_177_1, arg_177_2)

	return #var_177_0 ~= #arg_177_0, var_177_0
end

function cancelRich(arg_178_0)
	local var_178_0

	for iter_178_0 = 1, 20 do
		local var_178_1

		arg_178_0, var_178_1 = string.gsub(arg_178_0, "<([^>]*)>", "%1")

		if var_178_1 <= 0 then
			break
		end
	end

	return arg_178_0
end

function cancelColorRich(arg_179_0)
	local var_179_0

	for iter_179_0 = 1, 20 do
		local var_179_1

		arg_179_0, var_179_1 = string.gsub(arg_179_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_179_1 <= 0 then
			break
		end
	end

	return arg_179_0
end

function getSkillConfig(arg_180_0)
	local var_180_0 = pg.buffCfg["buff_" .. arg_180_0]

	if not var_180_0 then
		return
	end

	local var_180_1 = Clone(var_180_0)

	var_180_1.name = getSkillName(arg_180_0)
	var_180_1.desc = HXSet.hxLan(var_180_1.desc)
	var_180_1.desc_get = HXSet.hxLan(var_180_1.desc_get)

	_.each(var_180_1, function(arg_181_0)
		arg_181_0.desc = HXSet.hxLan(arg_181_0.desc)
	end)

	return var_180_1
end

function getSkillName(arg_182_0)
	local var_182_0 = pg.skill_data_template[arg_182_0] or pg.skill_data_display[arg_182_0]

	if var_182_0 then
		return HXSet.hxLan(var_182_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_183_0, arg_183_1)
	local var_183_0 = arg_183_1 and pg.skill_world_display[arg_183_0] and setmetatable({}, {
		__index = function(arg_184_0, arg_184_1)
			return pg.skill_world_display[arg_183_0][arg_184_1] or pg.skill_data_template[arg_183_0][arg_184_1]
		end
	}) or pg.skill_data_template[arg_183_0]

	if not var_183_0 then
		return ""
	end

	local var_183_1 = var_183_0.desc_get ~= "" and var_183_0.desc_get or var_183_0.desc

	for iter_183_0, iter_183_1 in pairs(var_183_0.desc_get_add) do
		local var_183_2 = setColorStr(iter_183_1[1], COLOR_GREEN)

		if iter_183_1[2] then
			var_183_2 = var_183_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_183_1[2], COLOR_GREEN))
		end

		var_183_1 = specialGSub(var_183_1, "$" .. iter_183_0, var_183_2)
	end

	return HXSet.hxLan(var_183_1)
end

function getSkillDescLearn(arg_185_0, arg_185_1, arg_185_2)
	local var_185_0 = arg_185_2 and pg.skill_world_display[arg_185_0] and setmetatable({}, {
		__index = function(arg_186_0, arg_186_1)
			return pg.skill_world_display[arg_185_0][arg_186_1] or pg.skill_data_template[arg_185_0][arg_186_1]
		end
	}) or pg.skill_data_template[arg_185_0]

	if not var_185_0 then
		return ""
	end

	local var_185_1 = var_185_0.desc

	if not var_185_0.desc_add then
		return HXSet.hxLan(var_185_1)
	end

	for iter_185_0, iter_185_1 in pairs(var_185_0.desc_add) do
		local var_185_2 = iter_185_1[arg_185_1][1]

		if iter_185_1[arg_185_1][2] then
			var_185_2 = var_185_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_185_1[arg_185_1][2])
		end

		var_185_1 = specialGSub(var_185_1, "$" .. iter_185_0, setColorStr(var_185_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_185_1)
end

function getSkillDesc(arg_187_0, arg_187_1, arg_187_2)
	local var_187_0 = arg_187_2 and pg.skill_world_display[arg_187_0] and setmetatable({}, {
		__index = function(arg_188_0, arg_188_1)
			return pg.skill_world_display[arg_187_0][arg_188_1] or pg.skill_data_template[arg_187_0][arg_188_1]
		end
	}) or pg.skill_data_template[arg_187_0]

	if not var_187_0 then
		return ""
	end

	local var_187_1 = var_187_0.desc

	if not var_187_0.desc_add then
		return HXSet.hxLan(var_187_1)
	end

	for iter_187_0, iter_187_1 in pairs(var_187_0.desc_add) do
		local var_187_2 = setColorStr(iter_187_1[arg_187_1][1], COLOR_GREEN)

		var_187_1 = specialGSub(var_187_1, "$" .. iter_187_0, var_187_2)
	end

	return HXSet.hxLan(var_187_1)
end

function specialGSub(arg_189_0, arg_189_1, arg_189_2)
	arg_189_0 = string.gsub(arg_189_0, "<color=#", "<color=NNN")
	arg_189_0 = string.gsub(arg_189_0, "#", "")
	arg_189_2 = string.gsub(arg_189_2, "%%", "%%%%")
	arg_189_0 = string.gsub(arg_189_0, arg_189_1, arg_189_2)
	arg_189_0 = string.gsub(arg_189_0, "<color=NNN", "<color=#")

	return arg_189_0
end

function topAnimation(arg_190_0, arg_190_1, arg_190_2, arg_190_3, arg_190_4, arg_190_5)
	local var_190_0 = {}

	arg_190_4 = arg_190_4 or 0.27

	local var_190_1 = 0.05

	if arg_190_0 then
		local var_190_2 = arg_190_0.transform.localPosition.x

		setAnchoredPosition(arg_190_0, {
			x = var_190_2 - 500
		})
		shiftPanel(arg_190_0, var_190_2, nil, 0.05, arg_190_4, true, true)
		setActive(arg_190_0, true)
	end

	setActive(arg_190_1, false)
	setActive(arg_190_2, false)
	setActive(arg_190_3, false)

	for iter_190_0 = 1, 3 do
		table.insert(var_190_0, LeanTween.delayedCall(arg_190_4 + 0.13 + var_190_1 * iter_190_0, System.Action(function()
			if arg_190_1 then
				setActive(arg_190_1, not arg_190_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_190_0, LeanTween.delayedCall(arg_190_4 + 0.02 + var_190_1 * iter_190_0, System.Action(function()
			if arg_190_2 then
				setActive(arg_190_2, not go(arg_190_2).activeSelf)
			end

			if arg_190_2 then
				setActive(arg_190_3, not go(arg_190_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_190_5 then
		table.insert(var_190_0, LeanTween.delayedCall(arg_190_4 + 0.13 + var_190_1 * 3 + 0.1, System.Action(function()
			arg_190_5()
		end)).uniqueId)
	end

	return var_190_0
end

function cancelTweens(arg_194_0)
	assert(arg_194_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_194_0, iter_194_1 in ipairs(arg_194_0) do
		if iter_194_1 then
			LeanTween.cancel(iter_194_1)
		end
	end
end

function getOfflineTimeStamp(arg_195_0)
	local var_195_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_195_0
	local var_195_1 = ""

	if var_195_0 <= 59 then
		var_195_1 = i18n("just_now")
	elseif var_195_0 <= 3599 then
		var_195_1 = i18n("several_minutes_before", math.floor(var_195_0 / 60))
	elseif var_195_0 <= 86399 then
		var_195_1 = i18n("several_hours_before", math.floor(var_195_0 / 3600))
	else
		var_195_1 = i18n("several_days_before", math.floor(var_195_0 / 86400))
	end

	return var_195_1
end

function playMovie(arg_196_0, arg_196_1, arg_196_2)
	local var_196_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_196_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_196_0, function(arg_197_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_197_0 = GCHandle.Alloc(arg_197_0, GCHandleType.Pinned)

			setActive(var_196_0, true)

			local var_197_1 = var_196_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_197_1.player:SetData(arg_197_0, arg_197_0.Length)

			var_197_1.target = var_196_0:GetComponent(typeof(Image))
			var_197_1.loop = false
			var_197_1.additiveMode = false
			var_197_1.playOnStart = true

			local var_197_2

			var_197_2 = Timer.New(function()
				if var_197_1.player.status == CriMana.Player.Status.PlayEnd or var_197_1.player.status == CriMana.Player.Status.Stop or var_197_1.player.status == CriMana.Player.Status.Error then
					var_197_2:Stop()
					Object.Destroy(var_197_1)
					GCHandle.Free(var_197_0)
					setActive(var_196_0, false)

					if arg_196_1 then
						arg_196_1()
					end
				end
			end, 0.2, -1)

			var_197_2:Start()
			removeOnButton(var_196_0)

			if arg_196_2 then
				onButton(nil, var_196_0, function()
					var_197_1:Stop()
					GetOrAddComponent(var_196_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_196_1 then
		arg_196_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_200_0)
	if PaintCameraAdjustOn ~= arg_200_0 then
		local var_200_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_200_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_200_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_200_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_200_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_200_0
	end
end

function ManhattonDist(arg_201_0, arg_201_1)
	return math.abs(arg_201_0.row - arg_201_1.row) + math.abs(arg_201_0.column - arg_201_1.column)
end

function checkFirstHelpShow(arg_202_0)
	local var_202_0 = getProxy(SettingsProxy)

	if not var_202_0:checkReadHelp(arg_202_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_202_0].tip
		})
		var_202_0:recordReadHelp(arg_202_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_203_0)
	enableNotch(arg_203_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_204_0)
	enableNotch(arg_204_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_204_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_206_0, arg_206_1)
	if arg_206_0 == nil then
		return
	end

	local var_206_0 = arg_206_0:GetComponent("NotchAdapt")
	local var_206_1 = arg_206_0:GetComponent("AspectRatioFitter")

	var_206_0.enabled = arg_206_1

	if var_206_1 then
		if arg_206_1 then
			var_206_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_206_1.enabled
			var_206_1.enabled = false
		end
	end
end

function comma_value(arg_207_0)
	local var_207_0 = arg_207_0
	local var_207_1 = 0

	repeat
		local var_207_2

		var_207_0, var_207_2 = string.gsub(var_207_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_207_2 == 0

	return var_207_0
end

local var_0_17 = 0.2

function SwitchPanel(arg_208_0, arg_208_1, arg_208_2, arg_208_3, arg_208_4, arg_208_5)
	arg_208_3 = defaultValue(arg_208_3, var_0_17)

	if arg_208_5 then
		LeanTween.cancel(go(arg_208_0))
	end

	local var_208_0 = Vector3.New(tf(arg_208_0).localPosition.x, tf(arg_208_0).localPosition.y, tf(arg_208_0).localPosition.z)

	if arg_208_1 then
		var_208_0.x = arg_208_1
	end

	if arg_208_2 then
		var_208_0.y = arg_208_2
	end

	local var_208_1 = LeanTween.move(rtf(arg_208_0), var_208_0, arg_208_3):setEase(LeanTweenType.easeInOutSine)

	if arg_208_4 then
		var_208_1:setDelay(arg_208_4)
	end

	return var_208_1
end

function updateActivityTaskStatus(arg_209_0)
	local var_209_0 = arg_209_0:getConfig("config_id")
	local var_209_1, var_209_2 = getActivityTask(arg_209_0, true)

	if not var_209_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_209_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_210_0)
	local var_210_0 = getProxy(TaskProxy)
	local var_210_1 = arg_210_0:getNDay()
	local var_210_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_210_0:getStartTime())

	for iter_210_0, iter_210_1 in ipairs(arg_210_0:getConfig("config_data")) do
		local var_210_3 = pg.battlepass_task_group[iter_210_1]

		if var_210_3 and var_210_2 >= var_210_3.group_mask then
			if underscore.any(underscore.flatten(var_210_3.task_group), function(arg_211_0)
				return var_210_0:getTaskVO(arg_211_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD, {
					cmd = 1,
					activity_id = arg_210_0.id
				})

				return true
			end
		elseif not var_210_3 then
			warning("battlepass_task_group表中不存在 id = " .. iter_210_1)
		end
	end

	return false
end

function setShipCardFrame(arg_212_0, arg_212_1, arg_212_2)
	arg_212_0.localScale = Vector3.one
	arg_212_0.anchorMin = Vector2.zero
	arg_212_0.anchorMax = Vector2.one

	local var_212_0 = arg_212_2 or arg_212_1

	GetImageSpriteFromAtlasAsync("shipframe", var_212_0, arg_212_0)

	local var_212_1 = pg.frame_resource[var_212_0]

	if var_212_1 then
		local var_212_2 = var_212_1.param

		arg_212_0.offsetMin = Vector2(var_212_2[1], var_212_2[2])
		arg_212_0.offsetMax = Vector2(var_212_2[3], var_212_2[4])
	else
		arg_212_0.offsetMin = Vector2.zero
		arg_212_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_213_0, arg_213_1, arg_213_2)
	arg_213_0.localScale = Vector3.one
	arg_213_0.anchorMin = Vector2.zero
	arg_213_0.anchorMax = Vector2.one

	setImageSprite(arg_213_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_213_2 or arg_213_1)))

	local var_213_0 = "b" .. (arg_213_2 or arg_213_1)
	local var_213_1 = pg.frame_resource[var_213_0]

	if var_213_1 then
		local var_213_2 = var_213_1.param

		arg_213_0.offsetMin = Vector2(var_213_2[1], var_213_2[2])
		arg_213_0.offsetMax = Vector2(var_213_2[3], var_213_2[4])
	else
		arg_213_0.offsetMin = Vector2.zero
		arg_213_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_214_0, arg_214_1)
	if arg_214_1 then
		local var_214_0 = arg_214_1 .. "(Clone)"
		local var_214_1 = false

		eachChild(arg_214_0, function(arg_215_0)
			setActive(arg_215_0, arg_215_0.name == var_214_0)

			var_214_1 = var_214_1 or arg_215_0.name == var_214_0
		end)

		if not var_214_1 then
			LoadAndInstantiateAsync("effect", arg_214_1, function(arg_216_0)
				if IsNil(arg_214_0) or findTF(arg_214_0, var_214_0) then
					Object.Destroy(arg_216_0)
				else
					setParent(arg_216_0, arg_214_0)
					setActive(arg_216_0, true)
				end
			end)
		end
	end

	setActive(arg_214_0, arg_214_1)
end

function setProposeMarkIcon(arg_217_0, arg_217_1)
	local var_217_0 = arg_217_0:Find("proposeShipCard(Clone)")
	local var_217_1 = arg_217_1.propose and not arg_217_1:ShowPropose()

	if var_217_0 then
		setActive(var_217_0, var_217_1)
	elseif var_217_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_218_0)
			if IsNil(arg_217_0) or arg_217_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_218_0)
			else
				setParent(arg_218_0, arg_217_0, false)
			end
		end)
	end
end

function flushShipCard(arg_219_0, arg_219_1)
	local var_219_0 = arg_219_1:rarity2bgPrint()
	local var_219_1 = findTF(arg_219_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_219_0, "", var_219_1)

	local var_219_2 = findTF(arg_219_0, "content/ship_icon")
	local var_219_3 = arg_219_1 and {
		"shipYardIcon/" .. arg_219_1:getPainting(),
		arg_219_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_219_3[1], var_219_3[2], var_219_2)

	local var_219_4 = arg_219_1:getShipType()
	local var_219_5 = findTF(arg_219_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_219_4), var_219_5)
	setText(findTF(arg_219_0, "content/dockyard/lv/Text"), defaultValue(arg_219_1.level, 1))

	local var_219_6 = arg_219_1:getStar()
	local var_219_7 = arg_219_1:getMaxStar()
	local var_219_8 = findTF(arg_219_0, "content/front/stars")

	setActive(var_219_8, true)

	local var_219_9 = findTF(var_219_8, "star_tpl")
	local var_219_10 = var_219_8.childCount

	for iter_219_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_219_11 = var_219_10 < iter_219_0 and cloneTplTo(var_219_9, var_219_8) or var_219_8:GetChild(iter_219_0 - 1)

		setActive(var_219_11, iter_219_0 <= var_219_7)
		triggerToggle(var_219_11, iter_219_0 <= var_219_6)
	end

	local var_219_12 = findTF(arg_219_0, "content/front/frame")
	local var_219_13, var_219_14 = arg_219_1:GetFrameAndEffect()

	setShipCardFrame(var_219_12, var_219_0, var_219_13)
	setFrameEffect(findTF(arg_219_0, "content/front/bg_other"), var_219_14)
	setProposeMarkIcon(arg_219_0:Find("content/dockyard/propose"), arg_219_1)
end

function TweenItemAlphaAndWhite(arg_220_0)
	LeanTween.cancel(arg_220_0)

	local var_220_0 = GetOrAddComponent(arg_220_0, "CanvasGroup")

	var_220_0.alpha = 0

	LeanTween.alphaCanvas(var_220_0, 1, 0.2):setUseEstimatedTime(true)

	local var_220_1 = findTF(arg_220_0.transform, "white_mask")

	if var_220_1 then
		setActive(var_220_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_221_0)
	LeanTween.cancel(arg_221_0)

	GetOrAddComponent(arg_221_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_222_0)
	local var_222_0 = {}
	local var_222_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_222_2 = getProxy(CollectionProxy):getShipGroup(arg_222_0)

	if var_222_2 then
		local var_222_3 = ShipGroup.getSkinList(arg_222_0)

		for iter_222_0, iter_222_1 in ipairs(var_222_3) do
			if iter_222_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_222_1, iter_222_1.id) or iter_222_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_222_2.trans or iter_222_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_222_2.married == 1 then
				var_222_0[iter_222_1.id] = true
			end
		end
	end

	return var_222_0
end

function split(arg_223_0, arg_223_1)
	local var_223_0 = {}

	if not arg_223_0 then
		return nil
	end

	local var_223_1 = #arg_223_0
	local var_223_2 = 1

	while var_223_2 <= var_223_1 do
		local var_223_3 = string.find(arg_223_0, arg_223_1, var_223_2)

		if var_223_3 == nil then
			table.insert(var_223_0, string.sub(arg_223_0, var_223_2, var_223_1))

			break
		end

		table.insert(var_223_0, string.sub(arg_223_0, var_223_2, var_223_3 - 1))

		if var_223_3 == var_223_1 then
			table.insert(var_223_0, "")

			break
		end

		var_223_2 = var_223_3 + 1
	end

	return var_223_0
end

function NumberToChinese(arg_224_0, arg_224_1)
	local var_224_0 = ""
	local var_224_1 = #arg_224_0

	for iter_224_0 = 1, var_224_1 do
		local var_224_2 = string.sub(arg_224_0, iter_224_0, iter_224_0)

		if var_224_2 ~= "0" or var_224_2 == "0" and not arg_224_1 then
			if arg_224_1 then
				if var_224_1 >= 2 then
					if iter_224_0 == 1 then
						if var_224_2 == "1" then
							var_224_0 = i18n("number_" .. 10)
						else
							var_224_0 = i18n("number_" .. var_224_2) .. i18n("number_" .. 10)
						end
					else
						var_224_0 = var_224_0 .. i18n("number_" .. var_224_2)
					end
				else
					var_224_0 = var_224_0 .. i18n("number_" .. var_224_2)
				end
			else
				var_224_0 = var_224_0 .. i18n("number_" .. var_224_2)
			end
		end
	end

	return var_224_0
end

function getActivityTask(arg_225_0, arg_225_1)
	local var_225_0 = getProxy(TaskProxy)
	local var_225_1 = arg_225_0:getConfig("config_data")
	local var_225_2 = arg_225_0:getNDay(arg_225_0.data1)
	local var_225_3
	local var_225_4
	local var_225_5

	for iter_225_0 = math.max(arg_225_0.data3, 1), math.min(var_225_2, #var_225_1) do
		local var_225_6 = _.flatten({
			var_225_1[iter_225_0]
		})

		for iter_225_1, iter_225_2 in ipairs(var_225_6) do
			local var_225_7 = var_225_0:getTaskById(iter_225_2)

			if var_225_7 then
				return var_225_7.id, var_225_7
			end

			if var_225_4 then
				var_225_5 = var_225_0:getFinishTaskById(iter_225_2)

				if var_225_5 then
					var_225_4 = var_225_5
				elseif arg_225_1 then
					return iter_225_2
				else
					return var_225_4.id, var_225_4
				end
			else
				var_225_4 = var_225_0:getFinishTaskById(iter_225_2)
				var_225_5 = var_225_5 or iter_225_2
			end
		end
	end

	if var_225_4 then
		return var_225_4.id, var_225_4
	else
		return var_225_5
	end
end

function setImageFromImage(arg_226_0, arg_226_1, arg_226_2)
	local var_226_0 = GetComponent(arg_226_0, "Image")

	var_226_0.sprite = GetComponent(arg_226_1, "Image").sprite

	if arg_226_2 then
		var_226_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_227_0)
	local var_227_0, var_227_1, var_227_2, var_227_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_227_0)

	if var_227_0 >= 1 then
		return i18n("limit_skin_time_day", var_227_0)
	elseif var_227_0 <= 0 and var_227_1 > 0 then
		return i18n("limit_skin_time_day_min", var_227_1, var_227_2)
	elseif var_227_0 <= 0 and var_227_1 <= 0 and (var_227_2 > 0 or var_227_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_227_2, 1))
	elseif var_227_0 <= 0 and var_227_1 <= 0 and var_227_2 <= 0 and var_227_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_228_0)
	local var_228_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_228_1 = math.max(arg_228_0 - var_228_0, 0)
	local var_228_2 = math.floor(var_228_1 / 86400)

	if var_228_2 > 0 then
		return i18n("time_remaining_tip") .. var_228_2 .. i18n("word_date")
	else
		local var_228_3 = math.floor(var_228_1 / 3600)

		if var_228_3 > 0 then
			return i18n("time_remaining_tip") .. var_228_3 .. i18n("word_hour")
		else
			local var_228_4 = math.floor(var_228_1 / 60)

			if var_228_4 > 0 then
				return i18n("time_remaining_tip") .. var_228_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_228_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_229_0)
	local var_229_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_229_0
	local var_229_1 = var_229_0 / 86400

	if var_229_1 > 1 then
		return i18n("ins_word_day", math.floor(var_229_1))
	else
		local var_229_2 = var_229_0 / 3600

		if var_229_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_229_2))
		else
			local var_229_3 = var_229_0 / 60

			if var_229_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_229_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_230_0)
	local var_230_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_230_0
	local var_230_1 = var_230_0 / 86400

	if var_230_1 > 1 then
		return i18n1(math.floor(var_230_1) .. "d")
	else
		local var_230_2 = var_230_0 / 3600

		if var_230_2 > 1 then
			return i18n1(math.floor(var_230_2) .. "h")
		else
			local var_230_3 = var_230_0 / 60

			if var_230_3 > 1 then
				return i18n1(math.floor(var_230_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_231_0)
	local var_231_0, var_231_1, var_231_2, var_231_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_231_0)

	if var_231_0 <= 0 and var_231_1 <= 0 and var_231_2 <= 0 and var_231_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_231_0, var_231_1, var_231_2)
	end
end

function checkExist(arg_232_0, ...)
	local var_232_0 = {
		...
	}

	for iter_232_0, iter_232_1 in ipairs(var_232_0) do
		if arg_232_0 == nil then
			break
		end

		assert(type(arg_232_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_232_1) == "table", "type error : param should be table")

		if type(arg_232_0[iter_232_1[1]]) == "function" then
			arg_232_0 = arg_232_0[iter_232_1[1]](arg_232_0, unpack(iter_232_1[2] or {}))
		else
			arg_232_0 = arg_232_0[iter_232_1[1]]
		end
	end

	return arg_232_0
end

function AcessWithinNull(arg_233_0, arg_233_1)
	if arg_233_0 == nil then
		return
	end

	assert(type(arg_233_0) == "table")

	return arg_233_0[arg_233_1]
end

function showRepairMsgbox()
	local var_234_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_234_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_234_2 = {
		text = i18n("msgbox_repair_painting"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-painting.csv") then
				BundleWizard.Inst:GetGroupMgr("PAINTING"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = i18n("resource_verify_warn"),
		custom = {
			var_234_2,
			var_234_1,
			var_234_0
		}
	})
end

function resourceVerify(arg_238_0, arg_238_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_238_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_238_1
	local var_238_2 = PathMgr.ReadAllLines(var_238_0)
	local var_238_3 = {}

	if arg_238_0 then
		setActive(arg_238_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_238_4()
		if arg_238_0 then
			setActive(arg_238_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_238_1)

		if var_238_1 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("resource_verify_fail", ""),
				onYes = function()
					VersionMgr.Inst:DeleteCacheFiles()
					Application.Quit()
				end
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("resource_verify_success")
			})
		end
	end

	local var_238_5 = var_238_2.Length
	local var_238_6

	local function var_238_7(arg_241_0)
		if arg_241_0 < 0 then
			var_238_4()

			return
		end

		if arg_238_1 then
			setSlider(arg_238_1, 0, var_238_5, var_238_5 - arg_241_0)
		end

		local var_241_0 = string.split(var_238_2[arg_241_0], ",")
		local var_241_1 = var_241_0[1]
		local var_241_2 = var_241_0[3]
		local var_241_3 = PathMgr.getAssetBundle(var_241_1)

		if PathMgr.FileExists(var_241_3) then
			local var_241_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_241_1))

			if var_241_2 == HashUtil.CalcMD5(var_241_4) then
				onNextTick(function()
					var_238_7(arg_241_0 - 1)
				end)

				return
			end
		end

		var_238_1 = var_241_1

		var_238_4()
	end

	var_238_7(var_238_5 - 1)
end

function splitByWordEN(arg_243_0, arg_243_1)
	local var_243_0 = string.split(arg_243_0, " ")
	local var_243_1 = ""
	local var_243_2 = ""
	local var_243_3 = arg_243_1:GetComponent(typeof(RectTransform))
	local var_243_4 = arg_243_1:GetComponent(typeof(Text))
	local var_243_5 = var_243_3.rect.width

	for iter_243_0, iter_243_1 in ipairs(var_243_0) do
		local var_243_6 = var_243_2

		var_243_2 = var_243_2 == "" and iter_243_1 or var_243_2 .. " " .. iter_243_1

		setText(arg_243_1, var_243_2)

		if var_243_5 < var_243_4.preferredWidth then
			var_243_1 = var_243_1 == "" and var_243_6 or var_243_1 .. "\n" .. var_243_6
			var_243_2 = iter_243_1
		end

		if iter_243_0 >= #var_243_0 then
			var_243_1 = var_243_1 == "" and var_243_2 or var_243_1 .. "\n" .. var_243_2
		end
	end

	return var_243_1
end

function checkBirthFormat(arg_244_0)
	if #arg_244_0 ~= 8 then
		return false
	end

	local var_244_0 = 0
	local var_244_1 = #arg_244_0

	while var_244_0 < var_244_1 do
		local var_244_2 = string.byte(arg_244_0, var_244_0 + 1)

		if var_244_2 < 48 or var_244_2 > 57 then
			return false
		end

		var_244_0 = var_244_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_245_0)
	local var_245_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_245_0, function(arg_246_0)
		return arg_246_0 == arg_245_0
	end)
end

function GetServerState(arg_247_0)
	local var_247_0 = -1
	local var_247_1 = 0
	local var_247_2 = 1
	local var_247_3 = 2
	local var_247_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_247_4 = string.gsub(var_247_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_247_4, function(arg_248_0, arg_248_1)
		local var_248_0 = true
		local var_248_1 = false

		for iter_248_0 in string.gmatch(arg_248_1, "\"state\":%d") do
			if iter_248_0 ~= "\"state\":1" then
				var_248_0 = false
			end

			var_248_1 = true
		end

		if not var_248_1 then
			var_248_0 = false
		end

		if arg_247_0 ~= nil then
			arg_247_0(var_248_0 and var_247_2 or var_247_1)
		end
	end)
end

function setScrollText(arg_249_0, arg_249_1)
	GetOrAddComponent(arg_249_0, "ScrollText"):SetText(arg_249_1)
end

function changeToScrollText(arg_250_0, arg_250_1)
	local var_250_0 = GetComponent(arg_250_0, typeof(Text))

	assert(var_250_0, "without component<Text>")

	local var_250_1 = arg_250_0:Find("subText")

	if not var_250_1 then
		var_250_1 = cloneTplTo(arg_250_0, arg_250_0, "subText")

		eachChild(arg_250_0, function(arg_251_0)
			setActive(arg_251_0, arg_251_0 == var_250_1)
		end)

		arg_250_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_250_1, arg_250_1)
end

local var_0_18
local var_0_19
local var_0_20
local var_0_21

local function var_0_22(arg_252_0, arg_252_1, arg_252_2)
	local var_252_0 = arg_252_0:Find("base")
	local var_252_1, var_252_2, var_252_3 = Equipment.GetInfoTrans(arg_252_1, arg_252_2)

	if arg_252_1.nextValue then
		local var_252_4 = {
			name = arg_252_1.name,
			type = arg_252_1.type,
			value = arg_252_1.nextValue
		}
		local var_252_5, var_252_6 = Equipment.GetInfoTrans(var_252_4, arg_252_2)

		var_252_2 = var_252_2 .. setColorStr("   >   " .. var_252_6, COLOR_GREEN)
	end

	setText(var_252_0:Find("name"), var_252_1)

	if var_252_3 then
		local var_252_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_252_0:Find("value"), var_252_2 .. var_252_7)
	else
		setText(var_252_0:Find("value"), var_252_2)
	end

	setActive(var_252_0:Find("value/up"), arg_252_1.compare and arg_252_1.compare > 0)
	setActive(var_252_0:Find("value/down"), arg_252_1.compare and arg_252_1.compare < 0)
	triggerToggle(var_252_0, arg_252_1.lock_open)

	if not arg_252_1.lock_open and arg_252_1.sub and #arg_252_1.sub > 0 then
		GetComponent(var_252_0, typeof(Toggle)).enabled = true
	else
		setActive(var_252_0:Find("name/close"), false)
		setActive(var_252_0:Find("name/open"), false)

		GetComponent(var_252_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_23(arg_253_0, arg_253_1, arg_253_2, arg_253_3)
	var_0_22(arg_253_0, arg_253_2, arg_253_3)

	if not arg_253_2.sub or #arg_253_2.sub == 0 then
		return
	end

	var_0_20(arg_253_0:Find("subs"), arg_253_1, arg_253_2.sub, arg_253_3)
end

function var_0_20(arg_254_0, arg_254_1, arg_254_2, arg_254_3)
	removeAllChildren(arg_254_0)
	var_0_21(arg_254_0, arg_254_1, arg_254_2, arg_254_3)
end

function var_0_21(arg_255_0, arg_255_1, arg_255_2, arg_255_3)
	for iter_255_0, iter_255_1 in ipairs(arg_255_2) do
		local var_255_0 = cloneTplTo(arg_255_1, arg_255_0)

		var_0_23(var_255_0, arg_255_1, iter_255_1, arg_255_3)
	end
end

function updateEquipInfo(arg_256_0, arg_256_1, arg_256_2, arg_256_3)
	local var_256_0 = arg_256_0:Find("attr_tpl")

	var_0_20(arg_256_0:Find("attrs"), var_256_0, arg_256_1.attrs, arg_256_3)
	setActive(arg_256_0:Find("skill"), arg_256_2)

	if arg_256_2 then
		var_0_23(arg_256_0:Find("skill/attr"), var_256_0, {
			name = i18n("skill"),
			value = setColorStr(arg_256_2.name, "#FFDE00FF")
		}, arg_256_3)
		setText(arg_256_0:Find("skill/value/Text"), getSkillDescGet(arg_256_2.id))
	end

	setActive(arg_256_0:Find("weapon"), #arg_256_1.weapon.sub > 0)

	if #arg_256_1.weapon.sub > 0 then
		var_0_20(arg_256_0:Find("weapon"), var_256_0, {
			arg_256_1.weapon
		}, arg_256_3)
	end

	setActive(arg_256_0:Find("equip_info"), #arg_256_1.equipInfo.sub > 0)

	if #arg_256_1.equipInfo.sub > 0 then
		var_0_20(arg_256_0:Find("equip_info"), var_256_0, {
			arg_256_1.equipInfo
		}, arg_256_3)
	end

	var_0_23(arg_256_0:Find("part/attr"), var_256_0, {
		name = i18n("equip_info_23")
	}, arg_256_3)

	local var_256_1 = arg_256_0:Find("part/value")
	local var_256_2 = var_256_1:Find("label")
	local var_256_3 = {}
	local var_256_4 = {}

	if #arg_256_1.part[1] == 0 and #arg_256_1.part[2] == 0 then
		setmetatable(var_256_3, {
			__index = function(arg_257_0, arg_257_1)
				return true
			end
		})
		setmetatable(var_256_4, {
			__index = function(arg_258_0, arg_258_1)
				return true
			end
		})
	else
		for iter_256_0, iter_256_1 in ipairs(arg_256_1.part[1]) do
			var_256_3[iter_256_1] = true
		end

		for iter_256_2, iter_256_3 in ipairs(arg_256_1.part[2]) do
			var_256_4[iter_256_3] = true
		end
	end

	local var_256_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_256_3, var_256_4)

	UIItemList.StaticAlign(var_256_1, var_256_2, #var_256_5, function(arg_259_0, arg_259_1, arg_259_2)
		arg_259_1 = arg_259_1 + 1

		if arg_259_0 == UIItemList.EventUpdate then
			local var_259_0 = var_256_5[arg_259_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_259_0), arg_259_2)
			setActive(arg_259_2:Find("main"), var_256_3[var_259_0] and not var_256_4[var_259_0])
			setActive(arg_259_2:Find("sub"), var_256_4[var_259_0] and not var_256_3[var_259_0])
			setImageAlpha(arg_259_2, not var_256_3[var_259_0] and not var_256_4[var_259_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_260_0, arg_260_1, arg_260_2)
	local var_260_0 = arg_260_0:Find("attr_tpl")

	var_0_20(arg_260_0:Find("attrs"), var_260_0, arg_260_1.attrs, arg_260_2)
	setActive(arg_260_0:Find("weapon"), #arg_260_1.weapon.sub > 0)

	if #arg_260_1.weapon.sub > 0 then
		var_0_20(arg_260_0:Find("weapon"), var_260_0, {
			arg_260_1.weapon
		}, arg_260_2)
	end

	setActive(arg_260_0:Find("equip_info"), #arg_260_1.equipInfo.sub > 0)

	if #arg_260_1.equipInfo.sub > 0 then
		var_0_20(arg_260_0:Find("equip_info"), var_260_0, {
			arg_260_1.equipInfo
		}, arg_260_2)
	end
end

function setCanvasOverrideSorting(arg_261_0, arg_261_1)
	local var_261_0 = arg_261_0.parent

	arg_261_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_261_0) then
		GetOrAddComponent(arg_261_0, typeof(Canvas)).overrideSorting = arg_261_1
	else
		setActive(arg_261_0, true)

		GetOrAddComponent(arg_261_0, typeof(Canvas)).overrideSorting = arg_261_1

		setActive(arg_261_0, false)
	end

	arg_261_0:SetParent(var_261_0, false)
end

function createNewGameObject(arg_262_0, arg_262_1)
	local var_262_0 = GameObject.New()

	if arg_262_0 then
		var_262_0.name = "model"
	end

	var_262_0.layer = arg_262_1 or Layer.UI

	return GetOrAddComponent(var_262_0, "RectTransform")
end

function CreateShell(arg_263_0)
	if type(arg_263_0) ~= "table" and type(arg_263_0) ~= "userdata" then
		return arg_263_0
	end

	local var_263_0 = setmetatable({
		__index = arg_263_0
	}, arg_263_0)

	return setmetatable({}, var_263_0)
end

function CameraFittingSettin(arg_264_0)
	local var_264_0 = GetComponent(arg_264_0, typeof(Camera))
	local var_264_1 = 1.7777777777777777
	local var_264_2 = Screen.width / Screen.height

	if var_264_2 < var_264_1 then
		local var_264_3 = var_264_2 / var_264_1

		var_264_0.rect = var_0_0.Rect.New(0, (1 - var_264_3) / 2, 1, var_264_3)
	end
end

function SwitchSpecialChar(arg_265_0, arg_265_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_265_0 = arg_265_0:gsub(" ", " ")
		arg_265_0 = arg_265_0:gsub("\t", "    ")
	end

	if not arg_265_1 then
		arg_265_0 = arg_265_0:gsub("\n", " ")
	end

	return arg_265_0
end

function AfterCheck(arg_266_0, arg_266_1)
	local var_266_0 = {}

	for iter_266_0, iter_266_1 in ipairs(arg_266_0) do
		var_266_0[iter_266_0] = iter_266_1[1]()
	end

	arg_266_1()

	for iter_266_2, iter_266_3 in ipairs(arg_266_0) do
		if var_266_0[iter_266_2] ~= iter_266_3[1]() then
			iter_266_3[2]()
		end

		var_266_0[iter_266_2] = iter_266_3[1]()
	end
end

function CompareFuncs(arg_267_0, arg_267_1)
	local var_267_0 = {}

	local function var_267_1(arg_268_0, arg_268_1)
		var_267_0[arg_268_0] = var_267_0[arg_268_0] or {}
		var_267_0[arg_268_0][arg_268_1] = var_267_0[arg_268_0][arg_268_1] or arg_267_0[arg_268_0](arg_268_1)

		return var_267_0[arg_268_0][arg_268_1]
	end

	return function(arg_269_0, arg_269_1)
		local var_269_0 = 1

		while var_269_0 <= #arg_267_0 do
			local var_269_1 = var_267_1(var_269_0, arg_269_0)
			local var_269_2 = var_267_1(var_269_0, arg_269_1)

			if var_269_1 == var_269_2 then
				var_269_0 = var_269_0 + 1
			else
				return var_269_1 < var_269_2
			end
		end

		return tobool(arg_267_1)
	end
end

function DropResultIntegration(arg_270_0)
	local var_270_0 = {}
	local var_270_1 = 1

	while var_270_1 <= #arg_270_0 do
		local var_270_2 = arg_270_0[var_270_1].type
		local var_270_3 = arg_270_0[var_270_1].id

		var_270_0[var_270_2] = var_270_0[var_270_2] or {}

		if var_270_0[var_270_2][var_270_3] then
			local var_270_4 = arg_270_0[var_270_0[var_270_2][var_270_3]]
			local var_270_5 = table.remove(arg_270_0, var_270_1)

			var_270_4.count = var_270_4.count + var_270_5.count
		else
			var_270_0[var_270_2][var_270_3] = var_270_1
			var_270_1 = var_270_1 + 1
		end
	end

	local var_270_6 = {
		function(arg_271_0)
			local var_271_0 = arg_271_0.type
			local var_271_1 = arg_271_0.id

			if var_271_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_271_0 == DROP_TYPE_RESOURCE then
				if var_271_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_271_0 == DROP_TYPE_ITEM then
				if var_271_1 == 59010 then
					return 4
				elseif var_271_1 == 59900 then
					return 5
				else
					local var_271_2 = Item.getConfigData(var_271_1)
					local var_271_3 = var_271_2 and var_271_2.type or 0

					if var_271_3 == 9 then
						return 6
					elseif var_271_3 == 5 then
						return 7
					elseif var_271_3 == 4 then
						return 8
					elseif var_271_3 == 7 then
						return 9
					end
				end
			elseif var_271_0 == DROP_TYPE_VITEM and var_271_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_272_0)
			local var_272_0

			if arg_272_0.type == DROP_TYPE_SHIP then
				var_272_0 = pg.ship_data_statistics[arg_272_0.id]
			elseif arg_272_0.type == DROP_TYPE_ITEM then
				var_272_0 = Item.getConfigData(arg_272_0.id)
			end

			return (var_272_0 and var_272_0.rarity or 0) * -1
		end,
		function(arg_273_0)
			return arg_273_0.id
		end
	}

	table.sort(arg_270_0, CompareFuncs(var_270_6))
end

function getLoginConfig()
	local var_274_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_274_1 = 1

	for iter_274_0, iter_274_1 in ipairs(pg.login.all) do
		if pg.login[iter_274_1].date ~= "stop" then
			local var_274_2, var_274_3 = parseTimeConfig(pg.login[iter_274_1].date)

			assert(not var_274_3)

			if pg.TimeMgr.GetInstance():inTime(var_274_2, var_274_0) then
				var_274_1 = iter_274_1

				break
			end
		end
	end

	local var_274_4 = pg.login[var_274_1].login_static

	var_274_4 = var_274_4 ~= "" and var_274_4 or "login"

	local var_274_5 = pg.login[var_274_1].login_cri
	local var_274_6 = var_274_5 ~= "" and true or false
	local var_274_7 = pg.login[var_274_1].op_play == 1 and true or false
	local var_274_8 = pg.login[var_274_1].op_time

	if var_274_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_274_8, var_274_0) then
		var_274_7 = false
	end

	local var_274_9 = var_274_8 == "" and var_274_8 or table.concat(var_274_8[1][1])

	return var_274_6, var_274_6 and var_274_5 or var_274_4, pg.login[var_274_1].bgm, var_274_7, var_274_9
end

function setIntimacyIcon(arg_275_0, arg_275_1, arg_275_2)
	local var_275_0 = {}
	local var_275_1

	seriesAsync({
		function(arg_276_0)
			if arg_275_0.childCount > 0 then
				var_275_1 = arg_275_0:GetChild(0)

				arg_276_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_277_0)
					var_275_1 = tf(arg_277_0)

					setParent(var_275_1, arg_275_0)
					arg_276_0()
				end)
			end
		end,
		function(arg_278_0)
			setImageAlpha(var_275_1, arg_275_2 and 0 or 1)
			eachChild(var_275_1, function(arg_279_0)
				setActive(arg_279_0, false)
			end)

			if arg_275_2 then
				local var_278_0 = var_275_1:Find(arg_275_2 .. "(Clone)")

				if not var_278_0 then
					LoadAndInstantiateAsync("ui", arg_275_2, function(arg_280_0)
						setParent(arg_280_0, var_275_1)
						setActive(arg_280_0, true)
					end)
				else
					setActive(var_278_0, true)
				end
			elseif arg_275_1 then
				setImageSprite(var_275_1, GetSpriteFromAtlas("energy", arg_275_1), true)
			else
				assert(false, "param error")
			end
		end
	})
end

local var_0_24

function nowWorld()
	var_0_24 = var_0_24 or getProxy(WorldProxy)

	return var_0_24 and var_0_24.world
end

function removeWorld()
	var_0_24.world:Dispose()

	var_0_24.world = nil
	var_0_24 = nil
end

function switch(arg_283_0, arg_283_1, arg_283_2, ...)
	if arg_283_1[arg_283_0] then
		return arg_283_1[arg_283_0](...)
	elseif arg_283_2 then
		return arg_283_2(...)
	end
end

function parseTimeConfig(arg_284_0)
	if type(arg_284_0[1]) == "table" then
		return arg_284_0[2], arg_284_0[1]
	else
		return arg_284_0
	end
end

local var_0_25 = {
	__add = function(arg_285_0, arg_285_1)
		return NewPos(arg_285_0.x + arg_285_1.x, arg_285_0.y + arg_285_1.y)
	end,
	__sub = function(arg_286_0, arg_286_1)
		return NewPos(arg_286_0.x - arg_286_1.x, arg_286_0.y - arg_286_1.y)
	end,
	__mul = function(arg_287_0, arg_287_1)
		if type(arg_287_1) == "number" then
			return NewPos(arg_287_0.x * arg_287_1, arg_287_0.y * arg_287_1)
		else
			return NewPos(arg_287_0.x * arg_287_1.x, arg_287_0.y * arg_287_1.y)
		end
	end,
	__eq = function(arg_288_0, arg_288_1)
		return arg_288_0.x == arg_288_1.x and arg_288_0.y == arg_288_1.y
	end,
	__tostring = function(arg_289_0)
		return arg_289_0.x .. "_" .. arg_289_0.y
	end
}

function NewPos(arg_290_0, arg_290_1)
	assert(arg_290_0 and arg_290_1)

	local var_290_0 = setmetatable({
		x = arg_290_0,
		y = arg_290_1
	}, var_0_25)

	function var_290_0.SqrMagnitude(arg_291_0)
		return arg_291_0.x * arg_291_0.x + arg_291_0.y * arg_291_0.y
	end

	function var_290_0.Normalize(arg_292_0)
		local var_292_0 = arg_292_0:SqrMagnitude()

		if var_292_0 > 1e-05 then
			return arg_292_0 * (1 / math.sqrt(var_292_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_290_0
end

local var_0_26

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_26 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_26 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_294_0)
	return (string.char(226, 133, 160 + (arg_294_0 - 1)))
end

function quickPlayAnimator(arg_295_0, arg_295_1)
	arg_295_0:GetComponent(typeof(Animator)):Play(arg_295_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_296_0, arg_296_1)
	local var_296_0 = arg_296_0:GetComponent(typeof(Animator))

	var_296_0.enabled = true

	local var_296_1 = Animator.StringToHash(arg_296_1)

	if var_296_0:HasState(0, var_296_1) then
		var_296_0:Play(arg_296_1, -1, 0)
	end
end

function quickPlayAnimation(arg_297_0, arg_297_1)
	arg_297_0:GetComponent(typeof(Animation)):Play(arg_297_1)
end

function getSurveyUrl(arg_298_0)
	local var_298_0 = pg.survey_data_template[arg_298_0]
	local var_298_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_298_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_298_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_298_1 = var_298_0.main_url
				else
					var_298_1 = var_298_0.uo_url
				end
			elseif var_298_2 == PLATFORM_IPHONEPLAYER then
				var_298_1 = var_298_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_KR then
			var_298_1 = var_298_0.main_url
		end
	else
		var_298_1 = var_298_0.main_url
	end

	local var_298_3 = getProxy(PlayerProxy):getRawData().id
	local var_298_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_298_5
	local var_298_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_298_7 = getProxy(UserProxy):getRawData()
	local var_298_8 = getProxy(ServerProxy):getRawData()[var_298_7 and var_298_7.server or 0]
	local var_298_9 = var_298_8 and var_298_8.id or ""
	local var_298_10 = getProxy(PlayerProxy):getRawData().level
	local var_298_11 = var_298_3 .. "_" .. arg_298_0
	local var_298_12 = var_298_1
	local var_298_13 = {
		var_298_3,
		var_298_4,
		var_298_6,
		var_298_9,
		var_298_10,
		var_298_11
	}

	if var_298_12 then
		for iter_298_0, iter_298_1 in ipairs(var_298_13) do
			var_298_12 = string.gsub(var_298_12, "$" .. iter_298_0, tostring(iter_298_1))
		end
	end

	originalPrint("survey url", tostring(var_298_12))

	return var_298_12
end

function GetMoneySymbol()
	if PLATFORM_CH == PLATFORM_CODE then
		return "￥"
	elseif PLATFORM_JP == PLATFORM_CODE then
		return "￥"
	elseif PLATFORM_KR == PLATFORM_CODE then
		return "₩"
	elseif PLATFORM_US == PLATFORM_CODE then
		return "$"
	elseif PLATFORM_CHT == PLATFORM_CODE then
		return "TWD"
	end

	return ""
end

function FilterVarchar(arg_300_0)
	assert(type(arg_300_0) == "string" or type(arg_300_0) == "table")

	if arg_300_0 == "" then
		return nil
	end

	return arg_300_0
end

function getGameset(arg_301_0)
	local var_301_0 = pg.gameset[arg_301_0]

	assert(var_301_0)

	return {
		var_301_0.key_value,
		var_301_0.description
	}
end

function getDorm3dGameset(arg_302_0)
	local var_302_0 = pg.dorm3d_set[arg_302_0]

	assert(var_302_0)

	return {
		var_302_0.key_value_int,
		var_302_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_303_0)
	arg_303_0 = arg_303_0 or {}

	local var_303_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_303_0 > 0 do
		local var_303_1 = table.remove(arg_303_0)

		switch(var_303_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_303_1:getConfig("open_directly") == 1 then
					for iter_304_0, iter_304_1 in ipairs(var_303_1:getConfig("display_icon")) do
						local var_304_0 = Drop.Create(iter_304_1)

						var_304_0.count = var_304_0.count * var_303_1.count

						table.insert(arg_303_0, var_304_0)
					end
				elseif var_303_1:getSubClass():IsShipExpType() then
					var_303_0[var_303_1.type][var_303_1.id] = defaultValue(var_303_0[var_303_1.type][var_303_1.id], 0) + var_303_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_303_0[var_303_1.type][var_303_1.id] = defaultValue(var_303_0[var_303_1.type][var_303_1.id], 0) + var_303_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_303_0[var_303_1.type] = var_303_0[var_303_1.type] + var_303_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_303_0[var_303_1.type] = var_303_0[var_303_1.type] + var_303_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_303_0[var_303_1.type] = var_303_0[var_303_1.type] + var_303_1.count
			end
		})
	end

	return var_303_0
end

function CheckOverflow(arg_309_0, arg_309_1)
	local var_309_0 = {}
	local var_309_1 = arg_309_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_309_2 = arg_309_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_309_3 = arg_309_0[DROP_TYPE_EQUIP]
	local var_309_4 = arg_309_0[DROP_TYPE_SHIP]
	local var_309_5 = getProxy(PlayerProxy):getRawData()
	local var_309_6 = false

	if arg_309_1 then
		local var_309_7 = var_309_5:OverStore(PlayerConst.ResStoreGold, var_309_1)
		local var_309_8 = var_309_5:OverStore(PlayerConst.ResStoreOil, var_309_2)

		if var_309_7 > 0 or var_309_8 > 0 then
			var_309_0.isStoreOverflow = {
				var_309_7,
				var_309_8
			}
		end
	else
		if var_309_1 > 0 and var_309_5:GoldMax(var_309_1) then
			return false, "gold"
		end

		if var_309_2 > 0 and var_309_5:OilMax(var_309_2) then
			return false, "oil"
		end
	end

	var_309_0.isExpBookOverflow = {}

	for iter_309_0, iter_309_1 in pairs(arg_309_0[DROP_TYPE_ITEM]) do
		local var_309_9 = Item.getConfigData(iter_309_0)

		if getProxy(BagProxy):getItemCountById(iter_309_0) + iter_309_1 > var_309_9.max_num then
			table.insert(var_309_0.isExpBookOverflow, iter_309_0)
		end
	end

	local var_309_10 = getProxy(EquipmentProxy):getCapacity()

	if var_309_3 > 0 and var_309_10 >= var_309_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_309_11 = getProxy(BayProxy):getShipCount()

	if var_309_4 > 0 and var_309_4 + var_309_11 > var_309_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_309_0
end

function CheckShipExpOverflow(arg_310_0)
	local var_310_0 = getProxy(BagProxy)

	for iter_310_0, iter_310_1 in pairs(arg_310_0[DROP_TYPE_ITEM]) do
		if var_310_0:getItemCountById(iter_310_0) + iter_310_1 > Item.getConfigData(iter_310_0).max_num then
			return false
		end
	end

	return true
end

local var_0_27 = {
	[17] = "item_type17_tip2",
	tech = "techpackage_item_use_confirm",
	[16] = "item_type16_tip2",
	[11] = "equip_skin_detail_tip",
	[13] = "item_type13_tip2"
}

function RegisterDetailButton(arg_311_0, arg_311_1, arg_311_2)
	Drop.Change(arg_311_2)
	switch(arg_311_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_311_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_312_0 = Item.getConfigData(arg_311_2.id).usage_arg
				local var_312_1 = var_312_0[3]

				if Item.InTimeLimitSkinAssigned(arg_311_2.id) then
					var_312_1 = table.mergeArray(var_312_0[2], var_312_1, true)
				end

				local var_312_2 = {}

				for iter_312_0, iter_312_1 in ipairs(var_312_0[2]) do
					var_312_2[iter_312_1] = true
				end

				onButton(arg_311_0, arg_311_1, function()
					arg_311_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_311_2.id,
								selectableSkinList = underscore.map(var_312_1, function(arg_314_0)
									return SelectableSkin.New({
										id = arg_314_0,
										isTimeLimit = var_312_2[arg_314_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_311_1, true)
			else
				local var_312_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_311_2.id) and "tech" or arg_311_2:getConfig("type")

				if var_0_27[var_312_3] then
					local var_312_4 = {
						item2Row = true,
						content = i18n(var_0_27[var_312_3]),
						itemList = underscore.map(arg_311_2:getConfig("display_icon"), function(arg_315_0)
							return Drop.Create(arg_315_0)
						end)
					}

					if var_312_3 == 11 then
						onButton(arg_311_0, arg_311_1, function()
							arg_311_0:emit(BaseUI.ON_DROP_LIST_OWN, var_312_4)
						end, SFX_PANEL)
					else
						onButton(arg_311_0, arg_311_1, function()
							arg_311_0:emit(BaseUI.ON_DROP_LIST, var_312_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_311_1, tobool(var_0_27[var_312_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_311_0, arg_311_1, function()
				arg_311_0:emit(BaseUI.ON_DROP, arg_311_2)
			end, SFX_PANEL)
			setActive(arg_311_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_311_0, arg_311_1, function()
				arg_311_0:emit(BaseUI.ON_DROP, arg_311_2)
			end, SFX_PANEL)
			setActive(arg_311_1, true)
		end
	}, function()
		setActive(arg_311_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_323_0, arg_323_1, arg_323_2)
	Drop.Change(arg_323_2)
	switch(arg_323_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_324_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_323_2.id) and "tech" or arg_323_2:getConfig("type")

			if var_0_27[var_324_0] then
				local var_324_1 = {
					useDeepShow = true,
					showOwn = var_324_0 == 11,
					content = i18n(var_0_27[var_324_0]),
					itemList = underscore.map(arg_323_2:getConfig("display_icon"), function(arg_325_0)
						return Drop.Create(arg_325_0)
					end)
				}

				onButton(arg_323_0, arg_323_1, function()
					arg_323_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_324_1)
				end, SFX_PANEL)
			end

			setActive(arg_323_1, tobool(var_0_27[var_324_0]))
		end
	}, function()
		setActive(arg_323_1, false)
	end)
end

function UpdateOwnDisplay(arg_328_0, arg_328_1)
	local var_328_0, var_328_1 = arg_328_1:getOwnedCount()

	setActive(arg_328_0, var_328_1 and var_328_0 > 0)

	if var_328_1 and var_328_0 > 0 then
		setText(arg_328_0:Find("label"), i18n("word_own1"))
		setText(arg_328_0:Find("Text"), var_328_0)
	end
end

function Damp(arg_329_0, arg_329_1, arg_329_2)
	arg_329_1 = Mathf.Max(1, arg_329_1)

	local var_329_0 = Mathf.Epsilon

	if arg_329_1 < var_329_0 or var_329_0 > Mathf.Abs(arg_329_0) then
		return arg_329_0
	end

	if arg_329_2 < var_329_0 then
		return 0
	end

	local var_329_1 = -4.605170186

	return arg_329_0 * (1 - Mathf.Exp(var_329_1 * arg_329_2 / arg_329_1))
end

function checkCullResume(arg_330_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_330_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_330_0 = arg_330_0:GetComponentsInChildren(typeof(MeshImage)):ToTable()

		for iter_330_0, iter_330_1 in ipairs(var_330_0) do
			iter_330_1:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_331_0)
	local var_331_0 = {}

	if arg_331_0 and arg_331_0 ~= "" then
		local var_331_1 = base64.dec(arg_331_0)

		var_331_0 = string.split(var_331_1, "/")
		var_331_0[5], var_331_0[6] = unpack(string.split(var_331_0[5], "\\"))

		if #var_331_0 < 6 or arg_331_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_331_0, 5), "/"),
			var_331_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_331_0 = {}
		end
	end

	for iter_331_0 = 1, 6 do
		var_331_0[iter_331_0] = var_331_0[iter_331_0] and tonumber(var_331_0[iter_331_0], 32) or 0
	end

	return var_331_0
end

function buildEquipCode(arg_332_0)
	local var_332_0 = underscore.map(arg_332_0:getAllEquipments(), function(arg_333_0)
		return ConversionBase(32, arg_333_0 and arg_333_0.id or 0)
	end)
	local var_332_1 = {
		table.concat(var_332_0, "/"),
		ConversionBase(32, checkExist(arg_332_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_332_1, "\\"))
end

function setDirectorSpeed(arg_334_0, arg_334_1)
	GetComponent(arg_334_0, "TimelineSpeed"):SetTimelineSpeed(arg_334_1)
end

function setDefaultZeroMetatable(arg_335_0)
	return setmetatable(arg_335_0, {
		__index = function(arg_336_0, arg_336_1)
			if rawget(arg_336_0, arg_336_1) == nil then
				arg_336_0[arg_336_1] = 0
			end

			return arg_336_0[arg_336_1]
		end
	})
end

function checkABExist(arg_337_0)
	if EDITOR_TOOL then
		return ResourceMgr.Inst:AssetExist(arg_337_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_337_0))
	end
end

function compareNumber(arg_338_0, arg_338_1, arg_338_2)
	return switch(arg_338_1, {
		[">"] = function()
			return arg_338_0 > arg_338_2
		end,
		[">="] = function()
			return arg_338_0 >= arg_338_2
		end,
		["="] = function()
			return arg_338_0 == arg_338_2
		end,
		["<"] = function()
			return arg_338_0 < arg_338_2
		end,
		["<="] = function()
			return arg_338_0 <= arg_338_2
		end
	})
end

function ArabicToRoman(arg_344_0)
	local var_344_0 = {
		{
			1000,
			"M"
		},
		{
			900,
			"CM"
		},
		{
			500,
			"D"
		},
		{
			400,
			"CD"
		},
		{
			100,
			"C"
		},
		{
			90,
			"XC"
		},
		{
			50,
			"L"
		},
		{
			40,
			"XL"
		},
		{
			10,
			"X"
		},
		{
			9,
			"IX"
		},
		{
			5,
			"V"
		},
		{
			4,
			"IV"
		},
		{
			1,
			"I"
		}
	}

	local function var_344_1(arg_345_0, arg_345_1)
		return select(2, arg_345_0:gsub(arg_345_1, ""))
	end

	local var_344_2 = ""

	while arg_344_0 > 0 do
		for iter_344_0, iter_344_1 in pairs(var_344_0) do
			local var_344_3 = iter_344_1[2]
			local var_344_4 = iter_344_1[1]

			while var_344_4 <= arg_344_0 do
				var_344_2 = var_344_2 .. var_344_3
				arg_344_0 = arg_344_0 - var_344_4
			end
		end
	end

	if arg_344_0 > 10000 then
		local var_344_5 = var_344_1(var_344_2, "M")

		var_344_2 = "M*" .. var_344_5 .. " " .. var_344_2
	end

	return var_344_2
end

function stringInset(arg_346_0, ...)
	for iter_346_0, iter_346_1 in ipairs({
		...
	}) do
		arg_346_0 = string.gsub(arg_346_0, "$" .. iter_346_0, iter_346_1)
	end

	return arg_346_0
end
