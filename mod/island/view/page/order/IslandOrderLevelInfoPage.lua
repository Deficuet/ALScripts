local var_0_0 = class("IslandOrderLevelInfoPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandOrderLevelInfoUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.levelTxt = arg_2_0:findTF("frame/animroot/level"):GetComponent(typeof(Text))
	arg_2_0.expTr = arg_2_0:findTF("frame/animroot/slider")
	arg_2_0.expTxt = arg_2_0:findTF("frame/animroot/exp"):GetComponent(typeof(Text))
	arg_2_0.cntTxt = arg_2_0:findTF("frame/bg/Image/cnt"):GetComponent(typeof(Text))
	arg_2_0.uiItemList = UIItemList.New(arg_2_0:findTF("frame/animroot/rect/content"), arg_2_0:findTF("frame/animroot/rect/content/tpl"))
	arg_2_0.animator = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.aniDft = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
	arg_2_0.canvasGroup = GetOrAddComponent(arg_2_0._tf, typeof(CanvasGroup))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:PlayExitAnimation(function()
			arg_3_0:Hide()
		end)
	end, SFX_PANEL)
end

function var_0_0.PlayExitAnimation(arg_6_0, arg_6_1)
	arg_6_0.canvasGroup.blocksRaycasts = false

	arg_6_0.aniDft:SetEndEvent(function()
		arg_6_0.canvasGroup.blocksRaycasts = true

		if arg_6_1 then
			arg_6_1()
		end
	end)
	arg_6_0.animator:Play("anim_island_shiporder_LVinfo_out")
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0:AddListener(IslandOrderAgency.ORDER_FINISH_UPDATE, arg_8_0.OnReset)
end

function var_0_0.RemoveListener(arg_9_0)
	arg_9_0:RemoveListener(IslandOrderAgency.ORDER_FINISH_UPDATE, arg_9_0.OnReset)
end

function var_0_0.OnReset(arg_10_0)
	arg_10_0:Flush()
end

function var_0_0.Show(arg_11_0)
	var_0_0.super.Show(arg_11_0)
	arg_11_0:Flush()
end

function var_0_0.Flush(arg_12_0)
	local var_12_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_12_0:FlushLevelInfo(var_12_0)
	arg_12_0:FlushList(var_12_0)
	arg_12_0:FlushCnt(var_12_0)
end

function var_0_0.FlushCnt(arg_13_0, arg_13_1)
	arg_13_0.cntTxt.text = i18n("island_order_leftcnt_dispaly", arg_13_1:GetLeftUrgentCnt())
end

function var_0_0.FlushLevelInfo(arg_14_0, arg_14_1)
	arg_14_0.levelTxt.text = "Lv." .. arg_14_1:GetLevel()

	if arg_14_1:IsMaxLevel() then
		setSlider(arg_14_0.expTr, 0, 1, 1)

		arg_14_0.expTxt.text = "MAX"
	else
		local var_14_0 = arg_14_1:GetExp()
		local var_14_1 = math.max(1, arg_14_1:GetNextTargetExp())

		setSlider(arg_14_0.expTr, 0, 1, var_14_0 / var_14_1)

		arg_14_0.expTxt.text = "<size=60><color=#ffaf1b>" .. var_14_0 .. "</color></size><color=#979797>/" .. var_14_1 .. "</color>"
	end
end

function var_0_0.FlushList(arg_15_0, arg_15_1)
	local var_15_0 = pg.island_order_favor.all
	local var_15_1 = 1

	arg_15_0.uiItemList:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			local var_16_0 = var_15_0[arg_16_1 + 1]

			arg_15_0:UpdateCard(arg_15_1, arg_16_2, var_16_0)

			if arg_15_1:IsGotAward(var_16_0) then
				var_15_1 = arg_16_1 + 1
			end
		end
	end)
	arg_15_0.uiItemList:align(#var_15_0)
	scrollTo(arg_15_0.uiItemList.container.parent, 0, 1)
	arg_15_0:ScrollTo(var_15_1, var_15_0)
end

function var_0_0.ScrollTo(arg_17_0, arg_17_1, arg_17_2)
	onNextTick(function()
		local var_18_0 = math.min(arg_17_1, #arg_17_2 * 0.5 - 1)
		local var_18_1 = arg_17_0.uiItemList.container:GetChild(0)
		local var_18_2 = arg_17_0.uiItemList.container:GetChild(var_18_0)
		local var_18_3 = math.abs(var_18_2.localPosition.x - var_18_1.localPosition.x)
		local var_18_4 = arg_17_0.uiItemList.container.localPosition

		arg_17_0.uiItemList.container.localPosition = Vector3(var_18_4.x - var_18_3, var_18_4.y, 0)
	end)
end

function var_0_0.UpdateCard(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_0:UpdateAwards(arg_19_2, arg_19_3)

	local var_19_0 = arg_19_1:IsGotAward(arg_19_3)
	local var_19_1 = arg_19_1:CanGetAward(arg_19_3)
	local var_19_2 = var_19_1 or var_19_0

	setActive(arg_19_2:Find("got"), var_19_0)
	setActive(arg_19_2:Find("finish"), var_19_2)

	local var_19_3 = arg_19_3 < 10 and "0" .. arg_19_3 or arg_19_3

	setText(arg_19_2:Find("num"), setColorStr(var_19_3, var_19_2 and "#FFFFFF" or "#979797"))
	onButton(arg_19_0, arg_19_2, function()
		if var_19_1 and not var_19_0 then
			arg_19_0:emit(IslandMediator.ON_GET_ORDER_EXP_AWARD, arg_19_3)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateAwards(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = pg.island_order_favor[arg_21_2].award_display
	local var_21_1 = UIItemList.New(arg_21_1:Find("awards"), arg_21_1:Find("awards/IslandItemTpl"))

	var_21_1:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_21_0[arg_22_1 + 1]
			local var_22_1 = Drop.Create(var_22_0)

			updateCustomDrop(arg_22_2, var_22_1)
		end
	end)
	var_21_1:align(math.min(2, #var_21_0))
end

function var_0_0.OnDestroy(arg_23_0)
	return
end

return var_0_0
