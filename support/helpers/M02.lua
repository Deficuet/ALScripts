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
	local var_111_0 = pg.island_set.season_pt.key_value_varchar

	return {
		name = var_111_0[1],
		icon = var_111_0[2]
	}
end

function updateIslandSeasonPt(arg_112_0, arg_112_1)
	local var_112_0 = getIslandSeasonPtInfo()

	GetImageSpriteFromAtlasAsync("island/" .. var_112_0.icon, "", findTF(arg_112_0, "icon_bg/icon"))
	setActive(findTF(arg_112_0, "icon_bg/count_bg"), arg_112_1.count > 0)
	setText(findTF(arg_112_0, "icon_bg/count_bg/count"), arg_112_1.count)
	setIslandRarityFrame(arg_112_0, arg_112_1)
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

function updateIslandWatherCollect(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_1:getConfigTable().icon
	local var_116_1 = arg_116_1:getConfigTable().name

	setText(findTF(arg_116_0, "icon_bg/count"), arg_116_1.count)
	GetImageSpriteFromAtlasAsync("island/" .. var_116_0, "", findTF(arg_116_0, "icon_bg/icon"))
	setIconName(arg_116_0, var_116_1, {})
	setIslandRarityFrame(arg_116_0, arg_116_1)
end

function updateWorldItem(arg_117_0, arg_117_1, arg_117_2)
	arg_117_2 = arg_117_2 or {}

	local var_117_0 = ItemRarity.Rarity2Print(arg_117_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_0, findTF(arg_117_0, "icon_bg"))
	setFrame(findTF(arg_117_0, "icon_bg/frame"), var_117_0)

	local var_117_1 = findTF(arg_117_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_117_1.icon or arg_117_1:getConfig("icon"), "", var_117_1)
	setIconStars(arg_117_0, false)
	setIconName(arg_117_0, arg_117_1:getConfig("name"), arg_117_2)
	setIconColorful(arg_117_0, arg_117_1:getConfig("rarity"), arg_117_2)
end

function updateWorldCollection(arg_118_0, arg_118_1, arg_118_2)
	arg_118_2 = arg_118_2 or {}

	assert(arg_118_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_118_1.id)

	local var_118_0 = arg_118_1:getDropRarity()
	local var_118_1 = ItemRarity.Rarity2Print(var_118_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_118_1, findTF(arg_118_0, "icon_bg"))
	setFrame(findTF(arg_118_0, "icon_bg/frame"), var_118_1)

	local var_118_2 = findTF(arg_118_0, "icon_bg/icon")
	local var_118_3 = WorldCollectionProxy.GetCollectionType(arg_118_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_118_3, "", var_118_2)
	setIconStars(arg_118_0, false)
	setIconName(arg_118_0, arg_118_1:getName(), arg_118_2)
	setIconColorful(arg_118_0, var_118_0, arg_118_2)
end

function updateWorldBuff(arg_119_0, arg_119_1, arg_119_2)
	arg_119_2 = arg_119_2 or {}

	local var_119_0 = pg.world_SLGbuff_data[arg_119_1]

	assert(var_119_0, "找不到大世界buff配置: " .. arg_119_1)

	local var_119_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_119_1, findTF(arg_119_0, "icon_bg"))
	setFrame(findTF(arg_119_0, "icon_bg/frame"), var_119_1)

	local var_119_2 = findTF(arg_119_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_119_0.icon, "", var_119_2)

	local var_119_3 = arg_119_0:Find("icon_bg/stars")

	if not IsNil(var_119_3) then
		setActive(var_119_3, false)
	end

	local var_119_4 = findTF(arg_119_0, "name")

	if not IsNil(var_119_4) then
		setText(var_119_4, var_119_0.name)
	end

	local var_119_5 = findTF(arg_119_0, "icon_bg/count")

	if not IsNil(var_119_5) then
		SetActive(var_119_5, false)
	end
end

function updateShip(arg_120_0, arg_120_1, arg_120_2)
	arg_120_2 = arg_120_2 or {}

	local var_120_0 = arg_120_1:rarity2bgPrint()
	local var_120_1 = arg_120_1:getPainting()

	if arg_120_2.anonymous then
		var_120_0 = "1"
		var_120_1 = "unknown"
	end

	if arg_120_2.unknown_small then
		var_120_1 = "unknown_small"
	end

	local var_120_2 = findTF(arg_120_0, "icon_bg/new")

	if var_120_2 then
		if arg_120_2.isSkin then
			setActive(var_120_2, not arg_120_2.isTimeLimit and arg_120_2.isNew)
		else
			setActive(var_120_2, arg_120_1.virgin)
		end
	end

	local var_120_3 = findTF(arg_120_0, "icon_bg/timelimit")

	if var_120_3 then
		setActive(var_120_3, arg_120_2.isTimeLimit)
	end

	local var_120_4 = findTF(arg_120_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_120_2.isSkin and "_skin" or var_120_0), var_120_4)

	local var_120_5 = findTF(arg_120_0, "icon_bg/frame")
	local var_120_6

	if arg_120_1.isNpc then
		var_120_6 = "frame_npc"
	elseif arg_120_1:ShowPropose() then
		var_120_6 = "frame_prop"

		if arg_120_1:isMetaShip() then
			var_120_6 = var_120_6 .. "_meta"
		end
	elseif arg_120_2.isSkin then
		var_120_6 = "frame_skin"
	end

	setFrame(var_120_5, var_120_0, var_120_6)

	if arg_120_2.gray then
		setGray(var_120_4, true, true)
	end

	local var_120_7 = findTF(arg_120_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_120_2.Q and "QIcon/" or "SquareIcon/") .. var_120_1, "", var_120_7)

	local var_120_8 = findTF(arg_120_0, "icon_bg/lv")

	if var_120_8 then
		setActive(var_120_8, not arg_120_1.isNpc)

		if not arg_120_1.isNpc then
			local var_120_9 = findTF(var_120_8, "Text")

			if var_120_9 and arg_120_1.level then
				setText(var_120_9, arg_120_1.level)
			end
		end
	end

	local var_120_10 = findTF(arg_120_0, "ship_type")

	if var_120_10 then
		setActive(var_120_10, true)
		setImageSprite(var_120_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_120_1:getShipType())))
	end

	local var_120_11 = var_120_4:Find("npc")

	if not IsNil(var_120_11) then
		if var_120_2 and go(var_120_2).activeSelf then
			setActive(var_120_11, false)
		else
			setActive(var_120_11, arg_120_1:isActivityNpc())
		end
	end

	local var_120_12 = arg_120_0:Find("group_locked")

	if var_120_12 then
		setActive(var_120_12, not arg_120_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_120_1.groupId))
	end

	setIconStars(arg_120_0, arg_120_2.initStar, arg_120_1:getStar())
	setIconName(arg_120_0, arg_120_2.isSkin and arg_120_1:GetSkinConfig().name or arg_120_1:getName(), arg_120_2)
	setIconColorful(arg_120_0, arg_120_2.isSkin and ItemRarity.Gold or arg_120_1:getRarity() - 1, arg_120_2)
end

function updateCommander(arg_121_0, arg_121_1, arg_121_2)
	arg_121_2 = arg_121_2 or {}

	local var_121_0 = arg_121_1:getDropRarity()
	local var_121_1 = ItemRarity.Rarity2Print(var_121_0)
	local var_121_2 = arg_121_1:getConfig("painting")

	if arg_121_2.anonymous then
		var_121_1 = 1
		var_121_2 = "unknown"
	end

	local var_121_3 = findTF(arg_121_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_121_1, var_121_3)

	local var_121_4 = findTF(arg_121_0, "icon_bg/frame")

	setFrame(var_121_4, var_121_1)

	if arg_121_2.gray then
		setGray(var_121_3, true, true)
	end

	local var_121_5 = findTF(arg_121_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_121_2, "", var_121_5)
	setIconStars(arg_121_0, arg_121_2.initStar, 0)
	setIconName(arg_121_0, arg_121_1:getName(), arg_121_2)
end

function updateStrategy(arg_122_0, arg_122_1, arg_122_2)
	arg_122_2 = arg_122_2 or {}

	local var_122_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_122_0, findTF(arg_122_0, "icon_bg"))
	setFrame(findTF(arg_122_0, "icon_bg/frame"), var_122_0)

	local var_122_1 = findTF(arg_122_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_122_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_122_1:getIcon(), "", var_122_1)
	setIconStars(arg_122_0, false)
	setIconName(arg_122_0, arg_122_1:getName(), arg_122_2)
	setIconColorful(arg_122_0, ItemRarity.Gray, arg_122_2)
end

function updateFurniture(arg_123_0, arg_123_1, arg_123_2)
	arg_123_2 = arg_123_2 or {}

	local var_123_0 = arg_123_1:getDropRarity()
	local var_123_1 = ItemRarity.Rarity2Print(var_123_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_123_1, findTF(arg_123_0, "icon_bg"))
	setFrame(findTF(arg_123_0, "icon_bg/frame"), var_123_1)

	local var_123_2 = findTF(arg_123_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_123_1:getIcon(), "", var_123_2)
	setIconStars(arg_123_0, false)
	setIconName(arg_123_0, arg_123_1:getName(), arg_123_2)
	setIconColorful(arg_123_0, var_123_0, arg_123_2)
end

function updateSpWeapon(arg_124_0, arg_124_1, arg_124_2)
	arg_124_2 = arg_124_2 or {}

	assert(arg_124_1, "spWeaponVO can not be nil.")
	assert(isa(arg_124_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_124_0 = ItemRarity.Rarity2Print(arg_124_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_124_0, findTF(arg_124_0, "icon_bg"))
	setFrame(findTF(arg_124_0, "icon_bg/frame"), var_124_0)

	local var_124_1 = findTF(arg_124_0, "icon_bg/icon")

	var_0_4(var_124_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_124_1:GetIconPath(), "", var_124_1)
	setIconStars(arg_124_0, true, arg_124_1:GetRarity())
	var_0_7(arg_124_0, arg_124_1:GetLevel() - 1)
	setIconName(arg_124_0, arg_124_1:GetName(), arg_124_2)
	setIconCount(arg_124_0, arg_124_1.count)
	setIconColorful(arg_124_0, arg_124_1:GetRarity(), arg_124_2)
end

function UpdateSpWeaponSlot(arg_125_0, arg_125_1, arg_125_2)
	local var_125_0 = ItemRarity.Rarity2Print(arg_125_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_125_0, findTF(arg_125_0, "Icon/Mask/icon_bg"))

	local var_125_1 = findTF(arg_125_0, "Icon/Mask/icon_bg/icon")

	arg_125_2 = arg_125_2 or {
		16,
		16,
		16,
		16
	}

	var_0_4(var_125_1, arg_125_2)
	GetImageSpriteFromAtlasAsync(arg_125_1:GetIconPath(), "", var_125_1)

	local var_125_2 = arg_125_1:GetLevel() - 1
	local var_125_3 = findTF(arg_125_0, "Icon/LV")

	setActive(var_125_3, var_125_2 > 0)
	setText(findTF(var_125_3, "Text"), var_125_2)
end

function updateDorm3dIcon(arg_126_0, arg_126_1)
	local var_126_0 = arg_126_1:getDropRarityDorm()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_126_0), arg_126_0)

	local var_126_1 = arg_126_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_126_1:getIcon(), "", var_126_1)
	setText(arg_126_0:Find("count/Text"), "x" .. arg_126_1.count)
	setText(arg_126_0:Find("name/Text"), arg_126_1:getName())
end

function setLoveLetterMedal(arg_127_0, arg_127_1, arg_127_2)
	local var_127_0

	seriesAsync({
		function(arg_128_0)
			GetPrefabFromAtlasAsync(arg_127_1:GetPrefabName(), arg_127_0, function(arg_129_0)
				var_127_0 = arg_129_0.transform

				eachChild(arg_127_0, function(arg_130_0, arg_130_1)
					if arg_130_0.name ~= arg_129_0.name then
						returnLoveLetterMedal(arg_130_0)
					end
				end)
				arg_128_0()
			end)
		end
	}, function()
		local var_131_0 = arg_127_1:GetPainting()

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_131_0, "", var_127_0:Find("mask/icon"))
		setText(var_127_0:Find("front/mark/Text"), arg_127_1:GetDisplayLevelMark())
		setActive(var_127_0:Find("pick_up"), arg_127_2 and arg_127_2.showPickUp)
	end)
end

function returnLoveLetterMedal(arg_132_0)
	if IsNil(arg_132_0) then
		return
	end

	local var_132_0 = string.gsub(arg_132_0.name, "%(Clone%)", "")

	pg.PoolMgr.GetInstance():ReturnPrefab("lovelettermedal/" .. string.lower(var_132_0), "", arg_132_0.gameObject)
