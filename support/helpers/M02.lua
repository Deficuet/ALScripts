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

function GetPrefabFromAtlasAsync(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = pg.PoolMgr.GetInstance()

	var_0_1[arg_29_1] = arg_29_0

	var_29_0:GetPrefab(arg_29_0, "", true, function(arg_30_0)
		if IsNil(arg_29_1) or var_0_1[arg_29_1] ~= arg_29_0 then
			var_29_0:ReturnPrefab(arg_29_0, "", arg_30_0)

			return
		elseif tf(arg_29_1):Find(arg_30_0.name) then
			var_29_0:ReturnPrefab(arg_29_0, "", arg_30_0)

			arg_30_0 = tf(arg_29_1):Find(arg_30_0.name).gameObject
		else
			setParent(arg_30_0, arg_29_1)
		end

		var_0_1[arg_29_1] = nil

		arg_29_2(arg_30_0)
	end)
end

function SetAction(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = GetComponent(arg_31_0, "SkeletonGraphic").AnimationState

	var_31_0:SetAnimation(0, arg_31_1, defaultValue(arg_31_2, true))
	var_31_0:Update(Time.deltaTime)
end

function SetActionCallback(arg_32_0, arg_32_1)
	GetOrAddComponent(arg_32_0, typeof(SpineAnimUI)):SetActionCallBack(arg_32_1)
end

function emojiText(arg_33_0, arg_33_1)
	local var_33_0 = GetComponent(arg_33_0, "TextMesh")
	local var_33_1 = GetComponent(arg_33_0, "MeshRenderer")
	local var_33_2 = Shader.Find("UI/Unlit/Transparent")
	local var_33_3 = var_33_1.materials
	local var_33_4 = {
		var_33_3[0]
	}
	local var_33_5 = {}
	local var_33_6 = 0
	local var_33_7 = {}
	local var_33_8 = string.gsub(arg_33_1, "#(%d+)#", function(arg_34_0)
		if not var_33_5[arg_34_0] then
			var_33_6 = var_33_6 + 1
			var_33_7["emoji" .. arg_34_0] = Material.New(var_33_2)

			table.insert(var_33_4, mat)

			var_33_5[arg_34_0] = var_33_6

			local var_34_0 = var_33_6
		end

		return "<quad material=" .. var_33_6 .. " />"
	end)
	local var_33_9 = AssetBundleHelper.LoadManyAssets("emojis", underscore.keys(var_33_7), nil, false, nil, true)

	for iter_33_0, iter_33_1 in pairs(var_33_7) do
		iter_33_1.mainTexture = var_33_9[iter_33_0]
	end

	var_33_0.text = var_33_8
	var_33_1.materials = var_33_4
end

function setPaintingImg(arg_35_0, arg_35_1)
	local var_35_0 = LoadSprite("painting/" .. arg_35_1) or LoadSprite("painting/unknown")

	setImageSprite(arg_35_0, var_35_0)
	resetAspectRatio(arg_35_0)
end

function setPaintingPrefab(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5)
	local var_36_0 = findTF(arg_36_0, "fitter")

	assert(var_36_0, "请添加子物体fitter")
	removeAllChildren(var_36_0)

	local var_36_1 = GetOrAddComponent(var_36_0, "PaintingScaler")

	var_36_1.FrameName = arg_36_2 or ""
	var_36_1.Tween = 1

	local var_36_2 = arg_36_1

	if not arg_36_3 and checkABExist("painting/" .. arg_36_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_36_1, 0) ~= 0 then
		arg_36_1 = arg_36_1 .. "_n"
	end

	PoolMgr.GetInstance():GetPainting(arg_36_1, false, function(arg_37_0)
		setParent(arg_37_0, var_36_0, false)

		local var_37_0 = findTF(arg_37_0, "Touch")

		if not IsNil(var_37_0) then
			setActive(var_37_0, false)
		end

		local var_37_1 = findTF(arg_37_0, "hx")

		if not IsNil(var_37_1) then
			setActive(var_37_1, HXSet.isHx())
		end

		ShipExpressionHelper.SetExpression(var_36_0:GetChild(0), var_36_2)
		existCall(arg_36_5)
	end)
	PaintingShiftTransform(var_36_0, arg_36_2, arg_36_4)
end

local var_0_2 = {}

function setPaintingPrefabAsync(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	local var_38_0 = arg_38_1

	if checkABExist("painting/" .. arg_38_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_38_1, 0) ~= 0 then
		arg_38_1 = arg_38_1 .. "_n"
	end

	LoadPaintingPrefabAsync(arg_38_0, var_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
end

function LoadPaintingPrefabAsync(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4, arg_39_5)
	local var_39_0 = findTF(arg_39_0, "fitter")

	assert(var_39_0, "请添加子物体fitter")
	removeAllChildren(var_39_0)

	local var_39_1 = GetOrAddComponent(var_39_0, "PaintingScaler")

	var_39_1.FrameName = arg_39_3 or ""
	var_39_1.Tween = 1
	var_0_2[arg_39_0] = arg_39_2

	PoolMgr.GetInstance():GetPainting(arg_39_2, true, function(arg_40_0)
		if IsNil(arg_39_0) or var_0_2[arg_39_0] ~= arg_39_2 then
			PoolMgr.GetInstance():ReturnPainting(arg_39_2, arg_40_0)

			return
		else
			setParent(arg_40_0, var_39_0, false)

			var_0_2[arg_39_0] = nil

			ShipExpressionHelper.SetExpression(arg_40_0, arg_39_1)
		end

		local var_40_0 = findTF(arg_40_0, "Touch")

		if not IsNil(var_40_0) then
			setActive(var_40_0, false)
		end

		local var_40_1 = findTF(arg_40_0, "Drag")

		if not IsNil(var_40_1) then
			setActive(var_40_1, false)
		end

		local var_40_2 = findTF(arg_40_0, "hx")

		if not IsNil(var_40_2) then
			setActive(var_40_2, HXSet.isHx())
		end

		if arg_39_4 then
			arg_39_4(arg_40_0)
		end
	end)
	PaintingShiftTransform(var_39_0, arg_39_3, arg_39_5)
end

local var_0_3 = {
	pifu = "skin_card_shift",
	biandui = "formation_shift"
}

function PaintingShiftTransform(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_0.parent:GetComponent(typeof(RectTransform))
	local var_41_1 = var_0_3[arg_41_1]

	if var_41_1 ~= nil and arg_41_2 ~= nil then
		local var_41_2 = pg.ship_skin_newmainui_shift[arg_41_2.skinID]

		if var_41_2 then
			local var_41_3 = var_41_2[var_41_1]

			var_41_0.localEulerAngles = Vector3(0, 0, var_41_3[5] and var_41_3[5] or 0)

			return
		end
	end

	var_41_0.localEulerAngles = Vector3(0, 0, 0)
end

function retPaintingPrefab(arg_42_0, arg_42_1, arg_42_2)
	if arg_42_0 and arg_42_1 then
		local var_42_0 = findTF(arg_42_0, "fitter")

		if var_42_0 and var_42_0.childCount > 0 then
			local var_42_1 = var_42_0:GetChild(0)

			if not IsNil(var_42_1) then
				local var_42_2 = findTF(var_42_1, "Touch")

				if not IsNil(var_42_2) then
					eachChild(var_42_2, function(arg_43_0)
						local var_43_0 = arg_43_0:GetComponent(typeof(Button))

						if not IsNil(var_43_0) then
							removeOnButton(arg_43_0)
						end
					end)
				end

				if not arg_42_2 then
					PoolMgr.GetInstance():ReturnPainting(string.gsub(var_42_1.name, "%(Clone%)", ""), var_42_1.gameObject)
				else
					PoolMgr.GetInstance():ReturnPaintingWithPrefix(string.gsub(var_42_1.name, "%(Clone%)", ""), var_42_1.gameObject, arg_42_2)
				end
			end
		end

		var_0_2[arg_42_0] = nil
	end
end

function checkPaintingPrefab(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	local var_44_0 = findTF(arg_44_0, "fitter")

	assert(var_44_0, "请添加子物体fitter")
	removeAllChildren(var_44_0)

	local var_44_1 = GetOrAddComponent(var_44_0, "PaintingScaler")

	var_44_1.FrameName = arg_44_2 or ""
	var_44_1.Tween = 1

	local var_44_2 = arg_44_4 or "painting/"
	local var_44_3 = arg_44_1

	if not arg_44_3 and checkABExist(var_44_2 .. arg_44_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_44_1, 0) ~= 0 then
		arg_44_1 = arg_44_1 .. "_n"
	end

	return var_44_0, arg_44_1, var_44_3
end

function onLoadedPaintingPrefab(arg_45_0)
	local var_45_0 = arg_45_0.paintingTF
	local var_45_1 = arg_45_0.fitterTF
	local var_45_2 = arg_45_0.defaultPaintingName

	setParent(var_45_0, var_45_1, false)

	local var_45_3 = findTF(var_45_0, "Touch")

	if not IsNil(var_45_3) then
		setActive(var_45_3, false)
	end

	local var_45_4 = findTF(var_45_0, "hx")

	if not IsNil(var_45_4) then
		setActive(var_45_4, HXSet.isHx())
	end

	ShipExpressionHelper.SetExpression(var_45_1:GetChild(0), var_45_2)
end

function onLoadedPaintingPrefabAsync(arg_46_0)
	local var_46_0 = arg_46_0.paintingTF
	local var_46_1 = arg_46_0.fitterTF
	local var_46_2 = arg_46_0.objectOrTransform
	local var_46_3 = arg_46_0.paintingName
	local var_46_4 = arg_46_0.defaultPaintingName
	local var_46_5 = arg_46_0.callback

	if IsNil(var_46_2) or var_0_2[var_46_2] ~= var_46_3 then
		PoolMgr.GetInstance():ReturnPainting(var_46_3, var_46_0)

		return
	else
		setParent(var_46_0, var_46_1, false)

		var_0_2[var_46_2] = nil

		ShipExpressionHelper.SetExpression(var_46_0, var_46_4)
	end

	local var_46_6 = findTF(var_46_0, "Touch")

	if not IsNil(var_46_6) then
		setActive(var_46_6, false)
	end

	local var_46_7 = findTF(var_46_0, "hx")

	if not IsNil(var_46_7) then
		setActive(var_46_7, HXSet.isHx())
	end

	if var_46_5 then
		var_46_5()
	end
end

function setCommanderPaintingPrefab(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0, var_47_1, var_47_2 = checkPaintingPrefab(arg_47_0, arg_47_1, arg_47_2, arg_47_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_47_1, false, function(arg_48_0)
		local var_48_0 = {
			paintingTF = arg_48_0,
			fitterTF = var_47_0,
			defaultPaintingName = var_47_2
		}

		onLoadedPaintingPrefab(var_48_0)
	end, "commanderpainting/")
end

function setCommanderPaintingPrefabAsync(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	local var_49_0, var_49_1, var_49_2 = checkPaintingPrefab(arg_49_0, arg_49_1, arg_49_2, arg_49_4)

	var_0_2[arg_49_0] = var_49_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_49_1, true, function(arg_50_0)
		local var_50_0 = {
			paintingTF = arg_50_0,
			fitterTF = var_49_0,
			objectOrTransform = arg_49_0,
			paintingName = var_49_1,
			defaultPaintingName = var_49_2,
			callback = arg_49_3
		}

		onLoadedPaintingPrefabAsync(var_50_0)
	end, "commanderpainting/")
end

function retCommanderPaintingPrefab(arg_51_0, arg_51_1)
	retPaintingPrefab(arg_51_0, arg_51_1, "commanderpainting/")
end

function setMetaPaintingPrefab(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	local var_52_0, var_52_1, var_52_2 = checkPaintingPrefab(arg_52_0, arg_52_1, arg_52_2, arg_52_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_52_1, false, function(arg_53_0)
		local var_53_0 = {
			paintingTF = arg_53_0,
			fitterTF = var_52_0,
			defaultPaintingName = var_52_2
		}

		onLoadedPaintingPrefab(var_53_0)
	end, "metapainting/")
end

function setMetaPaintingPrefabAsync(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4)
	local var_54_0, var_54_1, var_54_2 = checkPaintingPrefab(arg_54_0, arg_54_1, arg_54_2, arg_54_4)

	var_0_2[arg_54_0] = var_54_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_54_1, true, function(arg_55_0)
		local var_55_0 = {
			paintingTF = arg_55_0,
			fitterTF = var_54_0,
			objectOrTransform = arg_54_0,
			paintingName = var_54_1,
			defaultPaintingName = var_54_2,
			callback = arg_54_3
		}

		onLoadedPaintingPrefabAsync(var_55_0)
	end, "metapainting/")
end

function retMetaPaintingPrefab(arg_56_0, arg_56_1)
	retPaintingPrefab(arg_56_0, arg_56_1, "metapainting/")
end

function setGuildPaintingPrefab(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
	local var_57_0, var_57_1, var_57_2 = checkPaintingPrefab(arg_57_0, arg_57_1, arg_57_2, arg_57_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_57_1, false, function(arg_58_0)
		local var_58_0 = {
			paintingTF = arg_58_0,
			fitterTF = var_57_0,
			defaultPaintingName = var_57_2
		}

		onLoadedPaintingPrefab(var_58_0)
	end, "guildpainting/")
end

function setGuildPaintingPrefabAsync(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4)
	local var_59_0, var_59_1, var_59_2 = checkPaintingPrefab(arg_59_0, arg_59_1, arg_59_2, arg_59_4)

	var_0_2[arg_59_0] = var_59_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_59_1, true, function(arg_60_0)
		local var_60_0 = {
			paintingTF = arg_60_0,
			fitterTF = var_59_0,
			objectOrTransform = arg_59_0,
			paintingName = var_59_1,
			defaultPaintingName = var_59_2,
			callback = arg_59_3
		}

		onLoadedPaintingPrefabAsync(var_60_0)
	end, "guildpainting/")
end

function retGuildPaintingPrefab(arg_61_0, arg_61_1)
	retPaintingPrefab(arg_61_0, arg_61_1, "guildpainting/")
end

function setShopPaintingPrefab(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	local var_62_0, var_62_1, var_62_2 = checkPaintingPrefab(arg_62_0, arg_62_1, arg_62_2, arg_62_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_62_1, false, function(arg_63_0)
		local var_63_0 = {
			paintingTF = arg_63_0,
			fitterTF = var_62_0,
			defaultPaintingName = var_62_2
		}
		local var_63_1 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()
		local var_63_2 = findTF(arg_63_0, "exchange_hx_ch" .. var_63_1)

		if not IsNil(var_63_2) then
			setActive(var_63_2, HXSet.isHx())
		end

		onLoadedPaintingPrefab(var_63_0)
	end, "shoppainting/")
end

function retShopPaintingPrefab(arg_64_0, arg_64_1)
	retPaintingPrefab(arg_64_0, arg_64_1, "shoppainting/")
end

function setBuildPaintingPrefabAsync(arg_65_0, arg_65_1, arg_65_2, arg_65_3, arg_65_4)
	local var_65_0, var_65_1, var_65_2 = checkPaintingPrefab(arg_65_0, arg_65_1, arg_65_2, arg_65_4)

	var_0_2[arg_65_0] = var_65_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_65_1, true, function(arg_66_0)
		local var_66_0 = {
			paintingTF = arg_66_0,
			fitterTF = var_65_0,
			objectOrTransform = arg_65_0,
			paintingName = var_65_1,
			defaultPaintingName = var_65_2,
			callback = arg_65_3
		}

		onLoadedPaintingPrefabAsync(var_66_0)
	end, "buildpainting/")
end

function retBuildPaintingPrefab(arg_67_0, arg_67_1)
	retPaintingPrefab(arg_67_0, arg_67_1, "buildpainting/")
end

function setColorCount(arg_68_0, arg_68_1, arg_68_2)
	setText(arg_68_0, string.format(arg_68_1 < arg_68_2 and "<color=" .. COLOR_RED .. ">%d</color>/%d" or "%d/%d", arg_68_1, arg_68_2))
end

function customColorCount(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4)
	arg_69_0.text = _customColorCount(arg_69_1, arg_69_2, arg_69_3, arg_69_4)
end

function _customColorCount(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
	local var_70_0 = arg_70_0 < arg_70_1 and arg_70_3 or arg_70_2

	return string.format("<color=" .. var_70_0 .. ">%d</color>/%d" or "%d/%d", arg_70_0, arg_70_1)
end

function setColorStr(arg_71_0, arg_71_1)
	return "<color=" .. arg_71_1 .. ">" .. arg_71_0 .. "</color>"
end

function setSizeStr(arg_72_0, arg_72_1)
	local var_72_0, var_72_1 = string.gsub(arg_72_0, "[<]size=%d+[>]", "<size=" .. arg_72_1 .. ">")

	if var_72_1 == 0 then
		var_72_0 = "<size=" .. arg_72_1 .. ">" .. var_72_0 .. "</size>"
	end

	return var_72_0
end

function getBgm(arg_73_0, arg_73_1)
	local var_73_0 = pg.voice_bgm[arg_73_0]

	if pg.CriMgr.GetInstance():IsDefaultBGM() then
		return var_73_0 and var_73_0.default_bgm or nil
	elseif var_73_0 then
		if var_73_0.special_bgm and type(var_73_0.special_bgm) == "table" and #var_73_0.special_bgm > 0 and _.all(var_73_0.special_bgm, function(arg_74_0)
			return type(arg_74_0) == "table" and #arg_74_0 > 2 and type(arg_74_0[2]) == "number"
		end) then
			local var_73_1 = Clone(var_73_0.special_bgm)

			table.sort(var_73_1, function(arg_75_0, arg_75_1)
				return arg_75_0[2] > arg_75_1[2]
			end)

			local var_73_2 = ""

			_.each(var_73_1, function(arg_76_0)
				if var_73_2 ~= "" then
					return
				end

				local var_76_0 = arg_76_0[1]
				local var_76_1 = arg_76_0[3]

				switch(var_76_0, {
					function()
						local var_77_0 = var_76_1[1]
						local var_77_1 = var_76_1[2]

						if #var_77_0 == 1 then
							if var_77_0[1] ~= "always" then
								return
							end
						elseif not pg.TimeMgr.GetInstance():inTime(var_77_0) then
							return
						end

						_.each(var_77_1, function(arg_78_0)
							if var_73_2 ~= "" then
								return
							end

							if #arg_78_0 == 2 and pg.TimeMgr.GetInstance():inPeriod(arg_78_0[1]) then
								var_73_2 = arg_78_0[2]
							elseif #arg_78_0 == 3 and pg.TimeMgr.GetInstance():inPeriod(arg_78_0[1], arg_78_0[2]) then
								var_73_2 = arg_78_0[3]
							end
						end)
					end,
					function()
						local var_79_0 = false
						local var_79_1 = ""

						_.each(var_76_1, function(arg_80_0)
							if #arg_80_0 ~= 2 or var_79_0 then
								return
							end

							if pg.NewStoryMgr.GetInstance():IsPlayed(arg_80_0[1]) then
								var_73_2 = arg_80_0[2]

								if var_73_2 ~= "" then
									var_79_1 = var_73_2
								else
									var_73_2 = var_79_1
								end
							else
								var_79_0 = true
							end
						end)
					end,
					function()
						if not arg_73_1 then
							return
						end

						_.each(var_76_1, function(arg_82_0)
							if #arg_82_0 == 2 and arg_82_0[1] == arg_73_1 then
								var_73_2 = arg_82_0[2]

								return
							end
						end)
					end
				})
			end)

			return var_73_2 ~= "" and var_73_2 or var_73_0.bgm
		else
			return var_73_0 and var_73_0.bgm or nil
		end
	else
		return nil
	end
end

function playStory(arg_83_0, arg_83_1)
	pg.NewStoryMgr.GetInstance():Play(arg_83_0, arg_83_1)
end

function errorMessage(arg_84_0)
	local var_84_0 = ERROR_MESSAGE[arg_84_0]

	if var_84_0 == nil then
		var_84_0 = ERROR_MESSAGE[9999] .. ":" .. arg_84_0
	end

	return var_84_0
end

function errorTip(arg_85_0, arg_85_1, ...)
	local var_85_0 = pg.gametip[arg_85_0 .. "_error"]
	local var_85_1

	if var_85_0 then
		var_85_1 = var_85_0.tip
	else
		var_85_1 = pg.gametip.common_error.tip
	end

	local var_85_2 = arg_85_0 .. "_error_" .. arg_85_1

	if pg.gametip[var_85_2] then
		local var_85_3 = i18n(var_85_2, ...)

		return var_85_1 .. var_85_3
	else
		local var_85_4 = "common_error_" .. arg_85_1

		if pg.gametip[var_85_4] then
			local var_85_5 = i18n(var_85_4, ...)

			return var_85_1 .. var_85_5
		else
			local var_85_6 = errorMessage(arg_85_1)

			return var_85_1 .. arg_85_1 .. ":" .. var_85_6
		end
	end
end

function colorNumber(arg_86_0, arg_86_1)
	local var_86_0 = "@COLOR_SCOPE"
	local var_86_1 = {}

	arg_86_0 = string.gsub(arg_86_0, "<color=#%x+>", function(arg_87_0)
		table.insert(var_86_1, arg_87_0)

		return var_86_0
	end)
	arg_86_0 = string.gsub(arg_86_0, "%d+%.?%d*%%*", function(arg_88_0)
		return "<color=" .. arg_86_1 .. ">" .. arg_88_0 .. "</color>"
	end)

	if #var_86_1 > 0 then
		local var_86_2 = 0

		return (string.gsub(arg_86_0, var_86_0, function(arg_89_0)
			var_86_2 = var_86_2 + 1

			return var_86_1[var_86_2]
		end))
	else
		return arg_86_0
	end
end

function getBounds(arg_90_0)
	local var_90_0 = LuaHelper.GetWorldCorners(rtf(arg_90_0))
	local var_90_1 = Bounds.New(var_90_0[0], Vector3.zero)

	var_90_1:Encapsulate(var_90_0[2])

	return var_90_1
end

local function var_0_4(arg_91_0, arg_91_1)
	arg_91_0.localScale = Vector3.one
	arg_91_0.anchorMin = Vector2.zero
	arg_91_0.anchorMax = Vector2.one
	arg_91_0.offsetMin = Vector2(arg_91_1[1], arg_91_1[2])
	arg_91_0.offsetMax = Vector2(-arg_91_1[3], -arg_91_1[4])
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

function setFrame(arg_92_0, arg_92_1, arg_92_2)
	arg_92_1 = tostring(arg_92_1)

	local var_92_0, var_92_1 = unpack((string.split(arg_92_1, "_")))

	if var_92_1 or tonumber(var_92_0) > 5 then
		arg_92_2 = arg_92_2 or "frame" .. arg_92_1
	end

	GetImageSpriteFromAtlasAsync("weaponframes", "frame", arg_92_0)

	local var_92_2 = arg_92_2 and Color.white or Color.NewHex(ItemRarity.Rarity2FrameHexColor(var_92_0 and tonumber(var_92_0) or ItemRarity.Gray))

	setImageColor(arg_92_0, var_92_2)

	local var_92_3 = findTF(arg_92_0, "specialFrame")

	if arg_92_2 then
		if var_92_3 then
			setActive(var_92_3, true)
		else
			var_92_3 = cloneTplTo(arg_92_0, arg_92_0, "specialFrame")

			removeAllChildren(var_92_3)
		end

		var_0_4(var_92_3, var_0_5[arg_92_2] or var_0_5.other)
		GetImageSpriteFromAtlasAsync("weaponframes", arg_92_2, var_92_3)
	elseif var_92_3 then
		setActive(var_92_3, false)
	end
end

function setIconColorful(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	arg_93_3 = arg_93_3 or {
		[ItemRarity.SSR] = {
			name = "IconColorful",
			active = function(arg_94_0, arg_94_1)
				return not arg_94_1.noIconColorful and arg_94_0 == ItemRarity.SSR
			end
		}
	}

	local var_93_0 = findTF(arg_93_0, "icon_bg/frame")

	for iter_93_0, iter_93_1 in pairs(arg_93_3) do
		local var_93_1 = iter_93_1.name
		local var_93_2 = iter_93_1.active(arg_93_1, arg_93_2)
		local var_93_3 = var_93_0:Find(var_93_1 .. "(Clone)")

		if var_93_3 then
			setActive(var_93_3, var_93_2)
		elseif var_93_2 then
			LoadAndInstantiateAsync("ui", string.lower(var_93_1), function(arg_95_0)
				if IsNil(arg_93_0) or var_93_0:Find(var_93_1 .. "(Clone)") then
					Object.Destroy(arg_95_0)
				else
					local var_95_0 = var_0_6[arg_95_0.name] or 999
					local var_95_1 = underscore.range(var_93_0.childCount):chain():map(function(arg_96_0)
						return var_93_0:GetChild(arg_96_0 - 1)
					end):map(function(arg_97_0)
						return var_0_6[arg_97_0.name] or 0
					end):value()
					local var_95_2 = 0

					for iter_95_0 = #var_95_1, 1, -1 do
						if var_95_0 > var_95_1[iter_95_0] then
							var_95_2 = iter_95_0

							break
						end
					end

					setParent(arg_95_0, var_93_0)
					tf(arg_95_0):SetSiblingIndex(var_95_2)
					setActive(arg_95_0, var_93_2)
				end
			end)
		end
	end
end

function setIconStars(arg_98_0, arg_98_1, arg_98_2)
	local var_98_0 = findTF(arg_98_0, "icon_bg/startpl")
	local var_98_1 = findTF(arg_98_0, "icon_bg/stars")

	if var_98_1 and var_98_0 then
		setActive(var_98_1, false)
		setActive(var_98_0, false)
	end

	if not var_98_1 or not arg_98_1 then
		return
	end

	for iter_98_0 = 1, math.max(arg_98_2, var_98_1.childCount) do
		setActive(iter_98_0 > var_98_1.childCount and cloneTplTo(var_98_0, var_98_1) or var_98_1:GetChild(iter_98_0 - 1), iter_98_0 <= arg_98_2)
	end

	setActive(var_98_1, true)
end

local function var_0_7(arg_99_0, arg_99_1)
	local var_99_0 = findTF(arg_99_0, "icon_bg/slv")

	if not IsNil(var_99_0) then
		setActive(var_99_0, arg_99_1 > 0)
		setText(findTF(var_99_0, "Text"), arg_99_1)
	end
end

function setIconName(arg_100_0, arg_100_1, arg_100_2)
	local var_100_0 = findTF(arg_100_0, "name")

	if not IsNil(var_100_0) then
		setText(var_100_0, arg_100_1)
		setTextAlpha(var_100_0, (arg_100_2.hideName or arg_100_2.anonymous) and 0 or 1)
	end
end

function setIconCount(arg_101_0, arg_101_1)
	local var_101_0 = findTF(arg_101_0, "icon_bg/count")

	if not IsNil(var_101_0) then
		setText(var_101_0, arg_101_1 and (type(arg_101_1) ~= "number" or arg_101_1 > 0) and arg_101_1 or "")
	end
end

function updateEquipment(arg_102_0, arg_102_1, arg_102_2)
	arg_102_2 = arg_102_2 or {}

	assert(arg_102_1, "equipmentVo can not be nil.")

	local var_102_0 = EquipmentRarity.Rarity2Print(arg_102_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_102_0, findTF(arg_102_0, "icon_bg"))
	setFrame(findTF(arg_102_0, "icon_bg/frame"), var_102_0)

	local var_102_1 = findTF(arg_102_0, "icon_bg/icon")

	var_0_4(var_102_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. arg_102_1:getConfig("icon"), "", var_102_1)
	setIconStars(arg_102_0, true, arg_102_1:getConfig("rarity"))
	var_0_7(arg_102_0, arg_102_1:getConfig("level") - 1)
	setIconName(arg_102_0, arg_102_1:getConfig("name"), arg_102_2)
	setIconCount(arg_102_0, arg_102_1.count)
	setIconColorful(arg_102_0, arg_102_1:getConfig("rarity") - 1, arg_102_2)
end

function updateItem(arg_103_0, arg_103_1, arg_103_2)
	arg_103_2 = arg_103_2 or {}

	local var_103_0 = ItemRarity.Rarity2Print(arg_103_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_103_0, findTF(arg_103_0, "icon_bg"))

	local var_103_1

	if arg_103_1:getConfig("type") == 9 then
		var_103_1 = "frame_design"
	elseif arg_103_1:getConfig("type") == 100 then
		var_103_1 = "frame_dorm"
	elseif arg_103_1.id == 44004 then
		var_103_1 = "frame8_1"
	elseif arg_103_2.frame then
		var_103_1 = arg_103_2.frame
	end

	setFrame(findTF(arg_103_0, "icon_bg/frame"), var_103_0, var_103_1)

	local var_103_2 = findTF(arg_103_0, "icon_bg/icon")
	local var_103_3 = arg_103_1.icon or arg_103_1:getConfig("icon")

	if arg_103_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		assert(arg_103_1.extra, "without extra data")

		var_103_3 = "SquareIcon/" .. ShipGroup.getDefaultSkin(arg_103_1.extra).painting
	end

	GetImageSpriteFromAtlasAsync(var_103_3, "", var_103_2)
	setIconStars(arg_103_0, false)
	setIconName(arg_103_0, arg_103_1:getName(), arg_103_2)
	setIconColorful(arg_103_0, arg_103_1:getConfig("rarity"), arg_103_2)
end

function updateIslandUnlock(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_1:getConfigTable().cmd_icon

	setIslandRarityFrame(arg_104_0, arg_104_1)
	setActive(findTF(arg_104_0, "icon_bg/count_bg"), false)
	GetImageSpriteFromAtlasAsync("island/" .. var_104_0, "", findTF(arg_104_0, "icon_bg/icon"))
	setIconName(arg_104_0, "", {})
end

function updateIslandInvitation(arg_105_0, arg_105_1)
	local var_105_0 = pg.island_chara_template[arg_105_1.id].invite_item
	local var_105_1 = pg.island_item_data_template[var_105_0].icon

	setIslandRarityFrame(arg_105_0, arg_105_1)
	setActive(findTF(arg_105_0, "icon_bg/count_bg"), arg_105_1.count > 0)
	setText(findTF(arg_105_0, "icon_bg/count_bg/count"), arg_105_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_105_1, "", findTF(arg_105_0, "icon_bg/icon"))
	setIconName(arg_105_0, "", {})
end

function updateIslandItem(arg_106_0, arg_106_1)
	local var_106_0 = arg_106_1:getConfigTable().icon
	local var_106_1 = arg_106_1:getConfigTable().name

	setIslandRarityFrame(arg_106_0, arg_106_1)
	setActive(findTF(arg_106_0, "icon_bg/count_bg"), arg_106_1.count > 0)
	setText(findTF(arg_106_0, "icon_bg/count_bg/count"), arg_106_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_106_0, "", findTF(arg_106_0, "icon_bg/icon"))
	setIconName(arg_106_0, var_106_1, {})
end

function updateIslandFurniture(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_1:getConfigTable().rarity
	local var_107_1 = arg_107_1:getConfigTable().icon
	local var_107_2 = arg_107_1:getConfigTable().name

	setIslandRarityFrame(arg_107_0, arg_107_1)
	setActive(findTF(arg_107_0, "icon_bg/count_bg"), arg_107_1.count > 0)
	setText(findTF(arg_107_0, "icon_bg/count_bg/count"), arg_107_1.count)
	GetImageSpriteFromAtlasAsync("island/IslandFurnitureIcon/" .. var_107_1, "", findTF(arg_107_0, "icon_bg/icon"))
	setIconName(arg_107_0, var_107_2, {})
end

function updateDefaultIconTpl(arg_108_0, arg_108_1, arg_108_2)
	arg_108_2 = arg_108_2 or {}

	local var_108_0 = arg_108_1:getDropRarity()
	local var_108_1 = ItemRarity.Rarity2Print(var_108_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_108_1, arg_108_0:Find("icon_bg"))
	setFrame(arg_108_0:Find("icon_bg/frame"), var_108_1)

	local var_108_2 = arg_108_0:Find("icon_bg/icon")

	for iter_108_0, iter_108_1 in ipairs({
		arg_108_1:getIcon(),
		arg_108_1:getDefaultIcon()
	}) do
		if noEmptyStr(iter_108_1) and checkABExist(iter_108_1) then
			GetImageSpriteFromAtlasAsync(iter_108_1, "", var_108_2)

			break
		end
	end

	setIconStars(arg_108_0, false)
	setIconName(arg_108_0, arg_108_1:getName(), arg_108_2)
	setIconColorful(arg_108_0, var_108_0, arg_108_2)
end

function updateIslandDefaultIconTpl(arg_109_0, arg_109_1, arg_109_2)
	GetImageSpriteFromAtlasAsync(arg_109_1:getIcon(), "", findTF(arg_109_0, "icon_bg/icon"))
	setActive(findTF(arg_109_0, "icon_bg/count_bg"), arg_109_1.count > 0)
	setText(findTF(arg_109_0, "icon_bg/count_bg/count"), arg_109_1.count)
	setIconName(arg_109_0, arg_109_1:getName(), {})
	setIslandRarityFrame(arg_109_0, arg_109_1)
end

function setIslandRarityFrame(arg_110_0, arg_110_1)
	local var_110_0 = arg_110_1:getIslandRarity()
	local var_110_1 = IslandItemRarity.Rarity2FrameName(var_110_0)

	GetImageSpriteFromAtlasAsync("island/islandframe", var_110_1, findTF(arg_110_0, "icon_bg"))

	if not IsNil(findTF(arg_110_0, "icon_bg/frame")) then
		GetImageSpriteFromAtlasAsync("island/islandframe", var_110_1, findTF(arg_110_0, "icon_bg/frame"))
	end
end

function getIslandSeasonPtInfo()
	local var_111_0 = pg.island_set.season_pt_show.key_value_int
	local var_111_1 = pg.island_item_data_template[var_111_0]

	return {
		name = var_111_1.name,
		icon = var_111_1.icon
	}
end

function updateIslandSeasonPt(arg_112_0, arg_112_1)
	local var_112_0 = Drop.New({
		type = DROP_TYPE_ISLAND_ITEM,
		id = pg.island_set.season_pt_show.key_value_int,
		count = arg_112_1.count
	})

	updateIslandItem(arg_112_0, var_112_0)
end

function updateIslandCardDiy(arg_113_0, arg_113_1)
	GetImageSpriteFromAtlasAsync(arg_113_1:getIcon(), "", findTF(arg_113_0, "icon_bg/icon"))
	setActive(findTF(arg_113_0, "icon_bg/count_bg"), arg_113_1.count > 0)
	setText(findTF(arg_113_0, "icon_bg/count_bg/count"), arg_113_1.count)
	setIconName(arg_113_0, arg_113_1:getConfigTable().name, {})
	setIslandRarityFrame(arg_113_0, arg_113_1)
end

function updateIslandSpeedupTicket(arg_114_0, arg_114_1)
	local var_114_0 = arg_114_1:getConfigTable().icon

	GetImageSpriteFromAtlasAsync("island/" .. var_114_0, "", findTF(arg_114_0, "icon_bg/icon"))
	setActive(findTF(arg_114_0, "icon_bg/count_bg"), arg_114_1.count > 0)
	setText(findTF(arg_114_0, "icon_bg/count_bg/count"), arg_114_1.count)
	setIconName(arg_114_0, arg_114_1:getConfigTable().name, {})
	setIslandRarityFrame(arg_114_0, arg_114_1)
end

function updateIslandSkin(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_1:getConfigTable().icon

	GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. var_115_0, "", findTF(arg_115_0, "icon_bg/icon"))
	setActive(findTF(arg_115_0, "icon_bg/count_bg"), arg_115_1.count > 0)
	setText(findTF(arg_115_0, "icon_bg/count_bg/count"), arg_115_1.count)
	setIconName(arg_115_0, arg_115_1:getConfigTable().name, {})
	setIslandRarityFrame(arg_115_0, arg_115_1)
end

function updateIslandDress(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_1:getConfigTable().icon

	GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. var_116_0, "", findTF(arg_116_0, "icon_bg/icon"))
	setActive(findTF(arg_116_0, "icon_bg/count_bg"), arg_116_1.count > 0)
	setText(findTF(arg_116_0, "icon_bg/count_bg/count"), arg_116_1.count)
	setIconName(arg_116_0, arg_116_1:getConfigTable().name, {})
	setIslandRarityFrame(arg_116_0, arg_116_1)
end

function updateIslandWatherCollect(arg_117_0, arg_117_1)
	local var_117_0 = arg_117_1:getConfigTable().icon
	local var_117_1 = arg_117_1:getConfigTable().name

	setText(findTF(arg_117_0, "icon_bg/count"), arg_117_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_117_0, "", findTF(arg_117_0, "icon_bg/icon"))
	setIconName(arg_117_0, var_117_1, {})
	setIslandRarityFrame(arg_117_0, arg_117_1)
end

function updateWorldItem(arg_118_0, arg_118_1, arg_118_2)
	arg_118_2 = arg_118_2 or {}

	local var_118_0 = ItemRarity.Rarity2Print(arg_118_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_118_0, findTF(arg_118_0, "icon_bg"))
	setFrame(findTF(arg_118_0, "icon_bg/frame"), var_118_0)

	local var_118_1 = findTF(arg_118_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_118_1.icon or arg_118_1:getConfig("icon"), "", var_118_1)
	setIconStars(arg_118_0, false)
	setIconName(arg_118_0, arg_118_1:getConfig("name"), arg_118_2)
	setIconColorful(arg_118_0, arg_118_1:getConfig("rarity"), arg_118_2)
end

function updateWorldCollection(arg_119_0, arg_119_1, arg_119_2)
	arg_119_2 = arg_119_2 or {}

	assert(arg_119_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_119_1.id)

	local var_119_0 = arg_119_1:getDropRarity()
	local var_119_1 = ItemRarity.Rarity2Print(var_119_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_119_1, findTF(arg_119_0, "icon_bg"))
	setFrame(findTF(arg_119_0, "icon_bg/frame"), var_119_1)

	local var_119_2 = findTF(arg_119_0, "icon_bg/icon")
	local var_119_3 = WorldCollectionProxy.GetCollectionType(arg_119_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_119_3, "", var_119_2)
	setIconStars(arg_119_0, false)
	setIconName(arg_119_0, arg_119_1:getName(), arg_119_2)
	setIconColorful(arg_119_0, var_119_0, arg_119_2)
end

function updateWorldBuff(arg_120_0, arg_120_1, arg_120_2)
	arg_120_2 = arg_120_2 or {}

	local var_120_0 = pg.world_SLGbuff_data[arg_120_1]

	assert(var_120_0, "找不到大世界buff配置: " .. arg_120_1)

	local var_120_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_120_1, findTF(arg_120_0, "icon_bg"))
	setFrame(findTF(arg_120_0, "icon_bg/frame"), var_120_1)

	local var_120_2 = findTF(arg_120_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_120_0.icon, "", var_120_2)

	local var_120_3 = arg_120_0:Find("icon_bg/stars")

	if not IsNil(var_120_3) then
		setActive(var_120_3, false)
	end

	local var_120_4 = findTF(arg_120_0, "name")

	if not IsNil(var_120_4) then
		setText(var_120_4, var_120_0.name)
	end

	local var_120_5 = findTF(arg_120_0, "icon_bg/count")

	if not IsNil(var_120_5) then
		SetActive(var_120_5, false)
	end
end

function updateShip(arg_121_0, arg_121_1, arg_121_2)
	arg_121_2 = arg_121_2 or {}

	local var_121_0 = arg_121_1:rarity2bgPrint()
	local var_121_1 = arg_121_1:getPainting()

	if arg_121_2.anonymous then
		var_121_0 = "1"
		var_121_1 = "unknown"
	end

	if arg_121_2.unknown_small then
		var_121_1 = "unknown_small"
	end

	local var_121_2 = findTF(arg_121_0, "icon_bg/new")

	if var_121_2 then
		if arg_121_2.isSkin then
			setActive(var_121_2, not arg_121_2.isTimeLimit and arg_121_2.isNew)
		else
			setActive(var_121_2, arg_121_1.virgin)
		end
	end

	local var_121_3 = findTF(arg_121_0, "icon_bg/timelimit")

	if var_121_3 then
		setActive(var_121_3, arg_121_2.isTimeLimit)
	end

	local var_121_4 = findTF(arg_121_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_121_2.isSkin and "_skin" or var_121_0), var_121_4)

	local var_121_5 = findTF(arg_121_0, "icon_bg/frame")
	local var_121_6

	if arg_121_1.isNpc then
		var_121_6 = "frame_npc"
	elseif arg_121_1:ShowPropose() then
		var_121_6 = "frame_prop"

		if arg_121_1:isMetaShip() then
			var_121_6 = var_121_6 .. "_meta"
		end
	elseif arg_121_2.isSkin then
		var_121_6 = "frame_skin"
	end

	setFrame(var_121_5, var_121_0, var_121_6)

	if arg_121_2.gray then
		setGray(var_121_4, true, true)
	end

	local var_121_7 = findTF(arg_121_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_121_2.Q and "QIcon/" or "SquareIcon/") .. var_121_1, "", var_121_7)

	local var_121_8 = findTF(arg_121_0, "icon_bg/lv")

	if var_121_8 then
		setActive(var_121_8, not arg_121_1.isNpc)

		if not arg_121_1.isNpc then
			local var_121_9 = findTF(var_121_8, "Text")

			if var_121_9 and arg_121_1.level then
				setText(var_121_9, arg_121_1.level)
			end
		end
	end

	local var_121_10 = findTF(arg_121_0, "ship_type")

	if var_121_10 then
		setActive(var_121_10, true)
		setImageSprite(var_121_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_121_1:getShipType())))
	end

	local var_121_11 = var_121_4:Find("npc")

	if not IsNil(var_121_11) then
		if var_121_2 and go(var_121_2).activeSelf then
			setActive(var_121_11, false)
		else
			setActive(var_121_11, arg_121_1:isActivityNpc())
		end
	end

	local var_121_12 = arg_121_0:Find("group_locked")

	if var_121_12 then
		setActive(var_121_12, not arg_121_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_121_1.groupId))
	end

	setIconStars(arg_121_0, arg_121_2.initStar, arg_121_1:getStar())
	setIconName(arg_121_0, arg_121_2.isSkin and arg_121_1:GetSkinConfig().name or arg_121_1:getName(), arg_121_2)
	setIconColorful(arg_121_0, arg_121_2.isSkin and ItemRarity.Gold or arg_121_1:getRarity() - 1, arg_121_2)
end

function updateCommander(arg_122_0, arg_122_1, arg_122_2)
	arg_122_2 = arg_122_2 or {}

	local var_122_0 = arg_122_1:getDropRarity()
	local var_122_1 = ItemRarity.Rarity2Print(var_122_0)
	local var_122_2 = arg_122_1:getConfig("painting")

	if arg_122_2.anonymous then
		var_122_1 = 1
		var_122_2 = "unknown"
	end

	local var_122_3 = findTF(arg_122_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_122_1, var_122_3)

	local var_122_4 = findTF(arg_122_0, "icon_bg/frame")

	setFrame(var_122_4, var_122_1)

	if arg_122_2.gray then
		setGray(var_122_3, true, true)
	end

	local var_122_5 = findTF(arg_122_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_122_2, "", var_122_5)
	setIconStars(arg_122_0, arg_122_2.initStar, 0)
	setIconName(arg_122_0, arg_122_1:getName(), arg_122_2)
end

function updateStrategy(arg_123_0, arg_123_1, arg_123_2)
	arg_123_2 = arg_123_2 or {}

	local var_123_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_123_0, findTF(arg_123_0, "icon_bg"))
	setFrame(findTF(arg_123_0, "icon_bg/frame"), var_123_0)

	local var_123_1 = findTF(arg_123_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_123_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_123_1:getIcon(), "", var_123_1)
	setIconStars(arg_123_0, false)
	setIconName(arg_123_0, arg_123_1:getName(), arg_123_2)
	setIconColorful(arg_123_0, ItemRarity.Gray, arg_123_2)
end

function updateFurniture(arg_124_0, arg_124_1, arg_124_2)
	arg_124_2 = arg_124_2 or {}

	local var_124_0 = arg_124_1:getDropRarity()
	local var_124_1 = ItemRarity.Rarity2Print(var_124_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_124_1, findTF(arg_124_0, "icon_bg"))
	setFrame(findTF(arg_124_0, "icon_bg/frame"), var_124_1)

	local var_124_2 = findTF(arg_124_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_124_1:getIcon(), "", var_124_2)
	setIconStars(arg_124_0, false)
	setIconName(arg_124_0, arg_124_1:getName(), arg_124_2)
	setIconColorful(arg_124_0, var_124_0, arg_124_2)
end

function updateSpWeapon(arg_125_0, arg_125_1, arg_125_2)
	arg_125_2 = arg_125_2 or {}

	assert(arg_125_1, "spWeaponVO can not be nil.")
	assert(isa(arg_125_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_125_0 = ItemRarity.Rarity2Print(arg_125_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_125_0, findTF(arg_125_0, "icon_bg"))
	setFrame(findTF(arg_125_0, "icon_bg/frame"), var_125_0)

	local var_125_1 = findTF(arg_125_0, "icon_bg/icon")

	var_0_4(var_125_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_125_1:GetIconPath(), "", var_125_1)
	setIconStars(arg_125_0, true, arg_125_1:GetRarity())
	var_0_7(arg_125_0, arg_125_1:GetLevel() - 1)
	setIconName(arg_125_0, arg_125_1:GetName(), arg_125_2)
	setIconCount(arg_125_0, arg_125_1.count)
	setIconColorful(arg_125_0, arg_125_1:GetRarity(), arg_125_2)
end

function UpdateSpWeaponSlot(arg_126_0, arg_126_1, arg_126_2)
	local var_126_0 = ItemRarity.Rarity2Print(arg_126_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_126_0, findTF(arg_126_0, "Icon/Mask/icon_bg"))

	local var_126_1 = findTF(arg_126_0, "Icon/Mask/icon_bg/icon")

	arg_126_2 = arg_126_2 or {
		16,
		16,
		16,
		16
	}

	var_0_4(var_126_1, arg_126_2)
	GetImageSpriteFromAtlasAsync(arg_126_1:GetIconPath(), "", var_126_1)

	local var_126_2 = arg_126_1:GetLevel() - 1
	local var_126_3 = findTF(arg_126_0, "Icon/LV")

	setActive(var_126_3, var_126_2 > 0)
	setText(findTF(var_126_3, "Text"), var_126_2)
end

function updateDorm3dIcon(arg_127_0, arg_127_1)
	local var_127_0 = arg_127_1:getDropRarityDorm()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_127_0), arg_127_0)

	local var_127_1 = arg_127_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_127_1:getIcon(), "", var_127_1)
	setText(arg_127_0:Find("count/Text"), "x" .. arg_127_1.count)
	setText(arg_127_0:Find("name/Text"), arg_127_1:getName())
end

function setLoveLetterMedal(arg_128_0, arg_128_1, arg_128_2)
	local var_128_0

	seriesAsync({
		function(arg_129_0)
			GetPrefabFromAtlasAsync(arg_128_1:GetPrefabName(), arg_128_0, function(arg_130_0)
				var_128_0 = arg_130_0.transform

				eachChild(arg_128_0, function(arg_131_0, arg_131_1)
					if arg_131_0.name ~= arg_130_0.name then
						returnLoveLetterMedal(arg_131_0)
					end
				end)
				arg_129_0()
			end)
		end
	}, function()
		local var_132_0 = arg_128_1:GetPainting()

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_132_0, "", var_128_0:Find("mask/icon"))
		setText(var_128_0:Find("front/mark/Text"), arg_128_1:GetDisplayLevelMark())
		setActive(var_128_0:Find("pick_up"), arg_128_2 and arg_128_2.showPickUp)
		setActive(var_128_0:Find("front/mark"), true)

		if arg_128_2 and arg_128_2.hideMark then
			setActive(var_128_0:Find("front/mark"), false)
		end
	end)
end

function returnLoveLetterMedal(arg_133_0)
	if IsNil(arg_133_0) then
		return
	end

	local var_133_0 = string.gsub(arg_133_0.name, "%(Clone%)", "")

	pg.PoolMgr.GetInstance():ReturnPrefab("lovelettermedal/" .. string.lower(var_133_0), "", arg_133_0.gameObject)
end

local var_0_8

function findCullAndClipWorldRect(arg_134_0)
	if #arg_134_0 == 0 then
		return false
	end

	local var_134_0 = arg_134_0[1].canvasRect

	for iter_134_0 = 1, #arg_134_0 do
		var_134_0 = rectIntersect(var_134_0, arg_134_0[iter_134_0].canvasRect)
	end

	if var_134_0.width <= 0 or var_134_0.height <= 0 then
		return false
	end

	var_0_8 = var_0_8 or GameObject.Find("UICamera/Canvas").transform

	local var_134_1 = var_0_8:TransformPoint(Vector3(var_134_0.x, var_134_0.y, 0))
	local var_134_2 = var_0_8:TransformPoint(Vector3(var_134_0.x + var_134_0.width, var_134_0.y + var_134_0.height, 0))

	return true, Vector4(var_134_1.x, var_134_1.y, var_134_2.x, var_134_2.y)
end

function rectIntersect(arg_135_0, arg_135_1)
	local var_135_0 = math.max(arg_135_0.x, arg_135_1.x)
	local var_135_1 = math.min(arg_135_0.x + arg_135_0.width, arg_135_1.x + arg_135_1.width)
	local var_135_2 = math.max(arg_135_0.y, arg_135_1.y)
	local var_135_3 = math.min(arg_135_0.y + arg_135_0.height, arg_135_1.y + arg_135_1.height)

	if var_135_0 <= var_135_1 and var_135_2 <= var_135_3 then
		return var_0_0.Rect.New(var_135_0, var_135_2, var_135_1 - var_135_0, var_135_3 - var_135_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_136_0)
	local var_136_0 = {}

	for iter_136_0, iter_136_1 in ipairs(arg_136_0) do
		local var_136_1 = Drop.Create(iter_136_1)

		var_136_1.count = var_136_1.count or 1

		if var_136_1.type == DROP_TYPE_EMOJI then
			table.insert(var_136_0, var_136_1:getName())
		else
			table.insert(var_136_0, var_136_1:getName() .. "x" .. var_136_1.count)
		end
	end

	return table.concat(var_136_0, "、")
end

function updateDrop(arg_137_0, arg_137_1, arg_137_2)
	Drop.Change(arg_137_1)

	arg_137_2 = arg_137_2 or {}

	local var_137_0 = {
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
	local var_137_1

	for iter_137_0, iter_137_1 in ipairs(var_137_0) do
		local var_137_2 = arg_137_0:Find(iter_137_1[1])

		if arg_137_1.type ~= iter_137_1[2] and not IsNil(var_137_2) then
			setActive(var_137_2, false)
		end
	end

	if not IsNil(arg_137_0:Find("icon_bg/frame")) then
		arg_137_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

		setIconColorful(arg_137_0, arg_137_1:getDropRarity(), arg_137_2, {
			[ItemRarity.Gold] = {
				name = "Item_duang5",
				active = function(arg_138_0, arg_138_1)
					return arg_138_1.fromAwardLayer and arg_138_0 >= ItemRarity.Gold
				end
			}
		})
		var_0_4(findTF(arg_137_0, "icon_bg/icon"), {
			2,
			2,
			2,
			2
		})
	end

	arg_137_1:UpdateDropTpl(arg_137_0, arg_137_2)
	setIconCount(arg_137_0, arg_137_2.count or arg_137_1:getCount())
end

function updateCustomDrop(arg_139_0, arg_139_1, arg_139_2)
	Drop.Change(arg_139_1)

	arg_139_2 = arg_139_2 or {}

	arg_139_1:UpdateCustomDropTpl(arg_139_0, arg_139_2)
end

function updateBuff(arg_140_0, arg_140_1, arg_140_2)
	arg_140_2 = arg_140_2 or {}

	local var_140_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_140_0, findTF(arg_140_0, "icon_bg"))

	local var_140_1 = pg.benefit_buff_template[arg_140_1]

	setFrame(findTF(arg_140_0, "icon_bg/frame"), var_140_0)
	setText(findTF(arg_140_0, "icon_bg/count"), 1)

	local var_140_2 = findTF(arg_140_0, "icon_bg/icon")
	local var_140_3 = var_140_1.icon

	GetImageSpriteFromAtlasAsync(var_140_3, "", var_140_2)
	setIconStars(arg_140_0, false)
	setIconName(arg_140_0, var_140_1.name, arg_140_2)
	setIconColorful(arg_140_0, ItemRarity.Gold, arg_140_2)
end

function updateAttire(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
	local var_141_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_141_0, findTF(arg_141_0, "icon_bg"))
	setFrame(findTF(arg_141_0, "icon_bg/frame"), var_141_0)

	local var_141_1 = findTF(arg_141_0, "icon_bg/icon")
	local var_141_2

	if arg_141_1 == AttireConst.TYPE_CHAT_FRAME then
		var_141_2 = "chat_frame"
	elseif arg_141_1 == AttireConst.TYPE_ICON_FRAME then
		var_141_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_141_2, "", var_141_1)
	setIconName(arg_141_0, arg_141_2.name, arg_141_3)
