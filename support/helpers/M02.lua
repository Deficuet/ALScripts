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
	local var_102_1 = IslandItemRarity.Rarity2FrameName(ItemRarity.Gold)

	GetImageSpriteFromAtlasAsync("island/islandframe", var_102_1, findTF(arg_102_0, "icon_bg"))

	if not IsNil(findTF(arg_102_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("island/islandframe", var_102_1, findTF(arg_102_0, "icon_bg/frame"))
	end

	setActive(findTF(arg_102_0, "icon_bg/count_bg"), false)
	GetImageSpriteFromAtlasAsync("island/" .. var_102_0, "", findTF(arg_102_0, "icon_bg/icon"))
	setIconName(arg_102_0, "", {})
end

function updateIslandInvitation(arg_103_0, arg_103_1)
	local var_103_0 = pg.island_chara_template[arg_103_1.id].invite_item
	local var_103_1 = pg.island_item_data_template[var_103_0].icon
	local var_103_2 = IslandItemRarity.Rarity2FrameName(ItemRarity.Gold)

	GetImageSpriteFromAtlasAsync("island/islandframe", var_103_2, findTF(arg_103_0, "icon_bg"))

	if not IsNil(findTF(arg_103_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("island/islandframe", var_103_2, findTF(arg_103_0, "icon_bg/frame"))
	end

	setActive(findTF(arg_103_0, "icon_bg/count_bg"), arg_103_1.count > 0)
	setText(findTF(arg_103_0, "icon_bg/count_bg/count"), arg_103_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_103_1, "", findTF(arg_103_0, "icon_bg/icon"))
	setIconName(arg_103_0, "", {})
end

function updateIslandItem(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_1:getConfigTable().rarity
	local var_104_1 = arg_104_1:getConfigTable().icon
	local var_104_2 = arg_104_1:getConfigTable().name
	local var_104_3 = IslandItemRarity.Rarity2FrameName(var_104_0)

	GetImageSpriteFromAtlasAsync("island/islandframe", var_104_3, findTF(arg_104_0, "icon_bg"))

	if not IsNil(findTF(arg_104_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("island/islandframe", var_104_3, findTF(arg_104_0, "icon_bg/frame"))
	end

	setActive(findTF(arg_104_0, "icon_bg/count_bg"), arg_104_1.count > 0)
	setText(findTF(arg_104_0, "icon_bg/count_bg/count"), arg_104_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_104_1, "", findTF(arg_104_0, "icon_bg/icon"))
	setIconName(arg_104_0, var_104_2, {})
end

function updateIslandFurniture(arg_105_0, arg_105_1)
	local var_105_0 = arg_105_1:getConfigTable().rarity
	local var_105_1 = arg_105_1:getConfigTable().icon
	local var_105_2 = arg_105_1:getConfigTable().name
	local var_105_3 = IslandItemRarity.Rarity2FrameName(var_105_0)

	GetImageSpriteFromAtlasAsync("island/islandframe", var_105_3, findTF(arg_105_0, "icon_bg"))

	if not IsNil(findTF(arg_105_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("island/islandframe", var_105_3, findTF(arg_105_0, "icon_bg/frame"))
	end

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

	GetImageSpriteFromAtlasAsync(arg_106_1:getIcon(), "", var_106_2)
	setIconStars(arg_106_0, false)
	setIconName(arg_106_0, arg_106_1:getName(), arg_106_2)
	setIconColorful(arg_106_0, var_106_0, arg_106_2)
end

function getIslandSeasonPtInfo()
	local var_107_0 = pg.island_set.season_pt.key_value_varchar

	return {
		name = var_107_0[1],
		icon = var_107_0[2]
	}
end

function updateIslandSeasonPt(arg_108_0, arg_108_1)
	local var_108_0 = getIslandSeasonPtInfo()

	GetImageSpriteFromAtlasAsync("island/" .. var_108_0.icon, "", findTF(arg_108_0, "icon_bg/icon"))
	setActive(findTF(arg_108_0, "icon_bg/count_bg"), arg_108_1.count > 0)
	setText(findTF(arg_108_0, "icon_bg/count_bg/count"), arg_108_1.count)
end

function updateIslandWatherCollect(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_1:getConfigTable().icon
	local var_109_1 = arg_109_1:getConfigTable().name

	setText(findTF(arg_109_0, "icon_bg/count"), arg_109_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_109_0, "", findTF(arg_109_0, "icon_bg/icon"))
	setIconName(arg_109_0, var_109_1, {})
end

function updateWorldItem(arg_110_0, arg_110_1, arg_110_2)
	arg_110_2 = arg_110_2 or {}

	local var_110_0 = ItemRarity.Rarity2Print(arg_110_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_110_0, findTF(arg_110_0, "icon_bg"))
	setFrame(findTF(arg_110_0, "icon_bg/frame"), var_110_0)

	local var_110_1 = findTF(arg_110_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_110_1.icon or arg_110_1:getConfig("icon"), "", var_110_1)
	setIconStars(arg_110_0, false)
	setIconName(arg_110_0, arg_110_1:getConfig("name"), arg_110_2)
	setIconColorful(arg_110_0, arg_110_1:getConfig("rarity"), arg_110_2)
end

function updateWorldCollection(arg_111_0, arg_111_1, arg_111_2)
	arg_111_2 = arg_111_2 or {}

	assert(arg_111_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_111_1.id)

	local var_111_0 = arg_111_1:getDropRarity()
	local var_111_1 = ItemRarity.Rarity2Print(var_111_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_111_1, findTF(arg_111_0, "icon_bg"))
	setFrame(findTF(arg_111_0, "icon_bg/frame"), var_111_1)

	local var_111_2 = findTF(arg_111_0, "icon_bg/icon")
	local var_111_3 = WorldCollectionProxy.GetCollectionType(arg_111_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_111_3, "", var_111_2)
	setIconStars(arg_111_0, false)
	setIconName(arg_111_0, arg_111_1:getName(), arg_111_2)
	setIconColorful(arg_111_0, var_111_0, arg_111_2)
end

function updateWorldBuff(arg_112_0, arg_112_1, arg_112_2)
	arg_112_2 = arg_112_2 or {}

	local var_112_0 = pg.world_SLGbuff_data[arg_112_1]

	assert(var_112_0, "找不到大世界buff配置: " .. arg_112_1)

	local var_112_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_112_1, findTF(arg_112_0, "icon_bg"))
	setFrame(findTF(arg_112_0, "icon_bg/frame"), var_112_1)

	local var_112_2 = findTF(arg_112_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_112_0.icon, "", var_112_2)

	local var_112_3 = arg_112_0:Find("icon_bg/stars")

	if not IsNil(var_112_3) then
		setActive(var_112_3, false)
	end

	local var_112_4 = findTF(arg_112_0, "name")

	if not IsNil(var_112_4) then
		setText(var_112_4, var_112_0.name)
	end

	local var_112_5 = findTF(arg_112_0, "icon_bg/count")

	if not IsNil(var_112_5) then
		SetActive(var_112_5, false)
	end
end

function updateShip(arg_113_0, arg_113_1, arg_113_2)
	arg_113_2 = arg_113_2 or {}

	local var_113_0 = arg_113_1:rarity2bgPrint()
	local var_113_1 = arg_113_1:getPainting()

	if arg_113_2.anonymous then
		var_113_0 = "1"
		var_113_1 = "unknown"
	end

	if arg_113_2.unknown_small then
		var_113_1 = "unknown_small"
	end

	local var_113_2 = findTF(arg_113_0, "icon_bg/new")

	if var_113_2 then
		if arg_113_2.isSkin then
			setActive(var_113_2, not arg_113_2.isTimeLimit and arg_113_2.isNew)
		else
			setActive(var_113_2, arg_113_1.virgin)
		end
	end

	local var_113_3 = findTF(arg_113_0, "icon_bg/timelimit")

	if var_113_3 then
		setActive(var_113_3, arg_113_2.isTimeLimit)
	end

	local var_113_4 = findTF(arg_113_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_113_2.isSkin and "_skin" or var_113_0), var_113_4)

	local var_113_5 = findTF(arg_113_0, "icon_bg/frame")
	local var_113_6

	if arg_113_1.isNpc then
		var_113_6 = "frame_npc"
	elseif arg_113_1:ShowPropose() then
		var_113_6 = "frame_prop"

		if arg_113_1:isMetaShip() then
			var_113_6 = var_113_6 .. "_meta"
		end
	elseif arg_113_2.isSkin then
		var_113_6 = "frame_skin"
	end

	setFrame(var_113_5, var_113_0, var_113_6)

	if arg_113_2.gray then
		setGray(var_113_4, true, true)
	end

	local var_113_7 = findTF(arg_113_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_113_2.Q and "QIcon/" or "SquareIcon/") .. var_113_1, "", var_113_7)

	local var_113_8 = findTF(arg_113_0, "icon_bg/lv")

	if var_113_8 then
		setActive(var_113_8, not arg_113_1.isNpc)

		if not arg_113_1.isNpc then
			local var_113_9 = findTF(var_113_8, "Text")

			if var_113_9 and arg_113_1.level then
				setText(var_113_9, arg_113_1.level)
			end
		end
	end

	local var_113_10 = findTF(arg_113_0, "ship_type")

	if var_113_10 then
		setActive(var_113_10, true)
		setImageSprite(var_113_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_113_1:getShipType())))
	end

	local var_113_11 = var_113_4:Find("npc")

	if not IsNil(var_113_11) then
		if var_113_2 and go(var_113_2).activeSelf then
			setActive(var_113_11, false)
		else
			setActive(var_113_11, arg_113_1:isActivityNpc())
		end
	end

	local var_113_12 = arg_113_0:Find("group_locked")

	if var_113_12 then
		setActive(var_113_12, not arg_113_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_113_1.groupId))
	end

	setIconStars(arg_113_0, arg_113_2.initStar, arg_113_1:getStar())
	setIconName(arg_113_0, arg_113_2.isSkin and arg_113_1:GetSkinConfig().name or arg_113_1:getName(), arg_113_2)
	setIconColorful(arg_113_0, arg_113_2.isSkin and ItemRarity.Gold or arg_113_1:getRarity() - 1, arg_113_2)
end

function updateCommander(arg_114_0, arg_114_1, arg_114_2)
	arg_114_2 = arg_114_2 or {}

	local var_114_0 = arg_114_1:getDropRarity()
	local var_114_1 = ItemRarity.Rarity2Print(var_114_0)
	local var_114_2 = arg_114_1:getConfig("painting")

	if arg_114_2.anonymous then
		var_114_1 = 1
		var_114_2 = "unknown"
	end

	local var_114_3 = findTF(arg_114_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_114_1, var_114_3)

	local var_114_4 = findTF(arg_114_0, "icon_bg/frame")

	setFrame(var_114_4, var_114_1)

	if arg_114_2.gray then
		setGray(var_114_3, true, true)
	end

	local var_114_5 = findTF(arg_114_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_114_2, "", var_114_5)
	setIconStars(arg_114_0, arg_114_2.initStar, 0)
	setIconName(arg_114_0, arg_114_1:getName(), arg_114_2)
end

function updateStrategy(arg_115_0, arg_115_1, arg_115_2)
	arg_115_2 = arg_115_2 or {}

	local var_115_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_115_0, findTF(arg_115_0, "icon_bg"))
	setFrame(findTF(arg_115_0, "icon_bg/frame"), var_115_0)

	local var_115_1 = findTF(arg_115_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_115_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_115_1:getIcon(), "", var_115_1)
	setIconStars(arg_115_0, false)
	setIconName(arg_115_0, arg_115_1:getName(), arg_115_2)
	setIconColorful(arg_115_0, ItemRarity.Gray, arg_115_2)
end

function updateFurniture(arg_116_0, arg_116_1, arg_116_2)
	arg_116_2 = arg_116_2 or {}

	local var_116_0 = arg_116_1:getDropRarity()
	local var_116_1 = ItemRarity.Rarity2Print(var_116_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_116_1, findTF(arg_116_0, "icon_bg"))
	setFrame(findTF(arg_116_0, "icon_bg/frame"), var_116_1)

	local var_116_2 = findTF(arg_116_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_116_1:getIcon(), "", var_116_2)
	setIconStars(arg_116_0, false)
	setIconName(arg_116_0, arg_116_1:getName(), arg_116_2)
	setIconColorful(arg_116_0, var_116_0, arg_116_2)
end

function updateSpWeapon(arg_117_0, arg_117_1, arg_117_2)
	arg_117_2 = arg_117_2 or {}

	assert(arg_117_1, "spWeaponVO can not be nil.")
	assert(isa(arg_117_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_117_0 = ItemRarity.Rarity2Print(arg_117_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_0, findTF(arg_117_0, "icon_bg"))
	setFrame(findTF(arg_117_0, "icon_bg/frame"), var_117_0)

	local var_117_1 = findTF(arg_117_0, "icon_bg/icon")

	var_0_4(var_117_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_117_1:GetIconPath(), "", var_117_1)
	setIconStars(arg_117_0, true, arg_117_1:GetRarity())
	var_0_7(arg_117_0, arg_117_1:GetLevel() - 1)
	setIconName(arg_117_0, arg_117_1:GetName(), arg_117_2)
	setIconCount(arg_117_0, arg_117_1.count)
	setIconColorful(arg_117_0, arg_117_1:GetRarity(), arg_117_2)
end

function UpdateSpWeaponSlot(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = ItemRarity.Rarity2Print(arg_118_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_118_0, findTF(arg_118_0, "Icon/Mask/icon_bg"))

	local var_118_1 = findTF(arg_118_0, "Icon/Mask/icon_bg/icon")

	arg_118_2 = arg_118_2 or {
		16,
		16,
		16,
		16
	}

	var_0_4(var_118_1, arg_118_2)
	GetImageSpriteFromAtlasAsync(arg_118_1:GetIconPath(), "", var_118_1)

	local var_118_2 = arg_118_1:GetLevel() - 1
	local var_118_3 = findTF(arg_118_0, "Icon/LV")

	setActive(var_118_3, var_118_2 > 0)
	setText(findTF(var_118_3, "Text"), var_118_2)
end

function updateDorm3dIcon(arg_119_0, arg_119_1)
	local var_119_0 = arg_119_1:getDropRarityDorm()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_119_0), arg_119_0)

	local var_119_1 = arg_119_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_119_1:getIcon(), "", var_119_1)
	setText(arg_119_0:Find("count/Text"), "x" .. arg_119_1.count)
	setText(arg_119_0:Find("name/Text"), arg_119_1:getName())
end

local var_0_8

function findCullAndClipWorldRect(arg_120_0)
	if #arg_120_0 == 0 then
		return false
	end

	local var_120_0 = arg_120_0[1].canvasRect

	for iter_120_0 = 1, #arg_120_0 do
		var_120_0 = rectIntersect(var_120_0, arg_120_0[iter_120_0].canvasRect)
	end

	if var_120_0.width <= 0 or var_120_0.height <= 0 then
		return false
	end

	var_0_8 = var_0_8 or GameObject.Find("UICamera/Canvas").transform

	local var_120_1 = var_0_8:TransformPoint(Vector3(var_120_0.x, var_120_0.y, 0))
	local var_120_2 = var_0_8:TransformPoint(Vector3(var_120_0.x + var_120_0.width, var_120_0.y + var_120_0.height, 0))

	return true, Vector4(var_120_1.x, var_120_1.y, var_120_2.x, var_120_2.y)
end

function rectIntersect(arg_121_0, arg_121_1)
	local var_121_0 = math.max(arg_121_0.x, arg_121_1.x)
	local var_121_1 = math.min(arg_121_0.x + arg_121_0.width, arg_121_1.x + arg_121_1.width)
	local var_121_2 = math.max(arg_121_0.y, arg_121_1.y)
	local var_121_3 = math.min(arg_121_0.y + arg_121_0.height, arg_121_1.y + arg_121_1.height)

	if var_121_0 <= var_121_1 and var_121_2 <= var_121_3 then
		return var_0_0.Rect.New(var_121_0, var_121_2, var_121_1 - var_121_0, var_121_3 - var_121_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_122_0)
	local var_122_0 = {}

	for iter_122_0, iter_122_1 in ipairs(arg_122_0) do
		local var_122_1 = Drop.Create(iter_122_1)

		var_122_1.count = var_122_1.count or 1

		if var_122_1.type == DROP_TYPE_EMOJI then
			table.insert(var_122_0, var_122_1:getName())
		else
			table.insert(var_122_0, var_122_1:getName() .. "x" .. var_122_1.count)
		end
	end

	return table.concat(var_122_0, "、")
end

function updateDrop(arg_123_0, arg_123_1, arg_123_2)
	Drop.Change(arg_123_1)

	arg_123_2 = arg_123_2 or {}

	local var_123_0 = {
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
	local var_123_1

	for iter_123_0, iter_123_1 in ipairs(var_123_0) do
		local var_123_2 = arg_123_0:Find(iter_123_1[1])

		if arg_123_1.type ~= iter_123_1[2] and not IsNil(var_123_2) then
			setActive(var_123_2, false)
		end
	end

	if not IsNil(arg_123_0:Find("icon_bg/frame")) then
		arg_123_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

		setIconColorful(arg_123_0, arg_123_1:getDropRarity(), arg_123_2, {
			[ItemRarity.Gold] = {
				name = "Item_duang5",
				active = function(arg_124_0, arg_124_1)
					return arg_124_1.fromAwardLayer and arg_124_0 >= ItemRarity.Gold
				end
			}
		})
		var_0_4(findTF(arg_123_0, "icon_bg/icon"), {
			2,
			2,
			2,
			2
		})
	end

	arg_123_1:UpdateDropTpl(arg_123_0, arg_123_2)
	setIconCount(arg_123_0, arg_123_2.count or arg_123_1:getCount())
end

function updateCustomDrop(arg_125_0, arg_125_1, arg_125_2)
	Drop.Change(arg_125_1)

	arg_125_2 = arg_125_2 or {}

	arg_125_1:UpdateCustomDropTpl(arg_125_0, arg_125_2)
end

function updateBuff(arg_126_0, arg_126_1, arg_126_2)
	arg_126_2 = arg_126_2 or {}

	local var_126_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_126_0, findTF(arg_126_0, "icon_bg"))

	local var_126_1 = pg.benefit_buff_template[arg_126_1]

	setFrame(findTF(arg_126_0, "icon_bg/frame"), var_126_0)
	setText(findTF(arg_126_0, "icon_bg/count"), 1)

	local var_126_2 = findTF(arg_126_0, "icon_bg/icon")
	local var_126_3 = var_126_1.icon

	GetImageSpriteFromAtlasAsync(var_126_3, "", var_126_2)
	setIconStars(arg_126_0, false)
	setIconName(arg_126_0, var_126_1.name, arg_126_2)
	setIconColorful(arg_126_0, ItemRarity.Gold, arg_126_2)
end

function updateAttire(arg_127_0, arg_127_1, arg_127_2, arg_127_3)
	local var_127_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_127_0, findTF(arg_127_0, "icon_bg"))
	setFrame(findTF(arg_127_0, "icon_bg/frame"), var_127_0)

	local var_127_1 = findTF(arg_127_0, "icon_bg/icon")
	local var_127_2

	if arg_127_1 == AttireConst.TYPE_CHAT_FRAME then
		var_127_2 = "chat_frame"
	elseif arg_127_1 == AttireConst.TYPE_ICON_FRAME then
		var_127_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_127_2, "", var_127_1)
	setIconName(arg_127_0, arg_127_2.name, arg_127_3)
end

function updateAttireCombatUI(arg_128_0, arg_128_1, arg_128_2, arg_128_3)
	local var_128_0 = arg_128_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_128_0, findTF(arg_128_0, "icon_bg"))
	setFrame(findTF(arg_128_0, "icon_bg/frame"), var_128_0, "frame_battle_ui")

	local var_128_1 = findTF(arg_128_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_128_2.display_icon, "", var_128_1)
	setIconName(arg_128_0, arg_128_2.name, arg_128_3)
