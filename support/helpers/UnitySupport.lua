function tf(arg_1_0)
	return arg_1_0.transform
end

function go(arg_2_0)
	return tf(arg_2_0).gameObject
end

function rtf(arg_3_0)
	return arg_3_0.transform
end

function findGO(arg_4_0, arg_4_1)
	assert(arg_4_0, "object or transform should exist")

	local var_4_0 = tf(arg_4_0):Find(arg_4_1)

	return var_4_0 and var_4_0.gameObject
end

function findTF(arg_5_0, arg_5_1)
	assert(arg_5_0, "object or transform should exist " .. arg_5_1)

	return (tf(arg_5_0):Find(arg_5_1))
end

function Instantiate(arg_6_0, ...)
	return Object.Instantiate(go(arg_6_0), ...)
end

instantiate = Instantiate

function Destroy(arg_7_0)
	Object.Destroy(go(arg_7_0))
end

destroy = Destroy

function SetActive(arg_8_0, arg_8_1)
	if arg_8_0 == nil then
		print("<color=red>SetActive Object is NIL!!!!</color>")

		return
	end

	LuaHelper.SetActiveForLua(arg_8_0, tobool(arg_8_1))
end

setActive = SetActive

function isActive(arg_9_0)
	return go(arg_9_0).activeSelf
end

function SetName(arg_10_0, arg_10_1)
	arg_10_0.name = arg_10_1
end

setName = SetName

function SetParent(arg_11_0, arg_11_1, arg_11_2)
	LuaHelper.SetParentForLua(arg_11_0, arg_11_1, tobool(arg_11_2))
end

setParent = SetParent

function setText(arg_12_0, arg_12_1)
	if not arg_12_1 then
		return
	end

	arg_12_0:GetComponent(typeof(Text)).text = tostring(arg_12_1)
end

function setTextInNewStyleBox(arg_13_0, arg_13_1)
	if not arg_13_1 then
		return
	end

	for iter_13_0, iter_13_1 in pairs(pg.NewStyleMsgboxMgr.COLOR_MAP) do
		arg_13_1 = string.gsub(arg_13_1, iter_13_0, iter_13_1)
	end

	arg_13_0:GetComponent(typeof(Text)).text = tostring(arg_13_1)
end

function setScrollText(arg_14_0, arg_14_1)
	if not arg_14_1 then
		return
	end

	arg_14_0:GetComponent("ScrollText"):SetText(tostring(arg_14_1))
end

function setTextEN(arg_15_0, arg_15_1)
	if not arg_15_1 then
		return
	end

	arg_15_1 = splitByWordEN(arg_15_1, arg_15_0)
	arg_15_0:GetComponent(typeof(Text)).text = tostring(arg_15_1)
end

function setBestFitTextEN(arg_16_0, arg_16_1, arg_16_2)
	if not arg_16_1 then
		return
	end

	local var_16_0 = arg_16_0:GetComponent(typeof(RectTransform))
	local var_16_1 = arg_16_0:GetComponent(typeof(Text))
	local var_16_2 = arg_16_2 or 20
	local var_16_3 = var_16_0.rect.width
	local var_16_4 = var_16_0.rect.height

	while var_16_2 > 0 do
		var_16_1.fontSize = var_16_2

		local var_16_5 = splitByWordEN(arg_16_1, arg_16_0)

		var_16_1.text = tostring(var_16_5)

		if var_16_3 >= var_16_1.preferredWidth and var_16_4 >= var_16_1.preferredHeight then
			break
		end

		var_16_2 = var_16_2 - 1
	end
end

function setTextFont(arg_17_0, arg_17_1)
	if not arg_17_1 then
		return
	end

	arg_17_0:GetComponent(typeof(Text)).font = arg_17_1
end

function getText(arg_18_0)
	return arg_18_0:GetComponent(typeof(Text)).text
end

function setInputText(arg_19_0, arg_19_1)
	if not arg_19_1 then
		return
	end

	arg_19_0:GetComponent(typeof(InputField)).text = arg_19_1