end

function updateAttireCombatUI(arg_142_0, arg_142_1, arg_142_2, arg_142_3)
	local var_142_0 = arg_142_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_142_0, findTF(arg_142_0, "icon_bg"))
	setFrame(findTF(arg_142_0, "icon_bg/frame"), var_142_0, "frame_battle_ui")

	local var_142_1 = findTF(arg_142_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_142_2.display_icon, "", var_142_1)
	setIconName(arg_142_0, arg_142_2.name, arg_142_3)
end

function updateActivityMedal(arg_143_0, arg_143_1, arg_143_2)
	local var_143_0 = ItemRarity.Rarity2Print(arg_143_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_143_0, findTF(arg_143_0, "icon_bg"))
	setFrame(findTF(arg_143_0, "icon_bg/frame"), var_143_0)

	local var_143_1 = findTF(arg_143_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_143_1.icon, "", var_143_1)
	setIconName(arg_143_0, arg_143_1.name, arg_143_2)
end

function updateCover(arg_144_0, arg_144_1, arg_144_2)
	local var_144_0 = arg_144_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_144_0, findTF(arg_144_0, "icon_bg"))
	setFrame(findTF(arg_144_0, "icon_bg/frame"), var_144_0)

	local var_144_1 = findTF(arg_144_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_144_1:getIcon(), "", var_144_1)
	setIconName(arg_144_0, arg_144_1:getName(), arg_144_2)
	setIconStars(arg_144_0, false)