end

function updateActivityMedal(arg_129_0, arg_129_1, arg_129_2)
	local var_129_0 = ItemRarity.Rarity2Print(arg_129_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_129_0, findTF(arg_129_0, "icon_bg"))
	setFrame(findTF(arg_129_0, "icon_bg/frame"), var_129_0)

	local var_129_1 = findTF(arg_129_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_129_1.icon, "", var_129_1)
	setIconName(arg_129_0, arg_129_1.name, arg_129_2)
end

function updateCover(arg_130_0, arg_130_1, arg_130_2)
	local var_130_0 = arg_130_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_130_0, findTF(arg_130_0, "icon_bg"))
	setFrame(findTF(arg_130_0, "icon_bg/frame"), var_130_0)

	local var_130_1 = findTF(arg_130_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_130_1:getIcon(), "", var_130_1)
	setIconName(arg_130_0, arg_130_1:getName(), arg_130_2)
	setIconStars(arg_130_0, false)
end

function updateEmoji(arg_131_0, arg_131_1, arg_131_2)
	local var_131_0 = findTF(arg_131_0, "icon_bg/icon")
	local var_131_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_131_1, "", var_131_0)

	local var_131_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_131_2, findTF(arg_131_0, "icon_bg"))
	setFrame(findTF(arg_131_0, "icon_bg/frame"), var_131_2)
	setIconName(arg_131_0, arg_131_1.name, arg_131_2)
end

function updateEquipmentSkin(arg_132_0, arg_132_1, arg_132_2)
	arg_132_2 = arg_132_2 or {}

	local var_132_0 = EquipmentRarity.Rarity2Print(arg_132_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_132_0, findTF(arg_132_0, "icon_bg"))
	setFrame(findTF(arg_132_0, "icon_bg/frame"), var_132_0, "frame_skin")

	local var_132_1 = findTF(arg_132_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_132_1.icon, "", var_132_1)
	setIconStars(arg_132_0, false)
	setIconName(arg_132_0, arg_132_1.name, arg_132_2)
	setIconCount(arg_132_0, arg_132_1.count)
	setIconColorful(arg_132_0, arg_132_1.rarity - 1, arg_132_2)
end

function NoPosMsgBox(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
	local var_133_0
	local var_133_1 = {}

	if arg_133_1 then
		table.insert(var_133_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_133_1
		})
	end

	if arg_133_2 then
		table.insert(var_133_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_133_2
		})
	end

	if arg_133_3 then
		table.insert(var_133_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_133_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_133_0,
		custom = var_133_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_134_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_134_0 and var_134_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_134_0
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
		local var_135_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_135_0 and var_135_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_135_0
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
		onClick = function(arg_138_0, arg_138_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_138_0.id,
				shipVOs = arg_138_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_139_0, arg_139_1, arg_139_2)
	if arg_139_2 then
		local var_139_0 = ""

		for iter_139_0, iter_139_1 in ipairs(arg_139_2) do
			local var_139_1 = Item.getConfigData(iter_139_1[1])

			var_139_0 = var_139_0 .. i18n(iter_139_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_139_1.name, iter_139_1[2])

			if iter_139_0 < #arg_139_2 then
				var_139_0 = var_139_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_139_0 ~= "" then
			arg_139_0 = arg_139_0 .. "\n" .. i18n("text_noRes_tip", var_139_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_139_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_139_1, arg_139_2)
		end
	})
end

function shoppingBatch(arg_141_0, arg_141_1, arg_141_2, arg_141_3, arg_141_4)
	local var_141_0 = pg.shop_template[arg_141_0]

	assert(var_141_0, "shop_template中找不到商品id：" .. arg_141_0)

	local var_141_1 = getProxy(PlayerProxy):getData()[id2res(var_141_0.resource_type)]
	local var_141_2 = arg_141_1.price or var_141_0.resource_num
	local var_141_3 = math.floor(var_141_1 / var_141_2)

	var_141_3 = var_141_3 <= 0 and 1 or var_141_3
	var_141_3 = arg_141_2 ~= nil and arg_141_2 < var_141_3 and arg_141_2 or var_141_3

	local var_141_4 = true
	local var_141_5 = 1

	if var_141_0 ~= nil and arg_141_1.id then
		print(var_141_3 * var_141_0.num, "--", var_141_3)
		assert(Item.getConfigData(arg_141_1.id), "item config should be existence")

		local var_141_6 = Item.New({
			id = arg_141_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_141_1.id
			},
			addNum = var_141_0.num,
			maxNum = var_141_3 * var_141_0.num,
			defaultNum = var_141_0.num,
			numUpdate = function(arg_142_0, arg_142_1)
				var_141_5 = math.floor(arg_142_1 / var_141_0.num)

				local var_142_0 = var_141_5 * var_141_2

				if var_142_0 > var_141_1 then
					setText(arg_142_0, i18n(arg_141_3, var_142_0, arg_142_1, COLOR_RED, var_141_6))

					var_141_4 = false
				else
					setText(arg_142_0, i18n(arg_141_3, var_142_0, arg_142_1, COLOR_GREEN, var_141_6))

					var_141_4 = true
				end
			end,
			onYes = function()
				if var_141_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_141_0,
						count = var_141_5
					})
				elseif arg_141_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_141_4))
					pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_144_0, arg_144_1, arg_144_2, arg_144_3, arg_144_4)
	local var_144_0 = pg.shop_template[arg_144_0]

	assert(var_144_0, "shop_template中找不到商品id：" .. arg_144_0)

	local var_144_1 = getProxy(PlayerProxy):getData()[id2res(var_144_0.resource_type)]
	local var_144_2 = arg_144_1.price or var_144_0.resource_num
	local var_144_3 = math.floor(var_144_1 / var_144_2)

	var_144_3 = var_144_3 <= 0 and 1 or var_144_3
	var_144_3 = arg_144_2 ~= nil and arg_144_2 < var_144_3 and arg_144_2 or var_144_3

	local var_144_4 = true
	local var_144_5 = 1

	if var_144_0 ~= nil and arg_144_1.id then
		print(var_144_3 * var_144_0.num, "--", var_144_3)
		assert(Item.getConfigData(arg_144_1.id), "item config should be existence")

		local var_144_6 = Item.New({
			id = arg_144_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_144_1.id
			}),
			price = var_144_2,
			addNum = var_144_0.num,
			maxNum = var_144_3 * var_144_0.num,
			defaultNum = var_144_0.num,
			numUpdate = function(arg_145_0, arg_145_1)
				var_144_5 = math.floor(arg_145_1 / var_144_0.num)

				local var_145_0 = var_144_5 * var_144_2

				if var_145_0 > var_144_1 then
					setTextInNewStyleBox(arg_145_0, i18n(arg_144_3, var_145_0, arg_145_1, COLOR_RED, var_144_6))

					var_144_4 = false
				else
					setTextInNewStyleBox(arg_145_0, i18n(arg_144_3, var_145_0, arg_145_1, "#238C40FF", var_144_6))

					var_144_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_144_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_144_0,
								count = var_144_5
							})
						elseif arg_144_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_144_4))
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

