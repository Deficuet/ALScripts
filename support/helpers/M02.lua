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

function updateIslandDefaultIconTpl(arg_107_0, arg_107_1, arg_107_2)
	GetImageSpriteFromAtlasAsync(arg_107_1:getIcon(), "", findTF(arg_107_0, "icon_bg/icon"))
	setActive(findTF(arg_107_0, "icon_bg/count_bg"), arg_107_1.count > 0)
	setText(findTF(arg_107_0, "icon_bg/count_bg/count"), arg_107_1.count)
	setIconName(arg_107_0, arg_107_1:getName(), {})
end

function getIslandSeasonPtInfo()
	local var_108_0 = pg.island_set.season_pt.key_value_varchar

	return {
		name = var_108_0[1],
		icon = var_108_0[2]
	}
end

function updateIslandSeasonPt(arg_109_0, arg_109_1)
	local var_109_0 = getIslandSeasonPtInfo()

	GetImageSpriteFromAtlasAsync("island/" .. var_109_0.icon, "", findTF(arg_109_0, "icon_bg/icon"))
	setActive(findTF(arg_109_0, "icon_bg/count_bg"), arg_109_1.count > 0)
	setText(findTF(arg_109_0, "icon_bg/count_bg/count"), arg_109_1.count)
end

function updateIslandCardDiy(arg_110_0, arg_110_1)
	GetImageSpriteFromAtlasAsync(arg_110_1:getIcon(), "", findTF(arg_110_0, "icon_bg/icon"))
	setActive(findTF(arg_110_0, "icon_bg/count_bg"), arg_110_1.count > 0)
	setText(findTF(arg_110_0, "icon_bg/count_bg/count"), arg_110_1.count)
	setIconName(arg_110_0, arg_110_1:getConfigTable().name, {})
end

function updateIslandSpeedupTicket(arg_111_0, arg_111_1)
	GetImageSpriteFromAtlasAsync(arg_111_1:getIcon(), "", findTF(arg_111_0, "icon_bg/icon"))
	setActive(findTF(arg_111_0, "icon_bg/count_bg"), arg_111_1.count > 0)
	setText(findTF(arg_111_0, "icon_bg/count_bg/count"), arg_111_1.count)
	setIconName(arg_111_0, arg_111_1:getConfigTable().name, {})
end

function updateIslandWatherCollect(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_1:getConfigTable().icon
	local var_112_1 = arg_112_1:getConfigTable().name

	setText(findTF(arg_112_0, "icon_bg/count"), arg_112_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_112_0, "", findTF(arg_112_0, "icon_bg/icon"))
	setIconName(arg_112_0, var_112_1, {})
end

function updateWorldItem(arg_113_0, arg_113_1, arg_113_2)
	arg_113_2 = arg_113_2 or {}

	local var_113_0 = ItemRarity.Rarity2Print(arg_113_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_113_0, findTF(arg_113_0, "icon_bg"))
	setFrame(findTF(arg_113_0, "icon_bg/frame"), var_113_0)

	local var_113_1 = findTF(arg_113_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_113_1.icon or arg_113_1:getConfig("icon"), "", var_113_1)
	setIconStars(arg_113_0, false)
	setIconName(arg_113_0, arg_113_1:getConfig("name"), arg_113_2)
	setIconColorful(arg_113_0, arg_113_1:getConfig("rarity"), arg_113_2)
end

function updateWorldCollection(arg_114_0, arg_114_1, arg_114_2)
	arg_114_2 = arg_114_2 or {}

	assert(arg_114_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_114_1.id)

	local var_114_0 = arg_114_1:getDropRarity()
	local var_114_1 = ItemRarity.Rarity2Print(var_114_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_114_1, findTF(arg_114_0, "icon_bg"))
	setFrame(findTF(arg_114_0, "icon_bg/frame"), var_114_1)

	local var_114_2 = findTF(arg_114_0, "icon_bg/icon")
	local var_114_3 = WorldCollectionProxy.GetCollectionType(arg_114_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_114_3, "", var_114_2)
	setIconStars(arg_114_0, false)
	setIconName(arg_114_0, arg_114_1:getName(), arg_114_2)
	setIconColorful(arg_114_0, var_114_0, arg_114_2)
end

function updateWorldBuff(arg_115_0, arg_115_1, arg_115_2)
	arg_115_2 = arg_115_2 or {}

	local var_115_0 = pg.world_SLGbuff_data[arg_115_1]

	assert(var_115_0, "找不到大世界buff配置: " .. arg_115_1)

	local var_115_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_115_1, findTF(arg_115_0, "icon_bg"))
	setFrame(findTF(arg_115_0, "icon_bg/frame"), var_115_1)

	local var_115_2 = findTF(arg_115_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_115_0.icon, "", var_115_2)

	local var_115_3 = arg_115_0:Find("icon_bg/stars")

	if not IsNil(var_115_3) then
		setActive(var_115_3, false)
	end

	local var_115_4 = findTF(arg_115_0, "name")

	if not IsNil(var_115_4) then
		setText(var_115_4, var_115_0.name)
	end

	local var_115_5 = findTF(arg_115_0, "icon_bg/count")

	if not IsNil(var_115_5) then
		SetActive(var_115_5, false)
	end
end

function updateShip(arg_116_0, arg_116_1, arg_116_2)
	arg_116_2 = arg_116_2 or {}

	local var_116_0 = arg_116_1:rarity2bgPrint()
	local var_116_1 = arg_116_1:getPainting()

	if arg_116_2.anonymous then
		var_116_0 = "1"
		var_116_1 = "unknown"
	end

	if arg_116_2.unknown_small then
		var_116_1 = "unknown_small"
	end

	local var_116_2 = findTF(arg_116_0, "icon_bg/new")

	if var_116_2 then
		if arg_116_2.isSkin then
			setActive(var_116_2, not arg_116_2.isTimeLimit and arg_116_2.isNew)
		else
			setActive(var_116_2, arg_116_1.virgin)
		end
	end

	local var_116_3 = findTF(arg_116_0, "icon_bg/timelimit")

	if var_116_3 then
		setActive(var_116_3, arg_116_2.isTimeLimit)
	end

	local var_116_4 = findTF(arg_116_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_116_2.isSkin and "_skin" or var_116_0), var_116_4)

	local var_116_5 = findTF(arg_116_0, "icon_bg/frame")
	local var_116_6

	if arg_116_1.isNpc then
		var_116_6 = "frame_npc"
	elseif arg_116_1:ShowPropose() then
		var_116_6 = "frame_prop"

		if arg_116_1:isMetaShip() then
			var_116_6 = var_116_6 .. "_meta"
		end
	elseif arg_116_2.isSkin then
		var_116_6 = "frame_skin"
	end

	setFrame(var_116_5, var_116_0, var_116_6)

	if arg_116_2.gray then
		setGray(var_116_4, true, true)
	end

	local var_116_7 = findTF(arg_116_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_116_2.Q and "QIcon/" or "SquareIcon/") .. var_116_1, "", var_116_7)

	local var_116_8 = findTF(arg_116_0, "icon_bg/lv")

	if var_116_8 then
		setActive(var_116_8, not arg_116_1.isNpc)

		if not arg_116_1.isNpc then
			local var_116_9 = findTF(var_116_8, "Text")

			if var_116_9 and arg_116_1.level then
				setText(var_116_9, arg_116_1.level)
			end
		end
	end

	local var_116_10 = findTF(arg_116_0, "ship_type")

	if var_116_10 then
		setActive(var_116_10, true)
		setImageSprite(var_116_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_116_1:getShipType())))
	end

	local var_116_11 = var_116_4:Find("npc")

	if not IsNil(var_116_11) then
		if var_116_2 and go(var_116_2).activeSelf then
			setActive(var_116_11, false)
		else
			setActive(var_116_11, arg_116_1:isActivityNpc())
		end
	end

	local var_116_12 = arg_116_0:Find("group_locked")

	if var_116_12 then
		setActive(var_116_12, not arg_116_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_116_1.groupId))
	end

	setIconStars(arg_116_0, arg_116_2.initStar, arg_116_1:getStar())
	setIconName(arg_116_0, arg_116_2.isSkin and arg_116_1:GetSkinConfig().name or arg_116_1:getName(), arg_116_2)
	setIconColorful(arg_116_0, arg_116_2.isSkin and ItemRarity.Gold or arg_116_1:getRarity() - 1, arg_116_2)
end

function updateCommander(arg_117_0, arg_117_1, arg_117_2)
	arg_117_2 = arg_117_2 or {}

	local var_117_0 = arg_117_1:getDropRarity()
	local var_117_1 = ItemRarity.Rarity2Print(var_117_0)
	local var_117_2 = arg_117_1:getConfig("painting")

	if arg_117_2.anonymous then
		var_117_1 = 1
		var_117_2 = "unknown"
	end

	local var_117_3 = findTF(arg_117_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_1, var_117_3)

	local var_117_4 = findTF(arg_117_0, "icon_bg/frame")

	setFrame(var_117_4, var_117_1)

	if arg_117_2.gray then
		setGray(var_117_3, true, true)
	end

	local var_117_5 = findTF(arg_117_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_117_2, "", var_117_5)
	setIconStars(arg_117_0, arg_117_2.initStar, 0)
	setIconName(arg_117_0, arg_117_1:getName(), arg_117_2)
end

function updateStrategy(arg_118_0, arg_118_1, arg_118_2)
	arg_118_2 = arg_118_2 or {}

	local var_118_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_118_0, findTF(arg_118_0, "icon_bg"))
	setFrame(findTF(arg_118_0, "icon_bg/frame"), var_118_0)

	local var_118_1 = findTF(arg_118_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_118_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_118_1:getIcon(), "", var_118_1)
	setIconStars(arg_118_0, false)
	setIconName(arg_118_0, arg_118_1:getName(), arg_118_2)
	setIconColorful(arg_118_0, ItemRarity.Gray, arg_118_2)
end

function updateFurniture(arg_119_0, arg_119_1, arg_119_2)
	arg_119_2 = arg_119_2 or {}

	local var_119_0 = arg_119_1:getDropRarity()
	local var_119_1 = ItemRarity.Rarity2Print(var_119_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_119_1, findTF(arg_119_0, "icon_bg"))
	setFrame(findTF(arg_119_0, "icon_bg/frame"), var_119_1)

	local var_119_2 = findTF(arg_119_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_119_1:getIcon(), "", var_119_2)
	setIconStars(arg_119_0, false)
	setIconName(arg_119_0, arg_119_1:getName(), arg_119_2)
	setIconColorful(arg_119_0, var_119_0, arg_119_2)
end

function updateSpWeapon(arg_120_0, arg_120_1, arg_120_2)
	arg_120_2 = arg_120_2 or {}

	assert(arg_120_1, "spWeaponVO can not be nil.")
	assert(isa(arg_120_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_120_0 = ItemRarity.Rarity2Print(arg_120_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_120_0, findTF(arg_120_0, "icon_bg"))
	setFrame(findTF(arg_120_0, "icon_bg/frame"), var_120_0)

	local var_120_1 = findTF(arg_120_0, "icon_bg/icon")

	var_0_4(var_120_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_120_1:GetIconPath(), "", var_120_1)
	setIconStars(arg_120_0, true, arg_120_1:GetRarity())
	var_0_7(arg_120_0, arg_120_1:GetLevel() - 1)
	setIconName(arg_120_0, arg_120_1:GetName(), arg_120_2)
	setIconCount(arg_120_0, arg_120_1.count)
	setIconColorful(arg_120_0, arg_120_1:GetRarity(), arg_120_2)
end

function UpdateSpWeaponSlot(arg_121_0, arg_121_1, arg_121_2)
	local var_121_0 = ItemRarity.Rarity2Print(arg_121_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_121_0, findTF(arg_121_0, "Icon/Mask/icon_bg"))

	local var_121_1 = findTF(arg_121_0, "Icon/Mask/icon_bg/icon")

	arg_121_2 = arg_121_2 or {
		16,
		16,
		16,
		16
	}

	var_0_4(var_121_1, arg_121_2)
	GetImageSpriteFromAtlasAsync(arg_121_1:GetIconPath(), "", var_121_1)

	local var_121_2 = arg_121_1:GetLevel() - 1
	local var_121_3 = findTF(arg_121_0, "Icon/LV")

	setActive(var_121_3, var_121_2 > 0)
	setText(findTF(var_121_3, "Text"), var_121_2)
end

function updateDorm3dIcon(arg_122_0, arg_122_1)
	local var_122_0 = arg_122_1:getDropRarityDorm()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_122_0), arg_122_0)

	local var_122_1 = arg_122_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_122_1:getIcon(), "", var_122_1)
	setText(arg_122_0:Find("count/Text"), "x" .. arg_122_1.count)
	setText(arg_122_0:Find("name/Text"), arg_122_1:getName())
