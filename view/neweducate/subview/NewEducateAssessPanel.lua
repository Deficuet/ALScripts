local var_0_0 = class("NewEducateAssessPanel", import("view.base.BaseSubView"))

var_0_0.CRIT_PERCENT = 200
var_0_0.SPEED = 3

function var_0_0.getUIName(arg_1_0)
	return "NewEducateAssessPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.rootTF = arg_2_0._tf:Find("root")
	arg_2_0.assessTF = arg_2_0.rootTF:Find("assess")
	arg_2_0.bgTF = arg_2_0.assessTF:Find("bg")
	arg_2_0.damageBlood = arg_2_0.assessTF:Find("content/blood/red")
	arg_2_0.bossTF = arg_2_0.assessTF:Find("content/boss")
	arg_2_0.roleTF = arg_2_0.assessTF:Find("content/role")
	arg_2_0.damageTF = arg_2_0.assessTF:Find("content/damage")
	arg_2_0.damageCritTF = arg_2_0.assessTF:Find("content/damage_crit")

	local var_2_0 = arg_2_0.assessTF:Find("content/attrs")

	arg_2_0.attrUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))
	arg_2_0.resultTF = arg_2_0.assessTF:Find("content/result")
	arg_2_0.rankTF = arg_2_0.resultTF:Find("rank")
	arg_2_0.tipTF = arg_2_0.rootTF:Find("tip")
	arg_2_0.assessTextTF = arg_2_0.tipTF:Find("content/assess/Text")
	arg_2_0.targetTextTF = arg_2_0.tipTF:Find("content/target/Text")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:AdjustSpeed()
	end, SFX_PANEL)
	arg_3_0.attrUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			local var_5_0 = arg_3_0.attrIds[arg_5_1 + 1]

			arg_5_2.name = var_5_0

			local var_5_1 = pg.child2_attr[var_5_0].icon

			LoadImageSpriteAtlasAsync("ui/neweducateassesspanel_atlas", var_5_1, arg_5_2)
			LoadImageSpriteAtlasAsync("ui/neweducateassesspanel_atlas", var_5_1 .. "_l", arg_5_2:Find("selected"))
		elseif arg_5_0 == UIItemList.EventUpdate then
			local var_5_2 = arg_3_0.attrIds[arg_5_1 + 1]

			setActive(arg_5_2:Find("selected"), arg_3_0.curAttrIdx == arg_5_1 + 1)
			setText(arg_5_2:Find("value"), arg_3_0.contextData.char:GetAttr(var_5_2))

			local var_5_3 = arg_3_0.curAttrIdx == arg_5_1 + 1 and "47b9f4" or "6f6f82"

			setTextColor(arg_5_2:Find("value"), Color.NewHex(var_5_3))
		end
	end)
end

function var_0_0.Show(arg_6_0, arg_6_1)
	var_0_0.super.Show(arg_6_0)

	arg_6_0.callback = arg_6_1

	arg_6_0:OverlayPanel(arg_6_0._tf, {
		groupDelta = 1
	})
	arg_6_0:InitData()
	arg_6_0:InitStaticUI()
	arg_6_0:PlayAnim()
end

function var_0_0.InitData(arg_7_0)
	arg_7_0.speed = 1

	local var_7_0 = arg_7_0.contextData.char:GetRoundData()
	local var_7_1 = pg.child2_target[var_7_0:getConfig("target_id")]

	arg_7_0.rank = var_7_1.display[arg_7_0.contextData.char:GetAssessRankIdx()]
	arg_7_0.totolHP = var_7_1.attr_sum
	arg_7_0.damageHP = 0
	arg_7_0.attrIds = arg_7_0.contextData.char:GetAttrIds()
	arg_7_0.curAttrIdx = 1
	arg_7_0.tag = arg_7_0.contextData.char:GetPersonalityTag()
	arg_7_0.charConfig = arg_7_0.contextData.char:getConfig("spine_char")
	arg_7_0.standardValue = arg_7_0.totolHP / #arg_7_0.attrIds

	local var_7_2 = arg_7_0.contextData.char:getConfig("exam_action")[arg_7_0.tag]

	arg_7_0.actionConfig = {}

	underscore.each(var_7_2, function(arg_8_0)
		table.insert(arg_7_0.actionConfig, {
			value = arg_7_0.standardValue * arg_8_0[1] / 100,
			name = arg_8_0[2]
		})
	end)
	table.sort(arg_7_0.actionConfig, CompareFuncs({
		function(arg_9_0)
			return -arg_9_0.value
		end
	}))

	local var_7_3, var_7_4, var_7_5 = var_7_0:GetProgressInfo()

	setText(arg_7_0.assessTextTF, i18n("child2_assess_start_tip"))
	setText(arg_7_0.targetTextTF, i18n("child2_assess_tip_target", var_7_5))