function gotoChargeScene(arg_147_0, arg_147_1)
	local var_147_0 = getProxy(ContextProxy)
	local var_147_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_147_1.mediator, NewShopMainMediator) then
		var_147_1.mediator:getViewComponent():switchSubViewByTogger(arg_147_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_147_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_147_1
		})
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
end

function clearDrop(arg_148_0)
	local var_148_0 = findTF(arg_148_0, "icon_bg")
	local var_148_1 = findTF(arg_148_0, "icon_bg/frame")
	local var_148_2 = findTF(arg_148_0, "icon_bg/icon")
	local var_148_3 = findTF(arg_148_0, "icon_bg/icon/icon")

	clearImageSprite(var_148_0)
	clearImageSprite(var_148_1)
	clearImageSprite(var_148_2)

	if var_148_3 then
		clearImageSprite(var_148_3)
	end
end

local var_0_9 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_149_0, arg_149_1, arg_149_2, arg_149_3)
	local var_149_0 = findTF(arg_149_0, "skill")
	local var_149_1 = findTF(arg_149_0, "lock")
	local var_149_2 = findTF(arg_149_0, "unknown")

	if arg_149_1 then
		setActive(var_149_0, true)
		setActive(var_149_2, false)
		setActive(var_149_1, not arg_149_2)
		LoadImageSpriteAsync("skillicon/" .. arg_149_1.icon, findTF(var_149_0, "icon"))

		local var_149_3 = arg_149_1.color or "blue"

		setText(findTF(var_149_0, "name"), shortenString(getSkillName(arg_149_1.id), arg_149_3 or 8))

		local var_149_4 = findTF(var_149_0, "level")

		setText(var_149_4, "LEVEL: " .. (arg_149_2 and arg_149_2.level or "??"))
		setTextColor(var_149_4, var_0_9[var_149_3])
	else
		setActive(var_149_0, false)
		setActive(var_149_2, true)
		setActive(var_149_1, false)
	end
end

local var_0_10 = true

function onBackButton(arg_150_0, arg_150_1, arg_150_2, arg_150_3)
	local var_150_0 = GetOrAddComponent(arg_150_1, "UILongPressTrigger")

	assert(arg_150_2, "callback should exist")

	var_150_0.longPressThreshold = defaultValue(arg_150_3, 1)

	local function var_150_1(arg_151_0)
		return function()
			if var_0_10 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_152_0, var_152_1 = arg_150_2()

			if var_152_0 then
				arg_151_0(var_152_1)
			end
		end
	end

	local var_150_2 = var_150_0.onReleased

	pg.DelegateInfo.Add(arg_150_0, var_150_2)
	var_150_2:RemoveAllListeners()
	var_150_2:AddListener(var_150_1(function(arg_153_0)
		arg_153_0:emit(BaseUI.ON_BACK)
	end))

	local var_150_3 = var_150_0.onLongPressed

	pg.DelegateInfo.Add(arg_150_0, var_150_3)
	var_150_3:RemoveAllListeners()
	var_150_3:AddListener(var_150_1(function(arg_154_0)
		arg_154_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_157_0)
	local var_157_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_157_1, var_157_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_157_0)

	return var_157_1 * 86400 + (var_157_2 + arg_157_0) * 3600
end

function GetPerceptualSize(arg_158_0, arg_158_1)
	local function var_158_0(arg_159_0)
		if not arg_159_0 then
			return 0, 1
		elseif arg_159_0 > 240 then
			return 4, 1
		elseif arg_159_0 > 225 then
			return 3, 1
		elseif arg_159_0 > 192 then
			return 2, 1
		elseif arg_159_0 < 126 then
			return 1, arg_158_1 or 0.5
		else
			return 1, 1
		end
	end

	if type(arg_158_0) == "number" then
		return var_158_0(arg_158_0)
	end

	local var_158_1 = 1
	local var_158_2 = 0
	local var_158_3 = 0
	local var_158_4 = #arg_158_0

	while var_158_1 <= var_158_4 do
		local var_158_5 = string.byte(arg_158_0, var_158_1)
		local var_158_6, var_158_7 = var_158_0(var_158_5)

		var_158_1 = var_158_1 + var_158_6
		var_158_2 = var_158_2 + var_158_7
	end

	return var_158_2
end

function shortenString(arg_160_0, arg_160_1, arg_160_2)
	local var_160_0 = 1
	local var_160_1 = 0
	local var_160_2 = 0
	local var_160_3 = #arg_160_0

	while var_160_0 <= var_160_3 do
		local var_160_4 = string.byte(arg_160_0, var_160_0)
		local var_160_5, var_160_6 = GetPerceptualSize(var_160_4, arg_160_2)

		var_160_0 = var_160_0 + var_160_5
		var_160_1 = var_160_1 + var_160_6

		if arg_160_1 <= math.ceil(var_160_1) then
			var_160_2 = var_160_0

			break
		end
	end

	if var_160_2 == 0 or var_160_3 < var_160_2 then
		return arg_160_0
	end

	return string.sub(arg_160_0, 1, var_160_2 - 1) .. ".."
end

function shouldShortenString(arg_161_0, arg_161_1)
	local var_161_0 = 1
	local var_161_1 = 0
	local var_161_2 = 0
	local var_161_3 = #arg_161_0

	while var_161_0 <= var_161_3 do
		local var_161_4 = string.byte(arg_161_0, var_161_0)
		local var_161_5, var_161_6 = GetPerceptualSize(var_161_4)

		var_161_0 = var_161_0 + var_161_5
		var_161_1 = var_161_1 + var_161_6

		if arg_161_1 <= math.ceil(var_161_1) then
			var_161_2 = var_161_0

			break
		end
	end

	if var_161_2 == 0 or var_161_3 < var_161_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_162_0, arg_162_1, arg_162_2, arg_162_3)
	local var_162_0 = true
	local var_162_1, var_162_2 = utf8_to_unicode(arg_162_0)
	local var_162_3 = filterEgyUnicode(filterSpecChars(arg_162_0))
	local var_162_4 = wordVer(arg_162_0)

	if not checkSpaceValid(arg_162_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_162_3[1]))

		var_162_0 = false
	elseif var_162_4 > 0 or var_162_3 ~= arg_162_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_162_3[4]))

		var_162_0 = false
	elseif var_162_2 < arg_162_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_162_3[2]))

		var_162_0 = false
	elseif arg_162_2 < var_162_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_162_3[3]))

		var_162_0 = false
	end

	return var_162_0
end