end

local var_0_8

function findCullAndClipWorldRect(arg_123_0)
	if #arg_123_0 == 0 then
		return false
	end

	local var_123_0 = arg_123_0[1].canvasRect

	for iter_123_0 = 1, #arg_123_0 do
		var_123_0 = rectIntersect(var_123_0, arg_123_0[iter_123_0].canvasRect)
	end

	if var_123_0.width <= 0 or var_123_0.height <= 0 then
		return false
	end

	var_0_8 = var_0_8 or GameObject.Find("UICamera/Canvas").transform

	local var_123_1 = var_0_8:TransformPoint(Vector3(var_123_0.x, var_123_0.y, 0))
	local var_123_2 = var_0_8:TransformPoint(Vector3(var_123_0.x + var_123_0.width, var_123_0.y + var_123_0.height, 0))

	return true, Vector4(var_123_1.x, var_123_1.y, var_123_2.x, var_123_2.y)
end

function rectIntersect(arg_124_0, arg_124_1)
	local var_124_0 = math.max(arg_124_0.x, arg_124_1.x)
	local var_124_1 = math.min(arg_124_0.x + arg_124_0.width, arg_124_1.x + arg_124_1.width)
	local var_124_2 = math.max(arg_124_0.y, arg_124_1.y)
	local var_124_3 = math.min(arg_124_0.y + arg_124_0.height, arg_124_1.y + arg_124_1.height)

	if var_124_0 <= var_124_1 and var_124_2 <= var_124_3 then
		return var_0_0.Rect.New(var_124_0, var_124_2, var_124_1 - var_124_0, var_124_3 - var_124_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_125_0)
	local var_125_0 = {}

	for iter_125_0, iter_125_1 in ipairs(arg_125_0) do
		local var_125_1 = Drop.Create(iter_125_1)

		var_125_1.count = var_125_1.count or 1

		if var_125_1.type == DROP_TYPE_EMOJI then
			table.insert(var_125_0, var_125_1:getName())
		else
			table.insert(var_125_0, var_125_1:getName() .. "x" .. var_125_1.count)
		end
	end

	return table.concat(var_125_0, "、")
end

function updateDrop(arg_126_0, arg_126_1, arg_126_2)
	Drop.Change(arg_126_1)

	arg_126_2 = arg_126_2 or {}

	local var_126_0 = {
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
	local var_126_1

	for iter_126_0, iter_126_1 in ipairs(var_126_0) do
		local var_126_2 = arg_126_0:Find(iter_126_1[1])

		if arg_126_1.type ~= iter_126_1[2] and not IsNil(var_126_2) then
			setActive(var_126_2, false)
		end
	end

	if not IsNil(arg_126_0:Find("icon_bg/frame")) then
		arg_126_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

		setIconColorful(arg_126_0, arg_126_1:getDropRarity(), arg_126_2, {
			[ItemRarity.Gold] = {
				name = "Item_duang5",
				active = function(arg_127_0, arg_127_1)
					return arg_127_1.fromAwardLayer and arg_127_0 >= ItemRarity.Gold
				end
			}
		})
		var_0_4(findTF(arg_126_0, "icon_bg/icon"), {
			2,
			2,
			2,
			2
		})
	end

	arg_126_1:UpdateDropTpl(arg_126_0, arg_126_2)
	setIconCount(arg_126_0, arg_126_2.count or arg_126_1:getCount())
end

function updateCustomDrop(arg_128_0, arg_128_1, arg_128_2)
	Drop.Change(arg_128_1)

	arg_128_2 = arg_128_2 or {}

	arg_128_1:UpdateCustomDropTpl(arg_128_0, arg_128_2)
end

function updateBuff(arg_129_0, arg_129_1, arg_129_2)
	arg_129_2 = arg_129_2 or {}

	local var_129_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_129_0, findTF(arg_129_0, "icon_bg"))

	local var_129_1 = pg.benefit_buff_template[arg_129_1]

	setFrame(findTF(arg_129_0, "icon_bg/frame"), var_129_0)
	setText(findTF(arg_129_0, "icon_bg/count"), 1)

	local var_129_2 = findTF(arg_129_0, "icon_bg/icon")
	local var_129_3 = var_129_1.icon

	GetImageSpriteFromAtlasAsync(var_129_3, "", var_129_2)
	setIconStars(arg_129_0, false)
	setIconName(arg_129_0, var_129_1.name, arg_129_2)
	setIconColorful(arg_129_0, ItemRarity.Gold, arg_129_2)
end

function updateAttire(arg_130_0, arg_130_1, arg_130_2, arg_130_3)
	local var_130_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_130_0, findTF(arg_130_0, "icon_bg"))
	setFrame(findTF(arg_130_0, "icon_bg/frame"), var_130_0)

	local var_130_1 = findTF(arg_130_0, "icon_bg/icon")
	local var_130_2

	if arg_130_1 == AttireConst.TYPE_CHAT_FRAME then
		var_130_2 = "chat_frame"
	elseif arg_130_1 == AttireConst.TYPE_ICON_FRAME then
		var_130_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_130_2, "", var_130_1)
	setIconName(arg_130_0, arg_130_2.name, arg_130_3)
end

function updateAttireCombatUI(arg_131_0, arg_131_1, arg_131_2, arg_131_3)
	local var_131_0 = arg_131_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_131_0, findTF(arg_131_0, "icon_bg"))
	setFrame(findTF(arg_131_0, "icon_bg/frame"), var_131_0, "frame_battle_ui")

	local var_131_1 = findTF(arg_131_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_131_2.display_icon, "", var_131_1)
	setIconName(arg_131_0, arg_131_2.name, arg_131_3)
end

function updateActivityMedal(arg_132_0, arg_132_1, arg_132_2)
	local var_132_0 = ItemRarity.Rarity2Print(arg_132_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_132_0, findTF(arg_132_0, "icon_bg"))
	setFrame(findTF(arg_132_0, "icon_bg/frame"), var_132_0)

	local var_132_1 = findTF(arg_132_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_132_1.icon, "", var_132_1)
	setIconName(arg_132_0, arg_132_1.name, arg_132_2)
end

function updateCover(arg_133_0, arg_133_1, arg_133_2)
	local var_133_0 = arg_133_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_133_0, findTF(arg_133_0, "icon_bg"))
	setFrame(findTF(arg_133_0, "icon_bg/frame"), var_133_0)

	local var_133_1 = findTF(arg_133_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_133_1:getIcon(), "", var_133_1)
	setIconName(arg_133_0, arg_133_1:getName(), arg_133_2)
	setIconStars(arg_133_0, false)
end

function updateEmoji(arg_134_0, arg_134_1, arg_134_2)
	local var_134_0 = findTF(arg_134_0, "icon_bg/icon")
	local var_134_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_134_1, "", var_134_0)

	local var_134_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_134_2, findTF(arg_134_0, "icon_bg"))
	setFrame(findTF(arg_134_0, "icon_bg/frame"), var_134_2)
	setIconName(arg_134_0, arg_134_1.name, arg_134_2)
end

function updateEquipmentSkin(arg_135_0, arg_135_1, arg_135_2)
	arg_135_2 = arg_135_2 or {}

	local var_135_0 = EquipmentRarity.Rarity2Print(arg_135_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_135_0, findTF(arg_135_0, "icon_bg"))
	setFrame(findTF(arg_135_0, "icon_bg/frame"), var_135_0, "frame_skin")

	local var_135_1 = findTF(arg_135_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_135_1.icon, "", var_135_1)
	setIconStars(arg_135_0, false)
	setIconName(arg_135_0, arg_135_1.name, arg_135_2)
	setIconCount(arg_135_0, arg_135_1.count)
	setIconColorful(arg_135_0, arg_135_1.rarity - 1, arg_135_2)
end

function NoPosMsgBox(arg_136_0, arg_136_1, arg_136_2, arg_136_3)
	local var_136_0
	local var_136_1 = {}

	if arg_136_1 then
		table.insert(var_136_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_136_1
		})
	end

	if arg_136_2 then
		table.insert(var_136_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_136_2
		})
	end

	if arg_136_3 then
		table.insert(var_136_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_136_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_136_0,
		custom = var_136_1
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_137_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_137_0 and var_137_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_137_0
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
		local var_138_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_138_0 and var_138_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_138_0
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
		onClick = function(arg_141_0, arg_141_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_141_0.id,
				shipVOs = arg_141_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_142_0, arg_142_1, arg_142_2)
	if arg_142_2 then
		local var_142_0 = ""

		for iter_142_0, iter_142_1 in ipairs(arg_142_2) do
			local var_142_1 = Item.getConfigData(iter_142_1[1])

			var_142_0 = var_142_0 .. i18n(iter_142_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_142_1.name, iter_142_1[2])

			if iter_142_0 < #arg_142_2 then
				var_142_0 = var_142_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_142_0 ~= "" then
			arg_142_0 = arg_142_0 .. "\n" .. i18n("text_noRes_tip", var_142_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_142_0,
		onYes = function()
			gotoChargeScene(arg_142_1, arg_142_2)
		end
	})
end

function shoppingBatch(arg_144_0, arg_144_1, arg_144_2, arg_144_3, arg_144_4)
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

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_144_1.id
			},
			addNum = var_144_0.num,
			maxNum = var_144_3 * var_144_0.num,
			defaultNum = var_144_0.num,
			numUpdate = function(arg_145_0, arg_145_1)
				var_144_5 = math.floor(arg_145_1 / var_144_0.num)

				local var_145_0 = var_144_5 * var_144_2

				if var_145_0 > var_144_1 then
					setText(arg_145_0, i18n(arg_144_3, var_145_0, arg_145_1, COLOR_RED, var_144_6))

					var_144_4 = false
				else
					setText(arg_145_0, i18n(arg_144_3, var_145_0, arg_145_1, COLOR_GREEN, var_144_6))

					var_144_4 = true
				end
			end,
			onYes = function()
				if var_144_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_144_0,
						count = var_144_5
					})
				elseif arg_144_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_144_4))
					pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_147_0, arg_147_1, arg_147_2, arg_147_3, arg_147_4)
	local var_147_0 = pg.shop_template[arg_147_0]

	assert(var_147_0, "shop_template中找不到商品id：" .. arg_147_0)

	local var_147_1 = getProxy(PlayerProxy):getData()[id2res(var_147_0.resource_type)]
	local var_147_2 = arg_147_1.price or var_147_0.resource_num
	local var_147_3 = math.floor(var_147_1 / var_147_2)

	var_147_3 = var_147_3 <= 0 and 1 or var_147_3
	var_147_3 = arg_147_2 ~= nil and arg_147_2 < var_147_3 and arg_147_2 or var_147_3

	local var_147_4 = true
	local var_147_5 = 1

	if var_147_0 ~= nil and arg_147_1.id then
		print(var_147_3 * var_147_0.num, "--", var_147_3)
		assert(Item.getConfigData(arg_147_1.id), "item config should be existence")

		local var_147_6 = Item.New({
			id = arg_147_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_147_1.id
			}),
			price = var_147_2,
			addNum = var_147_0.num,
			maxNum = var_147_3 * var_147_0.num,
			defaultNum = var_147_0.num,
			numUpdate = function(arg_148_0, arg_148_1)
				var_147_5 = math.floor(arg_148_1 / var_147_0.num)

				local var_148_0 = var_147_5 * var_147_2

				if var_148_0 > var_147_1 then
					setTextInNewStyleBox(arg_148_0, i18n(arg_147_3, var_148_0, arg_148_1, COLOR_RED, var_147_6))

					var_147_4 = false
				else
					setTextInNewStyleBox(arg_148_0, i18n(arg_147_3, var_148_0, arg_148_1, "#238C40FF", var_147_6))

					var_147_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_147_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_147_0,
								count = var_147_5
							})
						elseif arg_147_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_147_4))
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

function gotoChargeScene(arg_150_0, arg_150_1)
	local var_150_0 = getProxy(ContextProxy)
	local var_150_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_150_1.mediator, NewShopMainMediator) then
		var_150_1.mediator:getViewComponent():switchSubViewByTogger(arg_150_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_150_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_150_1
		})
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
end

function clearDrop(arg_151_0)
	local var_151_0 = findTF(arg_151_0, "icon_bg")
	local var_151_1 = findTF(arg_151_0, "icon_bg/frame")
	local var_151_2 = findTF(arg_151_0, "icon_bg/icon")
	local var_151_3 = findTF(arg_151_0, "icon_bg/icon/icon")

	clearImageSprite(var_151_0)
	clearImageSprite(var_151_1)
	clearImageSprite(var_151_2)

	if var_151_3 then
		clearImageSprite(var_151_3)
	end
end

