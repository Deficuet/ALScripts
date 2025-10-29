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
			arg_37_4(arg_38_0)
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

	setIslandRarityFrame(arg_102_0, arg_102_1)
	setActive(findTF(arg_102_0, "icon_bg/count_bg"), false)
	GetImageSpriteFromAtlasAsync("island/" .. var_102_0, "", findTF(arg_102_0, "icon_bg/icon"))
	setIconName(arg_102_0, "", {})
end

function updateIslandInvitation(arg_103_0, arg_103_1)
	local var_103_0 = pg.island_chara_template[arg_103_1.id].invite_item
	local var_103_1 = pg.island_item_data_template[var_103_0].icon

	setIslandRarityFrame(arg_103_0, arg_103_1)
	setActive(findTF(arg_103_0, "icon_bg/count_bg"), arg_103_1.count > 0)
	setText(findTF(arg_103_0, "icon_bg/count_bg/count"), arg_103_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_103_1, "", findTF(arg_103_0, "icon_bg/icon"))
	setIconName(arg_103_0, "", {})
end

function updateIslandItem(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_1:getConfigTable().icon
	local var_104_1 = arg_104_1:getConfigTable().name

	setIslandRarityFrame(arg_104_0, arg_104_1)
	setActive(findTF(arg_104_0, "icon_bg/count_bg"), arg_104_1.count > 0)
	setText(findTF(arg_104_0, "icon_bg/count_bg/count"), arg_104_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_104_0, "", findTF(arg_104_0, "icon_bg/icon"))
	setIconName(arg_104_0, var_104_1, {})
end

function updateIslandFurniture(arg_105_0, arg_105_1)
	local var_105_0 = arg_105_1:getConfigTable().rarity
	local var_105_1 = arg_105_1:getConfigTable().icon
	local var_105_2 = arg_105_1:getConfigTable().name

	setIslandRarityFrame(arg_105_0, arg_105_1)
	setActive(findTF(arg_105_0, "icon_bg/count_bg"), arg_105_1.count > 0)
	setText(findTF(arg_105_0, "icon_bg/count_bg/count"), arg_105_1.count)
	GetImageSpriteFromAtlasAsync("island/IslandFurnitureIcon/" .. var_105_1, "", findTF(arg_105_0, "icon_bg/icon"))
	setIconName(arg_105_0, var_105_2, {})
end

function updateDefaultIconTpl(arg_106_0, arg_106_1, arg_106_2)
	arg_106_2 = arg_106_2 or {}

	local var_106_0 = arg_106_1:getDropRarity()
	local var_106_1 = ItemRarity.Rarity2Print(var_106_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_106_1, arg_106_0:Find("icon_bg"))
	setFrame(arg_106_0:Find("icon_bg/frame"), var_106_1)

	local var_106_2 = arg_106_0:Find("icon_bg/icon")

	for iter_106_0, iter_106_1 in ipairs({
		arg_106_1:getIcon(),
		arg_106_1:getDefaultIcon()
	}) do
		if noEmptyStr(iter_106_1) and checkABExist(iter_106_1) then
			GetImageSpriteFromAtlasAsync(iter_106_1, "", var_106_2)

			break
		end
	end

	setIconStars(arg_106_0, false)
	setIconName(arg_106_0, arg_106_1:getName(), arg_106_2)
	setIconColorful(arg_106_0, var_106_0, arg_106_2)
end

function updateIslandDefaultIconTpl(arg_107_0, arg_107_1, arg_107_2)
	GetImageSpriteFromAtlasAsync(arg_107_1:getIcon(), "", findTF(arg_107_0, "icon_bg/icon"))
	setActive(findTF(arg_107_0, "icon_bg/count_bg"), arg_107_1.count > 0)
	setText(findTF(arg_107_0, "icon_bg/count_bg/count"), arg_107_1.count)
	setIconName(arg_107_0, arg_107_1:getName(), {})
	setIslandRarityFrame(arg_107_0, arg_107_1)
end

function setIslandRarityFrame(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_1:getIslandRarity()
	local var_108_1 = IslandItemRarity.Rarity2FrameName(var_108_0)

	GetImageSpriteFromAtlasAsync("island/islandframe", var_108_1, findTF(arg_108_0, "icon_bg"))

	if not IsNil(findTF(arg_108_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("island/islandframe", var_108_1, findTF(arg_108_0, "icon_bg/frame"))
	end
end

function getIslandSeasonPtInfo()
	local var_109_0 = pg.island_set.season_pt.key_value_varchar

	return {
		name = var_109_0[1],
		icon = var_109_0[2]
	}
end

function updateIslandSeasonPt(arg_110_0, arg_110_1)
	local var_110_0 = getIslandSeasonPtInfo()

	GetImageSpriteFromAtlasAsync("island/" .. var_110_0.icon, "", findTF(arg_110_0, "icon_bg/icon"))
	setActive(findTF(arg_110_0, "icon_bg/count_bg"), arg_110_1.count > 0)
	setText(findTF(arg_110_0, "icon_bg/count_bg/count"), arg_110_1.count)
	setIslandRarityFrame(arg_110_0, arg_110_1)
end

function updateIslandCardDiy(arg_111_0, arg_111_1)
	GetImageSpriteFromAtlasAsync(arg_111_1:getIcon(), "", findTF(arg_111_0, "icon_bg/icon"))
	setActive(findTF(arg_111_0, "icon_bg/count_bg"), arg_111_1.count > 0)
	setText(findTF(arg_111_0, "icon_bg/count_bg/count"), arg_111_1.count)
	setIconName(arg_111_0, arg_111_1:getConfigTable().name, {})
	setIslandRarityFrame(arg_111_0, arg_111_1)
end

function updateIslandSpeedupTicket(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_1:getConfigTable().icon

	GetImageSpriteFromAtlasAsync("island/" .. var_112_0, "", findTF(arg_112_0, "icon_bg/icon"))
	setActive(findTF(arg_112_0, "icon_bg/count_bg"), arg_112_1.count > 0)
	setText(findTF(arg_112_0, "icon_bg/count_bg/count"), arg_112_1.count)
	setIconName(arg_112_0, arg_112_1:getConfigTable().name, {})
	setIslandRarityFrame(arg_112_0, arg_112_1)
end

function updateIslandSkin(arg_113_0, arg_113_1)
	local var_113_0 = arg_113_1:getConfigTable().icon

	GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. var_113_0, "", findTF(arg_113_0, "icon_bg/icon"))
	setActive(findTF(arg_113_0, "icon_bg/count_bg"), arg_113_1.count > 0)
	setText(findTF(arg_113_0, "icon_bg/count_bg/count"), arg_113_1.count)
	setIconName(arg_113_0, arg_113_1:getConfigTable().name, {})
	setIslandRarityFrame(arg_113_0, arg_113_1)
end

function updateIslandWatherCollect(arg_114_0, arg_114_1)
	local var_114_0 = arg_114_1:getConfigTable().icon
	local var_114_1 = arg_114_1:getConfigTable().name

	setText(findTF(arg_114_0, "icon_bg/count"), arg_114_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_114_0, "", findTF(arg_114_0, "icon_bg/icon"))
	setIconName(arg_114_0, var_114_1, {})
	setIslandRarityFrame(arg_114_0, arg_114_1)
end

function updateWorldItem(arg_115_0, arg_115_1, arg_115_2)
	arg_115_2 = arg_115_2 or {}

	local var_115_0 = ItemRarity.Rarity2Print(arg_115_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_115_0, findTF(arg_115_0, "icon_bg"))
	setFrame(findTF(arg_115_0, "icon_bg/frame"), var_115_0)

	local var_115_1 = findTF(arg_115_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_115_1.icon or arg_115_1:getConfig("icon"), "", var_115_1)
	setIconStars(arg_115_0, false)
	setIconName(arg_115_0, arg_115_1:getConfig("name"), arg_115_2)
	setIconColorful(arg_115_0, arg_115_1:getConfig("rarity"), arg_115_2)
end

function updateWorldCollection(arg_116_0, arg_116_1, arg_116_2)
	arg_116_2 = arg_116_2 or {}

	assert(arg_116_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_116_1.id)

	local var_116_0 = arg_116_1:getDropRarity()
	local var_116_1 = ItemRarity.Rarity2Print(var_116_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_116_1, findTF(arg_116_0, "icon_bg"))
	setFrame(findTF(arg_116_0, "icon_bg/frame"), var_116_1)

	local var_116_2 = findTF(arg_116_0, "icon_bg/icon")
	local var_116_3 = WorldCollectionProxy.GetCollectionType(arg_116_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_116_3, "", var_116_2)
	setIconStars(arg_116_0, false)
	setIconName(arg_116_0, arg_116_1:getName(), arg_116_2)
	setIconColorful(arg_116_0, var_116_0, arg_116_2)
end

function updateWorldBuff(arg_117_0, arg_117_1, arg_117_2)
	arg_117_2 = arg_117_2 or {}

	local var_117_0 = pg.world_SLGbuff_data[arg_117_1]

	assert(var_117_0, "找不到大世界buff配置: " .. arg_117_1)

	local var_117_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_1, findTF(arg_117_0, "icon_bg"))
	setFrame(findTF(arg_117_0, "icon_bg/frame"), var_117_1)

	local var_117_2 = findTF(arg_117_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_117_0.icon, "", var_117_2)

	local var_117_3 = arg_117_0:Find("icon_bg/stars")

	if not IsNil(var_117_3) then
		setActive(var_117_3, false)
	end

	local var_117_4 = findTF(arg_117_0, "name")

	if not IsNil(var_117_4) then
		setText(var_117_4, var_117_0.name)
	end

	local var_117_5 = findTF(arg_117_0, "icon_bg/count")

	if not IsNil(var_117_5) then
		SetActive(var_117_5, false)
	end
end

function updateShip(arg_118_0, arg_118_1, arg_118_2)
	arg_118_2 = arg_118_2 or {}

	local var_118_0 = arg_118_1:rarity2bgPrint()
	local var_118_1 = arg_118_1:getPainting()

	if arg_118_2.anonymous then
		var_118_0 = "1"
		var_118_1 = "unknown"
	end

	if arg_118_2.unknown_small then
		var_118_1 = "unknown_small"
	end

	local var_118_2 = findTF(arg_118_0, "icon_bg/new")

	if var_118_2 then
		if arg_118_2.isSkin then
			setActive(var_118_2, not arg_118_2.isTimeLimit and arg_118_2.isNew)
		else
			setActive(var_118_2, arg_118_1.virgin)
		end
	end

	local var_118_3 = findTF(arg_118_0, "icon_bg/timelimit")

	if var_118_3 then
		setActive(var_118_3, arg_118_2.isTimeLimit)
	end

	local var_118_4 = findTF(arg_118_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_118_2.isSkin and "_skin" or var_118_0), var_118_4)

	local var_118_5 = findTF(arg_118_0, "icon_bg/frame")
	local var_118_6

	if arg_118_1.isNpc then
		var_118_6 = "frame_npc"
	elseif arg_118_1:ShowPropose() then
		var_118_6 = "frame_prop"

		if arg_118_1:isMetaShip() then
			var_118_6 = var_118_6 .. "_meta"
		end
	elseif arg_118_2.isSkin then
		var_118_6 = "frame_skin"
	end

	setFrame(var_118_5, var_118_0, var_118_6)

	if arg_118_2.gray then
		setGray(var_118_4, true, true)
	end

	local var_118_7 = findTF(arg_118_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_118_2.Q and "QIcon/" or "SquareIcon/") .. var_118_1, "", var_118_7)

	local var_118_8 = findTF(arg_118_0, "icon_bg/lv")

	if var_118_8 then
		setActive(var_118_8, not arg_118_1.isNpc)

		if not arg_118_1.isNpc then
			local var_118_9 = findTF(var_118_8, "Text")

			if var_118_9 and arg_118_1.level then
				setText(var_118_9, arg_118_1.level)
			end
		end
	end

	local var_118_10 = findTF(arg_118_0, "ship_type")

	if var_118_10 then
		setActive(var_118_10, true)
		setImageSprite(var_118_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_118_1:getShipType())))
	end

	local var_118_11 = var_118_4:Find("npc")

	if not IsNil(var_118_11) then
		if var_118_2 and go(var_118_2).activeSelf then
			setActive(var_118_11, false)
		else
			setActive(var_118_11, arg_118_1:isActivityNpc())
		end
	end

	local var_118_12 = arg_118_0:Find("group_locked")

	if var_118_12 then
		setActive(var_118_12, not arg_118_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_118_1.groupId))
	end

	setIconStars(arg_118_0, arg_118_2.initStar, arg_118_1:getStar())
	setIconName(arg_118_0, arg_118_2.isSkin and arg_118_1:GetSkinConfig().name or arg_118_1:getName(), arg_118_2)
	setIconColorful(arg_118_0, arg_118_2.isSkin and ItemRarity.Gold or arg_118_1:getRarity() - 1, arg_118_2)
end

function updateCommander(arg_119_0, arg_119_1, arg_119_2)
	arg_119_2 = arg_119_2 or {}

	local var_119_0 = arg_119_1:getDropRarity()
	local var_119_1 = ItemRarity.Rarity2Print(var_119_0)
	local var_119_2 = arg_119_1:getConfig("painting")

	if arg_119_2.anonymous then
		var_119_1 = 1
		var_119_2 = "unknown"
	end

	local var_119_3 = findTF(arg_119_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_119_1, var_119_3)

	local var_119_4 = findTF(arg_119_0, "icon_bg/frame")

	setFrame(var_119_4, var_119_1)

	if arg_119_2.gray then
		setGray(var_119_3, true, true)
	end

	local var_119_5 = findTF(arg_119_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_119_2, "", var_119_5)
	setIconStars(arg_119_0, arg_119_2.initStar, 0)
	setIconName(arg_119_0, arg_119_1:getName(), arg_119_2)