end

local var_0_8

function findCullAndClipWorldRect(arg_133_0)
	if #arg_133_0 == 0 then
		return false
	end

	local var_133_0 = arg_133_0[1].canvasRect

	for iter_133_0 = 1, #arg_133_0 do
		var_133_0 = rectIntersect(var_133_0, arg_133_0[iter_133_0].canvasRect)
	end

	if var_133_0.width <= 0 or var_133_0.height <= 0 then
		return false
	end

	var_0_8 = var_0_8 or GameObject.Find("UICamera/Canvas").transform

	local var_133_1 = var_0_8:TransformPoint(Vector3(var_133_0.x, var_133_0.y, 0))
	local var_133_2 = var_0_8:TransformPoint(Vector3(var_133_0.x + var_133_0.width, var_133_0.y + var_133_0.height, 0))

	return true, Vector4(var_133_1.x, var_133_1.y, var_133_2.x, var_133_2.y)
end

function rectIntersect(arg_134_0, arg_134_1)
	local var_134_0 = math.max(arg_134_0.x, arg_134_1.x)
	local var_134_1 = math.min(arg_134_0.x + arg_134_0.width, arg_134_1.x + arg_134_1.width)
	local var_134_2 = math.max(arg_134_0.y, arg_134_1.y)
	local var_134_3 = math.min(arg_134_0.y + arg_134_0.height, arg_134_1.y + arg_134_1.height)

	if var_134_0 <= var_134_1 and var_134_2 <= var_134_3 then
		return var_0_0.Rect.New(var_134_0, var_134_2, var_134_1 - var_134_0, var_134_3 - var_134_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_135_0)
	local var_135_0 = {}

	for iter_135_0, iter_135_1 in ipairs(arg_135_0) do
		local var_135_1 = Drop.Create(iter_135_1)

		var_135_1.count = var_135_1.count or 1

		if var_135_1.type == DROP_TYPE_EMOJI then
			table.insert(var_135_0, var_135_1:getName())
		else
			table.insert(var_135_0, var_135_1:getName() .. "x" .. var_135_1.count)
		end
	end

	return table.concat(var_135_0, "、")
end

function updateDrop(arg_136_0, arg_136_1, arg_136_2)
	Drop.Change(arg_136_1)

	arg_136_2 = arg_136_2 or {}

	local var_136_0 = {
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
	local var_136_1

	for iter_136_0, iter_136_1 in ipairs(var_136_0) do
		local var_136_2 = arg_136_0:Find(iter_136_1[1])

		if arg_136_1.type ~= iter_136_1[2] and not IsNil(var_136_2) then
			setActive(var_136_2, false)
		end
	end

	if not IsNil(arg_136_0:Find("icon_bg/frame")) then
		arg_136_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

		setIconColorful(arg_136_0, arg_136_1:getDropRarity(), arg_136_2, {
			[ItemRarity.Gold] = {
				name = "Item_duang5",
				active = function(arg_137_0, arg_137_1)
					return arg_137_1.fromAwardLayer and arg_137_0 >= ItemRarity.Gold
				end
			}
		})
		var_0_4(findTF(arg_136_0, "icon_bg/icon"), {
			2,
			2,
			2,
			2
		})
	end

	arg_136_1:UpdateDropTpl(arg_136_0, arg_136_2)
	setIconCount(arg_136_0, arg_136_2.count or arg_136_1:getCount())
end

function updateCustomDrop(arg_138_0, arg_138_1, arg_138_2)
	Drop.Change(arg_138_1)

	arg_138_2 = arg_138_2 or {}

	arg_138_1:UpdateCustomDropTpl(arg_138_0, arg_138_2)
end

function updateBuff(arg_139_0, arg_139_1, arg_139_2)
	arg_139_2 = arg_139_2 or {}

	local var_139_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_139_0, findTF(arg_139_0, "icon_bg"))

	local var_139_1 = pg.benefit_buff_template[arg_139_1]

	setFrame(findTF(arg_139_0, "icon_bg/frame"), var_139_0)
	setText(findTF(arg_139_0, "icon_bg/count"), 1)

	local var_139_2 = findTF(arg_139_0, "icon_bg/icon")
	local var_139_3 = var_139_1.icon

	GetImageSpriteFromAtlasAsync(var_139_3, "", var_139_2)
	setIconStars(arg_139_0, false)
	setIconName(arg_139_0, var_139_1.name, arg_139_2)
	setIconColorful(arg_139_0, ItemRarity.Gold, arg_139_2)
end

function updateAttire(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	local var_140_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_140_0, findTF(arg_140_0, "icon_bg"))
	setFrame(findTF(arg_140_0, "icon_bg/frame"), var_140_0)

	local var_140_1 = findTF(arg_140_0, "icon_bg/icon")
	local var_140_2

	if arg_140_1 == AttireConst.TYPE_CHAT_FRAME then
		var_140_2 = "chat_frame"
	elseif arg_140_1 == AttireConst.TYPE_ICON_FRAME then
		var_140_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_140_2, "", var_140_1)
	setIconName(arg_140_0, arg_140_2.name, arg_140_3)
end

function updateAttireCombatUI(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
	local var_141_0 = arg_141_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_141_0, findTF(arg_141_0, "icon_bg"))
	setFrame(findTF(arg_141_0, "icon_bg/frame"), var_141_0, "frame_battle_ui")

	local var_141_1 = findTF(arg_141_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_141_2.display_icon, "", var_141_1)
	setIconName(arg_141_0, arg_141_2.name, arg_141_3)
end

function updateActivityMedal(arg_142_0, arg_142_1, arg_142_2)
	local var_142_0 = ItemRarity.Rarity2Print(arg_142_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_142_0, findTF(arg_142_0, "icon_bg"))
	setFrame(findTF(arg_142_0, "icon_bg/frame"), var_142_0)

	local var_142_1 = findTF(arg_142_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_142_1.icon, "", var_142_1)
	setIconName(arg_142_0, arg_142_1.name, arg_142_2)
end

function updateCover(arg_143_0, arg_143_1, arg_143_2)
	local var_143_0 = arg_143_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_143_0, findTF(arg_143_0, "icon_bg"))
	setFrame(findTF(arg_143_0, "icon_bg/frame"), var_143_0)

	local var_143_1 = findTF(arg_143_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_143_1:getIcon(), "", var_143_1)
	setIconName(arg_143_0, arg_143_1:getName(), arg_143_2)
	setIconStars(arg_143_0, false)
end

function updateEmoji(arg_144_0, arg_144_1, arg_144_2)
	local var_144_0 = findTF(arg_144_0, "icon_bg/icon")
	local var_144_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_144_1, "", var_144_0)

	local var_144_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_144_2, findTF(arg_144_0, "icon_bg"))
	setFrame(findTF(arg_144_0, "icon_bg/frame"), var_144_2)
	setIconName(arg_144_0, arg_144_1.name, arg_144_2)
end

function updateEquipmentSkin(arg_145_0, arg_145_1, arg_145_2)
	arg_145_2 = arg_145_2 or {}

	local var_145_0 = EquipmentRarity.Rarity2Print(arg_145_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_145_0, findTF(arg_145_0, "icon_bg"))
	setFrame(findTF(arg_145_0, "icon_bg/frame"), var_145_0, "frame_skin")

	local var_145_1 = findTF(arg_145_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_145_1.icon, "", var_145_1)
	setIconStars(arg_145_0, false)
	setIconName(arg_145_0, arg_145_1.name, arg_145_2)
	setIconCount(arg_145_0, arg_145_1.count)
	setIconColorful(arg_145_0, arg_145_1.rarity - 1, arg_145_2)
end

function NoPosMsgBox(arg_146_0, arg_146_1, arg_146_2, arg_146_3)
	local var_146_0
	local var_146_1 = {}

	if arg_146_1 then
		table.insert(var_146_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_146_1
		})
	end

	if arg_146_2 then
		table.insert(var_146_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_146_2
		})
	end

	if arg_146_3 then
		table.insert(var_146_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_146_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_146_0,
		custom = var_146_1
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_147_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_147_0 and var_147_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_147_0
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
		local var_148_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_148_0 and var_148_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_148_0
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
		onClick = function(arg_151_0, arg_151_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_151_0.id,
				shipVOs = arg_151_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_152_0, arg_152_1, arg_152_2)
	if arg_152_2 then
		local var_152_0 = ""

		for iter_152_0, iter_152_1 in ipairs(arg_152_2) do
			local var_152_1 = Item.getConfigData(iter_152_1[1])

			var_152_0 = var_152_0 .. i18n(iter_152_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_152_1.name, iter_152_1[2])

			if iter_152_0 < #arg_152_2 then
				var_152_0 = var_152_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_152_0 ~= "" then
			arg_152_0 = arg_152_0 .. "\n" .. i18n("text_noRes_tip", var_152_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_152_0,
		onYes = function()
			gotoChargeScene(arg_152_1, arg_152_2)
		end
	})
end

function shoppingBatch(arg_154_0, arg_154_1, arg_154_2, arg_154_3, arg_154_4)
	local var_154_0 = pg.shop_template[arg_154_0]

	assert(var_154_0, "shop_template中找不到商品id：" .. arg_154_0)

	local var_154_1 = getProxy(PlayerProxy):getData()[id2res(var_154_0.resource_type)]
	local var_154_2 = arg_154_1.price or var_154_0.resource_num
	local var_154_3 = math.floor(var_154_1 / var_154_2)

	var_154_3 = var_154_3 <= 0 and 1 or var_154_3
	var_154_3 = arg_154_2 ~= nil and arg_154_2 < var_154_3 and arg_154_2 or var_154_3

	local var_154_4 = true
	local var_154_5 = 1

	if var_154_0 ~= nil and arg_154_1.id then
		print(var_154_3 * var_154_0.num, "--", var_154_3)
		assert(Item.getConfigData(arg_154_1.id), "item config should be existence")

		local var_154_6 = Item.New({
			id = arg_154_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_154_1.id
			},
			addNum = var_154_0.num,
			maxNum = var_154_3 * var_154_0.num,
			defaultNum = var_154_0.num,
			numUpdate = function(arg_155_0, arg_155_1)
				var_154_5 = math.floor(arg_155_1 / var_154_0.num)

				local var_155_0 = var_154_5 * var_154_2

				if var_155_0 > var_154_1 then
					setText(arg_155_0, i18n(arg_154_3, var_155_0, arg_155_1, COLOR_RED, var_154_6))

					var_154_4 = false
				else
					setText(arg_155_0, i18n(arg_154_3, var_155_0, arg_155_1, COLOR_GREEN, var_154_6))

					var_154_4 = true
				end
			end,
			onYes = function()
				if var_154_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_154_0,
						count = var_154_5
					})
				elseif arg_154_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_154_4))
					pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_157_0, arg_157_1, arg_157_2, arg_157_3, arg_157_4)
	local var_157_0 = pg.shop_template[arg_157_0]

	assert(var_157_0, "shop_template中找不到商品id：" .. arg_157_0)

	local var_157_1 = getProxy(PlayerProxy):getData()[id2res(var_157_0.resource_type)]
	local var_157_2 = arg_157_1.price or var_157_0.resource_num
	local var_157_3 = math.floor(var_157_1 / var_157_2)

	var_157_3 = var_157_3 <= 0 and 1 or var_157_3
	var_157_3 = arg_157_2 ~= nil and arg_157_2 < var_157_3 and arg_157_2 or var_157_3

	local var_157_4 = true
	local var_157_5 = 1

	if var_157_0 ~= nil and arg_157_1.id then
		print(var_157_3 * var_157_0.num, "--", var_157_3)
		assert(Item.getConfigData(arg_157_1.id), "item config should be existence")

		local var_157_6 = Item.New({
			id = arg_157_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_157_1.id
			}),
			price = var_157_2,
			addNum = var_157_0.num,
			maxNum = var_157_3 * var_157_0.num,
			defaultNum = var_157_0.num,
			numUpdate = function(arg_158_0, arg_158_1)
				var_157_5 = math.floor(arg_158_1 / var_157_0.num)

				local var_158_0 = var_157_5 * var_157_2

				if var_158_0 > var_157_1 then
					setTextInNewStyleBox(arg_158_0, i18n(arg_157_3, var_158_0, arg_158_1, COLOR_RED, var_157_6))

					var_157_4 = false
				else
					setTextInNewStyleBox(arg_158_0, i18n(arg_157_3, var_158_0, arg_158_1, "#238C40FF", var_157_6))

					var_157_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_157_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_157_0,
								count = var_157_5
							})
						elseif arg_157_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_157_4))
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