local var_0_9 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_152_0, arg_152_1, arg_152_2, arg_152_3)
	local var_152_0 = findTF(arg_152_0, "skill")
	local var_152_1 = findTF(arg_152_0, "lock")
	local var_152_2 = findTF(arg_152_0, "unknown")

	if arg_152_1 then
		setActive(var_152_0, true)
		setActive(var_152_2, false)
		setActive(var_152_1, not arg_152_2)
		LoadImageSpriteAsync("skillicon/" .. arg_152_1.icon, findTF(var_152_0, "icon"))

		local var_152_3 = arg_152_1.color or "blue"

		setText(findTF(var_152_0, "name"), shortenString(getSkillName(arg_152_1.id), arg_152_3 or 8))

		local var_152_4 = findTF(var_152_0, "level")

		setText(var_152_4, "LEVEL: " .. (arg_152_2 and arg_152_2.level or "??"))
		setTextColor(var_152_4, var_0_9[var_152_3])
	else
		setActive(var_152_0, false)
		setActive(var_152_2, true)
		setActive(var_152_1, false)
	end
end

local var_0_10 = true

function onBackButton(arg_153_0, arg_153_1, arg_153_2, arg_153_3)
	local var_153_0 = GetOrAddComponent(arg_153_1, "UILongPressTrigger")

	assert(arg_153_2, "callback should exist")

	var_153_0.longPressThreshold = defaultValue(arg_153_3, 1)

	local function var_153_1(arg_154_0)
		return function()
			if var_0_10 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_155_0, var_155_1 = arg_153_2()

			if var_155_0 then
				arg_154_0(var_155_1)
			end
		end
	end

	local var_153_2 = var_153_0.onReleased

	pg.DelegateInfo.Add(arg_153_0, var_153_2)
	var_153_2:RemoveAllListeners()
	var_153_2:AddListener(var_153_1(function(arg_156_0)
		arg_156_0:emit(BaseUI.ON_BACK)
	end))

	local var_153_3 = var_153_0.onLongPressed

	pg.DelegateInfo.Add(arg_153_0, var_153_3)
	var_153_3:RemoveAllListeners()
	var_153_3:AddListener(var_153_1(function(arg_157_0)
		arg_157_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_160_0)
	local var_160_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_160_1, var_160_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_160_0)

	return var_160_1 * 86400 + (var_160_2 + arg_160_0) * 3600
end

function GetPerceptualSize(arg_161_0, arg_161_1)
	local function var_161_0(arg_162_0)
		if not arg_162_0 then
			return 0, 1
		elseif arg_162_0 > 240 then
			return 4, 1
		elseif arg_162_0 > 225 then
			return 3, 1
		elseif arg_162_0 > 192 then
			return 2, 1
		elseif arg_162_0 < 126 then
			return 1, arg_161_1 or 0.5
		else
			return 1, 1
		end
	end

	if type(arg_161_0) == "number" then
		return var_161_0(arg_161_0)
	end

	local var_161_1 = 1
	local var_161_2 = 0
	local var_161_3 = 0
	local var_161_4 = #arg_161_0

	while var_161_1 <= var_161_4 do
		local var_161_5 = string.byte(arg_161_0, var_161_1)
		local var_161_6, var_161_7 = var_161_0(var_161_5)

		var_161_1 = var_161_1 + var_161_6
		var_161_2 = var_161_2 + var_161_7
	end

	return var_161_2
end

function shortenString(arg_163_0, arg_163_1, arg_163_2)
	local var_163_0 = 1
	local var_163_1 = 0
	local var_163_2 = 0
	local var_163_3 = #arg_163_0

	while var_163_0 <= var_163_3 do
		local var_163_4 = string.byte(arg_163_0, var_163_0)
		local var_163_5, var_163_6 = GetPerceptualSize(var_163_4, arg_163_2)

		var_163_0 = var_163_0 + var_163_5
		var_163_1 = var_163_1 + var_163_6

		if arg_163_1 <= math.ceil(var_163_1) then
			var_163_2 = var_163_0

			break
		end
	end

	if var_163_2 == 0 or var_163_3 < var_163_2 then
		return arg_163_0
	end

	return string.sub(arg_163_0, 1, var_163_2 - 1) .. ".."
end

function shouldShortenString(arg_164_0, arg_164_1)
	local var_164_0 = 1
	local var_164_1 = 0
	local var_164_2 = 0
	local var_164_3 = #arg_164_0

	while var_164_0 <= var_164_3 do
		local var_164_4 = string.byte(arg_164_0, var_164_0)
		local var_164_5, var_164_6 = GetPerceptualSize(var_164_4)

		var_164_0 = var_164_0 + var_164_5
		var_164_1 = var_164_1 + var_164_6

		if arg_164_1 <= math.ceil(var_164_1) then
			var_164_2 = var_164_0

			break
		end
	end

	if var_164_2 == 0 or var_164_3 < var_164_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_165_0, arg_165_1, arg_165_2, arg_165_3)
	local var_165_0 = true
	local var_165_1, var_165_2 = utf8_to_unicode(arg_165_0)
	local var_165_3 = filterEgyUnicode(filterSpecChars(arg_165_0))
	local var_165_4 = wordVer(arg_165_0)

	if not checkSpaceValid(arg_165_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_165_3[1]))

		var_165_0 = false
	elseif var_165_4 > 0 or var_165_3 ~= arg_165_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_165_3[4]))

		var_165_0 = false
	elseif var_165_2 < arg_165_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_165_3[2]))

		var_165_0 = false
	elseif arg_165_2 < var_165_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_165_3[3]))

		var_165_0 = false
	end

	return var_165_0
end