end

function updateStrategy(arg_120_0, arg_120_1, arg_120_2)
	arg_120_2 = arg_120_2 or {}

	local var_120_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_120_0, findTF(arg_120_0, "icon_bg"))
	setFrame(findTF(arg_120_0, "icon_bg/frame"), var_120_0)

	local var_120_1 = findTF(arg_120_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_120_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_120_1:getIcon(), "", var_120_1)
	setIconStars(arg_120_0, false)
	setIconName(arg_120_0, arg_120_1:getName(), arg_120_2)
	setIconColorful(arg_120_0, ItemRarity.Gray, arg_120_2)
end

function updateFurniture(arg_121_0, arg_121_1, arg_121_2)
	arg_121_2 = arg_121_2 or {}

	local var_121_0 = arg_121_1:getDropRarity()
	local var_121_1 = ItemRarity.Rarity2Print(var_121_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_121_1, findTF(arg_121_0, "icon_bg"))
	setFrame(findTF(arg_121_0, "icon_bg/frame"), var_121_1)

	local var_121_2 = findTF(arg_121_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_121_1:getIcon(), "", var_121_2)
	setIconStars(arg_121_0, false)
	setIconName(arg_121_0, arg_121_1:getName(), arg_121_2)
	setIconColorful(arg_121_0, var_121_0, arg_121_2)
end

function updateSpWeapon(arg_122_0, arg_122_1, arg_122_2)
	arg_122_2 = arg_122_2 or {}

	assert(arg_122_1, "spWeaponVO can not be nil.")
	assert(isa(arg_122_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_122_0 = ItemRarity.Rarity2Print(arg_122_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_122_0, findTF(arg_122_0, "icon_bg"))
	setFrame(findTF(arg_122_0, "icon_bg/frame"), var_122_0)

	local var_122_1 = findTF(arg_122_0, "icon_bg/icon")

	var_0_4(var_122_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_122_1:GetIconPath(), "", var_122_1)
	setIconStars(arg_122_0, true, arg_122_1:GetRarity())
	var_0_7(arg_122_0, arg_122_1:GetLevel() - 1)
	setIconName(arg_122_0, arg_122_1:GetName(), arg_122_2)
	setIconCount(arg_122_0, arg_122_1.count)
	setIconColorful(arg_122_0, arg_122_1:GetRarity(), arg_122_2)
end

function UpdateSpWeaponSlot(arg_123_0, arg_123_1, arg_123_2)
	local var_123_0 = ItemRarity.Rarity2Print(arg_123_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_123_0, findTF(arg_123_0, "Icon/Mask/icon_bg"))

	local var_123_1 = findTF(arg_123_0, "Icon/Mask/icon_bg/icon")

	arg_123_2 = arg_123_2 or {
		16,
		16,
		16,
		16
	}

	var_0_4(var_123_1, arg_123_2)
	GetImageSpriteFromAtlasAsync(arg_123_1:GetIconPath(), "", var_123_1)

	local var_123_2 = arg_123_1:GetLevel() - 1
	local var_123_3 = findTF(arg_123_0, "Icon/LV")

	setActive(var_123_3, var_123_2 > 0)
	setText(findTF(var_123_3, "Text"), var_123_2)
end

function updateDorm3dIcon(arg_124_0, arg_124_1)
	local var_124_0 = arg_124_1:getDropRarityDorm()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_124_0), arg_124_0)

	local var_124_1 = arg_124_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_124_1:getIcon(), "", var_124_1)
	setText(arg_124_0:Find("count/Text"), "x" .. arg_124_1.count)
	setText(arg_124_0:Find("name/Text"), arg_124_1:getName())
end

local var_0_8

function findCullAndClipWorldRect(arg_125_0)
	if #arg_125_0 == 0 then
		return false
	end

	local var_125_0 = arg_125_0[1].canvasRect

	for iter_125_0 = 1, #arg_125_0 do
		var_125_0 = rectIntersect(var_125_0, arg_125_0[iter_125_0].canvasRect)
	end

	if var_125_0.width <= 0 or var_125_0.height <= 0 then
		return false
	end

	var_0_8 = var_0_8 or GameObject.Find("UICamera/Canvas").transform

	local var_125_1 = var_0_8:TransformPoint(Vector3(var_125_0.x, var_125_0.y, 0))
	local var_125_2 = var_0_8:TransformPoint(Vector3(var_125_0.x + var_125_0.width, var_125_0.y + var_125_0.height, 0))

	return true, Vector4(var_125_1.x, var_125_1.y, var_125_2.x, var_125_2.y)
end

function rectIntersect(arg_126_0, arg_126_1)
	local var_126_0 = math.max(arg_126_0.x, arg_126_1.x)
	local var_126_1 = math.min(arg_126_0.x + arg_126_0.width, arg_126_1.x + arg_126_1.width)
	local var_126_2 = math.max(arg_126_0.y, arg_126_1.y)
	local var_126_3 = math.min(arg_126_0.y + arg_126_0.height, arg_126_1.y + arg_126_1.height)

	if var_126_0 <= var_126_1 and var_126_2 <= var_126_3 then
		return var_0_0.Rect.New(var_126_0, var_126_2, var_126_1 - var_126_0, var_126_3 - var_126_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_127_0)
	local var_127_0 = {}

	for iter_127_0, iter_127_1 in ipairs(arg_127_0) do
		local var_127_1 = Drop.Create(iter_127_1)

		var_127_1.count = var_127_1.count or 1

		if var_127_1.type == DROP_TYPE_EMOJI then
			table.insert(var_127_0, var_127_1:getName())
		else
			table.insert(var_127_0, var_127_1:getName() .. "x" .. var_127_1.count)
		end
	end

	return table.concat(var_127_0, "、")
end

function updateDrop(arg_128_0, arg_128_1, arg_128_2)
	Drop.Change(arg_128_1)

	arg_128_2 = arg_128_2 or {}

	local var_128_0 = {
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
	local var_128_1

	for iter_128_0, iter_128_1 in ipairs(var_128_0) do
		local var_128_2 = arg_128_0:Find(iter_128_1[1])

		if arg_128_1.type ~= iter_128_1[2] and not IsNil(var_128_2) then
			setActive(var_128_2, false)
		end
	end

	if not IsNil(arg_128_0:Find("icon_bg/frame")) then
		arg_128_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

		setIconColorful(arg_128_0, arg_128_1:getDropRarity(), arg_128_2, {
			[ItemRarity.Gold] = {
				name = "Item_duang5",
				active = function(arg_129_0, arg_129_1)
					return arg_129_1.fromAwardLayer and arg_129_0 >= ItemRarity.Gold
				end
			}
		})
		var_0_4(findTF(arg_128_0, "icon_bg/icon"), {
			2,
			2,
			2,
			2
		})
	end

	arg_128_1:UpdateDropTpl(arg_128_0, arg_128_2)
	setIconCount(arg_128_0, arg_128_2.count or arg_128_1:getCount())
end

function updateCustomDrop(arg_130_0, arg_130_1, arg_130_2)
	Drop.Change(arg_130_1)

	arg_130_2 = arg_130_2 or {}

	arg_130_1:UpdateCustomDropTpl(arg_130_0, arg_130_2)
end

function updateBuff(arg_131_0, arg_131_1, arg_131_2)
	arg_131_2 = arg_131_2 or {}

	local var_131_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_131_0, findTF(arg_131_0, "icon_bg"))

	local var_131_1 = pg.benefit_buff_template[arg_131_1]

	setFrame(findTF(arg_131_0, "icon_bg/frame"), var_131_0)
	setText(findTF(arg_131_0, "icon_bg/count"), 1)

	local var_131_2 = findTF(arg_131_0, "icon_bg/icon")
	local var_131_3 = var_131_1.icon

	GetImageSpriteFromAtlasAsync(var_131_3, "", var_131_2)
	setIconStars(arg_131_0, false)
	setIconName(arg_131_0, var_131_1.name, arg_131_2)
	setIconColorful(arg_131_0, ItemRarity.Gold, arg_131_2)
end

function updateAttire(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	local var_132_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_132_0, findTF(arg_132_0, "icon_bg"))
	setFrame(findTF(arg_132_0, "icon_bg/frame"), var_132_0)

	local var_132_1 = findTF(arg_132_0, "icon_bg/icon")
	local var_132_2

	if arg_132_1 == AttireConst.TYPE_CHAT_FRAME then
		var_132_2 = "chat_frame"
	elseif arg_132_1 == AttireConst.TYPE_ICON_FRAME then
		var_132_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_132_2, "", var_132_1)
	setIconName(arg_132_0, arg_132_2.name, arg_132_3)
end

function updateAttireCombatUI(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
	local var_133_0 = arg_133_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_133_0, findTF(arg_133_0, "icon_bg"))
	setFrame(findTF(arg_133_0, "icon_bg/frame"), var_133_0, "frame_battle_ui")

	local var_133_1 = findTF(arg_133_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_133_2.display_icon, "", var_133_1)
	setIconName(arg_133_0, arg_133_2.name, arg_133_3)
end

function updateActivityMedal(arg_134_0, arg_134_1, arg_134_2)
	local var_134_0 = ItemRarity.Rarity2Print(arg_134_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_134_0, findTF(arg_134_0, "icon_bg"))
	setFrame(findTF(arg_134_0, "icon_bg/frame"), var_134_0)

	local var_134_1 = findTF(arg_134_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_134_1.icon, "", var_134_1)
	setIconName(arg_134_0, arg_134_1.name, arg_134_2)
end

function updateCover(arg_135_0, arg_135_1, arg_135_2)
	local var_135_0 = arg_135_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_135_0, findTF(arg_135_0, "icon_bg"))
	setFrame(findTF(arg_135_0, "icon_bg/frame"), var_135_0)

	local var_135_1 = findTF(arg_135_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_135_1:getIcon(), "", var_135_1)
	setIconName(arg_135_0, arg_135_1:getName(), arg_135_2)
	setIconStars(arg_135_0, false)
end

function updateEmoji(arg_136_0, arg_136_1, arg_136_2)
	local var_136_0 = findTF(arg_136_0, "icon_bg/icon")
	local var_136_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_136_1, "", var_136_0)

	local var_136_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_136_2, findTF(arg_136_0, "icon_bg"))
	setFrame(findTF(arg_136_0, "icon_bg/frame"), var_136_2)
	setIconName(arg_136_0, arg_136_1.name, arg_136_2)
end

function updateEquipmentSkin(arg_137_0, arg_137_1, arg_137_2)
	arg_137_2 = arg_137_2 or {}

	local var_137_0 = EquipmentRarity.Rarity2Print(arg_137_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_137_0, findTF(arg_137_0, "icon_bg"))
	setFrame(findTF(arg_137_0, "icon_bg/frame"), var_137_0, "frame_skin")

	local var_137_1 = findTF(arg_137_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_137_1.icon, "", var_137_1)
	setIconStars(arg_137_0, false)
	setIconName(arg_137_0, arg_137_1.name, arg_137_2)
	setIconCount(arg_137_0, arg_137_1.count)
	setIconColorful(arg_137_0, arg_137_1.rarity - 1, arg_137_2)
end

function NoPosMsgBox(arg_138_0, arg_138_1, arg_138_2, arg_138_3)
	local var_138_0
	local var_138_1 = {}

	if arg_138_1 then
		table.insert(var_138_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_138_1
		})
	end

	if arg_138_2 then
		table.insert(var_138_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_138_2
		})
	end

	if arg_138_3 then
		table.insert(var_138_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_138_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_138_0,
		custom = var_138_1
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_139_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_139_0 and var_139_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_139_0
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
		local var_140_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_140_0 and var_140_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_140_0
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
		onClick = function(arg_143_0, arg_143_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_143_0.id,
				shipVOs = arg_143_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_144_0, arg_144_1, arg_144_2)
	if arg_144_2 then
		local var_144_0 = ""

		for iter_144_0, iter_144_1 in ipairs(arg_144_2) do
			local var_144_1 = Item.getConfigData(iter_144_1[1])

			var_144_0 = var_144_0 .. i18n(iter_144_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_144_1.name, iter_144_1[2])

			if iter_144_0 < #arg_144_2 then
				var_144_0 = var_144_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_144_0 ~= "" then
			arg_144_0 = arg_144_0 .. "\n" .. i18n("text_noRes_tip", var_144_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_144_0,
		onYes = function()
			gotoChargeScene(arg_144_1, arg_144_2)
		end
	})
end