function checkSpaceValid(arg_163_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_163_0 = string.gsub(arg_163_0, " ", "")

	return arg_163_0 == string.gsub(var_163_0, "　", "")
end

function filterSpecChars(arg_164_0)
	local var_164_0 = {}
	local var_164_1 = 0
	local var_164_2 = 0
	local var_164_3 = 0
	local var_164_4 = 1

	while var_164_4 <= #arg_164_0 do
		local var_164_5 = string.byte(arg_164_0, var_164_4)

		if not var_164_5 then
			break
		end

		if var_164_5 >= 48 and var_164_5 <= 57 or var_164_5 >= 65 and var_164_5 <= 90 or var_164_5 == 95 or var_164_5 >= 97 and var_164_5 <= 122 then
			table.insert(var_164_0, string.char(var_164_5))
		elseif var_164_5 >= 228 and var_164_5 <= 233 then
			local var_164_6 = string.byte(arg_164_0, var_164_4 + 1)
			local var_164_7 = string.byte(arg_164_0, var_164_4 + 2)

			if var_164_6 and var_164_7 and var_164_6 >= 128 and var_164_6 <= 191 and var_164_7 >= 128 and var_164_7 <= 191 then
				var_164_4 = var_164_4 + 2

				table.insert(var_164_0, string.char(var_164_5, var_164_6, var_164_7))

				var_164_1 = var_164_1 + 1
			end
		elseif var_164_5 == 45 or var_164_5 == 40 or var_164_5 == 41 then
			table.insert(var_164_0, string.char(var_164_5))
		elseif var_164_5 == 194 then
			local var_164_8 = string.byte(arg_164_0, var_164_4 + 1)

			if var_164_8 == 183 then
				var_164_4 = var_164_4 + 1

				table.insert(var_164_0, string.char(var_164_5, var_164_8))

				var_164_1 = var_164_1 + 1
			end
		elseif var_164_5 == 239 then
			local var_164_9 = string.byte(arg_164_0, var_164_4 + 1)
			local var_164_10 = string.byte(arg_164_0, var_164_4 + 2)

			if var_164_9 == 188 and (var_164_10 == 136 or var_164_10 == 137) then
				var_164_4 = var_164_4 + 2

				table.insert(var_164_0, string.char(var_164_5, var_164_9, var_164_10))

				var_164_1 = var_164_1 + 1
			end
		elseif var_164_5 == 206 or var_164_5 == 207 then
			local var_164_11 = string.byte(arg_164_0, var_164_4 + 1)

			if var_164_5 == 206 and var_164_11 >= 177 or var_164_5 == 207 and var_164_11 <= 134 then
				var_164_4 = var_164_4 + 1

				table.insert(var_164_0, string.char(var_164_5, var_164_11))

				var_164_1 = var_164_1 + 1
			end
		elseif var_164_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_164_12 = string.byte(arg_164_0, var_164_4 + 1)
			local var_164_13 = string.byte(arg_164_0, var_164_4 + 2)

			if var_164_12 and var_164_13 and var_164_12 > 128 and var_164_12 <= 191 and var_164_13 >= 128 and var_164_13 <= 191 then
				var_164_4 = var_164_4 + 2

				table.insert(var_164_0, string.char(var_164_5, var_164_12, var_164_13))

				var_164_2 = var_164_2 + 1
			end
		elseif var_164_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_164_14 = string.byte(arg_164_0, var_164_4 + 1)
			local var_164_15 = string.byte(arg_164_0, var_164_4 + 2)

			if var_164_14 and var_164_15 and var_164_14 >= 128 and var_164_14 <= 191 and var_164_15 >= 128 and var_164_15 <= 191 then
				var_164_4 = var_164_4 + 2

				table.insert(var_164_0, string.char(var_164_5, var_164_14, var_164_15))

				var_164_3 = var_164_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_164_4 ~= 1 and var_164_5 == 32 and string.byte(arg_164_0, var_164_4 + 1) ~= 32 then
				table.insert(var_164_0, string.char(var_164_5))
			end

			if var_164_5 >= 192 and var_164_5 <= 223 then
				local var_164_16 = string.byte(arg_164_0, var_164_4 + 1)

				var_164_4 = var_164_4 + 1

				if var_164_5 == 194 and var_164_16 and var_164_16 >= 128 then
					table.insert(var_164_0, string.char(var_164_5, var_164_16))
				elseif var_164_5 == 195 and var_164_16 and var_164_16 <= 191 then
					table.insert(var_164_0, string.char(var_164_5, var_164_16))
				end
			end
		end

		var_164_4 = var_164_4 + 1
	end

	return table.concat(var_164_0), var_164_1 + var_164_2 + var_164_3
end

function filterEgyUnicode(arg_165_0)
	arg_165_0 = string.gsub(arg_165_0, "�[�-�][�-�]", "")
	arg_165_0 = string.gsub(arg_165_0, "�[�-�]", "")

	return arg_165_0
end

function shiftPanel(arg_166_0, arg_166_1, arg_166_2, arg_166_3, arg_166_4, arg_166_5, arg_166_6, arg_166_7, arg_166_8)
	arg_166_3 = arg_166_3 or 0.2

	if arg_166_5 then
		LeanTween.cancel(go(arg_166_0))
	end

	local var_166_0 = rtf(arg_166_0)

	arg_166_1 = arg_166_1 or var_166_0.anchoredPosition.x
	arg_166_2 = arg_166_2 or var_166_0.anchoredPosition.y

	local var_166_1 = LeanTween.move(var_166_0, Vector3(arg_166_1, arg_166_2, 0), arg_166_3)

	arg_166_7 = arg_166_7 or LeanTweenType.easeInOutSine

	var_166_1:setEase(arg_166_7)

	if arg_166_4 then
		var_166_1:setDelay(arg_166_4)
	end

	if arg_166_6 then
		GetOrAddComponent(arg_166_0, "CanvasGroup").blocksRaycasts = false
	end

	var_166_1:setOnComplete(System.Action(function()
		if arg_166_8 then
			arg_166_8()
		end

		if arg_166_6 then
			GetOrAddComponent(arg_166_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_166_1
end

function TweenValue(arg_168_0, arg_168_1, arg_168_2, arg_168_3, arg_168_4, arg_168_5, arg_168_6, arg_168_7)
	local var_168_0 = LeanTween.value(go(arg_168_0), arg_168_1, arg_168_2, arg_168_3):setOnUpdate(System.Action_float(function(arg_169_0)
		if arg_168_5 then
			arg_168_5(arg_169_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_168_6 then
			arg_168_6()
		end
	end)):setDelay(arg_168_4 or 0)

	if arg_168_7 and arg_168_7 > 0 then
		var_168_0:setRepeat(arg_168_7)
	end

	return var_168_0
end

function rotateAni(arg_171_0, arg_171_1, arg_171_2)
	return LeanTween.rotate(rtf(arg_171_0), 360 * arg_171_1, arg_171_2):setLoopClamp()
end

function blinkAni(arg_172_0, arg_172_1, arg_172_2, arg_172_3)
	return LeanTween.alpha(rtf(arg_172_0), arg_172_3 or 0, arg_172_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_172_2 or 0)
end

function scaleAni(arg_173_0, arg_173_1, arg_173_2, arg_173_3)
	return LeanTween.scale(rtf(arg_173_0), arg_173_3 or 0, arg_173_1):setLoopPingPong(arg_173_2 or 0)
end

function floatAni(arg_174_0, arg_174_1, arg_174_2, arg_174_3)
	local var_174_0 = arg_174_0.localPosition.y + arg_174_1

	return LeanTween.moveY(rtf(arg_174_0), var_174_0, arg_174_2):setLoopPingPong(arg_174_3 or 0)
end

local var_0_11 = tostring

function tostring(arg_175_0)
	if arg_175_0 == nil then
		return "nil"
	end

	local var_175_0 = var_0_11(arg_175_0)

	if var_175_0 == nil then
		if type(arg_175_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_175_0
end

function wordVer(arg_176_0, arg_176_1)
	if arg_176_0.match(arg_176_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_176_0
	end

	arg_176_1 = arg_176_1 or {}

	local var_176_0 = filterEgyUnicode(arg_176_0)

	if #var_176_0 ~= #arg_176_0 then
		if arg_176_1.isReplace then
			arg_176_0 = var_176_0
		else
			return 1
		end
	end

	local var_176_1 = wordSplit(arg_176_0)
	local var_176_2 = pg.word_template
	local var_176_3 = pg.word_legal_template

	arg_176_1.isReplace = arg_176_1.isReplace or false
	arg_176_1.replaceWord = arg_176_1.replaceWord or "*"

	local var_176_4 = #var_176_1
	local var_176_5 = 1
	local var_176_6 = ""
	local var_176_7 = 0

	while var_176_5 <= var_176_4 do
		local var_176_8, var_176_9, var_176_10 = wordLegalMatch(var_176_1, var_176_3, var_176_5)

		if var_176_8 then
			var_176_5 = var_176_9
			var_176_6 = var_176_6 .. var_176_10
		else
			local var_176_11, var_176_12, var_176_13 = wordVerMatch(var_176_1, var_176_2, arg_176_1, var_176_5, "", false, var_176_5, "")

			if var_176_11 then
				var_176_5 = var_176_12
				var_176_7 = var_176_7 + 1

				if arg_176_1.isReplace then
					var_176_6 = var_176_6 .. var_176_13
				end
			else
				if arg_176_1.isReplace then
					var_176_6 = var_176_6 .. var_176_1[var_176_5]
				end

				var_176_5 = var_176_5 + 1
			end
		end
	end

	if arg_176_1.isReplace then
		return var_176_7, var_176_6
	else
		return var_176_7
	end
end

function wordLegalMatch(arg_177_0, arg_177_1, arg_177_2, arg_177_3, arg_177_4)
	if arg_177_2 > #arg_177_0 then
		return arg_177_3, arg_177_2, arg_177_4
	end

	local var_177_0 = arg_177_0[arg_177_2]
	local var_177_1 = arg_177_1[var_177_0]

	arg_177_4 = arg_177_4 == nil and "" or arg_177_4

	if var_177_1 then
		if var_177_1.this then
			return wordLegalMatch(arg_177_0, var_177_1, arg_177_2 + 1, true, arg_177_4 .. var_177_0)
		else
			return wordLegalMatch(arg_177_0, var_177_1, arg_177_2 + 1, false, arg_177_4 .. var_177_0)
		end
	else
		return arg_177_3, arg_177_2, arg_177_4
	end
end

local var_0_12 = string.byte("a")
local var_0_13 = string.byte("z")
local var_0_14 = string.byte("A")
local var_0_15 = string.byte("Z")

local function var_0_16(arg_178_0)
	if not arg_178_0 then
		return arg_178_0
	end

	local var_178_0 = string.byte(arg_178_0)

	if var_178_0 > 128 then
		return
	end

	if var_178_0 >= var_0_12 and var_178_0 <= var_0_13 then
		return string.char(var_178_0 - 32)
	elseif var_178_0 >= var_0_14 and var_178_0 <= var_0_15 then
		return string.char(var_178_0 + 32)
	else
		return arg_178_0
	end
end

function wordVerMatch(arg_179_0, arg_179_1, arg_179_2, arg_179_3, arg_179_4, arg_179_5, arg_179_6, arg_179_7)
	if arg_179_3 > #arg_179_0 then
		return arg_179_5, arg_179_6, arg_179_7
	end

	local var_179_0 = arg_179_0[arg_179_3]
	local var_179_1 = arg_179_1[var_179_0]

	if var_179_1 then
		local var_179_2, var_179_3, var_179_4 = wordVerMatch(arg_179_0, var_179_1, arg_179_2, arg_179_3 + 1, arg_179_2.isReplace and arg_179_4 .. arg_179_2.replaceWord or arg_179_4, var_179_1.this or arg_179_5, var_179_1.this and arg_179_3 + 1 or arg_179_6, var_179_1.this and (arg_179_2.isReplace and arg_179_4 .. arg_179_2.replaceWord or arg_179_4) or arg_179_7)

		if var_179_2 then
			return var_179_2, var_179_3, var_179_4
		end
	end

	local var_179_5 = var_0_16(var_179_0)
	local var_179_6 = arg_179_1[var_179_5]

	if var_179_5 ~= var_179_0 and var_179_6 then
		local var_179_7, var_179_8, var_179_9 = wordVerMatch(arg_179_0, var_179_6, arg_179_2, arg_179_3 + 1, arg_179_2.isReplace and arg_179_4 .. arg_179_2.replaceWord or arg_179_4, var_179_6.this or arg_179_5, var_179_6.this and arg_179_3 + 1 or arg_179_6, var_179_6.this and (arg_179_2.isReplace and arg_179_4 .. arg_179_2.replaceWord or arg_179_4) or arg_179_7)

		if var_179_7 then
			return var_179_7, var_179_8, var_179_9
		end
	end

	return arg_179_5, arg_179_6, arg_179_7
end

function wordSplit(arg_180_0)
	local var_180_0 = {}

	for iter_180_0 in arg_180_0.gmatch(arg_180_0, "[\x01-\x7F�-�][�-�]*") do
		var_180_0[#var_180_0 + 1] = iter_180_0
	end

	return var_180_0
end

function contentWrap(arg_181_0, arg_181_1, arg_181_2)
	local var_181_0 = LuaHelper.WrapContent(arg_181_0, arg_181_1, arg_181_2)

	return #var_181_0 ~= #arg_181_0, var_181_0
end

function cancelRich(arg_182_0)
	local var_182_0

	for iter_182_0 = 1, 20 do
		local var_182_1

		arg_182_0, var_182_1 = string.gsub(arg_182_0, "<([^>]*)>", "%1")

		if var_182_1 <= 0 then
			break
		end
	end

	return arg_182_0
end

function cancelColorRich(arg_183_0)
	local var_183_0

	for iter_183_0 = 1, 20 do
		local var_183_1

		arg_183_0, var_183_1 = string.gsub(arg_183_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_183_1 <= 0 then
			break
		end
	end

	return arg_183_0
end

function getSkillConfig(arg_184_0)
	local var_184_0 = pg.buffCfg["buff_" .. arg_184_0]

	if not var_184_0 then
		return
	end

	local var_184_1 = Clone(var_184_0)

	var_184_1.name = getSkillName(arg_184_0)
	var_184_1.desc = HXSet.hxLan(var_184_1.desc)
	var_184_1.desc_get = HXSet.hxLan(var_184_1.desc_get)

	_.each(var_184_1, function(arg_185_0)
		arg_185_0.desc = HXSet.hxLan(arg_185_0.desc)
	end)

	return var_184_1
end

function getSkillName(arg_186_0)
	local var_186_0 = pg.skill_data_template[arg_186_0] or pg.skill_data_display[arg_186_0]

	if var_186_0 then
		return HXSet.hxLan(var_186_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_187_0, arg_187_1)
	local var_187_0 = arg_187_1 and pg.skill_world_display[arg_187_0] and setmetatable({}, {
		__index = function(arg_188_0, arg_188_1)
			return pg.skill_world_display[arg_187_0][arg_188_1] or pg.skill_data_template[arg_187_0][arg_188_1]
		end
	}) or pg.skill_data_template[arg_187_0]

	if not var_187_0 then
		return ""
	end

	local var_187_1 = var_187_0.desc_get ~= "" and var_187_0.desc_get or var_187_0.desc

	for iter_187_0, iter_187_1 in pairs(var_187_0.desc_get_add) do
		local var_187_2 = setColorStr(iter_187_1[1], COLOR_GREEN)

		if iter_187_1[2] then
			var_187_2 = var_187_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_187_1[2], COLOR_GREEN))
		end

		var_187_1 = specialGSub(var_187_1, "$" .. iter_187_0, var_187_2)
	end

	return HXSet.hxLan(var_187_1)
end

function getSkillDescLearn(arg_189_0, arg_189_1, arg_189_2)
	local var_189_0 = arg_189_2 and pg.skill_world_display[arg_189_0] and setmetatable({}, {
		__index = function(arg_190_0, arg_190_1)
			return pg.skill_world_display[arg_189_0][arg_190_1] or pg.skill_data_template[arg_189_0][arg_190_1]
		end
	}) or pg.skill_data_template[arg_189_0]

	if not var_189_0 then
		return ""
	end

	local var_189_1 = var_189_0.desc

	if not var_189_0.desc_add then
		return HXSet.hxLan(var_189_1)
	end

	for iter_189_0, iter_189_1 in pairs(var_189_0.desc_add) do
		local var_189_2 = iter_189_1[arg_189_1][1]

		if iter_189_1[arg_189_1][2] then
			var_189_2 = var_189_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_189_1[arg_189_1][2])
		end

		var_189_1 = specialGSub(var_189_1, "$" .. iter_189_0, setColorStr(var_189_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_189_1)
end

function getSkillDesc(arg_191_0, arg_191_1, arg_191_2)
	local var_191_0 = arg_191_2 and pg.skill_world_display[arg_191_0] and setmetatable({}, {
		__index = function(arg_192_0, arg_192_1)
			return pg.skill_world_display[arg_191_0][arg_192_1] or pg.skill_data_template[arg_191_0][arg_192_1]
		end
	}) or pg.skill_data_template[arg_191_0]

	if not var_191_0 then
		return ""
	end

	local var_191_1 = var_191_0.desc

	if not var_191_0.desc_add then
		return HXSet.hxLan(var_191_1)
	end

	for iter_191_0, iter_191_1 in pairs(var_191_0.desc_add) do
		local var_191_2 = setColorStr(iter_191_1[arg_191_1][1], COLOR_GREEN)

		var_191_1 = specialGSub(var_191_1, "$" .. iter_191_0, var_191_2)
	end

	return HXSet.hxLan(var_191_1)
end

function specialGSub(arg_193_0, arg_193_1, arg_193_2)
	arg_193_0 = string.gsub(arg_193_0, "<color=#", "<color=NNN")
	arg_193_0 = string.gsub(arg_193_0, "#", "")
	arg_193_2 = string.gsub(arg_193_2, "%%", "%%%%")
	arg_193_0 = string.gsub(arg_193_0, arg_193_1, arg_193_2)
	arg_193_0 = string.gsub(arg_193_0, "<color=NNN", "<color=#")

	return arg_193_0
end

function topAnimation(arg_194_0, arg_194_1, arg_194_2, arg_194_3, arg_194_4, arg_194_5)
	local var_194_0 = {}

	arg_194_4 = arg_194_4 or 0.27

	local var_194_1 = 0.05

	if arg_194_0 then
		local var_194_2 = arg_194_0.transform.localPosition.x

		setAnchoredPosition(arg_194_0, {
			x = var_194_2 - 500
		})
		shiftPanel(arg_194_0, var_194_2, nil, 0.05, arg_194_4, true, true)
		setActive(arg_194_0, true)
	end

	setActive(arg_194_1, false)
	setActive(arg_194_2, false)
	setActive(arg_194_3, false)

	for iter_194_0 = 1, 3 do
		table.insert(var_194_0, LeanTween.delayedCall(arg_194_4 + 0.13 + var_194_1 * iter_194_0, System.Action(function()
			if arg_194_1 then
				setActive(arg_194_1, not arg_194_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_194_0, LeanTween.delayedCall(arg_194_4 + 0.02 + var_194_1 * iter_194_0, System.Action(function()
			if arg_194_2 then
				setActive(arg_194_2, not go(arg_194_2).activeSelf)
			end

			if arg_194_2 then
				setActive(arg_194_3, not go(arg_194_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_194_5 then
		table.insert(var_194_0, LeanTween.delayedCall(arg_194_4 + 0.13 + var_194_1 * 3 + 0.1, System.Action(function()
			arg_194_5()
		end)).uniqueId)
	end

	return var_194_0
end

function cancelTweens(arg_198_0)
	assert(arg_198_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_198_0, iter_198_1 in ipairs(arg_198_0) do
		if iter_198_1 then
			LeanTween.cancel(iter_198_1)
		end
	end
end

function getOfflineTimeStamp(arg_199_0)
	local var_199_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_199_0
	local var_199_1 = ""

	if var_199_0 <= 59 then
		var_199_1 = i18n("just_now")
	elseif var_199_0 <= 3599 then
		var_199_1 = i18n("several_minutes_before", math.floor(var_199_0 / 60))
	elseif var_199_0 <= 86399 then
		var_199_1 = i18n("several_hours_before", math.floor(var_199_0 / 3600))
	else
		var_199_1 = i18n("several_days_before", math.floor(var_199_0 / 86400))
	end

	return var_199_1
end

function playMovie(arg_200_0, arg_200_1, arg_200_2)
	local var_200_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_200_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_200_0, function(arg_201_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_201_0 = GCHandle.Alloc(arg_201_0, GCHandleType.Pinned)

			setActive(var_200_0, true)

			local var_201_1 = var_200_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_201_1.player:SetData(arg_201_0, arg_201_0.Length)

			var_201_1.target = var_200_0:GetComponent(typeof(Image))
			var_201_1.loop = false
			var_201_1.additiveMode = false
			var_201_1.playOnStart = true

			local var_201_2

			var_201_2 = Timer.New(function()
				if var_201_1.player.status == CriMana.Player.Status.PlayEnd or var_201_1.player.status == CriMana.Player.Status.Stop or var_201_1.player.status == CriMana.Player.Status.Error then
					var_201_2:Stop()
					Object.Destroy(var_201_1)
					GCHandle.Free(var_201_0)
					setActive(var_200_0, false)

					if arg_200_1 then
						arg_200_1()
					end
				end
			end, 0.2, -1)

			var_201_2:Start()
			removeOnButton(var_200_0)

			if arg_200_2 then
				onButton(nil, var_200_0, function()
					var_201_1:Stop()
					GetOrAddComponent(var_200_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_200_1 then
		arg_200_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_204_0)
	if PaintCameraAdjustOn ~= arg_204_0 then
		local var_204_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_204_0 then
			var_204_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_204_0.matchWidthOrHeight = 1
		else
			var_204_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		pg.CameraFixMgr.GetInstance():BlockCameraRatioControll(arg_204_0)

		PaintCameraAdjustOn = arg_204_0
	end
end

function ManhattonDist(arg_205_0, arg_205_1)
	return math.abs(arg_205_0.row - arg_205_1.row) + math.abs(arg_205_0.column - arg_205_1.column)
end

function checkFirstHelpShow(arg_206_0)
	local var_206_0 = getProxy(SettingsProxy)

	if not var_206_0:checkReadHelp(arg_206_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_206_0].tip
		})
		var_206_0:recordReadHelp(arg_206_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_207_0)
	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_208_0)
	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_208_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_210_0, arg_210_1)
	if arg_210_0 == nil then
		return
	end

	arg_210_0:GetComponent("NotchAdapt").enabled = arg_210_1
end

function comma_value(arg_211_0)
	local var_211_0 = arg_211_0
	local var_211_1 = 0

	repeat
		local var_211_2

		var_211_0, var_211_2 = string.gsub(var_211_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_211_2 == 0

	return var_211_0
end

local var_0_17 = 0.2

function SwitchPanel(arg_212_0, arg_212_1, arg_212_2, arg_212_3, arg_212_4, arg_212_5)
	arg_212_3 = defaultValue(arg_212_3, var_0_17)

	if arg_212_5 then
		LeanTween.cancel(go(arg_212_0))
	end

	local var_212_0 = Vector3.New(tf(arg_212_0).localPosition.x, tf(arg_212_0).localPosition.y, tf(arg_212_0).localPosition.z)

	if arg_212_1 then
		var_212_0.x = arg_212_1
	end

	if arg_212_2 then
		var_212_0.y = arg_212_2
	end

	local var_212_1 = LeanTween.move(rtf(arg_212_0), var_212_0, arg_212_3):setEase(LeanTweenType.easeInOutSine)

	if arg_212_4 then
		var_212_1:setDelay(arg_212_4)
	end

	return var_212_1
end

function updateActivityTaskStatus(arg_213_0)
	local var_213_0 = arg_213_0:getConfig("config_id")
	local var_213_1, var_213_2 = getActivityTask(arg_213_0, true)

	if not var_213_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_213_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_214_0)
	local var_214_0 = getProxy(TaskProxy)
	local var_214_1 = arg_214_0:getNDay()
	local var_214_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_214_0:getStartTime())

	for iter_214_0, iter_214_1 in ipairs(arg_214_0:getConfig("config_data")) do
		local var_214_3 = pg.battlepass_task_group[iter_214_1]

		if var_214_3 and var_214_2 >= var_214_3.group_mask then
			if underscore.any(underscore.flatten(var_214_3.task_group), function(arg_215_0)
				return var_214_0:getTaskVO(arg_215_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD, {
					cmd = 1,
					activity_id = arg_214_0.id
				})

				return true
			end
		elseif not var_214_3 then
			warning("battlepass_task_group表中不存在 id = " .. iter_214_1)
		end
	end

	return false
end

function setShipCardFrame(arg_216_0, arg_216_1, arg_216_2)
	arg_216_0.localScale = Vector3.one
	arg_216_0.anchorMin = Vector2.zero
	arg_216_0.anchorMax = Vector2.one

	local var_216_0 = arg_216_2 or arg_216_1

	GetImageSpriteFromAtlasAsync("shipframe", var_216_0, arg_216_0)

	local var_216_1 = pg.frame_resource[var_216_0]

	if var_216_1 then
		local var_216_2 = var_216_1.param

		arg_216_0.offsetMin = Vector2(var_216_2[1], var_216_2[2])
		arg_216_0.offsetMax = Vector2(var_216_2[3], var_216_2[4])
	else
		arg_216_0.offsetMin = Vector2.zero
		arg_216_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_217_0, arg_217_1, arg_217_2)
	arg_217_0.localScale = Vector3.one
	arg_217_0.anchorMin = Vector2.zero
	arg_217_0.anchorMax = Vector2.one

	setImageSprite(arg_217_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_217_2 or arg_217_1)))

	local var_217_0 = "b" .. (arg_217_2 or arg_217_1)
	local var_217_1 = pg.frame_resource[var_217_0]

	if var_217_1 then
		local var_217_2 = var_217_1.param

		arg_217_0.offsetMin = Vector2(var_217_2[1], var_217_2[2])
		arg_217_0.offsetMax = Vector2(var_217_2[3], var_217_2[4])
	else
		arg_217_0.offsetMin = Vector2.zero
		arg_217_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_218_0, arg_218_1)
	if arg_218_1 then
		local var_218_0 = arg_218_1 .. "(Clone)"
		local var_218_1 = false

		eachChild(arg_218_0, function(arg_219_0)
			setActive(arg_219_0, arg_219_0.name == var_218_0)

			var_218_1 = var_218_1 or arg_219_0.name == var_218_0
		end)

		if not var_218_1 then
			LoadAndInstantiateAsync("effect", arg_218_1, function(arg_220_0)
				if IsNil(arg_218_0) or findTF(arg_218_0, var_218_0) then
					Object.Destroy(arg_220_0)
				else
					setParent(arg_220_0, arg_218_0)
					setActive(arg_220_0, true)
				end
			end)
		end
	end

	setActive(arg_218_0, arg_218_1)
end

function setProposeMarkIcon(arg_221_0, arg_221_1)
	local var_221_0 = arg_221_0:Find("proposeShipCard(Clone)")
	local var_221_1 = arg_221_1.propose and not arg_221_1:ShowPropose()

	if var_221_0 then
		setActive(var_221_0, var_221_1)
	elseif var_221_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_222_0)
			if IsNil(arg_221_0) or arg_221_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_222_0)
			else
				setParent(arg_222_0, arg_221_0, false)
			end
		end)
	end
end

function flushShipCard(arg_223_0, arg_223_1)
	local var_223_0 = arg_223_1:rarity2bgPrint()
	local var_223_1 = findTF(arg_223_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_223_0, "", var_223_1)

	local var_223_2 = findTF(arg_223_0, "content/ship_icon")
	local var_223_3 = arg_223_1 and {
		"shipYardIcon/" .. arg_223_1:getPainting(),
		arg_223_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_223_3[1], var_223_3[2], var_223_2)

	local var_223_4 = arg_223_1:getShipType()
	local var_223_5 = findTF(arg_223_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_223_4), var_223_5)
	setText(findTF(arg_223_0, "content/dockyard/lv/Text"), defaultValue(arg_223_1.level, 1))

	local var_223_6 = arg_223_1:getStar()
	local var_223_7 = arg_223_1:getMaxStar()
	local var_223_8 = findTF(arg_223_0, "content/front/stars")

	setActive(var_223_8, true)

	local var_223_9 = findTF(var_223_8, "star_tpl")
	local var_223_10 = var_223_8.childCount

	for iter_223_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_223_11 = var_223_10 < iter_223_0 and cloneTplTo(var_223_9, var_223_8) or var_223_8:GetChild(iter_223_0 - 1)

		setActive(var_223_11, iter_223_0 <= var_223_7)
		triggerToggle(var_223_11, iter_223_0 <= var_223_6)
	end

	local var_223_12 = findTF(arg_223_0, "content/front/frame")
	local var_223_13, var_223_14 = arg_223_1:GetFrameAndEffect()

	setShipCardFrame(var_223_12, var_223_0, var_223_13)
	setFrameEffect(findTF(arg_223_0, "content/front/bg_other"), var_223_14)
	setProposeMarkIcon(arg_223_0:Find("content/dockyard/propose"), arg_223_1)
end

function TweenItemAlphaAndWhite(arg_224_0)
	LeanTween.cancel(arg_224_0)

	local var_224_0 = GetOrAddComponent(arg_224_0, "CanvasGroup")

	var_224_0.alpha = 0

	LeanTween.alphaCanvas(var_224_0, 1, 0.2):setUseEstimatedTime(true)

	local var_224_1 = findTF(arg_224_0.transform, "white_mask")

	if var_224_1 then
		setActive(var_224_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_225_0)
	LeanTween.cancel(arg_225_0)

	GetOrAddComponent(arg_225_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_226_0)
	local var_226_0 = {}
	local var_226_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_226_2 = getProxy(CollectionProxy):getShipGroup(arg_226_0)

	if var_226_2 then
		local var_226_3 = ShipGroup.getSkinList(arg_226_0)

		for iter_226_0, iter_226_1 in ipairs(var_226_3) do
			if iter_226_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_226_1, iter_226_1.id) or iter_226_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_226_2.trans or iter_226_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_226_2.married == 1 then
				var_226_0[iter_226_1.id] = true
			end
		end
	end

	return var_226_0
end

function split(arg_227_0, arg_227_1)
	local var_227_0 = {}

	if not arg_227_0 then
		return nil
	end

	local var_227_1 = #arg_227_0
	local var_227_2 = 1

	while var_227_2 <= var_227_1 do
		local var_227_3 = string.find(arg_227_0, arg_227_1, var_227_2)

		if var_227_3 == nil then
			table.insert(var_227_0, string.sub(arg_227_0, var_227_2, var_227_1))

			break
		end

		table.insert(var_227_0, string.sub(arg_227_0, var_227_2, var_227_3 - 1))

		if var_227_3 == var_227_1 then
			table.insert(var_227_0, "")

			break
		end

		var_227_2 = var_227_3 + 1
	end

	return var_227_0
end

function NumberToChinese(arg_228_0, arg_228_1)
	local var_228_0 = ""
	local var_228_1 = #arg_228_0

	for iter_228_0 = 1, var_228_1 do
		local var_228_2 = string.sub(arg_228_0, iter_228_0, iter_228_0)

		if var_228_2 ~= "0" or var_228_2 == "0" and not arg_228_1 then
			if arg_228_1 then
				if var_228_1 >= 2 then
					if iter_228_0 == 1 then
						if var_228_2 == "1" then
							var_228_0 = i18n("number_" .. 10)
						else
							var_228_0 = i18n("number_" .. var_228_2) .. i18n("number_" .. 10)
						end
					else
						var_228_0 = var_228_0 .. i18n("number_" .. var_228_2)
					end
				else
					var_228_0 = var_228_0 .. i18n("number_" .. var_228_2)
				end
			else
				var_228_0 = var_228_0 .. i18n("number_" .. var_228_2)
			end
		end
	end

	return var_228_0
end

function getActivityTask(arg_229_0, arg_229_1)
	local var_229_0 = getProxy(TaskProxy)
	local var_229_1 = arg_229_0:getConfig("config_data")
	local var_229_2 = arg_229_0:getNDay(arg_229_0.data1)
	local var_229_3
	local var_229_4
	local var_229_5

	for iter_229_0 = math.max(arg_229_0.data3, 1), math.min(var_229_2, #var_229_1) do
		local var_229_6 = _.flatten({
			var_229_1[iter_229_0]
		})

		for iter_229_1, iter_229_2 in ipairs(var_229_6) do
			local var_229_7 = var_229_0:getTaskById(iter_229_2)

			if var_229_7 then
				return var_229_7.id, var_229_7
			end

			if var_229_4 then
				var_229_5 = var_229_0:getFinishTaskById(iter_229_2)

				if var_229_5 then
					var_229_4 = var_229_5
				elseif arg_229_1 then
					return iter_229_2
				else
					return var_229_4.id, var_229_4
				end
			else
				var_229_4 = var_229_0:getFinishTaskById(iter_229_2)
				var_229_5 = var_229_5 or iter_229_2
			end
		end
	end

	if var_229_4 then
		return var_229_4.id, var_229_4
	else
		return var_229_5
	end
end

function setImageFromImage(arg_230_0, arg_230_1, arg_230_2)
	local var_230_0 = GetComponent(arg_230_0, "Image")

	var_230_0.sprite = GetComponent(arg_230_1, "Image").sprite

	if arg_230_2 then
		var_230_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_231_0)
	local var_231_0, var_231_1, var_231_2, var_231_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_231_0)

	if var_231_0 >= 1 then
		return i18n("limit_skin_time_day", var_231_0)
	elseif var_231_0 <= 0 and var_231_1 > 0 then
		return i18n("limit_skin_time_day_min", var_231_1, var_231_2)
	elseif var_231_0 <= 0 and var_231_1 <= 0 and (var_231_2 > 0 or var_231_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_231_2, 1))
	elseif var_231_0 <= 0 and var_231_1 <= 0 and var_231_2 <= 0 and var_231_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_232_0)
	local var_232_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_232_1 = math.max(arg_232_0 - var_232_0, 0)
	local var_232_2 = math.floor(var_232_1 / 86400)

	if var_232_2 > 0 then
		return i18n("time_remaining_tip") .. var_232_2 .. i18n("word_date")
	else
		local var_232_3 = math.floor(var_232_1 / 3600)

		if var_232_3 > 0 then
			return i18n("time_remaining_tip") .. var_232_3 .. i18n("word_hour")
		else
			local var_232_4 = math.floor(var_232_1 / 60)

			if var_232_4 > 0 then
				return i18n("time_remaining_tip") .. var_232_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_232_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_233_0)
	local var_233_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_233_0
	local var_233_1 = var_233_0 / 86400

	if var_233_1 > 1 then
		return i18n("ins_word_day", math.floor(var_233_1))
	else
		local var_233_2 = var_233_0 / 3600

		if var_233_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_233_2))
		else
			local var_233_3 = var_233_0 / 60

			if var_233_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_233_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_234_0)
	local var_234_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_234_0
	local var_234_1 = var_234_0 / 86400

	if var_234_1 > 1 then
		return i18n1(math.floor(var_234_1) .. "d")
	else
		local var_234_2 = var_234_0 / 3600

		if var_234_2 > 1 then
			return i18n1(math.floor(var_234_2) .. "h")
		else
			local var_234_3 = var_234_0 / 60

			if var_234_3 > 1 then
				return i18n1(math.floor(var_234_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_235_0)
	local var_235_0, var_235_1, var_235_2, var_235_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_235_0)

	if var_235_0 <= 0 and var_235_1 <= 0 and var_235_2 <= 0 and var_235_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_235_0, var_235_1, var_235_2)
	end