function checkSpaceValid(arg_166_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_166_0 = string.gsub(arg_166_0, " ", "")

	return arg_166_0 == string.gsub(var_166_0, "　", "")
end

function filterSpecChars(arg_167_0)
	local var_167_0 = {}
	local var_167_1 = 0
	local var_167_2 = 0
	local var_167_3 = 0
	local var_167_4 = 1

	while var_167_4 <= #arg_167_0 do
		local var_167_5 = string.byte(arg_167_0, var_167_4)

		if not var_167_5 then
			break
		end

		if var_167_5 >= 48 and var_167_5 <= 57 or var_167_5 >= 65 and var_167_5 <= 90 or var_167_5 == 95 or var_167_5 >= 97 and var_167_5 <= 122 then
			table.insert(var_167_0, string.char(var_167_5))
		elseif var_167_5 >= 228 and var_167_5 <= 233 then
			local var_167_6 = string.byte(arg_167_0, var_167_4 + 1)
			local var_167_7 = string.byte(arg_167_0, var_167_4 + 2)

			if var_167_6 and var_167_7 and var_167_6 >= 128 and var_167_6 <= 191 and var_167_7 >= 128 and var_167_7 <= 191 then
				var_167_4 = var_167_4 + 2

				table.insert(var_167_0, string.char(var_167_5, var_167_6, var_167_7))

				var_167_1 = var_167_1 + 1
			end
		elseif var_167_5 == 45 or var_167_5 == 40 or var_167_5 == 41 then
			table.insert(var_167_0, string.char(var_167_5))
		elseif var_167_5 == 194 then
			local var_167_8 = string.byte(arg_167_0, var_167_4 + 1)

			if var_167_8 == 183 then
				var_167_4 = var_167_4 + 1

				table.insert(var_167_0, string.char(var_167_5, var_167_8))

				var_167_1 = var_167_1 + 1
			end
		elseif var_167_5 == 239 then
			local var_167_9 = string.byte(arg_167_0, var_167_4 + 1)
			local var_167_10 = string.byte(arg_167_0, var_167_4 + 2)

			if var_167_9 == 188 and (var_167_10 == 136 or var_167_10 == 137) then
				var_167_4 = var_167_4 + 2

				table.insert(var_167_0, string.char(var_167_5, var_167_9, var_167_10))

				var_167_1 = var_167_1 + 1
			end
		elseif var_167_5 == 206 or var_167_5 == 207 then
			local var_167_11 = string.byte(arg_167_0, var_167_4 + 1)

			if var_167_5 == 206 and var_167_11 >= 177 or var_167_5 == 207 and var_167_11 <= 134 then
				var_167_4 = var_167_4 + 1

				table.insert(var_167_0, string.char(var_167_5, var_167_11))

				var_167_1 = var_167_1 + 1
			end
		elseif var_167_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_167_12 = string.byte(arg_167_0, var_167_4 + 1)
			local var_167_13 = string.byte(arg_167_0, var_167_4 + 2)

			if var_167_12 and var_167_13 and var_167_12 > 128 and var_167_12 <= 191 and var_167_13 >= 128 and var_167_13 <= 191 then
				var_167_4 = var_167_4 + 2

				table.insert(var_167_0, string.char(var_167_5, var_167_12, var_167_13))

				var_167_2 = var_167_2 + 1
			end
		elseif var_167_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_167_14 = string.byte(arg_167_0, var_167_4 + 1)
			local var_167_15 = string.byte(arg_167_0, var_167_4 + 2)

			if var_167_14 and var_167_15 and var_167_14 >= 128 and var_167_14 <= 191 and var_167_15 >= 128 and var_167_15 <= 191 then
				var_167_4 = var_167_4 + 2

				table.insert(var_167_0, string.char(var_167_5, var_167_14, var_167_15))

				var_167_3 = var_167_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_167_4 ~= 1 and var_167_5 == 32 and string.byte(arg_167_0, var_167_4 + 1) ~= 32 then
				table.insert(var_167_0, string.char(var_167_5))
			end

			if var_167_5 >= 192 and var_167_5 <= 223 then
				local var_167_16 = string.byte(arg_167_0, var_167_4 + 1)

				var_167_4 = var_167_4 + 1

				if var_167_5 == 194 and var_167_16 and var_167_16 >= 128 then
					table.insert(var_167_0, string.char(var_167_5, var_167_16))
				elseif var_167_5 == 195 and var_167_16 and var_167_16 <= 191 then
					table.insert(var_167_0, string.char(var_167_5, var_167_16))
				end
			end
		end

		var_167_4 = var_167_4 + 1
	end

	return table.concat(var_167_0), var_167_1 + var_167_2 + var_167_3
end

function filterEgyUnicode(arg_168_0)
	arg_168_0 = string.gsub(arg_168_0, "�[�-�][�-�]", "")
	arg_168_0 = string.gsub(arg_168_0, "�[�-�]", "")

	return arg_168_0
end

function shiftPanel(arg_169_0, arg_169_1, arg_169_2, arg_169_3, arg_169_4, arg_169_5, arg_169_6, arg_169_7, arg_169_8)
	arg_169_3 = arg_169_3 or 0.2

	if arg_169_5 then
		LeanTween.cancel(go(arg_169_0))
	end

	local var_169_0 = rtf(arg_169_0)

	arg_169_1 = arg_169_1 or var_169_0.anchoredPosition.x
	arg_169_2 = arg_169_2 or var_169_0.anchoredPosition.y

	local var_169_1 = LeanTween.move(var_169_0, Vector3(arg_169_1, arg_169_2, 0), arg_169_3)

	arg_169_7 = arg_169_7 or LeanTweenType.easeInOutSine

	var_169_1:setEase(arg_169_7)

	if arg_169_4 then
		var_169_1:setDelay(arg_169_4)
	end

	if arg_169_6 then
		GetOrAddComponent(arg_169_0, "CanvasGroup").blocksRaycasts = false
	end

	var_169_1:setOnComplete(System.Action(function()
		if arg_169_8 then
			arg_169_8()
		end

		if arg_169_6 then
			GetOrAddComponent(arg_169_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_169_1
end

function TweenValue(arg_171_0, arg_171_1, arg_171_2, arg_171_3, arg_171_4, arg_171_5, arg_171_6, arg_171_7)
	local var_171_0 = LeanTween.value(go(arg_171_0), arg_171_1, arg_171_2, arg_171_3):setOnUpdate(System.Action_float(function(arg_172_0)
		if arg_171_5 then
			arg_171_5(arg_172_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_171_6 then
			arg_171_6()
		end
	end)):setDelay(arg_171_4 or 0)

	if arg_171_7 and arg_171_7 > 0 then
		var_171_0:setRepeat(arg_171_7)
	end

	return var_171_0
end

function rotateAni(arg_174_0, arg_174_1, arg_174_2)
	return LeanTween.rotate(rtf(arg_174_0), 360 * arg_174_1, arg_174_2):setLoopClamp()
end

function blinkAni(arg_175_0, arg_175_1, arg_175_2, arg_175_3)
	return LeanTween.alpha(rtf(arg_175_0), arg_175_3 or 0, arg_175_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_175_2 or 0)
end

function scaleAni(arg_176_0, arg_176_1, arg_176_2, arg_176_3)
	return LeanTween.scale(rtf(arg_176_0), arg_176_3 or 0, arg_176_1):setLoopPingPong(arg_176_2 or 0)
end

function floatAni(arg_177_0, arg_177_1, arg_177_2, arg_177_3)
	local var_177_0 = arg_177_0.localPosition.y + arg_177_1

	return LeanTween.moveY(rtf(arg_177_0), var_177_0, arg_177_2):setLoopPingPong(arg_177_3 or 0)
end

local var_0_11 = tostring

function tostring(arg_178_0)
	if arg_178_0 == nil then
		return "nil"
	end

	local var_178_0 = var_0_11(arg_178_0)

	if var_178_0 == nil then
		if type(arg_178_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_178_0
end

function wordVer(arg_179_0, arg_179_1)
	if arg_179_0.match(arg_179_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_179_0
	end

	arg_179_1 = arg_179_1 or {}

	local var_179_0 = filterEgyUnicode(arg_179_0)

	if #var_179_0 ~= #arg_179_0 then
		if arg_179_1.isReplace then
			arg_179_0 = var_179_0
		else
			return 1
		end
	end

	local var_179_1 = wordSplit(arg_179_0)
	local var_179_2 = pg.word_template
	local var_179_3 = pg.word_legal_template

	arg_179_1.isReplace = arg_179_1.isReplace or false
	arg_179_1.replaceWord = arg_179_1.replaceWord or "*"

	local var_179_4 = #var_179_1
	local var_179_5 = 1
	local var_179_6 = ""
	local var_179_7 = 0

	while var_179_5 <= var_179_4 do
		local var_179_8, var_179_9, var_179_10 = wordLegalMatch(var_179_1, var_179_3, var_179_5)

		if var_179_8 then
			var_179_5 = var_179_9
			var_179_6 = var_179_6 .. var_179_10
		else
			local var_179_11, var_179_12, var_179_13 = wordVerMatch(var_179_1, var_179_2, arg_179_1, var_179_5, "", false, var_179_5, "")

			if var_179_11 then
				var_179_5 = var_179_12
				var_179_7 = var_179_7 + 1

				if arg_179_1.isReplace then
					var_179_6 = var_179_6 .. var_179_13
				end
			else
				if arg_179_1.isReplace then
					var_179_6 = var_179_6 .. var_179_1[var_179_5]
				end

				var_179_5 = var_179_5 + 1
			end
		end
	end

	if arg_179_1.isReplace then
		return var_179_7, var_179_6
	else
		return var_179_7
	end
end

function wordLegalMatch(arg_180_0, arg_180_1, arg_180_2, arg_180_3, arg_180_4)
	if arg_180_2 > #arg_180_0 then
		return arg_180_3, arg_180_2, arg_180_4
	end

	local var_180_0 = arg_180_0[arg_180_2]
	local var_180_1 = arg_180_1[var_180_0]

	arg_180_4 = arg_180_4 == nil and "" or arg_180_4

	if var_180_1 then
		if var_180_1.this then
			return wordLegalMatch(arg_180_0, var_180_1, arg_180_2 + 1, true, arg_180_4 .. var_180_0)
		else
			return wordLegalMatch(arg_180_0, var_180_1, arg_180_2 + 1, false, arg_180_4 .. var_180_0)
		end
	else
		return arg_180_3, arg_180_2, arg_180_4
	end
end

local var_0_12 = string.byte("a")
local var_0_13 = string.byte("z")
local var_0_14 = string.byte("A")
local var_0_15 = string.byte("Z")

local function var_0_16(arg_181_0)
	if not arg_181_0 then
		return arg_181_0
	end

	local var_181_0 = string.byte(arg_181_0)

	if var_181_0 > 128 then
		return
	end

	if var_181_0 >= var_0_12 and var_181_0 <= var_0_13 then
		return string.char(var_181_0 - 32)
	elseif var_181_0 >= var_0_14 and var_181_0 <= var_0_15 then
		return string.char(var_181_0 + 32)
	else
		return arg_181_0
	end
end

function wordVerMatch(arg_182_0, arg_182_1, arg_182_2, arg_182_3, arg_182_4, arg_182_5, arg_182_6, arg_182_7)
	if arg_182_3 > #arg_182_0 then
		return arg_182_5, arg_182_6, arg_182_7
	end

	local var_182_0 = arg_182_0[arg_182_3]
	local var_182_1 = arg_182_1[var_182_0]

	if var_182_1 then
		local var_182_2, var_182_3, var_182_4 = wordVerMatch(arg_182_0, var_182_1, arg_182_2, arg_182_3 + 1, arg_182_2.isReplace and arg_182_4 .. arg_182_2.replaceWord or arg_182_4, var_182_1.this or arg_182_5, var_182_1.this and arg_182_3 + 1 or arg_182_6, var_182_1.this and (arg_182_2.isReplace and arg_182_4 .. arg_182_2.replaceWord or arg_182_4) or arg_182_7)

		if var_182_2 then
			return var_182_2, var_182_3, var_182_4
		end
	end

	local var_182_5 = var_0_16(var_182_0)
	local var_182_6 = arg_182_1[var_182_5]

	if var_182_5 ~= var_182_0 and var_182_6 then
		local var_182_7, var_182_8, var_182_9 = wordVerMatch(arg_182_0, var_182_6, arg_182_2, arg_182_3 + 1, arg_182_2.isReplace and arg_182_4 .. arg_182_2.replaceWord or arg_182_4, var_182_6.this or arg_182_5, var_182_6.this and arg_182_3 + 1 or arg_182_6, var_182_6.this and (arg_182_2.isReplace and arg_182_4 .. arg_182_2.replaceWord or arg_182_4) or arg_182_7)

		if var_182_7 then
			return var_182_7, var_182_8, var_182_9
		end
	end

	return arg_182_5, arg_182_6, arg_182_7
end

function wordSplit(arg_183_0)
	local var_183_0 = {}

	for iter_183_0 in arg_183_0.gmatch(arg_183_0, "[\x01-\x7F�-�][�-�]*") do
		var_183_0[#var_183_0 + 1] = iter_183_0
	end

	return var_183_0
end

function contentWrap(arg_184_0, arg_184_1, arg_184_2)
	local var_184_0 = LuaHelper.WrapContent(arg_184_0, arg_184_1, arg_184_2)

	return #var_184_0 ~= #arg_184_0, var_184_0
end

function cancelRich(arg_185_0)
	local var_185_0

	for iter_185_0 = 1, 20 do
		local var_185_1

		arg_185_0, var_185_1 = string.gsub(arg_185_0, "<([^>]*)>", "%1")

		if var_185_1 <= 0 then
			break
		end
	end

	return arg_185_0
end

function cancelColorRich(arg_186_0)
	local var_186_0

	for iter_186_0 = 1, 20 do
		local var_186_1

		arg_186_0, var_186_1 = string.gsub(arg_186_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_186_1 <= 0 then
			break
		end
	end

	return arg_186_0
end

function getSkillConfig(arg_187_0)
	local var_187_0 = pg.buffCfg["buff_" .. arg_187_0]

	if not var_187_0 then
		return
	end

	local var_187_1 = Clone(var_187_0)

	var_187_1.name = getSkillName(arg_187_0)
	var_187_1.desc = HXSet.hxLan(var_187_1.desc)
	var_187_1.desc_get = HXSet.hxLan(var_187_1.desc_get)

	_.each(var_187_1, function(arg_188_0)
		arg_188_0.desc = HXSet.hxLan(arg_188_0.desc)
	end)

	return var_187_1
end

function getSkillName(arg_189_0)
	local var_189_0 = pg.skill_data_template[arg_189_0] or pg.skill_data_display[arg_189_0]

	if var_189_0 then
		return HXSet.hxLan(var_189_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_190_0, arg_190_1)
	local var_190_0 = arg_190_1 and pg.skill_world_display[arg_190_0] and setmetatable({}, {
		__index = function(arg_191_0, arg_191_1)
			return pg.skill_world_display[arg_190_0][arg_191_1] or pg.skill_data_template[arg_190_0][arg_191_1]
		end
	}) or pg.skill_data_template[arg_190_0]

	if not var_190_0 then
		return ""
	end

	local var_190_1 = var_190_0.desc_get ~= "" and var_190_0.desc_get or var_190_0.desc

	for iter_190_0, iter_190_1 in pairs(var_190_0.desc_get_add) do
		local var_190_2 = setColorStr(iter_190_1[1], COLOR_GREEN)

		if iter_190_1[2] then
			var_190_2 = var_190_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_190_1[2], COLOR_GREEN))
		end

		var_190_1 = specialGSub(var_190_1, "$" .. iter_190_0, var_190_2)
	end

	return HXSet.hxLan(var_190_1)
end

function getSkillDescLearn(arg_192_0, arg_192_1, arg_192_2)
	local var_192_0 = arg_192_2 and pg.skill_world_display[arg_192_0] and setmetatable({}, {
		__index = function(arg_193_0, arg_193_1)
			return pg.skill_world_display[arg_192_0][arg_193_1] or pg.skill_data_template[arg_192_0][arg_193_1]
		end
	}) or pg.skill_data_template[arg_192_0]

	if not var_192_0 then
		return ""
	end

	local var_192_1 = var_192_0.desc

	if not var_192_0.desc_add then
		return HXSet.hxLan(var_192_1)
	end

	for iter_192_0, iter_192_1 in pairs(var_192_0.desc_add) do
		local var_192_2 = iter_192_1[arg_192_1][1]

		if iter_192_1[arg_192_1][2] then
			var_192_2 = var_192_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_192_1[arg_192_1][2])
		end

		var_192_1 = specialGSub(var_192_1, "$" .. iter_192_0, setColorStr(var_192_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_192_1)
end

function getSkillDesc(arg_194_0, arg_194_1, arg_194_2)
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
		local var_194_2 = setColorStr(iter_194_1[arg_194_1][1], COLOR_GREEN)

		var_194_1 = specialGSub(var_194_1, "$" .. iter_194_0, var_194_2)
	end

	return HXSet.hxLan(var_194_1)
end

function specialGSub(arg_196_0, arg_196_1, arg_196_2)
	arg_196_0 = string.gsub(arg_196_0, "<color=#", "<color=NNN")
	arg_196_0 = string.gsub(arg_196_0, "#", "")
	arg_196_2 = string.gsub(arg_196_2, "%%", "%%%%")
	arg_196_0 = string.gsub(arg_196_0, arg_196_1, arg_196_2)
	arg_196_0 = string.gsub(arg_196_0, "<color=NNN", "<color=#")

	return arg_196_0
end

function topAnimation(arg_197_0, arg_197_1, arg_197_2, arg_197_3, arg_197_4, arg_197_5)
	local var_197_0 = {}

	arg_197_4 = arg_197_4 or 0.27

	local var_197_1 = 0.05

	if arg_197_0 then
		local var_197_2 = arg_197_0.transform.localPosition.x

		setAnchoredPosition(arg_197_0, {
			x = var_197_2 - 500
		})
		shiftPanel(arg_197_0, var_197_2, nil, 0.05, arg_197_4, true, true)
		setActive(arg_197_0, true)
	end

	setActive(arg_197_1, false)
	setActive(arg_197_2, false)
	setActive(arg_197_3, false)

	for iter_197_0 = 1, 3 do
		table.insert(var_197_0, LeanTween.delayedCall(arg_197_4 + 0.13 + var_197_1 * iter_197_0, System.Action(function()
			if arg_197_1 then
				setActive(arg_197_1, not arg_197_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_197_0, LeanTween.delayedCall(arg_197_4 + 0.02 + var_197_1 * iter_197_0, System.Action(function()
			if arg_197_2 then
				setActive(arg_197_2, not go(arg_197_2).activeSelf)
			end

			if arg_197_2 then
				setActive(arg_197_3, not go(arg_197_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_197_5 then
		table.insert(var_197_0, LeanTween.delayedCall(arg_197_4 + 0.13 + var_197_1 * 3 + 0.1, System.Action(function()
			arg_197_5()
		end)).uniqueId)
	end

	return var_197_0
end

function cancelTweens(arg_201_0)
	assert(arg_201_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_201_0, iter_201_1 in ipairs(arg_201_0) do
		if iter_201_1 then
			LeanTween.cancel(iter_201_1)
		end
	end
end

function getOfflineTimeStamp(arg_202_0)
	local var_202_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_202_0
	local var_202_1 = ""

	if var_202_0 <= 59 then
		var_202_1 = i18n("just_now")
	elseif var_202_0 <= 3599 then
		var_202_1 = i18n("several_minutes_before", math.floor(var_202_0 / 60))
	elseif var_202_0 <= 86399 then
		var_202_1 = i18n("several_hours_before", math.floor(var_202_0 / 3600))
	else
		var_202_1 = i18n("several_days_before", math.floor(var_202_0 / 86400))
	end

	return var_202_1
end

function playMovie(arg_203_0, arg_203_1, arg_203_2)
	local var_203_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_203_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_203_0, function(arg_204_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_204_0 = GCHandle.Alloc(arg_204_0, GCHandleType.Pinned)

			setActive(var_203_0, true)

			local var_204_1 = var_203_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_204_1.player:SetData(arg_204_0, arg_204_0.Length)

			var_204_1.target = var_203_0:GetComponent(typeof(Image))
			var_204_1.loop = false
			var_204_1.additiveMode = false
			var_204_1.playOnStart = true

			local var_204_2

			var_204_2 = Timer.New(function()
				if var_204_1.player.status == CriMana.Player.Status.PlayEnd or var_204_1.player.status == CriMana.Player.Status.Stop or var_204_1.player.status == CriMana.Player.Status.Error then
					var_204_2:Stop()
					Object.Destroy(var_204_1)
					GCHandle.Free(var_204_0)
					setActive(var_203_0, false)

					if arg_203_1 then
						arg_203_1()
					end
				end
			end, 0.2, -1)

			var_204_2:Start()
			removeOnButton(var_203_0)

			if arg_203_2 then
				onButton(nil, var_203_0, function()
					var_204_1:Stop()
					GetOrAddComponent(var_203_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_203_1 then
		arg_203_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_207_0)
	if PaintCameraAdjustOn ~= arg_207_0 then
		local var_207_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_207_0 then
			var_207_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_207_0.matchWidthOrHeight = 1
		else
			var_207_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		pg.CameraFixMgr.GetInstance():BlockCameraRatioControll(arg_207_0)

		PaintCameraAdjustOn = arg_207_0
	end
end

function ManhattonDist(arg_208_0, arg_208_1)
	return math.abs(arg_208_0.row - arg_208_1.row) + math.abs(arg_208_0.column - arg_208_1.column)
end

function checkFirstHelpShow(arg_209_0)
	local var_209_0 = getProxy(SettingsProxy)

	if not var_209_0:checkReadHelp(arg_209_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_209_0].tip
		})
		var_209_0:recordReadHelp(arg_209_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_210_0)
	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_211_0)
	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_211_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_213_0, arg_213_1)
	if arg_213_0 == nil then
		return
	end

	arg_213_0:GetComponent("NotchAdapt").enabled = arg_213_1
end

function comma_value(arg_214_0)
	local var_214_0 = arg_214_0
	local var_214_1 = 0

	repeat
		local var_214_2

		var_214_0, var_214_2 = string.gsub(var_214_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_214_2 == 0

	return var_214_0
end

local var_0_17 = 0.2

function SwitchPanel(arg_215_0, arg_215_1, arg_215_2, arg_215_3, arg_215_4, arg_215_5)
	arg_215_3 = defaultValue(arg_215_3, var_0_17)

	if arg_215_5 then
		LeanTween.cancel(go(arg_215_0))
	end

	local var_215_0 = Vector3.New(tf(arg_215_0).localPosition.x, tf(arg_215_0).localPosition.y, tf(arg_215_0).localPosition.z)

	if arg_215_1 then
		var_215_0.x = arg_215_1
	end

	if arg_215_2 then
		var_215_0.y = arg_215_2
	end

	local var_215_1 = LeanTween.move(rtf(arg_215_0), var_215_0, arg_215_3):setEase(LeanTweenType.easeInOutSine)

	if arg_215_4 then
		var_215_1:setDelay(arg_215_4)
	end

	return var_215_1
end

function updateActivityTaskStatus(arg_216_0)
	local var_216_0 = arg_216_0:getConfig("config_id")
	local var_216_1, var_216_2 = getActivityTask(arg_216_0, true)

	if not var_216_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_216_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_217_0)
	local var_217_0 = getProxy(TaskProxy)
	local var_217_1 = arg_217_0:getNDay()
	local var_217_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_217_0:getStartTime())

	for iter_217_0, iter_217_1 in ipairs(arg_217_0:getConfig("config_data")) do
		local var_217_3 = pg.battlepass_task_group[iter_217_1]

		if var_217_3 and var_217_2 >= var_217_3.group_mask then
			if underscore.any(underscore.flatten(var_217_3.task_group), function(arg_218_0)
				return var_217_0:getTaskVO(arg_218_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD, {
					cmd = 1,
					activity_id = arg_217_0.id
				})

				return true
			end
		elseif not var_217_3 then
			warning("battlepass_task_group表中不存在 id = " .. iter_217_1)
		end
	end

	return false
end

function setShipCardFrame(arg_219_0, arg_219_1, arg_219_2)
	arg_219_0.localScale = Vector3.one
	arg_219_0.anchorMin = Vector2.zero
	arg_219_0.anchorMax = Vector2.one

	local var_219_0 = arg_219_2 or arg_219_1

	GetImageSpriteFromAtlasAsync("shipframe", var_219_0, arg_219_0)

	local var_219_1 = pg.frame_resource[var_219_0]

	if var_219_1 then
		local var_219_2 = var_219_1.param

		arg_219_0.offsetMin = Vector2(var_219_2[1], var_219_2[2])
		arg_219_0.offsetMax = Vector2(var_219_2[3], var_219_2[4])
	else
		arg_219_0.offsetMin = Vector2.zero
		arg_219_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_220_0, arg_220_1, arg_220_2)
	arg_220_0.localScale = Vector3.one
	arg_220_0.anchorMin = Vector2.zero
	arg_220_0.anchorMax = Vector2.one

	setImageSprite(arg_220_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_220_2 or arg_220_1)))

	local var_220_0 = "b" .. (arg_220_2 or arg_220_1)
	local var_220_1 = pg.frame_resource[var_220_0]

	if var_220_1 then
		local var_220_2 = var_220_1.param

		arg_220_0.offsetMin = Vector2(var_220_2[1], var_220_2[2])
		arg_220_0.offsetMax = Vector2(var_220_2[3], var_220_2[4])
	else
		arg_220_0.offsetMin = Vector2.zero
		arg_220_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_221_0, arg_221_1)
	if arg_221_1 then
		local var_221_0 = arg_221_1 .. "(Clone)"
		local var_221_1 = false

		eachChild(arg_221_0, function(arg_222_0)
			setActive(arg_222_0, arg_222_0.name == var_221_0)

			var_221_1 = var_221_1 or arg_222_0.name == var_221_0
		end)

		if not var_221_1 then
			LoadAndInstantiateAsync("effect", arg_221_1, function(arg_223_0)
				if IsNil(arg_221_0) or findTF(arg_221_0, var_221_0) then
					Object.Destroy(arg_223_0)
				else
					setParent(arg_223_0, arg_221_0)
					setActive(arg_223_0, true)
				end
			end)
		end
	end

	setActive(arg_221_0, arg_221_1)
end

function setProposeMarkIcon(arg_224_0, arg_224_1)
	local var_224_0 = arg_224_0:Find("proposeShipCard(Clone)")
	local var_224_1 = arg_224_1.propose and not arg_224_1:ShowPropose()

	if var_224_0 then
		setActive(var_224_0, var_224_1)
	elseif var_224_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_225_0)
			if IsNil(arg_224_0) or arg_224_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_225_0)
			else
				setParent(arg_225_0, arg_224_0, false)
			end
		end)
	end
end

function flushShipCard(arg_226_0, arg_226_1)
	local var_226_0 = arg_226_1:rarity2bgPrint()
	local var_226_1 = findTF(arg_226_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_226_0, "", var_226_1)

	local var_226_2 = findTF(arg_226_0, "content/ship_icon")
	local var_226_3 = arg_226_1 and {
		"shipYardIcon/" .. arg_226_1:getPainting(),
		arg_226_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_226_3[1], var_226_3[2], var_226_2)

	local var_226_4 = arg_226_1:getShipType()
	local var_226_5 = findTF(arg_226_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_226_4), var_226_5)
	setText(findTF(arg_226_0, "content/dockyard/lv/Text"), defaultValue(arg_226_1.level, 1))

	local var_226_6 = arg_226_1:getStar()
	local var_226_7 = arg_226_1:getMaxStar()
	local var_226_8 = findTF(arg_226_0, "content/front/stars")

	setActive(var_226_8, true)

	local var_226_9 = findTF(var_226_8, "star_tpl")
	local var_226_10 = var_226_8.childCount

	for iter_226_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_226_11 = var_226_10 < iter_226_0 and cloneTplTo(var_226_9, var_226_8) or var_226_8:GetChild(iter_226_0 - 1)

		setActive(var_226_11, iter_226_0 <= var_226_7)
		triggerToggle(var_226_11, iter_226_0 <= var_226_6)
	end

	local var_226_12 = findTF(arg_226_0, "content/front/frame")
	local var_226_13, var_226_14 = arg_226_1:GetFrameAndEffect()

	setShipCardFrame(var_226_12, var_226_0, var_226_13)
	setFrameEffect(findTF(arg_226_0, "content/front/bg_other"), var_226_14)
	setProposeMarkIcon(arg_226_0:Find("content/dockyard/propose"), arg_226_1)
end

function TweenItemAlphaAndWhite(arg_227_0)
	LeanTween.cancel(arg_227_0)

	local var_227_0 = GetOrAddComponent(arg_227_0, "CanvasGroup")

	var_227_0.alpha = 0

	LeanTween.alphaCanvas(var_227_0, 1, 0.2):setUseEstimatedTime(true)

	local var_227_1 = findTF(arg_227_0.transform, "white_mask")

	if var_227_1 then
		setActive(var_227_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_228_0)
	LeanTween.cancel(arg_228_0)

	GetOrAddComponent(arg_228_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_229_0)
	local var_229_0 = {}
	local var_229_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_229_2 = getProxy(CollectionProxy):getShipGroup(arg_229_0)

	if var_229_2 then
		local var_229_3 = ShipGroup.getSkinList(arg_229_0)

		for iter_229_0, iter_229_1 in ipairs(var_229_3) do
			if iter_229_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_229_1, iter_229_1.id) or iter_229_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_229_2.trans or iter_229_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_229_2.married == 1 then
				var_229_0[iter_229_1.id] = true
			end
		end
	end

	return var_229_0
end

function split(arg_230_0, arg_230_1)
	local var_230_0 = {}

	if not arg_230_0 then
		return nil
	end

	local var_230_1 = #arg_230_0
	local var_230_2 = 1

	while var_230_2 <= var_230_1 do
		local var_230_3 = string.find(arg_230_0, arg_230_1, var_230_2)

		if var_230_3 == nil then
			table.insert(var_230_0, string.sub(arg_230_0, var_230_2, var_230_1))

			break
		end

		table.insert(var_230_0, string.sub(arg_230_0, var_230_2, var_230_3 - 1))

		if var_230_3 == var_230_1 then
			table.insert(var_230_0, "")

			break
		end

		var_230_2 = var_230_3 + 1
	end

	return var_230_0
end

function NumberToChinese(arg_231_0, arg_231_1)
	local var_231_0 = ""
	local var_231_1 = #arg_231_0

	for iter_231_0 = 1, var_231_1 do
		local var_231_2 = string.sub(arg_231_0, iter_231_0, iter_231_0)

		if var_231_2 ~= "0" or var_231_2 == "0" and not arg_231_1 then
			if arg_231_1 then
				if var_231_1 >= 2 then
					if iter_231_0 == 1 then
						if var_231_2 == "1" then
							var_231_0 = i18n("number_" .. 10)
						else
							var_231_0 = i18n("number_" .. var_231_2) .. i18n("number_" .. 10)
						end
					else
						var_231_0 = var_231_0 .. i18n("number_" .. var_231_2)
					end
				else
					var_231_0 = var_231_0 .. i18n("number_" .. var_231_2)
				end
			else
				var_231_0 = var_231_0 .. i18n("number_" .. var_231_2)
			end
		end
	end

	return var_231_0
end

function getActivityTask(arg_232_0, arg_232_1)
	local var_232_0 = getProxy(TaskProxy)
	local var_232_1 = arg_232_0:getConfig("config_data")
	local var_232_2 = arg_232_0:getNDay(arg_232_0.data1)
	local var_232_3
	local var_232_4
	local var_232_5

	for iter_232_0 = math.max(arg_232_0.data3, 1), math.min(var_232_2, #var_232_1) do
		local var_232_6 = _.flatten({
			var_232_1[iter_232_0]
		})

		for iter_232_1, iter_232_2 in ipairs(var_232_6) do
			local var_232_7 = var_232_0:getTaskById(iter_232_2)

			if var_232_7 then
				return var_232_7.id, var_232_7
			end

			if var_232_4 then
				var_232_5 = var_232_0:getFinishTaskById(iter_232_2)

				if var_232_5 then
					var_232_4 = var_232_5
				elseif arg_232_1 then
					return iter_232_2
				else
					return var_232_4.id, var_232_4
				end
			else
				var_232_4 = var_232_0:getFinishTaskById(iter_232_2)
				var_232_5 = var_232_5 or iter_232_2
			end
		end
	end

	if var_232_4 then
		return var_232_4.id, var_232_4
	else
		return var_232_5
	end
end

function setImageFromImage(arg_233_0, arg_233_1, arg_233_2)
	local var_233_0 = GetComponent(arg_233_0, "Image")

	var_233_0.sprite = GetComponent(arg_233_1, "Image").sprite

	if arg_233_2 then
		var_233_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_234_0)
	local var_234_0, var_234_1, var_234_2, var_234_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_234_0)

	if var_234_0 >= 1 then
		return i18n("limit_skin_time_day", var_234_0)
	elseif var_234_0 <= 0 and var_234_1 > 0 then
		return i18n("limit_skin_time_day_min", var_234_1, var_234_2)
	elseif var_234_0 <= 0 and var_234_1 <= 0 and (var_234_2 > 0 or var_234_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_234_2, 1))
	elseif var_234_0 <= 0 and var_234_1 <= 0 and var_234_2 <= 0 and var_234_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_235_0)
	local var_235_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_235_1 = math.max(arg_235_0 - var_235_0, 0)
	local var_235_2 = math.floor(var_235_1 / 86400)

	if var_235_2 > 0 then
		return i18n("time_remaining_tip") .. var_235_2 .. i18n("word_date")
	else
		local var_235_3 = math.floor(var_235_1 / 3600)

		if var_235_3 > 0 then
			return i18n("time_remaining_tip") .. var_235_3 .. i18n("word_hour")
		else
			local var_235_4 = math.floor(var_235_1 / 60)

			if var_235_4 > 0 then
				return i18n("time_remaining_tip") .. var_235_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_235_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_236_0)
	local var_236_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_236_0
	local var_236_1 = var_236_0 / 86400

	if var_236_1 > 1 then
		return i18n("ins_word_day", math.floor(var_236_1))
	else
		local var_236_2 = var_236_0 / 3600

		if var_236_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_236_2))
		else
			local var_236_3 = var_236_0 / 60

			if var_236_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_236_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_237_0)
	local var_237_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_237_0
	local var_237_1 = var_237_0 / 86400

	if var_237_1 > 1 then
		return i18n1(math.floor(var_237_1) .. "d")
	else
		local var_237_2 = var_237_0 / 3600

		if var_237_2 > 1 then
			return i18n1(math.floor(var_237_2) .. "h")
		else
			local var_237_3 = var_237_0 / 60

			if var_237_3 > 1 then
				return i18n1(math.floor(var_237_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_238_0)
	local var_238_0, var_238_1, var_238_2, var_238_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_238_0)

	if var_238_0 <= 0 and var_238_1 <= 0 and var_238_2 <= 0 and var_238_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_238_0, var_238_1, var_238_2)
	end