function shoppingBatch(arg_146_0, arg_146_1, arg_146_2, arg_146_3, arg_146_4)
	local var_146_0 = pg.shop_template[arg_146_0]

	assert(var_146_0, "shop_template中找不到商品id：" .. arg_146_0)

	local var_146_1 = getProxy(PlayerProxy):getData()[id2res(var_146_0.resource_type)]
	local var_146_2 = arg_146_1.price or var_146_0.resource_num
	local var_146_3 = math.floor(var_146_1 / var_146_2)

	var_146_3 = var_146_3 <= 0 and 1 or var_146_3
	var_146_3 = arg_146_2 ~= nil and arg_146_2 < var_146_3 and arg_146_2 or var_146_3

	local var_146_4 = true
	local var_146_5 = 1

	if var_146_0 ~= nil and arg_146_1.id then
		print(var_146_3 * var_146_0.num, "--", var_146_3)
		assert(Item.getConfigData(arg_146_1.id), "item config should be existence")

		local var_146_6 = Item.New({
			id = arg_146_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_146_1.id
			},
			addNum = var_146_0.num,
			maxNum = var_146_3 * var_146_0.num,
			defaultNum = var_146_0.num,
			numUpdate = function(arg_147_0, arg_147_1)
				var_146_5 = math.floor(arg_147_1 / var_146_0.num)

				local var_147_0 = var_146_5 * var_146_2

				if var_147_0 > var_146_1 then
					setText(arg_147_0, i18n(arg_146_3, var_147_0, arg_147_1, COLOR_RED, var_146_6))

					var_146_4 = false
				else
					setText(arg_147_0, i18n(arg_146_3, var_147_0, arg_147_1, COLOR_GREEN, var_146_6))

					var_146_4 = true
				end
			end,
			onYes = function()
				if var_146_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_146_0,
						count = var_146_5
					})
				elseif arg_146_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_146_4))
					pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_149_0, arg_149_1, arg_149_2, arg_149_3, arg_149_4)
	local var_149_0 = pg.shop_template[arg_149_0]

	assert(var_149_0, "shop_template中找不到商品id：" .. arg_149_0)

	local var_149_1 = getProxy(PlayerProxy):getData()[id2res(var_149_0.resource_type)]
	local var_149_2 = arg_149_1.price or var_149_0.resource_num
	local var_149_3 = math.floor(var_149_1 / var_149_2)

	var_149_3 = var_149_3 <= 0 and 1 or var_149_3
	var_149_3 = arg_149_2 ~= nil and arg_149_2 < var_149_3 and arg_149_2 or var_149_3

	local var_149_4 = true
	local var_149_5 = 1

	if var_149_0 ~= nil and arg_149_1.id then
		print(var_149_3 * var_149_0.num, "--", var_149_3)
		assert(Item.getConfigData(arg_149_1.id), "item config should be existence")

		local var_149_6 = Item.New({
			id = arg_149_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_149_1.id
			}),
			price = var_149_2,
			addNum = var_149_0.num,
			maxNum = var_149_3 * var_149_0.num,
			defaultNum = var_149_0.num,
			numUpdate = function(arg_150_0, arg_150_1)
				var_149_5 = math.floor(arg_150_1 / var_149_0.num)

				local var_150_0 = var_149_5 * var_149_2

				if var_150_0 > var_149_1 then
					setTextInNewStyleBox(arg_150_0, i18n(arg_149_3, var_150_0, arg_150_1, COLOR_RED, var_149_6))

					var_149_4 = false
				else
					setTextInNewStyleBox(arg_150_0, i18n(arg_149_3, var_150_0, arg_150_1, "#238C40FF", var_149_6))

					var_149_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_149_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_149_0,
								count = var_149_5
							})
						elseif arg_149_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_149_4))
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

function gotoChargeScene(arg_152_0, arg_152_1)
	local var_152_0 = getProxy(ContextProxy)
	local var_152_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_152_1.mediator, NewShopMainMediator) then
		var_152_1.mediator:getViewComponent():switchSubViewByTogger(arg_152_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_152_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_152_1
		})
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
end

function clearDrop(arg_153_0)
	local var_153_0 = findTF(arg_153_0, "icon_bg")
	local var_153_1 = findTF(arg_153_0, "icon_bg/frame")
	local var_153_2 = findTF(arg_153_0, "icon_bg/icon")
	local var_153_3 = findTF(arg_153_0, "icon_bg/icon/icon")

	clearImageSprite(var_153_0)
	clearImageSprite(var_153_1)
	clearImageSprite(var_153_2)

	if var_153_3 then
		clearImageSprite(var_153_3)
	end
end

local var_0_9 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_154_0, arg_154_1, arg_154_2, arg_154_3)
	local var_154_0 = findTF(arg_154_0, "skill")
	local var_154_1 = findTF(arg_154_0, "lock")
	local var_154_2 = findTF(arg_154_0, "unknown")

	if arg_154_1 then
		setActive(var_154_0, true)
		setActive(var_154_2, false)
		setActive(var_154_1, not arg_154_2)
		LoadImageSpriteAsync("skillicon/" .. arg_154_1.icon, findTF(var_154_0, "icon"))

		local var_154_3 = arg_154_1.color or "blue"

		setText(findTF(var_154_0, "name"), shortenString(getSkillName(arg_154_1.id), arg_154_3 or 8))

		local var_154_4 = findTF(var_154_0, "level")

		setText(var_154_4, "LEVEL: " .. (arg_154_2 and arg_154_2.level or "??"))
		setTextColor(var_154_4, var_0_9[var_154_3])
	else
		setActive(var_154_0, false)
		setActive(var_154_2, true)
		setActive(var_154_1, false)
	end
end

local var_0_10 = true

function onBackButton(arg_155_0, arg_155_1, arg_155_2, arg_155_3)
	local var_155_0 = GetOrAddComponent(arg_155_1, "UILongPressTrigger")

	assert(arg_155_2, "callback should exist")

	var_155_0.longPressThreshold = defaultValue(arg_155_3, 1)

	local function var_155_1(arg_156_0)
		return function()
			if var_0_10 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_157_0, var_157_1 = arg_155_2()

			if var_157_0 then
				arg_156_0(var_157_1)
			end
		end
	end

	local var_155_2 = var_155_0.onReleased

	pg.DelegateInfo.Add(arg_155_0, var_155_2)
	var_155_2:RemoveAllListeners()
	var_155_2:AddListener(var_155_1(function(arg_158_0)
		arg_158_0:emit(BaseUI.ON_BACK)
	end))

	local var_155_3 = var_155_0.onLongPressed

	pg.DelegateInfo.Add(arg_155_0, var_155_3)
	var_155_3:RemoveAllListeners()
	var_155_3:AddListener(var_155_1(function(arg_159_0)
		arg_159_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_162_0)
	local var_162_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_162_1, var_162_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_162_0)

	return var_162_1 * 86400 + (var_162_2 + arg_162_0) * 3600
end

function GetPerceptualSize(arg_163_0, arg_163_1)
	local function var_163_0(arg_164_0)
		if not arg_164_0 then
			return 0, 1
		elseif arg_164_0 > 240 then
			return 4, 1
		elseif arg_164_0 > 225 then
			return 3, 1
		elseif arg_164_0 > 192 then
			return 2, 1
		elseif arg_164_0 < 126 then
			return 1, arg_163_1 or 0.5
		else
			return 1, 1
		end
	end

	if type(arg_163_0) == "number" then
		return var_163_0(arg_163_0)
	end

	local var_163_1 = 1
	local var_163_2 = 0
	local var_163_3 = 0
	local var_163_4 = #arg_163_0

	while var_163_1 <= var_163_4 do
		local var_163_5 = string.byte(arg_163_0, var_163_1)
		local var_163_6, var_163_7 = var_163_0(var_163_5)

		var_163_1 = var_163_1 + var_163_6
		var_163_2 = var_163_2 + var_163_7
	end

	return var_163_2
end

function shortenString(arg_165_0, arg_165_1, arg_165_2)
	local var_165_0 = 1
	local var_165_1 = 0
	local var_165_2 = 0
	local var_165_3 = #arg_165_0

	while var_165_0 <= var_165_3 do
		local var_165_4 = string.byte(arg_165_0, var_165_0)
		local var_165_5, var_165_6 = GetPerceptualSize(var_165_4, arg_165_2)

		var_165_0 = var_165_0 + var_165_5
		var_165_1 = var_165_1 + var_165_6

		if arg_165_1 <= math.ceil(var_165_1) then
			var_165_2 = var_165_0

			break
		end
	end

	if var_165_2 == 0 or var_165_3 < var_165_2 then
		return arg_165_0
	end

	return string.sub(arg_165_0, 1, var_165_2 - 1) .. ".."
end

function shouldShortenString(arg_166_0, arg_166_1)
	local var_166_0 = 1
	local var_166_1 = 0
	local var_166_2 = 0
	local var_166_3 = #arg_166_0

	while var_166_0 <= var_166_3 do
		local var_166_4 = string.byte(arg_166_0, var_166_0)
		local var_166_5, var_166_6 = GetPerceptualSize(var_166_4)

		var_166_0 = var_166_0 + var_166_5
		var_166_1 = var_166_1 + var_166_6

		if arg_166_1 <= math.ceil(var_166_1) then
			var_166_2 = var_166_0

			break
		end
	end

	if var_166_2 == 0 or var_166_3 < var_166_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_167_0, arg_167_1, arg_167_2, arg_167_3)
	local var_167_0 = true
	local var_167_1, var_167_2 = utf8_to_unicode(arg_167_0)
	local var_167_3 = filterEgyUnicode(filterSpecChars(arg_167_0))
	local var_167_4 = wordVer(arg_167_0)

	if not checkSpaceValid(arg_167_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_167_3[1]))

		var_167_0 = false
	elseif var_167_4 > 0 or var_167_3 ~= arg_167_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_167_3[4]))

		var_167_0 = false
	elseif var_167_2 < arg_167_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_167_3[2]))

		var_167_0 = false
	elseif arg_167_2 < var_167_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_167_3[3]))

		var_167_0 = false
	end

	return var_167_0
end

