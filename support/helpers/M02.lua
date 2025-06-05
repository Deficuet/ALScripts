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

function setPaintingPrefab(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
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
end

local var_0_2 = {}

function setPaintingPrefabAsync(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	local var_36_0 = arg_36_1

	if checkABExist("painting/" .. arg_36_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_36_1, 0) ~= 0 then
		arg_36_1 = arg_36_1 .. "_n"
	end

	LoadPaintingPrefabAsync(arg_36_0, var_36_0, arg_36_1, arg_36_2, arg_36_3)
end

function LoadPaintingPrefabAsync(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
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
end

function retPaintingPrefab(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_0 and arg_39_1 then
		local var_39_0 = findTF(arg_39_0, "fitter")

		if var_39_0 and var_39_0.childCount > 0 then
			local var_39_1 = var_39_0:GetChild(0)

			if not IsNil(var_39_1) then
				local var_39_2 = findTF(var_39_1, "Touch")

				if not IsNil(var_39_2) then
					eachChild(var_39_2, function(arg_40_0)
						local var_40_0 = arg_40_0:GetComponent(typeof(Button))

						if not IsNil(var_40_0) then
							removeOnButton(arg_40_0)
						end
					end)
				end

				if not arg_39_2 then
					PoolMgr.GetInstance():ReturnPainting(string.gsub(var_39_1.name, "%(Clone%)", ""), var_39_1.gameObject)
				else
					PoolMgr.GetInstance():ReturnPaintingWithPrefix(string.gsub(var_39_1.name, "%(Clone%)", ""), var_39_1.gameObject, arg_39_2)
				end
			end
		end

		var_0_2[arg_39_0] = nil
	end
end

function checkPaintingPrefab(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	local var_41_0 = findTF(arg_41_0, "fitter")

	assert(var_41_0, "请添加子物体fitter")
	removeAllChildren(var_41_0)

	local var_41_1 = GetOrAddComponent(var_41_0, "PaintingScaler")

	var_41_1.FrameName = arg_41_2 or ""
	var_41_1.Tween = 1

	local var_41_2 = arg_41_4 or "painting/"
	local var_41_3 = arg_41_1

	if not arg_41_3 and checkABExist(var_41_2 .. arg_41_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_41_1, 0) ~= 0 then
		arg_41_1 = arg_41_1 .. "_n"
	end

	return var_41_0, arg_41_1, var_41_3
end

function onLoadedPaintingPrefab(arg_42_0)
	local var_42_0 = arg_42_0.paintingTF
	local var_42_1 = arg_42_0.fitterTF
	local var_42_2 = arg_42_0.defaultPaintingName

	setParent(var_42_0, var_42_1, false)

	local var_42_3 = findTF(var_42_0, "Touch")

	if not IsNil(var_42_3) then
		setActive(var_42_3, false)
	end

	local var_42_4 = findTF(var_42_0, "hx")

	if not IsNil(var_42_4) then
		setActive(var_42_4, HXSet.isHx())
	end

	ShipExpressionHelper.SetExpression(var_42_1:GetChild(0), var_42_2)
end

function onLoadedPaintingPrefabAsync(arg_43_0)
	local var_43_0 = arg_43_0.paintingTF
	local var_43_1 = arg_43_0.fitterTF
	local var_43_2 = arg_43_0.objectOrTransform
	local var_43_3 = arg_43_0.paintingName
	local var_43_4 = arg_43_0.defaultPaintingName
	local var_43_5 = arg_43_0.callback

	if IsNil(var_43_2) or var_0_2[var_43_2] ~= var_43_3 then
		PoolMgr.GetInstance():ReturnPainting(var_43_3, var_43_0)

		return
	else
		setParent(var_43_0, var_43_1, false)

		var_0_2[var_43_2] = nil

		ShipExpressionHelper.SetExpression(var_43_0, var_43_4)
	end

	local var_43_6 = findTF(var_43_0, "Touch")

	if not IsNil(var_43_6) then
		setActive(var_43_6, false)
	end

	local var_43_7 = findTF(var_43_0, "hx")

	if not IsNil(var_43_7) then
		setActive(var_43_7, HXSet.isHx())
	end

	if var_43_5 then
		var_43_5()
	end
end

function setCommanderPaintingPrefab(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0, var_44_1, var_44_2 = checkPaintingPrefab(arg_44_0, arg_44_1, arg_44_2, arg_44_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_44_1, false, function(arg_45_0)
		local var_45_0 = {
			paintingTF = arg_45_0,
			fitterTF = var_44_0,
			defaultPaintingName = var_44_2
		}

		onLoadedPaintingPrefab(var_45_0)
	end, "commanderpainting/")
end

function setCommanderPaintingPrefabAsync(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	local var_46_0, var_46_1, var_46_2 = checkPaintingPrefab(arg_46_0, arg_46_1, arg_46_2, arg_46_4)

	var_0_2[arg_46_0] = var_46_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_46_1, true, function(arg_47_0)
		local var_47_0 = {
			paintingTF = arg_47_0,
			fitterTF = var_46_0,
			objectOrTransform = arg_46_0,
			paintingName = var_46_1,
			defaultPaintingName = var_46_2,
			callback = arg_46_3
		}

		onLoadedPaintingPrefabAsync(var_47_0)
	end, "commanderpainting/")
end

function retCommanderPaintingPrefab(arg_48_0, arg_48_1)
	retPaintingPrefab(arg_48_0, arg_48_1, "commanderpainting/")
end

function setMetaPaintingPrefab(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0, var_49_1, var_49_2 = checkPaintingPrefab(arg_49_0, arg_49_1, arg_49_2, arg_49_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_49_1, false, function(arg_50_0)
		local var_50_0 = {
			paintingTF = arg_50_0,
			fitterTF = var_49_0,
			defaultPaintingName = var_49_2
		}

		onLoadedPaintingPrefab(var_50_0)
	end, "metapainting/")
end

function setMetaPaintingPrefabAsync(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4)
	local var_51_0, var_51_1, var_51_2 = checkPaintingPrefab(arg_51_0, arg_51_1, arg_51_2, arg_51_4)

	var_0_2[arg_51_0] = var_51_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_51_1, true, function(arg_52_0)
		local var_52_0 = {
			paintingTF = arg_52_0,
			fitterTF = var_51_0,
			objectOrTransform = arg_51_0,
			paintingName = var_51_1,
			defaultPaintingName = var_51_2,
			callback = arg_51_3
		}

		onLoadedPaintingPrefabAsync(var_52_0)
	end, "metapainting/")
end

function retMetaPaintingPrefab(arg_53_0, arg_53_1)
	retPaintingPrefab(arg_53_0, arg_53_1, "metapainting/")
end

function setGuildPaintingPrefab(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	local var_54_0, var_54_1, var_54_2 = checkPaintingPrefab(arg_54_0, arg_54_1, arg_54_2, arg_54_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_54_1, false, function(arg_55_0)
		local var_55_0 = {
			paintingTF = arg_55_0,
			fitterTF = var_54_0,
			defaultPaintingName = var_54_2
		}

		onLoadedPaintingPrefab(var_55_0)
	end, "guildpainting/")
end

function setGuildPaintingPrefabAsync(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	local var_56_0, var_56_1, var_56_2 = checkPaintingPrefab(arg_56_0, arg_56_1, arg_56_2, arg_56_4)

	var_0_2[arg_56_0] = var_56_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_56_1, true, function(arg_57_0)
		local var_57_0 = {
			paintingTF = arg_57_0,
			fitterTF = var_56_0,
			objectOrTransform = arg_56_0,
			paintingName = var_56_1,
			defaultPaintingName = var_56_2,
			callback = arg_56_3
		}

		onLoadedPaintingPrefabAsync(var_57_0)
	end, "guildpainting/")
end

function retGuildPaintingPrefab(arg_58_0, arg_58_1)
	retPaintingPrefab(arg_58_0, arg_58_1, "guildpainting/")
end

function setShopPaintingPrefab(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	local var_59_0, var_59_1, var_59_2 = checkPaintingPrefab(arg_59_0, arg_59_1, arg_59_2, arg_59_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_59_1, false, function(arg_60_0)
		local var_60_0 = {
			paintingTF = arg_60_0,
			fitterTF = var_59_0,
			defaultPaintingName = var_59_2
		}

		onLoadedPaintingPrefab(var_60_0)
	end, "shoppainting/")
end

function retShopPaintingPrefab(arg_61_0, arg_61_1)
	retPaintingPrefab(arg_61_0, arg_61_1, "shoppainting/")
end

function setBuildPaintingPrefabAsync(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4)
	local var_62_0, var_62_1, var_62_2 = checkPaintingPrefab(arg_62_0, arg_62_1, arg_62_2, arg_62_4)

	var_0_2[arg_62_0] = var_62_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_62_1, true, function(arg_63_0)
		local var_63_0 = {
			paintingTF = arg_63_0,
			fitterTF = var_62_0,
			objectOrTransform = arg_62_0,
			paintingName = var_62_1,
			defaultPaintingName = var_62_2,
			callback = arg_62_3
		}

		onLoadedPaintingPrefabAsync(var_63_0)
	end, "buildpainting/")
end

function retBuildPaintingPrefab(arg_64_0, arg_64_1)
	retPaintingPrefab(arg_64_0, arg_64_1, "buildpainting/")
end

function setColorCount(arg_65_0, arg_65_1, arg_65_2)
	setText(arg_65_0, string.format(arg_65_1 < arg_65_2 and "<color=" .. COLOR_RED .. ">%d</color>/%d" or "%d/%d", arg_65_1, arg_65_2))
end

function customColorCount(arg_66_0, arg_66_1, arg_66_2, arg_66_3, arg_66_4)
	arg_66_0.text = _customColorCount(arg_66_1, arg_66_2, arg_66_3, arg_66_4)
end

function _customColorCount(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	local var_67_0 = arg_67_0 < arg_67_1 and arg_67_3 or arg_67_2

	return string.format("<color=" .. var_67_0 .. ">%d</color>/%d" or "%d/%d", arg_67_0, arg_67_1)
end

function setColorStr(arg_68_0, arg_68_1)
	return "<color=" .. arg_68_1 .. ">" .. arg_68_0 .. "</color>"
end

function setSizeStr(arg_69_0, arg_69_1)
	local var_69_0, var_69_1 = string.gsub(arg_69_0, "[<]size=%d+[>]", "<size=" .. arg_69_1 .. ">")

	if var_69_1 == 0 then
		var_69_0 = "<size=" .. arg_69_1 .. ">" .. var_69_0 .. "</size>"
	end

	return var_69_0
end

function getBgm(arg_70_0, arg_70_1)
	local var_70_0 = pg.voice_bgm[arg_70_0]

	if pg.CriMgr.GetInstance():IsDefaultBGM() then
		return var_70_0 and var_70_0.default_bgm or nil
	elseif var_70_0 then
		if var_70_0.special_bgm and type(var_70_0.special_bgm) == "table" and #var_70_0.special_bgm > 0 and _.all(var_70_0.special_bgm, function(arg_71_0)
			return type(arg_71_0) == "table" and #arg_71_0 > 2 and type(arg_71_0[2]) == "number"
		end) then
			local var_70_1 = Clone(var_70_0.special_bgm)

			table.sort(var_70_1, function(arg_72_0, arg_72_1)
				return arg_72_0[2] > arg_72_1[2]
			end)

			local var_70_2 = ""

			_.each(var_70_1, function(arg_73_0)
				if var_70_2 ~= "" then
					return
				end

				local var_73_0 = arg_73_0[1]
				local var_73_1 = arg_73_0[3]

				switch(var_73_0, {
					function()
						local var_74_0 = var_73_1[1]
						local var_74_1 = var_73_1[2]

						if #var_74_0 == 1 then
							if var_74_0[1] ~= "always" then
								return
							end
						elseif not pg.TimeMgr.GetInstance():inTime(var_74_0) then
							return
						end

						_.each(var_74_1, function(arg_75_0)
							if var_70_2 ~= "" then
								return
							end

							if #arg_75_0 == 2 and pg.TimeMgr.GetInstance():inPeriod(arg_75_0[1]) then
								var_70_2 = arg_75_0[2]
							elseif #arg_75_0 == 3 and pg.TimeMgr.GetInstance():inPeriod(arg_75_0[1], arg_75_0[2]) then
								var_70_2 = arg_75_0[3]
							end
						end)
					end,
					function()
						local var_76_0 = false
						local var_76_1 = ""

						_.each(var_73_1, function(arg_77_0)
							if #arg_77_0 ~= 2 or var_76_0 then
								return
							end

							if pg.NewStoryMgr.GetInstance():IsPlayed(arg_77_0[1]) then
								var_70_2 = arg_77_0[2]

								if var_70_2 ~= "" then
									var_76_1 = var_70_2
								else
									var_70_2 = var_76_1
								end
							else
								var_76_0 = true
							end
						end)
					end,
					function()
						if not arg_70_1 then
							return
						end

						_.each(var_73_1, function(arg_79_0)
							if #arg_79_0 == 2 and arg_79_0[1] == arg_70_1 then
								var_70_2 = arg_79_0[2]

								return
							end
						end)
					end
				})
			end)

			return var_70_2 ~= "" and var_70_2 or var_70_0.bgm
		else
			return var_70_0 and var_70_0.bgm or nil
		end
	else
		return nil
	end
end

function playStory(arg_80_0, arg_80_1)
	pg.NewStoryMgr.GetInstance():Play(arg_80_0, arg_80_1)
end

function errorMessage(arg_81_0)
	local var_81_0 = ERROR_MESSAGE[arg_81_0]

	if var_81_0 == nil then
		var_81_0 = ERROR_MESSAGE[9999] .. ":" .. arg_81_0
	end

	return var_81_0
end

function errorTip(arg_82_0, arg_82_1, ...)
	local var_82_0 = pg.gametip[arg_82_0 .. "_error"]
	local var_82_1

	if var_82_0 then
		var_82_1 = var_82_0.tip
	else
		var_82_1 = pg.gametip.common_error.tip
	end

	local var_82_2 = arg_82_0 .. "_error_" .. arg_82_1

	if pg.gametip[var_82_2] then
		local var_82_3 = i18n(var_82_2, ...)

		return var_82_1 .. var_82_3
	else
		local var_82_4 = "common_error_" .. arg_82_1

		if pg.gametip[var_82_4] then
			local var_82_5 = i18n(var_82_4, ...)

			return var_82_1 .. var_82_5
		else
			local var_82_6 = errorMessage(arg_82_1)

			return var_82_1 .. arg_82_1 .. ":" .. var_82_6
		end
	end
end

function colorNumber(arg_83_0, arg_83_1)
	local var_83_0 = "@COLOR_SCOPE"
	local var_83_1 = {}

	arg_83_0 = string.gsub(arg_83_0, "<color=#%x+>", function(arg_84_0)
		table.insert(var_83_1, arg_84_0)

		return var_83_0
	end)
	arg_83_0 = string.gsub(arg_83_0, "%d+%.?%d*%%*", function(arg_85_0)
		return "<color=" .. arg_83_1 .. ">" .. arg_85_0 .. "</color>"
	end)

	if #var_83_1 > 0 then
		local var_83_2 = 0

		return (string.gsub(arg_83_0, var_83_0, function(arg_86_0)
			var_83_2 = var_83_2 + 1

			return var_83_1[var_83_2]
		end))
	else
		return arg_83_0
	end
end

function getBounds(arg_87_0)
	local var_87_0 = LuaHelper.GetWorldCorners(rtf(arg_87_0))
	local var_87_1 = Bounds.New(var_87_0[0], Vector3.zero)

	var_87_1:Encapsulate(var_87_0[2])

	return var_87_1
end

local function var_0_3(arg_88_0, arg_88_1)
	arg_88_0.localScale = Vector3.one
	arg_88_0.anchorMin = Vector2.zero
	arg_88_0.anchorMax = Vector2.one
	arg_88_0.offsetMin = Vector2(arg_88_1[1], arg_88_1[2])
	arg_88_0.offsetMax = Vector2(-arg_88_1[3], -arg_88_1[4])
end

local var_0_4 = {
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
local var_0_5 = {
	["IconColorful(Clone)"] = 1,
	["Item_duang5(Clone)"] = 99,
	specialFrame = 2
}

function setFrame(arg_89_0, arg_89_1, arg_89_2)
	arg_89_1 = tostring(arg_89_1)

	local var_89_0, var_89_1 = unpack((string.split(arg_89_1, "_")))

	if var_89_1 or tonumber(var_89_0) > 5 then
		arg_89_2 = arg_89_2 or "frame" .. arg_89_1
	end

	GetImageSpriteFromAtlasAsync("weaponframes", "frame", arg_89_0)

	local var_89_2 = arg_89_2 and Color.white or Color.NewHex(ItemRarity.Rarity2FrameHexColor(var_89_0 and tonumber(var_89_0) or ItemRarity.Gray))

	setImageColor(arg_89_0, var_89_2)

	local var_89_3 = findTF(arg_89_0, "specialFrame")

	if arg_89_2 then
		if var_89_3 then
			setActive(var_89_3, true)
		else
			var_89_3 = cloneTplTo(arg_89_0, arg_89_0, "specialFrame")

			removeAllChildren(var_89_3)
		end

		var_0_3(var_89_3, var_0_4[arg_89_2] or var_0_4.other)
		GetImageSpriteFromAtlasAsync("weaponframes", arg_89_2, var_89_3)
	elseif var_89_3 then
		setActive(var_89_3, false)
	end
end

function setIconColorful(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
	arg_90_3 = arg_90_3 or {
		[ItemRarity.SSR] = {
			name = "IconColorful",
			active = function(arg_91_0, arg_91_1)
				return not arg_91_1.noIconColorful and arg_91_0 == ItemRarity.SSR
			end
		}
	}

	local var_90_0 = findTF(arg_90_0, "icon_bg/frame")

	for iter_90_0, iter_90_1 in pairs(arg_90_3) do
		local var_90_1 = iter_90_1.name
		local var_90_2 = iter_90_1.active(arg_90_1, arg_90_2)
		local var_90_3 = var_90_0:Find(var_90_1 .. "(Clone)")

		if var_90_3 then
			setActive(var_90_3, var_90_2)
		elseif var_90_2 then
			LoadAndInstantiateAsync("ui", string.lower(var_90_1), function(arg_92_0)
				if IsNil(arg_90_0) or var_90_0:Find(var_90_1 .. "(Clone)") then
					Object.Destroy(arg_92_0)
				else
					local var_92_0 = var_0_5[arg_92_0.name] or 999
					local var_92_1 = underscore.range(var_90_0.childCount):chain():map(function(arg_93_0)
						return var_90_0:GetChild(arg_93_0 - 1)
					end):map(function(arg_94_0)
						return var_0_5[arg_94_0.name] or 0
					end):value()
					local var_92_2 = 0

					for iter_92_0 = #var_92_1, 1, -1 do
						if var_92_0 > var_92_1[iter_92_0] then
							var_92_2 = iter_92_0

							break
						end
					end

					setParent(arg_92_0, var_90_0)
					tf(arg_92_0):SetSiblingIndex(var_92_2)
					setActive(arg_92_0, var_90_2)
				end
			end)
		end
	end
end

function setIconStars(arg_95_0, arg_95_1, arg_95_2)
	local var_95_0 = findTF(arg_95_0, "icon_bg/startpl")
	local var_95_1 = findTF(arg_95_0, "icon_bg/stars")

	if var_95_1 and var_95_0 then
		setActive(var_95_1, false)
		setActive(var_95_0, false)
	end

	if not var_95_1 or not arg_95_1 then
		return
	end

	for iter_95_0 = 1, math.max(arg_95_2, var_95_1.childCount) do
		setActive(iter_95_0 > var_95_1.childCount and cloneTplTo(var_95_0, var_95_1) or var_95_1:GetChild(iter_95_0 - 1), iter_95_0 <= arg_95_2)
	end

	setActive(var_95_1, true)
end

local function var_0_6(arg_96_0, arg_96_1)
	local var_96_0 = findTF(arg_96_0, "icon_bg/slv")

	if not IsNil(var_96_0) then
		setActive(var_96_0, arg_96_1 > 0)
		setText(findTF(var_96_0, "Text"), arg_96_1)
	end
end

function setIconName(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0 = findTF(arg_97_0, "name")

	if not IsNil(var_97_0) then
		setText(var_97_0, arg_97_1)
		setTextAlpha(var_97_0, (arg_97_2.hideName or arg_97_2.anonymous) and 0 or 1)
	end
end

function setIconCount(arg_98_0, arg_98_1)
	local var_98_0 = findTF(arg_98_0, "icon_bg/count")

	if not IsNil(var_98_0) then
		setText(var_98_0, arg_98_1 and (type(arg_98_1) ~= "number" or arg_98_1 > 0) and arg_98_1 or "")
	end
end

function updateEquipment(arg_99_0, arg_99_1, arg_99_2)
	arg_99_2 = arg_99_2 or {}

	assert(arg_99_1, "equipmentVo can not be nil.")

	local var_99_0 = EquipmentRarity.Rarity2Print(arg_99_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_99_0, findTF(arg_99_0, "icon_bg"))
	setFrame(findTF(arg_99_0, "icon_bg/frame"), var_99_0)

	local var_99_1 = findTF(arg_99_0, "icon_bg/icon")

	var_0_3(var_99_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. arg_99_1:getConfig("icon"), "", var_99_1)
	setIconStars(arg_99_0, true, arg_99_1:getConfig("rarity"))
	var_0_6(arg_99_0, arg_99_1:getConfig("level") - 1)
	setIconName(arg_99_0, arg_99_1:getConfig("name"), arg_99_2)
	setIconCount(arg_99_0, arg_99_1.count)
	setIconColorful(arg_99_0, arg_99_1:getConfig("rarity") - 1, arg_99_2)
end

function updateItem(arg_100_0, arg_100_1, arg_100_2)
	arg_100_2 = arg_100_2 or {}

	local var_100_0 = ItemRarity.Rarity2Print(arg_100_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_100_0, findTF(arg_100_0, "icon_bg"))

	local var_100_1

	if arg_100_1:getConfig("type") == 9 then
		var_100_1 = "frame_design"
	elseif arg_100_1:getConfig("type") == 100 then
		var_100_1 = "frame_dorm"
	elseif arg_100_2.frame then
		var_100_1 = arg_100_2.frame
	end

	setFrame(findTF(arg_100_0, "icon_bg/frame"), var_100_0, var_100_1)

	local var_100_2 = findTF(arg_100_0, "icon_bg/icon")
	local var_100_3 = arg_100_1.icon or arg_100_1:getConfig("icon")

	if arg_100_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		assert(arg_100_1.extra, "without extra data")

		var_100_3 = "SquareIcon/" .. ShipGroup.getDefaultSkin(arg_100_1.extra).painting
	end

	GetImageSpriteFromAtlasAsync(var_100_3, "", var_100_2)
	setIconStars(arg_100_0, false)
	setIconName(arg_100_0, arg_100_1:getName(), arg_100_2)
	setIconColorful(arg_100_0, arg_100_1:getConfig("rarity"), arg_100_2)
end

function updateIslandUnlock(arg_101_0, arg_101_1)
	local var_101_0 = arg_101_1:getConfigTable().cmd_icon
	local var_101_1 = IslandItemRarity.Rarity2FrameName(ItemRarity.Gold)

	GetImageSpriteFromAtlasAsync("islandframe", var_101_1, findTF(arg_101_0, "icon_bg"))

	if not IsNil(findTF(arg_101_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("islandframe", var_101_1, findTF(arg_101_0, "icon_bg/frame"))
	end

	setActive(findTF(arg_101_0, "icon_bg/count_bg/count"), false)
	GetImageSpriteFromAtlasAsync(var_101_0, "", findTF(arg_101_0, "icon_bg/icon"))
	setIconName(arg_101_0, "", {})
end

function updateIslandItem(arg_102_0, arg_102_1)
	local var_102_0 = arg_102_1:getConfigTable().rarity
	local var_102_1 = arg_102_1:getConfigTable().icon
	local var_102_2 = arg_102_1:getConfigTable().name
	local var_102_3 = IslandItemRarity.Rarity2FrameName(var_102_0)

	GetImageSpriteFromAtlasAsync("islandframe", var_102_3, findTF(arg_102_0, "icon_bg"))

	if not IsNil(findTF(arg_102_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("islandframe", var_102_3, findTF(arg_102_0, "icon_bg/frame"))
	end

	setActive(findTF(arg_102_0, "icon_bg/count_bg"), arg_102_1.count > 0)
	setText(findTF(arg_102_0, "icon_bg/count_bg/count"), arg_102_1.count)
	GetImageSpriteFromAtlasAsync(var_102_1, "", findTF(arg_102_0, "icon_bg/icon"))
	setIconName(arg_102_0, var_102_2, {})
end

function updateWorldItem(arg_103_0, arg_103_1, arg_103_2)
	arg_103_2 = arg_103_2 or {}

	local var_103_0 = ItemRarity.Rarity2Print(arg_103_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_103_0, findTF(arg_103_0, "icon_bg"))
	setFrame(findTF(arg_103_0, "icon_bg/frame"), var_103_0)

	local var_103_1 = findTF(arg_103_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_103_1.icon or arg_103_1:getConfig("icon"), "", var_103_1)
	setIconStars(arg_103_0, false)
	setIconName(arg_103_0, arg_103_1:getConfig("name"), arg_103_2)
	setIconColorful(arg_103_0, arg_103_1:getConfig("rarity"), arg_103_2)
end

function updateWorldCollection(arg_104_0, arg_104_1, arg_104_2)
	arg_104_2 = arg_104_2 or {}

	assert(arg_104_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_104_1.id)

	local var_104_0 = arg_104_1:getDropRarity()
	local var_104_1 = ItemRarity.Rarity2Print(var_104_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_104_1, findTF(arg_104_0, "icon_bg"))
	setFrame(findTF(arg_104_0, "icon_bg/frame"), var_104_1)

	local var_104_2 = findTF(arg_104_0, "icon_bg/icon")
	local var_104_3 = WorldCollectionProxy.GetCollectionType(arg_104_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_104_3, "", var_104_2)
	setIconStars(arg_104_0, false)
	setIconName(arg_104_0, arg_104_1:getName(), arg_104_2)
	setIconColorful(arg_104_0, var_104_0, arg_104_2)
end

function updateWorldBuff(arg_105_0, arg_105_1, arg_105_2)
	arg_105_2 = arg_105_2 or {}

	local var_105_0 = pg.world_SLGbuff_data[arg_105_1]

	assert(var_105_0, "找不到大世界buff配置: " .. arg_105_1)

	local var_105_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_105_1, findTF(arg_105_0, "icon_bg"))
	setFrame(findTF(arg_105_0, "icon_bg/frame"), var_105_1)

	local var_105_2 = findTF(arg_105_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_105_0.icon, "", var_105_2)

	local var_105_3 = arg_105_0:Find("icon_bg/stars")

	if not IsNil(var_105_3) then
		setActive(var_105_3, false)
	end

	local var_105_4 = findTF(arg_105_0, "name")

	if not IsNil(var_105_4) then
		setText(var_105_4, var_105_0.name)
	end

	local var_105_5 = findTF(arg_105_0, "icon_bg/count")

	if not IsNil(var_105_5) then
		SetActive(var_105_5, false)
	end
end

function updateShip(arg_106_0, arg_106_1, arg_106_2)
	arg_106_2 = arg_106_2 or {}

	local var_106_0 = arg_106_1:rarity2bgPrint()
	local var_106_1 = arg_106_1:getPainting()

	if arg_106_2.anonymous then
		var_106_0 = "1"
		var_106_1 = "unknown"
	end

	if arg_106_2.unknown_small then
		var_106_1 = "unknown_small"
	end

	local var_106_2 = findTF(arg_106_0, "icon_bg/new")

	if var_106_2 then
		if arg_106_2.isSkin then
			setActive(var_106_2, not arg_106_2.isTimeLimit and arg_106_2.isNew)
		else
			setActive(var_106_2, arg_106_1.virgin)
		end
	end

	local var_106_3 = findTF(arg_106_0, "icon_bg/timelimit")

	if var_106_3 then
		setActive(var_106_3, arg_106_2.isTimeLimit)
	end

	local var_106_4 = findTF(arg_106_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_106_2.isSkin and "_skin" or var_106_0), var_106_4)

	local var_106_5 = findTF(arg_106_0, "icon_bg/frame")
	local var_106_6

	if arg_106_1.isNpc then
		var_106_6 = "frame_npc"
	elseif arg_106_1:ShowPropose() then
		var_106_6 = "frame_prop"

		if arg_106_1:isMetaShip() then
			var_106_6 = var_106_6 .. "_meta"
		end
	elseif arg_106_2.isSkin then
		var_106_6 = "frame_skin"
	end

	setFrame(var_106_5, var_106_0, var_106_6)

	if arg_106_2.gray then
		setGray(var_106_4, true, true)
	end

	local var_106_7 = findTF(arg_106_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_106_2.Q and "QIcon/" or "SquareIcon/") .. var_106_1, "", var_106_7)

	local var_106_8 = findTF(arg_106_0, "icon_bg/lv")

	if var_106_8 then
		setActive(var_106_8, not arg_106_1.isNpc)

		if not arg_106_1.isNpc then
			local var_106_9 = findTF(var_106_8, "Text")

			if var_106_9 and arg_106_1.level then
				setText(var_106_9, arg_106_1.level)
			end
		end
	end

	local var_106_10 = findTF(arg_106_0, "ship_type")

	if var_106_10 then
		setActive(var_106_10, true)
		setImageSprite(var_106_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_106_1:getShipType())))
	end

	local var_106_11 = var_106_4:Find("npc")

	if not IsNil(var_106_11) then
		if var_106_2 and go(var_106_2).activeSelf then
			setActive(var_106_11, false)
		else
			setActive(var_106_11, arg_106_1:isActivityNpc())
		end
	end

	local var_106_12 = arg_106_0:Find("group_locked")

	if var_106_12 then
		setActive(var_106_12, not arg_106_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_106_1.groupId))
	end

	setIconStars(arg_106_0, arg_106_2.initStar, arg_106_1:getStar())
	setIconName(arg_106_0, arg_106_2.isSkin and arg_106_1:GetSkinConfig().name or arg_106_1:getName(), arg_106_2)
	setIconColorful(arg_106_0, arg_106_2.isSkin and ItemRarity.Gold or arg_106_1:getRarity() - 1, arg_106_2)
end

function updateCommander(arg_107_0, arg_107_1, arg_107_2)
	arg_107_2 = arg_107_2 or {}

	local var_107_0 = arg_107_1:getDropRarity()
	local var_107_1 = ItemRarity.Rarity2Print(var_107_0)
	local var_107_2 = arg_107_1:getConfig("painting")

	if arg_107_2.anonymous then
		var_107_1 = 1
		var_107_2 = "unknown"
	end

	local var_107_3 = findTF(arg_107_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_107_1, var_107_3)

	local var_107_4 = findTF(arg_107_0, "icon_bg/frame")

	setFrame(var_107_4, var_107_1)

	if arg_107_2.gray then
		setGray(var_107_3, true, true)
	end

	local var_107_5 = findTF(arg_107_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_107_2, "", var_107_5)
	setIconStars(arg_107_0, arg_107_2.initStar, 0)
	setIconName(arg_107_0, arg_107_1:getName(), arg_107_2)
end

function updateStrategy(arg_108_0, arg_108_1, arg_108_2)
	arg_108_2 = arg_108_2 or {}

	local var_108_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_108_0, findTF(arg_108_0, "icon_bg"))
	setFrame(findTF(arg_108_0, "icon_bg/frame"), var_108_0)

	local var_108_1 = findTF(arg_108_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_108_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_108_1:getIcon(), "", var_108_1)
	setIconStars(arg_108_0, false)
	setIconName(arg_108_0, arg_108_1:getName(), arg_108_2)
	setIconColorful(arg_108_0, ItemRarity.Gray, arg_108_2)
end

function updateFurniture(arg_109_0, arg_109_1, arg_109_2)
	arg_109_2 = arg_109_2 or {}

	local var_109_0 = arg_109_1:getDropRarity()
	local var_109_1 = ItemRarity.Rarity2Print(var_109_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_109_1, findTF(arg_109_0, "icon_bg"))
	setFrame(findTF(arg_109_0, "icon_bg/frame"), var_109_1)

	local var_109_2 = findTF(arg_109_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_109_1:getIcon(), "", var_109_2)
	setIconStars(arg_109_0, false)
	setIconName(arg_109_0, arg_109_1:getName(), arg_109_2)
	setIconColorful(arg_109_0, var_109_0, arg_109_2)
end

function updateSpWeapon(arg_110_0, arg_110_1, arg_110_2)
	arg_110_2 = arg_110_2 or {}

	assert(arg_110_1, "spWeaponVO can not be nil.")
	assert(isa(arg_110_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_110_0 = ItemRarity.Rarity2Print(arg_110_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_110_0, findTF(arg_110_0, "icon_bg"))
	setFrame(findTF(arg_110_0, "icon_bg/frame"), var_110_0)

	local var_110_1 = findTF(arg_110_0, "icon_bg/icon")

	var_0_3(var_110_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_110_1:GetIconPath(), "", var_110_1)
	setIconStars(arg_110_0, true, arg_110_1:GetRarity())
	var_0_6(arg_110_0, arg_110_1:GetLevel() - 1)
	setIconName(arg_110_0, arg_110_1:GetName(), arg_110_2)
	setIconCount(arg_110_0, arg_110_1.count)
	setIconColorful(arg_110_0, arg_110_1:GetRarity(), arg_110_2)
end

function UpdateSpWeaponSlot(arg_111_0, arg_111_1, arg_111_2)
	local var_111_0 = ItemRarity.Rarity2Print(arg_111_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_111_0, findTF(arg_111_0, "Icon/Mask/icon_bg"))

	local var_111_1 = findTF(arg_111_0, "Icon/Mask/icon_bg/icon")

	arg_111_2 = arg_111_2 or {
		16,
		16,
		16,
		16
	}

	var_0_3(var_111_1, arg_111_2)
	GetImageSpriteFromAtlasAsync(arg_111_1:GetIconPath(), "", var_111_1)

	local var_111_2 = arg_111_1:GetLevel() - 1
	local var_111_3 = findTF(arg_111_0, "Icon/LV")

	setActive(var_111_3, var_111_2 > 0)
	setText(findTF(var_111_3, "Text"), var_111_2)
end

function updateDorm3dFurniture(arg_112_0, arg_112_1, arg_112_2)
	arg_112_2 = arg_112_2 or {}

	local var_112_0 = arg_112_1:getDropRarity()
	local var_112_1 = ItemRarity.Rarity2Print(var_112_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_112_1, findTF(arg_112_0, "icon_bg"))
	setFrame(findTF(arg_112_0, "icon_bg/frame"), var_112_1)

	local var_112_2 = findTF(arg_112_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_112_1:getIcon(), "", var_112_2)
	setIconStars(arg_112_0, false)
	setIconName(arg_112_0, arg_112_1:getName(), arg_112_2)
	setIconColorful(arg_112_0, var_112_0, arg_112_2)
end

function updateDorm3dGift(arg_113_0, arg_113_1, arg_113_2)
	arg_113_2 = arg_113_2 or {}

	local var_113_0 = arg_113_1:getDropRarity()
	local var_113_1 = ItemRarity.Rarity2Print(var_113_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_113_1, arg_113_0:Find("icon_bg"))
	setFrame(arg_113_0:Find("icon_bg/frame"), var_113_1)

	local var_113_2 = arg_113_0:Find("icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_113_1:getIcon(), "", var_113_2)
	setIconStars(arg_113_0, false)
	setIconName(arg_113_0, arg_113_1:getName(), arg_113_2)
	setIconColorful(arg_113_0, var_113_0, arg_113_2)
end

function updateDorm3dSkin(arg_114_0, arg_114_1, arg_114_2)
	arg_114_2 = arg_114_2 or {}

	local var_114_0 = arg_114_1:getDropRarity()
	local var_114_1 = ItemRarity.Rarity2Print(var_114_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_114_1, arg_114_0:Find("icon_bg"))
	setFrame(arg_114_0:Find("icon_bg/frame"), var_114_1)

	local var_114_2 = arg_114_0:Find("icon_bg/icon")

	setIconStars(arg_114_0, false)
	setIconName(arg_114_0, arg_114_1:getName(), arg_114_2)
	setIconColorful(arg_114_0, var_114_0, arg_114_2)
end

function updateDorm3dIcon(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_1:getDropRarityDorm()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_115_0), arg_115_0)

	local var_115_1 = arg_115_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_115_1:getIcon(), "", var_115_1)
	setText(arg_115_0:Find("count/Text"), "x" .. arg_115_1.count)
	setText(arg_115_0:Find("name/Text"), arg_115_1:getName())
end

local var_0_7

function findCullAndClipWorldRect(arg_116_0)
	if #arg_116_0 == 0 then
		return false
	end

	local var_116_0 = arg_116_0[1].canvasRect

	for iter_116_0 = 1, #arg_116_0 do
		var_116_0 = rectIntersect(var_116_0, arg_116_0[iter_116_0].canvasRect)
	end

	if var_116_0.width <= 0 or var_116_0.height <= 0 then
		return false
	end

	var_0_7 = var_0_7 or GameObject.Find("UICamera/Canvas").transform

	local var_116_1 = var_0_7:TransformPoint(Vector3(var_116_0.x, var_116_0.y, 0))
	local var_116_2 = var_0_7:TransformPoint(Vector3(var_116_0.x + var_116_0.width, var_116_0.y + var_116_0.height, 0))

	return true, Vector4(var_116_1.x, var_116_1.y, var_116_2.x, var_116_2.y)
end

function rectIntersect(arg_117_0, arg_117_1)
	local var_117_0 = math.max(arg_117_0.x, arg_117_1.x)
	local var_117_1 = math.min(arg_117_0.x + arg_117_0.width, arg_117_1.x + arg_117_1.width)
	local var_117_2 = math.max(arg_117_0.y, arg_117_1.y)
	local var_117_3 = math.min(arg_117_0.y + arg_117_0.height, arg_117_1.y + arg_117_1.height)

	if var_117_0 <= var_117_1 and var_117_2 <= var_117_3 then
		return var_0_0.Rect.New(var_117_0, var_117_2, var_117_1 - var_117_0, var_117_3 - var_117_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_118_0)
	local var_118_0 = {}

	for iter_118_0, iter_118_1 in ipairs(arg_118_0) do
		local var_118_1 = Drop.Create(iter_118_1)

		var_118_1.count = var_118_1.count or 1

		if var_118_1.type == DROP_TYPE_EMOJI then
			table.insert(var_118_0, var_118_1:getName())
		else
			table.insert(var_118_0, var_118_1:getName() .. "x" .. var_118_1.count)
		end
	end

	return table.concat(var_118_0, "、")
end

function updateDrop(arg_119_0, arg_119_1, arg_119_2)
	Drop.Change(arg_119_1)

	arg_119_2 = arg_119_2 or {}

	local var_119_0 = {
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
	local var_119_1

	for iter_119_0, iter_119_1 in ipairs(var_119_0) do
		local var_119_2 = arg_119_0:Find(iter_119_1[1])

		if arg_119_1.type ~= iter_119_1[2] and not IsNil(var_119_2) then
			setActive(var_119_2, false)
		end
	end

	if not IsNil(arg_119_0:Find("icon_bg/frame")) then
		arg_119_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

		setIconColorful(arg_119_0, arg_119_1:getDropRarity(), arg_119_2, {
			[ItemRarity.Gold] = {
				name = "Item_duang5",
				active = function(arg_120_0, arg_120_1)
					return arg_120_1.fromAwardLayer and arg_120_0 >= ItemRarity.Gold
				end
			}
		})
		var_0_3(findTF(arg_119_0, "icon_bg/icon"), {
			2,
			2,
			2,
			2
		})
	end

	arg_119_1:UpdateDropTpl(arg_119_0, arg_119_2)
	setIconCount(arg_119_0, arg_119_2.count or arg_119_1:getCount())
end

function updateBuff(arg_121_0, arg_121_1, arg_121_2)
	arg_121_2 = arg_121_2 or {}

	local var_121_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_121_0, findTF(arg_121_0, "icon_bg"))

	local var_121_1 = pg.benefit_buff_template[arg_121_1]

	setFrame(findTF(arg_121_0, "icon_bg/frame"), var_121_0)
	setText(findTF(arg_121_0, "icon_bg/count"), 1)

	local var_121_2 = findTF(arg_121_0, "icon_bg/icon")
	local var_121_3 = var_121_1.icon

	GetImageSpriteFromAtlasAsync(var_121_3, "", var_121_2)
	setIconStars(arg_121_0, false)
	setIconName(arg_121_0, var_121_1.name, arg_121_2)
	setIconColorful(arg_121_0, ItemRarity.Gold, arg_121_2)
end

function updateAttire(arg_122_0, arg_122_1, arg_122_2, arg_122_3)
	local var_122_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_122_0, findTF(arg_122_0, "icon_bg"))
	setFrame(findTF(arg_122_0, "icon_bg/frame"), var_122_0)

	local var_122_1 = findTF(arg_122_0, "icon_bg/icon")
	local var_122_2

	if arg_122_1 == AttireConst.TYPE_CHAT_FRAME then
		var_122_2 = "chat_frame"
	elseif arg_122_1 == AttireConst.TYPE_ICON_FRAME then
		var_122_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_122_2, "", var_122_1)
	setIconName(arg_122_0, arg_122_2.name, arg_122_3)
end

function updateAttireCombatUI(arg_123_0, arg_123_1, arg_123_2, arg_123_3)
	local var_123_0 = arg_123_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_123_0, findTF(arg_123_0, "icon_bg"))
	setFrame(findTF(arg_123_0, "icon_bg/frame"), var_123_0, "frame_battle_ui")

	local var_123_1 = findTF(arg_123_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_123_2.display_icon, "", var_123_1)
	setIconName(arg_123_0, arg_123_2.name, arg_123_3)
end

function updateActivityMedal(arg_124_0, arg_124_1, arg_124_2)
	local var_124_0 = ItemRarity.Rarity2Print(arg_124_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_124_0, findTF(arg_124_0, "icon_bg"))
	setFrame(findTF(arg_124_0, "icon_bg/frame"), var_124_0)

	local var_124_1 = findTF(arg_124_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_124_1.icon, "", var_124_1)
	setIconName(arg_124_0, arg_124_1.name, arg_124_2)
end

function updateCover(arg_125_0, arg_125_1, arg_125_2)
	local var_125_0 = arg_125_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_125_0, findTF(arg_125_0, "icon_bg"))
	setFrame(findTF(arg_125_0, "icon_bg/frame"), var_125_0)

	local var_125_1 = findTF(arg_125_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_125_1:getIcon(), "", var_125_1)
	setIconName(arg_125_0, arg_125_1:getName(), arg_125_2)
	setIconStars(arg_125_0, false)
end

function updateEmoji(arg_126_0, arg_126_1, arg_126_2)
	local var_126_0 = findTF(arg_126_0, "icon_bg/icon")
	local var_126_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_126_1, "", var_126_0)

	local var_126_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_126_2, findTF(arg_126_0, "icon_bg"))
	setFrame(findTF(arg_126_0, "icon_bg/frame"), var_126_2)
	setIconName(arg_126_0, arg_126_1.name, arg_126_2)
end

function updateEquipmentSkin(arg_127_0, arg_127_1, arg_127_2)
	arg_127_2 = arg_127_2 or {}

	local var_127_0 = EquipmentRarity.Rarity2Print(arg_127_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_127_0, findTF(arg_127_0, "icon_bg"))
	setFrame(findTF(arg_127_0, "icon_bg/frame"), var_127_0, "frame_skin")

	local var_127_1 = findTF(arg_127_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_127_1.icon, "", var_127_1)
	setIconStars(arg_127_0, false)
	setIconName(arg_127_0, arg_127_1.name, arg_127_2)
	setIconCount(arg_127_0, arg_127_1.count)
	setIconColorful(arg_127_0, arg_127_1.rarity - 1, arg_127_2)
end

function NoPosMsgBox(arg_128_0, arg_128_1, arg_128_2, arg_128_3)
	local var_128_0
	local var_128_1 = {}

	if arg_128_1 then
		table.insert(var_128_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_128_1
		})
	end

	if arg_128_2 then
		table.insert(var_128_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_128_2
		})
	end

	if arg_128_3 then
		table.insert(var_128_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_128_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_128_0,
		custom = var_128_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_129_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_129_0 and var_129_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_129_0
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
		local var_130_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_130_0 and var_130_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_130_0
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
		onClick = function(arg_133_0, arg_133_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_133_0.id,
				shipVOs = arg_133_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_134_0, arg_134_1, arg_134_2)
	if arg_134_2 then
		local var_134_0 = ""

		for iter_134_0, iter_134_1 in ipairs(arg_134_2) do
			local var_134_1 = Item.getConfigData(iter_134_1[1])

			var_134_0 = var_134_0 .. i18n(iter_134_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_134_1.name, iter_134_1[2])

			if iter_134_0 < #arg_134_2 then
				var_134_0 = var_134_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_134_0 ~= "" then
			arg_134_0 = arg_134_0 .. "\n" .. i18n("text_noRes_tip", var_134_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_134_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_134_1, arg_134_2)
		end
	})