end

function checkExist(arg_239_0, ...)
	local var_239_0 = {
		...
	}

	for iter_239_0, iter_239_1 in ipairs(var_239_0) do
		if arg_239_0 == nil then
			break
		end

		assert(type(arg_239_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_239_1) == "table", "type error : param should be table")

		if type(arg_239_0[iter_239_1[1]]) == "function" then
			arg_239_0 = arg_239_0[iter_239_1[1]](arg_239_0, unpack(iter_239_1[2] or {}))
		else
			arg_239_0 = arg_239_0[iter_239_1[1]]
		end
	end

	return arg_239_0
end

function AcessWithinNull(arg_240_0, arg_240_1)
	if arg_240_0 == nil then
		return
	end

	assert(type(arg_240_0) == "table")

	return arg_240_0[arg_240_1]
end

function showRepairMsgbox()
	local var_241_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_241_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_241_2 = {
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
			var_241_2,
			var_241_1,
			var_241_0
		}
	})
end

function resourceVerify(arg_245_0, arg_245_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_245_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_245_1
	local var_245_2 = PathMgr.ReadAllLines(var_245_0)
	local var_245_3 = {}

	if arg_245_0 then
		setActive(arg_245_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_245_4()
		if arg_245_0 then
			setActive(arg_245_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_245_1)

		if var_245_1 then
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

	local var_245_5 = var_245_2.Length
	local var_245_6

	local function var_245_7(arg_248_0)
		if arg_248_0 < 0 then
			var_245_4()

			return
		end

		if arg_245_1 then
			setSlider(arg_245_1, 0, var_245_5, var_245_5 - arg_248_0)
		end

		local var_248_0 = string.split(var_245_2[arg_248_0], ",")
		local var_248_1 = var_248_0[1]
		local var_248_2 = var_248_0[3]
		local var_248_3 = PathMgr.getAssetBundle(var_248_1)

		if PathMgr.FileExists(var_248_3) then
			local var_248_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_248_1))

			if var_248_2 == HashUtil.CalcMD5(var_248_4) then
				onNextTick(function()
					var_245_7(arg_248_0 - 1)
				end)

				return
			end
		end

		var_245_1 = var_248_1

		var_245_4()
	end

	var_245_7(var_245_5 - 1)