function gotoChargeScene(arg_160_0, arg_160_1)
	local var_160_0 = getProxy(ContextProxy)
	local var_160_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_160_1.mediator, NewShopMainMediator) then
		var_160_1.mediator:getViewComponent():switchSubViewByTogger(arg_160_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_160_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_160_1
		})
	end

	pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
end

function clearDrop(arg_161_0)
	local var_161_0 = findTF(arg_161_0, "icon_bg")
	local var_161_1 = findTF(arg_161_0, "icon_bg/frame")
	local var_161_2 = findTF(arg_161_0, "icon_bg/icon")
	local var_161_3 = findTF(arg_161_0, "icon_bg/icon/icon")

	clearImageSprite(var_161_0)
	clearImageSprite(var_161_1)
	clearImageSprite(var_161_2)

	if var_161_3 then
		clearImageSprite(var_161_3)
	end
end

local var_0_9 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_162_0, arg_162_1, arg_162_2, arg_162_3)
	local var_162_0 = findTF(arg_162_0, "skill")
	local var_162_1 = findTF(arg_162_0, "lock")
	local var_162_2 = findTF(arg_162_0, "unknown")

	if arg_162_1 then
		setActive(var_162_0, true)
		setActive(var_162_2, false)
		setActive(var_162_1, not arg_162_2)
		LoadImageSpriteAsync("skillicon/" .. arg_162_1.icon, findTF(var_162_0, "icon"))

		local var_162_3 = arg_162_1.color or "blue"

		setText(findTF(var_162_0, "name"), shortenString(getSkillName(arg_162_1.id), arg_162_3 or 8))

		local var_162_4 = findTF(var_162_0, "level")

		setText(var_162_4, "LEVEL: " .. (arg_162_2 and arg_162_2.level or "??"))
		setTextColor(var_162_4, var_0_9[var_162_3])
	else
		setActive(var_162_0, false)
		setActive(var_162_2, true)
		setActive(var_162_1, false)
	end
end

local var_0_10 = true

function onBackButton(arg_163_0, arg_163_1, arg_163_2, arg_163_3)
	local var_163_0 = GetOrAddComponent(arg_163_1, "UILongPressTrigger")

	assert(arg_163_2, "callback should exist")

	var_163_0.longPressThreshold = defaultValue(arg_163_3, 1)

	local function var_163_1(arg_164_0)
		return function()
			if var_0_10 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_165_0, var_165_1 = arg_163_2()

			if var_165_0 then
				arg_164_0(var_165_1)
			end
		end
	end

	local var_163_2 = var_163_0.onReleased

	pg.DelegateInfo.Add(arg_163_0, var_163_2)
	var_163_2:RemoveAllListeners()
	var_163_2:AddListener(var_163_1(function(arg_166_0)
		arg_166_0:emit(BaseUI.ON_BACK)
	end))

	local var_163_3 = var_163_0.onLongPressed

	pg.DelegateInfo.Add(arg_163_0, var_163_3)
	var_163_3:RemoveAllListeners()
	var_163_3:AddListener(var_163_1(function(arg_167_0)
		arg_167_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_170_0)
	local var_170_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_170_1, var_170_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_170_0)

	return var_170_1 * 86400 + (var_170_2 + arg_170_0) * 3600
end

function GetPerceptualSize(arg_171_0, arg_171_1)
	local function var_171_0(arg_172_0)
		if not arg_172_0 then
			return 0, 1
		elseif arg_172_0 > 240 then
			return 4, 1
		elseif arg_172_0 > 225 then
			return 3, 1
		elseif arg_172_0 > 192 then
			return 2, 1
		elseif arg_172_0 < 126 then
			return 1, arg_171_1 or 0.5
		else
			return 1, 1
		end
	end

	if type(arg_171_0) == "number" then
		return var_171_0(arg_171_0)
	end

	local var_171_1 = 1
	local var_171_2 = 0
	local var_171_3 = 0
	local var_171_4 = #arg_171_0

	while var_171_1 <= var_171_4 do
		local var_171_5 = string.byte(arg_171_0, var_171_1)
		local var_171_6, var_171_7 = var_171_0(var_171_5)

		var_171_1 = var_171_1 + var_171_6
		var_171_2 = var_171_2 + var_171_7
	end

	return var_171_2
end

function shortenString(arg_173_0, arg_173_1, arg_173_2)
	local var_173_0 = 1
	local var_173_1 = 0
	local var_173_2 = 0
	local var_173_3 = #arg_173_0

	while var_173_0 <= var_173_3 do
		local var_173_4 = string.byte(arg_173_0, var_173_0)
		local var_173_5, var_173_6 = GetPerceptualSize(var_173_4, arg_173_2)

		var_173_0 = var_173_0 + var_173_5
		var_173_1 = var_173_1 + var_173_6

		if arg_173_1 <= math.ceil(var_173_1) then
			var_173_2 = var_173_0

			break
		end
	end

	if var_173_2 == 0 or var_173_3 < var_173_2 then
		return arg_173_0
	end

	return string.sub(arg_173_0, 1, var_173_2 - 1) .. ".."
end

function shouldShortenString(arg_174_0, arg_174_1)
	local var_174_0 = 1
	local var_174_1 = 0
	local var_174_2 = 0
	local var_174_3 = #arg_174_0

	while var_174_0 <= var_174_3 do
		local var_174_4 = string.byte(arg_174_0, var_174_0)
		local var_174_5, var_174_6 = GetPerceptualSize(var_174_4)

		var_174_0 = var_174_0 + var_174_5
		var_174_1 = var_174_1 + var_174_6

		if arg_174_1 <= math.ceil(var_174_1) then
			var_174_2 = var_174_0

			break
		end
	end

	if var_174_2 == 0 or var_174_3 < var_174_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_175_0, arg_175_1, arg_175_2, arg_175_3)
	local var_175_0 = true
	local var_175_1, var_175_2 = utf8_to_unicode(arg_175_0)
	local var_175_3 = filterEgyUnicode(filterSpecChars(arg_175_0))
	local var_175_4 = wordVer(arg_175_0)

	if not checkSpaceValid(arg_175_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_175_3[1]))

		var_175_0 = false
	elseif var_175_4 > 0 or var_175_3 ~= arg_175_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_175_3[4]))

		var_175_0 = false
	elseif var_175_2 < arg_175_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_175_3[2]))

		var_175_0 = false
	elseif arg_175_2 < var_175_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_175_3[3]))

		var_175_0 = false
	end

	return var_175_0
end