end

function shoppingBatch(arg_136_0, arg_136_1, arg_136_2, arg_136_3, arg_136_4)
	local var_136_0 = pg.shop_template[arg_136_0]

	assert(var_136_0, "shop_template中找不到商品id：" .. arg_136_0)

	local var_136_1 = getProxy(PlayerProxy):getData()[id2res(var_136_0.resource_type)]
	local var_136_2 = arg_136_1.price or var_136_0.resource_num
	local var_136_3 = math.floor(var_136_1 / var_136_2)

	var_136_3 = var_136_3 <= 0 and 1 or var_136_3
	var_136_3 = arg_136_2 ~= nil and arg_136_2 < var_136_3 and arg_136_2 or var_136_3

	local var_136_4 = true
	local var_136_5 = 1

	if var_136_0 ~= nil and arg_136_1.id then
		print(var_136_3 * var_136_0.num, "--", var_136_3)
		assert(Item.getConfigData(arg_136_1.id), "item config should be existence")

		local var_136_6 = Item.New({
			id = arg_136_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_136_1.id
			},
			addNum = var_136_0.num,
			maxNum = var_136_3 * var_136_0.num,
			defaultNum = var_136_0.num,
			numUpdate = function(arg_137_0, arg_137_1)
				var_136_5 = math.floor(arg_137_1 / var_136_0.num)

				local var_137_0 = var_136_5 * var_136_2

				if var_137_0 > var_136_1 then
					setText(arg_137_0, i18n(arg_136_3, var_137_0, arg_137_1, COLOR_RED, var_136_6))

					var_136_4 = false
				else
					setText(arg_137_0, i18n(arg_136_3, var_137_0, arg_137_1, COLOR_GREEN, var_136_6))

					var_136_4 = true
				end
			end,
			onYes = function()
				if var_136_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_136_0,
						count = var_136_5
					})
				elseif arg_136_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_136_4))
					pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_139_0, arg_139_1, arg_139_2, arg_139_3, arg_139_4)
	local var_139_0 = pg.shop_template[arg_139_0]

	assert(var_139_0, "shop_template中找不到商品id：" .. arg_139_0)

	local var_139_1 = getProxy(PlayerProxy):getData()[id2res(var_139_0.resource_type)]
	local var_139_2 = arg_139_1.price or var_139_0.resource_num
	local var_139_3 = math.floor(var_139_1 / var_139_2)

	var_139_3 = var_139_3 <= 0 and 1 or var_139_3
	var_139_3 = arg_139_2 ~= nil and arg_139_2 < var_139_3 and arg_139_2 or var_139_3

	local var_139_4 = true
	local var_139_5 = 1

	if var_139_0 ~= nil and arg_139_1.id then
		print(var_139_3 * var_139_0.num, "--", var_139_3)
		assert(Item.getConfigData(arg_139_1.id), "item config should be existence")

		local var_139_6 = Item.New({
			id = arg_139_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_139_1.id
			}),
			price = var_139_2,
			addNum = var_139_0.num,
			maxNum = var_139_3 * var_139_0.num,
			defaultNum = var_139_0.num,
			numUpdate = function(arg_140_0, arg_140_1)
				var_139_5 = math.floor(arg_140_1 / var_139_0.num)

				local var_140_0 = var_139_5 * var_139_2

				if var_140_0 > var_139_1 then
					setTextInNewStyleBox(arg_140_0, i18n(arg_139_3, var_140_0, arg_140_1, COLOR_RED, var_139_6))

					var_139_4 = false
				else
					setTextInNewStyleBox(arg_140_0, i18n(arg_139_3, var_140_0, arg_140_1, "#238C40FF", var_139_6))

					var_139_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_139_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_139_0,
								count = var_139_5
							})
						elseif arg_139_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_139_4))
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