end

function checkExist(arg_236_0, ...)
	local var_236_0 = {
		...
	}

	for iter_236_0, iter_236_1 in ipairs(var_236_0) do
		if arg_236_0 == nil then
			break
		end

		assert(type(arg_236_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_236_1) == "table", "type error : param should be table")

		if type(arg_236_0[iter_236_1[1]]) == "function" then
			arg_236_0 = arg_236_0[iter_236_1[1]](arg_236_0, unpack(iter_236_1[2] or {}))
		else
			arg_236_0 = arg_236_0[iter_236_1[1]]
		end
	end

	return arg_236_0
end

function AcessWithinNull(arg_237_0, arg_237_1)
	if arg_237_0 == nil then
		return
	end

	assert(type(arg_237_0) == "table")

	return arg_237_0[arg_237_1]
end

function showRepairMsgbox()
	local var_238_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_238_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_238_2 = {
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
			var_238_2,
			var_238_1,
			var_238_0
		}
	})
end

function resourceVerify(arg_242_0, arg_242_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_242_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_242_1
	local var_242_2 = PathMgr.ReadAllLines(var_242_0)
	local var_242_3 = {}

	if arg_242_0 then
		setActive(arg_242_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_242_4()
		if arg_242_0 then
			setActive(arg_242_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_242_1)

		if var_242_1 then
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

	local var_242_5 = var_242_2.Length
	local var_242_6

	local function var_242_7(arg_245_0)
		if arg_245_0 < 0 then
			var_242_4()

			return
		end

		if arg_242_1 then
			setSlider(arg_242_1, 0, var_242_5, var_242_5 - arg_245_0)
		end

		local var_245_0 = string.split(var_242_2[arg_245_0], ",")
		local var_245_1 = var_245_0[1]
		local var_245_2 = var_245_0[3]
		local var_245_3 = PathMgr.getAssetBundle(var_245_1)

		if PathMgr.FileExists(var_245_3) then
			local var_245_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_245_1))

			if var_245_2 == HashUtil.CalcMD5(var_245_4) then
				onNextTick(function()
					var_242_7(arg_245_0 - 1)
				end)

				return
			end
		end

		var_242_1 = var_245_1

		var_242_4()
	end

	var_242_7(var_242_5 - 1)