function checkSpaceValid(arg_176_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_176_0 = string.gsub(arg_176_0, " ", "")

	return arg_176_0 == string.gsub(var_176_0, "　", "")
end

function filterSpecChars(arg_177_0)
	local var_177_0 = {}
	local var_177_1 = 0
	local var_177_2 = 0
	local var_177_3 = 0
	local var_177_4 = 1

	while var_177_4 <= #arg_177_0 do
		local var_177_5 = string.byte(arg_177_0, var_177_4)

		if not var_177_5 then
			break
		end

		if var_177_5 >= 48 and var_177_5 <= 57 or var_177_5 >= 65 and var_177_5 <= 90 or var_177_5 == 95 or var_177_5 >= 97 and var_177_5 <= 122 then
			table.insert(var_177_0, string.char(var_177_5))
		elseif var_177_5 >= 228 and var_177_5 <= 233 then
			local var_177_6 = string.byte(arg_177_0, var_177_4 + 1)
			local var_177_7 = string.byte(arg_177_0, var_177_4 + 2)

			if var_177_6 and var_177_7 and var_177_6 >= 128 and var_177_6 <= 191 and var_177_7 >= 128 and var_177_7 <= 191 then
				var_177_4 = var_177_4 + 2

				table.insert(var_177_0, string.char(var_177_5, var_177_6, var_177_7))

				var_177_1 = var_177_1 + 1
			end
		elseif var_177_5 == 45 or var_177_5 == 40 or var_177_5 == 41 then
			table.insert(var_177_0, string.char(var_177_5))
		elseif var_177_5 == 194 then
			local var_177_8 = string.byte(arg_177_0, var_177_4 + 1)

			if var_177_8 == 183 then
				var_177_4 = var_177_4 + 1

				table.insert(var_177_0, string.char(var_177_5, var_177_8))

				var_177_1 = var_177_1 + 1
			end
		elseif var_177_5 == 239 then
			local var_177_9 = string.byte(arg_177_0, var_177_4 + 1)
			local var_177_10 = string.byte(arg_177_0, var_177_4 + 2)

			if var_177_9 == 188 and (var_177_10 == 136 or var_177_10 == 137) then
				var_177_4 = var_177_4 + 2

				table.insert(var_177_0, string.char(var_177_5, var_177_9, var_177_10))

				var_177_1 = var_177_1 + 1
			end
		elseif var_177_5 == 206 or var_177_5 == 207 then
			local var_177_11 = string.byte(arg_177_0, var_177_4 + 1)

			if var_177_5 == 206 and var_177_11 >= 177 or var_177_5 == 207 and var_177_11 <= 134 then
				var_177_4 = var_177_4 + 1

				table.insert(var_177_0, string.char(var_177_5, var_177_11))

				var_177_1 = var_177_1 + 1
			end
		elseif var_177_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_177_12 = string.byte(arg_177_0, var_177_4 + 1)
			local var_177_13 = string.byte(arg_177_0, var_177_4 + 2)

			if var_177_12 and var_177_13 and var_177_12 > 128 and var_177_12 <= 191 and var_177_13 >= 128 and var_177_13 <= 191 then
				var_177_4 = var_177_4 + 2

				table.insert(var_177_0, string.char(var_177_5, var_177_12, var_177_13))

				var_177_2 = var_177_2 + 1
			end
		elseif var_177_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_177_14 = string.byte(arg_177_0, var_177_4 + 1)
			local var_177_15 = string.byte(arg_177_0, var_177_4 + 2)

			if var_177_14 and var_177_15 and var_177_14 >= 128 and var_177_14 <= 191 and var_177_15 >= 128 and var_177_15 <= 191 then
				var_177_4 = var_177_4 + 2

				table.insert(var_177_0, string.char(var_177_5, var_177_14, var_177_15))

				var_177_3 = var_177_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_177_4 ~= 1 and var_177_5 == 32 and string.byte(arg_177_0, var_177_4 + 1) ~= 32 then
				table.insert(var_177_0, string.char(var_177_5))
			end

			if var_177_5 >= 192 and var_177_5 <= 223 then
				local var_177_16 = string.byte(arg_177_0, var_177_4 + 1)

				var_177_4 = var_177_4 + 1

				if var_177_5 == 194 and var_177_16 and var_177_16 >= 128 then
					table.insert(var_177_0, string.char(var_177_5, var_177_16))
				elseif var_177_5 == 195 and var_177_16 and var_177_16 <= 191 then
					table.insert(var_177_0, string.char(var_177_5, var_177_16))
				end
			end
		end

		var_177_4 = var_177_4 + 1
	end

	return table.concat(var_177_0), var_177_1 + var_177_2 + var_177_3
end

function filterEgyUnicode(arg_178_0)
	arg_178_0 = string.gsub(arg_178_0, "�[�-�][�-�]", "")
	arg_178_0 = string.gsub(arg_178_0, "�[�-�]", "")

	return arg_178_0
end

function shiftPanel(arg_179_0, arg_179_1, arg_179_2, arg_179_3, arg_179_4, arg_179_5, arg_179_6, arg_179_7, arg_179_8)
	arg_179_3 = arg_179_3 or 0.2

	if arg_179_5 then
		LeanTween.cancel(go(arg_179_0))
	end

	local var_179_0 = rtf(arg_179_0)

	arg_179_1 = arg_179_1 or var_179_0.anchoredPosition.x
	arg_179_2 = arg_179_2 or var_179_0.anchoredPosition.y

	local var_179_1 = LeanTween.move(var_179_0, Vector3(arg_179_1, arg_179_2, 0), arg_179_3)

	arg_179_7 = arg_179_7 or LeanTweenType.easeInOutSine

	var_179_1:setEase(arg_179_7)

	if arg_179_4 then
		var_179_1:setDelay(arg_179_4)
	end

	if arg_179_6 then
		GetOrAddComponent(arg_179_0, "CanvasGroup").blocksRaycasts = false
	end

	var_179_1:setOnComplete(System.Action(function()
		if arg_179_8 then
			arg_179_8()
		end

		if arg_179_6 then
			GetOrAddComponent(arg_179_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_179_1
end

function TweenValue(arg_181_0, arg_181_1, arg_181_2, arg_181_3, arg_181_4, arg_181_5, arg_181_6, arg_181_7)
	local var_181_0 = LeanTween.value(go(arg_181_0), arg_181_1, arg_181_2, arg_181_3):setOnUpdate(System.Action_float(function(arg_182_0)
		if arg_181_5 then
			arg_181_5(arg_182_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_181_6 then
			arg_181_6()
		end
	end)):setDelay(arg_181_4 or 0)

	if arg_181_7 and arg_181_7 > 0 then
		var_181_0:setRepeat(arg_181_7)
	end

	return var_181_0
end

function rotateAni(arg_184_0, arg_184_1, arg_184_2)
	return LeanTween.rotate(rtf(arg_184_0), 360 * arg_184_1, arg_184_2):setLoopClamp()
end

function blinkAni(arg_185_0, arg_185_1, arg_185_2, arg_185_3)
	return LeanTween.alpha(rtf(arg_185_0), arg_185_3 or 0, arg_185_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_185_2 or 0)
end

function scaleAni(arg_186_0, arg_186_1, arg_186_2, arg_186_3)
	return LeanTween.scale(rtf(arg_186_0), arg_186_3 or 0, arg_186_1):setLoopPingPong(arg_186_2 or 0)
end

function floatAni(arg_187_0, arg_187_1, arg_187_2, arg_187_3)
	local var_187_0 = arg_187_0.localPosition.y + arg_187_1

	return LeanTween.moveY(rtf(arg_187_0), var_187_0, arg_187_2):setLoopPingPong(arg_187_3 or 0)
end

local var_0_11 = tostring

function tostring(arg_188_0)
	if arg_188_0 == nil then
		return "nil"
	end

	local var_188_0 = var_0_11(arg_188_0)

	if var_188_0 == nil then
		if type(arg_188_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_188_0
end

function wordVer(arg_189_0, arg_189_1)
	if arg_189_0.match(arg_189_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_189_0
	end

	arg_189_1 = arg_189_1 or {}

	local var_189_0 = filterEgyUnicode(arg_189_0)

	if #var_189_0 ~= #arg_189_0 then
		if arg_189_1.isReplace then
			arg_189_0 = var_189_0
		else
			return 1
		end
	end

	local var_189_1 = wordSplit(arg_189_0)
	local var_189_2 = pg.word_template
	local var_189_3 = pg.word_legal_template

	arg_189_1.isReplace = arg_189_1.isReplace or false
	arg_189_1.replaceWord = arg_189_1.replaceWord or "*"

	local var_189_4 = #var_189_1
	local var_189_5 = 1
	local var_189_6 = ""
	local var_189_7 = 0

	while var_189_5 <= var_189_4 do
		local var_189_8, var_189_9, var_189_10 = wordLegalMatch(var_189_1, var_189_3, var_189_5)

		if var_189_8 then
			var_189_5 = var_189_9
			var_189_6 = var_189_6 .. var_189_10
		else
			local var_189_11, var_189_12, var_189_13 = wordVerMatch(var_189_1, var_189_2, arg_189_1, var_189_5, "", false, var_189_5, "")

			if var_189_11 then
				var_189_5 = var_189_12
				var_189_7 = var_189_7 + 1

				if arg_189_1.isReplace then
					var_189_6 = var_189_6 .. var_189_13
				end
			else
				if arg_189_1.isReplace then
					var_189_6 = var_189_6 .. var_189_1[var_189_5]
				end

				var_189_5 = var_189_5 + 1
			end
		end
	end

	if arg_189_1.isReplace then
		return var_189_7, var_189_6
	else
		return var_189_7
	end
end

function wordLegalMatch(arg_190_0, arg_190_1, arg_190_2, arg_190_3, arg_190_4)
	if arg_190_2 > #arg_190_0 then
		return arg_190_3, arg_190_2, arg_190_4
	end

	local var_190_0 = arg_190_0[arg_190_2]
	local var_190_1 = arg_190_1[var_190_0]

	arg_190_4 = arg_190_4 == nil and "" or arg_190_4

	if var_190_1 then
		if var_190_1.this then
			return wordLegalMatch(arg_190_0, var_190_1, arg_190_2 + 1, true, arg_190_4 .. var_190_0)
		else
			return wordLegalMatch(arg_190_0, var_190_1, arg_190_2 + 1, false, arg_190_4 .. var_190_0)
		end
	else
		return arg_190_3, arg_190_2, arg_190_4
	end
end

local var_0_12 = string.byte("a")
local var_0_13 = string.byte("z")
local var_0_14 = string.byte("A")
local var_0_15 = string.byte("Z")

local function var_0_16(arg_191_0)
	if not arg_191_0 then
		return arg_191_0
	end

	local var_191_0 = string.byte(arg_191_0)

	if var_191_0 > 128 then
		return
	end

	if var_191_0 >= var_0_12 and var_191_0 <= var_0_13 then
		return string.char(var_191_0 - 32)
	elseif var_191_0 >= var_0_14 and var_191_0 <= var_0_15 then
		return string.char(var_191_0 + 32)
	else
		return arg_191_0
	end
end

function wordVerMatch(arg_192_0, arg_192_1, arg_192_2, arg_192_3, arg_192_4, arg_192_5, arg_192_6, arg_192_7)
	if arg_192_3 > #arg_192_0 then
		return arg_192_5, arg_192_6, arg_192_7
	end

	local var_192_0 = arg_192_0[arg_192_3]
	local var_192_1 = arg_192_1[var_192_0]

	if var_192_1 then
		local var_192_2, var_192_3, var_192_4 = wordVerMatch(arg_192_0, var_192_1, arg_192_2, arg_192_3 + 1, arg_192_2.isReplace and arg_192_4 .. arg_192_2.replaceWord or arg_192_4, var_192_1.this or arg_192_5, var_192_1.this and arg_192_3 + 1 or arg_192_6, var_192_1.this and (arg_192_2.isReplace and arg_192_4 .. arg_192_2.replaceWord or arg_192_4) or arg_192_7)

		if var_192_2 then
			return var_192_2, var_192_3, var_192_4
		end
	end

	local var_192_5 = var_0_16(var_192_0)
	local var_192_6 = arg_192_1[var_192_5]

	if var_192_5 ~= var_192_0 and var_192_6 then
		local var_192_7, var_192_8, var_192_9 = wordVerMatch(arg_192_0, var_192_6, arg_192_2, arg_192_3 + 1, arg_192_2.isReplace and arg_192_4 .. arg_192_2.replaceWord or arg_192_4, var_192_6.this or arg_192_5, var_192_6.this and arg_192_3 + 1 or arg_192_6, var_192_6.this and (arg_192_2.isReplace and arg_192_4 .. arg_192_2.replaceWord or arg_192_4) or arg_192_7)

		if var_192_7 then
			return var_192_7, var_192_8, var_192_9
		end
	end

	return arg_192_5, arg_192_6, arg_192_7
end

function wordSplit(arg_193_0)
	local var_193_0 = {}

	for iter_193_0 in arg_193_0.gmatch(arg_193_0, "[\x01-\x7F�-�][�-�]*") do
		var_193_0[#var_193_0 + 1] = iter_193_0
	end

	return var_193_0
end

function contentWrap(arg_194_0, arg_194_1, arg_194_2)
	local var_194_0 = LuaHelper.WrapContent(arg_194_0, arg_194_1, arg_194_2)

	return #var_194_0 ~= #arg_194_0, var_194_0
end

function cancelRich(arg_195_0)
	local var_195_0

	for iter_195_0 = 1, 20 do
		local var_195_1

		arg_195_0, var_195_1 = string.gsub(arg_195_0, "<([^>]*)>", "%1")

		if var_195_1 <= 0 then
			break
		end
	end

	return arg_195_0
end

function cancelColorRich(arg_196_0)
	local var_196_0

	for iter_196_0 = 1, 20 do
		local var_196_1

		arg_196_0, var_196_1 = string.gsub(arg_196_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_196_1 <= 0 then
			break
		end
	end

	return arg_196_0
end

function getSkillConfig(arg_197_0)
	local var_197_0 = pg.buffCfg["buff_" .. arg_197_0]

	if not var_197_0 then
		return
	end

	local var_197_1 = Clone(var_197_0)

	var_197_1.name = getSkillName(arg_197_0)
	var_197_1.desc = HXSet.hxLan(var_197_1.desc)
	var_197_1.desc_get = HXSet.hxLan(var_197_1.desc_get)

	_.each(var_197_1, function(arg_198_0)
		arg_198_0.desc = HXSet.hxLan(arg_198_0.desc)
	end)

	return var_197_1
end

function getSkillName(arg_199_0)
	local var_199_0 = pg.skill_data_template[arg_199_0] or pg.skill_data_display[arg_199_0]

	if var_199_0 then
		return HXSet.hxLan(var_199_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_200_0, arg_200_1)
	local var_200_0 = arg_200_1 and pg.skill_world_display[arg_200_0] and setmetatable({}, {
		__index = function(arg_201_0, arg_201_1)
			return pg.skill_world_display[arg_200_0][arg_201_1] or pg.skill_data_template[arg_200_0][arg_201_1]
		end
	}) or pg.skill_data_template[arg_200_0]

	if not var_200_0 then
		return ""
	end

	local var_200_1 = var_200_0.desc_get ~= "" and var_200_0.desc_get or var_200_0.desc

	for iter_200_0, iter_200_1 in pairs(var_200_0.desc_get_add) do
		local var_200_2 = setColorStr(iter_200_1[1], COLOR_GREEN)

		if iter_200_1[2] then
			var_200_2 = var_200_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_200_1[2], COLOR_GREEN))
		end

		var_200_1 = specialGSub(var_200_1, "$" .. iter_200_0, var_200_2)
	end

	return HXSet.hxLan(var_200_1)
end

function getSkillDescLearn(arg_202_0, arg_202_1, arg_202_2)
	local var_202_0 = arg_202_2 and pg.skill_world_display[arg_202_0] and setmetatable({}, {
		__index = function(arg_203_0, arg_203_1)
			return pg.skill_world_display[arg_202_0][arg_203_1] or pg.skill_data_template[arg_202_0][arg_203_1]
		end
	}) or pg.skill_data_template[arg_202_0]

	if not var_202_0 then
		return ""
	end

	local var_202_1 = var_202_0.desc

	if not var_202_0.desc_add then
		return HXSet.hxLan(var_202_1)
	end

	for iter_202_0, iter_202_1 in pairs(var_202_0.desc_add) do
		local var_202_2 = iter_202_1[arg_202_1][1]

		if iter_202_1[arg_202_1][2] then
			var_202_2 = var_202_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_202_1[arg_202_1][2])
		end

		var_202_1 = specialGSub(var_202_1, "$" .. iter_202_0, setColorStr(var_202_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_202_1)
end

function getSkillDesc(arg_204_0, arg_204_1, arg_204_2)
	local var_204_0 = arg_204_2 and pg.skill_world_display[arg_204_0] and setmetatable({}, {
		__index = function(arg_205_0, arg_205_1)
			return pg.skill_world_display[arg_204_0][arg_205_1] or pg.skill_data_template[arg_204_0][arg_205_1]
		end
	}) or pg.skill_data_template[arg_204_0]

	if not var_204_0 then
		return ""
	end

	local var_204_1 = var_204_0.desc

	if not var_204_0.desc_add then
		return HXSet.hxLan(var_204_1)
	end

	for iter_204_0, iter_204_1 in pairs(var_204_0.desc_add) do
		local var_204_2 = setColorStr(iter_204_1[arg_204_1][1], COLOR_GREEN)

		var_204_1 = specialGSub(var_204_1, "$" .. iter_204_0, var_204_2)
	end

	return HXSet.hxLan(var_204_1)
end

function specialGSub(arg_206_0, arg_206_1, arg_206_2)
	arg_206_0 = string.gsub(arg_206_0, "<color=#", "<color=NNN")
	arg_206_0 = string.gsub(arg_206_0, "#", "")
	arg_206_2 = string.gsub(arg_206_2, "%%", "%%%%")
	arg_206_0 = string.gsub(arg_206_0, arg_206_1, arg_206_2)
	arg_206_0 = string.gsub(arg_206_0, "<color=NNN", "<color=#")

	return arg_206_0
end

function topAnimation(arg_207_0, arg_207_1, arg_207_2, arg_207_3, arg_207_4, arg_207_5)
	local var_207_0 = {}

	arg_207_4 = arg_207_4 or 0.27

	local var_207_1 = 0.05

	if arg_207_0 then
		local var_207_2 = arg_207_0.transform.localPosition.x

		setAnchoredPosition(arg_207_0, {
			x = var_207_2 - 500
		})
		shiftPanel(arg_207_0, var_207_2, nil, 0.05, arg_207_4, true, true)
		setActive(arg_207_0, true)
	end

	setActive(arg_207_1, false)
	setActive(arg_207_2, false)
	setActive(arg_207_3, false)

	for iter_207_0 = 1, 3 do
		table.insert(var_207_0, LeanTween.delayedCall(arg_207_4 + 0.13 + var_207_1 * iter_207_0, System.Action(function()
			if arg_207_1 then
				setActive(arg_207_1, not arg_207_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_207_0, LeanTween.delayedCall(arg_207_4 + 0.02 + var_207_1 * iter_207_0, System.Action(function()
			if arg_207_2 then
				setActive(arg_207_2, not go(arg_207_2).activeSelf)
			end

			if arg_207_2 then
				setActive(arg_207_3, not go(arg_207_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_207_5 then
		table.insert(var_207_0, LeanTween.delayedCall(arg_207_4 + 0.13 + var_207_1 * 3 + 0.1, System.Action(function()
			arg_207_5()
		end)).uniqueId)
	end

	return var_207_0
end

function cancelTweens(arg_211_0)
	assert(arg_211_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_211_0, iter_211_1 in ipairs(arg_211_0) do
		if iter_211_1 then
			LeanTween.cancel(iter_211_1)
		end
	end
end

function getOfflineTimeStamp(arg_212_0)
	local var_212_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_212_0
	local var_212_1 = ""

	if var_212_0 <= 59 then
		var_212_1 = i18n("just_now")
	elseif var_212_0 <= 3599 then
		var_212_1 = i18n("several_minutes_before", math.floor(var_212_0 / 60))
	elseif var_212_0 <= 86399 then
		var_212_1 = i18n("several_hours_before", math.floor(var_212_0 / 3600))
	else
		var_212_1 = i18n("several_days_before", math.floor(var_212_0 / 86400))
	end

	return var_212_1
end

function playMovie(arg_213_0, arg_213_1, arg_213_2)
	local var_213_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_213_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_213_0, function(arg_214_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_214_0 = GCHandle.Alloc(arg_214_0, GCHandleType.Pinned)

			setActive(var_213_0, true)

			local var_214_1 = var_213_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_214_1.player:SetData(arg_214_0, arg_214_0.Length)

			var_214_1.target = var_213_0:GetComponent(typeof(Image))
			var_214_1.loop = false
			var_214_1.additiveMode = false
			var_214_1.playOnStart = true

			local var_214_2

			var_214_2 = Timer.New(function()
				if var_214_1.player.status == CriMana.Player.Status.PlayEnd or var_214_1.player.status == CriMana.Player.Status.Stop or var_214_1.player.status == CriMana.Player.Status.Error then
					var_214_2:Stop()
					Object.Destroy(var_214_1)
					GCHandle.Free(var_214_0)
					setActive(var_213_0, false)

					if arg_213_1 then
						arg_213_1()
					end
				end
			end, 0.2, -1)

			var_214_2:Start()
			removeOnButton(var_213_0)

			if arg_213_2 then
				onButton(nil, var_213_0, function()
					var_214_1:Stop()
					GetOrAddComponent(var_213_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_213_1 then
		arg_213_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_217_0)
	if PaintCameraAdjustOn ~= arg_217_0 then
		local var_217_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_217_0 then
			var_217_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_217_0.matchWidthOrHeight = 1
		else
			var_217_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		pg.CameraFixMgr.GetInstance():BlockCameraRatioControll(arg_217_0)

		PaintCameraAdjustOn = arg_217_0
	end
end

function ManhattonDist(arg_218_0, arg_218_1)
	return math.abs(arg_218_0.row - arg_218_1.row) + math.abs(arg_218_0.column - arg_218_1.column)
end

function checkFirstHelpShow(arg_219_0)
	local var_219_0 = getProxy(SettingsProxy)

	if not var_219_0:checkReadHelp(arg_219_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_219_0].tip
		})
		var_219_0:recordReadHelp(arg_219_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_220_0)
	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_221_0)
	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_221_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_223_0, arg_223_1)
	if arg_223_0 == nil then
		return
	end

	arg_223_0:GetComponent("NotchAdapt").enabled = arg_223_1
end

function comma_value(arg_224_0)
	local var_224_0 = arg_224_0
	local var_224_1 = 0

	repeat
		local var_224_2

		var_224_0, var_224_2 = string.gsub(var_224_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_224_2 == 0

	return var_224_0
end

local var_0_17 = 0.2

function SwitchPanel(arg_225_0, arg_225_1, arg_225_2, arg_225_3, arg_225_4, arg_225_5)
	arg_225_3 = defaultValue(arg_225_3, var_0_17)

	if arg_225_5 then
		LeanTween.cancel(go(arg_225_0))
	end

	local var_225_0 = Vector3.New(tf(arg_225_0).localPosition.x, tf(arg_225_0).localPosition.y, tf(arg_225_0).localPosition.z)

	if arg_225_1 then
		var_225_0.x = arg_225_1
	end

	if arg_225_2 then
		var_225_0.y = arg_225_2
	end

	local var_225_1 = LeanTween.move(rtf(arg_225_0), var_225_0, arg_225_3):setEase(LeanTweenType.easeInOutSine)

	if arg_225_4 then
		var_225_1:setDelay(arg_225_4)
	end

	return var_225_1
end

function updateActivityTaskStatus(arg_226_0)
	local var_226_0 = arg_226_0:getConfig("config_id")
	local var_226_1, var_226_2 = getActivityTask(arg_226_0, true)

	if not var_226_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_226_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_227_0)
	local var_227_0 = getProxy(TaskProxy)
	local var_227_1 = arg_227_0:getNDay()
	local var_227_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_227_0:getStartTime())

	for iter_227_0, iter_227_1 in ipairs(arg_227_0:getConfig("config_data")) do
		local var_227_3 = pg.battlepass_task_group[iter_227_1]

		if var_227_3 and var_227_2 >= var_227_3.group_mask then
			if underscore.any(underscore.flatten(var_227_3.task_group), function(arg_228_0)
				return var_227_0:getTaskVO(arg_228_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD, {
					cmd = 1,
					activity_id = arg_227_0.id
				})

				return true
			end
		elseif not var_227_3 then
			warning("battlepass_task_group表中不存在 id = " .. iter_227_1)
		end
	end

	return false
end

function updateCrusingHei5ActivityTask(arg_229_0)
	local var_229_0 = getProxy(TaskProxy)
	local var_229_1 = arg_229_0:getNDay()
	local var_229_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_229_0:getStartTime())

	for iter_229_0, iter_229_1 in ipairs(arg_229_0:getConfig("config_data")) do
		local var_229_3 = pg.black_friday_battlepass_task_group[iter_229_1]

		if var_229_3 and var_229_2 >= var_229_3.group_mask then
			if underscore.any(underscore.flatten(var_229_3.task_group), function(arg_230_0)
				return var_229_0:getTaskVO(arg_230_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD_HEI5, {
					cmd = 1,
					activity_id = arg_229_0.id
				})

				return true
			end
		elseif not var_229_3 then
			warning("black_friday_battlepass_task_group表中不存在 id = " .. iter_229_1)
		end
	end

	return false
end

function setShipCardFrame(arg_231_0, arg_231_1, arg_231_2)
	arg_231_0.localScale = Vector3.one
	arg_231_0.anchorMin = Vector2.zero
	arg_231_0.anchorMax = Vector2.one

	local var_231_0 = arg_231_2 or arg_231_1

	GetImageSpriteFromAtlasAsync("shipframe", var_231_0, arg_231_0)

	local var_231_1 = pg.frame_resource[var_231_0]

	if var_231_1 then
		local var_231_2 = var_231_1.param

		arg_231_0.offsetMin = Vector2(var_231_2[1], var_231_2[2])
		arg_231_0.offsetMax = Vector2(var_231_2[3], var_231_2[4])
	else
		arg_231_0.offsetMin = Vector2.zero
		arg_231_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_232_0, arg_232_1, arg_232_2)
	arg_232_0.localScale = Vector3.one
	arg_232_0.anchorMin = Vector2.zero
	arg_232_0.anchorMax = Vector2.one

	setImageSprite(arg_232_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_232_2 or arg_232_1)))

	local var_232_0 = "b" .. (arg_232_2 or arg_232_1)
	local var_232_1 = pg.frame_resource[var_232_0]

	if var_232_1 then
		local var_232_2 = var_232_1.param

		arg_232_0.offsetMin = Vector2(var_232_2[1], var_232_2[2])
		arg_232_0.offsetMax = Vector2(var_232_2[3], var_232_2[4])
	else
		arg_232_0.offsetMin = Vector2.zero
		arg_232_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_233_0, arg_233_1)
	if arg_233_1 then
		local var_233_0 = arg_233_1 .. "(Clone)"
		local var_233_1 = false

		eachChild(arg_233_0, function(arg_234_0)
			setActive(arg_234_0, arg_234_0.name == var_233_0)

			var_233_1 = var_233_1 or arg_234_0.name == var_233_0
		end)

		if not var_233_1 then
			LoadAndInstantiateAsync("effect", arg_233_1, function(arg_235_0)
				if IsNil(arg_233_0) or findTF(arg_233_0, var_233_0) then
					Object.Destroy(arg_235_0)
				else
					setParent(arg_235_0, arg_233_0)
					setActive(arg_235_0, true)
				end
			end)
		end
	end

	setActive(arg_233_0, arg_233_1)
end

function setProposeMarkIcon(arg_236_0, arg_236_1)
	local var_236_0 = arg_236_0:Find("proposeShipCard(Clone)")
	local var_236_1 = arg_236_1.propose and not arg_236_1:ShowPropose()

	if var_236_0 then
		setActive(var_236_0, var_236_1)
	elseif var_236_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_237_0)
			if IsNil(arg_236_0) or arg_236_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_237_0)
			else
				setParent(arg_237_0, arg_236_0, false)
			end
		end)
	end
end

function flushShipCard(arg_238_0, arg_238_1)
	local var_238_0 = arg_238_1:rarity2bgPrint()
	local var_238_1 = findTF(arg_238_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_238_0, "", var_238_1)

	local var_238_2 = findTF(arg_238_0, "content/ship_icon")
	local var_238_3 = arg_238_1 and {
		"shipYardIcon/" .. arg_238_1:getPainting(),
		arg_238_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_238_3[1], var_238_3[2], var_238_2)

	local var_238_4 = arg_238_1:getShipType()
	local var_238_5 = findTF(arg_238_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_238_4), var_238_5)
	setText(findTF(arg_238_0, "content/dockyard/lv/Text"), defaultValue(arg_238_1.level, 1))

	local var_238_6 = arg_238_1:getStar()
	local var_238_7 = arg_238_1:getMaxStar()
	local var_238_8 = findTF(arg_238_0, "content/front/stars")

	setActive(var_238_8, true)

	local var_238_9 = findTF(var_238_8, "star_tpl")
	local var_238_10 = var_238_8.childCount

	for iter_238_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_238_11 = var_238_10 < iter_238_0 and cloneTplTo(var_238_9, var_238_8) or var_238_8:GetChild(iter_238_0 - 1)

		setActive(var_238_11, iter_238_0 <= var_238_7)
		triggerToggle(var_238_11, iter_238_0 <= var_238_6)
	end

	local var_238_12 = findTF(arg_238_0, "content/front/frame")
	local var_238_13, var_238_14 = arg_238_1:GetFrameAndEffect()

	setShipCardFrame(var_238_12, var_238_0, var_238_13)
	setFrameEffect(findTF(arg_238_0, "content/front/bg_other"), var_238_14)
	setProposeMarkIcon(arg_238_0:Find("content/dockyard/propose"), arg_238_1)
end

function TweenItemAlphaAndWhite(arg_239_0)
	LeanTween.cancel(arg_239_0)

	local var_239_0 = GetOrAddComponent(arg_239_0, "CanvasGroup")

	var_239_0.alpha = 0

	LeanTween.alphaCanvas(var_239_0, 1, 0.2):setUseEstimatedTime(true)

	local var_239_1 = findTF(arg_239_0.transform, "white_mask")

	if var_239_1 then
		setActive(var_239_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_240_0)
	LeanTween.cancel(arg_240_0)

	GetOrAddComponent(arg_240_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_241_0)
	local var_241_0 = {}
	local var_241_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_241_2 = getProxy(CollectionProxy):getShipGroup(arg_241_0)

	if var_241_2 then
		local var_241_3 = ShipGroup.getSkinList(arg_241_0)

		for iter_241_0, iter_241_1 in ipairs(var_241_3) do
			if iter_241_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_241_1, iter_241_1.id) or iter_241_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_241_2.trans or iter_241_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_241_2.married == 1 then
				var_241_0[iter_241_1.id] = true
			end
		end
	end

	return var_241_0
end

function split(arg_242_0, arg_242_1)
	local var_242_0 = {}

	if not arg_242_0 then
		return nil
	end

	local var_242_1 = #arg_242_0
	local var_242_2 = 1

	while var_242_2 <= var_242_1 do
		local var_242_3 = string.find(arg_242_0, arg_242_1, var_242_2)

		if var_242_3 == nil then
			table.insert(var_242_0, string.sub(arg_242_0, var_242_2, var_242_1))

			break
		end

		table.insert(var_242_0, string.sub(arg_242_0, var_242_2, var_242_3 - 1))

		if var_242_3 == var_242_1 then
			table.insert(var_242_0, "")

			break
		end

		var_242_2 = var_242_3 + 1
	end

	return var_242_0
end

function NumberToChinese(arg_243_0, arg_243_1)
	local var_243_0 = ""
	local var_243_1 = #arg_243_0

	for iter_243_0 = 1, var_243_1 do
		local var_243_2 = string.sub(arg_243_0, iter_243_0, iter_243_0)

		if var_243_2 ~= "0" or var_243_2 == "0" and not arg_243_1 then
			if arg_243_1 then
				if var_243_1 >= 2 then
					if iter_243_0 == 1 then
						if var_243_2 == "1" then
							var_243_0 = i18n("number_" .. 10)
						else
							var_243_0 = i18n("number_" .. var_243_2) .. i18n("number_" .. 10)
						end
					else
						var_243_0 = var_243_0 .. i18n("number_" .. var_243_2)
					end
				else
					var_243_0 = var_243_0 .. i18n("number_" .. var_243_2)
				end
			else
				var_243_0 = var_243_0 .. i18n("number_" .. var_243_2)
			end
		end
	end

	return var_243_0
end

function getActivityTask(arg_244_0, arg_244_1)
	local var_244_0 = getProxy(TaskProxy)
	local var_244_1 = arg_244_0:getConfig("config_data")
	local var_244_2 = arg_244_0:getNDay(arg_244_0.data1)
	local var_244_3
	local var_244_4
	local var_244_5

	for iter_244_0 = math.max(arg_244_0.data3, 1), math.min(var_244_2, #var_244_1) do
		local var_244_6 = _.flatten({
			var_244_1[iter_244_0]
		})

		for iter_244_1, iter_244_2 in ipairs(var_244_6) do
			local var_244_7 = var_244_0:getTaskById(iter_244_2)

			if var_244_7 then
				return var_244_7.id, var_244_7
			end

			if var_244_4 then
				var_244_5 = var_244_0:getFinishTaskById(iter_244_2)

				if var_244_5 then
					var_244_4 = var_244_5
				elseif arg_244_1 then
					return iter_244_2
				else
					return var_244_4.id, var_244_4
				end
			else
				var_244_4 = var_244_0:getFinishTaskById(iter_244_2)
				var_244_5 = var_244_5 or iter_244_2
			end
		end
	end

	if var_244_4 then
		return var_244_4.id, var_244_4
	else
		return var_244_5
	end
end

function setImageFromImage(arg_245_0, arg_245_1, arg_245_2)
	local var_245_0 = GetComponent(arg_245_0, "Image")

	var_245_0.sprite = GetComponent(arg_245_1, "Image").sprite

	if arg_245_2 then
		var_245_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_246_0)
	local var_246_0, var_246_1, var_246_2, var_246_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_246_0)

	if var_246_0 >= 1 then
		return i18n("limit_skin_time_day", var_246_0)
	elseif var_246_0 <= 0 and var_246_1 > 0 then
		return i18n("limit_skin_time_day_min", var_246_1, var_246_2)
	elseif var_246_0 <= 0 and var_246_1 <= 0 and (var_246_2 > 0 or var_246_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_246_2, 1))
	elseif var_246_0 <= 0 and var_246_1 <= 0 and var_246_2 <= 0 and var_246_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_247_0)
	local var_247_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_247_1 = math.max(arg_247_0 - var_247_0, 0)
	local var_247_2 = math.floor(var_247_1 / 86400)

	if var_247_2 > 0 then
		return i18n("time_remaining_tip") .. var_247_2 .. i18n("word_date")
	else
		local var_247_3 = math.floor(var_247_1 / 3600)

		if var_247_3 > 0 then
			return i18n("time_remaining_tip") .. var_247_3 .. i18n("word_hour")
		else
			local var_247_4 = math.floor(var_247_1 / 60)

			if var_247_4 > 0 then
				return i18n("time_remaining_tip") .. var_247_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_247_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_248_0)
	local var_248_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_248_0
	local var_248_1 = var_248_0 / 86400

	if var_248_1 > 1 then
		return i18n("ins_word_day", math.floor(var_248_1))
	else
		local var_248_2 = var_248_0 / 3600

		if var_248_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_248_2))
		else
			local var_248_3 = var_248_0 / 60

			if var_248_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_248_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_249_0)
	local var_249_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_249_0
	local var_249_1 = var_249_0 / 86400

	if var_249_1 > 1 then
		return i18n1(math.floor(var_249_1) .. "d")
	else
		local var_249_2 = var_249_0 / 3600

		if var_249_2 > 1 then
			return i18n1(math.floor(var_249_2) .. "h")
		else
			local var_249_3 = var_249_0 / 60

			if var_249_3 > 1 then
				return i18n1(math.floor(var_249_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_250_0)
	local var_250_0, var_250_1, var_250_2, var_250_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_250_0)

	if var_250_0 <= 0 and var_250_1 <= 0 and var_250_2 <= 0 and var_250_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_250_0, var_250_1, var_250_2)
	end