function checkSpaceValid(arg_168_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_168_0 = string.gsub(arg_168_0, " ", "")

	return arg_168_0 == string.gsub(var_168_0, "　", "")
end

function filterSpecChars(arg_169_0)
	local var_169_0 = {}
	local var_169_1 = 0
	local var_169_2 = 0
	local var_169_3 = 0
	local var_169_4 = 1

	while var_169_4 <= #arg_169_0 do
		local var_169_5 = string.byte(arg_169_0, var_169_4)

		if not var_169_5 then
			break
		end

		if var_169_5 >= 48 and var_169_5 <= 57 or var_169_5 >= 65 and var_169_5 <= 90 or var_169_5 == 95 or var_169_5 >= 97 and var_169_5 <= 122 then
			table.insert(var_169_0, string.char(var_169_5))
		elseif var_169_5 >= 228 and var_169_5 <= 233 then
			local var_169_6 = string.byte(arg_169_0, var_169_4 + 1)
			local var_169_7 = string.byte(arg_169_0, var_169_4 + 2)

			if var_169_6 and var_169_7 and var_169_6 >= 128 and var_169_6 <= 191 and var_169_7 >= 128 and var_169_7 <= 191 then
				var_169_4 = var_169_4 + 2

				table.insert(var_169_0, string.char(var_169_5, var_169_6, var_169_7))

				var_169_1 = var_169_1 + 1
			end
		elseif var_169_5 == 45 or var_169_5 == 40 or var_169_5 == 41 then
			table.insert(var_169_0, string.char(var_169_5))
		elseif var_169_5 == 194 then
			local var_169_8 = string.byte(arg_169_0, var_169_4 + 1)

			if var_169_8 == 183 then
				var_169_4 = var_169_4 + 1

				table.insert(var_169_0, string.char(var_169_5, var_169_8))

				var_169_1 = var_169_1 + 1
			end
		elseif var_169_5 == 239 then
			local var_169_9 = string.byte(arg_169_0, var_169_4 + 1)
			local var_169_10 = string.byte(arg_169_0, var_169_4 + 2)

			if var_169_9 == 188 and (var_169_10 == 136 or var_169_10 == 137) then
				var_169_4 = var_169_4 + 2

				table.insert(var_169_0, string.char(var_169_5, var_169_9, var_169_10))

				var_169_1 = var_169_1 + 1
			end
		elseif var_169_5 == 206 or var_169_5 == 207 then
			local var_169_11 = string.byte(arg_169_0, var_169_4 + 1)

			if var_169_5 == 206 and var_169_11 >= 177 or var_169_5 == 207 and var_169_11 <= 134 then
				var_169_4 = var_169_4 + 1

				table.insert(var_169_0, string.char(var_169_5, var_169_11))

				var_169_1 = var_169_1 + 1
			end
		elseif var_169_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_169_12 = string.byte(arg_169_0, var_169_4 + 1)
			local var_169_13 = string.byte(arg_169_0, var_169_4 + 2)

			if var_169_12 and var_169_13 and var_169_12 > 128 and var_169_12 <= 191 and var_169_13 >= 128 and var_169_13 <= 191 then
				var_169_4 = var_169_4 + 2

				table.insert(var_169_0, string.char(var_169_5, var_169_12, var_169_13))

				var_169_2 = var_169_2 + 1
			end
		elseif var_169_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_169_14 = string.byte(arg_169_0, var_169_4 + 1)
			local var_169_15 = string.byte(arg_169_0, var_169_4 + 2)

			if var_169_14 and var_169_15 and var_169_14 >= 128 and var_169_14 <= 191 and var_169_15 >= 128 and var_169_15 <= 191 then
				var_169_4 = var_169_4 + 2

				table.insert(var_169_0, string.char(var_169_5, var_169_14, var_169_15))

				var_169_3 = var_169_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_169_4 ~= 1 and var_169_5 == 32 and string.byte(arg_169_0, var_169_4 + 1) ~= 32 then
				table.insert(var_169_0, string.char(var_169_5))
			end

			if var_169_5 >= 192 and var_169_5 <= 223 then
				local var_169_16 = string.byte(arg_169_0, var_169_4 + 1)

				var_169_4 = var_169_4 + 1

				if var_169_5 == 194 and var_169_16 and var_169_16 >= 128 then
					table.insert(var_169_0, string.char(var_169_5, var_169_16))
				elseif var_169_5 == 195 and var_169_16 and var_169_16 <= 191 then
					table.insert(var_169_0, string.char(var_169_5, var_169_16))
				end
			end
		end

		var_169_4 = var_169_4 + 1
	end

	return table.concat(var_169_0), var_169_1 + var_169_2 + var_169_3
end

function filterEgyUnicode(arg_170_0)
	arg_170_0 = string.gsub(arg_170_0, "�[�-�][�-�]", "")
	arg_170_0 = string.gsub(arg_170_0, "�[�-�]", "")

	return arg_170_0
end

function shiftPanel(arg_171_0, arg_171_1, arg_171_2, arg_171_3, arg_171_4, arg_171_5, arg_171_6, arg_171_7, arg_171_8)
	arg_171_3 = arg_171_3 or 0.2

	if arg_171_5 then
		LeanTween.cancel(go(arg_171_0))
	end

	local var_171_0 = rtf(arg_171_0)

	arg_171_1 = arg_171_1 or var_171_0.anchoredPosition.x
	arg_171_2 = arg_171_2 or var_171_0.anchoredPosition.y

	local var_171_1 = LeanTween.move(var_171_0, Vector3(arg_171_1, arg_171_2, 0), arg_171_3)

	arg_171_7 = arg_171_7 or LeanTweenType.easeInOutSine

	var_171_1:setEase(arg_171_7)

	if arg_171_4 then
		var_171_1:setDelay(arg_171_4)
	end

	if arg_171_6 then
		GetOrAddComponent(arg_171_0, "CanvasGroup").blocksRaycasts = false
	end

	var_171_1:setOnComplete(System.Action(function()
		if arg_171_8 then
			arg_171_8()
		end

		if arg_171_6 then
			GetOrAddComponent(arg_171_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_171_1
end

function TweenValue(arg_173_0, arg_173_1, arg_173_2, arg_173_3, arg_173_4, arg_173_5, arg_173_6, arg_173_7)
	local var_173_0 = LeanTween.value(go(arg_173_0), arg_173_1, arg_173_2, arg_173_3):setOnUpdate(System.Action_float(function(arg_174_0)
		if arg_173_5 then
			arg_173_5(arg_174_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_173_6 then
			arg_173_6()
		end
	end)):setDelay(arg_173_4 or 0)

	if arg_173_7 and arg_173_7 > 0 then
		var_173_0:setRepeat(arg_173_7)
	end

	return var_173_0
end

function rotateAni(arg_176_0, arg_176_1, arg_176_2)
	return LeanTween.rotate(rtf(arg_176_0), 360 * arg_176_1, arg_176_2):setLoopClamp()
end

function blinkAni(arg_177_0, arg_177_1, arg_177_2, arg_177_3)
	return LeanTween.alpha(rtf(arg_177_0), arg_177_3 or 0, arg_177_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_177_2 or 0)
end

function scaleAni(arg_178_0, arg_178_1, arg_178_2, arg_178_3)
	return LeanTween.scale(rtf(arg_178_0), arg_178_3 or 0, arg_178_1):setLoopPingPong(arg_178_2 or 0)
end

function floatAni(arg_179_0, arg_179_1, arg_179_2, arg_179_3)
	local var_179_0 = arg_179_0.localPosition.y + arg_179_1

	return LeanTween.moveY(rtf(arg_179_0), var_179_0, arg_179_2):setLoopPingPong(arg_179_3 or 0)
end

local var_0_11 = tostring

function tostring(arg_180_0)
	if arg_180_0 == nil then
		return "nil"
	end

	local var_180_0 = var_0_11(arg_180_0)

	if var_180_0 == nil then
		if type(arg_180_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_180_0
end

function wordVer(arg_181_0, arg_181_1)
	if arg_181_0.match(arg_181_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_181_0
	end

	arg_181_1 = arg_181_1 or {}

	local var_181_0 = filterEgyUnicode(arg_181_0)

	if #var_181_0 ~= #arg_181_0 then
		if arg_181_1.isReplace then
			arg_181_0 = var_181_0
		else
			return 1
		end
	end

	local var_181_1 = wordSplit(arg_181_0)
	local var_181_2 = pg.word_template
	local var_181_3 = pg.word_legal_template

	arg_181_1.isReplace = arg_181_1.isReplace or false
	arg_181_1.replaceWord = arg_181_1.replaceWord or "*"

	local var_181_4 = #var_181_1
	local var_181_5 = 1
	local var_181_6 = ""
	local var_181_7 = 0

	while var_181_5 <= var_181_4 do
		local var_181_8, var_181_9, var_181_10 = wordLegalMatch(var_181_1, var_181_3, var_181_5)

		if var_181_8 then
			var_181_5 = var_181_9
			var_181_6 = var_181_6 .. var_181_10
		else
			local var_181_11, var_181_12, var_181_13 = wordVerMatch(var_181_1, var_181_2, arg_181_1, var_181_5, "", false, var_181_5, "")

			if var_181_11 then
				var_181_5 = var_181_12
				var_181_7 = var_181_7 + 1

				if arg_181_1.isReplace then
					var_181_6 = var_181_6 .. var_181_13
				end
			else
				if arg_181_1.isReplace then
					var_181_6 = var_181_6 .. var_181_1[var_181_5]
				end

				var_181_5 = var_181_5 + 1
			end
		end
	end

	if arg_181_1.isReplace then
		return var_181_7, var_181_6
	else
		return var_181_7
	end
end

function wordLegalMatch(arg_182_0, arg_182_1, arg_182_2, arg_182_3, arg_182_4)
	if arg_182_2 > #arg_182_0 then
		return arg_182_3, arg_182_2, arg_182_4
	end

	local var_182_0 = arg_182_0[arg_182_2]
	local var_182_1 = arg_182_1[var_182_0]

	arg_182_4 = arg_182_4 == nil and "" or arg_182_4

	if var_182_1 then
		if var_182_1.this then
			return wordLegalMatch(arg_182_0, var_182_1, arg_182_2 + 1, true, arg_182_4 .. var_182_0)
		else
			return wordLegalMatch(arg_182_0, var_182_1, arg_182_2 + 1, false, arg_182_4 .. var_182_0)
		end
	else
		return arg_182_3, arg_182_2, arg_182_4
	end
end

local var_0_12 = string.byte("a")
local var_0_13 = string.byte("z")
local var_0_14 = string.byte("A")
local var_0_15 = string.byte("Z")

local function var_0_16(arg_183_0)
	if not arg_183_0 then
		return arg_183_0
	end

	local var_183_0 = string.byte(arg_183_0)

	if var_183_0 > 128 then
		return
	end

	if var_183_0 >= var_0_12 and var_183_0 <= var_0_13 then
		return string.char(var_183_0 - 32)
	elseif var_183_0 >= var_0_14 and var_183_0 <= var_0_15 then
		return string.char(var_183_0 + 32)
	else
		return arg_183_0
	end
end

function wordVerMatch(arg_184_0, arg_184_1, arg_184_2, arg_184_3, arg_184_4, arg_184_5, arg_184_6, arg_184_7)
	if arg_184_3 > #arg_184_0 then
		return arg_184_5, arg_184_6, arg_184_7
	end

	local var_184_0 = arg_184_0[arg_184_3]
	local var_184_1 = arg_184_1[var_184_0]

	if var_184_1 then
		local var_184_2, var_184_3, var_184_4 = wordVerMatch(arg_184_0, var_184_1, arg_184_2, arg_184_3 + 1, arg_184_2.isReplace and arg_184_4 .. arg_184_2.replaceWord or arg_184_4, var_184_1.this or arg_184_5, var_184_1.this and arg_184_3 + 1 or arg_184_6, var_184_1.this and (arg_184_2.isReplace and arg_184_4 .. arg_184_2.replaceWord or arg_184_4) or arg_184_7)

		if var_184_2 then
			return var_184_2, var_184_3, var_184_4
		end
	end

	local var_184_5 = var_0_16(var_184_0)
	local var_184_6 = arg_184_1[var_184_5]

	if var_184_5 ~= var_184_0 and var_184_6 then
		local var_184_7, var_184_8, var_184_9 = wordVerMatch(arg_184_0, var_184_6, arg_184_2, arg_184_3 + 1, arg_184_2.isReplace and arg_184_4 .. arg_184_2.replaceWord or arg_184_4, var_184_6.this or arg_184_5, var_184_6.this and arg_184_3 + 1 or arg_184_6, var_184_6.this and (arg_184_2.isReplace and arg_184_4 .. arg_184_2.replaceWord or arg_184_4) or arg_184_7)

		if var_184_7 then
			return var_184_7, var_184_8, var_184_9
		end
	end

	return arg_184_5, arg_184_6, arg_184_7
end

function wordSplit(arg_185_0)
	local var_185_0 = {}

	for iter_185_0 in arg_185_0.gmatch(arg_185_0, "[\x01-\x7F�-�][�-�]*") do
		var_185_0[#var_185_0 + 1] = iter_185_0
	end

	return var_185_0
end

function contentWrap(arg_186_0, arg_186_1, arg_186_2)
	local var_186_0 = LuaHelper.WrapContent(arg_186_0, arg_186_1, arg_186_2)

	return #var_186_0 ~= #arg_186_0, var_186_0
end

function cancelRich(arg_187_0)
	local var_187_0

	for iter_187_0 = 1, 20 do
		local var_187_1

		arg_187_0, var_187_1 = string.gsub(arg_187_0, "<([^>]*)>", "%1")

		if var_187_1 <= 0 then
			break
		end
	end

	return arg_187_0
end

function cancelColorRich(arg_188_0)
	local var_188_0

	for iter_188_0 = 1, 20 do
		local var_188_1

		arg_188_0, var_188_1 = string.gsub(arg_188_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_188_1 <= 0 then
			break
		end
	end

	return arg_188_0
end

function getSkillConfig(arg_189_0)
	local var_189_0 = pg.buffCfg["buff_" .. arg_189_0]

	if not var_189_0 then
		return
	end

	local var_189_1 = Clone(var_189_0)

	var_189_1.name = getSkillName(arg_189_0)
	var_189_1.desc = HXSet.hxLan(var_189_1.desc)
	var_189_1.desc_get = HXSet.hxLan(var_189_1.desc_get)

	_.each(var_189_1, function(arg_190_0)
		arg_190_0.desc = HXSet.hxLan(arg_190_0.desc)
	end)

	return var_189_1
end

function getSkillName(arg_191_0)
	local var_191_0 = pg.skill_data_template[arg_191_0] or pg.skill_data_display[arg_191_0]

	if var_191_0 then
		return HXSet.hxLan(var_191_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_192_0, arg_192_1)
	local var_192_0 = arg_192_1 and pg.skill_world_display[arg_192_0] and setmetatable({}, {
		__index = function(arg_193_0, arg_193_1)
			return pg.skill_world_display[arg_192_0][arg_193_1] or pg.skill_data_template[arg_192_0][arg_193_1]
		end
	}) or pg.skill_data_template[arg_192_0]

	if not var_192_0 then
		return ""
	end

	local var_192_1 = var_192_0.desc_get ~= "" and var_192_0.desc_get or var_192_0.desc

	for iter_192_0, iter_192_1 in pairs(var_192_0.desc_get_add) do
		local var_192_2 = setColorStr(iter_192_1[1], COLOR_GREEN)

		if iter_192_1[2] then
			var_192_2 = var_192_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_192_1[2], COLOR_GREEN))
		end

		var_192_1 = specialGSub(var_192_1, "$" .. iter_192_0, var_192_2)
	end

	return HXSet.hxLan(var_192_1)
end

function getSkillDescLearn(arg_194_0, arg_194_1, arg_194_2)
	local var_194_0 = arg_194_2 and pg.skill_world_display[arg_194_0] and setmetatable({}, {
		__index = function(arg_195_0, arg_195_1)
			return pg.skill_world_display[arg_194_0][arg_195_1] or pg.skill_data_template[arg_194_0][arg_195_1]
		end
	}) or pg.skill_data_template[arg_194_0]

	if not var_194_0 then
		return ""
	end

	local var_194_1 = var_194_0.desc

	if not var_194_0.desc_add then
		return HXSet.hxLan(var_194_1)
	end

	for iter_194_0, iter_194_1 in pairs(var_194_0.desc_add) do
		local var_194_2 = iter_194_1[arg_194_1][1]

		if iter_194_1[arg_194_1][2] then
			var_194_2 = var_194_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_194_1[arg_194_1][2])
		end

		var_194_1 = specialGSub(var_194_1, "$" .. iter_194_0, setColorStr(var_194_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_194_1)
end

function getSkillDesc(arg_196_0, arg_196_1, arg_196_2)
	local var_196_0 = arg_196_2 and pg.skill_world_display[arg_196_0] and setmetatable({}, {
		__index = function(arg_197_0, arg_197_1)
			return pg.skill_world_display[arg_196_0][arg_197_1] or pg.skill_data_template[arg_196_0][arg_197_1]
		end
	}) or pg.skill_data_template[arg_196_0]

	if not var_196_0 then
		return ""
	end

	local var_196_1 = var_196_0.desc

	if not var_196_0.desc_add then
		return HXSet.hxLan(var_196_1)
	end

	for iter_196_0, iter_196_1 in pairs(var_196_0.desc_add) do
		local var_196_2 = setColorStr(iter_196_1[arg_196_1][1], COLOR_GREEN)

		var_196_1 = specialGSub(var_196_1, "$" .. iter_196_0, var_196_2)
	end

	return HXSet.hxLan(var_196_1)
end

function specialGSub(arg_198_0, arg_198_1, arg_198_2)
	arg_198_0 = string.gsub(arg_198_0, "<color=#", "<color=NNN")
	arg_198_0 = string.gsub(arg_198_0, "#", "")
	arg_198_2 = string.gsub(arg_198_2, "%%", "%%%%")
	arg_198_0 = string.gsub(arg_198_0, arg_198_1, arg_198_2)
	arg_198_0 = string.gsub(arg_198_0, "<color=NNN", "<color=#")

	return arg_198_0
end

function topAnimation(arg_199_0, arg_199_1, arg_199_2, arg_199_3, arg_199_4, arg_199_5)
	local var_199_0 = {}

	arg_199_4 = arg_199_4 or 0.27

	local var_199_1 = 0.05

	if arg_199_0 then
		local var_199_2 = arg_199_0.transform.localPosition.x

		setAnchoredPosition(arg_199_0, {
			x = var_199_2 - 500
		})
		shiftPanel(arg_199_0, var_199_2, nil, 0.05, arg_199_4, true, true)
		setActive(arg_199_0, true)
	end

	setActive(arg_199_1, false)
	setActive(arg_199_2, false)
	setActive(arg_199_3, false)

	for iter_199_0 = 1, 3 do
		table.insert(var_199_0, LeanTween.delayedCall(arg_199_4 + 0.13 + var_199_1 * iter_199_0, System.Action(function()
			if arg_199_1 then
				setActive(arg_199_1, not arg_199_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_199_0, LeanTween.delayedCall(arg_199_4 + 0.02 + var_199_1 * iter_199_0, System.Action(function()
			if arg_199_2 then
				setActive(arg_199_2, not go(arg_199_2).activeSelf)
			end

			if arg_199_2 then
				setActive(arg_199_3, not go(arg_199_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_199_5 then
		table.insert(var_199_0, LeanTween.delayedCall(arg_199_4 + 0.13 + var_199_1 * 3 + 0.1, System.Action(function()
			arg_199_5()
		end)).uniqueId)
	end

	return var_199_0
end

function cancelTweens(arg_203_0)
	assert(arg_203_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_203_0, iter_203_1 in ipairs(arg_203_0) do
		if iter_203_1 then
			LeanTween.cancel(iter_203_1)
		end
	end
end

function getOfflineTimeStamp(arg_204_0)
	local var_204_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_204_0
	local var_204_1 = ""

	if var_204_0 <= 59 then
		var_204_1 = i18n("just_now")
	elseif var_204_0 <= 3599 then
		var_204_1 = i18n("several_minutes_before", math.floor(var_204_0 / 60))
	elseif var_204_0 <= 86399 then
		var_204_1 = i18n("several_hours_before", math.floor(var_204_0 / 3600))
	else
		var_204_1 = i18n("several_days_before", math.floor(var_204_0 / 86400))
	end

	return var_204_1
end

function playMovie(arg_205_0, arg_205_1, arg_205_2)
	local var_205_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_205_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_205_0, function(arg_206_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_206_0 = GCHandle.Alloc(arg_206_0, GCHandleType.Pinned)

			setActive(var_205_0, true)

			local var_206_1 = var_205_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_206_1.player:SetData(arg_206_0, arg_206_0.Length)

			var_206_1.target = var_205_0:GetComponent(typeof(Image))
			var_206_1.loop = false
			var_206_1.additiveMode = false
			var_206_1.playOnStart = true

			local var_206_2

			var_206_2 = Timer.New(function()
				if var_206_1.player.status == CriMana.Player.Status.PlayEnd or var_206_1.player.status == CriMana.Player.Status.Stop or var_206_1.player.status == CriMana.Player.Status.Error then
					var_206_2:Stop()
					Object.Destroy(var_206_1)
					GCHandle.Free(var_206_0)
					setActive(var_205_0, false)

					if arg_205_1 then
						arg_205_1()
					end
				end
			end, 0.2, -1)

			var_206_2:Start()
			removeOnButton(var_205_0)

			if arg_205_2 then
				onButton(nil, var_205_0, function()
					var_206_1:Stop()
					GetOrAddComponent(var_205_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_205_1 then
		arg_205_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_209_0)
	if PaintCameraAdjustOn ~= arg_209_0 then
		local var_209_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_209_0 then
			var_209_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_209_0.matchWidthOrHeight = 1
		else
			var_209_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		pg.CameraFixMgr.GetInstance():BlockCameraRatioControll(arg_209_0)

		PaintCameraAdjustOn = arg_209_0
	end
end

function ManhattonDist(arg_210_0, arg_210_1)
	return math.abs(arg_210_0.row - arg_210_1.row) + math.abs(arg_210_0.column - arg_210_1.column)
end

function checkFirstHelpShow(arg_211_0)
	local var_211_0 = getProxy(SettingsProxy)

	if not var_211_0:checkReadHelp(arg_211_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_211_0].tip
		})
		var_211_0:recordReadHelp(arg_211_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_212_0)
	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_213_0)
	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_213_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_215_0, arg_215_1)
	if arg_215_0 == nil then
		return
	end

	arg_215_0:GetComponent("NotchAdapt").enabled = arg_215_1
end

function comma_value(arg_216_0)
	local var_216_0 = arg_216_0
	local var_216_1 = 0

	repeat
		local var_216_2

		var_216_0, var_216_2 = string.gsub(var_216_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_216_2 == 0

	return var_216_0
end

local var_0_17 = 0.2

function SwitchPanel(arg_217_0, arg_217_1, arg_217_2, arg_217_3, arg_217_4, arg_217_5)
	arg_217_3 = defaultValue(arg_217_3, var_0_17)

	if arg_217_5 then
		LeanTween.cancel(go(arg_217_0))
	end

	local var_217_0 = Vector3.New(tf(arg_217_0).localPosition.x, tf(arg_217_0).localPosition.y, tf(arg_217_0).localPosition.z)

	if arg_217_1 then
		var_217_0.x = arg_217_1
	end

	if arg_217_2 then
		var_217_0.y = arg_217_2
	end

	local var_217_1 = LeanTween.move(rtf(arg_217_0), var_217_0, arg_217_3):setEase(LeanTweenType.easeInOutSine)

	if arg_217_4 then
		var_217_1:setDelay(arg_217_4)
	end

	return var_217_1
end

function updateActivityTaskStatus(arg_218_0)
	local var_218_0 = arg_218_0:getConfig("config_id")
	local var_218_1, var_218_2 = getActivityTask(arg_218_0, true)

	if not var_218_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_218_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_219_0)
	local var_219_0 = getProxy(TaskProxy)
	local var_219_1 = arg_219_0:getNDay()
	local var_219_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_219_0:getStartTime())

	for iter_219_0, iter_219_1 in ipairs(arg_219_0:getConfig("config_data")) do
		local var_219_3 = pg.battlepass_task_group[iter_219_1]

		if var_219_3 and var_219_2 >= var_219_3.group_mask then
			if underscore.any(underscore.flatten(var_219_3.task_group), function(arg_220_0)
				return var_219_0:getTaskVO(arg_220_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD, {
					cmd = 1,
					activity_id = arg_219_0.id
				})

				return true
			end
		elseif not var_219_3 then
			warning("battlepass_task_group表中不存在 id = " .. iter_219_1)
		end
	end

	return false
end

function setShipCardFrame(arg_221_0, arg_221_1, arg_221_2)
	arg_221_0.localScale = Vector3.one
	arg_221_0.anchorMin = Vector2.zero
	arg_221_0.anchorMax = Vector2.one

	local var_221_0 = arg_221_2 or arg_221_1

	GetImageSpriteFromAtlasAsync("shipframe", var_221_0, arg_221_0)

	local var_221_1 = pg.frame_resource[var_221_0]

	if var_221_1 then
		local var_221_2 = var_221_1.param

		arg_221_0.offsetMin = Vector2(var_221_2[1], var_221_2[2])
		arg_221_0.offsetMax = Vector2(var_221_2[3], var_221_2[4])
	else
		arg_221_0.offsetMin = Vector2.zero
		arg_221_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_222_0, arg_222_1, arg_222_2)
	arg_222_0.localScale = Vector3.one
	arg_222_0.anchorMin = Vector2.zero
	arg_222_0.anchorMax = Vector2.one

	setImageSprite(arg_222_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_222_2 or arg_222_1)))

	local var_222_0 = "b" .. (arg_222_2 or arg_222_1)
	local var_222_1 = pg.frame_resource[var_222_0]

	if var_222_1 then
		local var_222_2 = var_222_1.param

		arg_222_0.offsetMin = Vector2(var_222_2[1], var_222_2[2])
		arg_222_0.offsetMax = Vector2(var_222_2[3], var_222_2[4])
	else
		arg_222_0.offsetMin = Vector2.zero
		arg_222_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_223_0, arg_223_1)
	if arg_223_1 then
		local var_223_0 = arg_223_1 .. "(Clone)"
		local var_223_1 = false

		eachChild(arg_223_0, function(arg_224_0)
			setActive(arg_224_0, arg_224_0.name == var_223_0)

			var_223_1 = var_223_1 or arg_224_0.name == var_223_0
		end)

		if not var_223_1 then
			LoadAndInstantiateAsync("effect", arg_223_1, function(arg_225_0)
				if IsNil(arg_223_0) or findTF(arg_223_0, var_223_0) then
					Object.Destroy(arg_225_0)
				else
					setParent(arg_225_0, arg_223_0)
					setActive(arg_225_0, true)
				end
			end)
		end
	end

	setActive(arg_223_0, arg_223_1)
end

function setProposeMarkIcon(arg_226_0, arg_226_1)
	local var_226_0 = arg_226_0:Find("proposeShipCard(Clone)")
	local var_226_1 = arg_226_1.propose and not arg_226_1:ShowPropose()

	if var_226_0 then
		setActive(var_226_0, var_226_1)
	elseif var_226_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_227_0)
			if IsNil(arg_226_0) or arg_226_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_227_0)
			else
				setParent(arg_227_0, arg_226_0, false)
			end
		end)
	end
end

function flushShipCard(arg_228_0, arg_228_1)
	local var_228_0 = arg_228_1:rarity2bgPrint()
	local var_228_1 = findTF(arg_228_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_228_0, "", var_228_1)

	local var_228_2 = findTF(arg_228_0, "content/ship_icon")
	local var_228_3 = arg_228_1 and {
		"shipYardIcon/" .. arg_228_1:getPainting(),
		arg_228_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_228_3[1], var_228_3[2], var_228_2)

	local var_228_4 = arg_228_1:getShipType()
	local var_228_5 = findTF(arg_228_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_228_4), var_228_5)
	setText(findTF(arg_228_0, "content/dockyard/lv/Text"), defaultValue(arg_228_1.level, 1))

	local var_228_6 = arg_228_1:getStar()
	local var_228_7 = arg_228_1:getMaxStar()
	local var_228_8 = findTF(arg_228_0, "content/front/stars")

	setActive(var_228_8, true)

	local var_228_9 = findTF(var_228_8, "star_tpl")
	local var_228_10 = var_228_8.childCount

	for iter_228_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_228_11 = var_228_10 < iter_228_0 and cloneTplTo(var_228_9, var_228_8) or var_228_8:GetChild(iter_228_0 - 1)

		setActive(var_228_11, iter_228_0 <= var_228_7)
		triggerToggle(var_228_11, iter_228_0 <= var_228_6)
	end

	local var_228_12 = findTF(arg_228_0, "content/front/frame")
	local var_228_13, var_228_14 = arg_228_1:GetFrameAndEffect()

	setShipCardFrame(var_228_12, var_228_0, var_228_13)
	setFrameEffect(findTF(arg_228_0, "content/front/bg_other"), var_228_14)
	setProposeMarkIcon(arg_228_0:Find("content/dockyard/propose"), arg_228_1)
end

function TweenItemAlphaAndWhite(arg_229_0)
	LeanTween.cancel(arg_229_0)

	local var_229_0 = GetOrAddComponent(arg_229_0, "CanvasGroup")

	var_229_0.alpha = 0

	LeanTween.alphaCanvas(var_229_0, 1, 0.2):setUseEstimatedTime(true)

	local var_229_1 = findTF(arg_229_0.transform, "white_mask")

	if var_229_1 then
		setActive(var_229_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_230_0)
	LeanTween.cancel(arg_230_0)

	GetOrAddComponent(arg_230_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_231_0)
	local var_231_0 = {}
	local var_231_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_231_2 = getProxy(CollectionProxy):getShipGroup(arg_231_0)

	if var_231_2 then
		local var_231_3 = ShipGroup.getSkinList(arg_231_0)

		for iter_231_0, iter_231_1 in ipairs(var_231_3) do
			if iter_231_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_231_1, iter_231_1.id) or iter_231_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_231_2.trans or iter_231_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_231_2.married == 1 then
				var_231_0[iter_231_1.id] = true
			end
		end
	end

	return var_231_0
end

function split(arg_232_0, arg_232_1)
	local var_232_0 = {}

	if not arg_232_0 then
		return nil
	end

	local var_232_1 = #arg_232_0
	local var_232_2 = 1

	while var_232_2 <= var_232_1 do
		local var_232_3 = string.find(arg_232_0, arg_232_1, var_232_2)

		if var_232_3 == nil then
			table.insert(var_232_0, string.sub(arg_232_0, var_232_2, var_232_1))

			break
		end

		table.insert(var_232_0, string.sub(arg_232_0, var_232_2, var_232_3 - 1))

		if var_232_3 == var_232_1 then
			table.insert(var_232_0, "")

			break
		end

		var_232_2 = var_232_3 + 1
	end

	return var_232_0
end

function NumberToChinese(arg_233_0, arg_233_1)
	local var_233_0 = ""
	local var_233_1 = #arg_233_0

	for iter_233_0 = 1, var_233_1 do
		local var_233_2 = string.sub(arg_233_0, iter_233_0, iter_233_0)

		if var_233_2 ~= "0" or var_233_2 == "0" and not arg_233_1 then
			if arg_233_1 then
				if var_233_1 >= 2 then
					if iter_233_0 == 1 then
						if var_233_2 == "1" then
							var_233_0 = i18n("number_" .. 10)
						else
							var_233_0 = i18n("number_" .. var_233_2) .. i18n("number_" .. 10)
						end
					else
						var_233_0 = var_233_0 .. i18n("number_" .. var_233_2)
					end
				else
					var_233_0 = var_233_0 .. i18n("number_" .. var_233_2)
				end
			else
				var_233_0 = var_233_0 .. i18n("number_" .. var_233_2)
			end
		end
	end

	return var_233_0
end

function getActivityTask(arg_234_0, arg_234_1)
	local var_234_0 = getProxy(TaskProxy)
	local var_234_1 = arg_234_0:getConfig("config_data")
	local var_234_2 = arg_234_0:getNDay(arg_234_0.data1)
	local var_234_3
	local var_234_4
	local var_234_5

	for iter_234_0 = math.max(arg_234_0.data3, 1), math.min(var_234_2, #var_234_1) do
		local var_234_6 = _.flatten({
			var_234_1[iter_234_0]
		})

		for iter_234_1, iter_234_2 in ipairs(var_234_6) do
			local var_234_7 = var_234_0:getTaskById(iter_234_2)

			if var_234_7 then
				return var_234_7.id, var_234_7
			end

			if var_234_4 then
				var_234_5 = var_234_0:getFinishTaskById(iter_234_2)

				if var_234_5 then
					var_234_4 = var_234_5
				elseif arg_234_1 then
					return iter_234_2
				else
					return var_234_4.id, var_234_4
				end
			else
				var_234_4 = var_234_0:getFinishTaskById(iter_234_2)
				var_234_5 = var_234_5 or iter_234_2
			end
		end
	end

	if var_234_4 then
		return var_234_4.id, var_234_4
	else
		return var_234_5
	end
end

function setImageFromImage(arg_235_0, arg_235_1, arg_235_2)
	local var_235_0 = GetComponent(arg_235_0, "Image")

	var_235_0.sprite = GetComponent(arg_235_1, "Image").sprite

	if arg_235_2 then
		var_235_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_236_0)
	local var_236_0, var_236_1, var_236_2, var_236_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_236_0)

	if var_236_0 >= 1 then
		return i18n("limit_skin_time_day", var_236_0)
	elseif var_236_0 <= 0 and var_236_1 > 0 then
		return i18n("limit_skin_time_day_min", var_236_1, var_236_2)
	elseif var_236_0 <= 0 and var_236_1 <= 0 and (var_236_2 > 0 or var_236_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_236_2, 1))
	elseif var_236_0 <= 0 and var_236_1 <= 0 and var_236_2 <= 0 and var_236_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_237_0)
	local var_237_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_237_1 = math.max(arg_237_0 - var_237_0, 0)
	local var_237_2 = math.floor(var_237_1 / 86400)

	if var_237_2 > 0 then
		return i18n("time_remaining_tip") .. var_237_2 .. i18n("word_date")
	else
		local var_237_3 = math.floor(var_237_1 / 3600)

		if var_237_3 > 0 then
			return i18n("time_remaining_tip") .. var_237_3 .. i18n("word_hour")
		else
			local var_237_4 = math.floor(var_237_1 / 60)

			if var_237_4 > 0 then
				return i18n("time_remaining_tip") .. var_237_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_237_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_238_0)
	local var_238_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_238_0
	local var_238_1 = var_238_0 / 86400

	if var_238_1 > 1 then
		return i18n("ins_word_day", math.floor(var_238_1))
	else
		local var_238_2 = var_238_0 / 3600

		if var_238_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_238_2))
		else
			local var_238_3 = var_238_0 / 60

			if var_238_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_238_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_239_0)
	local var_239_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_239_0
	local var_239_1 = var_239_0 / 86400

	if var_239_1 > 1 then
		return i18n1(math.floor(var_239_1) .. "d")
	else
		local var_239_2 = var_239_0 / 3600

		if var_239_2 > 1 then
			return i18n1(math.floor(var_239_2) .. "h")
		else
			local var_239_3 = var_239_0 / 60

			if var_239_3 > 1 then
				return i18n1(math.floor(var_239_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_240_0)
	local var_240_0, var_240_1, var_240_2, var_240_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_240_0)

	if var_240_0 <= 0 and var_240_1 <= 0 and var_240_2 <= 0 and var_240_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_240_0, var_240_1, var_240_2)
	end