end

function splitByWordEN(arg_250_0, arg_250_1)
	local var_250_0 = string.split(arg_250_0, " ")
	local var_250_1 = ""
	local var_250_2 = ""
	local var_250_3 = arg_250_1:GetComponent(typeof(RectTransform))
	local var_250_4 = arg_250_1:GetComponent(typeof(Text))
	local var_250_5 = var_250_3.rect.width

	for iter_250_0, iter_250_1 in ipairs(var_250_0) do
		local var_250_6 = var_250_2

		var_250_2 = var_250_2 == "" and iter_250_1 or var_250_2 .. " " .. iter_250_1

		setText(arg_250_1, var_250_2)

		if var_250_5 < var_250_4.preferredWidth then
			var_250_1 = var_250_1 == "" and var_250_6 or var_250_1 .. "\n" .. var_250_6
			var_250_2 = iter_250_1
		end

		if iter_250_0 >= #var_250_0 then
			var_250_1 = var_250_1 == "" and var_250_2 or var_250_1 .. "\n" .. var_250_2
		end
	end

	return var_250_1
end

function checkBirthFormat(arg_251_0)
	if #arg_251_0 ~= 8 then
		return false
	end

	local var_251_0 = 0
	local var_251_1 = #arg_251_0

	while var_251_0 < var_251_1 do
		local var_251_2 = string.byte(arg_251_0, var_251_0 + 1)

		if var_251_2 < 48 or var_251_2 > 57 then
			return false
		end

		var_251_0 = var_251_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_252_0)
	local var_252_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_252_0, function(arg_253_0)
		return arg_253_0 == arg_252_0
	end)
end

function GetServerState(arg_254_0)
	local var_254_0 = -1
	local var_254_1 = 0
	local var_254_2 = 1
	local var_254_3 = 2
	local var_254_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_254_4 = string.gsub(var_254_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_254_4, function(arg_255_0, arg_255_1)
		local var_255_0 = true
		local var_255_1 = false

		for iter_255_0 in string.gmatch(arg_255_1, "\"state\":%d") do
			if iter_255_0 ~= "\"state\":1" then
				var_255_0 = false
			end

			var_255_1 = true
		end

		if not var_255_1 then
			var_255_0 = false
		end

		if arg_254_0 ~= nil then
			arg_254_0(var_255_0 and var_254_2 or var_254_1)
		end
	end)
end

function setScrollText(arg_256_0, arg_256_1)
	GetOrAddComponent(arg_256_0, "ScrollText"):SetText(arg_256_1)
end

function changeToScrollText(arg_257_0, arg_257_1)
	local var_257_0 = GetComponent(arg_257_0, typeof(Text))

	assert(var_257_0, "without component<Text>")

	local var_257_1 = arg_257_0:Find("subText")

	if not var_257_1 then
		var_257_1 = cloneTplTo(arg_257_0, arg_257_0, "subText")

		eachChild(arg_257_0, function(arg_258_0)
			setActive(arg_258_0, arg_258_0 == var_257_1)
		end)

		arg_257_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_257_1, arg_257_1)
end

local var_0_18
local var_0_19
local var_0_20
local var_0_21