function gotoChargeScene(arg_142_0, arg_142_1)
	local var_142_0 = getProxy(ContextProxy)
	local var_142_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_142_1.mediator, ChargeMediator) then
		var_142_1.mediator:getViewComponent():switchSubViewByTogger(arg_142_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_142_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_142_1
		})
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
end

function clearDrop(arg_143_0)
	local var_143_0 = findTF(arg_143_0, "icon_bg")
	local var_143_1 = findTF(arg_143_0, "icon_bg/frame")
	local var_143_2 = findTF(arg_143_0, "icon_bg/icon")
	local var_143_3 = findTF(arg_143_0, "icon_bg/icon/icon")

	clearImageSprite(var_143_0)
	clearImageSprite(var_143_1)
	clearImageSprite(var_143_2)

	if var_143_3 then
		clearImageSprite(var_143_3)
	end
end

local var_0_8 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
	local var_144_0 = findTF(arg_144_0, "skill")
	local var_144_1 = findTF(arg_144_0, "lock")
	local var_144_2 = findTF(arg_144_0, "unknown")

	if arg_144_1 then
		setActive(var_144_0, true)
		setActive(var_144_2, false)
		setActive(var_144_1, not arg_144_2)
		LoadImageSpriteAsync("skillicon/" .. arg_144_1.icon, findTF(var_144_0, "icon"))

		local var_144_3 = arg_144_1.color or "blue"

		setText(findTF(var_144_0, "name"), shortenString(getSkillName(arg_144_1.id), arg_144_3 or 8))

		local var_144_4 = findTF(var_144_0, "level")

		setText(var_144_4, "LEVEL: " .. (arg_144_2 and arg_144_2.level or "??"))
		setTextColor(var_144_4, var_0_8[var_144_3])
	else
		setActive(var_144_0, false)
		setActive(var_144_2, true)
		setActive(var_144_1, false)
	end