end

function checkExist(arg_241_0, ...)
	local var_241_0 = {
		...
	}

	for iter_241_0, iter_241_1 in ipairs(var_241_0) do
		if arg_241_0 == nil then
			break
		end

		assert(type(arg_241_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_241_1) == "table", "type error : param should be table")

		if type(arg_241_0[iter_241_1[1]]) == "function" then
			arg_241_0 = arg_241_0[iter_241_1[1]](arg_241_0, unpack(iter_241_1[2] or {}))
		else
			arg_241_0 = arg_241_0[iter_241_1[1]]
		end
	end

	return arg_241_0
end

function AcessWithinNull(arg_242_0, arg_242_1)
	if arg_242_0 == nil then
		return
	end

	assert(type(arg_242_0) == "table")

	return arg_242_0[arg_242_1]
end

function showRepairMsgbox()
	local var_243_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_243_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_243_2 = {
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
			var_243_2,
			var_243_1,
			var_243_0
		}
	})
end

function resourceVerify(arg_247_0, arg_247_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_247_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_247_1
	local var_247_2 = PathMgr.ReadAllLines(var_247_0)
	local var_247_3 = {}

	if arg_247_0 then
		setActive(arg_247_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_247_4()
		if arg_247_0 then
			setActive(arg_247_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_247_1)

		if var_247_1 then
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

	local var_247_5 = var_247_2.Length
	local var_247_6

	local function var_247_7(arg_250_0)
		if arg_250_0 < 0 then
			var_247_4()

			return
		end

		if arg_247_1 then
			setSlider(arg_247_1, 0, var_247_5, var_247_5 - arg_250_0)
		end

		local var_250_0 = string.split(var_247_2[arg_250_0], ",")
		local var_250_1 = var_250_0[1]
		local var_250_2 = var_250_0[3]
		local var_250_3 = PathMgr.getAssetBundle(var_250_1)

		if PathMgr.FileExists(var_250_3) then
			local var_250_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_250_1))

			if var_250_2 == HashUtil.CalcMD5(var_250_4) then
				onNextTick(function()
					var_247_7(arg_250_0 - 1)
				end)

				return
			end
		end

		var_247_1 = var_250_1

		var_247_4()
	end

	var_247_7(var_247_5 - 1)