end

function getInputText(arg_20_0)
	return arg_20_0:GetComponent(typeof(InputField)).text
end

function onInputEndEdit(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_1:GetComponent(typeof(InputField)).onEndEdit

	pg.DelegateInfo.Add(arg_21_0, var_21_0)
	var_21_0:RemoveAllListeners()
	var_21_0:AddListener(arg_21_2)
end

function activateInputField(arg_22_0)
	arg_22_0:GetComponent(typeof(InputField)):ActivateInputField()
end

function setButtonText(arg_23_0, arg_23_1, arg_23_2)
	setWidgetText(arg_23_0, arg_23_1, arg_23_2)
end

function setWidgetText(arg_24_0, arg_24_1, arg_24_2)
	arg_24_2 = arg_24_2 or "Text"
	arg_24_2 = findTF(arg_24_0, arg_24_2)

	setText(arg_24_2, arg_24_1)
end

function setWidgetTextEN(arg_25_0, arg_25_1, arg_25_2)
	arg_25_2 = arg_25_2 or "Text"
	arg_25_2 = findTF(arg_25_0, arg_25_2)

	setTextEN(arg_25_2, arg_25_1)
end

local var_0_0
local var_0_1 = true
local var_0_2 = -1

function onButton(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = GetOrAddComponent(arg_26_1, typeof(Button))

	assert(var_26_0, "could not found Button component on " .. arg_26_1.name)
	assert(arg_26_2, "callback should exist")

	local var_26_1 = var_26_0.onClick

	pg.DelegateInfo.Add(arg_26_0, var_26_1)
	var_26_1:RemoveAllListeners()
	var_26_1:AddListener(function()
		if var_0_2 == Time.frameCount and Input.touchCount > 1 then
			return
		end

		var_0_2 = Time.frameCount

		if arg_26_3 and var_0_1 then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_26_3)
		end

		arg_26_2()
	end)
end

function removeOnButton(arg_28_0)
	local var_28_0 = arg_28_0:GetComponent(typeof(Button))

	if var_28_0 ~= nil then
		var_28_0.onClick:RemoveAllListeners()
	end
end

function removeAllOnButton(arg_29_0)
	local var_29_0 = arg_29_0:GetComponentsInChildren(typeof(Button)):ToTable()

	for iter_29_0, iter_29_1 in ipairs(var_29_0) do
		if iter_29_1 ~= nil then
			iter_29_1.onClick:RemoveAllListeners()
		end
	end
end

function ClearAllText(arg_30_0)
	local var_30_0 = arg_30_0:GetComponentsInChildren(typeof(Text)):ToTable()

	for iter_30_0, iter_30_1 in ipairs(var_30_0) do
		if iter_30_1 ~= nil then
			iter_30_1.text = ""
		end
	end
end

function onLongPressTrigger(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = GetOrAddComponent(arg_31_1, typeof(UILongPressTrigger))

	assert(var_31_0, "could not found UILongPressTrigger component on " .. arg_31_1.name)
	assert(arg_31_2, "callback should exist")

	local var_31_1 = var_31_0.onLongPressed

	pg.DelegateInfo.Add(arg_31_0, var_31_1)
	var_31_1:RemoveAllListeners()
	var_31_1:AddListener(function()
		if arg_31_3 then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_31_3)
		end

		arg_31_2()
	end)
end

function removeOnLongPressTrigger(arg_33_0)
	local var_33_0 = arg_33_0:GetComponent(typeof(UILongPressTrigger))

	if var_33_0 ~= nil then
		var_33_0.onLongPressed:RemoveAllListeners()
	end
end

function setButtonEnabled(arg_34_0, arg_34_1)
	GetComponent(arg_34_0, typeof(Button)).interactable = arg_34_1
end

function setToggleEnabled(arg_35_0, arg_35_1)
	GetComponent(arg_35_0, typeof(Toggle)).interactable = arg_35_1
end

function setSliderEnable(arg_36_0, arg_36_1)
	GetComponent(arg_36_0, typeof(Slider)).interactable = arg_36_1
end

function triggerButton(arg_37_0)
	local var_37_0 = GetComponent(arg_37_0, typeof(Button))

	var_0_1 = false
	var_0_2 = -1

	var_37_0.onClick:Invoke()

	var_0_1 = true
end

local var_0_3 = true

function onToggle(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	local var_38_0 = GetComponent(arg_38_1, typeof(Toggle))

	assert(arg_38_2, "callback should exist")

	local var_38_1 = var_38_0.onValueChanged

	var_38_1:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_38_0, var_38_1)
	var_38_1:AddListener(function(arg_39_0)
		if var_0_3 then
			if arg_39_0 and arg_38_3 and var_38_0.isOn == arg_39_0 then
				arg_38_3 = SFX_UI_TAG

				pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_38_3)
			elseif not arg_39_0 and arg_38_4 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_38_4)
			end
		end

		arg_38_2(arg_39_0)
	end)

	local var_38_2 = GetComponent(arg_38_1, typeof(UIToggleEvent))

	if not IsNil(var_38_2) then
		var_38_2:Rebind()
	end