end

function updateEmoji(arg_145_0, arg_145_1, arg_145_2)
	local var_145_0 = findTF(arg_145_0, "icon_bg/icon")
	local var_145_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_145_1, "", var_145_0)

	local var_145_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_145_2, findTF(arg_145_0, "icon_bg"))
	setFrame(findTF(arg_145_0, "icon_bg/frame"), var_145_2)
	setIconName(arg_145_0, arg_145_1.name, arg_145_2)
end

function updateEquipmentSkin(arg_146_0, arg_146_1, arg_146_2)
	arg_146_2 = arg_146_2 or {}

	local var_146_0 = EquipmentRarity.Rarity2Print(arg_146_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_146_0, findTF(arg_146_0, "icon_bg"))
	setFrame(findTF(arg_146_0, "icon_bg/frame"), var_146_0, "frame_skin")

	local var_146_1 = findTF(arg_146_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_146_1.icon, "", var_146_1)
	setIconStars(arg_146_0, false)
	setIconName(arg_146_0, arg_146_1.name, arg_146_2)
	setIconCount(arg_146_0, arg_146_1.count)
	setIconColorful(arg_146_0, arg_146_1.rarity - 1, arg_146_2)
end

function NoPosMsgBox(arg_147_0, arg_147_1, arg_147_2, arg_147_3)
	local var_147_0
	local var_147_1 = {}

	if arg_147_1 then
		table.insert(var_147_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_147_1
		})
	end

	if arg_147_2 then
		table.insert(var_147_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_147_2
		})
	end

	if arg_147_3 then
		table.insert(var_147_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_147_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_147_0,
		custom = var_147_1
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_148_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_148_0 and var_148_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_148_0
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
		local var_149_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_149_0 and var_149_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_149_0
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
		onClick = function(arg_152_0, arg_152_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_152_0.id,
				shipVOs = arg_152_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_153_0, arg_153_1, arg_153_2)
	if arg_153_2 then
		local var_153_0 = ""

		for iter_153_0, iter_153_1 in ipairs(arg_153_2) do
			local var_153_1 = Item.getConfigData(iter_153_1[1])

			var_153_0 = var_153_0 .. i18n(iter_153_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_153_1.name, iter_153_1[2])

			if iter_153_0 < #arg_153_2 then
				var_153_0 = var_153_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_153_0 ~= "" then
			arg_153_0 = arg_153_0 .. "\n" .. i18n("text_noRes_tip", var_153_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_153_0,
		onYes = function()
			gotoChargeScene(arg_153_1, arg_153_2)
		end
	})