end

function splitByWordEN(arg_252_0, arg_252_1)
	local var_252_0 = string.split(arg_252_0, " ")
	local var_252_1 = ""
	local var_252_2 = ""
	local var_252_3 = arg_252_1:GetComponent(typeof(RectTransform))
	local var_252_4 = arg_252_1:GetComponent(typeof(Text))
	local var_252_5 = var_252_3.rect.width

	for iter_252_0, iter_252_1 in ipairs(var_252_0) do
		local var_252_6 = var_252_2

		var_252_2 = var_252_2 == "" and iter_252_1 or var_252_2 .. " " .. iter_252_1

		setText(arg_252_1, var_252_2)

		if var_252_5 < var_252_4.preferredWidth then
			var_252_1 = var_252_1 == "" and var_252_6 or var_252_1 .. "\n" .. var_252_6
			var_252_2 = iter_252_1
		end

		if iter_252_0 >= #var_252_0 then
			var_252_1 = var_252_1 == "" and var_252_2 or var_252_1 .. "\n" .. var_252_2
		end
	end

	return var_252_1
end

function checkBirthFormat(arg_253_0)
	if #arg_253_0 ~= 8 then
		return false
	end

	local var_253_0 = 0
	local var_253_1 = #arg_253_0

	while var_253_0 < var_253_1 do
		local var_253_2 = string.byte(arg_253_0, var_253_0 + 1)

		if var_253_2 < 48 or var_253_2 > 57 then
			return false
		end

		var_253_0 = var_253_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_254_0)
	local var_254_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_254_0, function(arg_255_0)
		return arg_255_0 == arg_254_0
	end)
end

function GetServerState(arg_256_0)
	local var_256_0 = -1
	local var_256_1 = 0
	local var_256_2 = 1
	local var_256_3 = 2
	local var_256_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_256_4 = string.gsub(var_256_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_256_4, function(arg_257_0, arg_257_1)
		local var_257_0 = true
		local var_257_1 = false

		for iter_257_0 in string.gmatch(arg_257_1, "\"state\":%d") do
			if iter_257_0 ~= "\"state\":1" then
				var_257_0 = false
			end

			var_257_1 = true
		end

		if not var_257_1 then
			var_257_0 = false
		end

		if arg_256_0 ~= nil then
			arg_256_0(var_257_0 and var_256_2 or var_256_1)
		end
	end)
end

function setScrollText(arg_258_0, arg_258_1)
	GetOrAddComponent(arg_258_0, "ScrollText"):SetText(arg_258_1)
end

function changeToScrollText(arg_259_0, arg_259_1)
	local var_259_0 = GetComponent(arg_259_0, typeof(Text))

	assert(var_259_0, "without component<Text>")

	local var_259_1 = arg_259_0:Find("subText")

	if not var_259_1 then
		var_259_1 = cloneTplTo(arg_259_0, arg_259_0, "subText")

		eachChild(arg_259_0, function(arg_260_0)
			setActive(arg_260_0, arg_260_0 == var_259_1)
		end)

		arg_259_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_259_1, arg_259_1)
end

function setScrollTextWithSize(arg_261_0, arg_261_1, arg_261_2, arg_261_3)
	local var_261_0 = arg_261_3 < GetPerceptualSize(arg_261_2)

	setActive(arg_261_1, var_261_0)
	setActive(arg_261_0, not var_261_0)

	if var_261_0 then
		setScrollText(arg_261_1, arg_261_2)
	else
		setText(arg_261_0, arg_261_2)
	end
end

local var_0_18
local var_0_19
local var_0_20
local var_0_21