end

function removeOnToggle(arg_40_0)
	local var_40_0 = GetComponent(arg_40_0, typeof(Toggle))

	if var_40_0 ~= nil then
		var_40_0.onValueChanged:RemoveAllListeners()
	end
end

function triggerToggle(arg_41_0, arg_41_1)
	local var_41_0 = GetComponent(arg_41_0, typeof(Toggle))

	var_0_3 = false
	arg_41_1 = tobool(arg_41_1)

	if var_41_0.isOn ~= arg_41_1 then
		var_41_0.isOn = arg_41_1
	else
		var_41_0.onValueChanged:Invoke(arg_41_1)
	end

	var_0_3 = true
end

function triggerToggleWithoutNotify(arg_42_0, arg_42_1)
	local var_42_0 = GetComponent(arg_42_0, typeof(Toggle))

	var_0_3 = false
	arg_42_1 = tobool(arg_42_1)

	LuaHelper.ChangeToggleValueWithoutNotify(var_42_0, arg_42_1)

	var_0_3 = true
end

function onSlider(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = GetComponent(arg_43_1, typeof(Slider)).onValueChanged

	assert(arg_43_2, "callback should exist")
	var_43_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_43_0, var_43_0)
	var_43_0:AddListener(arg_43_2)
end

function setSlider(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = GetComponent(arg_44_0, typeof(Slider))

	assert(var_44_0, "slider should exist")

	var_44_0.minValue = arg_44_1
	var_44_0.maxValue = arg_44_2
	var_44_0.value = arg_44_3
end

function eachChild(arg_45_0, arg_45_1)
	local var_45_0 = tf(arg_45_0)

	for iter_45_0 = var_45_0.childCount - 1, 0, -1 do
		arg_45_1(var_45_0:GetChild(iter_45_0), iter_45_0)
	end
end

function removeAllChildren(arg_46_0)
	eachChild(arg_46_0, function(arg_47_0)
		tf(arg_47_0).transform:SetParent(nil, false)
		Destroy(arg_47_0)
	end)
end

function scrollTo(arg_48_0, arg_48_1, arg_48_2)
	Canvas.ForceUpdateCanvases()

	local var_48_0 = GetComponent(arg_48_0, typeof(ScrollRect))
	local var_48_1 = Vector2(arg_48_1 or var_48_0.normalizedPosition.x, arg_48_2 or var_48_0.normalizedPosition.y)

	onNextTick(function()
		if not IsNil(arg_48_0) then
			var_48_0.normalizedPosition = var_48_1

			var_48_0.onValueChanged:Invoke(var_48_1)
		end
	end)
end

function scrollToBottom(arg_50_0)
	scrollTo(arg_50_0, 0, 0)
end

function onScroll(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = GetComponent(arg_51_1, typeof(ScrollRect)).onValueChanged

	assert(arg_51_2, "callback should exist")
	var_51_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_51_0, var_51_0)
	var_51_0:AddListener(arg_51_2)
end

function ClearEventTrigger(arg_52_0)
	arg_52_0:RemovePointClickFunc()
	arg_52_0:RemovePointDownFunc()
	arg_52_0:RemovePointEnterFunc()
	arg_52_0:RemovePointExitFunc()
	arg_52_0:RemovePointUpFunc()
	arg_52_0:RemoveCheckDragFunc()
	arg_52_0:RemoveBeginDragFunc()
	arg_52_0:RemoveDragFunc()
	arg_52_0:RemoveDragEndFunc()
	arg_52_0:RemoveDropFunc()
	arg_52_0:RemoveScrollFunc()
	arg_52_0:RemoveSelectFunc()
	arg_52_0:RemoveUpdateSelectFunc()
	arg_52_0:RemoveMoveFunc()
end

function ClearLScrollrect(arg_53_0)
	if not arg_53_0 then
		return
	end

	arg_53_0.onStart = nil
	arg_53_0.onInitItem = nil
	arg_53_0.onUpdateItem = nil
	arg_53_0.onReturnItem = nil
end

function GetComponent(arg_54_0, arg_54_1)
	return (arg_54_0:GetComponent(arg_54_1))
end

function GetOrAddComponent(arg_55_0, arg_55_1)
	assert(arg_55_0, "objectOrTransform not found: " .. debug.traceback())

	local var_55_0 = arg_55_1

	if type(arg_55_1) == "string" then
		assert(_G[arg_55_1], arg_55_1 .. " not exist in Global")

		var_55_0 = typeof(_G[arg_55_1])
	end

	return LuaHelper.GetOrAddComponentForLua(arg_55_0, var_55_0)
end

function RemoveComponent(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:GetComponent(arg_56_1)

	if var_56_0 then
		Object.Destroy(var_56_0)
	end
end

function SetComponentEnabled(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = arg_57_0:GetComponent(arg_57_1)

	assert(var_57_0, "compoment not found")

	var_57_0.enabled = tobool(arg_57_2)
end

SetCompomentEnabled = SetComponentEnabled

function GetInChildren(arg_58_0, arg_58_1)
	local function var_58_0(arg_59_0, arg_59_1)
		if not arg_59_0 then
			return nil
		end

		if arg_59_0.name == arg_59_1 then
			return arg_59_0
		end

		for iter_59_0 = 0, arg_59_0.childCount - 1 do
			local var_59_0 = arg_59_0:GetChild(iter_59_0)

			if arg_59_1 == var_59_0.name then
				return var_59_0
			end

			local var_59_1 = var_58_0(var_59_0, arg_59_1)

			if var_59_1 then
				return var_59_1
			end
		end

		return nil
	end

	return var_58_0(arg_58_0, arg_58_1)
end

function onNextTick(arg_60_0)
	FrameTimer.New(arg_60_0, 1, 1):Start()
end

function onDelayTick(arg_61_0, arg_61_1)
	Timer.New(arg_61_0, arg_61_1, 1):Start()
end

function seriesAsync(arg_62_0, arg_62_1, ...)
	local var_62_0 = 0
	local var_62_1 = #arg_62_0
	local var_62_2

	local function var_62_3(...)
		var_62_0 = var_62_0 + 1

		if var_62_0 <= var_62_1 then
			arg_62_0[var_62_0](var_62_3, ...)
		elseif var_62_0 == var_62_1 + 1 and arg_62_1 then
			arg_62_1(...)
		end
	end

	var_62_3(...)
end

function seriesAsyncExtend(arg_64_0, arg_64_1, ...)
	local var_64_0

	local function var_64_1(...)
		if #arg_64_0 > 0 then
			table.remove(arg_64_0, 1)(var_64_1, ...)
		elseif arg_64_1 then
			arg_64_1(...)
		end
	end

	var_64_1(...)
end

function parallelAsync(arg_66_0, arg_66_1)
	local var_66_0 = #arg_66_0

	local function var_66_1()
		var_66_0 = var_66_0 - 1

		if var_66_0 == 0 and arg_66_1 then
			arg_66_1()
		end
	end

	if var_66_0 > 0 then
		for iter_66_0, iter_66_1 in ipairs(arg_66_0) do
			iter_66_1(var_66_1)
		end
	elseif arg_66_1 then
		arg_66_1()
	end
end

function limitedParallelAsync(arg_68_0, arg_68_1, arg_68_2)
	local var_68_0 = #arg_68_0
	local var_68_1 = var_68_0

	if var_68_1 == 0 then
		arg_68_2()

		return
	end

	local var_68_2 = math.min(arg_68_1, var_68_0)
	local var_68_3

	local function var_68_4()
		var_68_1 = var_68_1 - 1

		if var_68_1 == 0 then
			arg_68_2()
		elseif var_68_2 + 1 <= var_68_0 then
			var_68_2 = var_68_2 + 1

			arg_68_0[var_68_2](var_68_4)
		end
	end

	for iter_68_0 = 1, var_68_2 do
		arg_68_0[iter_68_0](var_68_4)
	end
end

function waitUntil(arg_70_0, arg_70_1)
	local var_70_0

	var_70_0 = FrameTimer.New(function()
		if arg_70_0() then
			arg_70_1()
			var_70_0:Stop()

			return
		end
	end, 1, -1)

	var_70_0:Start()

	return var_70_0
end

function setImageSprite(arg_72_0, arg_72_1, arg_72_2)
	if IsNil(arg_72_0) then
		assert(false)

		return
	end

	local var_72_0 = GetComponent(arg_72_0, typeof(Image))

	if IsNil(var_72_0) then
		return
	end

	var_72_0.sprite = arg_72_1

	if arg_72_2 then
		var_72_0:SetNativeSize()
	end
end

function clearImageSprite(arg_73_0)
	GetComponent(arg_73_0, typeof(Image)).sprite = nil
end

function getImageSprite(arg_74_0)
	local var_74_0 = GetComponent(arg_74_0, typeof(Image))

	return var_74_0 and var_74_0.sprite
end

function tex2sprite(arg_75_0)
	return UnityEngine.Sprite.Create(arg_75_0, UnityEngine.Rect.New(0, 0, arg_75_0.width, arg_75_0.height), Vector2(0.5, 0.5), 100)
end

function setFillAmount(arg_76_0, arg_76_1)
	GetComponent(arg_76_0, typeof(Image)).fillAmount = arg_76_1
end

function string2vector3(arg_77_0)
	local var_77_0 = string.split(arg_77_0, ",")

	return Vector3(var_77_0[1], var_77_0[2], var_77_0[3])
end

function getToggleState(arg_78_0)
	return arg_78_0:GetComponent(typeof(Toggle)).isOn
end

function setLocalPosition(arg_79_0, arg_79_1)
	local var_79_0 = tf(arg_79_0).localPosition

	arg_79_1.x = arg_79_1.x or var_79_0.x
	arg_79_1.y = arg_79_1.y or var_79_0.y
	arg_79_1.z = arg_79_1.z or var_79_0.z
	tf(arg_79_0).localPosition = arg_79_1
end

function setAnchoredPosition(arg_80_0, arg_80_1)
	local var_80_0 = rtf(arg_80_0)
	local var_80_1 = var_80_0.anchoredPosition

	arg_80_1.x = arg_80_1.x or var_80_1.x
	arg_80_1.y = arg_80_1.y or var_80_1.y
	var_80_0.anchoredPosition = arg_80_1
end

function setAnchoredPosition3D(arg_81_0, arg_81_1)
	local var_81_0 = rtf(arg_81_0)
	local var_81_1 = var_81_0.anchoredPosition3D

	arg_81_1.x = arg_81_1.x or var_81_1.x
	arg_81_1.y = arg_81_1.y or var_81_1.y
	arg_81_1.z = arg_81_1.y or var_81_1.z
	var_81_0.anchoredPosition3D = arg_81_1
end

function getAnchoredPosition(arg_82_0)
	return rtf(arg_82_0).anchoredPosition
end

function setLocalScale(arg_83_0, arg_83_1)
	local var_83_0 = tf(arg_83_0).localScale

	arg_83_1.x = arg_83_1.x or var_83_0.x
	arg_83_1.y = arg_83_1.y or var_83_0.y
	arg_83_1.z = arg_83_1.z or var_83_0.z
	tf(arg_83_0).localScale = arg_83_1
end

function setLocalRotation(arg_84_0, arg_84_1)
	local var_84_0 = tf(arg_84_0).localRotation

	arg_84_1.x = arg_84_1.x or var_84_0.x
	arg_84_1.y = arg_84_1.y or var_84_0.y
	arg_84_1.z = arg_84_1.z or var_84_0.z
	tf(arg_84_0).localRotation = arg_84_1
end

function setLocalEulerAngles(arg_85_0, arg_85_1)
	local var_85_0 = tf(arg_85_0).localEulerAngles

	arg_85_1.x = arg_85_1.x or var_85_0.x
	arg_85_1.y = arg_85_1.y or var_85_0.y
	arg_85_1.z = arg_85_1.z or var_85_0.z
	tf(arg_85_0).localEulerAngles = arg_85_1
end

function ActivateInputField(arg_86_0)
	GetComponent(arg_86_0, typeof(InputField)):ActivateInputField()
end

function onInputChanged(arg_87_0, arg_87_1, arg_87_2)
	local var_87_0 = GetComponent(arg_87_1, typeof(InputField)).onValueChanged

	var_87_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_87_0, var_87_0)
	var_87_0:AddListener(arg_87_2)
end

function getImageColor(arg_88_0)
	return GetComponent(arg_88_0, typeof(Image)).color
end

function setImageColor(arg_89_0, arg_89_1)
	GetComponent(arg_89_0, typeof(Image)).color = arg_89_1
end

function getImageAlpha(arg_90_0)
	return GetComponent(arg_90_0, typeof(Image)).color.a
end

function setImageAlpha(arg_91_0, arg_91_1)
	local var_91_0 = GetComponent(arg_91_0, typeof(Image))
	local var_91_1 = var_91_0.color

	var_91_1.a = arg_91_1
	var_91_0.color = var_91_1
end

function getImageRaycastTarget(arg_92_0)
	return GetComponent(arg_92_0, typeof(Image)).raycastTarget
end

function setImageRaycastTarget(arg_93_0, arg_93_1)
	GetComponent(arg_93_0, typeof(Image)).raycastTarget = tobool(arg_93_1)
end

function getCanvasGroupAlpha(arg_94_0)
	return GetOrAddComponent(arg_94_0, typeof(CanvasGroup)).alpha
end

function setCanvasGroupAlpha(arg_95_0, arg_95_1)
	GetOrAddComponent(arg_95_0, typeof(CanvasGroup)).alpha = arg_95_1
end

function setActiveByCanvasGroup(arg_96_0, arg_96_1)
	local var_96_0 = GetOrAddComponent(arg_96_0, typeof(CanvasGroup))

	var_96_0.alpha = arg_96_1 and 1 or 0
	var_96_0.blocksRaycasts = arg_96_1
end

function setActiveViaLayer(arg_97_0, arg_97_1)
	HotfixHelper.SetUIActiveViaLayer(go(arg_97_0), arg_97_1)
end

function getTextColor(arg_98_0)
	return GetComponent(arg_98_0, typeof(Text)).color
end

function setTextColor(arg_99_0, arg_99_1)
	GetComponent(arg_99_0, typeof(Text)).color = arg_99_1
end

function getTextAlpha(arg_100_0)
	return GetComponent(arg_100_0, typeof(Text)).color.a
end

function setTextAlpha(arg_101_0, arg_101_1)
	local var_101_0 = GetComponent(arg_101_0, typeof(Text))
	local var_101_1 = var_101_0.color

	var_101_1.a = arg_101_1
	var_101_0.color = var_101_1
end

function setSizeDelta(arg_102_0, arg_102_1)
	local var_102_0 = GetComponent(arg_102_0, typeof(RectTransform))

	if not var_102_0 then
		return
	end

	local var_102_1 = var_102_0.sizeDelta

	var_102_1.x = arg_102_1.x or var_102_1.x
	var_102_1.y = arg_102_1.y or var_102_1.y
	var_102_0.sizeDelta = var_102_1
end

function getOutlineColor(arg_103_0)
	return GetComponent(arg_103_0, typeof(Outline)).effectColor
end

function setOutlineColor(arg_104_0, arg_104_1)
	GetComponent(arg_104_0, typeof(Outline)).effectColor = arg_104_1
end

function pressPersistTrigger(arg_105_0, arg_105_1, arg_105_2, arg_105_3, arg_105_4, arg_105_5, arg_105_6, arg_105_7)
	arg_105_6 = defaultValue(arg_105_6, 0.25)

	assert(arg_105_6 > 0, "maxSpeed less than zero")
	assert(arg_105_0, "should exist objectOrTransform")

	local var_105_0 = GetOrAddComponent(arg_105_0, typeof(EventTriggerListener))

	assert(arg_105_2, "should exist callback")

	local var_105_1

	local function var_105_2()
		if var_105_1 then
			var_105_1:Stop()

			var_105_1 = nil

			existCall(arg_105_3)
		end
	end

	var_105_0:AddPointDownFunc(function()
		var_105_1 = Timer.New(function()
			if arg_105_5 then
				local var_108_0 = math.max(var_105_1.duration - arg_105_1 / 10, arg_105_6)

				var_105_1.duration = var_108_0
			end

			existCall(arg_105_2, var_105_2)
		end, arg_105_1, -1)

		var_105_1:Start()

		if arg_105_4 then
			var_105_1.func()
		end

		if arg_105_7 and var_0_1 then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_105_7)
		end
	end)
	var_105_0:AddPointUpFunc(var_105_2)

	return var_105_0
end

function getSpritePivot(arg_109_0)
	local var_109_0 = arg_109_0.bounds
	local var_109_1 = -var_109_0.center.x / var_109_0.extents.x / 2 + 0.5
	local var_109_2 = -var_109_0.center.y / var_109_0.extents.y / 2 + 0.5

	return Vector2(var_109_1, var_109_2)
end

function resetAspectRatio(arg_110_0)
	local var_110_0 = GetComponent(arg_110_0, "Image")

	GetComponent(arg_110_0, "AspectRatioFitter").aspectRatio = var_110_0.preferredWidth / var_110_0.preferredHeight
end

function cloneTplTo(arg_111_0, arg_111_1, arg_111_2)
	local var_111_0 = tf(Instantiate(arg_111_0))

	var_111_0:SetParent(tf(arg_111_1), false)
	SetActive(var_111_0, true)

	if arg_111_2 then
		var_111_0.name = arg_111_2
	end

	return var_111_0
end

function setGray(arg_112_0, arg_112_1, arg_112_2)
	if arg_112_1 then
		local var_112_0 = GetOrAddComponent(arg_112_0, "UIGrayScale")

		var_112_0.Recursive = defaultValue(arg_112_2, true)
		var_112_0.enabled = true
	else
		RemoveComponent(arg_112_0, "UIGrayScale")
	end
end

function setBlackMask(arg_113_0, arg_113_1, arg_113_2)
	if arg_113_1 then
		arg_113_2 = arg_113_2 or {}

		local var_113_0 = GetOrAddComponent(arg_113_0, "UIMaterialAdjuster")

		var_113_0.Recursive = tobool(defaultValue(arg_113_2.recursive, true))

		local var_113_1 = Material.New(pg.ShaderMgr.GetInstance():GetShader("M02/Unlit Colored_Alpha_UI"))

		var_113_1:SetColor("_Color", arg_113_2.color or Color(0, 0, 0, 0.2))

		var_113_0.adjusterMaterial = var_113_1
		var_113_0.enabled = true
	else
		RemoveComponent(arg_113_0, "UIMaterialAdjuster")
	end
end

function blockBlackMask(arg_114_0, arg_114_1, arg_114_2)
	if arg_114_1 then
		local var_114_0 = GetOrAddComponent(arg_114_0, "UIMaterialAdjuster")

		var_114_0.Recursive = tobool(defaultValue(arg_114_2, true))
		var_114_0.enabled = false
	else
		RemoveComponent(arg_114_0, "UIMaterialAdjuster")
	end
end

function long2int(arg_115_0)
	local var_115_0, var_115_1 = int64.tonum2(arg_115_0)

	return var_115_0
end

function OnSliderWithButton(arg_116_0, arg_116_1, arg_116_2)
	local var_116_0 = arg_116_1:GetComponent("Slider")

	var_116_0.onValueChanged:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_116_0, var_116_0.onValueChanged)
	var_116_0.onValueChanged:AddListener(arg_116_2)

	local var_116_1 = (var_116_0.maxValue - var_116_0.minValue) * 0.1

	onButton(arg_116_0, arg_116_1:Find("up"), function()
		var_116_0.value = math.clamp(var_116_0.value + var_116_1, var_116_0.minValue, var_116_0.maxValue)
	end, SFX_PANEL)
	onButton(arg_116_0, arg_116_1:Find("down"), function()
		var_116_0.value = math.clamp(var_116_0.value - var_116_1, var_116_0.minValue, var_116_0.maxValue)
	end, SFX_PANEL)