end

function splitByWordEN(arg_247_0, arg_247_1)
	local var_247_0 = string.split(arg_247_0, " ")
	local var_247_1 = ""
	local var_247_2 = ""
	local var_247_3 = arg_247_1:GetComponent(typeof(RectTransform))
	local var_247_4 = arg_247_1:GetComponent(typeof(Text))
	local var_247_5 = var_247_3.rect.width

	for iter_247_0, iter_247_1 in ipairs(var_247_0) do
		local var_247_6 = var_247_2

		var_247_2 = var_247_2 == "" and iter_247_1 or var_247_2 .. " " .. iter_247_1

		setText(arg_247_1, var_247_2)

		if var_247_5 < var_247_4.preferredWidth then
			var_247_1 = var_247_1 == "" and var_247_6 or var_247_1 .. "\n" .. var_247_6
			var_247_2 = iter_247_1
		end

		if iter_247_0 >= #var_247_0 then
			var_247_1 = var_247_1 == "" and var_247_2 or var_247_1 .. "\n" .. var_247_2
		end
	end

	return var_247_1
end

function checkBirthFormat(arg_248_0)
	if #arg_248_0 ~= 8 then
		return false
	end

	local var_248_0 = 0
	local var_248_1 = #arg_248_0

	while var_248_0 < var_248_1 do
		local var_248_2 = string.byte(arg_248_0, var_248_0 + 1)

		if var_248_2 < 48 or var_248_2 > 57 then
			return false
		end

		var_248_0 = var_248_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_249_0)
	local var_249_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_249_0, function(arg_250_0)
		return arg_250_0 == arg_249_0
	end)
end

function GetServerState(arg_251_0)
	local var_251_0 = -1
	local var_251_1 = 0
	local var_251_2 = 1
	local var_251_3 = 2
	local var_251_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_251_4 = string.gsub(var_251_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_251_4, function(arg_252_0, arg_252_1)
		local var_252_0 = true
		local var_252_1 = false

		for iter_252_0 in string.gmatch(arg_252_1, "\"state\":%d") do
			if iter_252_0 ~= "\"state\":1" then
				var_252_0 = false
			end

			var_252_1 = true
		end

		if not var_252_1 then
			var_252_0 = false
		end

		if arg_251_0 ~= nil then
			arg_251_0(var_252_0 and var_251_2 or var_251_1)
		end
	end)
end

function setScrollText(arg_253_0, arg_253_1)
	GetOrAddComponent(arg_253_0, "ScrollText"):SetText(arg_253_1)
end

function changeToScrollText(arg_254_0, arg_254_1)
	local var_254_0 = GetComponent(arg_254_0, typeof(Text))

	assert(var_254_0, "without component<Text>")

	local var_254_1 = arg_254_0:Find("subText")

	if not var_254_1 then
		var_254_1 = cloneTplTo(arg_254_0, arg_254_0, "subText")

		eachChild(arg_254_0, function(arg_255_0)
			setActive(arg_255_0, arg_255_0 == var_254_1)
		end)

		arg_254_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_254_1, arg_254_1)
end

local var_0_18
local var_0_19
local var_0_20
local var_0_21