end

function checkExist(arg_251_0, ...)
	local var_251_0 = {
		...
	}

	for iter_251_0, iter_251_1 in ipairs(var_251_0) do
		if arg_251_0 == nil then
			break
		end

		assert(type(arg_251_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_251_1) == "table", "type error : param should be table")

		if type(arg_251_0[iter_251_1[1]]) == "function" then
			arg_251_0 = arg_251_0[iter_251_1[1]](arg_251_0, unpack(iter_251_1[2] or {}))
		else
			arg_251_0 = arg_251_0[iter_251_1[1]]
		end
	end

	return arg_251_0
end

function AcessWithinNull(arg_252_0, arg_252_1)
	if arg_252_0 == nil then
		return
	end

	assert(type(arg_252_0) == "table")

	return arg_252_0[arg_252_1]
end

function showRepairMsgbox()
	local var_253_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_253_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_253_2 = {
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
			var_253_2,
			var_253_1,
			var_253_0
		}
	})
end

function resourceVerify(arg_257_0, arg_257_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_257_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_257_1
	local var_257_2 = PathMgr.ReadAllLines(var_257_0)
	local var_257_3 = {}

	if arg_257_0 then
		setActive(arg_257_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_257_4()
		if arg_257_0 then
			setActive(arg_257_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_257_1)

		if var_257_1 then
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

	local var_257_5 = var_257_2.Length
	local var_257_6

	local function var_257_7(arg_260_0)
		if arg_260_0 < 0 then
			var_257_4()

			return
		end

		if arg_257_1 then
			setSlider(arg_257_1, 0, var_257_5, var_257_5 - arg_260_0)
		end

		local var_260_0 = string.split(var_257_2[arg_260_0], ",")
		local var_260_1 = var_260_0[1]
		local var_260_2 = var_260_0[3]
		local var_260_3 = PathMgr.getAssetBundle(var_260_1)

		if PathMgr.FileExists(var_260_3) then
			local var_260_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_260_1))

			if var_260_2 == HashUtil.CalcMD5(var_260_4) then
				onNextTick(function()
					var_257_7(arg_260_0 - 1)
				end)

				return
			end
		end

		var_257_1 = var_260_1

		var_257_4()
	end

	var_257_7(var_257_5 - 1)