end

function shoppingBatch(arg_155_0, arg_155_1, arg_155_2, arg_155_3, arg_155_4)
	local var_155_0 = pg.shop_template[arg_155_0]

	assert(var_155_0, "shop_template中找不到商品id：" .. arg_155_0)

	local var_155_1 = getProxy(PlayerProxy):getData()[id2res(var_155_0.resource_type)]
	local var_155_2 = arg_155_1.price or var_155_0.resource_num
	local var_155_3 = math.floor(var_155_1 / var_155_2)

	var_155_3 = var_155_3 <= 0 and 1 or var_155_3
	var_155_3 = arg_155_2 ~= nil and arg_155_2 < var_155_3 and arg_155_2 or var_155_3

	local var_155_4 = true
	local var_155_5 = 1

	if var_155_0 ~= nil and arg_155_1.id then
		print(var_155_3 * var_155_0.num, "--", var_155_3)
		assert(Item.getConfigData(arg_155_1.id), "item config should be existence")

		local var_155_6 = Item.New({
			id = arg_155_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_155_1.id
			},
			addNum = var_155_0.num,
			maxNum = var_155_3 * var_155_0.num,
			defaultNum = var_155_0.num,
			numUpdate = function(arg_156_0, arg_156_1)
				var_155_5 = math.floor(arg_156_1 / var_155_0.num)

				local var_156_0 = var_155_5 * var_155_2

				if var_156_0 > var_155_1 then
					setText(arg_156_0, i18n(arg_155_3, var_156_0, arg_156_1, COLOR_RED, var_155_6))

					var_155_4 = false
				else
					setText(arg_156_0, i18n(arg_155_3, var_156_0, arg_156_1, COLOR_GREEN, var_155_6))

					var_155_4 = true
				end
			end,
			onYes = function()
				if var_155_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_155_0,
						count = var_155_5
					})
				elseif arg_155_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_155_4))
					pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_158_0, arg_158_1, arg_158_2, arg_158_3, arg_158_4)
	local var_158_0 = pg.shop_template[arg_158_0]

	assert(var_158_0, "shop_template中找不到商品id：" .. arg_158_0)

	local var_158_1 = getProxy(PlayerProxy):getData()[id2res(var_158_0.resource_type)]
	local var_158_2 = arg_158_1.price or var_158_0.resource_num
	local var_158_3 = math.floor(var_158_1 / var_158_2)

	var_158_3 = var_158_3 <= 0 and 1 or var_158_3
	var_158_3 = arg_158_2 ~= nil and arg_158_2 < var_158_3 and arg_158_2 or var_158_3

	local var_158_4 = true
	local var_158_5 = 1

	if var_158_0 ~= nil and arg_158_1.id then
		print(var_158_3 * var_158_0.num, "--", var_158_3)
		assert(Item.getConfigData(arg_158_1.id), "item config should be existence")

		local var_158_6 = Item.New({
			id = arg_158_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_158_1.id
			}),
			price = var_158_2,
			addNum = var_158_0.num,
			maxNum = var_158_3 * var_158_0.num,
			defaultNum = var_158_0.num,
			numUpdate = function(arg_159_0, arg_159_1)
				var_158_5 = math.floor(arg_159_1 / var_158_0.num)

				local var_159_0 = var_158_5 * var_158_2

				if var_159_0 > var_158_1 then
					setTextInNewStyleBox(arg_159_0, i18n(arg_158_3, var_159_0, arg_159_1, COLOR_RED, var_158_6))

					var_158_4 = false
				else
					setTextInNewStyleBox(arg_159_0, i18n(arg_158_3, var_159_0, arg_159_1, "#238C40FF", var_158_6))

					var_158_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_158_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_158_0,
								count = var_158_5
							})
						elseif arg_158_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_158_4))
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

function gotoChargeScene(arg_161_0, arg_161_1)
	local var_161_0 = getProxy(ContextProxy)
	local var_161_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_161_1.mediator, NewShopMainMediator) then
		var_161_1.mediator:getViewComponent():switchSubViewByTogger(arg_161_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_161_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_161_1
		})
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
end

function clearDrop(arg_162_0)
	local var_162_0 = findTF(arg_162_0, "icon_bg")
	local var_162_1 = findTF(arg_162_0, "icon_bg/frame")
	local var_162_2 = findTF(arg_162_0, "icon_bg/icon")
	local var_162_3 = findTF(arg_162_0, "icon_bg/icon/icon")

	clearImageSprite(var_162_0)
	clearImageSprite(var_162_1)
	clearImageSprite(var_162_2)

	if var_162_3 then
		clearImageSprite(var_162_3)
	end
end

local var_0_9 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_163_0, arg_163_1, arg_163_2, arg_163_3)
	local var_163_0 = findTF(arg_163_0, "skill")
	local var_163_1 = findTF(arg_163_0, "lock")
	local var_163_2 = findTF(arg_163_0, "unknown")

	if arg_163_1 then
		setActive(var_163_0, true)
		setActive(var_163_2, false)
		setActive(var_163_1, not arg_163_2)
		LoadImageSpriteAsync("skillicon/" .. arg_163_1.icon, findTF(var_163_0, "icon"))

		local var_163_3 = arg_163_1.color or "blue"

		setText(findTF(var_163_0, "name"), shortenString(getSkillName(arg_163_1.id), arg_163_3 or 8))

		local var_163_4 = findTF(var_163_0, "level")

		setText(var_163_4, "LEVEL: " .. (arg_163_2 and arg_163_2.level or "??"))
		setTextColor(var_163_4, var_0_9[var_163_3])
	else
		setActive(var_163_0, false)
		setActive(var_163_2, true)
		setActive(var_163_1, false)
	end
end

local var_0_10 = true

function onBackButton(arg_164_0, arg_164_1, arg_164_2, arg_164_3)
	local var_164_0 = GetOrAddComponent(arg_164_1, "UILongPressTrigger")

	assert(arg_164_2, "callback should exist")

	var_164_0.longPressThreshold = defaultValue(arg_164_3, 1)

	local function var_164_1(arg_165_0)
		return function()
			if var_0_10 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_166_0, var_166_1 = arg_164_2()

			if var_166_0 then
				arg_165_0(var_166_1)
			end
		end
	end

	local var_164_2 = var_164_0.onReleased

	pg.DelegateInfo.Add(arg_164_0, var_164_2)
	var_164_2:RemoveAllListeners()
	var_164_2:AddListener(var_164_1(function(arg_167_0)
		arg_167_0:emit(BaseUI.ON_BACK)
	end))

	local var_164_3 = var_164_0.onLongPressed

	pg.DelegateInfo.Add(arg_164_0, var_164_3)
	var_164_3:RemoveAllListeners()
	var_164_3:AddListener(var_164_1(function(arg_168_0)
		arg_168_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_171_0)
	local var_171_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_171_1, var_171_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_171_0)

	return var_171_1 * 86400 + (var_171_2 + arg_171_0) * 3600
end

function GetPerceptualSize(arg_172_0, arg_172_1)
	local function var_172_0(arg_173_0)
		if not arg_173_0 then
			return 0, 1
		elseif arg_173_0 > 240 then
			return 4, 1
		elseif arg_173_0 > 225 then
			return 3, 1
		elseif arg_173_0 > 192 then
			return 2, 1
		elseif arg_173_0 < 126 then
			return 1, arg_172_1 or 0.5
		else
			return 1, 1
		end
	end

	if type(arg_172_0) == "number" then
		return var_172_0(arg_172_0)
	end

	local var_172_1 = 1
	local var_172_2 = 0
	local var_172_3 = 0
	local var_172_4 = #arg_172_0

	while var_172_1 <= var_172_4 do
		local var_172_5 = string.byte(arg_172_0, var_172_1)
		local var_172_6, var_172_7 = var_172_0(var_172_5)

		var_172_1 = var_172_1 + var_172_6
		var_172_2 = var_172_2 + var_172_7
	end

	return var_172_2
end

function shortenString(arg_174_0, arg_174_1, arg_174_2)
	local var_174_0 = 1
	local var_174_1 = 0
	local var_174_2 = 0
	local var_174_3 = #arg_174_0

	while var_174_0 <= var_174_3 do
		local var_174_4 = string.byte(arg_174_0, var_174_0)
		local var_174_5, var_174_6 = GetPerceptualSize(var_174_4, arg_174_2)

		var_174_0 = var_174_0 + var_174_5
		var_174_1 = var_174_1 + var_174_6

		if arg_174_1 <= math.ceil(var_174_1) then
			var_174_2 = var_174_0

			break
		end
	end

	if var_174_2 == 0 or var_174_3 < var_174_2 then
		return arg_174_0
	end

	return string.sub(arg_174_0, 1, var_174_2 - 1) .. ".."
end

function shouldShortenString(arg_175_0, arg_175_1)
	local var_175_0 = 1
	local var_175_1 = 0
	local var_175_2 = 0
	local var_175_3 = #arg_175_0

	while var_175_0 <= var_175_3 do
		local var_175_4 = string.byte(arg_175_0, var_175_0)
		local var_175_5, var_175_6 = GetPerceptualSize(var_175_4)

		var_175_0 = var_175_0 + var_175_5
		var_175_1 = var_175_1 + var_175_6

		if arg_175_1 <= math.ceil(var_175_1) then
			var_175_2 = var_175_0

			break
		end
	end

	if var_175_2 == 0 or var_175_3 < var_175_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_176_0, arg_176_1, arg_176_2, arg_176_3)
	local var_176_0 = true
	local var_176_1, var_176_2 = utf8_to_unicode(arg_176_0)
	local var_176_3 = filterEgyUnicode(filterSpecChars(arg_176_0))
	local var_176_4 = wordVer(arg_176_0)

	if not checkSpaceValid(arg_176_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_176_3[1]))

		var_176_0 = false
	elseif var_176_4 > 0 or var_176_3 ~= arg_176_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_176_3[4]))

		var_176_0 = false
	elseif var_176_2 < arg_176_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_176_3[2]))

		var_176_0 = false
	elseif arg_176_2 < var_176_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_176_3[3]))

		var_176_0 = false
	end

	return var_176_0
end