local function var_0_22(arg_256_0, arg_256_1, arg_256_2)
	local var_256_0 = arg_256_0:Find("base")
	local var_256_1, var_256_2, var_256_3 = Equipment.GetInfoTrans(arg_256_1, arg_256_2)

	if arg_256_1.nextValue then
		local var_256_4 = {
			name = arg_256_1.name,
			type = arg_256_1.type,
			value = arg_256_1.nextValue
		}
		local var_256_5, var_256_6 = Equipment.GetInfoTrans(var_256_4, arg_256_2)

		var_256_2 = var_256_2 .. setColorStr("   >   " .. var_256_6, COLOR_GREEN)
	end

	setText(var_256_0:Find("name"), var_256_1)

	if var_256_3 then
		local var_256_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_256_0:Find("value"), var_256_2 .. var_256_7)
	else
		setText(var_256_0:Find("value"), var_256_2)
	end

	setActive(var_256_0:Find("value/up"), arg_256_1.compare and arg_256_1.compare > 0)
	setActive(var_256_0:Find("value/down"), arg_256_1.compare and arg_256_1.compare < 0)
	triggerToggle(var_256_0, arg_256_1.lock_open)

	if not arg_256_1.lock_open and arg_256_1.sub and #arg_256_1.sub > 0 then
		GetComponent(var_256_0, typeof(Toggle)).enabled = true
	else
		setActive(var_256_0:Find("name/close"), false)
		setActive(var_256_0:Find("name/open"), false)

		GetComponent(var_256_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_23(arg_257_0, arg_257_1, arg_257_2, arg_257_3)
	var_0_22(arg_257_0, arg_257_2, arg_257_3)

	if not arg_257_2.sub or #arg_257_2.sub == 0 then
		return
	end

	var_0_20(arg_257_0:Find("subs"), arg_257_1, arg_257_2.sub, arg_257_3)
end

function var_0_20(arg_258_0, arg_258_1, arg_258_2, arg_258_3)
	removeAllChildren(arg_258_0)
	var_0_21(arg_258_0, arg_258_1, arg_258_2, arg_258_3)
end

function var_0_21(arg_259_0, arg_259_1, arg_259_2, arg_259_3)
	for iter_259_0, iter_259_1 in ipairs(arg_259_2) do
		local var_259_0 = cloneTplTo(arg_259_1, arg_259_0)

		var_0_23(var_259_0, arg_259_1, iter_259_1, arg_259_3)
	end
end

function updateEquipInfo(arg_260_0, arg_260_1, arg_260_2, arg_260_3)
	local var_260_0 = arg_260_0:Find("attr_tpl")

	var_0_20(arg_260_0:Find("attrs"), var_260_0, arg_260_1.attrs, arg_260_3)
	setActive(arg_260_0:Find("skill"), arg_260_2)

	if arg_260_2 then
		var_0_23(arg_260_0:Find("skill/attr"), var_260_0, {
			name = i18n("skill"),
			value = setColorStr(arg_260_2.name, "#FFDE00FF")
		}, arg_260_3)
		setText(arg_260_0:Find("skill/value/Text"), getSkillDescGet(arg_260_2.id))
	end

	setActive(arg_260_0:Find("weapon"), #arg_260_1.weapon.sub > 0)

	if #arg_260_1.weapon.sub > 0 then
		var_0_20(arg_260_0:Find("weapon"), var_260_0, {
			arg_260_1.weapon
		}, arg_260_3)
	end

	setActive(arg_260_0:Find("equip_info"), #arg_260_1.equipInfo.sub > 0)

	if #arg_260_1.equipInfo.sub > 0 then
		var_0_20(arg_260_0:Find("equip_info"), var_260_0, {
			arg_260_1.equipInfo
		}, arg_260_3)
	end

	var_0_23(arg_260_0:Find("part/attr"), var_260_0, {
		name = i18n("equip_info_23")
	}, arg_260_3)

	local var_260_1 = arg_260_0:Find("part/value")
	local var_260_2 = var_260_1:Find("label")
	local var_260_3 = {}
	local var_260_4 = {}

	if #arg_260_1.part[1] == 0 and #arg_260_1.part[2] == 0 then
		setmetatable(var_260_3, {
			__index = function(arg_261_0, arg_261_1)
				return true
			end
		})
		setmetatable(var_260_4, {
			__index = function(arg_262_0, arg_262_1)
				return true
			end
		})
	else
		for iter_260_0, iter_260_1 in ipairs(arg_260_1.part[1]) do
			var_260_3[iter_260_1] = true
		end

		for iter_260_2, iter_260_3 in ipairs(arg_260_1.part[2]) do
			var_260_4[iter_260_3] = true
		end
	end

	local var_260_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_260_3, var_260_4)

	UIItemList.StaticAlign(var_260_1, var_260_2, #var_260_5, function(arg_263_0, arg_263_1, arg_263_2)
		arg_263_1 = arg_263_1 + 1

		if arg_263_0 == UIItemList.EventUpdate then
			local var_263_0 = var_260_5[arg_263_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_263_0), arg_263_2)
			setActive(arg_263_2:Find("main"), var_260_3[var_263_0] and not var_260_4[var_263_0])
			setActive(arg_263_2:Find("sub"), var_260_4[var_263_0] and not var_260_3[var_263_0])
			setImageAlpha(arg_263_2, not var_260_3[var_263_0] and not var_260_4[var_263_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_264_0, arg_264_1, arg_264_2)
	local var_264_0 = arg_264_0:Find("attr_tpl")

	var_0_20(arg_264_0:Find("attrs"), var_264_0, arg_264_1.attrs, arg_264_2)
	setActive(arg_264_0:Find("weapon"), #arg_264_1.weapon.sub > 0)

	if #arg_264_1.weapon.sub > 0 then
		var_0_20(arg_264_0:Find("weapon"), var_264_0, {
			arg_264_1.weapon
		}, arg_264_2)
	end

	setActive(arg_264_0:Find("equip_info"), #arg_264_1.equipInfo.sub > 0)

	if #arg_264_1.equipInfo.sub > 0 then
		var_0_20(arg_264_0:Find("equip_info"), var_264_0, {
			arg_264_1.equipInfo
		}, arg_264_2)
	end
end

function setCanvasOverrideSorting(arg_265_0, arg_265_1)
	local var_265_0 = arg_265_0.parent

	arg_265_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_265_0) then
		GetOrAddComponent(arg_265_0, typeof(Canvas)).overrideSorting = arg_265_1
	else
		setActive(arg_265_0, true)

		GetOrAddComponent(arg_265_0, typeof(Canvas)).overrideSorting = arg_265_1

		setActive(arg_265_0, false)
	end

	arg_265_0:SetParent(var_265_0, false)
end

function createNewGameObject(arg_266_0, arg_266_1)
	local var_266_0 = GameObject.New()

	if arg_266_0 then
		var_266_0.name = "model"
	end

	var_266_0.layer = arg_266_1 or Layer.UI

	return GetOrAddComponent(var_266_0, "RectTransform")
end

function CreateShell(arg_267_0)
	if type(arg_267_0) ~= "table" and type(arg_267_0) ~= "userdata" then
		return arg_267_0
	end

	local var_267_0 = setmetatable({
		__index = arg_267_0
	}, arg_267_0)

	return setmetatable({}, var_267_0)
end

function CameraFittingSettin(arg_268_0)
	local var_268_0 = GetComponent(arg_268_0, typeof(Camera))
	local var_268_1 = 1.7777777777777777
	local var_268_2 = Screen.width / Screen.height

	if var_268_2 < var_268_1 then
		local var_268_3 = var_268_2 / var_268_1

		var_268_0.rect = var_0_0.Rect.New(0, (1 - var_268_3) / 2, 1, var_268_3)
	end
end

function SwitchSpecialChar(arg_269_0, arg_269_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_269_0 = arg_269_0:gsub(" ", " ")
		arg_269_0 = arg_269_0:gsub("\t", "    ")
	end

	if not arg_269_1 then
		arg_269_0 = arg_269_0:gsub("\n", " ")
	end

	return arg_269_0
end

function AfterCheck(arg_270_0, arg_270_1)
	local var_270_0 = {}

	for iter_270_0, iter_270_1 in ipairs(arg_270_0) do
		var_270_0[iter_270_0] = iter_270_1[1]()
	end

	arg_270_1()

	for iter_270_2, iter_270_3 in ipairs(arg_270_0) do
		if var_270_0[iter_270_2] ~= iter_270_3[1]() then
			iter_270_3[2]()
		end

		var_270_0[iter_270_2] = iter_270_3[1]()
	end
end

function CompareFuncs(arg_271_0, arg_271_1)
	local var_271_0 = {}

	local function var_271_1(arg_272_0, arg_272_1)
		var_271_0[arg_272_0] = var_271_0[arg_272_0] or {}
		var_271_0[arg_272_0][arg_272_1] = var_271_0[arg_272_0][arg_272_1] or arg_271_0[arg_272_0](arg_272_1)

		return var_271_0[arg_272_0][arg_272_1]
	end

	return function(arg_273_0, arg_273_1)
		local var_273_0 = 1

		while var_273_0 <= #arg_271_0 do
			local var_273_1 = var_271_1(var_273_0, arg_273_0)
			local var_273_2 = var_271_1(var_273_0, arg_273_1)

			if var_273_1 == var_273_2 then
				var_273_0 = var_273_0 + 1
			else
				return var_273_1 < var_273_2
			end
		end

		return tobool(arg_271_1)
	end
end

function DropResultIntegration(arg_274_0)
	local var_274_0 = {}
	local var_274_1 = 1

	while var_274_1 <= #arg_274_0 do
		local var_274_2 = arg_274_0[var_274_1].type
		local var_274_3 = arg_274_0[var_274_1].id

		var_274_0[var_274_2] = var_274_0[var_274_2] or {}

		if var_274_0[var_274_2][var_274_3] then
			local var_274_4 = arg_274_0[var_274_0[var_274_2][var_274_3]]
			local var_274_5 = table.remove(arg_274_0, var_274_1)

			var_274_4.count = var_274_4.count + var_274_5.count
		else
			var_274_0[var_274_2][var_274_3] = var_274_1
			var_274_1 = var_274_1 + 1
		end
	end

	local var_274_6 = {
		function(arg_275_0)
			local var_275_0 = arg_275_0.type
			local var_275_1 = arg_275_0.id

			if var_275_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_275_0 == DROP_TYPE_RESOURCE then
				if var_275_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_275_0 == DROP_TYPE_ITEM then
				if var_275_1 == 59010 then
					return 4
				elseif var_275_1 == 59900 then
					return 5
				else
					local var_275_2 = Item.getConfigData(var_275_1)
					local var_275_3 = var_275_2 and var_275_2.type or 0

					if var_275_3 == 9 then
						return 6
					elseif var_275_3 == 5 then
						return 7
					elseif var_275_3 == 4 then
						return 8
					elseif var_275_3 == 7 then
						return 9
					end
				end
			elseif var_275_0 == DROP_TYPE_VITEM and var_275_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_276_0)
			local var_276_0

			if arg_276_0.type == DROP_TYPE_SHIP then
				var_276_0 = pg.ship_data_statistics[arg_276_0.id]
			elseif arg_276_0.type == DROP_TYPE_ITEM then
				var_276_0 = Item.getConfigData(arg_276_0.id)
			end

			return (var_276_0 and var_276_0.rarity or 0) * -1
		end,
		function(arg_277_0)
			return arg_277_0.id
		end
	}

	table.sort(arg_274_0, CompareFuncs(var_274_6))
end

function getLoginConfig()
	if LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value then
		return false, "login", "", false, ""
	end

	local var_278_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_278_1 = 1

	for iter_278_0, iter_278_1 in ipairs(pg.login.all) do
		if pg.login[iter_278_1].date ~= "stop" then
			local var_278_2, var_278_3 = parseTimeConfig(pg.login[iter_278_1].date)

			assert(not var_278_3)

			if pg.TimeMgr.GetInstance():inTime(var_278_2, var_278_0) then
				var_278_1 = iter_278_1

				break
			end
		end
	end

	local var_278_4 = pg.login[var_278_1].login_static

	var_278_4 = var_278_4 ~= "" and var_278_4 or "login"

	local var_278_5 = pg.login[var_278_1].login_cri
	local var_278_6 = var_278_5 ~= "" and true or false
	local var_278_7 = pg.login[var_278_1].op_play == 1 and true or false
	local var_278_8 = pg.login[var_278_1].op_time

	if var_278_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_278_8, var_278_0) then
		var_278_7 = false
	end

	local var_278_9 = var_278_8 == "" and var_278_8 or table.concat(var_278_8[1][1])

	return var_278_6, var_278_6 and var_278_5 or var_278_4, pg.login[var_278_1].bgm, var_278_7, var_278_9
end

function setIntimacyIcon(arg_279_0, arg_279_1, arg_279_2)
	local var_279_0 = {}
	local var_279_1

	seriesAsync({
		function(arg_280_0)
			if arg_279_0.childCount > 0 then
				var_279_1 = arg_279_0:GetChild(0)

				arg_280_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_281_0)
					var_279_1 = tf(arg_281_0)

					setParent(var_279_1, arg_279_0)
					arg_280_0()
				end)
			end
		end,
		function(arg_282_0)
			setImageAlpha(var_279_1, arg_279_2 and 0 or 1)
			eachChild(var_279_1, function(arg_283_0)
				setActive(arg_283_0, false)
			end)

			if arg_279_2 then
				local var_282_0 = var_279_1:Find(arg_279_2 .. "(Clone)")

				if not var_282_0 then
					LoadAndInstantiateAsync("ui", arg_279_2, function(arg_284_0)
						setParent(arg_284_0, var_279_1)
						setActive(arg_284_0, true)
					end)
				else
					setActive(var_282_0, true)
				end
			elseif arg_279_1 then
				setImageSprite(var_279_1, GetSpriteFromAtlas("energy", arg_279_1), true)
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

function switch(arg_287_0, arg_287_1, arg_287_2, ...)
	if arg_287_1[arg_287_0] then
		return arg_287_1[arg_287_0](...)
	elseif arg_287_2 then
		return arg_287_2(...)
	end
end

function parseTimeConfig(arg_288_0)
	if type(arg_288_0[1]) == "table" then
		return arg_288_0[2], arg_288_0[1]
	else
		return arg_288_0
	end
end

local var_0_25 = {
	__add = function(arg_289_0, arg_289_1)
		return NewPos(arg_289_0.x + arg_289_1.x, arg_289_0.y + arg_289_1.y)
	end,
	__sub = function(arg_290_0, arg_290_1)
		return NewPos(arg_290_0.x - arg_290_1.x, arg_290_0.y - arg_290_1.y)
	end,
	__mul = function(arg_291_0, arg_291_1)
		if type(arg_291_1) == "number" then
			return NewPos(arg_291_0.x * arg_291_1, arg_291_0.y * arg_291_1)
		else
			return NewPos(arg_291_0.x * arg_291_1.x, arg_291_0.y * arg_291_1.y)
		end
	end,
	__eq = function(arg_292_0, arg_292_1)
		return arg_292_0.x == arg_292_1.x and arg_292_0.y == arg_292_1.y
	end,
	__tostring = function(arg_293_0)
		return arg_293_0.x .. "_" .. arg_293_0.y
	end
}

function NewPos(arg_294_0, arg_294_1)
	assert(arg_294_0 and arg_294_1)

	local var_294_0 = setmetatable({
		x = arg_294_0,
		y = arg_294_1
	}, var_0_25)

	function var_294_0.SqrMagnitude(arg_295_0)
		return arg_295_0.x * arg_295_0.x + arg_295_0.y * arg_295_0.y
	end

	function var_294_0.Normalize(arg_296_0)
		local var_296_0 = arg_296_0:SqrMagnitude()

		if var_296_0 > 1e-05 then
			return arg_296_0 * (1 / math.sqrt(var_296_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_294_0
end

local var_0_26

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_26 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_26 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_298_0)
	return (string.char(226, 133, 160 + (arg_298_0 - 1)))
end

function quickPlayAnimator(arg_299_0, arg_299_1)
	arg_299_0:GetComponent(typeof(Animator)):Play(arg_299_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_300_0, arg_300_1)
	local var_300_0 = arg_300_0:GetComponent(typeof(Animator))

	var_300_0.enabled = true

	local var_300_1 = Animator.StringToHash(arg_300_1)

	if var_300_0:HasState(0, var_300_1) then
		var_300_0:Play(arg_300_1, -1, 0)
	end
end

function quickPlayAnimation(arg_301_0, arg_301_1)
	local var_301_0 = arg_301_0:GetComponent(typeof(Animation))

	var_301_0:Stop()
	var_301_0:Play(arg_301_1)
end

function getSurveyUrl(arg_302_0)
	local var_302_0 = pg.survey_data_template[arg_302_0]
	local var_302_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_302_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_302_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_302_1 = var_302_0.main_url
				else
					var_302_1 = var_302_0.uo_url
				end
			elseif var_302_2 == PLATFORM_IPHONEPLAYER then
				var_302_1 = var_302_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_KR then
			var_302_1 = var_302_0.main_url
		end
	else
		var_302_1 = var_302_0.main_url
	end

	local var_302_3 = getProxy(PlayerProxy):getRawData().id
	local var_302_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_302_5
	local var_302_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_302_7 = getProxy(UserProxy):getRawData()
	local var_302_8 = getProxy(ServerProxy):getRawData()[var_302_7 and var_302_7.server or 0]
	local var_302_9 = var_302_8 and var_302_8.id or ""
	local var_302_10 = getProxy(PlayerProxy):getRawData().level
	local var_302_11 = var_302_3 .. "_" .. arg_302_0
	local var_302_12 = var_302_1
	local var_302_13 = {
		var_302_3,
		var_302_4,
		var_302_6,
		var_302_9,
		var_302_10,
		var_302_11
	}

	if var_302_12 then
		for iter_302_0, iter_302_1 in ipairs(var_302_13) do
			var_302_12 = string.gsub(var_302_12, "$" .. iter_302_0, tostring(iter_302_1))
		end
	end

	originalPrint("survey url", tostring(var_302_12))

	return var_302_12
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

function FilterVarchar(arg_304_0)
	assert(type(arg_304_0) == "string" or type(arg_304_0) == "table")

	if arg_304_0 == "" then
		return nil
	end

	return arg_304_0
end

function getGameset(arg_305_0)
	local var_305_0 = pg.gameset[arg_305_0]

	assert(var_305_0)

	return {
		var_305_0.key_value,
		var_305_0.description
	}
end

function getDorm3dGameset(arg_306_0)
	local var_306_0 = pg.dorm3d_set[arg_306_0]

	assert(var_306_0)

	return {
		var_306_0.key_value_int,
		var_306_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_307_0)
	arg_307_0 = arg_307_0 or {}

	local var_307_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_307_0 > 0 do
		local var_307_1 = table.remove(arg_307_0)

		switch(var_307_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_307_1:getConfig("open_directly") == 1 then
					for iter_308_0, iter_308_1 in ipairs(var_307_1:getConfig("display_icon")) do
						local var_308_0 = Drop.Create(iter_308_1)

						var_308_0.count = var_308_0.count * var_307_1.count

						table.insert(arg_307_0, var_308_0)
					end
				elseif var_307_1:getSubClass():IsShipExpType() then
					var_307_0[var_307_1.type][var_307_1.id] = defaultValue(var_307_0[var_307_1.type][var_307_1.id], 0) + var_307_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_307_0[var_307_1.type][var_307_1.id] = defaultValue(var_307_0[var_307_1.type][var_307_1.id], 0) + var_307_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_307_0[var_307_1.type] = var_307_0[var_307_1.type] + var_307_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_307_0[var_307_1.type] = var_307_0[var_307_1.type] + var_307_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_307_0[var_307_1.type] = var_307_0[var_307_1.type] + var_307_1.count
			end
		})
	end

	return var_307_0
end

function CheckOverflow(arg_313_0, arg_313_1)
	local var_313_0 = {}
	local var_313_1 = arg_313_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_313_2 = arg_313_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_313_3 = arg_313_0[DROP_TYPE_EQUIP]
	local var_313_4 = arg_313_0[DROP_TYPE_SHIP]
	local var_313_5 = getProxy(PlayerProxy):getRawData()
	local var_313_6 = false

	if arg_313_1 then
		local var_313_7 = var_313_5:OverStore(PlayerConst.ResStoreGold, var_313_1)
		local var_313_8 = var_313_5:OverStore(PlayerConst.ResStoreOil, var_313_2)

		if var_313_7 > 0 or var_313_8 > 0 then
			var_313_0.isStoreOverflow = {
				var_313_7,
				var_313_8
			}
		end
	else
		if var_313_1 > 0 and var_313_5:GoldMax(var_313_1) then
			return false, "gold"
		end

		if var_313_2 > 0 and var_313_5:OilMax(var_313_2) then
			return false, "oil"
		end
	end

	var_313_0.isExpBookOverflow = {}

	for iter_313_0, iter_313_1 in pairs(arg_313_0[DROP_TYPE_ITEM]) do
		local var_313_9 = Item.getConfigData(iter_313_0)

		if getProxy(BagProxy):getItemCountById(iter_313_0) + iter_313_1 > var_313_9.max_num then
			table.insert(var_313_0.isExpBookOverflow, iter_313_0)
		end
	end

	local var_313_10 = getProxy(EquipmentProxy):getCapacity()

	if var_313_3 > 0 and var_313_10 >= var_313_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_313_11 = getProxy(BayProxy):getShipCount()

	if var_313_4 > 0 and var_313_4 + var_313_11 > var_313_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_313_0
end

function CheckShipExpOverflow(arg_314_0)
	local var_314_0 = getProxy(BagProxy)

	for iter_314_0, iter_314_1 in pairs(arg_314_0[DROP_TYPE_ITEM]) do
		if var_314_0:getItemCountById(iter_314_0) + iter_314_1 > Item.getConfigData(iter_314_0).max_num then
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

function RegisterDetailButton(arg_315_0, arg_315_1, arg_315_2)
	Drop.Change(arg_315_2)
	switch(arg_315_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_315_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_316_0 = Item.getConfigData(arg_315_2.id).usage_arg
				local var_316_1 = var_316_0[3]

				if Item.InTimeLimitSkinAssigned(arg_315_2.id) then
					var_316_1 = table.mergeArray(var_316_0[2], var_316_1, true)
				end

				local var_316_2 = {}

				for iter_316_0, iter_316_1 in ipairs(var_316_0[2]) do
					var_316_2[iter_316_1] = true
				end

				onButton(arg_315_0, arg_315_1, function()
					arg_315_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = NewSelectSkinLayer,
							mediator = NewSkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_315_2.id,
								selectableSkinList = underscore.map(var_316_1, function(arg_318_0)
									return SelectableSkin.New({
										id = arg_318_0,
										isTimeLimit = var_316_2[arg_318_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_315_1, true)
			else
				local var_316_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_315_2.id) and "tech" or arg_315_2:getConfig("type")

				if var_0_27[var_316_3] then
					local var_316_4 = {
						item2Row = true,
						content = i18n(var_0_27[var_316_3]),
						itemList = underscore.map(arg_315_2:getConfig("display_icon"), function(arg_319_0)
							return Drop.Create(arg_319_0)
						end)
					}

					if var_316_3 == 11 then
						onButton(arg_315_0, arg_315_1, function()
							arg_315_0:emit(BaseUI.ON_DROP_LIST_OWN, var_316_4)
						end, SFX_PANEL)
					else
						onButton(arg_315_0, arg_315_1, function()
							arg_315_0:emit(BaseUI.ON_DROP_LIST, var_316_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_315_1, tobool(var_0_27[var_316_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_315_0, arg_315_1, function()
				arg_315_0:emit(BaseUI.ON_DROP, arg_315_2)
			end, SFX_PANEL)
			setActive(arg_315_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_315_0, arg_315_1, function()
				arg_315_0:emit(BaseUI.ON_DROP, arg_315_2)
			end, SFX_PANEL)
			setActive(arg_315_1, true)
		end
	}, function()
		setActive(arg_315_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_327_0, arg_327_1, arg_327_2)
	Drop.Change(arg_327_2)
	switch(arg_327_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_328_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_327_2.id) and "tech" or arg_327_2:getConfig("type")

			if var_0_27[var_328_0] then
				local var_328_1 = {
					useDeepShow = true,
					showOwn = var_328_0 == 11,
					content = i18n(var_0_27[var_328_0]),
					itemList = underscore.map(arg_327_2:getConfig("display_icon"), function(arg_329_0)
						return Drop.Create(arg_329_0)
					end)
				}

				onButton(arg_327_0, arg_327_1, function()
					arg_327_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_328_1)
				end, SFX_PANEL)
			end

			setActive(arg_327_1, tobool(var_0_27[var_328_0]))
		end
	}, function()
		setActive(arg_327_1, false)
	end)
end

function UpdateOwnDisplay(arg_332_0, arg_332_1)
	local var_332_0, var_332_1 = arg_332_1:getOwnedCount()

	setActive(arg_332_0, var_332_1 and var_332_0 > 0)

	if var_332_1 and var_332_0 > 0 then
		setText(arg_332_0:Find("label"), i18n("word_own1"))
		setText(arg_332_0:Find("Text"), var_332_0)
	end
end

function Damp(arg_333_0, arg_333_1, arg_333_2)
	arg_333_1 = Mathf.Max(1, arg_333_1)

	local var_333_0 = Mathf.Epsilon

	if arg_333_1 < var_333_0 or var_333_0 > Mathf.Abs(arg_333_0) then
		return arg_333_0
	end

	if arg_333_2 < var_333_0 then
		return 0
	end

	local var_333_1 = -4.605170186

	return arg_333_0 * (1 - Mathf.Exp(var_333_1 * arg_333_2 / arg_333_1))
end

function checkCullResume(arg_334_0, arg_334_1)
	if arg_334_1 or not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_334_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_334_0 = arg_334_0:GetComponentsInChildren(typeof(var_0_0.UI.Graphic)):ToTable()

		for iter_334_0, iter_334_1 in ipairs(var_334_0) do
			iter_334_1:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_335_0)
	local var_335_0 = {}

	if arg_335_0 and arg_335_0 ~= "" then
		local var_335_1 = base64.dec(arg_335_0)

		var_335_0 = string.split(var_335_1, "/")
		var_335_0[5], var_335_0[6] = unpack(string.split(var_335_0[5], "\\"))

		if #var_335_0 < 6 or arg_335_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_335_0, 5), "/"),
			var_335_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_335_0 = {}
		end
	end

	for iter_335_0 = 1, 6 do
		var_335_0[iter_335_0] = var_335_0[iter_335_0] and tonumber(var_335_0[iter_335_0], 32) or 0
	end

	return var_335_0
end

function buildEquipCode(arg_336_0)
	local var_336_0 = underscore.map(arg_336_0:getAllEquipments(), function(arg_337_0)
		return ConversionBase(32, arg_337_0 and arg_337_0.id or 0)
	end)
	local var_336_1 = {
		table.concat(var_336_0, "/"),
		ConversionBase(32, checkExist(arg_336_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_336_1, "\\"))
end

function setDirectorSpeed(arg_338_0, arg_338_1)
	GetComponent(arg_338_0, typeof(TimelineSpeed)):SetTimelineSpeed(arg_338_1)
end

function setDefaultZeroMetatable(arg_339_0)
	return setmetatable(arg_339_0, {
		__index = function(arg_340_0, arg_340_1)
			if rawget(arg_340_0, arg_340_1) == nil then
				arg_340_0[arg_340_1] = 0
			end

			return arg_340_0[arg_340_1]
		end
	})
end

function checkABExist(arg_341_0)
	if EDITOR_TOOL then
		return ResourceMgr.Inst:AssetExist(arg_341_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_341_0))
	end
end

function compareNumber(arg_342_0, arg_342_1, arg_342_2)
	return switch(arg_342_1, {
		[">"] = function()
			return arg_342_0 > arg_342_2
		end,
		[">="] = function()
			return arg_342_0 >= arg_342_2
		end,
		["="] = function()
			return arg_342_0 == arg_342_2
		end,
		["<"] = function()
			return arg_342_0 < arg_342_2
		end,
		["<="] = function()
			return arg_342_0 <= arg_342_2
		end
	})
end

function ArabicToRoman(arg_348_0)
	local var_348_0 = {
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

	local function var_348_1(arg_349_0, arg_349_1)
		return select(2, arg_349_0:gsub(arg_349_1, ""))
	end

	local var_348_2 = ""

	while arg_348_0 > 0 do
		for iter_348_0, iter_348_1 in pairs(var_348_0) do
			local var_348_3 = iter_348_1[2]
			local var_348_4 = iter_348_1[1]

			while var_348_4 <= arg_348_0 do
				var_348_2 = var_348_2 .. var_348_3
				arg_348_0 = arg_348_0 - var_348_4
			end
		end
	end

	if arg_348_0 > 10000 then
		local var_348_5 = var_348_1(var_348_2, "M")

		var_348_2 = "M*" .. var_348_5 .. " " .. var_348_2
	end

	return var_348_2
end

function stringInset(arg_350_0, ...)
	for iter_350_0, iter_350_1 in ipairs({
		...
	}) do
		arg_350_0 = string.gsub(arg_350_0, "$" .. iter_350_0, iter_350_1)
	end

	return arg_350_0
end

function addSubLayer(arg_351_0, arg_351_1, arg_351_2, arg_351_3, arg_351_4)
	if arg_351_2 then
		while arg_351_1.parent do
			arg_351_1 = arg_351_1.parent
		end
	end

	local var_351_0 = {
		parentContext = arg_351_1,
		context = arg_351_0,
		callback = arg_351_3
	}

	var_351_0 = arg_351_4 and table.merge(var_351_0, arg_351_4) or var_351_0

	pg.m02:sendNotification(GAME.LOAD_LAYERS, var_351_0)
end