end

function addSlip(arg_119_0, arg_119_1, arg_119_2, arg_119_3, arg_119_4)
	local var_119_0 = GetOrAddComponent(arg_119_1, "EventTriggerListener")
	local var_119_1
	local var_119_2 = 0
	local var_119_3 = 50

	var_119_0:AddPointDownFunc(function()
		var_119_2 = 0
		var_119_1 = nil
	end)
	var_119_0:AddDragFunc(function(arg_121_0, arg_121_1)
		local var_121_0 = arg_121_1.position

		if not var_119_1 then
			var_119_1 = var_121_0
		end

		if arg_119_0 == SLIP_TYPE_HRZ then
			var_119_2 = var_121_0.x - var_119_1.x
		elseif arg_119_0 == SLIP_TYPE_VERT then
			var_119_2 = var_121_0.y - var_119_1.y
		end
	end)
	var_119_0:AddPointUpFunc(function(arg_122_0, arg_122_1)
		if var_119_2 < -var_119_3 then
			if arg_119_3 then
				arg_119_3()
			end
		elseif var_119_2 > var_119_3 then
			if arg_119_2 then
				arg_119_2()
			end
		elseif arg_119_4 then
			arg_119_4()
		end
	end)
end

function getSizeRate()
	local var_123_0 = pg.UIMgr.GetInstance().LevelMain.transform.rect
	local var_123_1 = UnityEngine.Screen

	return Vector2.New(var_123_0.width / var_123_1.width, var_123_0.height / var_123_1.height), var_123_0.width, var_123_0.height
end

function IsUsingWifi()
	return Application.internetReachability == UnityEngine.NetworkReachability.ReachableViaLocalAreaNetwork
end

function getSceneRootTFDic(arg_125_0)
	local var_125_0 = {}

	for iter_125_0, iter_125_1 in ipairs(arg_125_0:GetRootGameObjects():ToTable()) do
		var_125_0[iter_125_1.name] = iter_125_1.transform
	end

	return var_125_0
end

function bindComponent(arg_126_0, arg_126_1)
	local var_126_0 = GetComponent(arg_126_1, "ComponentBinding")

	if var_126_0 == nil then
		return
	end

	local var_126_1 = var_126_0:GetLuaNames():ToTable()
	local var_126_2 = var_126_0:GetComponentValues():ToTable()

	for iter_126_0, iter_126_1 in ipairs(var_126_1) do
		arg_126_0[iter_126_1] = var_126_2[iter_126_0]
	end
end