end

local var_0_9 = true

function onBackButton(arg_145_0, arg_145_1, arg_145_2, arg_145_3)
	local var_145_0 = GetOrAddComponent(arg_145_1, "UILongPressTrigger")

	assert(arg_145_2, "callback should exist")

	var_145_0.longPressThreshold = defaultValue(arg_145_3, 1)

	local function var_145_1(arg_146_0)
		return function()
			if var_0_9 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_147_0, var_147_1 = arg_145_2()

			if var_147_0 then
				arg_146_0(var_147_1)
			end
		end
	end

	local var_145_2 = var_145_0.onReleased

	pg.DelegateInfo.Add(arg_145_0, var_145_2)
	var_145_2:RemoveAllListeners()
	var_145_2:AddListener(var_145_1(function(arg_148_0)
		arg_148_0:emit(BaseUI.ON_BACK)
	end))

	local var_145_3 = var_145_0.onLongPressed

	pg.DelegateInfo.Add(arg_145_0, var_145_3)
	var_145_3:RemoveAllListeners()
	var_145_3:AddListener(var_145_1(function(arg_149_0)
		arg_149_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_152_0)
	local var_152_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_152_1, var_152_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_152_0)

	return var_152_1 * 86400 + (var_152_2 + arg_152_0) * 3600
end

function GetPerceptualSize(arg_153_0, arg_153_1)
	local function var_153_0(arg_154_0)
		if not arg_154_0 then
			return 0, 1
		elseif arg_154_0 > 240 then
			return 4, 1
		elseif arg_154_0 > 225 then
			return 3, 1
		elseif arg_154_0 > 192 then
			return 2, 1
		elseif arg_154_0 < 126 then
			return 1, arg_153_1 or 0.5
		else
			return 1, 1
		end
	end

	if type(arg_153_0) == "number" then
		return var_153_0(arg_153_0)
	end

	local var_153_1 = 1
	local var_153_2 = 0
	local var_153_3 = 0
	local var_153_4 = #arg_153_0

	while var_153_1 <= var_153_4 do
		local var_153_5 = string.byte(arg_153_0, var_153_1)
		local var_153_6, var_153_7 = var_153_0(var_153_5)

		var_153_1 = var_153_1 + var_153_6
		var_153_2 = var_153_2 + var_153_7
	end

	return var_153_2
end

function shortenString(arg_155_0, arg_155_1, arg_155_2)
	local var_155_0 = 1
	local var_155_1 = 0
	local var_155_2 = 0
	local var_155_3 = #arg_155_0

	while var_155_0 <= var_155_3 do
		local var_155_4 = string.byte(arg_155_0, var_155_0)
		local var_155_5, var_155_6 = GetPerceptualSize(var_155_4, arg_155_2)

		var_155_0 = var_155_0 + var_155_5
		var_155_1 = var_155_1 + var_155_6

		if arg_155_1 <= math.ceil(var_155_1) then
			var_155_2 = var_155_0

			break
		end
	end

	if var_155_2 == 0 or var_155_3 < var_155_2 then
		return arg_155_0
	end

	return string.sub(arg_155_0, 1, var_155_2 - 1) .. ".."
end

function shouldShortenString(arg_156_0, arg_156_1)
	local var_156_0 = 1
	local var_156_1 = 0
	local var_156_2 = 0
	local var_156_3 = #arg_156_0

	while var_156_0 <= var_156_3 do
		local var_156_4 = string.byte(arg_156_0, var_156_0)
		local var_156_5, var_156_6 = GetPerceptualSize(var_156_4)

		var_156_0 = var_156_0 + var_156_5
		var_156_1 = var_156_1 + var_156_6

		if arg_156_1 <= math.ceil(var_156_1) then
			var_156_2 = var_156_0

			break
		end
	end

	if var_156_2 == 0 or var_156_3 < var_156_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_157_0, arg_157_1, arg_157_2, arg_157_3)
	local var_157_0 = true
	local var_157_1, var_157_2 = utf8_to_unicode(arg_157_0)
	local var_157_3 = filterEgyUnicode(filterSpecChars(arg_157_0))
	local var_157_4 = wordVer(arg_157_0)

	if not checkSpaceValid(arg_157_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_157_3[1]))

		var_157_0 = false
	elseif var_157_4 > 0 or var_157_3 ~= arg_157_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_157_3[4]))

		var_157_0 = false
	elseif var_157_2 < arg_157_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_157_3[2]))

		var_157_0 = false
	elseif arg_157_2 < var_157_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_157_3[3]))

		var_157_0 = false
	end

	return var_157_0
end