end

function splitByWordEN(arg_262_0, arg_262_1)
	local var_262_0 = string.split(arg_262_0, " ")
	local var_262_1 = ""
	local var_262_2 = ""
	local var_262_3 = arg_262_1:GetComponent(typeof(RectTransform))
	local var_262_4 = arg_262_1:GetComponent(typeof(Text))
	local var_262_5 = var_262_3.rect.width

	for iter_262_0, iter_262_1 in ipairs(var_262_0) do
		local var_262_6 = var_262_2

		var_262_2 = var_262_2 == "" and iter_262_1 or var_262_2 .. " " .. iter_262_1

		setText(arg_262_1, var_262_2)

		if var_262_5 < var_262_4.preferredWidth then
			var_262_1 = var_262_1 == "" and var_262_6 or var_262_1 .. "\n" .. var_262_6
			var_262_2 = iter_262_1
		end

		if iter_262_0 >= #var_262_0 then
			var_262_1 = var_262_1 == "" and var_262_2 or var_262_1 .. "\n" .. var_262_2
		end
	end

	return var_262_1
end

function checkBirthFormat(arg_263_0)
	if #arg_263_0 ~= 8 then
		return false
	end

	local var_263_0 = 0
	local var_263_1 = #arg_263_0

	while var_263_0 < var_263_1 do
		local var_263_2 = string.byte(arg_263_0, var_263_0 + 1)

		if var_263_2 < 48 or var_263_2 > 57 then
			return false
		end

		var_263_0 = var_263_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_264_0)
	local var_264_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_264_0, function(arg_265_0)
		return arg_265_0 == arg_264_0
	end)
end

function GetServerState(arg_266_0)
	local var_266_0 = -1
	local var_266_1 = 0
	local var_266_2 = 1
	local var_266_3 = 2
	local var_266_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_266_4 = string.gsub(var_266_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_266_4, function(arg_267_0, arg_267_1)
		local var_267_0 = true
		local var_267_1 = false

		for iter_267_0 in string.gmatch(arg_267_1, "\"state\":%d") do
			if iter_267_0 ~= "\"state\":1" then
				var_267_0 = false
			end

			var_267_1 = true
		end

		if not var_267_1 then
			var_267_0 = false
		end

		if arg_266_0 ~= nil then
			arg_266_0(var_267_0 and var_266_2 or var_266_1)
		end
	end)
end

function setScrollText(arg_268_0, arg_268_1)
	GetOrAddComponent(arg_268_0, "ScrollText"):SetText(arg_268_1)
end

function changeToScrollText(arg_269_0, arg_269_1)
	local var_269_0 = GetComponent(arg_269_0, typeof(Text))

	assert(var_269_0, "without component<Text>")

	local var_269_1 = arg_269_0:Find("subText")

	if not var_269_1 then
		var_269_1 = cloneTplTo(arg_269_0, arg_269_0, "subText")

		eachChild(arg_269_0, function(arg_270_0)
			setActive(arg_270_0, arg_270_0 == var_269_1)
		end)

		arg_269_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_269_1, arg_269_1)
end

function setScrollTextWithSize(arg_271_0, arg_271_1, arg_271_2, arg_271_3)
	local var_271_0 = arg_271_3 < GetPerceptualSize(arg_271_2)

	setActive(arg_271_1, var_271_0)
	setActive(arg_271_0, not var_271_0)

	if var_271_0 then
		setScrollText(arg_271_1, arg_271_2)
	else
		setText(arg_271_0, arg_271_2)
	end
end

local var_0_18
local var_0_19
local var_0_20
local var_0_21