function checkSpaceValid(arg_177_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_177_0 = string.gsub(arg_177_0, " ", "")

	return arg_177_0 == string.gsub(var_177_0, "　", "")
end

function filterSpecChars(arg_178_0)
	local var_178_0 = {}
	local var_178_1 = 0
	local var_178_2 = 0
	local var_178_3 = 0
	local var_178_4 = 1

	while var_178_4 <= #arg_178_0 do
		local var_178_5 = string.byte(arg_178_0, var_178_4)

		if not var_178_5 then
			break
		end

		if var_178_5 >= 48 and var_178_5 <= 57 or var_178_5 >= 65 and var_178_5 <= 90 or var_178_5 == 95 or var_178_5 >= 97 and var_178_5 <= 122 then
			table.insert(var_178_0, string.char(var_178_5))
		elseif var_178_5 >= 228 and var_178_5 <= 233 then
			local var_178_6 = string.byte(arg_178_0, var_178_4 + 1)
			local var_178_7 = string.byte(arg_178_0, var_178_4 + 2)

			if var_178_6 and var_178_7 and var_178_6 >= 128 and var_178_6 <= 191 and var_178_7 >= 128 and var_178_7 <= 191 then
				var_178_4 = var_178_4 + 2

				table.insert(var_178_0, string.char(var_178_5, var_178_6, var_178_7))

				var_178_1 = var_178_1 + 1
			end
		elseif var_178_5 == 45 or var_178_5 == 40 or var_178_5 == 41 then
			table.insert(var_178_0, string.char(var_178_5))
		elseif var_178_5 == 194 then
			local var_178_8 = string.byte(arg_178_0, var_178_4 + 1)

			if var_178_8 == 183 then
				var_178_4 = var_178_4 + 1

				table.insert(var_178_0, string.char(var_178_5, var_178_8))

				var_178_1 = var_178_1 + 1
			end
		elseif var_178_5 == 239 then
			local var_178_9 = string.byte(arg_178_0, var_178_4 + 1)
			local var_178_10 = string.byte(arg_178_0, var_178_4 + 2)

			if var_178_9 == 188 and (var_178_10 == 136 or var_178_10 == 137) then
				var_178_4 = var_178_4 + 2

				table.insert(var_178_0, string.char(var_178_5, var_178_9, var_178_10))

				var_178_1 = var_178_1 + 1
			end
		elseif var_178_5 == 206 or var_178_5 == 207 then
			local var_178_11 = string.byte(arg_178_0, var_178_4 + 1)

			if var_178_5 == 206 and var_178_11 >= 177 or var_178_5 == 207 and var_178_11 <= 134 then
				var_178_4 = var_178_4 + 1

				table.insert(var_178_0, string.char(var_178_5, var_178_11))

				var_178_1 = var_178_1 + 1
			end
		elseif var_178_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_178_12 = string.byte(arg_178_0, var_178_4 + 1)
			local var_178_13 = string.byte(arg_178_0, var_178_4 + 2)

			if var_178_12 and var_178_13 and var_178_12 > 128 and var_178_12 <= 191 and var_178_13 >= 128 and var_178_13 <= 191 then
				var_178_4 = var_178_4 + 2

				table.insert(var_178_0, string.char(var_178_5, var_178_12, var_178_13))

				var_178_2 = var_178_2 + 1
			end
		elseif var_178_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_178_14 = string.byte(arg_178_0, var_178_4 + 1)
			local var_178_15 = string.byte(arg_178_0, var_178_4 + 2)

			if var_178_14 and var_178_15 and var_178_14 >= 128 and var_178_14 <= 191 and var_178_15 >= 128 and var_178_15 <= 191 then
				var_178_4 = var_178_4 + 2

				table.insert(var_178_0, string.char(var_178_5, var_178_14, var_178_15))

				var_178_3 = var_178_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_178_4 ~= 1 and var_178_5 == 32 and string.byte(arg_178_0, var_178_4 + 1) ~= 32 then
				table.insert(var_178_0, string.char(var_178_5))
			end

			if var_178_5 >= 192 and var_178_5 <= 223 then
				local var_178_16 = string.byte(arg_178_0, var_178_4 + 1)

				var_178_4 = var_178_4 + 1

				if var_178_5 == 194 and var_178_16 and var_178_16 >= 128 then
					table.insert(var_178_0, string.char(var_178_5, var_178_16))
				elseif var_178_5 == 195 and var_178_16 and var_178_16 <= 191 then
					table.insert(var_178_0, string.char(var_178_5, var_178_16))
				end
			end
		end

		var_178_4 = var_178_4 + 1
	end

	return table.concat(var_178_0), var_178_1 + var_178_2 + var_178_3
end

function filterEgyUnicode(arg_179_0)
	arg_179_0 = string.gsub(arg_179_0, "�[�-�][�-�]", "")
	arg_179_0 = string.gsub(arg_179_0, "�[�-�]", "")

	return arg_179_0
end

function shiftPanel(arg_180_0, arg_180_1, arg_180_2, arg_180_3, arg_180_4, arg_180_5, arg_180_6, arg_180_7, arg_180_8)
	arg_180_3 = arg_180_3 or 0.2

	if arg_180_5 then
		LeanTween.cancel(go(arg_180_0))
	end

	local var_180_0 = rtf(arg_180_0)

	arg_180_1 = arg_180_1 or var_180_0.anchoredPosition.x
	arg_180_2 = arg_180_2 or var_180_0.anchoredPosition.y

	local var_180_1 = LeanTween.move(var_180_0, Vector3(arg_180_1, arg_180_2, 0), arg_180_3)

	arg_180_7 = arg_180_7 or LeanTweenType.easeInOutSine

	var_180_1:setEase(arg_180_7)

	if arg_180_4 then
		var_180_1:setDelay(arg_180_4)
	end

	if arg_180_6 then
		GetOrAddComponent(arg_180_0, "CanvasGroup").blocksRaycasts = false
	end

	var_180_1:setOnComplete(System.Action(function()
		if arg_180_8 then
			arg_180_8()
		end

		if arg_180_6 then
			GetOrAddComponent(arg_180_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_180_1
end

function TweenValue(arg_182_0, arg_182_1, arg_182_2, arg_182_3, arg_182_4, arg_182_5, arg_182_6, arg_182_7)
	local var_182_0 = LeanTween.value(go(arg_182_0), arg_182_1, arg_182_2, arg_182_3):setOnUpdate(System.Action_float(function(arg_183_0)
		if arg_182_5 then
			arg_182_5(arg_183_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_182_6 then
			arg_182_6()
		end
	end)):setDelay(arg_182_4 or 0)

	if arg_182_7 and arg_182_7 > 0 then
		var_182_0:setRepeat(arg_182_7)
	end

	return var_182_0
end

function rotateAni(arg_185_0, arg_185_1, arg_185_2)
	return LeanTween.rotate(rtf(arg_185_0), 360 * arg_185_1, arg_185_2):setLoopClamp()
end

function blinkAni(arg_186_0, arg_186_1, arg_186_2, arg_186_3)
	return LeanTween.alpha(rtf(arg_186_0), arg_186_3 or 0, arg_186_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_186_2 or 0)
end

function scaleAni(arg_187_0, arg_187_1, arg_187_2, arg_187_3)
	return LeanTween.scale(rtf(arg_187_0), arg_187_3 or 0, arg_187_1):setLoopPingPong(arg_187_2 or 0)
end

function floatAni(arg_188_0, arg_188_1, arg_188_2, arg_188_3)
	local var_188_0 = arg_188_0.localPosition.y + arg_188_1

	return LeanTween.moveY(rtf(arg_188_0), var_188_0, arg_188_2):setLoopPingPong(arg_188_3 or 0)
end

local var_0_11 = tostring

function tostring(arg_189_0)
	if arg_189_0 == nil then
		return "nil"
	end

	local var_189_0 = var_0_11(arg_189_0)

	if var_189_0 == nil then
		if type(arg_189_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_189_0
end

function wordVer(arg_190_0, arg_190_1)
	if arg_190_0.match(arg_190_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_190_0
	end

	arg_190_1 = arg_190_1 or {}

	local var_190_0 = filterEgyUnicode(arg_190_0)

	if #var_190_0 ~= #arg_190_0 then
		if arg_190_1.isReplace then
			arg_190_0 = var_190_0
		else
			return 1
		end
	end

	local var_190_1 = wordSplit(arg_190_0)
	local var_190_2 = pg.word_template
	local var_190_3 = pg.word_legal_template

	arg_190_1.isReplace = arg_190_1.isReplace or false
	arg_190_1.replaceWord = arg_190_1.replaceWord or "*"

	local var_190_4 = #var_190_1
	local var_190_5 = 1
	local var_190_6 = ""
	local var_190_7 = 0

	while var_190_5 <= var_190_4 do
		local var_190_8, var_190_9, var_190_10 = wordLegalMatch(var_190_1, var_190_3, var_190_5)

		if var_190_8 then
			var_190_5 = var_190_9
			var_190_6 = var_190_6 .. var_190_10
		else
			local var_190_11, var_190_12, var_190_13 = wordVerMatch(var_190_1, var_190_2, arg_190_1, var_190_5, "", false, var_190_5, "")

			if var_190_11 then
				var_190_5 = var_190_12
				var_190_7 = var_190_7 + 1

				if arg_190_1.isReplace then
					var_190_6 = var_190_6 .. var_190_13
				end
			else
				if arg_190_1.isReplace then
					var_190_6 = var_190_6 .. var_190_1[var_190_5]
				end

				var_190_5 = var_190_5 + 1
			end
		end
	end

	if arg_190_1.isReplace then
		return var_190_7, var_190_6
	else
		return var_190_7
	end
end

function wordLegalMatch(arg_191_0, arg_191_1, arg_191_2, arg_191_3, arg_191_4)
	if arg_191_2 > #arg_191_0 then
		return arg_191_3, arg_191_2, arg_191_4
	end

	local var_191_0 = arg_191_0[arg_191_2]
	local var_191_1 = arg_191_1[var_191_0]

	arg_191_4 = arg_191_4 == nil and "" or arg_191_4

	if var_191_1 then
		if var_191_1.this then
			return wordLegalMatch(arg_191_0, var_191_1, arg_191_2 + 1, true, arg_191_4 .. var_191_0)
		else
			return wordLegalMatch(arg_191_0, var_191_1, arg_191_2 + 1, false, arg_191_4 .. var_191_0)
		end
	else
		return arg_191_3, arg_191_2, arg_191_4
	end
end

local var_0_12 = string.byte("a")
local var_0_13 = string.byte("z")
local var_0_14 = string.byte("A")
local var_0_15 = string.byte("Z")

local function var_0_16(arg_192_0)
	if not arg_192_0 then
		return arg_192_0
	end

	local var_192_0 = string.byte(arg_192_0)

	if var_192_0 > 128 then
		return
	end

	if var_192_0 >= var_0_12 and var_192_0 <= var_0_13 then
		return string.char(var_192_0 - 32)
	elseif var_192_0 >= var_0_14 and var_192_0 <= var_0_15 then
		return string.char(var_192_0 + 32)
	else
		return arg_192_0
	end
end

function wordVerMatch(arg_193_0, arg_193_1, arg_193_2, arg_193_3, arg_193_4, arg_193_5, arg_193_6, arg_193_7)
	if arg_193_3 > #arg_193_0 then
		return arg_193_5, arg_193_6, arg_193_7
	end

	local var_193_0 = arg_193_0[arg_193_3]
	local var_193_1 = arg_193_1[var_193_0]

	if var_193_1 then
		local var_193_2, var_193_3, var_193_4 = wordVerMatch(arg_193_0, var_193_1, arg_193_2, arg_193_3 + 1, arg_193_2.isReplace and arg_193_4 .. arg_193_2.replaceWord or arg_193_4, var_193_1.this or arg_193_5, var_193_1.this and arg_193_3 + 1 or arg_193_6, var_193_1.this and (arg_193_2.isReplace and arg_193_4 .. arg_193_2.replaceWord or arg_193_4) or arg_193_7)

		if var_193_2 then
			return var_193_2, var_193_3, var_193_4
		end
	end

	local var_193_5 = var_0_16(var_193_0)
	local var_193_6 = arg_193_1[var_193_5]

	if var_193_5 ~= var_193_0 and var_193_6 then
		local var_193_7, var_193_8, var_193_9 = wordVerMatch(arg_193_0, var_193_6, arg_193_2, arg_193_3 + 1, arg_193_2.isReplace and arg_193_4 .. arg_193_2.replaceWord or arg_193_4, var_193_6.this or arg_193_5, var_193_6.this and arg_193_3 + 1 or arg_193_6, var_193_6.this and (arg_193_2.isReplace and arg_193_4 .. arg_193_2.replaceWord or arg_193_4) or arg_193_7)

		if var_193_7 then
			return var_193_7, var_193_8, var_193_9
		end
	end

	return arg_193_5, arg_193_6, arg_193_7
end

function wordSplit(arg_194_0)
	local var_194_0 = {}

	for iter_194_0 in arg_194_0.gmatch(arg_194_0, "[\x01-\x7F�-�][�-�]*") do
		var_194_0[#var_194_0 + 1] = iter_194_0
	end

	return var_194_0
end

function contentWrap(arg_195_0, arg_195_1, arg_195_2)
	local var_195_0 = LuaHelper.WrapContent(arg_195_0, arg_195_1, arg_195_2)

	return #var_195_0 ~= #arg_195_0, var_195_0
end

function cancelRich(arg_196_0)
	local var_196_0

	for iter_196_0 = 1, 20 do
		local var_196_1

		arg_196_0, var_196_1 = string.gsub(arg_196_0, "<([^>]*)>", "%1")

		if var_196_1 <= 0 then
			break
		end
	end

	return arg_196_0
end

function cancelColorRich(arg_197_0)
	local var_197_0

	for iter_197_0 = 1, 20 do
		local var_197_1

		arg_197_0, var_197_1 = string.gsub(arg_197_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_197_1 <= 0 then
			break
		end
	end

	return arg_197_0
end

function getSkillConfig(arg_198_0)
	local var_198_0 = pg.buffCfg["buff_" .. arg_198_0]

	if not var_198_0 then
		return
	end

	local var_198_1 = Clone(var_198_0)

	var_198_1.name = getSkillName(arg_198_0)
	var_198_1.desc = HXSet.hxLan(var_198_1.desc)
	var_198_1.desc_get = HXSet.hxLan(var_198_1.desc_get)

	_.each(var_198_1, function(arg_199_0)
		arg_199_0.desc = HXSet.hxLan(arg_199_0.desc)
	end)

	return var_198_1
end

function getSkillName(arg_200_0)
	local var_200_0 = pg.skill_data_template[arg_200_0] or pg.skill_data_display[arg_200_0]

	if var_200_0 then
		return HXSet.hxLan(var_200_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_201_0, arg_201_1)
	local var_201_0 = arg_201_1 and pg.skill_world_display[arg_201_0] and setmetatable({}, {
		__index = function(arg_202_0, arg_202_1)
			return pg.skill_world_display[arg_201_0][arg_202_1] or pg.skill_data_template[arg_201_0][arg_202_1]
		end
	}) or pg.skill_data_template[arg_201_0]

	if not var_201_0 then
		return ""
	end

	local var_201_1 = var_201_0.desc_get ~= "" and var_201_0.desc_get or var_201_0.desc

	for iter_201_0, iter_201_1 in pairs(var_201_0.desc_get_add) do
		local var_201_2 = setColorStr(iter_201_1[1], COLOR_GREEN)

		if iter_201_1[2] then
			var_201_2 = var_201_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_201_1[2], COLOR_GREEN))
		end

		var_201_1 = specialGSub(var_201_1, "$" .. iter_201_0, var_201_2)
	end

	return HXSet.hxLan(var_201_1)
end

function getSkillDescLearn(arg_203_0, arg_203_1, arg_203_2)
	local var_203_0 = arg_203_2 and pg.skill_world_display[arg_203_0] and setmetatable({}, {
		__index = function(arg_204_0, arg_204_1)
			return pg.skill_world_display[arg_203_0][arg_204_1] or pg.skill_data_template[arg_203_0][arg_204_1]
		end
	}) or pg.skill_data_template[arg_203_0]

	if not var_203_0 then
		return ""
	end

	local var_203_1 = var_203_0.desc

	if not var_203_0.desc_add then
		return HXSet.hxLan(var_203_1)
	end

	for iter_203_0, iter_203_1 in pairs(var_203_0.desc_add) do
		local var_203_2 = iter_203_1[arg_203_1][1]

		if iter_203_1[arg_203_1][2] then
			var_203_2 = var_203_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_203_1[arg_203_1][2])
		end

		var_203_1 = specialGSub(var_203_1, "$" .. iter_203_0, setColorStr(var_203_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_203_1)
end

function getSkillDesc(arg_205_0, arg_205_1, arg_205_2)
	local var_205_0 = arg_205_2 and pg.skill_world_display[arg_205_0] and setmetatable({}, {
		__index = function(arg_206_0, arg_206_1)
			return pg.skill_world_display[arg_205_0][arg_206_1] or pg.skill_data_template[arg_205_0][arg_206_1]
		end
	}) or pg.skill_data_template[arg_205_0]

	if not var_205_0 then
		return ""
	end

	local var_205_1 = var_205_0.desc

	if not var_205_0.desc_add then
		return HXSet.hxLan(var_205_1)
	end

	for iter_205_0, iter_205_1 in pairs(var_205_0.desc_add) do
		local var_205_2 = setColorStr(iter_205_1[arg_205_1][1], COLOR_GREEN)

		var_205_1 = specialGSub(var_205_1, "$" .. iter_205_0, var_205_2)
	end

	return HXSet.hxLan(var_205_1)
end

function specialGSub(arg_207_0, arg_207_1, arg_207_2)
	arg_207_0 = string.gsub(arg_207_0, "<color=#", "<color=NNN")
	arg_207_0 = string.gsub(arg_207_0, "#", "")
	arg_207_2 = string.gsub(arg_207_2, "%%", "%%%%")
	arg_207_0 = string.gsub(arg_207_0, arg_207_1, arg_207_2)
	arg_207_0 = string.gsub(arg_207_0, "<color=NNN", "<color=#")

	return arg_207_0
end

function topAnimation(arg_208_0, arg_208_1, arg_208_2, arg_208_3, arg_208_4, arg_208_5)
	local var_208_0 = {}

	arg_208_4 = arg_208_4 or 0.27

	local var_208_1 = 0.05

	if arg_208_0 then
		local var_208_2 = arg_208_0.transform.localPosition.x

		setAnchoredPosition(arg_208_0, {
			x = var_208_2 - 500
		})
		shiftPanel(arg_208_0, var_208_2, nil, 0.05, arg_208_4, true, true)
		setActive(arg_208_0, true)
	end

	setActive(arg_208_1, false)
	setActive(arg_208_2, false)
	setActive(arg_208_3, false)

	for iter_208_0 = 1, 3 do
		table.insert(var_208_0, LeanTween.delayedCall(arg_208_4 + 0.13 + var_208_1 * iter_208_0, System.Action(function()
			if arg_208_1 then
				setActive(arg_208_1, not arg_208_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_208_0, LeanTween.delayedCall(arg_208_4 + 0.02 + var_208_1 * iter_208_0, System.Action(function()
			if arg_208_2 then
				setActive(arg_208_2, not go(arg_208_2).activeSelf)
			end

			if arg_208_2 then
				setActive(arg_208_3, not go(arg_208_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_208_5 then
		table.insert(var_208_0, LeanTween.delayedCall(arg_208_4 + 0.13 + var_208_1 * 3 + 0.1, System.Action(function()
			arg_208_5()
		end)).uniqueId)
	end

	return var_208_0
end

function cancelTweens(arg_212_0)
	assert(arg_212_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_212_0, iter_212_1 in ipairs(arg_212_0) do
		if iter_212_1 then
			LeanTween.cancel(iter_212_1)
		end
	end
end

function getOfflineTimeStamp(arg_213_0)
	local var_213_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_213_0
	local var_213_1 = ""

	if var_213_0 <= 59 then
		var_213_1 = i18n("just_now")
	elseif var_213_0 <= 3599 then
		var_213_1 = i18n("several_minutes_before", math.floor(var_213_0 / 60))
	elseif var_213_0 <= 86399 then
		var_213_1 = i18n("several_hours_before", math.floor(var_213_0 / 3600))
	else
		var_213_1 = i18n("several_days_before", math.floor(var_213_0 / 86400))
	end

	return var_213_1
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_214_0)
	if PaintCameraAdjustOn ~= arg_214_0 then
		local var_214_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_214_0 then
			var_214_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_214_0.matchWidthOrHeight = 1
		else
			var_214_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		pg.CameraFixMgr.GetInstance():BlockCameraRatioControll(arg_214_0)

		PaintCameraAdjustOn = arg_214_0
	end
end

function ManhattonDist(arg_215_0, arg_215_1)
	return math.abs(arg_215_0.row - arg_215_1.row) + math.abs(arg_215_0.column - arg_215_1.column)
end

function checkFirstHelpShow(arg_216_0)
	local var_216_0 = getProxy(SettingsProxy)

	if not var_216_0:checkReadHelp(arg_216_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_216_0].tip
		})
		var_216_0:recordReadHelp(arg_216_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_217_0)
	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_218_0)
	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_218_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function comma_value(arg_220_0)
	local var_220_0 = arg_220_0
	local var_220_1 = 0

	repeat
		local var_220_2

		var_220_0, var_220_2 = string.gsub(var_220_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_220_2 == 0

	return var_220_0
end

local var_0_17 = 0.2

function SwitchPanel(arg_221_0, arg_221_1, arg_221_2, arg_221_3, arg_221_4, arg_221_5)
	arg_221_3 = defaultValue(arg_221_3, var_0_17)

	if arg_221_5 then
		LeanTween.cancel(go(arg_221_0))
	end

	local var_221_0 = Vector3.New(tf(arg_221_0).localPosition.x, tf(arg_221_0).localPosition.y, tf(arg_221_0).localPosition.z)

	if arg_221_1 then
		var_221_0.x = arg_221_1
	end

	if arg_221_2 then
		var_221_0.y = arg_221_2
	end

	local var_221_1 = LeanTween.move(rtf(arg_221_0), var_221_0, arg_221_3):setEase(LeanTweenType.easeInOutSine)

	if arg_221_4 then
		var_221_1:setDelay(arg_221_4)
	end

	return var_221_1
end

function updateActivityTaskStatus(arg_222_0)
	if IslandTaskActhelper.IsIslandTaskAct(arg_222_0) then
		return
	end

	local var_222_0 = arg_222_0:getConfig("config_id")
	local var_222_1, var_222_2 = getActivityTask(arg_222_0, true)

	if not var_222_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_222_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_223_0)
	local var_223_0 = getProxy(TaskProxy)
	local var_223_1 = arg_223_0:getNDay()
	local var_223_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_223_0:getStartTime())

	for iter_223_0, iter_223_1 in ipairs(arg_223_0:getConfig("config_data")) do
		local var_223_3 = pg.battlepass_task_group[iter_223_1]

		if var_223_3 and var_223_2 >= var_223_3.group_mask then
			if underscore.any(underscore.flatten(var_223_3.task_group), function(arg_224_0)
				return var_223_0:getTaskVO(arg_224_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD, {
					cmd = 1,
					activity_id = arg_223_0.id
				})

				return true
			end
		elseif not var_223_3 then
			warning("battlepass_task_group表中不存在 id = " .. iter_223_1)
		end
	end

	return false
end

function updateCrusingHei5ActivityTask(arg_225_0)
	local var_225_0 = getProxy(TaskProxy)
	local var_225_1 = arg_225_0:getNDay()
	local var_225_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_225_0:getStartTime())

	for iter_225_0, iter_225_1 in ipairs(arg_225_0:getConfig("config_data")) do
		local var_225_3 = pg.black_friday_battlepass_task_group[iter_225_1]

		if var_225_3 and var_225_2 >= var_225_3.group_mask then
			if underscore.any(underscore.flatten(var_225_3.task_group), function(arg_226_0)
				return var_225_0:getTaskVO(arg_226_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD_HEI5, {
					cmd = 1,
					activity_id = arg_225_0.id
				})

				return true
			end
		elseif not var_225_3 then
			warning("black_friday_battlepass_task_group表中不存在 id = " .. iter_225_1)
		end
	end

	return false
end

function setShipCardFrame(arg_227_0, arg_227_1, arg_227_2)
	arg_227_0.localScale = Vector3.one
	arg_227_0.anchorMin = Vector2.zero
	arg_227_0.anchorMax = Vector2.one

	local var_227_0 = arg_227_2 or arg_227_1

	GetImageSpriteFromAtlasAsync("shipframe", var_227_0, arg_227_0)

	local var_227_1 = pg.frame_resource[var_227_0]

	if var_227_1 then
		local var_227_2 = var_227_1.param

		arg_227_0.offsetMin = Vector2(var_227_2[1], var_227_2[2])
		arg_227_0.offsetMax = Vector2(var_227_2[3], var_227_2[4])
	else
		arg_227_0.offsetMin = Vector2.zero
		arg_227_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_228_0, arg_228_1, arg_228_2)
	arg_228_0.localScale = Vector3.one
	arg_228_0.anchorMin = Vector2.zero
	arg_228_0.anchorMax = Vector2.one

	setImageSprite(arg_228_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_228_2 or arg_228_1)))

	local var_228_0 = "b" .. (arg_228_2 or arg_228_1)
	local var_228_1 = pg.frame_resource[var_228_0]

	if var_228_1 then
		local var_228_2 = var_228_1.param

		arg_228_0.offsetMin = Vector2(var_228_2[1], var_228_2[2])
		arg_228_0.offsetMax = Vector2(var_228_2[3], var_228_2[4])
	else
		arg_228_0.offsetMin = Vector2.zero
		arg_228_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_229_0, arg_229_1)
	if arg_229_1 then
		local var_229_0 = arg_229_1 .. "(Clone)"
		local var_229_1 = false

		eachChild(arg_229_0, function(arg_230_0)
			setActive(arg_230_0, arg_230_0.name == var_229_0)

			var_229_1 = var_229_1 or arg_230_0.name == var_229_0
		end)

		if not var_229_1 then
			LoadAndInstantiateAsync("effect", arg_229_1, function(arg_231_0)
				if IsNil(arg_229_0) or findTF(arg_229_0, var_229_0) then
					Object.Destroy(arg_231_0)
				else
					setParent(arg_231_0, arg_229_0)
					setActive(arg_231_0, true)
				end
			end)
		end
	end

	setActive(arg_229_0, arg_229_1)
end

function setProposeMarkIcon(arg_232_0, arg_232_1)
	local var_232_0 = arg_232_0:Find("proposeShipCard(Clone)")
	local var_232_1 = arg_232_1.propose and not arg_232_1:ShowPropose()

	if var_232_0 then
		setActive(var_232_0, var_232_1)
	elseif var_232_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_233_0)
			if IsNil(arg_232_0) or arg_232_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_233_0)
			else
				setParent(arg_233_0, arg_232_0, false)
			end
		end)
	end
end

function flushShipCard(arg_234_0, arg_234_1)
	local var_234_0 = arg_234_1:rarity2bgPrint()
	local var_234_1 = findTF(arg_234_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_234_0, "", var_234_1)

	local var_234_2 = findTF(arg_234_0, "content/ship_icon")
	local var_234_3 = arg_234_1 and {
		"shipYardIcon/" .. arg_234_1:getPainting(),
		arg_234_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_234_3[1], var_234_3[2], var_234_2)

	local var_234_4 = arg_234_1:getShipType()
	local var_234_5 = findTF(arg_234_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_234_4), var_234_5)
	setText(findTF(arg_234_0, "content/dockyard/lv/Text"), defaultValue(arg_234_1.level, 1))

	local var_234_6 = arg_234_1:getStar()
	local var_234_7 = arg_234_1:getMaxStar()
	local var_234_8 = findTF(arg_234_0, "content/front/stars")

	setActive(var_234_8, true)

	local var_234_9 = findTF(var_234_8, "star_tpl")
	local var_234_10 = var_234_8.childCount

	for iter_234_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_234_11 = var_234_10 < iter_234_0 and cloneTplTo(var_234_9, var_234_8) or var_234_8:GetChild(iter_234_0 - 1)

		setActive(var_234_11, iter_234_0 <= var_234_7)
		triggerToggle(var_234_11, iter_234_0 <= var_234_6)
	end

	local var_234_12 = findTF(arg_234_0, "content/front/frame")
	local var_234_13, var_234_14 = arg_234_1:GetFrameAndEffect()

	setShipCardFrame(var_234_12, var_234_0, var_234_13)
	setFrameEffect(findTF(arg_234_0, "content/front/bg_other"), var_234_14)
	setProposeMarkIcon(arg_234_0:Find("content/dockyard/propose"), arg_234_1)
end

function TweenItemAlphaAndWhite(arg_235_0)
	LeanTween.cancel(arg_235_0)

	local var_235_0 = GetOrAddComponent(arg_235_0, "CanvasGroup")

	var_235_0.alpha = 0

	LeanTween.alphaCanvas(var_235_0, 1, 0.2):setUseEstimatedTime(true)

	local var_235_1 = findTF(arg_235_0.transform, "white_mask")

	if var_235_1 then
		setActive(var_235_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_236_0)
	LeanTween.cancel(arg_236_0)

	GetOrAddComponent(arg_236_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_237_0)
	local var_237_0 = {}
	local var_237_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_237_2 = getProxy(CollectionProxy):getShipGroup(arg_237_0)

	if var_237_2 then
		local var_237_3 = ShipGroup.getSkinList(arg_237_0)

		for iter_237_0, iter_237_1 in ipairs(var_237_3) do
			if iter_237_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_237_1, iter_237_1.id) or iter_237_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_237_2.trans or iter_237_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_237_2.married == 1 then
				var_237_0[iter_237_1.id] = true
			end
		end
	end

	return var_237_0
end

function split(arg_238_0, arg_238_1)
	local var_238_0 = {}

	if not arg_238_0 then
		return nil
	end

	local var_238_1 = #arg_238_0
	local var_238_2 = 1

	while var_238_2 <= var_238_1 do
		local var_238_3 = string.find(arg_238_0, arg_238_1, var_238_2)

		if var_238_3 == nil then
			table.insert(var_238_0, string.sub(arg_238_0, var_238_2, var_238_1))

			break
		end

		table.insert(var_238_0, string.sub(arg_238_0, var_238_2, var_238_3 - 1))

		if var_238_3 == var_238_1 then
			table.insert(var_238_0, "")

			break
		end

		var_238_2 = var_238_3 + 1
	end

	return var_238_0
end

function NumberToChinese(arg_239_0, arg_239_1)
	local var_239_0 = ""
	local var_239_1 = #arg_239_0

	for iter_239_0 = 1, var_239_1 do
		local var_239_2 = string.sub(arg_239_0, iter_239_0, iter_239_0)

		if var_239_2 ~= "0" or var_239_2 == "0" and not arg_239_1 then
			if arg_239_1 then
				if var_239_1 >= 2 then
					if iter_239_0 == 1 then
						if var_239_2 == "1" then
							var_239_0 = i18n("number_" .. 10)
						else
							var_239_0 = i18n("number_" .. var_239_2) .. i18n("number_" .. 10)
						end
					else
						var_239_0 = var_239_0 .. i18n("number_" .. var_239_2)
					end
				else
					var_239_0 = var_239_0 .. i18n("number_" .. var_239_2)
				end
			else
				var_239_0 = var_239_0 .. i18n("number_" .. var_239_2)
			end
		end
	end

	return var_239_0
end

function getActivityTask(arg_240_0, arg_240_1)
	local var_240_0 = getProxy(TaskProxy)
	local var_240_1 = arg_240_0:getConfig("config_data")
	local var_240_2 = arg_240_0:getNDay(arg_240_0.data1)
	local var_240_3
	local var_240_4
	local var_240_5

	for iter_240_0 = math.max(arg_240_0.data3, 1), math.min(var_240_2, #var_240_1) do
		local var_240_6 = _.flatten({
			var_240_1[iter_240_0]
		})

		for iter_240_1, iter_240_2 in ipairs(var_240_6) do
			local var_240_7 = var_240_0:getTaskById(iter_240_2)

			if var_240_7 then
				return var_240_7.id, var_240_7
			end

			if var_240_4 then
				var_240_5 = var_240_0:getFinishTaskById(iter_240_2)

				if var_240_5 then
					var_240_4 = var_240_5
				elseif arg_240_1 then
					return iter_240_2
				else
					return var_240_4.id, var_240_4
				end
			else
				var_240_4 = var_240_0:getFinishTaskById(iter_240_2)
				var_240_5 = var_240_5 or iter_240_2
			end
		end
	end

	if var_240_4 then
		return var_240_4.id, var_240_4
	else
		return var_240_5
	end
end

function setImageFromImage(arg_241_0, arg_241_1, arg_241_2)
	local var_241_0 = GetComponent(arg_241_0, "Image")

	var_241_0.sprite = GetComponent(arg_241_1, "Image").sprite

	if arg_241_2 then
		var_241_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_242_0)
	local var_242_0, var_242_1, var_242_2, var_242_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_242_0)

	if var_242_0 >= 1 then
		return i18n("limit_skin_time_day", var_242_0)
	elseif var_242_0 <= 0 and var_242_1 > 0 then
		return i18n("limit_skin_time_day_min", var_242_1, var_242_2)
	elseif var_242_0 <= 0 and var_242_1 <= 0 and (var_242_2 > 0 or var_242_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_242_2, 1))
	elseif var_242_0 <= 0 and var_242_1 <= 0 and var_242_2 <= 0 and var_242_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_243_0)
	local var_243_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_243_1 = math.max(arg_243_0 - var_243_0, 0)
	local var_243_2 = math.floor(var_243_1 / 86400)

	if var_243_2 > 0 then
		return i18n("time_remaining_tip") .. var_243_2 .. i18n("word_date")
	else
		local var_243_3 = math.floor(var_243_1 / 3600)

		if var_243_3 > 0 then
			return i18n("time_remaining_tip") .. var_243_3 .. i18n("word_hour")
		else
			local var_243_4 = math.floor(var_243_1 / 60)

			if var_243_4 > 0 then
				return i18n("time_remaining_tip") .. var_243_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_243_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_244_0)
	local var_244_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_244_0
	local var_244_1 = var_244_0 / 86400

	if var_244_1 > 1 then
		return i18n("ins_word_day", math.floor(var_244_1))
	else
		local var_244_2 = var_244_0 / 3600

		if var_244_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_244_2))
		else
			local var_244_3 = var_244_0 / 60

			if var_244_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_244_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_245_0)
	local var_245_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_245_0
	local var_245_1 = var_245_0 / 86400

	if var_245_1 > 1 then
		return i18n1(math.floor(var_245_1) .. "d")
	else
		local var_245_2 = var_245_0 / 3600

		if var_245_2 > 1 then
			return i18n1(math.floor(var_245_2) .. "h")
		else
			local var_245_3 = var_245_0 / 60

			if var_245_3 > 1 then
				return i18n1(math.floor(var_245_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_246_0)
	local var_246_0, var_246_1, var_246_2, var_246_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_246_0)

	if var_246_0 <= 0 and var_246_1 <= 0 and var_246_2 <= 0 and var_246_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_246_0, var_246_1, var_246_2)
	end