function checkSpaceValid(arg_158_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_158_0 = string.gsub(arg_158_0, " ", "")

	return arg_158_0 == string.gsub(var_158_0, "　", "")
end

function filterSpecChars(arg_159_0)
	local var_159_0 = {}
	local var_159_1 = 0
	local var_159_2 = 0
	local var_159_3 = 0
	local var_159_4 = 1

	while var_159_4 <= #arg_159_0 do
		local var_159_5 = string.byte(arg_159_0, var_159_4)

		if not var_159_5 then
			break
		end

		if var_159_5 >= 48 and var_159_5 <= 57 or var_159_5 >= 65 and var_159_5 <= 90 or var_159_5 == 95 or var_159_5 >= 97 and var_159_5 <= 122 then
			table.insert(var_159_0, string.char(var_159_5))
		elseif var_159_5 >= 228 and var_159_5 <= 233 then
			local var_159_6 = string.byte(arg_159_0, var_159_4 + 1)
			local var_159_7 = string.byte(arg_159_0, var_159_4 + 2)

			if var_159_6 and var_159_7 and var_159_6 >= 128 and var_159_6 <= 191 and var_159_7 >= 128 and var_159_7 <= 191 then
				var_159_4 = var_159_4 + 2

				table.insert(var_159_0, string.char(var_159_5, var_159_6, var_159_7))

				var_159_1 = var_159_1 + 1
			end
		elseif var_159_5 == 45 or var_159_5 == 40 or var_159_5 == 41 then
			table.insert(var_159_0, string.char(var_159_5))
		elseif var_159_5 == 194 then
			local var_159_8 = string.byte(arg_159_0, var_159_4 + 1)

			if var_159_8 == 183 then
				var_159_4 = var_159_4 + 1

				table.insert(var_159_0, string.char(var_159_5, var_159_8))

				var_159_1 = var_159_1 + 1
			end
		elseif var_159_5 == 239 then
			local var_159_9 = string.byte(arg_159_0, var_159_4 + 1)
			local var_159_10 = string.byte(arg_159_0, var_159_4 + 2)

			if var_159_9 == 188 and (var_159_10 == 136 or var_159_10 == 137) then
				var_159_4 = var_159_4 + 2

				table.insert(var_159_0, string.char(var_159_5, var_159_9, var_159_10))

				var_159_1 = var_159_1 + 1
			end
		elseif var_159_5 == 206 or var_159_5 == 207 then
			local var_159_11 = string.byte(arg_159_0, var_159_4 + 1)

			if var_159_5 == 206 and var_159_11 >= 177 or var_159_5 == 207 and var_159_11 <= 134 then
				var_159_4 = var_159_4 + 1

				table.insert(var_159_0, string.char(var_159_5, var_159_11))

				var_159_1 = var_159_1 + 1
			end
		elseif var_159_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_159_12 = string.byte(arg_159_0, var_159_4 + 1)
			local var_159_13 = string.byte(arg_159_0, var_159_4 + 2)

			if var_159_12 and var_159_13 and var_159_12 > 128 and var_159_12 <= 191 and var_159_13 >= 128 and var_159_13 <= 191 then
				var_159_4 = var_159_4 + 2

				table.insert(var_159_0, string.char(var_159_5, var_159_12, var_159_13))

				var_159_2 = var_159_2 + 1
			end
		elseif var_159_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_159_14 = string.byte(arg_159_0, var_159_4 + 1)
			local var_159_15 = string.byte(arg_159_0, var_159_4 + 2)

			if var_159_14 and var_159_15 and var_159_14 >= 128 and var_159_14 <= 191 and var_159_15 >= 128 and var_159_15 <= 191 then
				var_159_4 = var_159_4 + 2

				table.insert(var_159_0, string.char(var_159_5, var_159_14, var_159_15))

				var_159_3 = var_159_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_159_4 ~= 1 and var_159_5 == 32 and string.byte(arg_159_0, var_159_4 + 1) ~= 32 then
				table.insert(var_159_0, string.char(var_159_5))
			end

			if var_159_5 >= 192 and var_159_5 <= 223 then
				local var_159_16 = string.byte(arg_159_0, var_159_4 + 1)

				var_159_4 = var_159_4 + 1

				if var_159_5 == 194 and var_159_16 and var_159_16 >= 128 then
					table.insert(var_159_0, string.char(var_159_5, var_159_16))
				elseif var_159_5 == 195 and var_159_16 and var_159_16 <= 191 then
					table.insert(var_159_0, string.char(var_159_5, var_159_16))
				end
			end
		end

		var_159_4 = var_159_4 + 1
	end

	return table.concat(var_159_0), var_159_1 + var_159_2 + var_159_3
end

function filterEgyUnicode(arg_160_0)
	arg_160_0 = string.gsub(arg_160_0, "�[�-�][�-�]", "")
	arg_160_0 = string.gsub(arg_160_0, "�[�-�]", "")

	return arg_160_0
end

function shiftPanel(arg_161_0, arg_161_1, arg_161_2, arg_161_3, arg_161_4, arg_161_5, arg_161_6, arg_161_7, arg_161_8)
	arg_161_3 = arg_161_3 or 0.2

	if arg_161_5 then
		LeanTween.cancel(go(arg_161_0))
	end

	local var_161_0 = rtf(arg_161_0)

	arg_161_1 = arg_161_1 or var_161_0.anchoredPosition.x
	arg_161_2 = arg_161_2 or var_161_0.anchoredPosition.y

	local var_161_1 = LeanTween.move(var_161_0, Vector3(arg_161_1, arg_161_2, 0), arg_161_3)

	arg_161_7 = arg_161_7 or LeanTweenType.easeInOutSine

	var_161_1:setEase(arg_161_7)

	if arg_161_4 then
		var_161_1:setDelay(arg_161_4)
	end

	if arg_161_6 then
		GetOrAddComponent(arg_161_0, "CanvasGroup").blocksRaycasts = false
	end

	var_161_1:setOnComplete(System.Action(function()
		if arg_161_8 then
			arg_161_8()
		end

		if arg_161_6 then
			GetOrAddComponent(arg_161_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_161_1
end

function TweenValue(arg_163_0, arg_163_1, arg_163_2, arg_163_3, arg_163_4, arg_163_5, arg_163_6, arg_163_7)
	local var_163_0 = LeanTween.value(go(arg_163_0), arg_163_1, arg_163_2, arg_163_3):setOnUpdate(System.Action_float(function(arg_164_0)
		if arg_163_5 then
			arg_163_5(arg_164_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_163_6 then
			arg_163_6()
		end
	end)):setDelay(arg_163_4 or 0)

	if arg_163_7 and arg_163_7 > 0 then
		var_163_0:setRepeat(arg_163_7)
	end

	return var_163_0
end

function rotateAni(arg_166_0, arg_166_1, arg_166_2)
	return LeanTween.rotate(rtf(arg_166_0), 360 * arg_166_1, arg_166_2):setLoopClamp()
end

function blinkAni(arg_167_0, arg_167_1, arg_167_2, arg_167_3)
	return LeanTween.alpha(rtf(arg_167_0), arg_167_3 or 0, arg_167_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_167_2 or 0)
end

function scaleAni(arg_168_0, arg_168_1, arg_168_2, arg_168_3)
	return LeanTween.scale(rtf(arg_168_0), arg_168_3 or 0, arg_168_1):setLoopPingPong(arg_168_2 or 0)
end

function floatAni(arg_169_0, arg_169_1, arg_169_2, arg_169_3)
	local var_169_0 = arg_169_0.localPosition.y + arg_169_1

	return LeanTween.moveY(rtf(arg_169_0), var_169_0, arg_169_2):setLoopPingPong(arg_169_3 or 0)
end

local var_0_10 = tostring

function tostring(arg_170_0)
	if arg_170_0 == nil then
		return "nil"
	end

	local var_170_0 = var_0_10(arg_170_0)

	if var_170_0 == nil then
		if type(arg_170_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_170_0
end

function wordVer(arg_171_0, arg_171_1)
	if arg_171_0.match(arg_171_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_171_0
	end

	arg_171_1 = arg_171_1 or {}

	local var_171_0 = filterEgyUnicode(arg_171_0)

	if #var_171_0 ~= #arg_171_0 then
		if arg_171_1.isReplace then
			arg_171_0 = var_171_0
		else
			return 1
		end
	end

	local var_171_1 = wordSplit(arg_171_0)
	local var_171_2 = pg.word_template
	local var_171_3 = pg.word_legal_template

	arg_171_1.isReplace = arg_171_1.isReplace or false
	arg_171_1.replaceWord = arg_171_1.replaceWord or "*"

	local var_171_4 = #var_171_1
	local var_171_5 = 1
	local var_171_6 = ""
	local var_171_7 = 0

	while var_171_5 <= var_171_4 do
		local var_171_8, var_171_9, var_171_10 = wordLegalMatch(var_171_1, var_171_3, var_171_5)

		if var_171_8 then
			var_171_5 = var_171_9
			var_171_6 = var_171_6 .. var_171_10
		else
			local var_171_11, var_171_12, var_171_13 = wordVerMatch(var_171_1, var_171_2, arg_171_1, var_171_5, "", false, var_171_5, "")

			if var_171_11 then
				var_171_5 = var_171_12
				var_171_7 = var_171_7 + 1

				if arg_171_1.isReplace then
					var_171_6 = var_171_6 .. var_171_13
				end
			else
				if arg_171_1.isReplace then
					var_171_6 = var_171_6 .. var_171_1[var_171_5]
				end

				var_171_5 = var_171_5 + 1
			end
		end
	end

	if arg_171_1.isReplace then
		return var_171_7, var_171_6
	else
		return var_171_7
	end
end

function wordLegalMatch(arg_172_0, arg_172_1, arg_172_2, arg_172_3, arg_172_4)
	if arg_172_2 > #arg_172_0 then
		return arg_172_3, arg_172_2, arg_172_4
	end

	local var_172_0 = arg_172_0[arg_172_2]
	local var_172_1 = arg_172_1[var_172_0]

	arg_172_4 = arg_172_4 == nil and "" or arg_172_4

	if var_172_1 then
		if var_172_1.this then
			return wordLegalMatch(arg_172_0, var_172_1, arg_172_2 + 1, true, arg_172_4 .. var_172_0)
		else
			return wordLegalMatch(arg_172_0, var_172_1, arg_172_2 + 1, false, arg_172_4 .. var_172_0)
		end
	else
		return arg_172_3, arg_172_2, arg_172_4
	end
end

local var_0_11 = string.byte("a")
local var_0_12 = string.byte("z")
local var_0_13 = string.byte("A")
local var_0_14 = string.byte("Z")

local function var_0_15(arg_173_0)
	if not arg_173_0 then
		return arg_173_0
	end

	local var_173_0 = string.byte(arg_173_0)

	if var_173_0 > 128 then
		return
	end

	if var_173_0 >= var_0_11 and var_173_0 <= var_0_12 then
		return string.char(var_173_0 - 32)
	elseif var_173_0 >= var_0_13 and var_173_0 <= var_0_14 then
		return string.char(var_173_0 + 32)
	else
		return arg_173_0
	end
end

function wordVerMatch(arg_174_0, arg_174_1, arg_174_2, arg_174_3, arg_174_4, arg_174_5, arg_174_6, arg_174_7)
	if arg_174_3 > #arg_174_0 then
		return arg_174_5, arg_174_6, arg_174_7
	end

	local var_174_0 = arg_174_0[arg_174_3]
	local var_174_1 = arg_174_1[var_174_0]

	if var_174_1 then
		local var_174_2, var_174_3, var_174_4 = wordVerMatch(arg_174_0, var_174_1, arg_174_2, arg_174_3 + 1, arg_174_2.isReplace and arg_174_4 .. arg_174_2.replaceWord or arg_174_4, var_174_1.this or arg_174_5, var_174_1.this and arg_174_3 + 1 or arg_174_6, var_174_1.this and (arg_174_2.isReplace and arg_174_4 .. arg_174_2.replaceWord or arg_174_4) or arg_174_7)

		if var_174_2 then
			return var_174_2, var_174_3, var_174_4
		end
	end

	local var_174_5 = var_0_15(var_174_0)
	local var_174_6 = arg_174_1[var_174_5]

	if var_174_5 ~= var_174_0 and var_174_6 then
		local var_174_7, var_174_8, var_174_9 = wordVerMatch(arg_174_0, var_174_6, arg_174_2, arg_174_3 + 1, arg_174_2.isReplace and arg_174_4 .. arg_174_2.replaceWord or arg_174_4, var_174_6.this or arg_174_5, var_174_6.this and arg_174_3 + 1 or arg_174_6, var_174_6.this and (arg_174_2.isReplace and arg_174_4 .. arg_174_2.replaceWord or arg_174_4) or arg_174_7)

		if var_174_7 then
			return var_174_7, var_174_8, var_174_9
		end
	end

	return arg_174_5, arg_174_6, arg_174_7
end

function wordSplit(arg_175_0)
	local var_175_0 = {}

	for iter_175_0 in arg_175_0.gmatch(arg_175_0, "[\x01-\x7F�-�][�-�]*") do
		var_175_0[#var_175_0 + 1] = iter_175_0
	end

	return var_175_0
end

function contentWrap(arg_176_0, arg_176_1, arg_176_2)
	local var_176_0 = LuaHelper.WrapContent(arg_176_0, arg_176_1, arg_176_2)

	return #var_176_0 ~= #arg_176_0, var_176_0
end

function cancelRich(arg_177_0)
	local var_177_0

	for iter_177_0 = 1, 20 do
		local var_177_1

		arg_177_0, var_177_1 = string.gsub(arg_177_0, "<([^>]*)>", "%1")

		if var_177_1 <= 0 then
			break
		end
	end

	return arg_177_0
end

function cancelColorRich(arg_178_0)
	local var_178_0

	for iter_178_0 = 1, 20 do
		local var_178_1

		arg_178_0, var_178_1 = string.gsub(arg_178_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_178_1 <= 0 then
			break
		end
	end

	return arg_178_0
end

function getSkillConfig(arg_179_0)
	local var_179_0 = pg.buffCfg["buff_" .. arg_179_0]

	if not var_179_0 then
		return
	end

	local var_179_1 = Clone(var_179_0)

	var_179_1.name = getSkillName(arg_179_0)
	var_179_1.desc = HXSet.hxLan(var_179_1.desc)
	var_179_1.desc_get = HXSet.hxLan(var_179_1.desc_get)

	_.each(var_179_1, function(arg_180_0)
		arg_180_0.desc = HXSet.hxLan(arg_180_0.desc)
	end)

	return var_179_1
end

function getSkillName(arg_181_0)
	local var_181_0 = pg.skill_data_template[arg_181_0] or pg.skill_data_display[arg_181_0]

	if var_181_0 then
		return HXSet.hxLan(var_181_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_182_0, arg_182_1)
	local var_182_0 = arg_182_1 and pg.skill_world_display[arg_182_0] and setmetatable({}, {
		__index = function(arg_183_0, arg_183_1)
			return pg.skill_world_display[arg_182_0][arg_183_1] or pg.skill_data_template[arg_182_0][arg_183_1]
		end
	}) or pg.skill_data_template[arg_182_0]

	if not var_182_0 then
		return ""
	end

	local var_182_1 = var_182_0.desc_get ~= "" and var_182_0.desc_get or var_182_0.desc

	for iter_182_0, iter_182_1 in pairs(var_182_0.desc_get_add) do
		local var_182_2 = setColorStr(iter_182_1[1], COLOR_GREEN)

		if iter_182_1[2] then
			var_182_2 = var_182_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_182_1[2], COLOR_GREEN))
		end

		var_182_1 = specialGSub(var_182_1, "$" .. iter_182_0, var_182_2)
	end

	return HXSet.hxLan(var_182_1)
end

function getSkillDescLearn(arg_184_0, arg_184_1, arg_184_2)
	local var_184_0 = arg_184_2 and pg.skill_world_display[arg_184_0] and setmetatable({}, {
		__index = function(arg_185_0, arg_185_1)
			return pg.skill_world_display[arg_184_0][arg_185_1] or pg.skill_data_template[arg_184_0][arg_185_1]
		end
	}) or pg.skill_data_template[arg_184_0]

	if not var_184_0 then
		return ""
	end

	local var_184_1 = var_184_0.desc

	if not var_184_0.desc_add then
		return HXSet.hxLan(var_184_1)
	end

	for iter_184_0, iter_184_1 in pairs(var_184_0.desc_add) do
		local var_184_2 = iter_184_1[arg_184_1][1]

		if iter_184_1[arg_184_1][2] then
			var_184_2 = var_184_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_184_1[arg_184_1][2])
		end

		var_184_1 = specialGSub(var_184_1, "$" .. iter_184_0, setColorStr(var_184_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_184_1)
end

function getSkillDesc(arg_186_0, arg_186_1, arg_186_2)
	local var_186_0 = arg_186_2 and pg.skill_world_display[arg_186_0] and setmetatable({}, {
		__index = function(arg_187_0, arg_187_1)
			return pg.skill_world_display[arg_186_0][arg_187_1] or pg.skill_data_template[arg_186_0][arg_187_1]
		end
	}) or pg.skill_data_template[arg_186_0]

	if not var_186_0 then
		return ""
	end

	local var_186_1 = var_186_0.desc

	if not var_186_0.desc_add then
		return HXSet.hxLan(var_186_1)
	end

	for iter_186_0, iter_186_1 in pairs(var_186_0.desc_add) do
		local var_186_2 = setColorStr(iter_186_1[arg_186_1][1], COLOR_GREEN)

		var_186_1 = specialGSub(var_186_1, "$" .. iter_186_0, var_186_2)
	end

	return HXSet.hxLan(var_186_1)
end

function specialGSub(arg_188_0, arg_188_1, arg_188_2)
	arg_188_0 = string.gsub(arg_188_0, "<color=#", "<color=NNN")
	arg_188_0 = string.gsub(arg_188_0, "#", "")
	arg_188_2 = string.gsub(arg_188_2, "%%", "%%%%")
	arg_188_0 = string.gsub(arg_188_0, arg_188_1, arg_188_2)
	arg_188_0 = string.gsub(arg_188_0, "<color=NNN", "<color=#")

	return arg_188_0
end

function topAnimation(arg_189_0, arg_189_1, arg_189_2, arg_189_3, arg_189_4, arg_189_5)
	local var_189_0 = {}

	arg_189_4 = arg_189_4 or 0.27

	local var_189_1 = 0.05

	if arg_189_0 then
		local var_189_2 = arg_189_0.transform.localPosition.x

		setAnchoredPosition(arg_189_0, {
			x = var_189_2 - 500
		})
		shiftPanel(arg_189_0, var_189_2, nil, 0.05, arg_189_4, true, true)
		setActive(arg_189_0, true)
	end

	setActive(arg_189_1, false)
	setActive(arg_189_2, false)
	setActive(arg_189_3, false)

	for iter_189_0 = 1, 3 do
		table.insert(var_189_0, LeanTween.delayedCall(arg_189_4 + 0.13 + var_189_1 * iter_189_0, System.Action(function()
			if arg_189_1 then
				setActive(arg_189_1, not arg_189_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_189_0, LeanTween.delayedCall(arg_189_4 + 0.02 + var_189_1 * iter_189_0, System.Action(function()
			if arg_189_2 then
				setActive(arg_189_2, not go(arg_189_2).activeSelf)
			end

			if arg_189_2 then
				setActive(arg_189_3, not go(arg_189_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_189_5 then
		table.insert(var_189_0, LeanTween.delayedCall(arg_189_4 + 0.13 + var_189_1 * 3 + 0.1, System.Action(function()
			arg_189_5()
		end)).uniqueId)
	end

	return var_189_0
end

function cancelTweens(arg_193_0)
	assert(arg_193_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_193_0, iter_193_1 in ipairs(arg_193_0) do
		if iter_193_1 then
			LeanTween.cancel(iter_193_1)
		end
	end
end

function getOfflineTimeStamp(arg_194_0)
	local var_194_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_194_0
	local var_194_1 = ""

	if var_194_0 <= 59 then
		var_194_1 = i18n("just_now")
	elseif var_194_0 <= 3599 then
		var_194_1 = i18n("several_minutes_before", math.floor(var_194_0 / 60))
	elseif var_194_0 <= 86399 then
		var_194_1 = i18n("several_hours_before", math.floor(var_194_0 / 3600))
	else
		var_194_1 = i18n("several_days_before", math.floor(var_194_0 / 86400))
	end

	return var_194_1
end

function playMovie(arg_195_0, arg_195_1, arg_195_2)
	local var_195_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_195_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_195_0, function(arg_196_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_196_0 = GCHandle.Alloc(arg_196_0, GCHandleType.Pinned)

			setActive(var_195_0, true)

			local var_196_1 = var_195_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_196_1.player:SetData(arg_196_0, arg_196_0.Length)

			var_196_1.target = var_195_0:GetComponent(typeof(Image))
			var_196_1.loop = false
			var_196_1.additiveMode = false
			var_196_1.playOnStart = true

			local var_196_2

			var_196_2 = Timer.New(function()
				if var_196_1.player.status == CriMana.Player.Status.PlayEnd or var_196_1.player.status == CriMana.Player.Status.Stop or var_196_1.player.status == CriMana.Player.Status.Error then
					var_196_2:Stop()
					Object.Destroy(var_196_1)
					GCHandle.Free(var_196_0)
					setActive(var_195_0, false)

					if arg_195_1 then
						arg_195_1()
					end
				end
			end, 0.2, -1)

			var_196_2:Start()
			removeOnButton(var_195_0)

			if arg_195_2 then
				onButton(nil, var_195_0, function()
					var_196_1:Stop()
					GetOrAddComponent(var_195_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_195_1 then
		arg_195_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_199_0)
	if PaintCameraAdjustOn ~= arg_199_0 then
		local var_199_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_199_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_199_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_199_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_199_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_199_0
	end
end

function ManhattonDist(arg_200_0, arg_200_1)
	return math.abs(arg_200_0.row - arg_200_1.row) + math.abs(arg_200_0.column - arg_200_1.column)
end

function checkFirstHelpShow(arg_201_0)
	local var_201_0 = getProxy(SettingsProxy)

	if not var_201_0:checkReadHelp(arg_201_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_201_0].tip
		})
		var_201_0:recordReadHelp(arg_201_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_202_0)
	enableNotch(arg_202_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_203_0)
	enableNotch(arg_203_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_203_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_205_0, arg_205_1)
	if arg_205_0 == nil then
		return
	end

	local var_205_0 = arg_205_0:GetComponent("NotchAdapt")
	local var_205_1 = arg_205_0:GetComponent("AspectRatioFitter")

	var_205_0.enabled = arg_205_1

	if var_205_1 then
		if arg_205_1 then
			var_205_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_205_1.enabled
			var_205_1.enabled = false
		end
	end
end

function comma_value(arg_206_0)
	local var_206_0 = arg_206_0
	local var_206_1 = 0

	repeat
		local var_206_2

		var_206_0, var_206_2 = string.gsub(var_206_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_206_2 == 0

	return var_206_0
end

local var_0_16 = 0.2

function SwitchPanel(arg_207_0, arg_207_1, arg_207_2, arg_207_3, arg_207_4, arg_207_5)
	arg_207_3 = defaultValue(arg_207_3, var_0_16)

	if arg_207_5 then
		LeanTween.cancel(go(arg_207_0))
	end

	local var_207_0 = Vector3.New(tf(arg_207_0).localPosition.x, tf(arg_207_0).localPosition.y, tf(arg_207_0).localPosition.z)

	if arg_207_1 then
		var_207_0.x = arg_207_1
	end

	if arg_207_2 then
		var_207_0.y = arg_207_2
	end

	local var_207_1 = LeanTween.move(rtf(arg_207_0), var_207_0, arg_207_3):setEase(LeanTweenType.easeInOutSine)

	if arg_207_4 then
		var_207_1:setDelay(arg_207_4)
	end

	return var_207_1
end

function updateActivityTaskStatus(arg_208_0)
	local var_208_0 = arg_208_0:getConfig("config_id")
	local var_208_1, var_208_2 = getActivityTask(arg_208_0, true)

	if not var_208_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_208_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_209_0)
	local var_209_0 = getProxy(TaskProxy)
	local var_209_1 = arg_209_0:getNDay()
	local var_209_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_209_0:getStartTime())

	for iter_209_0, iter_209_1 in ipairs(arg_209_0:getConfig("config_data")) do
		local var_209_3 = pg.battlepass_task_group[iter_209_1]

		if var_209_3 and var_209_2 >= var_209_3.group_mask then
			if underscore.any(underscore.flatten(var_209_3.task_group), function(arg_210_0)
				return var_209_0:getTaskVO(arg_210_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD, {
					cmd = 1,
					activity_id = arg_209_0.id
				})

				return true
			end
		elseif not var_209_3 then
			warning("battlepass_task_group表中不存在 id = " .. iter_209_1)
		end
	end

	return false
end

function setShipCardFrame(arg_211_0, arg_211_1, arg_211_2)
	arg_211_0.localScale = Vector3.one
	arg_211_0.anchorMin = Vector2.zero
	arg_211_0.anchorMax = Vector2.one

	local var_211_0 = arg_211_2 or arg_211_1

	GetImageSpriteFromAtlasAsync("shipframe", var_211_0, arg_211_0)

	local var_211_1 = pg.frame_resource[var_211_0]

	if var_211_1 then
		local var_211_2 = var_211_1.param

		arg_211_0.offsetMin = Vector2(var_211_2[1], var_211_2[2])
		arg_211_0.offsetMax = Vector2(var_211_2[3], var_211_2[4])
	else
		arg_211_0.offsetMin = Vector2.zero
		arg_211_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_212_0, arg_212_1, arg_212_2)
	arg_212_0.localScale = Vector3.one
	arg_212_0.anchorMin = Vector2.zero
	arg_212_0.anchorMax = Vector2.one

	setImageSprite(arg_212_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_212_2 or arg_212_1)))

	local var_212_0 = "b" .. (arg_212_2 or arg_212_1)
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

function setFrameEffect(arg_213_0, arg_213_1)
	if arg_213_1 then
		local var_213_0 = arg_213_1 .. "(Clone)"
		local var_213_1 = false

		eachChild(arg_213_0, function(arg_214_0)
			setActive(arg_214_0, arg_214_0.name == var_213_0)

			var_213_1 = var_213_1 or arg_214_0.name == var_213_0
		end)

		if not var_213_1 then
			LoadAndInstantiateAsync("effect", arg_213_1, function(arg_215_0)
				if IsNil(arg_213_0) or findTF(arg_213_0, var_213_0) then
					Object.Destroy(arg_215_0)
				else
					setParent(arg_215_0, arg_213_0)
					setActive(arg_215_0, true)
				end
			end)
		end
	end

	setActive(arg_213_0, arg_213_1)
end

function setProposeMarkIcon(arg_216_0, arg_216_1)
	local var_216_0 = arg_216_0:Find("proposeShipCard(Clone)")
	local var_216_1 = arg_216_1.propose and not arg_216_1:ShowPropose()

	if var_216_0 then
		setActive(var_216_0, var_216_1)
	elseif var_216_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_217_0)
			if IsNil(arg_216_0) or arg_216_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_217_0)
			else
				setParent(arg_217_0, arg_216_0, false)
			end
		end)
	end
end

function flushShipCard(arg_218_0, arg_218_1)
	local var_218_0 = arg_218_1:rarity2bgPrint()
	local var_218_1 = findTF(arg_218_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_218_0, "", var_218_1)

	local var_218_2 = findTF(arg_218_0, "content/ship_icon")
	local var_218_3 = arg_218_1 and {
		"shipYardIcon/" .. arg_218_1:getPainting(),
		arg_218_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_218_3[1], var_218_3[2], var_218_2)

	local var_218_4 = arg_218_1:getShipType()
	local var_218_5 = findTF(arg_218_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_218_4), var_218_5)
	setText(findTF(arg_218_0, "content/dockyard/lv/Text"), defaultValue(arg_218_1.level, 1))

	local var_218_6 = arg_218_1:getStar()
	local var_218_7 = arg_218_1:getMaxStar()
	local var_218_8 = findTF(arg_218_0, "content/front/stars")

	setActive(var_218_8, true)

	local var_218_9 = findTF(var_218_8, "star_tpl")
	local var_218_10 = var_218_8.childCount

	for iter_218_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_218_11 = var_218_10 < iter_218_0 and cloneTplTo(var_218_9, var_218_8) or var_218_8:GetChild(iter_218_0 - 1)

		setActive(var_218_11, iter_218_0 <= var_218_7)
		triggerToggle(var_218_11, iter_218_0 <= var_218_6)
	end

	local var_218_12 = findTF(arg_218_0, "content/front/frame")
	local var_218_13, var_218_14 = arg_218_1:GetFrameAndEffect()

	setShipCardFrame(var_218_12, var_218_0, var_218_13)
	setFrameEffect(findTF(arg_218_0, "content/front/bg_other"), var_218_14)
	setProposeMarkIcon(arg_218_0:Find("content/dockyard/propose"), arg_218_1)
end

function TweenItemAlphaAndWhite(arg_219_0)
	LeanTween.cancel(arg_219_0)

	local var_219_0 = GetOrAddComponent(arg_219_0, "CanvasGroup")

	var_219_0.alpha = 0

	LeanTween.alphaCanvas(var_219_0, 1, 0.2):setUseEstimatedTime(true)

	local var_219_1 = findTF(arg_219_0.transform, "white_mask")

	if var_219_1 then
		setActive(var_219_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_220_0)
	LeanTween.cancel(arg_220_0)

	GetOrAddComponent(arg_220_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_221_0)
	local var_221_0 = {}
	local var_221_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_221_2 = getProxy(CollectionProxy):getShipGroup(arg_221_0)

	if var_221_2 then
		local var_221_3 = ShipGroup.getSkinList(arg_221_0)

		for iter_221_0, iter_221_1 in ipairs(var_221_3) do
			if iter_221_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_221_1, iter_221_1.id) or iter_221_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_221_2.trans or iter_221_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_221_2.married == 1 then
				var_221_0[iter_221_1.id] = true
			end
		end
	end

	return var_221_0
end

function split(arg_222_0, arg_222_1)
	local var_222_0 = {}

	if not arg_222_0 then
		return nil
	end

	local var_222_1 = #arg_222_0
	local var_222_2 = 1

	while var_222_2 <= var_222_1 do
		local var_222_3 = string.find(arg_222_0, arg_222_1, var_222_2)

		if var_222_3 == nil then
			table.insert(var_222_0, string.sub(arg_222_0, var_222_2, var_222_1))

			break
		end

		table.insert(var_222_0, string.sub(arg_222_0, var_222_2, var_222_3 - 1))

		if var_222_3 == var_222_1 then
			table.insert(var_222_0, "")

			break
		end

		var_222_2 = var_222_3 + 1
	end

	return var_222_0
end

function NumberToChinese(arg_223_0, arg_223_1)
	local var_223_0 = ""
	local var_223_1 = #arg_223_0

	for iter_223_0 = 1, var_223_1 do
		local var_223_2 = string.sub(arg_223_0, iter_223_0, iter_223_0)

		if var_223_2 ~= "0" or var_223_2 == "0" and not arg_223_1 then
			if arg_223_1 then
				if var_223_1 >= 2 then
					if iter_223_0 == 1 then
						if var_223_2 == "1" then
							var_223_0 = i18n("number_" .. 10)
						else
							var_223_0 = i18n("number_" .. var_223_2) .. i18n("number_" .. 10)
						end
					else
						var_223_0 = var_223_0 .. i18n("number_" .. var_223_2)
					end
				else
					var_223_0 = var_223_0 .. i18n("number_" .. var_223_2)
				end
			else
				var_223_0 = var_223_0 .. i18n("number_" .. var_223_2)
			end
		end
	end

	return var_223_0
end

function getActivityTask(arg_224_0, arg_224_1)
	local var_224_0 = getProxy(TaskProxy)
	local var_224_1 = arg_224_0:getConfig("config_data")
	local var_224_2 = arg_224_0:getNDay(arg_224_0.data1)
	local var_224_3
	local var_224_4
	local var_224_5

	for iter_224_0 = math.max(arg_224_0.data3, 1), math.min(var_224_2, #var_224_1) do
		local var_224_6 = _.flatten({
			var_224_1[iter_224_0]
		})

		for iter_224_1, iter_224_2 in ipairs(var_224_6) do
			local var_224_7 = var_224_0:getTaskById(iter_224_2)

			if var_224_7 then
				return var_224_7.id, var_224_7
			end

			if var_224_4 then
				var_224_5 = var_224_0:getFinishTaskById(iter_224_2)

				if var_224_5 then
					var_224_4 = var_224_5
				elseif arg_224_1 then
					return iter_224_2
				else
					return var_224_4.id, var_224_4
				end
			else
				var_224_4 = var_224_0:getFinishTaskById(iter_224_2)
				var_224_5 = var_224_5 or iter_224_2
			end
		end
	end

	if var_224_4 then
		return var_224_4.id, var_224_4
	else
		return var_224_5
	end
end

function setImageFromImage(arg_225_0, arg_225_1, arg_225_2)
	local var_225_0 = GetComponent(arg_225_0, "Image")

	var_225_0.sprite = GetComponent(arg_225_1, "Image").sprite

	if arg_225_2 then
		var_225_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_226_0)
	local var_226_0, var_226_1, var_226_2, var_226_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_226_0)

	if var_226_0 >= 1 then
		return i18n("limit_skin_time_day", var_226_0)
	elseif var_226_0 <= 0 and var_226_1 > 0 then
		return i18n("limit_skin_time_day_min", var_226_1, var_226_2)
	elseif var_226_0 <= 0 and var_226_1 <= 0 and (var_226_2 > 0 or var_226_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_226_2, 1))
	elseif var_226_0 <= 0 and var_226_1 <= 0 and var_226_2 <= 0 and var_226_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_227_0)
	local var_227_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_227_1 = math.max(arg_227_0 - var_227_0, 0)
	local var_227_2 = math.floor(var_227_1 / 86400)

	if var_227_2 > 0 then
		return i18n("time_remaining_tip") .. var_227_2 .. i18n("word_date")
	else
		local var_227_3 = math.floor(var_227_1 / 3600)

		if var_227_3 > 0 then
			return i18n("time_remaining_tip") .. var_227_3 .. i18n("word_hour")
		else
			local var_227_4 = math.floor(var_227_1 / 60)

			if var_227_4 > 0 then
				return i18n("time_remaining_tip") .. var_227_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_227_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_228_0)
	local var_228_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_228_0
	local var_228_1 = var_228_0 / 86400

	if var_228_1 > 1 then
		return i18n("ins_word_day", math.floor(var_228_1))
	else
		local var_228_2 = var_228_0 / 3600

		if var_228_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_228_2))
		else
			local var_228_3 = var_228_0 / 60

			if var_228_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_228_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_229_0)
	local var_229_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_229_0
	local var_229_1 = var_229_0 / 86400

	if var_229_1 > 1 then
		return i18n1(math.floor(var_229_1) .. "d")
	else
		local var_229_2 = var_229_0 / 3600

		if var_229_2 > 1 then
			return i18n1(math.floor(var_229_2) .. "h")
		else
			local var_229_3 = var_229_0 / 60

			if var_229_3 > 1 then
				return i18n1(math.floor(var_229_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_230_0)
	local var_230_0, var_230_1, var_230_2, var_230_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_230_0)

	if var_230_0 <= 0 and var_230_1 <= 0 and var_230_2 <= 0 and var_230_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_230_0, var_230_1, var_230_2)
	end