end

function var_0_0.GetAtkActionName(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.actionConfig) do
		if arg_10_1 > iter_10_1.value then
			return iter_10_1.name
		end
	end

	return arg_10_0.actionConfig[#arg_10_0.actionConfig].name
end

function var_0_0.InitStaticUI(arg_11_0)
	LoadImageSpriteAtlasAsync("ui/neweducateassesspanel_atlas", "bg_" .. arg_11_0.tag, arg_11_0.bgTF)
	removeAllChildren(arg_11_0.bossTF)
	removeAllChildren(arg_11_0.roleTF)
	setActive(arg_11_0.resultTF, false)
	setActive(arg_11_0.damageTF, false)
	setActive(arg_11_0.damageCritTF, false)
	setActive(arg_11_0.resultTF:Find("title_gold"), arg_11_0.rank == "S")
	setActive(arg_11_0.resultTF:Find("title_red"), arg_11_0.rank ~= "S")
	LoadImageSpriteAtlasAsync("ui/neweducateassesspanel_atlas", arg_11_0.rank, arg_11_0.rankTF)
	setFillAmount(arg_11_0.damageBlood, 0)
	table.sort(arg_11_0.attrIds)
	arg_11_0.attrUIList:align(#arg_11_0.attrIds)
end

function var_0_0.ShowResult(arg_12_0)
	setActive(arg_12_0.resultTF, true)

	local var_12_0 = arg_12_0.contextData.char:GetAssessRankIdx()

	arg_12_0:emit(NewEducateMainMediator.ON_SET_ASSESS_RANK, var_12_0, function()
		existCall(arg_12_0.callback)
	end)
end

function var_0_0.PlayAnim(arg_14_0)
	seriesAsync({
		function(arg_15_0)
			arg_14_0:ShowTip(arg_15_0)
		end,
		function(arg_16_0)
			arg_14_0:LoadChar(arg_16_0)
		end,
		function(arg_17_0)
			arg_14_0:CheckGuide(arg_17_0)
		end,
		function(arg_18_0)
			arg_14_0:PlayOneATK(arg_18_0)
		end
	}, function()
		arg_14_0:ShowResult()
	end)
end

function var_0_0.ShowTip(arg_20_0, arg_20_1)
	setActive(arg_20_0.assessTF, false)
	setActive(arg_20_0.tipTF, true)
	onDelayTick(function()
		setActive(arg_20_0.tipTF, false)
		setActive(arg_20_0.assessTF, true)
		arg_20_1()
	end, 1)
end

function var_0_0.CheckGuide(arg_22_0, arg_22_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed("tb2_12") then
		arg_22_1(arg_22_1)
	else
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = "tb2_12"
		})
		pg.NewGuideMgr.GetInstance():Play("tb2_12", {}, arg_22_1, arg_22_1)
	end
end

function var_0_0.LoadChar(arg_23_0, arg_23_1)
	pg.UIMgr.GetInstance():LoadingOn()
	seriesAsync({
		function(arg_24_0)
			PoolMgr.GetInstance():GetSpineChar(arg_23_0.charConfig.boss, true, function(arg_25_0)
				arg_23_0.bossName = arg_23_0.charConfig.boss
				arg_23_0.bossModel = arg_25_0
				tf(arg_25_0).localScale = Vector3(1, 1, 1)

				arg_25_0:GetComponent("SpineAnimUI"):SetAction("child2_boss_normal", 0)
				setParent(arg_25_0, arg_23_0.bossTF)
				arg_24_0()
			end)
		end,
		function(arg_26_0)
			PoolMgr.GetInstance():GetSpineChar(arg_23_0.charConfig[arg_23_0.tag], true, function(arg_27_0)
				arg_23_0.roleName = arg_23_0.charConfig[arg_23_0.tag]
				arg_23_0.roleModel = arg_27_0
				tf(arg_27_0).localScale = Vector3(1, 1, 1)

				arg_27_0:GetComponent("SpineAnimUI"):SetAction(arg_23_0.roleName .. "_normal", 0)
				setParent(arg_27_0, arg_23_0.roleTF)
				arg_26_0()
			end)
		end
	}, function()
		pg.UIMgr.GetInstance():LoadingOff()
		existCall(arg_23_1)
	end)
end

function var_0_0.PlayOneATK(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.attrIds[arg_29_0.curAttrIdx]
	local var_29_1 = arg_29_0.contextData.char:GetAttr(var_29_0)

	arg_29_0.damageHP = arg_29_0.damageHP + var_29_1

	local var_29_2 = arg_29_0:GetAtkActionName(var_29_1)
	local var_29_3 = var_29_1 >= arg_29_0.standardValue * var_0_0.CRIT_PERCENT / 100 and arg_29_0.damageCritTF or arg_29_0.damageTF

	setText(var_29_3, "-" .. var_29_1)

	local var_29_4 = arg_29_0.bossModel:GetComponent(typeof(SpineAnimUI))

	var_29_4:Resume()
	var_29_4:SetAction("child2_boss_normal", 0)

	local var_29_5 = arg_29_0.roleModel:GetComponent(typeof(SpineAnimUI))

	var_29_5:SetAction(arg_29_0.roleName .. "_normal", 0)
	seriesAsync({
		function(arg_30_0)
			arg_29_0.attrUIList:align(#arg_29_0.attrIds)
			blinkAni(arg_29_0.attrUIList.container:Find(tostring(var_29_0)), 0.2 / arg_29_0.speed, 3)
			arg_29_0:managedTween(LeanTween.delayedCall, function()
				arg_30_0()
			end, 1 / arg_29_0.speed, nil)
		end,
		function(arg_32_0)
			var_29_5:SetActionCallBack(function(arg_33_0)
				if arg_33_0 == "finish" then
					arg_32_0()
					var_29_5:SetActionCallBack(nil)
					var_29_5:SetAction(arg_29_0.roleName .. "_normal", 0)
				end
			end)
			var_29_5:SetAction(var_29_2, 0)
		end,
		function(arg_34_0)
			setActive(var_29_3, true)
			setFillAmount(arg_29_0.damageBlood, math.min(arg_29_0.damageHP / arg_29_0.totolHP, 1))

			if arg_29_0.damageHP < arg_29_0.totolHP then
				var_29_4:SetActionCallBack(function(arg_35_0)
					if arg_35_0 == "finish" then
						setActive(var_29_3, false)
						arg_34_0()
						var_29_4:SetActionCallBack(nil)
						var_29_4:SetAction("child2_boss_normal", 0)
					end
				end)
				var_29_4:SetAction("child2_boss_shouji", 0)
			else
				var_29_4:SetActionCallBack(function(arg_36_0)
					if arg_36_0 == "finish" then
						setActive(var_29_3, false)
						arg_34_0()
						var_29_4:SetActionCallBack(nil)
						var_29_4:Pause()
					end
				end)
				var_29_4:SetAction("child2_boss_jidao", 0)
			end
		end
	}, function()
		if arg_29_0.damageHP >= arg_29_0.totolHP or arg_29_0.curAttrIdx == #arg_29_0.attrIds then
			arg_29_1()
		else
			arg_29_0.curAttrIdx = arg_29_0.curAttrIdx + 1

			arg_29_0:managedTween(LeanTween.delayedCall, function()
				arg_29_0:PlayOneATK(arg_29_1)
			end, 0.5 / arg_29_0.speed, nil)
		end
	end)
end

function var_0_0.AdjustSpeed(arg_39_0)
	arg_39_0.speed = var_0_0.SPEED

	if arg_39_0.bossModel then
		arg_39_0:GetAnimationState(arg_39_0.bossModel).TimeScale = arg_39_0.speed
	end

	if arg_39_0.roleModel then
		arg_39_0:GetAnimationState(arg_39_0.roleModel).TimeScale = arg_39_0.speed
	end
end

function var_0_0.GetAnimationState(arg_40_0, arg_40_1)
	return arg_40_1:GetComponent("Spine.Unity.SkeletonGraphic").AnimationState
end

function var_0_0.Hide(arg_41_0)
	arg_41_0:UnOverlayPanel(arg_41_0._tf)

	if arg_41_0.bossName and arg_41_0.bossModel then
		arg_41_0:GetAnimationState(arg_41_0.bossModel).TimeScale = 1

		PoolMgr.GetInstance():ReturnSpineChar(arg_41_0.bossName, arg_41_0.bossModel)

		arg_41_0.bossName = nil
		arg_41_0.bossModel = nil
	end

	if arg_41_0.roleName and arg_41_0.roleModel then
		arg_41_0:GetAnimationState(arg_41_0.roleModel).TimeScale = 1

		PoolMgr.GetInstance():ReturnSpineChar(arg_41_0.roleName, arg_41_0.roleModel)

		arg_41_0.roleName = nil
		arg_41_0.roleModel = nil
	end

	var_0_0.super.Hide(arg_41_0)
end

function var_0_0.OnDestroy(arg_42_0)
	return
end

return var_0_0