end

function checkExist(arg_247_0, ...)
	local var_247_0 = {
		...
	}

	for iter_247_0, iter_247_1 in ipairs(var_247_0) do
		if arg_247_0 == nil then
			break
		end

		assert(type(arg_247_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_247_1) == "table", "type error : param should be table")

		if type(arg_247_0[iter_247_1[1]]) == "function" then
			arg_247_0 = arg_247_0[iter_247_1[1]](arg_247_0, unpack(iter_247_1[2] or {}))
		else
			arg_247_0 = arg_247_0[iter_247_1[1]]
		end
	end

	return arg_247_0
end

function AcessWithinNull(arg_248_0, arg_248_1)
	if arg_248_0 == nil then
		return
	end

	assert(type(arg_248_0) == "table")

	return arg_248_0[arg_248_1]
end

function showRepairMsgbox()
	local var_249_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_249_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_249_2 = {
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
			var_249_2,
			var_249_1,
			var_249_0
		}
	})
end

function resourceVerify(arg_253_0, arg_253_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_253_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_253_1
	local var_253_2 = PathMgr.ReadAllLines(var_253_0)
	local var_253_3 = {}

	if arg_253_0 then
		setActive(arg_253_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_253_4()
		if arg_253_0 then
			setActive(arg_253_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_253_1)

		if var_253_1 then
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

	local var_253_5 = var_253_2.Length
	local var_253_6

	local function var_253_7(arg_256_0)
		if arg_256_0 < 0 then
			var_253_4()

			return
		end

		if arg_253_1 then
			setSlider(arg_253_1, 0, var_253_5, var_253_5 - arg_256_0)
		end

		local var_256_0 = string.split(var_253_2[arg_256_0], ",")
		local var_256_1 = var_256_0[1]
		local var_256_2 = var_256_0[3]
		local var_256_3 = PathMgr.getAssetBundle(var_256_1)

		if PathMgr.FileExists(var_256_3) then
			local var_256_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_256_1))

			if var_256_2 == HashUtil.CalcMD5(var_256_4) then
				onNextTick(function()
					var_253_7(arg_256_0 - 1)
				end)

				return
			end
		end

		var_253_1 = var_256_1

		var_253_4()
	end

	var_253_7(var_253_5 - 1)
end

function splitByWordEN(arg_258_0, arg_258_1)
	local var_258_0 = string.split(arg_258_0, " ")
	local var_258_1 = ""
	local var_258_2 = ""
	local var_258_3 = arg_258_1:GetComponent(typeof(RectTransform))
	local var_258_4 = arg_258_1:GetComponent(typeof(Text))
	local var_258_5 = var_258_3.rect.width

	for iter_258_0, iter_258_1 in ipairs(var_258_0) do
		local var_258_6 = var_258_2

		var_258_2 = var_258_2 == "" and iter_258_1 or var_258_2 .. " " .. iter_258_1

		setText(arg_258_1, var_258_2)

		if var_258_5 < var_258_4.preferredWidth then
			var_258_1 = var_258_1 == "" and var_258_6 or var_258_1 .. "\n" .. var_258_6
			var_258_2 = iter_258_1
		end

		if iter_258_0 >= #var_258_0 then
			var_258_1 = var_258_1 == "" and var_258_2 or var_258_1 .. "\n" .. var_258_2
		end
	end

	return var_258_1
end

function checkBirthFormat(arg_259_0)
	if #arg_259_0 ~= 8 then
		return false
	end

	local var_259_0 = 0
	local var_259_1 = #arg_259_0

	while var_259_0 < var_259_1 do
		local var_259_2 = string.byte(arg_259_0, var_259_0 + 1)

		if var_259_2 < 48 or var_259_2 > 57 then
			return false
		end

		var_259_0 = var_259_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_260_0)
	local var_260_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_260_0, function(arg_261_0)
		return arg_261_0 == arg_260_0
	end)
end

function GetServerState(arg_262_0)
	local var_262_0 = -1
	local var_262_1 = 0
	local var_262_2 = 1
	local var_262_3 = 2
	local var_262_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_262_4 = string.gsub(var_262_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_262_4, function(arg_263_0, arg_263_1)
		local var_263_0 = true
		local var_263_1 = false

		for iter_263_0 in string.gmatch(arg_263_1, "\"state\":%d") do
			if iter_263_0 ~= "\"state\":1" then
				var_263_0 = false
			end

			var_263_1 = true
		end

		if not var_263_1 then
			var_263_0 = false
		end

		if arg_262_0 ~= nil then
			arg_262_0(var_263_0 and var_262_2 or var_262_1)
		end
	end)
end

function setScrollText(arg_264_0, arg_264_1)
	GetOrAddComponent(arg_264_0, "ScrollText"):SetText(arg_264_1)
end

function changeToScrollText(arg_265_0, arg_265_1)
	local var_265_0 = GetComponent(arg_265_0, typeof(Text))

	assert(var_265_0, "without component<Text>")

	local var_265_1 = arg_265_0:Find("subText")

	if not var_265_1 then
		var_265_1 = cloneTplTo(arg_265_0, arg_265_0, "subText")

		eachChild(arg_265_0, function(arg_266_0)
			setActive(arg_266_0, arg_266_0 == var_265_1)
		end)

		arg_265_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_265_1, arg_265_1)
