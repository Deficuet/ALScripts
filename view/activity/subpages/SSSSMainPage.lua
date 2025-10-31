local var_0_0 = class("SSSSMainPage", import(".TemplatePage.PreviewTemplatePage"))
local var_0_1 = 0.45
local var_0_2 = 0.2
local var_0_3 = 1.2
local var_0_4 = "event:/ui/kaiji"

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.effectBlankScreen = arg_1_0.bg:Find("blank_screen_effect")
	arg_1_0.effectOpen = arg_1_0.bg:Find("open_effect")
	arg_1_0.effectBlink = arg_1_0.bg:Find("blink_effect")
	arg_1_0.effectClick = arg_1_0.bg:Find("click_effect")
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0.skinshopBtn = arg_2_0.btnList:Find("skinshop")

	onButton(arg_2_0, arg_2_0.skinshopBtn, function()
		arg_2_0:PlayClickEffect(arg_2_0.skinshopBtn, function()
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP)
		end)
	end, SFX_PANEL)

	arg_2_0.mountainBtn = arg_2_0.btnList:Find("mountain")

	onButton(arg_2_0, arg_2_0.mountainBtn, function()
		arg_2_0:PlayClickEffect(arg_2_0.mountainBtn, function()
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SSSS_ACADEMY)
		end)
	end, SFX_PANEL)

	arg_2_0.buildBtn = arg_2_0.btnList:Find("build")

	onButton(arg_2_0, arg_2_0.buildBtn, function()
		arg_2_0:PlayClickEffect(arg_2_0.buildBtn, function()
			arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
				projectName = BuildShipScene.PROJECTS.ACTIVITY
			})
		end)
	end, SFX_PANEL)

	arg_2_0.shopBtn = arg_2_0.btnList:Find("shop")

	onButton(arg_2_0, arg_2_0.shopBtn, function()
		arg_2_0:PlayClickEffect(arg_2_0.shopBtn, function()
			local var_10_0 = configClinet.shopLinkActID and getProxy(ActivityProxy):getActivitiesById(configClinet.shopLinkActID) or underscore.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_11_0)
				return not arg_11_0:isEnd()
			end)

			if not var_10_0 or var_10_0:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			arg_2_0:emit(ActivityMediator.GO_SHOPS_LAYER, {
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = var_10_0.id
			})
		end)
	end, SFX_PANEL)

	arg_2_0.fightBtn = arg_2_0.btnList:Find("fight")

	onButton(arg_2_0, arg_2_0.fightBtn, function()
		arg_2_0:PlayClickEffect(arg_2_0.fightBtn, function()
			arg_2_0:emit(ActivityMediator.BATTLE_OPERA)
		end)
	end, SFX_PANEL)
	arg_2_0:PlayOpenEffect()
end

function var_0_0.PlayOpenEffect(arg_14_0)
	setActive(arg_14_0.effectBlankScreen, true)
	setActive(arg_14_0.effectOpen, false)
	arg_14_0:managedTween(LeanTween.delayedCall, function()
		setActive(arg_14_0.effectOpen, true)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_4)
	end, var_0_2, nil)
	arg_14_0:managedTween(LeanTween.delayedCall, function()
		setActive(arg_14_0.effectBlankScreen, false)
	end, var_0_1, nil)
	arg_14_0:managedTween(LeanTween.delayedCall, function()
		setActive(arg_14_0.effectOpen, false)
		setActive(arg_14_0.effectBlink, true)
	end, var_0_2 + var_0_3, nil)
end

function var_0_0.PlayClickEffect(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = pg.UIMgr.GetInstance().OverlayEffect:GetChild(0)
	local var_18_1 = Vector3(192, 60, 0)
	local var_18_2 = var_18_0 and var_18_0.localPosition:Sub(var_18_1) or arg_18_1.localPosition

	setLocalPosition(arg_18_0.effectClick, var_18_2)
	setActive(arg_18_0.effectClick, true)
	arg_18_0:managedTween(LeanTween.delayedCall, function()
		setActive(arg_18_0.effectClick, false)

		if arg_18_2 then
			arg_18_2()
		end
	end, 0.3, nil)
end

function var_0_0.OnDestroy(arg_20_0)
	arg_20_0:cleanManagedTween()
end

return var_0_0