end

function checkExist(arg_231_0, ...)
	local var_231_0 = {
		...
	}

	for iter_231_0, iter_231_1 in ipairs(var_231_0) do
		if arg_231_0 == nil then
			break
		end

		assert(type(arg_231_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_231_1) == "table", "type error : param should be table")

		if type(arg_231_0[iter_231_1[1]]) == "function" then
			arg_231_0 = arg_231_0[iter_231_1[1]](arg_231_0, unpack(iter_231_1[2] or {}))
		else
			arg_231_0 = arg_231_0[iter_231_1[1]]
		end
	end

	return arg_231_0
end

function AcessWithinNull(arg_232_0, arg_232_1)
	if arg_232_0 == nil then
		return
	end

	assert(type(arg_232_0) == "table")

	return arg_232_0[arg_232_1]
end

function showRepairMsgbox()
	local var_233_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_233_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_233_2 = {
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
			var_233_2,
			var_233_1,
			var_233_0
		}
	})
end

function resourceVerify(arg_237_0, arg_237_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_237_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_237_1
	local var_237_2 = PathMgr.ReadAllLines(var_237_0)
	local var_237_3 = {}

	if arg_237_0 then
		setActive(arg_237_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_237_4()
		if arg_237_0 then
			setActive(arg_237_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_237_1)

		if var_237_1 then
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

	local var_237_5 = var_237_2.Length
	local var_237_6

	local function var_237_7(arg_240_0)
		if arg_240_0 < 0 then
			var_237_4()

			return
		end

		if arg_237_1 then
			setSlider(arg_237_1, 0, var_237_5, var_237_5 - arg_240_0)
		end

		local var_240_0 = string.split(var_237_2[arg_240_0], ",")
		local var_240_1 = var_240_0[1]
		local var_240_2 = var_240_0[3]
		local var_240_3 = PathMgr.getAssetBundle(var_240_1)

		if PathMgr.FileExists(var_240_3) then
			local var_240_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_240_1))

			if var_240_2 == HashUtil.CalcMD5(var_240_4) then
				onNextTick(function()
					var_237_7(arg_240_0 - 1)
				end)

				return
			end
		end

		var_237_1 = var_240_1

		var_237_4()
	end

	var_237_7(var_237_5 - 1)
end

function splitByWordEN(arg_242_0, arg_242_1)
	local var_242_0 = string.split(arg_242_0, " ")
	local var_242_1 = ""
	local var_242_2 = ""
	local var_242_3 = arg_242_1:GetComponent(typeof(RectTransform))
	local var_242_4 = arg_242_1:GetComponent(typeof(Text))
	local var_242_5 = var_242_3.rect.width

	for iter_242_0, iter_242_1 in ipairs(var_242_0) do
		local var_242_6 = var_242_2

		var_242_2 = var_242_2 == "" and iter_242_1 or var_242_2 .. " " .. iter_242_1

		setText(arg_242_1, var_242_2)

		if var_242_5 < var_242_4.preferredWidth then
			var_242_1 = var_242_1 == "" and var_242_6 or var_242_1 .. "\n" .. var_242_6
			var_242_2 = iter_242_1
		end

		if iter_242_0 >= #var_242_0 then
			var_242_1 = var_242_1 == "" and var_242_2 or var_242_1 .. "\n" .. var_242_2
		end
	end

	return var_242_1
end