local function var_0_22(arg_259_0, arg_259_1, arg_259_2)
	local var_259_0 = arg_259_0:Find("base")
	local var_259_1, var_259_2, var_259_3 = Equipment.GetInfoTrans(arg_259_1, arg_259_2)

	if arg_259_1.nextValue then
		local var_259_4 = {
			name = arg_259_1.name,
			type = arg_259_1.type,
			value = arg_259_1.nextValue
		}
		local var_259_5, var_259_6 = Equipment.GetInfoTrans(var_259_4, arg_259_2)

		var_259_2 = var_259_2 .. setColorStr("   >   " .. var_259_6, COLOR_GREEN)
	end

	setText(var_259_0:Find("name"), var_259_1)

	if var_259_3 then
		local var_259_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_259_0:Find("value"), var_259_2 .. var_259_7)
	else
		setText(var_259_0:Find("value"), var_259_2)
	end

	setActive(var_259_0:Find("value/up"), arg_259_1.compare and arg_259_1.compare > 0)
	setActive(var_259_0:Find("value/down"), arg_259_1.compare and arg_259_1.compare < 0)
	triggerToggle(var_259_0, arg_259_1.lock_open)

	if not arg_259_1.lock_open and arg_259_1.sub and #arg_259_1.sub > 0 then
		GetComponent(var_259_0, typeof(Toggle)).enabled = true
	else
		setActive(var_259_0:Find("name/close"), false)
		setActive(var_259_0:Find("name/open"), false)

		GetComponent(var_259_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_23(arg_260_0, arg_260_1, arg_260_2, arg_260_3)
	var_0_22(arg_260_0, arg_260_2, arg_260_3)

	if not arg_260_2.sub or #arg_260_2.sub == 0 then
		return
	end

	var_0_20(arg_260_0:Find("subs"), arg_260_1, arg_260_2.sub, arg_260_3)
end

function var_0_20(arg_261_0, arg_261_1, arg_261_2, arg_261_3)
	removeAllChildren(arg_261_0)
	var_0_21(arg_261_0, arg_261_1, arg_261_2, arg_261_3)
end

function var_0_21(arg_262_0, arg_262_1, arg_262_2, arg_262_3)
	for iter_262_0, iter_262_1 in ipairs(arg_262_2) do
		local var_262_0 = cloneTplTo(arg_262_1, arg_262_0)

		var_0_23(var_262_0, arg_262_1, iter_262_1, arg_262_3)
	end
end

function updateEquipInfo(arg_263_0, arg_263_1, arg_263_2, arg_263_3)
	local var_263_0 = arg_263_0:Find("attr_tpl")

	var_0_20(arg_263_0:Find("attrs"), var_263_0, arg_263_1.attrs, arg_263_3)
	setActive(arg_263_0:Find("skill"), arg_263_2)

	if arg_263_2 then
		var_0_23(arg_263_0:Find("skill/attr"), var_263_0, {
			name = i18n("skill"),
			value = setColorStr(arg_263_2.name, "#FFDE00FF")
		}, arg_263_3)
		setText(arg_263_0:Find("skill/value/Text"), getSkillDescGet(arg_263_2.id))
	end

	setActive(arg_263_0:Find("weapon"), #arg_263_1.weapon.sub > 0)

	if #arg_263_1.weapon.sub > 0 then
		var_0_20(arg_263_0:Find("weapon"), var_263_0, {
			arg_263_1.weapon
		}, arg_263_3)
	end

	setActive(arg_263_0:Find("equip_info"), #arg_263_1.equipInfo.sub > 0)

	if #arg_263_1.equipInfo.sub > 0 then
		var_0_20(arg_263_0:Find("equip_info"), var_263_0, {
			arg_263_1.equipInfo
		}, arg_263_3)
	end

	var_0_23(arg_263_0:Find("part/attr"), var_263_0, {
		name = i18n("equip_info_23")
	}, arg_263_3)

	local var_263_1 = arg_263_0:Find("part/value")
	local var_263_2 = var_263_1:Find("label")
	local var_263_3 = {}
	local var_263_4 = {}

	if #arg_263_1.part[1] == 0 and #arg_263_1.part[2] == 0 then
		setmetatable(var_263_3, {
			__index = function(arg_264_0, arg_264_1)
				return true
			end
		})
		setmetatable(var_263_4, {
			__index = function(arg_265_0, arg_265_1)
				return true
			end
		})
	else
		for iter_263_0, iter_263_1 in ipairs(arg_263_1.part[1]) do
			var_263_3[iter_263_1] = true
		end

		for iter_263_2, iter_263_3 in ipairs(arg_263_1.part[2]) do
			var_263_4[iter_263_3] = true
		end
	end

	local var_263_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_263_3, var_263_4)

	UIItemList.StaticAlign(var_263_1, var_263_2, #var_263_5, function(arg_266_0, arg_266_1, arg_266_2)
		arg_266_1 = arg_266_1 + 1

		if arg_266_0 == UIItemList.EventUpdate then
			local var_266_0 = var_263_5[arg_266_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_266_0), arg_266_2)
			setActive(arg_266_2:Find("main"), var_263_3[var_266_0] and not var_263_4[var_266_0])
			setActive(arg_266_2:Find("sub"), var_263_4[var_266_0] and not var_263_3[var_266_0])
			setImageAlpha(arg_266_2, not var_263_3[var_266_0] and not var_263_4[var_266_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_267_0, arg_267_1, arg_267_2)
	local var_267_0 = arg_267_0:Find("attr_tpl")

	var_0_20(arg_267_0:Find("attrs"), var_267_0, arg_267_1.attrs, arg_267_2)
	setActive(arg_267_0:Find("weapon"), #arg_267_1.weapon.sub > 0)

	if #arg_267_1.weapon.sub > 0 then
		var_0_20(arg_267_0:Find("weapon"), var_267_0, {
			arg_267_1.weapon
		}, arg_267_2)
	end

	setActive(arg_267_0:Find("equip_info"), #arg_267_1.equipInfo.sub > 0)

	if #arg_267_1.equipInfo.sub > 0 then
		var_0_20(arg_267_0:Find("equip_info"), var_267_0, {
			arg_267_1.equipInfo
		}, arg_267_2)
	end
end

function setCanvasOverrideSorting(arg_268_0, arg_268_1)
	local var_268_0 = arg_268_0.parent

	arg_268_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_268_0) then
		GetOrAddComponent(arg_268_0, typeof(Canvas)).overrideSorting = arg_268_1
	else
		setActive(arg_268_0, true)

		GetOrAddComponent(arg_268_0, typeof(Canvas)).overrideSorting = arg_268_1

		setActive(arg_268_0, false)
	end

	arg_268_0:SetParent(var_268_0, false)
end

function createNewGameObject(arg_269_0, arg_269_1)
	local var_269_0 = GameObject.New()

	if arg_269_0 then
		var_269_0.name = "model"
	end

	var_269_0.layer = arg_269_1 or Layer.UI

	return GetOrAddComponent(var_269_0, "RectTransform")
end

function CreateShell(arg_270_0)
	if type(arg_270_0) ~= "table" and type(arg_270_0) ~= "userdata" then
		return arg_270_0
	end

	local var_270_0 = setmetatable({
		__index = arg_270_0
	}, arg_270_0)

	return setmetatable({}, var_270_0)
end

function CameraFittingSettin(arg_271_0)
	local var_271_0 = GetComponent(arg_271_0, typeof(Camera))
	local var_271_1 = 1.7777777777777777
	local var_271_2 = Screen.width / Screen.height

	if var_271_2 < var_271_1 then
		local var_271_3 = var_271_2 / var_271_1

		var_271_0.rect = var_0_0.Rect.New(0, (1 - var_271_3) / 2, 1, var_271_3)
	end
end

function SwitchSpecialChar(arg_272_0, arg_272_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_272_0 = arg_272_0:gsub(" ", " ")
		arg_272_0 = arg_272_0:gsub("\t", "    ")
	end

	if not arg_272_1 then
		arg_272_0 = arg_272_0:gsub("\n", " ")
	end

	return arg_272_0
end

function AfterCheck(arg_273_0, arg_273_1)
	local var_273_0 = {}

	for iter_273_0, iter_273_1 in ipairs(arg_273_0) do
		var_273_0[iter_273_0] = iter_273_1[1]()
	end

	arg_273_1()

	for iter_273_2, iter_273_3 in ipairs(arg_273_0) do
		if var_273_0[iter_273_2] ~= iter_273_3[1]() then
			iter_273_3[2]()
		end

		var_273_0[iter_273_2] = iter_273_3[1]()
	end
end

function CompareFuncs(arg_274_0, arg_274_1)
	local var_274_0 = {}

	local function var_274_1(arg_275_0, arg_275_1)
		var_274_0[arg_275_0] = var_274_0[arg_275_0] or {}
		var_274_0[arg_275_0][arg_275_1] = var_274_0[arg_275_0][arg_275_1] or arg_274_0[arg_275_0](arg_275_1)

		return var_274_0[arg_275_0][arg_275_1]
	end

	return function(arg_276_0, arg_276_1)
		local var_276_0 = 1

		while var_276_0 <= #arg_274_0 do
			local var_276_1 = var_274_1(var_276_0, arg_276_0)
			local var_276_2 = var_274_1(var_276_0, arg_276_1)

			if var_276_1 == var_276_2 then
				var_276_0 = var_276_0 + 1
			else
				return var_276_1 < var_276_2
			end
		end

		return tobool(arg_274_1)
	end
end

function DropResultIntegration(arg_277_0)
	local var_277_0 = {}
	local var_277_1 = 1

	while var_277_1 <= #arg_277_0 do
		local var_277_2 = arg_277_0[var_277_1].type
		local var_277_3 = arg_277_0[var_277_1].id

		var_277_0[var_277_2] = var_277_0[var_277_2] or {}

		if var_277_0[var_277_2][var_277_3] then
			local var_277_4 = arg_277_0[var_277_0[var_277_2][var_277_3]]
			local var_277_5 = table.remove(arg_277_0, var_277_1)

			var_277_4.count = var_277_4.count + var_277_5.count
		else
			var_277_0[var_277_2][var_277_3] = var_277_1
			var_277_1 = var_277_1 + 1
		end
	end

	local var_277_6 = {
		function(arg_278_0)
			local var_278_0 = arg_278_0.type
			local var_278_1 = arg_278_0.id

			if var_278_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_278_0 == DROP_TYPE_RESOURCE then
				if var_278_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_278_0 == DROP_TYPE_ITEM then
				if var_278_1 == 59010 then
					return 4
				elseif var_278_1 == 59900 then
					return 5
				else
					local var_278_2 = Item.getConfigData(var_278_1)
					local var_278_3 = var_278_2 and var_278_2.type or 0

					if var_278_3 == 9 then
						return 6
					elseif var_278_3 == 5 then
						return 7
					elseif var_278_3 == 4 then
						return 8
					elseif var_278_3 == 7 then
						return 9
					end
				end
			elseif var_278_0 == DROP_TYPE_VITEM and var_278_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_279_0)
			local var_279_0

			if arg_279_0.type == DROP_TYPE_SHIP then
				var_279_0 = pg.ship_data_statistics[arg_279_0.id]
			elseif arg_279_0.type == DROP_TYPE_ITEM then
				var_279_0 = Item.getConfigData(arg_279_0.id)
			end

			return (var_279_0 and var_279_0.rarity or 0) * -1
		end,
		function(arg_280_0)
			return arg_280_0.id
		end
	}

	table.sort(arg_277_0, CompareFuncs(var_277_6))
end

function getLoginConfig()
	if LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value then
		return false, "login", "", false, ""
	end

	local var_281_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_281_1 = 1

	for iter_281_0, iter_281_1 in ipairs(pg.login.all) do
		if pg.login[iter_281_1].date ~= "stop" then
			local var_281_2, var_281_3 = parseTimeConfig(pg.login[iter_281_1].date)

			assert(not var_281_3)

			if pg.TimeMgr.GetInstance():inTime(var_281_2, var_281_0) then
				var_281_1 = iter_281_1

				break
			end
		end
	end

	local var_281_4 = pg.login[var_281_1].login_static

	var_281_4 = var_281_4 ~= "" and var_281_4 or "login"

	local var_281_5 = pg.login[var_281_1].login_cri
	local var_281_6 = var_281_5 ~= "" and true or false
	local var_281_7 = pg.login[var_281_1].op_play == 1 and true or false
	local var_281_8 = pg.login[var_281_1].op_time

	if var_281_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_281_8, var_281_0) then
		var_281_7 = false
	end

	local var_281_9 = var_281_8 == "" and var_281_8 or table.concat(var_281_8[1][1])

	return var_281_6, var_281_6 and var_281_5 or var_281_4, pg.login[var_281_1].bgm, var_281_7, var_281_9
end

function setIntimacyIcon(arg_282_0, arg_282_1, arg_282_2)
	local var_282_0 = {}
	local var_282_1

	seriesAsync({
		function(arg_283_0)
			if arg_282_0.childCount > 0 then
				var_282_1 = arg_282_0:GetChild(0)

				arg_283_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_284_0)
					var_282_1 = tf(arg_284_0)

					setParent(var_282_1, arg_282_0)
					arg_283_0()
				end)
			end
		end,
		function(arg_285_0)
			setImageAlpha(var_282_1, arg_282_2 and 0 or 1)
			eachChild(var_282_1, function(arg_286_0)
				setActive(arg_286_0, false)
			end)

			if arg_282_2 then
				local var_285_0 = var_282_1:Find(arg_282_2 .. "(Clone)")

				if not var_285_0 then
					LoadAndInstantiateAsync("ui", arg_282_2, function(arg_287_0)
						setParent(arg_287_0, var_282_1)
						setActive(arg_287_0, true)
					end)
				else
					setActive(var_285_0, true)
				end
			elseif arg_282_1 then
				setImageSprite(var_282_1, GetSpriteFromAtlas("energy", arg_282_1), true)
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

function switch(arg_290_0, arg_290_1, arg_290_2, ...)
	if arg_290_1[arg_290_0] then
		return arg_290_1[arg_290_0](...)
	elseif arg_290_2 then
		return arg_290_2(...)
	end
end

function parseTimeConfig(arg_291_0)
	if type(arg_291_0[1]) == "table" then
		return arg_291_0[2], arg_291_0[1]
	else
		return arg_291_0
	end
end

local var_0_25 = {
	__add = function(arg_292_0, arg_292_1)
		return NewPos(arg_292_0.x + arg_292_1.x, arg_292_0.y + arg_292_1.y)
	end,
	__sub = function(arg_293_0, arg_293_1)
		return NewPos(arg_293_0.x - arg_293_1.x, arg_293_0.y - arg_293_1.y)
	end,
	__mul = function(arg_294_0, arg_294_1)
		if type(arg_294_1) == "number" then
			return NewPos(arg_294_0.x * arg_294_1, arg_294_0.y * arg_294_1)
		else
			return NewPos(arg_294_0.x * arg_294_1.x, arg_294_0.y * arg_294_1.y)
		end
	end,
	__eq = function(arg_295_0, arg_295_1)
		return arg_295_0.x == arg_295_1.x and arg_295_0.y == arg_295_1.y
	end,
	__tostring = function(arg_296_0)
		return arg_296_0.x .. "_" .. arg_296_0.y
	end
}

function NewPos(arg_297_0, arg_297_1)
	assert(arg_297_0 and arg_297_1)

	local var_297_0 = setmetatable({
		x = arg_297_0,
		y = arg_297_1
	}, var_0_25)

	function var_297_0.SqrMagnitude(arg_298_0)
		return arg_298_0.x * arg_298_0.x + arg_298_0.y * arg_298_0.y
	end

	function var_297_0.Normalize(arg_299_0)
		local var_299_0 = arg_299_0:SqrMagnitude()

		if var_299_0 > 1e-05 then
			return arg_299_0 * (1 / math.sqrt(var_299_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_297_0
end

local var_0_26

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_26 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_26 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_301_0)
	return (string.char(226, 133, 160 + (arg_301_0 - 1)))
end

function quickPlayAnimator(arg_302_0, arg_302_1)
	arg_302_0:GetComponent(typeof(Animator)):Play(arg_302_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_303_0, arg_303_1)
	local var_303_0 = arg_303_0:GetComponent(typeof(Animator))

	var_303_0.enabled = true

	local var_303_1 = Animator.StringToHash(arg_303_1)

	if var_303_0:HasState(0, var_303_1) then
		var_303_0:Play(arg_303_1, -1, 0)
	end
end

function quickPlayAnimation(arg_304_0, arg_304_1)
	local var_304_0 = arg_304_0:GetComponent(typeof(Animation))

	var_304_0:Stop()
	var_304_0:Play(arg_304_1)
end

function getSurveyUrl(arg_305_0)
	local var_305_0 = pg.survey_data_template[arg_305_0]
	local var_305_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_305_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_305_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_305_1 = var_305_0.main_url
				else
					var_305_1 = var_305_0.uo_url
				end
			elseif var_305_2 == PLATFORM_IPHONEPLAYER then
				var_305_1 = var_305_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_KR then
			var_305_1 = var_305_0.main_url
		end
	else
		var_305_1 = var_305_0.main_url
	end

	local var_305_3 = getProxy(PlayerProxy):getRawData().id
	local var_305_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_305_5
	local var_305_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_305_7 = getProxy(UserProxy):getRawData()
	local var_305_8 = getProxy(ServerProxy):getRawData()[var_305_7 and var_305_7.server or 0]
	local var_305_9 = var_305_8 and var_305_8.id or ""
	local var_305_10 = getProxy(PlayerProxy):getRawData().level
	local var_305_11 = var_305_3 .. "_" .. arg_305_0
	local var_305_12 = var_305_1
	local var_305_13 = {
		var_305_3,
		var_305_4,
		var_305_6,
		var_305_9,
		var_305_10,
		var_305_11
	}

	if var_305_12 then
		for iter_305_0, iter_305_1 in ipairs(var_305_13) do
			var_305_12 = string.gsub(var_305_12, "$" .. iter_305_0, tostring(iter_305_1))
		end
	end

	originalPrint("survey url", tostring(var_305_12))

	return var_305_12
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

function FilterVarchar(arg_307_0)
	assert(type(arg_307_0) == "string" or type(arg_307_0) == "table")

	if arg_307_0 == "" then
		return nil
	end

	return arg_307_0
end

function getGameset(arg_308_0)
	local var_308_0 = pg.gameset[arg_308_0]

	assert(var_308_0)

	return {
		var_308_0.key_value,
		var_308_0.description
	}
end

function getDorm3dGameset(arg_309_0)
	local var_309_0 = pg.dorm3d_set[arg_309_0]

	assert(var_309_0)

	return {
		var_309_0.key_value_int,
		var_309_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_310_0)
	arg_310_0 = arg_310_0 or {}

	local var_310_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_310_0 > 0 do
		local var_310_1 = table.remove(arg_310_0)

		switch(var_310_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_310_1:getConfig("open_directly") == 1 then
					for iter_311_0, iter_311_1 in ipairs(var_310_1:getConfig("display_icon")) do
						local var_311_0 = Drop.Create(iter_311_1)

						var_311_0.count = var_311_0.count * var_310_1.count

						table.insert(arg_310_0, var_311_0)
					end
				elseif var_310_1:getSubClass():IsShipExpType() then
					var_310_0[var_310_1.type][var_310_1.id] = defaultValue(var_310_0[var_310_1.type][var_310_1.id], 0) + var_310_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_310_0[var_310_1.type][var_310_1.id] = defaultValue(var_310_0[var_310_1.type][var_310_1.id], 0) + var_310_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_310_0[var_310_1.type] = var_310_0[var_310_1.type] + var_310_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_310_0[var_310_1.type] = var_310_0[var_310_1.type] + var_310_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_310_0[var_310_1.type] = var_310_0[var_310_1.type] + var_310_1.count
			end
		})
	end

	return var_310_0
end

function CheckOverflow(arg_316_0, arg_316_1)
	local var_316_0 = {}
	local var_316_1 = arg_316_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_316_2 = arg_316_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_316_3 = arg_316_0[DROP_TYPE_EQUIP]
	local var_316_4 = arg_316_0[DROP_TYPE_SHIP]
	local var_316_5 = getProxy(PlayerProxy):getRawData()
	local var_316_6 = false

	if arg_316_1 then
		local var_316_7 = var_316_5:OverStore(PlayerConst.ResStoreGold, var_316_1)
		local var_316_8 = var_316_5:OverStore(PlayerConst.ResStoreOil, var_316_2)

		if var_316_7 > 0 or var_316_8 > 0 then
			var_316_0.isStoreOverflow = {
				var_316_7,
				var_316_8
			}
		end
	else
		if var_316_1 > 0 and var_316_5:GoldMax(var_316_1) then
			return false, "gold"
		end

		if var_316_2 > 0 and var_316_5:OilMax(var_316_2) then
			return false, "oil"
		end
	end

	var_316_0.isExpBookOverflow = {}

	for iter_316_0, iter_316_1 in pairs(arg_316_0[DROP_TYPE_ITEM]) do
		local var_316_9 = Item.getConfigData(iter_316_0)

		if getProxy(BagProxy):getItemCountById(iter_316_0) + iter_316_1 > var_316_9.max_num then
			table.insert(var_316_0.isExpBookOverflow, iter_316_0)
		end
	end

	local var_316_10 = getProxy(EquipmentProxy):getCapacity()

	if var_316_3 > 0 and var_316_10 >= var_316_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_316_11 = getProxy(BayProxy):getShipCount()

	if var_316_4 > 0 and var_316_4 + var_316_11 > var_316_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_316_0
end

function CheckShipExpOverflow(arg_317_0)
	local var_317_0 = getProxy(BagProxy)

	for iter_317_0, iter_317_1 in pairs(arg_317_0[DROP_TYPE_ITEM]) do
		if var_317_0:getItemCountById(iter_317_0) + iter_317_1 > Item.getConfigData(iter_317_0).max_num then
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

function RegisterDetailButton(arg_318_0, arg_318_1, arg_318_2)
	Drop.Change(arg_318_2)
	switch(arg_318_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_318_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_319_0 = Item.getConfigData(arg_318_2.id).usage_arg
				local var_319_1 = var_319_0[3]

				if Item.InTimeLimitSkinAssigned(arg_318_2.id) then
					var_319_1 = table.mergeArray(var_319_0[2], var_319_1, true)
				end

				local var_319_2 = {}

				for iter_319_0, iter_319_1 in ipairs(var_319_0[2]) do
					var_319_2[iter_319_1] = true
				end

				onButton(arg_318_0, arg_318_1, function()
					arg_318_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = NewSelectSkinLayer,
							mediator = NewSkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_318_2.id,
								selectableSkinList = underscore.map(var_319_1, function(arg_321_0)
									return SelectableSkin.New({
										id = arg_321_0,
										isTimeLimit = var_319_2[arg_321_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_318_1, true)
			else
				local var_319_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_318_2.id) and "tech" or arg_318_2:getConfig("type")

				if var_0_27[var_319_3] then
					local var_319_4 = {
						item2Row = true,
						content = i18n(var_0_27[var_319_3]),
						itemList = underscore.map(arg_318_2:getConfig("display_icon"), function(arg_322_0)
							return Drop.Create(arg_322_0)
						end)
					}

					if var_319_3 == 11 then
						onButton(arg_318_0, arg_318_1, function()
							arg_318_0:emit(BaseUI.ON_DROP_LIST_OWN, var_319_4)
						end, SFX_PANEL)
					else
						onButton(arg_318_0, arg_318_1, function()
							arg_318_0:emit(BaseUI.ON_DROP_LIST, var_319_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_318_1, tobool(var_0_27[var_319_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_318_0, arg_318_1, function()
				arg_318_0:emit(BaseUI.ON_DROP, arg_318_2)
			end, SFX_PANEL)
			setActive(arg_318_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_318_0, arg_318_1, function()
				arg_318_0:emit(BaseUI.ON_DROP, arg_318_2)
			end, SFX_PANEL)
			setActive(arg_318_1, true)
		end
	}, function()
		setActive(arg_318_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_330_0, arg_330_1, arg_330_2)
	Drop.Change(arg_330_2)
	switch(arg_330_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_331_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_330_2.id) and "tech" or arg_330_2:getConfig("type")

			if var_0_27[var_331_0] then
				local var_331_1 = {
					useDeepShow = true,
					showOwn = var_331_0 == 11,
					content = i18n(var_0_27[var_331_0]),
					itemList = underscore.map(arg_330_2:getConfig("display_icon"), function(arg_332_0)
						return Drop.Create(arg_332_0)
					end)
				}

				onButton(arg_330_0, arg_330_1, function()
					arg_330_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_331_1)
				end, SFX_PANEL)
			end

			setActive(arg_330_1, tobool(var_0_27[var_331_0]))
		end
	}, function()
		setActive(arg_330_1, false)
	end)
end

function UpdateOwnDisplay(arg_335_0, arg_335_1)
	local var_335_0, var_335_1 = arg_335_1:getOwnedCount()

	setActive(arg_335_0, var_335_1 and var_335_0 > 0)

	if var_335_1 and var_335_0 > 0 then
		setText(arg_335_0:Find("label"), i18n("word_own1"))
		setText(arg_335_0:Find("Text"), var_335_0)
	end
end

function Damp(arg_336_0, arg_336_1, arg_336_2)
	arg_336_1 = Mathf.Max(1, arg_336_1)

	local var_336_0 = Mathf.Epsilon

	if arg_336_1 < var_336_0 or var_336_0 > Mathf.Abs(arg_336_0) then
		return arg_336_0
	end

	if arg_336_2 < var_336_0 then
		return 0
	end

	local var_336_1 = -4.605170186

	return arg_336_0 * (1 - Mathf.Exp(var_336_1 * arg_336_2 / arg_336_1))
end

function checkCullResume(arg_337_0, arg_337_1)
	if arg_337_1 or not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_337_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_337_0 = arg_337_0:GetComponentsInChildren(typeof(var_0_0.UI.Graphic)):ToTable()

		for iter_337_0, iter_337_1 in ipairs(var_337_0) do
			iter_337_1:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_338_0)
	local var_338_0 = {}

	if arg_338_0 and arg_338_0 ~= "" then
		local var_338_1 = base64.dec(arg_338_0)

		var_338_0 = string.split(var_338_1, "/")
		var_338_0[5], var_338_0[6] = unpack(string.split(var_338_0[5], "\\"))

		if #var_338_0 < 6 or arg_338_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_338_0, 5), "/"),
			var_338_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_338_0 = {}
		end
	end

	for iter_338_0 = 1, 6 do
		var_338_0[iter_338_0] = var_338_0[iter_338_0] and tonumber(var_338_0[iter_338_0], 32) or 0
	end

	return var_338_0
end

function buildEquipCode(arg_339_0)
	local var_339_0 = underscore.map(arg_339_0:getAllEquipments(), function(arg_340_0)
		return ConversionBase(32, arg_340_0 and arg_340_0.id or 0)
	end)
	local var_339_1 = {
		table.concat(var_339_0, "/"),
		ConversionBase(32, checkExist(arg_339_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_339_1, "\\"))
end

function setDirectorSpeed(arg_341_0, arg_341_1)
	GetComponent(arg_341_0, typeof(TimelineSpeed)):SetTimelineSpeed(arg_341_1)
end

function setDefaultZeroMetatable(arg_342_0)
	return setmetatable(arg_342_0, {
		__index = function(arg_343_0, arg_343_1)
			if rawget(arg_343_0, arg_343_1) == nil then
				arg_343_0[arg_343_1] = 0
			end

			return arg_343_0[arg_343_1]
		end
	})
end

function checkABExist(arg_344_0)
	if EDITOR_TOOL then
		return ResourceMgr.Inst:AssetExist(arg_344_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_344_0))
	end
end

function compareNumber(arg_345_0, arg_345_1, arg_345_2)
	return switch(arg_345_1, {
		[">"] = function()
			return arg_345_0 > arg_345_2
		end,
		[">="] = function()
			return arg_345_0 >= arg_345_2
		end,
		["="] = function()
			return arg_345_0 == arg_345_2
		end,
		["<"] = function()
			return arg_345_0 < arg_345_2
		end,
		["<="] = function()
			return arg_345_0 <= arg_345_2
		end
	})
end

function ArabicToRoman(arg_351_0)
	local var_351_0 = {
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

	local function var_351_1(arg_352_0, arg_352_1)
		return select(2, arg_352_0:gsub(arg_352_1, ""))
	end

	local var_351_2 = ""

	while arg_351_0 > 0 do
		for iter_351_0, iter_351_1 in pairs(var_351_0) do
			local var_351_3 = iter_351_1[2]
			local var_351_4 = iter_351_1[1]

			while var_351_4 <= arg_351_0 do
				var_351_2 = var_351_2 .. var_351_3
				arg_351_0 = arg_351_0 - var_351_4
			end
		end
	end

	if arg_351_0 > 10000 then
		local var_351_5 = var_351_1(var_351_2, "M")

		var_351_2 = "M*" .. var_351_5 .. " " .. var_351_2
	end

	return var_351_2
end

function stringInset(arg_353_0, ...)
	for iter_353_0, iter_353_1 in ipairs({
		...
	}) do
		arg_353_0 = string.gsub(arg_353_0, "$" .. iter_353_0, iter_353_1)
	end

	return arg_353_0
end

function addSubLayer(arg_354_0, arg_354_1, arg_354_2, arg_354_3, arg_354_4)
	if arg_354_2 then
		while arg_354_1.parent do
			arg_354_1 = arg_354_1.parent
		end
	end

	local var_354_0 = {
		parentContext = arg_354_1,
		context = arg_354_0,
		callback = arg_354_3
	}

	var_354_0 = arg_354_4 and table.merge(var_354_0, arg_354_4) or var_354_0

	pg.m02:sendNotification(GAME.LOAD_LAYERS, var_354_0)
end