local function var_0_22(arg_262_0, arg_262_1, arg_262_2)
	local var_262_0 = arg_262_0:Find("base")
	local var_262_1, var_262_2, var_262_3 = Equipment.GetInfoTrans(arg_262_1, arg_262_2)

	if arg_262_1.nextValue then
		local var_262_4 = {
			name = arg_262_1.name,
			type = arg_262_1.type,
			value = arg_262_1.nextValue
		}
		local var_262_5, var_262_6 = Equipment.GetInfoTrans(var_262_4, arg_262_2)

		var_262_2 = var_262_2 .. setColorStr("   >   " .. var_262_6, COLOR_GREEN)
	end

	setText(var_262_0:Find("name"), var_262_1)

	if var_262_3 then
		local var_262_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_262_0:Find("value"), var_262_2 .. var_262_7)
	else
		setText(var_262_0:Find("value"), var_262_2)
	end

	setActive(var_262_0:Find("value/up"), arg_262_1.compare and arg_262_1.compare > 0)
	setActive(var_262_0:Find("value/down"), arg_262_1.compare and arg_262_1.compare < 0)
	triggerToggle(var_262_0, arg_262_1.lock_open)

	if not arg_262_1.lock_open and arg_262_1.sub and #arg_262_1.sub > 0 then
		GetComponent(var_262_0, typeof(Toggle)).enabled = true
	else
		setActive(var_262_0:Find("name/close"), false)
		setActive(var_262_0:Find("name/open"), false)

		GetComponent(var_262_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_23(arg_263_0, arg_263_1, arg_263_2, arg_263_3)
	var_0_22(arg_263_0, arg_263_2, arg_263_3)

	if not arg_263_2.sub or #arg_263_2.sub == 0 then
		return
	end

	var_0_20(arg_263_0:Find("subs"), arg_263_1, arg_263_2.sub, arg_263_3)
end

function var_0_20(arg_264_0, arg_264_1, arg_264_2, arg_264_3)
	removeAllChildren(arg_264_0)
	var_0_21(arg_264_0, arg_264_1, arg_264_2, arg_264_3)
end

function var_0_21(arg_265_0, arg_265_1, arg_265_2, arg_265_3)
	for iter_265_0, iter_265_1 in ipairs(arg_265_2) do
		local var_265_0 = cloneTplTo(arg_265_1, arg_265_0)

		var_0_23(var_265_0, arg_265_1, iter_265_1, arg_265_3)
	end
end

function updateEquipInfo(arg_266_0, arg_266_1, arg_266_2, arg_266_3)
	local var_266_0 = arg_266_0:Find("attr_tpl")

	var_0_20(arg_266_0:Find("attrs"), var_266_0, arg_266_1.attrs, arg_266_3)
	setActive(arg_266_0:Find("skill"), arg_266_2)

	if arg_266_2 then
		var_0_23(arg_266_0:Find("skill/attr"), var_266_0, {
			name = i18n("skill"),
			value = setColorStr(arg_266_2.name, "#FFDE00FF")
		}, arg_266_3)
		setText(arg_266_0:Find("skill/value/Text"), getSkillDescGet(arg_266_2.id))
	end

	setActive(arg_266_0:Find("weapon"), #arg_266_1.weapon.sub > 0)

	if #arg_266_1.weapon.sub > 0 then
		var_0_20(arg_266_0:Find("weapon"), var_266_0, {
			arg_266_1.weapon
		}, arg_266_3)
	end

	setActive(arg_266_0:Find("equip_info"), #arg_266_1.equipInfo.sub > 0)

	if #arg_266_1.equipInfo.sub > 0 then
		var_0_20(arg_266_0:Find("equip_info"), var_266_0, {
			arg_266_1.equipInfo
		}, arg_266_3)
	end

	var_0_23(arg_266_0:Find("part/attr"), var_266_0, {
		name = i18n("equip_info_23")
	}, arg_266_3)

	local var_266_1 = arg_266_0:Find("part/value")
	local var_266_2 = var_266_1:Find("label")
	local var_266_3 = {}
	local var_266_4 = {}

	if #arg_266_1.part[1] == 0 and #arg_266_1.part[2] == 0 then
		setmetatable(var_266_3, {
			__index = function(arg_267_0, arg_267_1)
				return true
			end
		})
		setmetatable(var_266_4, {
			__index = function(arg_268_0, arg_268_1)
				return true
			end
		})
	else
		for iter_266_0, iter_266_1 in ipairs(arg_266_1.part[1]) do
			var_266_3[iter_266_1] = true
		end

		for iter_266_2, iter_266_3 in ipairs(arg_266_1.part[2]) do
			var_266_4[iter_266_3] = true
		end
	end

	local var_266_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_266_3, var_266_4)

	UIItemList.StaticAlign(var_266_1, var_266_2, #var_266_5, function(arg_269_0, arg_269_1, arg_269_2)
		arg_269_1 = arg_269_1 + 1

		if arg_269_0 == UIItemList.EventUpdate then
			local var_269_0 = var_266_5[arg_269_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_269_0), arg_269_2)
			setActive(arg_269_2:Find("main"), var_266_3[var_269_0] and not var_266_4[var_269_0])
			setActive(arg_269_2:Find("sub"), var_266_4[var_269_0] and not var_266_3[var_269_0])
			setImageAlpha(arg_269_2, not var_266_3[var_269_0] and not var_266_4[var_269_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_270_0, arg_270_1, arg_270_2)
	local var_270_0 = arg_270_0:Find("attr_tpl")

	var_0_20(arg_270_0:Find("attrs"), var_270_0, arg_270_1.attrs, arg_270_2)
	setActive(arg_270_0:Find("weapon"), #arg_270_1.weapon.sub > 0)

	if #arg_270_1.weapon.sub > 0 then
		var_0_20(arg_270_0:Find("weapon"), var_270_0, {
			arg_270_1.weapon
		}, arg_270_2)
	end

	setActive(arg_270_0:Find("equip_info"), #arg_270_1.equipInfo.sub > 0)

	if #arg_270_1.equipInfo.sub > 0 then
		var_0_20(arg_270_0:Find("equip_info"), var_270_0, {
			arg_270_1.equipInfo
		}, arg_270_2)
	end
end

function setCanvasOverrideSorting(arg_271_0, arg_271_1)
	local var_271_0 = arg_271_0.parent

	arg_271_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_271_0) then
		GetOrAddComponent(arg_271_0, typeof(Canvas)).overrideSorting = arg_271_1
	else
		setActive(arg_271_0, true)

		GetOrAddComponent(arg_271_0, typeof(Canvas)).overrideSorting = arg_271_1

		setActive(arg_271_0, false)
	end

	arg_271_0:SetParent(var_271_0, false)
end

function createNewGameObject(arg_272_0, arg_272_1)
	local var_272_0 = GameObject.New()

	if arg_272_0 then
		var_272_0.name = "model"
	end

	var_272_0.layer = arg_272_1 or Layer.UI

	return GetOrAddComponent(var_272_0, "RectTransform")
end

function CreateShell(arg_273_0)
	if type(arg_273_0) ~= "table" and type(arg_273_0) ~= "userdata" then
		return arg_273_0
	end

	local var_273_0 = setmetatable({
		__index = arg_273_0
	}, arg_273_0)

	return setmetatable({}, var_273_0)
end

function CameraFittingSettin(arg_274_0)
	local var_274_0 = GetComponent(arg_274_0, typeof(Camera))
	local var_274_1 = 1.7777777777777777
	local var_274_2 = Screen.width / Screen.height

	if var_274_2 < var_274_1 then
		local var_274_3 = var_274_2 / var_274_1

		var_274_0.rect = var_0_0.Rect.New(0, (1 - var_274_3) / 2, 1, var_274_3)
	end
end

function SwitchSpecialChar(arg_275_0, arg_275_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_275_0 = arg_275_0:gsub(" ", " ")
		arg_275_0 = arg_275_0:gsub("\t", "    ")
	end

	if not arg_275_1 then
		arg_275_0 = arg_275_0:gsub("\n", " ")
	end

	return arg_275_0
end

function AfterCheck(arg_276_0, arg_276_1)
	local var_276_0 = {}

	for iter_276_0, iter_276_1 in ipairs(arg_276_0) do
		var_276_0[iter_276_0] = iter_276_1[1]()
	end

	arg_276_1()

	for iter_276_2, iter_276_3 in ipairs(arg_276_0) do
		if var_276_0[iter_276_2] ~= iter_276_3[1]() then
			iter_276_3[2]()
		end

		var_276_0[iter_276_2] = iter_276_3[1]()
	end
end

function CompareFuncs(arg_277_0, arg_277_1)
	local var_277_0 = {}

	local function var_277_1(arg_278_0, arg_278_1)
		var_277_0[arg_278_0] = var_277_0[arg_278_0] or {}
		var_277_0[arg_278_0][arg_278_1] = var_277_0[arg_278_0][arg_278_1] or arg_277_0[arg_278_0](arg_278_1)

		return var_277_0[arg_278_0][arg_278_1]
	end

	return function(arg_279_0, arg_279_1)
		local var_279_0 = 1

		while var_279_0 <= #arg_277_0 do
			local var_279_1 = var_277_1(var_279_0, arg_279_0)
			local var_279_2 = var_277_1(var_279_0, arg_279_1)

			if var_279_1 == var_279_2 then
				var_279_0 = var_279_0 + 1
			else
				return var_279_1 < var_279_2
			end
		end

		return tobool(arg_277_1)
	end
end

function DropResultIntegration(arg_280_0)
	local var_280_0 = {}
	local var_280_1 = 1

	while var_280_1 <= #arg_280_0 do
		local var_280_2 = arg_280_0[var_280_1].type
		local var_280_3 = arg_280_0[var_280_1].id

		var_280_0[var_280_2] = var_280_0[var_280_2] or {}

		if var_280_0[var_280_2][var_280_3] then
			local var_280_4 = arg_280_0[var_280_0[var_280_2][var_280_3]]
			local var_280_5 = table.remove(arg_280_0, var_280_1)

			var_280_4.count = var_280_4.count + var_280_5.count
		else
			var_280_0[var_280_2][var_280_3] = var_280_1
			var_280_1 = var_280_1 + 1
		end
	end

	local var_280_6 = {
		function(arg_281_0)
			local var_281_0 = arg_281_0.type
			local var_281_1 = arg_281_0.id

			if var_281_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_281_0 == DROP_TYPE_RESOURCE then
				if var_281_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_281_0 == DROP_TYPE_ITEM then
				if var_281_1 == 59010 then
					return 4
				elseif var_281_1 == 59900 then
					return 5
				else
					local var_281_2 = Item.getConfigData(var_281_1)
					local var_281_3 = var_281_2 and var_281_2.type or 0

					if var_281_3 == 9 then
						return 6
					elseif var_281_3 == 5 then
						return 7
					elseif var_281_3 == 4 then
						return 8
					elseif var_281_3 == 7 then
						return 9
					end
				end
			elseif var_281_0 == DROP_TYPE_VITEM and var_281_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_282_0)
			local var_282_0

			if arg_282_0.type == DROP_TYPE_SHIP then
				var_282_0 = pg.ship_data_statistics[arg_282_0.id]
			elseif arg_282_0.type == DROP_TYPE_ITEM then
				var_282_0 = Item.getConfigData(arg_282_0.id)
			end

			return (var_282_0 and var_282_0.rarity or 0) * -1
		end,
		function(arg_283_0)
			return arg_283_0.id
		end
	}

	table.sort(arg_280_0, CompareFuncs(var_280_6))
end

function getLoginConfig()
	if LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value then
		return false, "login", "", false, ""
	end

	local var_284_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_284_1 = 1

	for iter_284_0, iter_284_1 in ipairs(pg.login.all) do
		if pg.login[iter_284_1].date ~= "stop" then
			local var_284_2, var_284_3 = parseTimeConfig(pg.login[iter_284_1].date)

			assert(not var_284_3)

			if pg.TimeMgr.GetInstance():inTime(var_284_2, var_284_0) then
				var_284_1 = iter_284_1

				break
			end
		end
	end

	local var_284_4 = pg.login[var_284_1].login_static

	var_284_4 = var_284_4 ~= "" and var_284_4 or "login"

	local var_284_5 = pg.login[var_284_1].login_cri
	local var_284_6 = var_284_5 ~= "" and true or false
	local var_284_7 = pg.login[var_284_1].op_play == 1 and true or false
	local var_284_8 = pg.login[var_284_1].op_time

	if var_284_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_284_8, var_284_0) then
		var_284_7 = false
	end

	local var_284_9 = var_284_8 == "" and var_284_8 or table.concat(var_284_8[1][1])

	return var_284_6, var_284_6 and var_284_5 or var_284_4, pg.login[var_284_1].bgm, var_284_7, var_284_9
end

function setIntimacyIcon(arg_285_0, arg_285_1, arg_285_2)
	local var_285_0 = {}
	local var_285_1

	seriesAsync({
		function(arg_286_0)
			if arg_285_0.childCount > 0 then
				var_285_1 = arg_285_0:GetChild(0)

				arg_286_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_287_0)
					var_285_1 = tf(arg_287_0)

					setParent(var_285_1, arg_285_0)
					arg_286_0()
				end)
			end
		end,
		function(arg_288_0)
			setImageAlpha(var_285_1, arg_285_2 and 0 or 1)
			eachChild(var_285_1, function(arg_289_0)
				setActive(arg_289_0, false)
			end)

			if arg_285_2 then
				local var_288_0 = var_285_1:Find(arg_285_2 .. "(Clone)")

				if not var_288_0 then
					LoadAndInstantiateAsync("ui", arg_285_2, function(arg_290_0)
						setParent(arg_290_0, var_285_1)
						setActive(arg_290_0, true)
					end)
				else
					setActive(var_288_0, true)
				end
			elseif arg_285_1 then
				setImageSprite(var_285_1, GetSpriteFromAtlas("energy", arg_285_1), true)
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

function switch(arg_293_0, arg_293_1, arg_293_2, ...)
	if arg_293_1[arg_293_0] then
		return arg_293_1[arg_293_0](...)
	elseif arg_293_2 then
		return arg_293_2(...)
	end
end

function parseTimeConfig(arg_294_0)
	if type(arg_294_0[1]) == "table" then
		return arg_294_0[2], arg_294_0[1]
	else
		return arg_294_0
	end
end

local var_0_25 = {
	__add = function(arg_295_0, arg_295_1)
		return NewPos(arg_295_0.x + arg_295_1.x, arg_295_0.y + arg_295_1.y)
	end,
	__sub = function(arg_296_0, arg_296_1)
		return NewPos(arg_296_0.x - arg_296_1.x, arg_296_0.y - arg_296_1.y)
	end,
	__mul = function(arg_297_0, arg_297_1)
		if type(arg_297_1) == "number" then
			return NewPos(arg_297_0.x * arg_297_1, arg_297_0.y * arg_297_1)
		else
			return NewPos(arg_297_0.x * arg_297_1.x, arg_297_0.y * arg_297_1.y)
		end
	end,
	__eq = function(arg_298_0, arg_298_1)
		return arg_298_0.x == arg_298_1.x and arg_298_0.y == arg_298_1.y
	end,
	__tostring = function(arg_299_0)
		return arg_299_0.x .. "_" .. arg_299_0.y
	end
}

function NewPos(arg_300_0, arg_300_1)
	assert(arg_300_0 and arg_300_1)

	local var_300_0 = setmetatable({
		x = arg_300_0,
		y = arg_300_1
	}, var_0_25)

	function var_300_0.SqrMagnitude(arg_301_0)
		return arg_301_0.x * arg_301_0.x + arg_301_0.y * arg_301_0.y
	end

	function var_300_0.Normalize(arg_302_0)
		local var_302_0 = arg_302_0:SqrMagnitude()

		if var_302_0 > 1e-05 then
			return arg_302_0 * (1 / math.sqrt(var_302_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_300_0
end

local var_0_26

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_26 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_26 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_304_0)
	return (string.char(226, 133, 160 + (arg_304_0 - 1)))
end

function quickPlayAnimator(arg_305_0, arg_305_1)
	arg_305_0:GetComponent(typeof(Animator)):Play(arg_305_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_306_0, arg_306_1)
	local var_306_0 = arg_306_0:GetComponent(typeof(Animator))

	var_306_0.enabled = true

	local var_306_1 = Animator.StringToHash(arg_306_1)

	if var_306_0:HasState(0, var_306_1) then
		var_306_0:Play(arg_306_1, -1, 0)
	end
end

function quickPlayAnimation(arg_307_0, arg_307_1)
	local var_307_0 = arg_307_0:GetComponent(typeof(Animation))

	var_307_0:Stop()
	var_307_0:Play(arg_307_1)
end

function getSurveyUrl(arg_308_0)
	local var_308_0 = pg.survey_data_template[arg_308_0]
	local var_308_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_308_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_308_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_308_1 = var_308_0.main_url
				else
					var_308_1 = var_308_0.uo_url
				end
			elseif var_308_2 == PLATFORM_IPHONEPLAYER then
				var_308_1 = var_308_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_KR then
			var_308_1 = var_308_0.main_url
		end
	else
		var_308_1 = var_308_0.main_url
	end

	local var_308_3 = getProxy(PlayerProxy):getRawData().id
	local var_308_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_308_5
	local var_308_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_308_7 = getProxy(UserProxy):getRawData()
	local var_308_8 = getProxy(ServerProxy):getRawData()[var_308_7 and var_308_7.server or 0]
	local var_308_9 = var_308_8 and var_308_8.id or ""
	local var_308_10 = getProxy(PlayerProxy):getRawData().level
	local var_308_11 = var_308_3 .. "_" .. arg_308_0
	local var_308_12 = var_308_1
	local var_308_13 = {
		var_308_3,
		var_308_4,
		var_308_6,
		var_308_9,
		var_308_10,
		var_308_11
	}

	if var_308_12 then
		for iter_308_0, iter_308_1 in ipairs(var_308_13) do
			var_308_12 = string.gsub(var_308_12, "$" .. iter_308_0, tostring(iter_308_1))
		end
	end

	originalPrint("survey url", tostring(var_308_12))

	return var_308_12
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

function FilterVarchar(arg_310_0)
	assert(type(arg_310_0) == "string" or type(arg_310_0) == "table")

	if arg_310_0 == "" then
		return nil
	end

	return arg_310_0
end

function getGameset(arg_311_0)
	local var_311_0 = pg.gameset[arg_311_0]

	assert(var_311_0)

	return {
		var_311_0.key_value,
		var_311_0.description
	}
end

function getDorm3dGameset(arg_312_0)
	local var_312_0 = pg.dorm3d_set[arg_312_0]

	assert(var_312_0)

	return {
		var_312_0.key_value_int,
		var_312_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_313_0)
	arg_313_0 = arg_313_0 or {}

	local var_313_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_313_0 > 0 do
		local var_313_1 = table.remove(arg_313_0)

		switch(var_313_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_313_1:getConfig("open_directly") == 1 then
					for iter_314_0, iter_314_1 in ipairs(var_313_1:getConfig("display_icon")) do
						local var_314_0 = Drop.Create(iter_314_1)

						var_314_0.count = var_314_0.count * var_313_1.count

						table.insert(arg_313_0, var_314_0)
					end
				elseif var_313_1:getSubClass():IsShipExpType() then
					var_313_0[var_313_1.type][var_313_1.id] = defaultValue(var_313_0[var_313_1.type][var_313_1.id], 0) + var_313_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_313_0[var_313_1.type][var_313_1.id] = defaultValue(var_313_0[var_313_1.type][var_313_1.id], 0) + var_313_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_313_0[var_313_1.type] = var_313_0[var_313_1.type] + var_313_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_313_0[var_313_1.type] = var_313_0[var_313_1.type] + var_313_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_313_0[var_313_1.type] = var_313_0[var_313_1.type] + var_313_1.count
			end
		})
	end

	return var_313_0
end

function CheckOverflow(arg_319_0, arg_319_1)
	local var_319_0 = {}
	local var_319_1 = arg_319_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_319_2 = arg_319_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_319_3 = arg_319_0[DROP_TYPE_EQUIP]
	local var_319_4 = arg_319_0[DROP_TYPE_SHIP]
	local var_319_5 = getProxy(PlayerProxy):getRawData()
	local var_319_6 = false

	if arg_319_1 then
		local var_319_7 = var_319_5:OverStore(PlayerConst.ResStoreGold, var_319_1)
		local var_319_8 = var_319_5:OverStore(PlayerConst.ResStoreOil, var_319_2)

		if var_319_7 > 0 or var_319_8 > 0 then
			var_319_0.isStoreOverflow = {
				var_319_7,
				var_319_8
			}
		end
	else
		if var_319_1 > 0 and var_319_5:GoldMax(var_319_1) then
			return false, "gold"
		end

		if var_319_2 > 0 and var_319_5:OilMax(var_319_2) then
			return false, "oil"
		end
	end

	var_319_0.isExpBookOverflow = {}

	for iter_319_0, iter_319_1 in pairs(arg_319_0[DROP_TYPE_ITEM]) do
		local var_319_9 = Item.getConfigData(iter_319_0)

		if getProxy(BagProxy):getItemCountById(iter_319_0) + iter_319_1 > var_319_9.max_num then
			table.insert(var_319_0.isExpBookOverflow, iter_319_0)
		end
	end

	local var_319_10 = getProxy(EquipmentProxy):getCapacity()

	if var_319_3 > 0 and var_319_10 >= var_319_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_319_11 = getProxy(BayProxy):getShipCount()

	if var_319_4 > 0 and var_319_4 + var_319_11 > var_319_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_319_0
end

function CheckShipExpOverflow(arg_320_0)
	local var_320_0 = getProxy(BagProxy)

	for iter_320_0, iter_320_1 in pairs(arg_320_0[DROP_TYPE_ITEM]) do
		if var_320_0:getItemCountById(iter_320_0) + iter_320_1 > Item.getConfigData(iter_320_0).max_num then
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

function RegisterDetailButton(arg_321_0, arg_321_1, arg_321_2)
	Drop.Change(arg_321_2)
	switch(arg_321_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_321_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_322_0 = Item.getConfigData(arg_321_2.id).usage_arg
				local var_322_1 = var_322_0[3]

				if Item.InTimeLimitSkinAssigned(arg_321_2.id) then
					var_322_1 = table.mergeArray(var_322_0[2], var_322_1, true)
				end

				local var_322_2 = {}

				for iter_322_0, iter_322_1 in ipairs(var_322_0[2]) do
					var_322_2[iter_322_1] = true
				end

				onButton(arg_321_0, arg_321_1, function()
					arg_321_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = NewSelectSkinLayer,
							mediator = NewSkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_321_2.id,
								selectableSkinList = underscore.map(var_322_1, function(arg_324_0)
									return SelectableSkin.New({
										id = arg_324_0,
										isTimeLimit = var_322_2[arg_324_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_321_1, true)
			else
				local var_322_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_321_2.id) and "tech" or arg_321_2:getConfig("type")

				if var_0_27[var_322_3] then
					local var_322_4 = {
						item2Row = true,
						content = i18n(var_0_27[var_322_3]),
						itemList = underscore.map(arg_321_2:getConfig("display_icon"), function(arg_325_0)
							return Drop.Create(arg_325_0)
						end)
					}

					if var_322_3 == 11 then
						onButton(arg_321_0, arg_321_1, function()
							arg_321_0:emit(BaseUI.ON_DROP_LIST_OWN, var_322_4)
						end, SFX_PANEL)
					else
						onButton(arg_321_0, arg_321_1, function()
							arg_321_0:emit(BaseUI.ON_DROP_LIST, var_322_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_321_1, tobool(var_0_27[var_322_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_321_0, arg_321_1, function()
				arg_321_0:emit(BaseUI.ON_DROP, arg_321_2)
			end, SFX_PANEL)
			setActive(arg_321_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_321_0, arg_321_1, function()
				arg_321_0:emit(BaseUI.ON_DROP, arg_321_2)
			end, SFX_PANEL)
			setActive(arg_321_1, true)
		end
	}, function()
		setActive(arg_321_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_333_0, arg_333_1, arg_333_2)
	Drop.Change(arg_333_2)
	switch(arg_333_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_334_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_333_2.id) and "tech" or arg_333_2:getConfig("type")

			if var_0_27[var_334_0] then
				local var_334_1 = {
					useDeepShow = true,
					showOwn = var_334_0 == 11,
					content = i18n(var_0_27[var_334_0]),
					itemList = underscore.map(arg_333_2:getConfig("display_icon"), function(arg_335_0)
						return Drop.Create(arg_335_0)
					end)
				}

				onButton(arg_333_0, arg_333_1, function()
					arg_333_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_334_1)
				end, SFX_PANEL)
			end

			setActive(arg_333_1, tobool(var_0_27[var_334_0]))
		end
	}, function()
		setActive(arg_333_1, false)
	end)
end

function UpdateOwnDisplay(arg_338_0, arg_338_1)
	local var_338_0, var_338_1 = arg_338_1:getOwnedCount()

	setActive(arg_338_0, var_338_1 and var_338_0 > 0)

	if var_338_1 and var_338_0 > 0 then
		setText(arg_338_0:Find("label"), i18n("word_own1"))
		setText(arg_338_0:Find("Text"), var_338_0)
	end
end

function Damp(arg_339_0, arg_339_1, arg_339_2)
	arg_339_1 = Mathf.Max(1, arg_339_1)

	local var_339_0 = Mathf.Epsilon

	if arg_339_1 < var_339_0 or var_339_0 > Mathf.Abs(arg_339_0) then
		return arg_339_0
	end

	if arg_339_2 < var_339_0 then
		return 0
	end

	local var_339_1 = -4.605170186

	return arg_339_0 * (1 - Mathf.Exp(var_339_1 * arg_339_2 / arg_339_1))
end

function checkCullResume(arg_340_0, arg_340_1)
	if arg_340_1 or not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_340_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_340_0 = arg_340_0:GetComponentsInChildren(typeof(var_0_0.UI.Graphic)):ToTable()

		for iter_340_0, iter_340_1 in ipairs(var_340_0) do
			iter_340_1:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_341_0)
	local var_341_0 = {}

	if arg_341_0 and arg_341_0 ~= "" then
		local var_341_1 = base64.dec(arg_341_0)

		var_341_0 = string.split(var_341_1, "/")
		var_341_0[5], var_341_0[6] = unpack(string.split(var_341_0[5], "\\"))

		if #var_341_0 < 6 or arg_341_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_341_0, 5), "/"),
			var_341_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_341_0 = {}
		end
	end

	for iter_341_0 = 1, 6 do
		var_341_0[iter_341_0] = var_341_0[iter_341_0] and tonumber(var_341_0[iter_341_0], 32) or 0
	end

	return var_341_0
end

function buildEquipCode(arg_342_0)
	local var_342_0 = underscore.map(arg_342_0:getAllEquipments(), function(arg_343_0)
		return ConversionBase(32, arg_343_0 and arg_343_0.id or 0)
	end)
	local var_342_1 = {
		table.concat(var_342_0, "/"),
		ConversionBase(32, checkExist(arg_342_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_342_1, "\\"))
end

function setDirectorSpeed(arg_344_0, arg_344_1)
	GetComponent(arg_344_0, typeof(TimelineSpeed)):SetTimelineSpeed(arg_344_1)
end

function setDefaultZeroMetatable(arg_345_0)
	return setmetatable(arg_345_0, {
		__index = function(arg_346_0, arg_346_1)
			if rawget(arg_346_0, arg_346_1) == nil then
				arg_346_0[arg_346_1] = 0
			end

			return arg_346_0[arg_346_1]
		end
	})
end

function checkABExist(arg_347_0)
	if EDITOR_TOOL then
		return ResourceMgr.Inst:AssetExist(arg_347_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_347_0))
	end
end

function compareNumber(arg_348_0, arg_348_1, arg_348_2)
	return switch(arg_348_1, {
		[">"] = function()
			return arg_348_0 > arg_348_2
		end,
		[">="] = function()
			return arg_348_0 >= arg_348_2
		end,
		["="] = function()
			return arg_348_0 == arg_348_2
		end,
		["<"] = function()
			return arg_348_0 < arg_348_2
		end,
		["<="] = function()
			return arg_348_0 <= arg_348_2
		end
	})
end

function ArabicToRoman(arg_354_0)
	local var_354_0 = {
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

	local function var_354_1(arg_355_0, arg_355_1)
		return select(2, arg_355_0:gsub(arg_355_1, ""))
	end

	local var_354_2 = ""

	while arg_354_0 > 0 do
		for iter_354_0, iter_354_1 in pairs(var_354_0) do
			local var_354_3 = iter_354_1[2]
			local var_354_4 = iter_354_1[1]

			while var_354_4 <= arg_354_0 do
				var_354_2 = var_354_2 .. var_354_3
				arg_354_0 = arg_354_0 - var_354_4
			end
		end
	end

	if arg_354_0 > 10000 then
		local var_354_5 = var_354_1(var_354_2, "M")

		var_354_2 = "M*" .. var_354_5 .. " " .. var_354_2
	end

	return var_354_2
end

function stringInset(arg_356_0, ...)
	for iter_356_0, iter_356_1 in ipairs({
		...
	}) do
		arg_356_0 = string.gsub(arg_356_0, "$" .. iter_356_0, iter_356_1)
	end

	return arg_356_0
end

function addSubLayer(arg_357_0, arg_357_1, arg_357_2, arg_357_3, arg_357_4)
	if arg_357_2 then
		while arg_357_1.parent do
			arg_357_1 = arg_357_1.parent
		end
	end

	local var_357_0 = {
		parentContext = arg_357_1,
		context = arg_357_0,
		callback = arg_357_3
	}

	var_357_0 = arg_357_4 and table.merge(var_357_0, arg_357_4) or var_357_0

	pg.m02:sendNotification(GAME.LOAD_LAYERS, var_357_0)
end