local function var_0_22(arg_272_0, arg_272_1, arg_272_2)
	local var_272_0 = arg_272_0:Find("base")
	local var_272_1, var_272_2, var_272_3 = Equipment.GetInfoTrans(arg_272_1, arg_272_2)

	if arg_272_1.nextValue then
		local var_272_4 = {
			name = arg_272_1.name,
			type = arg_272_1.type,
			value = arg_272_1.nextValue
		}
		local var_272_5, var_272_6 = Equipment.GetInfoTrans(var_272_4, arg_272_2)

		var_272_2 = var_272_2 .. setColorStr("   >   " .. var_272_6, COLOR_GREEN)
	end

	setText(var_272_0:Find("name"), var_272_1)

	if var_272_3 then
		local var_272_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_272_0:Find("value"), var_272_2 .. var_272_7)
	else
		setText(var_272_0:Find("value"), var_272_2)
	end

	setActive(var_272_0:Find("value/up"), arg_272_1.compare and arg_272_1.compare > 0)
	setActive(var_272_0:Find("value/down"), arg_272_1.compare and arg_272_1.compare < 0)
	triggerToggle(var_272_0, arg_272_1.lock_open)

	if not arg_272_1.lock_open and arg_272_1.sub and #arg_272_1.sub > 0 then
		GetComponent(var_272_0, typeof(Toggle)).enabled = true
	else
		setActive(var_272_0:Find("name/close"), false)
		setActive(var_272_0:Find("name/open"), false)

		GetComponent(var_272_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_23(arg_273_0, arg_273_1, arg_273_2, arg_273_3)
	var_0_22(arg_273_0, arg_273_2, arg_273_3)

	if not arg_273_2.sub or #arg_273_2.sub == 0 then
		return
	end

	var_0_20(arg_273_0:Find("subs"), arg_273_1, arg_273_2.sub, arg_273_3)
end

function var_0_20(arg_274_0, arg_274_1, arg_274_2, arg_274_3)
	removeAllChildren(arg_274_0)
	var_0_21(arg_274_0, arg_274_1, arg_274_2, arg_274_3)
end

function var_0_21(arg_275_0, arg_275_1, arg_275_2, arg_275_3)
	for iter_275_0, iter_275_1 in ipairs(arg_275_2) do
		local var_275_0 = cloneTplTo(arg_275_1, arg_275_0)

		var_0_23(var_275_0, arg_275_1, iter_275_1, arg_275_3)
	end
end

function updateEquipInfo(arg_276_0, arg_276_1, arg_276_2, arg_276_3)
	local var_276_0 = arg_276_0:Find("attr_tpl")

	var_0_20(arg_276_0:Find("attrs"), var_276_0, arg_276_1.attrs, arg_276_3)
	setActive(arg_276_0:Find("skill"), arg_276_2)

	if arg_276_2 then
		var_0_23(arg_276_0:Find("skill/attr"), var_276_0, {
			name = i18n("skill"),
			value = setColorStr(arg_276_2.name, "#FFDE00FF")
		}, arg_276_3)
		setText(arg_276_0:Find("skill/value/Text"), getSkillDescGet(arg_276_2.id))
	end

	setActive(arg_276_0:Find("weapon"), #arg_276_1.weapon.sub > 0)

	if #arg_276_1.weapon.sub > 0 then
		var_0_20(arg_276_0:Find("weapon"), var_276_0, {
			arg_276_1.weapon
		}, arg_276_3)
	end

	setActive(arg_276_0:Find("equip_info"), #arg_276_1.equipInfo.sub > 0)

	if #arg_276_1.equipInfo.sub > 0 then
		var_0_20(arg_276_0:Find("equip_info"), var_276_0, {
			arg_276_1.equipInfo
		}, arg_276_3)
	end

	var_0_23(arg_276_0:Find("part/attr"), var_276_0, {
		name = i18n("equip_info_23")
	}, arg_276_3)

	local var_276_1 = arg_276_0:Find("part/value")
	local var_276_2 = var_276_1:Find("label")
	local var_276_3 = {}
	local var_276_4 = {}

	if #arg_276_1.part[1] == 0 and #arg_276_1.part[2] == 0 then
		setmetatable(var_276_3, {
			__index = function(arg_277_0, arg_277_1)
				return true
			end
		})
		setmetatable(var_276_4, {
			__index = function(arg_278_0, arg_278_1)
				return true
			end
		})
	else
		for iter_276_0, iter_276_1 in ipairs(arg_276_1.part[1]) do
			var_276_3[iter_276_1] = true
		end

		for iter_276_2, iter_276_3 in ipairs(arg_276_1.part[2]) do
			var_276_4[iter_276_3] = true
		end
	end

	local var_276_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_276_3, var_276_4)

	UIItemList.StaticAlign(var_276_1, var_276_2, #var_276_5, function(arg_279_0, arg_279_1, arg_279_2)
		arg_279_1 = arg_279_1 + 1

		if arg_279_0 == UIItemList.EventUpdate then
			local var_279_0 = var_276_5[arg_279_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_279_0), arg_279_2)
			setActive(arg_279_2:Find("main"), var_276_3[var_279_0] and not var_276_4[var_279_0])
			setActive(arg_279_2:Find("sub"), var_276_4[var_279_0] and not var_276_3[var_279_0])
			setImageAlpha(arg_279_2, not var_276_3[var_279_0] and not var_276_4[var_279_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_280_0, arg_280_1, arg_280_2)
	local var_280_0 = arg_280_0:Find("attr_tpl")

	var_0_20(arg_280_0:Find("attrs"), var_280_0, arg_280_1.attrs, arg_280_2)
	setActive(arg_280_0:Find("weapon"), #arg_280_1.weapon.sub > 0)

	if #arg_280_1.weapon.sub > 0 then
		var_0_20(arg_280_0:Find("weapon"), var_280_0, {
			arg_280_1.weapon
		}, arg_280_2)
	end

	setActive(arg_280_0:Find("equip_info"), #arg_280_1.equipInfo.sub > 0)

	if #arg_280_1.equipInfo.sub > 0 then
		var_0_20(arg_280_0:Find("equip_info"), var_280_0, {
			arg_280_1.equipInfo
		}, arg_280_2)
	end
end

function setCanvasOverrideSorting(arg_281_0, arg_281_1)
	local var_281_0 = arg_281_0.parent

	arg_281_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_281_0) then
		GetOrAddComponent(arg_281_0, typeof(Canvas)).overrideSorting = arg_281_1
	else
		setActive(arg_281_0, true)

		GetOrAddComponent(arg_281_0, typeof(Canvas)).overrideSorting = arg_281_1

		setActive(arg_281_0, false)
	end

	arg_281_0:SetParent(var_281_0, false)
end

function createNewGameObject(arg_282_0, arg_282_1)
	local var_282_0 = GameObject.New()

	if arg_282_0 then
		var_282_0.name = "model"
	end

	var_282_0.layer = arg_282_1 or Layer.UI

	return GetOrAddComponent(var_282_0, "RectTransform")
end

function CreateShell(arg_283_0)
	if type(arg_283_0) ~= "table" and type(arg_283_0) ~= "userdata" then
		return arg_283_0
	end

	local var_283_0 = setmetatable({
		__index = arg_283_0
	}, arg_283_0)

	return setmetatable({}, var_283_0)
end

function CameraFittingSettin(arg_284_0)
	local var_284_0 = GetComponent(arg_284_0, typeof(Camera))
	local var_284_1 = 1.7777777777777777
	local var_284_2 = Screen.width / Screen.height

	if var_284_2 < var_284_1 then
		local var_284_3 = var_284_2 / var_284_1

		var_284_0.rect = var_0_0.Rect.New(0, (1 - var_284_3) / 2, 1, var_284_3)
	end
end

function SwitchSpecialChar(arg_285_0, arg_285_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_285_0 = arg_285_0:gsub(" ", " ")
		arg_285_0 = arg_285_0:gsub("\t", "    ")
	end

	if not arg_285_1 then
		arg_285_0 = arg_285_0:gsub("\n", " ")
	end

	return arg_285_0
end

function AfterCheck(arg_286_0, arg_286_1)
	local var_286_0 = {}

	for iter_286_0, iter_286_1 in ipairs(arg_286_0) do
		var_286_0[iter_286_0] = iter_286_1[1]()
	end

	arg_286_1()

	for iter_286_2, iter_286_3 in ipairs(arg_286_0) do
		if var_286_0[iter_286_2] ~= iter_286_3[1]() then
			iter_286_3[2]()
		end

		var_286_0[iter_286_2] = iter_286_3[1]()
	end
end

function CompareFuncs(arg_287_0, arg_287_1)
	local var_287_0 = {}

	local function var_287_1(arg_288_0, arg_288_1)
		var_287_0[arg_288_0] = var_287_0[arg_288_0] or {}
		var_287_0[arg_288_0][arg_288_1] = var_287_0[arg_288_0][arg_288_1] or arg_287_0[arg_288_0](arg_288_1)

		return var_287_0[arg_288_0][arg_288_1]
	end

	return function(arg_289_0, arg_289_1)
		local var_289_0 = 1

		while var_289_0 <= #arg_287_0 do
			local var_289_1 = var_287_1(var_289_0, arg_289_0)
			local var_289_2 = var_287_1(var_289_0, arg_289_1)

			if var_289_1 == var_289_2 then
				var_289_0 = var_289_0 + 1
			else
				return var_289_1 < var_289_2
			end
		end

		return tobool(arg_287_1)
	end
end

function DropResultIntegration(arg_290_0)
	local var_290_0 = {}
	local var_290_1 = 1

	while var_290_1 <= #arg_290_0 do
		local var_290_2 = arg_290_0[var_290_1].type
		local var_290_3 = arg_290_0[var_290_1].id

		var_290_0[var_290_2] = var_290_0[var_290_2] or {}

		if var_290_0[var_290_2][var_290_3] then
			local var_290_4 = arg_290_0[var_290_0[var_290_2][var_290_3]]
			local var_290_5 = table.remove(arg_290_0, var_290_1)

			var_290_4.count = var_290_4.count + var_290_5.count
		else
			var_290_0[var_290_2][var_290_3] = var_290_1
			var_290_1 = var_290_1 + 1
		end
	end

	local var_290_6 = {
		function(arg_291_0)
			local var_291_0 = arg_291_0.type
			local var_291_1 = arg_291_0.id

			if var_291_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_291_0 == DROP_TYPE_RESOURCE then
				if var_291_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_291_0 == DROP_TYPE_ITEM then
				if var_291_1 == 59010 then
					return 4
				elseif var_291_1 == 59900 then
					return 5
				else
					local var_291_2 = Item.getConfigData(var_291_1)
					local var_291_3 = var_291_2 and var_291_2.type or 0

					if var_291_3 == 9 then
						return 6
					elseif var_291_3 == 5 then
						return 7
					elseif var_291_3 == 4 then
						return 8
					elseif var_291_3 == 7 then
						return 9
					end
				end
			elseif var_291_0 == DROP_TYPE_VITEM and var_291_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_292_0)
			local var_292_0

			if arg_292_0.type == DROP_TYPE_SHIP then
				var_292_0 = pg.ship_data_statistics[arg_292_0.id]
			elseif arg_292_0.type == DROP_TYPE_ITEM then
				var_292_0 = Item.getConfigData(arg_292_0.id)
			end

			return (var_292_0 and var_292_0.rarity or 0) * -1
		end,
		function(arg_293_0)
			return arg_293_0.id
		end
	}

	table.sort(arg_290_0, CompareFuncs(var_290_6))
end

function getLoginConfig()
	if LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value then
		return false, "login", "", false, ""
	end

	local var_294_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_294_1 = 1

	for iter_294_0, iter_294_1 in ipairs(pg.login.all) do
		if pg.login[iter_294_1].date ~= "stop" then
			local var_294_2, var_294_3 = parseTimeConfig(pg.login[iter_294_1].date)

			assert(not var_294_3)

			if pg.TimeMgr.GetInstance():inTime(var_294_2, var_294_0) then
				var_294_1 = iter_294_1

				break
			end
		end
	end

	local var_294_4 = pg.login[var_294_1].login_static

	var_294_4 = var_294_4 ~= "" and var_294_4 or "login"

	local var_294_5 = pg.login[var_294_1].login_cri
	local var_294_6 = var_294_5 ~= "" and true or false
	local var_294_7 = pg.login[var_294_1].op_play == 1 and true or false
	local var_294_8 = pg.login[var_294_1].op_time

	if var_294_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_294_8, var_294_0) then
		var_294_7 = false
	end

	local var_294_9 = var_294_8 == "" and var_294_8 or table.concat(var_294_8[1][1])

	return var_294_6, var_294_6 and var_294_5 or var_294_4, pg.login[var_294_1].bgm, var_294_7, var_294_9
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

local var_0_25 = {
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
	}, var_0_25)

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

local var_0_26

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_26 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_26 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_314_0)
	return (string.char(226, 133, 160 + (arg_314_0 - 1)))
end

function quickPlayAnimator(arg_315_0, arg_315_1)
	arg_315_0:GetComponent(typeof(Animator)):Play(arg_315_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_316_0, arg_316_1)
	local var_316_0 = arg_316_0:GetComponent(typeof(Animator))

	var_316_0.enabled = true

	local var_316_1 = Animator.StringToHash(arg_316_1)

	if var_316_0:HasState(0, var_316_1) then
		var_316_0:Play(arg_316_1, -1, 0)
	end
end

function quickPlayAnimation(arg_317_0, arg_317_1)
	local var_317_0 = arg_317_0:GetComponent(typeof(Animation))

	var_317_0:Stop()
	var_317_0:Play(arg_317_1)
end

function getSurveyUrl(arg_318_0)
	local var_318_0 = pg.survey_data_template[arg_318_0]
	local var_318_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_318_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_318_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_318_1 = var_318_0.main_url
				else
					var_318_1 = var_318_0.uo_url
				end
			elseif var_318_2 == PLATFORM_IPHONEPLAYER then
				var_318_1 = var_318_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_KR then
			var_318_1 = var_318_0.main_url
		end
	else
		var_318_1 = var_318_0.main_url
	end

	local var_318_3 = getProxy(PlayerProxy):getRawData().id
	local var_318_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_318_5
	local var_318_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_318_7 = getProxy(UserProxy):getRawData()
	local var_318_8 = getProxy(ServerProxy):getRawData()[var_318_7 and var_318_7.server or 0]
	local var_318_9 = var_318_8 and var_318_8.id or ""
	local var_318_10 = getProxy(PlayerProxy):getRawData().level
	local var_318_11 = var_318_3 .. "_" .. arg_318_0
	local var_318_12 = var_318_1
	local var_318_13 = {
		var_318_3,
		var_318_4,
		var_318_6,
		var_318_9,
		var_318_10,
		var_318_11
	}

	if var_318_12 then
		for iter_318_0, iter_318_1 in ipairs(var_318_13) do
			var_318_12 = string.gsub(var_318_12, "$" .. iter_318_0, tostring(iter_318_1))
		end
	end

	originalPrint("survey url", tostring(var_318_12))

	return var_318_12
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

function FilterVarchar(arg_320_0)
	assert(type(arg_320_0) == "string" or type(arg_320_0) == "table")

	if arg_320_0 == "" then
		return nil
	end

	return arg_320_0
end

function getGameset(arg_321_0)
	local var_321_0 = pg.gameset[arg_321_0]

	assert(var_321_0)

	return {
		var_321_0.key_value,
		var_321_0.description
	}
end

function getDorm3dGameset(arg_322_0)
	local var_322_0 = pg.dorm3d_set[arg_322_0]

	assert(var_322_0)

	return {
		var_322_0.key_value_int,
		var_322_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_323_0)
	arg_323_0 = arg_323_0 or {}

	local var_323_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_323_0 > 0 do
		local var_323_1 = table.remove(arg_323_0)

		switch(var_323_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_323_1:getConfig("open_directly") == 1 then
					for iter_324_0, iter_324_1 in ipairs(var_323_1:getConfig("display_icon")) do
						local var_324_0 = Drop.Create(iter_324_1)

						var_324_0.count = var_324_0.count * var_323_1.count

						table.insert(arg_323_0, var_324_0)
					end
				elseif var_323_1:getSubClass():IsShipExpType() then
					var_323_0[var_323_1.type][var_323_1.id] = defaultValue(var_323_0[var_323_1.type][var_323_1.id], 0) + var_323_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_323_0[var_323_1.type][var_323_1.id] = defaultValue(var_323_0[var_323_1.type][var_323_1.id], 0) + var_323_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_323_0[var_323_1.type] = var_323_0[var_323_1.type] + var_323_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_323_0[var_323_1.type] = var_323_0[var_323_1.type] + var_323_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_323_0[var_323_1.type] = var_323_0[var_323_1.type] + var_323_1.count
			end
		})
	end

	return var_323_0