end

function setScrollTextWithSize(arg_267_0, arg_267_1, arg_267_2, arg_267_3)
	local var_267_0 = arg_267_3 < GetPerceptualSize(arg_267_2)

	setActive(arg_267_1, var_267_0)
	setActive(arg_267_0, not var_267_0)

	if var_267_0 then
		setScrollText(arg_267_1, arg_267_2)
	else
		setText(arg_267_0, arg_267_2)
	end
end

local var_0_18
local var_0_19
local var_0_20
local var_0_21

local function var_0_22(arg_268_0, arg_268_1, arg_268_2)
	local var_268_0 = arg_268_0:Find("base")
	local var_268_1, var_268_2, var_268_3 = Equipment.GetInfoTrans(arg_268_1, arg_268_2)

	if arg_268_1.nextValue then
		local var_268_4 = {
			name = arg_268_1.name,
			type = arg_268_1.type,
			value = arg_268_1.nextValue
		}
		local var_268_5, var_268_6 = Equipment.GetInfoTrans(var_268_4, arg_268_2)

		var_268_2 = var_268_2 .. setColorStr("   >   " .. var_268_6, COLOR_GREEN)
	end

	setText(var_268_0:Find("name"), var_268_1)

	if var_268_3 then
		local var_268_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_268_0:Find("value"), var_268_2 .. var_268_7)
	else
		setText(var_268_0:Find("value"), var_268_2)
	end

	setActive(var_268_0:Find("value/up"), arg_268_1.compare and arg_268_1.compare > 0)
	setActive(var_268_0:Find("value/down"), arg_268_1.compare and arg_268_1.compare < 0)
	triggerToggle(var_268_0, arg_268_1.lock_open)

	if not arg_268_1.lock_open and arg_268_1.sub and #arg_268_1.sub > 0 then
		GetComponent(var_268_0, typeof(Toggle)).enabled = true
	else
		setActive(var_268_0:Find("name/close"), false)
		setActive(var_268_0:Find("name/open"), false)

		GetComponent(var_268_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_23(arg_269_0, arg_269_1, arg_269_2, arg_269_3)
	var_0_22(arg_269_0, arg_269_2, arg_269_3)

	if not arg_269_2.sub or #arg_269_2.sub == 0 then
		return
	end

	var_0_20(arg_269_0:Find("subs"), arg_269_1, arg_269_2.sub, arg_269_3)
end

function var_0_20(arg_270_0, arg_270_1, arg_270_2, arg_270_3)
	removeAllChildren(arg_270_0)
	var_0_21(arg_270_0, arg_270_1, arg_270_2, arg_270_3)
end

function var_0_21(arg_271_0, arg_271_1, arg_271_2, arg_271_3)
	for iter_271_0, iter_271_1 in ipairs(arg_271_2) do
		local var_271_0 = cloneTplTo(arg_271_1, arg_271_0)

		var_0_23(var_271_0, arg_271_1, iter_271_1, arg_271_3)
	end
end

function updateEquipInfo(arg_272_0, arg_272_1, arg_272_2, arg_272_3)
	local var_272_0 = arg_272_0:Find("attr_tpl")

	var_0_20(arg_272_0:Find("attrs"), var_272_0, arg_272_1.attrs, arg_272_3)
	setActive(arg_272_0:Find("skill"), arg_272_2)

	if arg_272_2 then
		var_0_23(arg_272_0:Find("skill/attr"), var_272_0, {
			name = i18n("skill"),
			value = setColorStr(arg_272_2.name, "#FFDE00FF")
		}, arg_272_3)
		setText(arg_272_0:Find("skill/value/Text"), getSkillDescGet(arg_272_2.id))
	end

	setActive(arg_272_0:Find("weapon"), #arg_272_1.weapon.sub > 0)

	if #arg_272_1.weapon.sub > 0 then
		var_0_20(arg_272_0:Find("weapon"), var_272_0, {
			arg_272_1.weapon
		}, arg_272_3)
	end

	setActive(arg_272_0:Find("equip_info"), #arg_272_1.equipInfo.sub > 0)

	if #arg_272_1.equipInfo.sub > 0 then
		var_0_20(arg_272_0:Find("equip_info"), var_272_0, {
			arg_272_1.equipInfo
		}, arg_272_3)
	end

	var_0_23(arg_272_0:Find("part/attr"), var_272_0, {
		name = i18n("equip_info_23")
	}, arg_272_3)

	local var_272_1 = arg_272_0:Find("part/value")
	local var_272_2 = var_272_1:Find("label")
	local var_272_3 = {}
	local var_272_4 = {}

	if #arg_272_1.part[1] == 0 and #arg_272_1.part[2] == 0 then
		setmetatable(var_272_3, {
			__index = function(arg_273_0, arg_273_1)
				return true
			end
		})
		setmetatable(var_272_4, {
			__index = function(arg_274_0, arg_274_1)
				return true
			end
		})
	else
		for iter_272_0, iter_272_1 in ipairs(arg_272_1.part[1]) do
			var_272_3[iter_272_1] = true
		end

		for iter_272_2, iter_272_3 in ipairs(arg_272_1.part[2]) do
			var_272_4[iter_272_3] = true
		end
	end

	local var_272_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_272_3, var_272_4)

	UIItemList.StaticAlign(var_272_1, var_272_2, #var_272_5, function(arg_275_0, arg_275_1, arg_275_2)
		arg_275_1 = arg_275_1 + 1

		if arg_275_0 == UIItemList.EventUpdate then
			local var_275_0 = var_272_5[arg_275_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_275_0), arg_275_2)
			setActive(arg_275_2:Find("main"), var_272_3[var_275_0] and not var_272_4[var_275_0])
			setActive(arg_275_2:Find("sub"), var_272_4[var_275_0] and not var_272_3[var_275_0])
			setImageAlpha(arg_275_2, not var_272_3[var_275_0] and not var_272_4[var_275_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_276_0, arg_276_1, arg_276_2)
	local var_276_0 = arg_276_0:Find("attr_tpl")

	var_0_20(arg_276_0:Find("attrs"), var_276_0, arg_276_1.attrs, arg_276_2)
	setActive(arg_276_0:Find("weapon"), #arg_276_1.weapon.sub > 0)

	if #arg_276_1.weapon.sub > 0 then
		var_0_20(arg_276_0:Find("weapon"), var_276_0, {
			arg_276_1.weapon
		}, arg_276_2)
	end

	setActive(arg_276_0:Find("equip_info"), #arg_276_1.equipInfo.sub > 0)

	if #arg_276_1.equipInfo.sub > 0 then
		var_0_20(arg_276_0:Find("equip_info"), var_276_0, {
			arg_276_1.equipInfo
		}, arg_276_2)
	end
end

function setCanvasOverrideSorting(arg_277_0, arg_277_1)
	local var_277_0 = arg_277_0.parent

	arg_277_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_277_0) then
		GetOrAddComponent(arg_277_0, typeof(Canvas)).overrideSorting = arg_277_1
	else
		setActive(arg_277_0, true)

		GetOrAddComponent(arg_277_0, typeof(Canvas)).overrideSorting = arg_277_1

		setActive(arg_277_0, false)
	end

	arg_277_0:SetParent(var_277_0, false)
end

function createNewGameObject(arg_278_0, arg_278_1)
	local var_278_0 = GameObject.New()

	if arg_278_0 then
		var_278_0.name = "model"
	end

	var_278_0.layer = arg_278_1 or Layer.UI

	return GetOrAddComponent(var_278_0, "RectTransform")
end

function CreateShell(arg_279_0)
	if type(arg_279_0) ~= "table" and type(arg_279_0) ~= "userdata" then
		return arg_279_0
	end

	local var_279_0 = setmetatable({
		__index = arg_279_0
	}, arg_279_0)

	return setmetatable({}, var_279_0)
end

function CameraFittingSettin(arg_280_0)
	local var_280_0 = GetComponent(arg_280_0, typeof(Camera))
	local var_280_1 = 1.7777777777777777
	local var_280_2 = Screen.width / Screen.height

	if var_280_2 < var_280_1 then
		local var_280_3 = var_280_2 / var_280_1

		var_280_0.rect = var_0_0.Rect.New(0, (1 - var_280_3) / 2, 1, var_280_3)
	end
end

function SwitchSpecialChar(arg_281_0, arg_281_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_281_0 = arg_281_0:gsub(" ", " ")
		arg_281_0 = arg_281_0:gsub("\t", "    ")
	end

	if not arg_281_1 then
		arg_281_0 = arg_281_0:gsub("\n", " ")
	end

	return arg_281_0
end

function AfterCheck(arg_282_0, arg_282_1)
	local var_282_0 = {}

	for iter_282_0, iter_282_1 in ipairs(arg_282_0) do
		var_282_0[iter_282_0] = iter_282_1[1]()
	end

	arg_282_1()

	for iter_282_2, iter_282_3 in ipairs(arg_282_0) do
		if var_282_0[iter_282_2] ~= iter_282_3[1]() then
			iter_282_3[2]()
		end

		var_282_0[iter_282_2] = iter_282_3[1]()
	end
end

function CompareFuncs(arg_283_0, arg_283_1)
	local var_283_0 = {}

	local function var_283_1(arg_284_0, arg_284_1)
		var_283_0[arg_284_0] = var_283_0[arg_284_0] or {}
		var_283_0[arg_284_0][arg_284_1] = var_283_0[arg_284_0][arg_284_1] or arg_283_0[arg_284_0](arg_284_1)

		return var_283_0[arg_284_0][arg_284_1]
	end

	return function(arg_285_0, arg_285_1)
		local var_285_0 = 1

		while var_285_0 <= #arg_283_0 do
			local var_285_1 = var_283_1(var_285_0, arg_285_0)
			local var_285_2 = var_283_1(var_285_0, arg_285_1)

			if var_285_1 == var_285_2 then
				var_285_0 = var_285_0 + 1
			else
				return var_285_1 < var_285_2
			end
		end

		return tobool(arg_283_1)
	end
end

function DropResultIntegration(arg_286_0)
	local var_286_0 = {}
	local var_286_1 = 1

	while var_286_1 <= #arg_286_0 do
		local var_286_2 = arg_286_0[var_286_1].type
		local var_286_3 = arg_286_0[var_286_1].id

		var_286_0[var_286_2] = var_286_0[var_286_2] or {}

		if var_286_0[var_286_2][var_286_3] then
			local var_286_4 = arg_286_0[var_286_0[var_286_2][var_286_3]]
			local var_286_5 = table.remove(arg_286_0, var_286_1)

			var_286_4.count = var_286_4.count + var_286_5.count
		else
			var_286_0[var_286_2][var_286_3] = var_286_1
			var_286_1 = var_286_1 + 1
		end
	end

	local var_286_6 = {
		function(arg_287_0)
			local var_287_0 = arg_287_0.type
			local var_287_1 = arg_287_0.id

			if var_287_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_287_0 == DROP_TYPE_RESOURCE then
				if var_287_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_287_0 == DROP_TYPE_ITEM then
				if var_287_1 == 59010 then
					return 4
				elseif var_287_1 == 59900 then
					return 5
				else
					local var_287_2 = Item.getConfigData(var_287_1)
					local var_287_3 = var_287_2 and var_287_2.type or 0

					if var_287_3 == 9 then
						return 6
					elseif var_287_3 == 5 then
						return 7
					elseif var_287_3 == 4 then
						return 8
					elseif var_287_3 == 7 then
						return 9
					end
				end
			elseif var_287_0 == DROP_TYPE_VITEM and var_287_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_288_0)
			local var_288_0

			if arg_288_0.type == DROP_TYPE_SHIP then
				var_288_0 = pg.ship_data_statistics[arg_288_0.id]
			elseif arg_288_0.type == DROP_TYPE_ITEM then
				var_288_0 = Item.getConfigData(arg_288_0.id)
			end

			return (var_288_0 and var_288_0.rarity or 0) * -1
		end,
		function(arg_289_0)
			return arg_289_0.id
		end
	}

	table.sort(arg_286_0, CompareFuncs(var_286_6))
end

local function var_0_24()
	local var_290_0 = {}
	local var_290_1 = pg.TimeMgr.GetInstance():GetServerTime()

	for iter_290_0, iter_290_1 in ipairs(pg.login.all) do
		if pg.login[iter_290_1].date ~= "stop" then
			local var_290_2, var_290_3 = parseTimeConfig(pg.login[iter_290_1].date)

			assert(not var_290_3)

			if pg.TimeMgr.GetInstance():inTime(var_290_2, var_290_1) then
				table.insert(var_290_0, iter_290_1)
			end
		end
	end

	local function var_290_4(arg_291_0)
		local var_291_0 = pg.login[arg_291_0].effective_channel

		if type(var_291_0) == "table" then
			return var_291_0
		end

		if not var_291_0 or var_291_0 <= 0 then
			return {}
		end

		return {
			var_291_0
		}
	end

	local var_290_5 = {}

	if PLATFORM_CODE == PLATFORM_CH then
		local var_290_6 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()

		for iter_290_2, iter_290_3 in ipairs(var_290_0) do
			local var_290_7 = var_290_4(iter_290_3)

			if _.any(var_290_7, function(arg_292_0)
				return arg_292_0 == var_290_6
			end) or #var_290_7 == 0 then
				table.insert(var_290_5, iter_290_3)
			end
		end
	else
		for iter_290_4, iter_290_5 in ipairs(var_290_0) do
			if #var_290_4(iter_290_5) == 0 then
				table.insert(var_290_5, iter_290_5)
			end
		end
	end

	if #var_290_5 <= 0 then
		return 1
	end

	if #var_290_5 == 1 then
		return var_290_5[1]
	end

	table.sort(var_290_5, function(arg_293_0, arg_293_1)
		local var_293_0 = var_290_4(arg_293_0)
		local var_293_1 = var_290_4(arg_293_1)

		if #var_293_0 == #var_293_1 then
			return arg_293_1 < arg_293_0
		else
			return #var_293_0 > #var_293_1
		end
	end)

	return var_290_5[1]
end

function getLoginConfig()
	if LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value then
		return false, "login", "", false, ""
	end

	local var_294_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_294_1 = var_0_24()
	local var_294_2 = pg.login[var_294_1].login_static

	var_294_2 = var_294_2 ~= "" and var_294_2 or "login"

	local var_294_3 = pg.login[var_294_1].login_cri
	local var_294_4 = var_294_3 ~= "" and true or false
	local var_294_5 = pg.login[var_294_1].op_play == 1 and true or false
	local var_294_6 = noEmptyStr(pg.login[var_294_1].op_time)
	local var_294_7 = ""

	if not var_294_6 or var_294_6 == "stop" then
		var_294_5 = false
	else
		local var_294_8, var_294_9 = parseTimeConfig(pg.login[var_294_1].date)

		assert(not var_294_9)

		var_294_7 = table.concat(var_294_8[2][1])

		if not pg.TimeMgr.GetInstance():inTime(var_294_8, var_294_0) then
			var_294_5 = false
		end
	end

	return var_294_4, var_294_4 and var_294_3 or var_294_2, pg.login[var_294_1].bgm, var_294_5, var_294_7
end

function setIntimacyIcon(arg_295_0, arg_295_1, arg_295_2)
	local var_295_0 = {}
	local var_295_1

	seriesAsync({
		function(arg_296_0)
			if arg_295_0.childCount > 0 then
				var_295_1 = arg_295_0:GetChild(0)

				arg_296_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_297_0)
					if arg_295_0.childCount == 0 then
						var_295_1 = tf(arg_297_0)

						setParent(var_295_1, arg_295_0)
						arg_296_0()
					end
				end)
			end
		end,
		function(arg_298_0)
			setImageAlpha(var_295_1, arg_295_2 and 0 or 1)
			eachChild(var_295_1, function(arg_299_0)
				setActive(arg_299_0, false)
			end)

			if arg_295_2 then
				local var_298_0 = var_295_1:Find(arg_295_2 .. "(Clone)")

				if not var_298_0 then
					LoadAndInstantiateAsync("ui", arg_295_2, function(arg_300_0)
						setParent(arg_300_0, var_295_1)
						setActive(arg_300_0, true)
					end)
				else
					setActive(var_298_0, true)
				end
			elseif arg_295_1 then
				setImageSprite(var_295_1, GetSpriteFromAtlas("energy", arg_295_1), true)
			else
				assert(false, "param error")
			end
		end
	})
end

local var_0_25

function nowWorld()
	var_0_25 = var_0_25 or getProxy(WorldProxy)

	return var_0_25 and var_0_25.world
end

function removeWorld()
	var_0_25.world:Dispose()

	var_0_25.world = nil
	var_0_25 = nil
end

function switch(arg_303_0, arg_303_1, arg_303_2, ...)
	while type(arg_303_1[arg_303_0]) ~= "function" do
		if arg_303_1[arg_303_0] == nil then
			return existCall(arg_303_2, ...)
		else
			arg_303_0 = arg_303_1[arg_303_0]
		end
	end

	return arg_303_1[arg_303_0](...)
end

function parseTimeConfig(arg_304_0)
	if type(arg_304_0[1]) == "table" then
		return arg_304_0[2], arg_304_0[1]
	else
		return arg_304_0
	end
end

local var_0_26 = {
	__add = function(arg_305_0, arg_305_1)
		return NewPos(arg_305_0.x + arg_305_1.x, arg_305_0.y + arg_305_1.y)
	end,
	__sub = function(arg_306_0, arg_306_1)
		return NewPos(arg_306_0.x - arg_306_1.x, arg_306_0.y - arg_306_1.y)
	end,
	__mul = function(arg_307_0, arg_307_1)
		if type(arg_307_1) == "number" then
			return NewPos(arg_307_0.x * arg_307_1, arg_307_0.y * arg_307_1)
		else
			return NewPos(arg_307_0.x * arg_307_1.x, arg_307_0.y * arg_307_1.y)
		end
	end,
	__eq = function(arg_308_0, arg_308_1)
		return arg_308_0.x == arg_308_1.x and arg_308_0.y == arg_308_1.y
	end,
	__tostring = function(arg_309_0)
		return arg_309_0.x .. "_" .. arg_309_0.y
	end
}

function NewPos(arg_310_0, arg_310_1)
	assert(arg_310_0 and arg_310_1)

	local var_310_0 = setmetatable({
		x = arg_310_0,
		y = arg_310_1
	}, var_0_26)

	function var_310_0.SqrMagnitude(arg_311_0)
		return arg_311_0.x * arg_311_0.x + arg_311_0.y * arg_311_0.y
	end

	function var_310_0.Normalize(arg_312_0)
		local var_312_0 = arg_312_0:SqrMagnitude()

		if var_312_0 > 1e-05 then
			return arg_312_0 * (1 / math.sqrt(var_312_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_310_0
end

local var_0_27

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_27 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_27 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_314_0)
	return (string.char(226, 133, 160 + (arg_314_0 - 1)))
end

function GetRomanDigitPlus(arg_315_0)
	if arg_315_0 > 0 and arg_315_0 <= 10 then
		return GetRomanDigit(arg_315_0)
	else
		return switch(arg_315_0, {
			[11] = function()
				return "XI"
			end
		}, function()
			return arg_315_0
		end)
	end
end

function quickPlayAnimator(arg_318_0, arg_318_1)
	arg_318_0:GetComponent(typeof(Animator)):Play(arg_318_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_319_0, arg_319_1)
	local var_319_0 = arg_319_0:GetComponent(typeof(Animator))

	var_319_0.enabled = true

	local var_319_1 = Animator.StringToHash(arg_319_1)

	if var_319_0:HasState(0, var_319_1) then
		var_319_0:Play(arg_319_1, -1, 0)
	end
end

function quickPlayAnimation(arg_320_0, arg_320_1)
	local var_320_0 = arg_320_0:GetComponent(typeof(Animation))

	var_320_0:Stop()
	var_320_0:Play(arg_320_1)
end

function getSurveyUrl(arg_321_0)
	local var_321_0 = pg.survey_data_template[arg_321_0]
	local var_321_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_321_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_321_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_321_1 = var_321_0.main_url
				else
					var_321_1 = var_321_0.uo_url
				end
			elseif var_321_2 == PLATFORM_IPHONEPLAYER then
				var_321_1 = var_321_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_KR then
			var_321_1 = var_321_0.main_url
		end
	else
		var_321_1 = var_321_0.main_url
	end

	local var_321_3 = getProxy(PlayerProxy):getRawData().id
	local var_321_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_321_5
	local var_321_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_321_7 = getProxy(UserProxy):getRawData()
	local var_321_8 = getProxy(ServerProxy):getRawData()[var_321_7 and var_321_7.server or 0]
	local var_321_9 = var_321_8 and var_321_8.id or ""
	local var_321_10 = getProxy(PlayerProxy):getRawData().level
	local var_321_11 = var_321_3 .. "_" .. arg_321_0
	local var_321_12 = var_321_1
	local var_321_13 = {
		var_321_3,
		var_321_4,
		var_321_6,
		var_321_9,
		var_321_10,
		var_321_11
	}

	if var_321_12 then
		for iter_321_0, iter_321_1 in ipairs(var_321_13) do
			var_321_12 = string.gsub(var_321_12, "$" .. iter_321_0, tostring(iter_321_1))
		end
	end

	originalPrint("survey url", tostring(var_321_12))

	return var_321_12
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

function FilterVarchar(arg_323_0)
	assert(type(arg_323_0) == "string" or type(arg_323_0) == "table")

	if arg_323_0 == "" then
		return nil
	end

	return arg_323_0
end

function getGameset(arg_324_0)
	local var_324_0 = pg.gameset[arg_324_0]

	assert(var_324_0)

	return {
		var_324_0.key_value,
		var_324_0.description
	}
end

function getDorm3dGameset(arg_325_0)
	local var_325_0 = pg.dorm3d_set[arg_325_0]

	assert(var_325_0)

	return {
		var_325_0.key_value_int,
		var_325_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_326_0)
	arg_326_0 = arg_326_0 or {}

	local var_326_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_326_0 > 0 do
		local var_326_1 = table.remove(arg_326_0)

		switch(var_326_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_326_1:getConfig("open_directly") == 1 then
					for iter_327_0, iter_327_1 in ipairs(var_326_1:getConfig("display_icon")) do
						local var_327_0 = Drop.Create(iter_327_1)

						var_327_0.count = var_327_0.count * var_326_1.count

						table.insert(arg_326_0, var_327_0)
					end
				elseif var_326_1:getSubClass():IsShipExpType() then
					var_326_0[var_326_1.type][var_326_1.id] = defaultValue(var_326_0[var_326_1.type][var_326_1.id], 0) + var_326_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_326_0[var_326_1.type][var_326_1.id] = defaultValue(var_326_0[var_326_1.type][var_326_1.id], 0) + var_326_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_326_0[var_326_1.type] = var_326_0[var_326_1.type] + var_326_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_326_0[var_326_1.type] = var_326_0[var_326_1.type] + var_326_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_326_0[var_326_1.type] = var_326_0[var_326_1.type] + var_326_1.count
			end
		})
	end

	return var_326_0
end

function CheckOverflow(arg_332_0, arg_332_1)
	local var_332_0 = {}
	local var_332_1 = arg_332_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_332_2 = arg_332_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_332_3 = arg_332_0[DROP_TYPE_EQUIP]
	local var_332_4 = arg_332_0[DROP_TYPE_SHIP]
	local var_332_5 = getProxy(PlayerProxy):getRawData()
	local var_332_6 = false

	if arg_332_1 then
		local var_332_7 = var_332_5:OverStore(PlayerConst.ResStoreGold, var_332_1)
		local var_332_8 = var_332_5:OverStore(PlayerConst.ResStoreOil, var_332_2)

		if var_332_7 > 0 or var_332_8 > 0 then
			var_332_0.isStoreOverflow = {
				var_332_7,
				var_332_8
			}
		end
	else
		if var_332_1 > 0 and var_332_5:GoldMax(var_332_1) then
			return false, "gold"
		end

		if var_332_2 > 0 and var_332_5:OilMax(var_332_2) then
			return false, "oil"
		end
	end

	var_332_0.isExpBookOverflow = {}

	for iter_332_0, iter_332_1 in pairs(arg_332_0[DROP_TYPE_ITEM]) do
		local var_332_9 = Item.getConfigData(iter_332_0)

		if getProxy(BagProxy):getItemCountById(iter_332_0) + iter_332_1 > var_332_9.max_num then
			table.insert(var_332_0.isExpBookOverflow, iter_332_0)
		end
	end

	local var_332_10 = getProxy(EquipmentProxy):getCapacity()

	if var_332_3 > 0 and var_332_10 >= var_332_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_332_11 = getProxy(BayProxy):getShipCount()

	if var_332_4 > 0 and var_332_4 + var_332_11 > var_332_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_332_0
end

function CheckEquipLimit(arg_333_0)
	local var_333_0 = {}

	for iter_333_0, iter_333_1 in pairs(arg_333_0) do
		if iter_333_1.type == DROP_TYPE_EQUIP then
			local var_333_1 = iter_333_1:getConfig("group")

			if pg.equip_data_limit[var_333_1] then
				var_333_0[var_333_1] = defaultValue(var_333_0[var_333_1], 0) + iter_333_1.count
			end
		end
	end

	local var_333_2 = {}

	for iter_333_2, iter_333_3 in pairs(var_333_0) do
		local var_333_3 = pg.equip_data_limit[iter_333_2]
		local var_333_4 = pg.equip_data_template.get_id_list_by_group[iter_333_2]
		local var_333_5 = underscore.reduce(var_333_4, 0, function(arg_334_0, arg_334_1)
			local var_334_0 = getProxy(EquipmentProxy):getEquipmentById(arg_334_1)

			return arg_334_0 + (var_334_0 and var_334_0.count or 0) + getProxy(BayProxy):GetEquipCountInShips(arg_334_1)
		end)

		if var_333_5 + iter_333_3 > var_333_3.max then
			table.insert(var_333_2, {
				iter_333_2,
				var_333_5 + iter_333_3 - var_333_3.max
			})
		end
	end

	if #var_333_2 == 0 then
		return false
	end

	return var_333_2
end

function CheckShipExpOverflow(arg_335_0)
	local var_335_0 = getProxy(BagProxy)

	for iter_335_0, iter_335_1 in pairs(arg_335_0[DROP_TYPE_ITEM]) do
		if var_335_0:getItemCountById(iter_335_0) + iter_335_1 > Item.getConfigData(iter_335_0).max_num then
			return false
		end
	end

	return true
end

local var_0_28 = {
	[17] = "item_type17_tip2",
	tech = "techpackage_item_use_confirm",
	[16] = "item_type16_tip2",
	[11] = "equip_skin_detail_tip",
	[13] = "item_type13_tip2"
}

function RegisterDetailButton(arg_336_0, arg_336_1, arg_336_2)
	Drop.Change(arg_336_2)
	switch(arg_336_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_336_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_337_0 = Item.getConfigData(arg_336_2.id).usage_arg
				local var_337_1 = var_337_0[3]

				if Item.InTimeLimitSkinAssigned(arg_336_2.id) then
					var_337_1 = table.mergeArray(var_337_0[2], var_337_1, true)
				end

				local var_337_2 = {}

				for iter_337_0, iter_337_1 in ipairs(var_337_0[2]) do
					var_337_2[iter_337_1] = true
				end

				onButton(arg_336_0, arg_336_1, function()
					arg_336_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = NewSelectSkinLayer,
							mediator = NewSkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_336_2.id,
								selectableSkinList = underscore.map(var_337_1, function(arg_339_0)
									return SelectableSkin.New({
										id = arg_339_0,
										isTimeLimit = var_337_2[arg_339_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_336_1, true)
			else
				local var_337_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_336_2.id) and "tech" or arg_336_2:getConfig("type")

				if var_0_28[var_337_3] then
					local var_337_4 = {
						item2Row = true,
						content = i18n(var_0_28[var_337_3]),
						itemList = underscore.map(arg_336_2:getConfig("display_icon"), function(arg_340_0)
							return Drop.Create(arg_340_0)
						end)
					}

					if var_337_3 == 11 then
						onButton(arg_336_0, arg_336_1, function()
							arg_336_0:emit(BaseUI.ON_DROP_LIST_OWN, var_337_4)
						end, SFX_PANEL)
					else
						onButton(arg_336_0, arg_336_1, function()
							arg_336_0:emit(BaseUI.ON_DROP_LIST, var_337_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_336_1, tobool(var_0_28[var_337_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_336_0, arg_336_1, function()
				arg_336_0:emit(BaseUI.ON_DROP, arg_336_2)
			end, SFX_PANEL)
			setActive(arg_336_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_336_0, arg_336_1, function()
				arg_336_0:emit(BaseUI.ON_DROP, arg_336_2)
			end, SFX_PANEL)
			setActive(arg_336_1, true)
		end
	}, function()
		setActive(arg_336_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_348_0, arg_348_1, arg_348_2)
	Drop.Change(arg_348_2)
	switch(arg_348_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_349_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_348_2.id) and "tech" or arg_348_2:getConfig("type")

			if var_0_28[var_349_0] then
				local var_349_1 = {
					useDeepShow = true,
					showOwn = var_349_0 == 11,
					content = i18n(var_0_28[var_349_0]),
					itemList = underscore.map(arg_348_2:getConfig("display_icon"), function(arg_350_0)
						return Drop.Create(arg_350_0)
					end)
				}

				onButton(arg_348_0, arg_348_1, function()
					arg_348_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_349_1)
				end, SFX_PANEL)
			end

			setActive(arg_348_1, tobool(var_0_28[var_349_0]))
		end
	}, function()
		setActive(arg_348_1, false)
	end)
end

function UpdateOwnDisplay(arg_353_0, arg_353_1)
	local var_353_0, var_353_1 = arg_353_1:getOwnedCount()

	setActive(arg_353_0, var_353_1 and var_353_0 > 0)

	if var_353_1 and var_353_0 > 0 then
		setText(arg_353_0:Find("label"), i18n("word_own1"))
		setText(arg_353_0:Find("Text"), var_353_0)
	end
end

function Damp(arg_354_0, arg_354_1, arg_354_2)
	arg_354_1 = Mathf.Max(1, arg_354_1)

	local var_354_0 = Mathf.Epsilon

	if arg_354_1 < var_354_0 or var_354_0 > Mathf.Abs(arg_354_0) then
		return arg_354_0
	end

	if arg_354_2 < var_354_0 then
		return 0
	end

	local var_354_1 = -4.605170186

	return arg_354_0 * (1 - Mathf.Exp(var_354_1 * arg_354_2 / arg_354_1))
end

function checkCullResume(arg_355_0, arg_355_1)
	if arg_355_1 or not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_355_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_355_0 = arg_355_0:GetComponentsInChildren(typeof(var_0_0.UI.Graphic)):ToTable()

		for iter_355_0, iter_355_1 in ipairs(var_355_0) do
			iter_355_1:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_356_0)
	local var_356_0 = {}

	if arg_356_0 and arg_356_0 ~= "" then
		local var_356_1 = base64.dec(arg_356_0)

		var_356_0 = string.split(var_356_1, "/")
		var_356_0[5], var_356_0[6] = unpack(string.split(var_356_0[5], "\\"))

		if #var_356_0 < 6 or arg_356_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_356_0, 5), "/"),
			var_356_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_356_0 = {}
		end
	end

	for iter_356_0 = 1, 6 do
		var_356_0[iter_356_0] = var_356_0[iter_356_0] and tonumber(var_356_0[iter_356_0], 32) or 0
	end

	return var_356_0
end

function buildEquipCode(arg_357_0)
	local var_357_0 = underscore.map(arg_357_0:getAllEquipments(), function(arg_358_0)
		return ConversionBase(32, arg_358_0 and arg_358_0.id or 0)
	end)
	local var_357_1 = {
		table.concat(var_357_0, "/"),
		ConversionBase(32, checkExist(arg_357_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_357_1, "\\"))
end

function setDirectorSpeed(arg_359_0, arg_359_1)
	GetComponent(arg_359_0, typeof(TimelineSpeed)):SetTimelineSpeed(arg_359_1)
end

function setDefaultZeroMetatable(arg_360_0)
	return setmetatable(arg_360_0, {
		__index = function(arg_361_0, arg_361_1)
			if rawget(arg_361_0, arg_361_1) == nil then
				arg_361_0[arg_361_1] = 0
			end

			return arg_361_0[arg_361_1]
		end
	})
end

function checkABExist(arg_362_0)
	if EDITOR_TOOL then
		return ResourceMgr.Inst:AssetExist(arg_362_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_362_0))
	end
end

function compareNumber(arg_363_0, arg_363_1, arg_363_2)
	return switch(arg_363_1, {
		[">"] = function()
			return arg_363_0 > arg_363_2
		end,
		[">="] = function()
			return arg_363_0 >= arg_363_2
		end,
		["="] = function()
			return arg_363_0 == arg_363_2
		end,
		["<"] = function()
			return arg_363_0 < arg_363_2
		end,
		["<="] = function()
			return arg_363_0 <= arg_363_2
		end
	})
end

function ArabicToRoman(arg_369_0)
	local var_369_0 = {
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

	local function var_369_1(arg_370_0, arg_370_1)
		return select(2, arg_370_0:gsub(arg_370_1, ""))
	end

	local var_369_2 = ""

	while arg_369_0 > 0 do
		for iter_369_0, iter_369_1 in pairs(var_369_0) do
			local var_369_3 = iter_369_1[2]
			local var_369_4 = iter_369_1[1]

			while var_369_4 <= arg_369_0 do
				var_369_2 = var_369_2 .. var_369_3
				arg_369_0 = arg_369_0 - var_369_4
			end
		end
	end

	if arg_369_0 > 10000 then
		local var_369_5 = var_369_1(var_369_2, "M")

		var_369_2 = "M*" .. var_369_5 .. " " .. var_369_2
	end

	return var_369_2
end

function stringInset(arg_371_0, ...)
	for iter_371_0, iter_371_1 in ipairs({
		...
	}) do
		arg_371_0 = string.gsub(arg_371_0, "$" .. iter_371_0, iter_371_1)
	end

	return arg_371_0
end

function StringStartsWith(arg_372_0, arg_372_1)
	return string.sub(arg_372_0, 1, string.len(arg_372_1)) == arg_372_1
end

function addSubLayer(arg_373_0, arg_373_1, arg_373_2, arg_373_3, arg_373_4)
	if arg_373_2 then
		while arg_373_1.parent do
			arg_373_1 = arg_373_1.parent
		end
	end

	local var_373_0 = {
		parentContext = arg_373_1,
		context = arg_373_0,
		callback = arg_373_3
	}

	var_373_0 = arg_373_4 and table.merge(var_373_0, arg_373_4) or var_373_0

	pg.m02:sendNotification(GAME.LOAD_LAYERS, var_373_0)
end

function PackIntToString(arg_374_0, arg_374_1)
	return tostring(arg_374_0) .. "," .. tostring(arg_374_1)
end

function UnpackIntFromString(arg_375_0)
	local var_375_0, var_375_1 = string.match(arg_375_0, "(%-?%d+),(%-?%d+)")

	return tonumber(var_375_0), tonumber(var_375_1)
end

function getRandomIdxByWeights(arg_376_0)
	local var_376_0 = 0

	for iter_376_0, iter_376_1 in ipairs(arg_376_0) do
		var_376_0 = var_376_0 + iter_376_1
	end

	assert(var_376_0 ~= 0, "总权重为0")

	local var_376_1 = math.random(1, var_376_0)
	local var_376_2 = 0

	for iter_376_2, iter_376_3 in ipairs(arg_376_0) do
		var_376_2 = var_376_2 + iter_376_3

		if var_376_1 <= var_376_2 then
			return iter_376_2
		end
	end

	return #arg_376_0
end