function checkBirthFormat(arg_243_0)
	if #arg_243_0 ~= 8 then
		return false
	end

	local var_243_0 = 0
	local var_243_1 = #arg_243_0

	while var_243_0 < var_243_1 do
		local var_243_2 = string.byte(arg_243_0, var_243_0 + 1)

		if var_243_2 < 48 or var_243_2 > 57 then
			return false
		end

		var_243_0 = var_243_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_244_0)
	local var_244_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_244_0, function(arg_245_0)
		return arg_245_0 == arg_244_0
	end)
end

function GetServerState(arg_246_0)
	local var_246_0 = -1
	local var_246_1 = 0
	local var_246_2 = 1
	local var_246_3 = 2
	local var_246_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_246_4 = string.gsub(var_246_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_246_4, function(arg_247_0, arg_247_1)
		local var_247_0 = true
		local var_247_1 = false

		for iter_247_0 in string.gmatch(arg_247_1, "\"state\":%d") do
			if iter_247_0 ~= "\"state\":1" then
				var_247_0 = false
			end

			var_247_1 = true
		end

		if not var_247_1 then
			var_247_0 = false
		end

		if arg_246_0 ~= nil then
			arg_246_0(var_247_0 and var_246_2 or var_246_1)
		end
	end)
end

function setScrollText(arg_248_0, arg_248_1)
	GetOrAddComponent(arg_248_0, "ScrollText"):SetText(arg_248_1)
end

function changeToScrollText(arg_249_0, arg_249_1)
	local var_249_0 = GetComponent(arg_249_0, typeof(Text))

	assert(var_249_0, "without component<Text>")

	local var_249_1 = arg_249_0:Find("subText")

	if not var_249_1 then
		var_249_1 = cloneTplTo(arg_249_0, arg_249_0, "subText")

		eachChild(arg_249_0, function(arg_250_0)
			setActive(arg_250_0, arg_250_0 == var_249_1)
		end)

		arg_249_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_249_1, arg_249_1)
end

local var_0_17
local var_0_18
local var_0_19
local var_0_20