end

function CheckOverflow(arg_329_0, arg_329_1)
	local var_329_0 = {}
	local var_329_1 = arg_329_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_329_2 = arg_329_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_329_3 = arg_329_0[DROP_TYPE_EQUIP]
	local var_329_4 = arg_329_0[DROP_TYPE_SHIP]
	local var_329_5 = getProxy(PlayerProxy):getRawData()
	local var_329_6 = false

	if arg_329_1 then
		local var_329_7 = var_329_5:OverStore(PlayerConst.ResStoreGold, var_329_1)
		local var_329_8 = var_329_5:OverStore(PlayerConst.ResStoreOil, var_329_2)

		if var_329_7 > 0 or var_329_8 > 0 then
			var_329_0.isStoreOverflow = {
				var_329_7,
				var_329_8
			}
		end
	else
		if var_329_1 > 0 and var_329_5:GoldMax(var_329_1) then
			return false, "gold"
		end

		if var_329_2 > 0 and var_329_5:OilMax(var_329_2) then
			return false, "oil"
		end
	end

	var_329_0.isExpBookOverflow = {}

	for iter_329_0, iter_329_1 in pairs(arg_329_0[DROP_TYPE_ITEM]) do
		local var_329_9 = Item.getConfigData(iter_329_0)

		if getProxy(BagProxy):getItemCountById(iter_329_0) + iter_329_1 > var_329_9.max_num then
			table.insert(var_329_0.isExpBookOverflow, iter_329_0)
		end
	end

	local var_329_10 = getProxy(EquipmentProxy):getCapacity()

	if var_329_3 > 0 and var_329_10 >= var_329_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_329_11 = getProxy(BayProxy):getShipCount()

	if var_329_4 > 0 and var_329_4 + var_329_11 > var_329_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_329_0
end

function CheckShipExpOverflow(arg_330_0)
	local var_330_0 = getProxy(BagProxy)

	for iter_330_0, iter_330_1 in pairs(arg_330_0[DROP_TYPE_ITEM]) do
		if var_330_0:getItemCountById(iter_330_0) + iter_330_1 > Item.getConfigData(iter_330_0).max_num then
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

function RegisterDetailButton(arg_331_0, arg_331_1, arg_331_2)
	Drop.Change(arg_331_2)
	switch(arg_331_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_331_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_332_0 = Item.getConfigData(arg_331_2.id).usage_arg
				local var_332_1 = var_332_0[3]

				if Item.InTimeLimitSkinAssigned(arg_331_2.id) then
					var_332_1 = table.mergeArray(var_332_0[2], var_332_1, true)
				end

				local var_332_2 = {}

				for iter_332_0, iter_332_1 in ipairs(var_332_0[2]) do
					var_332_2[iter_332_1] = true
				end

				onButton(arg_331_0, arg_331_1, function()
					arg_331_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = NewSelectSkinLayer,
							mediator = NewSkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_331_2.id,
								selectableSkinList = underscore.map(var_332_1, function(arg_334_0)
									return SelectableSkin.New({
										id = arg_334_0,
										isTimeLimit = var_332_2[arg_334_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_331_1, true)
			else
				local var_332_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_331_2.id) and "tech" or arg_331_2:getConfig("type")

				if var_0_27[var_332_3] then
					local var_332_4 = {
						item2Row = true,
						content = i18n(var_0_27[var_332_3]),
						itemList = underscore.map(arg_331_2:getConfig("display_icon"), function(arg_335_0)
							return Drop.Create(arg_335_0)
						end)
					}

					if var_332_3 == 11 then
						onButton(arg_331_0, arg_331_1, function()
							arg_331_0:emit(BaseUI.ON_DROP_LIST_OWN, var_332_4)
						end, SFX_PANEL)
					else
						onButton(arg_331_0, arg_331_1, function()
							arg_331_0:emit(BaseUI.ON_DROP_LIST, var_332_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_331_1, tobool(var_0_27[var_332_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_331_0, arg_331_1, function()
				arg_331_0:emit(BaseUI.ON_DROP, arg_331_2)
			end, SFX_PANEL)
			setActive(arg_331_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_331_0, arg_331_1, function()
				arg_331_0:emit(BaseUI.ON_DROP, arg_331_2)
			end, SFX_PANEL)
			setActive(arg_331_1, true)
		end
	}, function()
		setActive(arg_331_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_343_0, arg_343_1, arg_343_2)
	Drop.Change(arg_343_2)
	switch(arg_343_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_344_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_343_2.id) and "tech" or arg_343_2:getConfig("type")

			if var_0_27[var_344_0] then
				local var_344_1 = {
					useDeepShow = true,
					showOwn = var_344_0 == 11,
					content = i18n(var_0_27[var_344_0]),
					itemList = underscore.map(arg_343_2:getConfig("display_icon"), function(arg_345_0)
						return Drop.Create(arg_345_0)
					end)
				}

				onButton(arg_343_0, arg_343_1, function()
					arg_343_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_344_1)
				end, SFX_PANEL)
			end

			setActive(arg_343_1, tobool(var_0_27[var_344_0]))
		end
	}, function()
		setActive(arg_343_1, false)
	end)
end

function UpdateOwnDisplay(arg_348_0, arg_348_1)
	local var_348_0, var_348_1 = arg_348_1:getOwnedCount()

	setActive(arg_348_0, var_348_1 and var_348_0 > 0)

	if var_348_1 and var_348_0 > 0 then
		setText(arg_348_0:Find("label"), i18n("word_own1"))
		setText(arg_348_0:Find("Text"), var_348_0)
	end
end

function Damp(arg_349_0, arg_349_1, arg_349_2)
	arg_349_1 = Mathf.Max(1, arg_349_1)

	local var_349_0 = Mathf.Epsilon

	if arg_349_1 < var_349_0 or var_349_0 > Mathf.Abs(arg_349_0) then
		return arg_349_0
	end

	if arg_349_2 < var_349_0 then
		return 0
	end

	local var_349_1 = -4.605170186

	return arg_349_0 * (1 - Mathf.Exp(var_349_1 * arg_349_2 / arg_349_1))
end

function checkCullResume(arg_350_0, arg_350_1)
	if arg_350_1 or not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_350_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_350_0 = arg_350_0:GetComponentsInChildren(typeof(var_0_0.UI.Graphic)):ToTable()

		for iter_350_0, iter_350_1 in ipairs(var_350_0) do
			iter_350_1:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_351_0)
	local var_351_0 = {}

	if arg_351_0 and arg_351_0 ~= "" then
		local var_351_1 = base64.dec(arg_351_0)

		var_351_0 = string.split(var_351_1, "/")
		var_351_0[5], var_351_0[6] = unpack(string.split(var_351_0[5], "\\"))

		if #var_351_0 < 6 or arg_351_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_351_0, 5), "/"),
			var_351_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_351_0 = {}
		end
	end

	for iter_351_0 = 1, 6 do
		var_351_0[iter_351_0] = var_351_0[iter_351_0] and tonumber(var_351_0[iter_351_0], 32) or 0
	end

	return var_351_0
end

function buildEquipCode(arg_352_0)
	local var_352_0 = underscore.map(arg_352_0:getAllEquipments(), function(arg_353_0)
		return ConversionBase(32, arg_353_0 and arg_353_0.id or 0)
	end)
	local var_352_1 = {
		table.concat(var_352_0, "/"),
		ConversionBase(32, checkExist(arg_352_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_352_1, "\\"))
end

function setDirectorSpeed(arg_354_0, arg_354_1)
	GetComponent(arg_354_0, typeof(TimelineSpeed)):SetTimelineSpeed(arg_354_1)
end

function setDefaultZeroMetatable(arg_355_0)
	return setmetatable(arg_355_0, {
		__index = function(arg_356_0, arg_356_1)
			if rawget(arg_356_0, arg_356_1) == nil then
				arg_356_0[arg_356_1] = 0
			end

			return arg_356_0[arg_356_1]
		end
	})
end

function checkABExist(arg_357_0)
	if EDITOR_TOOL then
		return ResourceMgr.Inst:AssetExist(arg_357_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_357_0))
	end
end

function compareNumber(arg_358_0, arg_358_1, arg_358_2)
	return switch(arg_358_1, {
		[">"] = function()
			return arg_358_0 > arg_358_2
		end,
		[">="] = function()
			return arg_358_0 >= arg_358_2
		end,
		["="] = function()
			return arg_358_0 == arg_358_2
		end,
		["<"] = function()
			return arg_358_0 < arg_358_2
		end,
		["<="] = function()
			return arg_358_0 <= arg_358_2
		end
	})
end

function ArabicToRoman(arg_364_0)
	local var_364_0 = {
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

	local function var_364_1(arg_365_0, arg_365_1)
		return select(2, arg_365_0:gsub(arg_365_1, ""))
	end

	local var_364_2 = ""

	while arg_364_0 > 0 do
		for iter_364_0, iter_364_1 in pairs(var_364_0) do
			local var_364_3 = iter_364_1[2]
			local var_364_4 = iter_364_1[1]

			while var_364_4 <= arg_364_0 do
				var_364_2 = var_364_2 .. var_364_3
				arg_364_0 = arg_364_0 - var_364_4
			end
		end
	end

	if arg_364_0 > 10000 then
		local var_364_5 = var_364_1(var_364_2, "M")

		var_364_2 = "M*" .. var_364_5 .. " " .. var_364_2
	end

	return var_364_2
end

function stringInset(arg_366_0, ...)
	for iter_366_0, iter_366_1 in ipairs({
		...
	}) do
		arg_366_0 = string.gsub(arg_366_0, "$" .. iter_366_0, iter_366_1)
	end

	return arg_366_0
end

function addSubLayer(arg_367_0, arg_367_1, arg_367_2, arg_367_3, arg_367_4)
	if arg_367_2 then
		while arg_367_1.parent do
			arg_367_1 = arg_367_1.parent
		end
	end

	local var_367_0 = {
		parentContext = arg_367_1,
		context = arg_367_0,
		callback = arg_367_3
	}

	var_367_0 = arg_367_4 and table.merge(var_367_0, arg_367_4) or var_367_0

	pg.m02:sendNotification(GAME.LOAD_LAYERS, var_367_0)
end