local function var_0_21(arg_251_0, arg_251_1, arg_251_2)
	local var_251_0 = arg_251_0:Find("base")
	local var_251_1, var_251_2, var_251_3 = Equipment.GetInfoTrans(arg_251_1, arg_251_2)

	if arg_251_1.nextValue then
		local var_251_4 = {
			name = arg_251_1.name,
			type = arg_251_1.type,
			value = arg_251_1.nextValue
		}
		local var_251_5, var_251_6 = Equipment.GetInfoTrans(var_251_4, arg_251_2)

		var_251_2 = var_251_2 .. setColorStr("   >   " .. var_251_6, COLOR_GREEN)
	end

	setText(var_251_0:Find("name"), var_251_1)

	if var_251_3 then
		local var_251_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_251_0:Find("value"), var_251_2 .. var_251_7)
	else
		setText(var_251_0:Find("value"), var_251_2)
	end

	setActive(var_251_0:Find("value/up"), arg_251_1.compare and arg_251_1.compare > 0)
	setActive(var_251_0:Find("value/down"), arg_251_1.compare and arg_251_1.compare < 0)
	triggerToggle(var_251_0, arg_251_1.lock_open)

	if not arg_251_1.lock_open and arg_251_1.sub and #arg_251_1.sub > 0 then
		GetComponent(var_251_0, typeof(Toggle)).enabled = true
	else
		setActive(var_251_0:Find("name/close"), false)
		setActive(var_251_0:Find("name/open"), false)

		GetComponent(var_251_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_22(arg_252_0, arg_252_1, arg_252_2, arg_252_3)
	var_0_21(arg_252_0, arg_252_2, arg_252_3)

	if not arg_252_2.sub or #arg_252_2.sub == 0 then
		return
	end

	var_0_19(arg_252_0:Find("subs"), arg_252_1, arg_252_2.sub, arg_252_3)
end

function var_0_19(arg_253_0, arg_253_1, arg_253_2, arg_253_3)
	removeAllChildren(arg_253_0)
	var_0_20(arg_253_0, arg_253_1, arg_253_2, arg_253_3)
end

function var_0_20(arg_254_0, arg_254_1, arg_254_2, arg_254_3)
	for iter_254_0, iter_254_1 in ipairs(arg_254_2) do
		local var_254_0 = cloneTplTo(arg_254_1, arg_254_0)

		var_0_22(var_254_0, arg_254_1, iter_254_1, arg_254_3)
	end
end

function updateEquipInfo(arg_255_0, arg_255_1, arg_255_2, arg_255_3)
	local var_255_0 = arg_255_0:Find("attr_tpl")

	var_0_19(arg_255_0:Find("attrs"), var_255_0, arg_255_1.attrs, arg_255_3)
	setActive(arg_255_0:Find("skill"), arg_255_2)

	if arg_255_2 then
		var_0_22(arg_255_0:Find("skill/attr"), var_255_0, {
			name = i18n("skill"),
			value = setColorStr(arg_255_2.name, "#FFDE00FF")
		}, arg_255_3)
		setText(arg_255_0:Find("skill/value/Text"), getSkillDescGet(arg_255_2.id))
	end

	setActive(arg_255_0:Find("weapon"), #arg_255_1.weapon.sub > 0)

	if #arg_255_1.weapon.sub > 0 then
		var_0_19(arg_255_0:Find("weapon"), var_255_0, {
			arg_255_1.weapon
		}, arg_255_3)
	end

	setActive(arg_255_0:Find("equip_info"), #arg_255_1.equipInfo.sub > 0)

	if #arg_255_1.equipInfo.sub > 0 then
		var_0_19(arg_255_0:Find("equip_info"), var_255_0, {
			arg_255_1.equipInfo
		}, arg_255_3)
	end

	var_0_22(arg_255_0:Find("part/attr"), var_255_0, {
		name = i18n("equip_info_23")
	}, arg_255_3)

	local var_255_1 = arg_255_0:Find("part/value")
	local var_255_2 = var_255_1:Find("label")
	local var_255_3 = {}
	local var_255_4 = {}

	if #arg_255_1.part[1] == 0 and #arg_255_1.part[2] == 0 then
		setmetatable(var_255_3, {
			__index = function(arg_256_0, arg_256_1)
				return true
			end
		})
		setmetatable(var_255_4, {
			__index = function(arg_257_0, arg_257_1)
				return true
			end
		})
	else
		for iter_255_0, iter_255_1 in ipairs(arg_255_1.part[1]) do
			var_255_3[iter_255_1] = true
		end

		for iter_255_2, iter_255_3 in ipairs(arg_255_1.part[2]) do
			var_255_4[iter_255_3] = true
		end
	end

	local var_255_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_255_3, var_255_4)

	UIItemList.StaticAlign(var_255_1, var_255_2, #var_255_5, function(arg_258_0, arg_258_1, arg_258_2)
		arg_258_1 = arg_258_1 + 1

		if arg_258_0 == UIItemList.EventUpdate then
			local var_258_0 = var_255_5[arg_258_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_258_0), arg_258_2)
			setActive(arg_258_2:Find("main"), var_255_3[var_258_0] and not var_255_4[var_258_0])
			setActive(arg_258_2:Find("sub"), var_255_4[var_258_0] and not var_255_3[var_258_0])
			setImageAlpha(arg_258_2, not var_255_3[var_258_0] and not var_255_4[var_258_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_259_0, arg_259_1, arg_259_2)
	local var_259_0 = arg_259_0:Find("attr_tpl")

	var_0_19(arg_259_0:Find("attrs"), var_259_0, arg_259_1.attrs, arg_259_2)
	setActive(arg_259_0:Find("weapon"), #arg_259_1.weapon.sub > 0)

	if #arg_259_1.weapon.sub > 0 then
		var_0_19(arg_259_0:Find("weapon"), var_259_0, {
			arg_259_1.weapon
		}, arg_259_2)
	end

	setActive(arg_259_0:Find("equip_info"), #arg_259_1.equipInfo.sub > 0)

	if #arg_259_1.equipInfo.sub > 0 then
		var_0_19(arg_259_0:Find("equip_info"), var_259_0, {
			arg_259_1.equipInfo
		}, arg_259_2)
	end
end

function setCanvasOverrideSorting(arg_260_0, arg_260_1)
	local var_260_0 = arg_260_0.parent

	arg_260_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_260_0) then
		GetOrAddComponent(arg_260_0, typeof(Canvas)).overrideSorting = arg_260_1
	else
		setActive(arg_260_0, true)

		GetOrAddComponent(arg_260_0, typeof(Canvas)).overrideSorting = arg_260_1

		setActive(arg_260_0, false)
	end

	arg_260_0:SetParent(var_260_0, false)
end

function createNewGameObject(arg_261_0, arg_261_1)
	local var_261_0 = GameObject.New()

	if arg_261_0 then
		var_261_0.name = "model"
	end

	var_261_0.layer = arg_261_1 or Layer.UI

	return GetOrAddComponent(var_261_0, "RectTransform")
end

function CreateShell(arg_262_0)
	if type(arg_262_0) ~= "table" and type(arg_262_0) ~= "userdata" then
		return arg_262_0
	end

	local var_262_0 = setmetatable({
		__index = arg_262_0
	}, arg_262_0)

	return setmetatable({}, var_262_0)
end

function CameraFittingSettin(arg_263_0)
	local var_263_0 = GetComponent(arg_263_0, typeof(Camera))
	local var_263_1 = 1.7777777777777777
	local var_263_2 = Screen.width / Screen.height

	if var_263_2 < var_263_1 then
		local var_263_3 = var_263_2 / var_263_1

		var_263_0.rect = var_0_0.Rect.New(0, (1 - var_263_3) / 2, 1, var_263_3)
	end
end

function SwitchSpecialChar(arg_264_0, arg_264_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_264_0 = arg_264_0:gsub(" ", " ")
		arg_264_0 = arg_264_0:gsub("\t", "    ")
	end

	if not arg_264_1 then
		arg_264_0 = arg_264_0:gsub("\n", " ")
	end

	return arg_264_0
end

function AfterCheck(arg_265_0, arg_265_1)
	local var_265_0 = {}

	for iter_265_0, iter_265_1 in ipairs(arg_265_0) do
		var_265_0[iter_265_0] = iter_265_1[1]()
	end

	arg_265_1()

	for iter_265_2, iter_265_3 in ipairs(arg_265_0) do
		if var_265_0[iter_265_2] ~= iter_265_3[1]() then
			iter_265_3[2]()
		end

		var_265_0[iter_265_2] = iter_265_3[1]()
	end
end

function CompareFuncs(arg_266_0, arg_266_1)
	local var_266_0 = {}

	local function var_266_1(arg_267_0, arg_267_1)
		var_266_0[arg_267_0] = var_266_0[arg_267_0] or {}
		var_266_0[arg_267_0][arg_267_1] = var_266_0[arg_267_0][arg_267_1] or arg_266_0[arg_267_0](arg_267_1)

		return var_266_0[arg_267_0][arg_267_1]
	end

	return function(arg_268_0, arg_268_1)
		local var_268_0 = 1

		while var_268_0 <= #arg_266_0 do
			local var_268_1 = var_266_1(var_268_0, arg_268_0)
			local var_268_2 = var_266_1(var_268_0, arg_268_1)

			if var_268_1 == var_268_2 then
				var_268_0 = var_268_0 + 1
			else
				return var_268_1 < var_268_2
			end
		end

		return tobool(arg_266_1)
	end
end

function DropResultIntegration(arg_269_0)
	local var_269_0 = {}
	local var_269_1 = 1

	while var_269_1 <= #arg_269_0 do
		local var_269_2 = arg_269_0[var_269_1].type
		local var_269_3 = arg_269_0[var_269_1].id

		var_269_0[var_269_2] = var_269_0[var_269_2] or {}

		if var_269_0[var_269_2][var_269_3] then
			local var_269_4 = arg_269_0[var_269_0[var_269_2][var_269_3]]
			local var_269_5 = table.remove(arg_269_0, var_269_1)

			var_269_4.count = var_269_4.count + var_269_5.count
		else
			var_269_0[var_269_2][var_269_3] = var_269_1
			var_269_1 = var_269_1 + 1
		end
	end

	local var_269_6 = {
		function(arg_270_0)
			local var_270_0 = arg_270_0.type
			local var_270_1 = arg_270_0.id

			if var_270_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_270_0 == DROP_TYPE_RESOURCE then
				if var_270_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_270_0 == DROP_TYPE_ITEM then
				if var_270_1 == 59010 then
					return 4
				elseif var_270_1 == 59900 then
					return 5
				else
					local var_270_2 = Item.getConfigData(var_270_1)
					local var_270_3 = var_270_2 and var_270_2.type or 0

					if var_270_3 == 9 then
						return 6
					elseif var_270_3 == 5 then
						return 7
					elseif var_270_3 == 4 then
						return 8
					elseif var_270_3 == 7 then
						return 9
					end
				end
			elseif var_270_0 == DROP_TYPE_VITEM and var_270_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_271_0)
			local var_271_0

			if arg_271_0.type == DROP_TYPE_SHIP then
				var_271_0 = pg.ship_data_statistics[arg_271_0.id]
			elseif arg_271_0.type == DROP_TYPE_ITEM then
				var_271_0 = Item.getConfigData(arg_271_0.id)
			end

			return (var_271_0 and var_271_0.rarity or 0) * -1
		end,
		function(arg_272_0)
			return arg_272_0.id
		end
	}

	table.sort(arg_269_0, CompareFuncs(var_269_6))
end

function getLoginConfig()
	local var_273_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_273_1 = 1

	for iter_273_0, iter_273_1 in ipairs(pg.login.all) do
		if pg.login[iter_273_1].date ~= "stop" then
			local var_273_2, var_273_3 = parseTimeConfig(pg.login[iter_273_1].date)

			assert(not var_273_3)

			if pg.TimeMgr.GetInstance():inTime(var_273_2, var_273_0) then
				var_273_1 = iter_273_1

				break
			end
		end
	end

	local var_273_4 = pg.login[var_273_1].login_static

	var_273_4 = var_273_4 ~= "" and var_273_4 or "login"

	local var_273_5 = pg.login[var_273_1].login_cri
	local var_273_6 = var_273_5 ~= "" and true or false
	local var_273_7 = pg.login[var_273_1].op_play == 1 and true or false
	local var_273_8 = pg.login[var_273_1].op_time

	if var_273_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_273_8, var_273_0) then
		var_273_7 = false
	end

	local var_273_9 = var_273_8 == "" and var_273_8 or table.concat(var_273_8[1][1])

	return var_273_6, var_273_6 and var_273_5 or var_273_4, pg.login[var_273_1].bgm, var_273_7, var_273_9
end

function setIntimacyIcon(arg_274_0, arg_274_1, arg_274_2)
	local var_274_0 = {}
	local var_274_1

	seriesAsync({
		function(arg_275_0)
			if arg_274_0.childCount > 0 then
				var_274_1 = arg_274_0:GetChild(0)

				arg_275_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_276_0)
					var_274_1 = tf(arg_276_0)

					setParent(var_274_1, arg_274_0)
					arg_275_0()
				end)
			end
		end,
		function(arg_277_0)
			setImageAlpha(var_274_1, arg_274_2 and 0 or 1)
			eachChild(var_274_1, function(arg_278_0)
				setActive(arg_278_0, false)
			end)

			if arg_274_2 then
				local var_277_0 = var_274_1:Find(arg_274_2 .. "(Clone)")

				if not var_277_0 then
					LoadAndInstantiateAsync("ui", arg_274_2, function(arg_279_0)
						setParent(arg_279_0, var_274_1)
						setActive(arg_279_0, true)
					end)
				else
					setActive(var_277_0, true)
				end
			elseif arg_274_1 then
				setImageSprite(var_274_1, GetSpriteFromAtlas("energy", arg_274_1), true)
			else
				assert(false, "param error")
			end
		end
	})
end

local var_0_23

function nowWorld()
	var_0_23 = var_0_23 or getProxy(WorldProxy)

	return var_0_23 and var_0_23.world
end

function removeWorld()
	var_0_23.world:Dispose()

	var_0_23.world = nil
	var_0_23 = nil
end

function switch(arg_282_0, arg_282_1, arg_282_2, ...)
	if arg_282_1[arg_282_0] then
		return arg_282_1[arg_282_0](...)
	elseif arg_282_2 then
		return arg_282_2(...)
	end
end

function parseTimeConfig(arg_283_0)
	if type(arg_283_0[1]) == "table" then
		return arg_283_0[2], arg_283_0[1]
	else
		return arg_283_0
	end
end

local var_0_24 = {
	__add = function(arg_284_0, arg_284_1)
		return NewPos(arg_284_0.x + arg_284_1.x, arg_284_0.y + arg_284_1.y)
	end,
	__sub = function(arg_285_0, arg_285_1)
		return NewPos(arg_285_0.x - arg_285_1.x, arg_285_0.y - arg_285_1.y)
	end,
	__mul = function(arg_286_0, arg_286_1)
		if type(arg_286_1) == "number" then
			return NewPos(arg_286_0.x * arg_286_1, arg_286_0.y * arg_286_1)
		else
			return NewPos(arg_286_0.x * arg_286_1.x, arg_286_0.y * arg_286_1.y)
		end
	end,
	__eq = function(arg_287_0, arg_287_1)
		return arg_287_0.x == arg_287_1.x and arg_287_0.y == arg_287_1.y
	end,
	__tostring = function(arg_288_0)
		return arg_288_0.x .. "_" .. arg_288_0.y
	end
}

function NewPos(arg_289_0, arg_289_1)
	assert(arg_289_0 and arg_289_1)

	local var_289_0 = setmetatable({
		x = arg_289_0,
		y = arg_289_1
	}, var_0_24)

	function var_289_0.SqrMagnitude(arg_290_0)
		return arg_290_0.x * arg_290_0.x + arg_290_0.y * arg_290_0.y
	end

	function var_289_0.Normalize(arg_291_0)
		local var_291_0 = arg_291_0:SqrMagnitude()

		if var_291_0 > 1e-05 then
			return arg_291_0 * (1 / math.sqrt(var_291_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_289_0
end

local var_0_25

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_25 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_25 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_293_0)
	return (string.char(226, 133, 160 + (arg_293_0 - 1)))
end

function quickPlayAnimator(arg_294_0, arg_294_1)
	arg_294_0:GetComponent(typeof(Animator)):Play(arg_294_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_295_0, arg_295_1)
	local var_295_0 = arg_295_0:GetComponent(typeof(Animator))

	var_295_0.enabled = true

	local var_295_1 = Animator.StringToHash(arg_295_1)

	if var_295_0:HasState(0, var_295_1) then
		var_295_0:Play(arg_295_1, -1, 0)
	end
end

function quickPlayAnimation(arg_296_0, arg_296_1)
	arg_296_0:GetComponent(typeof(Animation)):Play(arg_296_1)
end

function getSurveyUrl(arg_297_0)
	local var_297_0 = pg.survey_data_template[arg_297_0]
	local var_297_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_297_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_297_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_297_1 = var_297_0.main_url
				else
					var_297_1 = var_297_0.uo_url
				end
			elseif var_297_2 == PLATFORM_IPHONEPLAYER then
				var_297_1 = var_297_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_KR then
			var_297_1 = var_297_0.main_url
		end
	else
		var_297_1 = var_297_0.main_url
	end

	local var_297_3 = getProxy(PlayerProxy):getRawData().id
	local var_297_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_297_5
	local var_297_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_297_7 = getProxy(UserProxy):getRawData()
	local var_297_8 = getProxy(ServerProxy):getRawData()[var_297_7 and var_297_7.server or 0]
	local var_297_9 = var_297_8 and var_297_8.id or ""
	local var_297_10 = getProxy(PlayerProxy):getRawData().level
	local var_297_11 = var_297_3 .. "_" .. arg_297_0
	local var_297_12 = var_297_1
	local var_297_13 = {
		var_297_3,
		var_297_4,
		var_297_6,
		var_297_9,
		var_297_10,
		var_297_11
	}

	if var_297_12 then
		for iter_297_0, iter_297_1 in ipairs(var_297_13) do
			var_297_12 = string.gsub(var_297_12, "$" .. iter_297_0, tostring(iter_297_1))
		end
	end

	originalPrint("survey url", tostring(var_297_12))

	return var_297_12
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

function FilterVarchar(arg_299_0)
	assert(type(arg_299_0) == "string" or type(arg_299_0) == "table")

	if arg_299_0 == "" then
		return nil
	end

	return arg_299_0
end

function getGameset(arg_300_0)
	local var_300_0 = pg.gameset[arg_300_0]

	assert(var_300_0)

	return {
		var_300_0.key_value,
		var_300_0.description
	}
end

function getDorm3dGameset(arg_301_0)
	local var_301_0 = pg.dorm3d_set[arg_301_0]

	assert(var_301_0)

	return {
		var_301_0.key_value_int,
		var_301_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_302_0)
	arg_302_0 = arg_302_0 or {}

	local var_302_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_302_0 > 0 do
		local var_302_1 = table.remove(arg_302_0)

		switch(var_302_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_302_1:getConfig("open_directly") == 1 then
					for iter_303_0, iter_303_1 in ipairs(var_302_1:getConfig("display_icon")) do
						local var_303_0 = Drop.Create(iter_303_1)

						var_303_0.count = var_303_0.count * var_302_1.count

						table.insert(arg_302_0, var_303_0)
					end
				elseif var_302_1:getSubClass():IsShipExpType() then
					var_302_0[var_302_1.type][var_302_1.id] = defaultValue(var_302_0[var_302_1.type][var_302_1.id], 0) + var_302_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_302_0[var_302_1.type][var_302_1.id] = defaultValue(var_302_0[var_302_1.type][var_302_1.id], 0) + var_302_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_302_0[var_302_1.type] = var_302_0[var_302_1.type] + var_302_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_302_0[var_302_1.type] = var_302_0[var_302_1.type] + var_302_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_302_0[var_302_1.type] = var_302_0[var_302_1.type] + var_302_1.count
			end
		})
	end

	return var_302_0
end

function CheckOverflow(arg_308_0, arg_308_1)
	local var_308_0 = {}
	local var_308_1 = arg_308_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_308_2 = arg_308_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_308_3 = arg_308_0[DROP_TYPE_EQUIP]
	local var_308_4 = arg_308_0[DROP_TYPE_SHIP]
	local var_308_5 = getProxy(PlayerProxy):getRawData()
	local var_308_6 = false

	if arg_308_1 then
		local var_308_7 = var_308_5:OverStore(PlayerConst.ResStoreGold, var_308_1)
		local var_308_8 = var_308_5:OverStore(PlayerConst.ResStoreOil, var_308_2)

		if var_308_7 > 0 or var_308_8 > 0 then
			var_308_0.isStoreOverflow = {
				var_308_7,
				var_308_8
			}
		end
	else
		if var_308_1 > 0 and var_308_5:GoldMax(var_308_1) then
			return false, "gold"
		end

		if var_308_2 > 0 and var_308_5:OilMax(var_308_2) then
			return false, "oil"
		end
	end

	var_308_0.isExpBookOverflow = {}

	for iter_308_0, iter_308_1 in pairs(arg_308_0[DROP_TYPE_ITEM]) do
		local var_308_9 = Item.getConfigData(iter_308_0)

		if getProxy(BagProxy):getItemCountById(iter_308_0) + iter_308_1 > var_308_9.max_num then
			table.insert(var_308_0.isExpBookOverflow, iter_308_0)
		end
	end

	local var_308_10 = getProxy(EquipmentProxy):getCapacity()

	if var_308_3 > 0 and var_308_10 >= var_308_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_308_11 = getProxy(BayProxy):getShipCount()

	if var_308_4 > 0 and var_308_4 + var_308_11 > var_308_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_308_0
end

function CheckShipExpOverflow(arg_309_0)
	local var_309_0 = getProxy(BagProxy)

	for iter_309_0, iter_309_1 in pairs(arg_309_0[DROP_TYPE_ITEM]) do
		if var_309_0:getItemCountById(iter_309_0) + iter_309_1 > Item.getConfigData(iter_309_0).max_num then
			return false
		end
	end

	return true
end

local var_0_26 = {
	[17] = "item_type17_tip2",
	tech = "techpackage_item_use_confirm",
	[16] = "item_type16_tip2",
	[11] = "equip_skin_detail_tip",
	[13] = "item_type13_tip2"
}

function RegisterDetailButton(arg_310_0, arg_310_1, arg_310_2)
	Drop.Change(arg_310_2)
	switch(arg_310_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_310_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_311_0 = Item.getConfigData(arg_310_2.id).usage_arg
				local var_311_1 = var_311_0[3]

				if Item.InTimeLimitSkinAssigned(arg_310_2.id) then
					var_311_1 = table.mergeArray(var_311_0[2], var_311_1, true)
				end

				local var_311_2 = {}

				for iter_311_0, iter_311_1 in ipairs(var_311_0[2]) do
					var_311_2[iter_311_1] = true
				end

				onButton(arg_310_0, arg_310_1, function()
					arg_310_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_310_2.id,
								selectableSkinList = underscore.map(var_311_1, function(arg_313_0)
									return SelectableSkin.New({
										id = arg_313_0,
										isTimeLimit = var_311_2[arg_313_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_310_1, true)
			else
				local var_311_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_310_2.id) and "tech" or arg_310_2:getConfig("type")

				if var_0_26[var_311_3] then
					local var_311_4 = {
						item2Row = true,
						content = i18n(var_0_26[var_311_3]),
						itemList = underscore.map(arg_310_2:getConfig("display_icon"), function(arg_314_0)
							return Drop.Create(arg_314_0)
						end)
					}

					if var_311_3 == 11 then
						onButton(arg_310_0, arg_310_1, function()
							arg_310_0:emit(BaseUI.ON_DROP_LIST_OWN, var_311_4)
						end, SFX_PANEL)
					else
						onButton(arg_310_0, arg_310_1, function()
							arg_310_0:emit(BaseUI.ON_DROP_LIST, var_311_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_310_1, tobool(var_0_26[var_311_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_310_0, arg_310_1, function()
				arg_310_0:emit(BaseUI.ON_DROP, arg_310_2)
			end, SFX_PANEL)
			setActive(arg_310_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_310_0, arg_310_1, function()
				arg_310_0:emit(BaseUI.ON_DROP, arg_310_2)
			end, SFX_PANEL)
			setActive(arg_310_1, true)
		end
	}, function()
		setActive(arg_310_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_322_0, arg_322_1, arg_322_2)
	Drop.Change(arg_322_2)
	switch(arg_322_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_323_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_322_2.id) and "tech" or arg_322_2:getConfig("type")

			if var_0_26[var_323_0] then
				local var_323_1 = {
					useDeepShow = true,
					showOwn = var_323_0 == 11,
					content = i18n(var_0_26[var_323_0]),
					itemList = underscore.map(arg_322_2:getConfig("display_icon"), function(arg_324_0)
						return Drop.Create(arg_324_0)
					end)
				}

				onButton(arg_322_0, arg_322_1, function()
					arg_322_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_323_1)
				end, SFX_PANEL)
			end

			setActive(arg_322_1, tobool(var_0_26[var_323_0]))
		end
	}, function()
		setActive(arg_322_1, false)
	end)
end

function UpdateOwnDisplay(arg_327_0, arg_327_1)
	local var_327_0, var_327_1 = arg_327_1:getOwnedCount()

	setActive(arg_327_0, var_327_1 and var_327_0 > 0)

	if var_327_1 and var_327_0 > 0 then
		setText(arg_327_0:Find("label"), i18n("word_own1"))
		setText(arg_327_0:Find("Text"), var_327_0)
	end
end

function Damp(arg_328_0, arg_328_1, arg_328_2)
	arg_328_1 = Mathf.Max(1, arg_328_1)

	local var_328_0 = Mathf.Epsilon

	if arg_328_1 < var_328_0 or var_328_0 > Mathf.Abs(arg_328_0) then
		return arg_328_0
	end

	if arg_328_2 < var_328_0 then
		return 0
	end

	local var_328_1 = -4.605170186

	return arg_328_0 * (1 - Mathf.Exp(var_328_1 * arg_328_2 / arg_328_1))
end

function checkCullResume(arg_329_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_329_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_329_0 = arg_329_0:GetComponentsInChildren(typeof(MeshImage)):ToTable()

		for iter_329_0, iter_329_1 in ipairs(var_329_0) do
			iter_329_1:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_330_0)
	local var_330_0 = {}

	if arg_330_0 and arg_330_0 ~= "" then
		local var_330_1 = base64.dec(arg_330_0)

		var_330_0 = string.split(var_330_1, "/")
		var_330_0[5], var_330_0[6] = unpack(string.split(var_330_0[5], "\\"))

		if #var_330_0 < 6 or arg_330_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_330_0, 5), "/"),
			var_330_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_330_0 = {}
		end
	end

	for iter_330_0 = 1, 6 do
		var_330_0[iter_330_0] = var_330_0[iter_330_0] and tonumber(var_330_0[iter_330_0], 32) or 0
	end

	return var_330_0
end

function buildEquipCode(arg_331_0)
	local var_331_0 = underscore.map(arg_331_0:getAllEquipments(), function(arg_332_0)
		return ConversionBase(32, arg_332_0 and arg_332_0.id or 0)
	end)
	local var_331_1 = {
		table.concat(var_331_0, "/"),
		ConversionBase(32, checkExist(arg_331_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_331_1, "\\"))
end

function setDirectorSpeed(arg_333_0, arg_333_1)
	GetComponent(arg_333_0, "TimelineSpeed"):SetTimelineSpeed(arg_333_1)
end

function setDefaultZeroMetatable(arg_334_0)
	return setmetatable(arg_334_0, {
		__index = function(arg_335_0, arg_335_1)
			if rawget(arg_335_0, arg_335_1) == nil then
				arg_335_0[arg_335_1] = 0
			end

			return arg_335_0[arg_335_1]
		end
	})
end

function checkABExist(arg_336_0)
	if EDITOR_TOOL then
		return ResourceMgr.Inst:AssetExist(arg_336_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_336_0))
	end
end

function compareNumber(arg_337_0, arg_337_1, arg_337_2)
	return switch(arg_337_1, {
		[">"] = function()
			return arg_337_0 > arg_337_2
		end,
		[">="] = function()
			return arg_337_0 >= arg_337_2
		end,
		["="] = function()
			return arg_337_0 == arg_337_2
		end,
		["<"] = function()
			return arg_337_0 < arg_337_2
		end,
		["<="] = function()
			return arg_337_0 <= arg_337_2
		end
	})
end

function ArabicToRoman(arg_343_0)
	local var_343_0 = {
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

	local function var_343_1(arg_344_0, arg_344_1)
		return select(2, arg_344_0:gsub(arg_344_1, ""))
	end

	local var_343_2 = ""

	while arg_343_0 > 0 do
		for iter_343_0, iter_343_1 in pairs(var_343_0) do
			local var_343_3 = iter_343_1[2]
			local var_343_4 = iter_343_1[1]

			while var_343_4 <= arg_343_0 do
				var_343_2 = var_343_2 .. var_343_3
				arg_343_0 = arg_343_0 - var_343_4
			end
		end
	end

	if arg_343_0 > 10000 then
		local var_343_5 = var_343_1(var_343_2, "M")

		var_343_2 = "M*" .. var_343_5 .. " " .. var_343_2
	end

	return var_343_2
end

function stringInset(arg_345_0, ...)
	for iter_345_0, iter_345_1 in ipairs({
		...
	}) do
		arg_345_0 = string.gsub(arg_345_0, "$" .. iter_345_0, iter_345_1)
	end

	return arg_345_0
end
