local var_0_0 = class("TownInfoPage", import("view.base.BaseSubView"))

var_0_0.SLOT_CNT = 9

function var_0_0.getUIName(arg_1_0)
	return "TownInfoPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.togglesTF = arg_2_0:findTF("frame/toggles")

	eachChild(arg_2_0.togglesTF, function(arg_3_0)
		onToggle(arg_2_0, arg_3_0, function(arg_4_0)
			setImageColor(arg_2_0:findTF("name", arg_3_0), Color.NewHex(arg_4_0 and "F5ECDD" or "796464"))
		end, SFX_PANEL)
	end)

	arg_2_0.townTip = arg_2_0:findTF("town/tip", arg_2_0.togglesTF)
	arg_2_0.placeTip = arg_2_0:findTF("place/tip", arg_2_0.togglesTF)
	arg_2_0.shipTip = arg_2_0:findTF("ship/tip", arg_2_0.togglesTF)
	arg_2_0.townPanel = arg_2_0:findTF("frame/panels/town_panel")
	arg_2_0.townLevelNow = arg_2_0:findTF("lvmask/level_now", arg_2_0.townPanel)
	arg_2_0.townLevelNext = arg_2_0:findTF("lvmask/level_next", arg_2_0.townPanel)
	arg_2_0.curExp = arg_2_0:findTF("infos/exp/value/cur", arg_2_0.townPanel)
	arg_2_0.needExp = arg_2_0:findTF("infos/exp/value/need", arg_2_0.townPanel)
	arg_2_0.goldOutput = arg_2_0:findTF("infos/output/value", arg_2_0.townPanel)
	arg_2_0.goldLimit = arg_2_0:findTF("infos/limit/value", arg_2_0.townPanel)
	arg_2_0.townUpgradeTF = arg_2_0:findTF("upgrade_status", arg_2_0.townPanel)
	arg_2_0.shipPanel = arg_2_0:findTF("frame/panels/ship_panel")
	arg_2_0.shipUIList = UIItemList.New(arg_2_0:findTF("content", arg_2_0.shipPanel), arg_2_0:findTF("content/tpl", arg_2_0.shipPanel))

	arg_2_0.shipUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateShip(arg_5_1, arg_5_2)
		end
	end)

	arg_2_0.placePanel = arg_2_0:findTF("frame/panels/place_panel")

	setText(arg_2_0:findTF("view/content/tpl/next/title", arg_2_0.placePanel), i18n("town_place_next_title"))

	arg_2_0.placeUIList = UIItemList.New(arg_2_0:findTF("view/content", arg_2_0.placePanel), arg_2_0:findTF("view/content/tpl", arg_2_0.placePanel))

	arg_2_0.placeUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_2_0:UpdatePlace(arg_6_1, arg_6_2)
		end
	end)

	arg_2_0.specialWorkGroup = pg.gameset.activity_town_special_work.key_value
end

function var_0_0.SetActivity(arg_7_0, arg_7_1)
	arg_7_0.activity = arg_7_1 or getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN)

	assert(arg_7_0.activity and not arg_7_0.activity:isEnd(), "not exist town act, type: " .. ActivityConst.ACTIVITY_TYPE_TOWN)
end

function var_0_0.OnInit(arg_8_0)
	arg_8_0:SetActivity()

	arg_8_0.slotUnlockLv = {}

	;(function()
		for iter_9_0, iter_9_1 in ipairs(pg.activity_town_level.all) do
			local var_9_0 = pg.activity_town_level[iter_9_1].unlock_chara

			for iter_9_2 = 1, var_9_0 do
				if not arg_8_0.slotUnlockLv[iter_9_2] then
					arg_8_0.slotUnlockLv[iter_9_2] = iter_9_1
				end

				if arg_8_0.slotUnlockLv[var_0_0.SLOT_CNT] then
					return
				end
			end
		end
	end)()
	triggerToggle(arg_8_0:findTF("town", arg_8_0.togglesTF), true)
end

function var_0_0.Flush(arg_10_0)
	arg_10_0:FlushTownPanel()
	arg_10_0:FlushShipPanel()
	arg_10_0:FlushPlacePanel()
	arg_10_0:Show()
end

function var_0_0.OnExpUpdate(arg_11_0)
	local var_11_0 = arg_11_0.activity:GetExp()
	local var_11_1 = pg.activity_town_level[arg_11_0.townLv].exp

	setText(arg_11_0.curExp, var_11_0)
	setTextColor(arg_11_0.curExp, Color.NewHex(not isMaxLv and var_11_0 < var_11_1 and "CC3A33" or "63423E"))
	setText(arg_11_0.needExp, "/" .. (isMaxLv and 0 or var_11_1))
end

function var_0_0.OnTownUpgrade(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.townPanel:GetComponent(typeof(DftAniEvent))

	var_12_0:SetEndEvent(function()
		if arg_12_1 then
			arg_12_1()
		end

		arg_12_0.inTownAnim = false

		var_12_0:SetEndEvent(nil)
	end)
	var_12_0:SetTriggerEvent(function()
		arg_12_0:Flush()
		var_12_0:SetTriggerEvent(nil)
	end)
	arg_12_0.townPanel:GetComponent(typeof(Animation)):Play("anim_cowboy_info_town_lvup")

	arg_12_0.inTownAnim = true

	arg_12_0:managedTween(LeanTween.delayedCall, function()
		arg_12_0:FlushTownWithoutLv()
	end, 0.265, nil)
end

function var_0_0.OnPlaceUpgrade(arg_16_0, arg_16_1)
	arg_16_0.townUpgradeCb = arg_16_1

	arg_16_0:Flush()
end

function var_0_0.UpdateTownStatus(arg_17_0)
	local var_17_0, var_17_1, var_17_2 = arg_17_0.activity:CanUpgradeTown()

	setActive(arg_17_0.townTip, var_17_0)
	eachChild(arg_17_0.townUpgradeTF, function(arg_18_0)
		setActive(arg_18_0, arg_18_0.name == var_17_1)
	end)
	onButton(arg_17_0, arg_17_0:findTF("normal", arg_17_0.townUpgradeTF), function()
		if not var_17_0 or arg_17_0.inTownAnim then
			return
		end

		arg_17_0:emit(TownMediator.UPGRADE_TOWN)
	end, SFX_PANEL)

	if var_17_1 == "no_story" then
		setText(arg_17_0:findTF("no_story/content/value/cur", arg_17_0.townUpgradeTF), var_17_2[1])
		setText(arg_17_0:findTF("no_story/content/value/need", arg_17_0.townUpgradeTF), "/" .. var_17_2[2])
	elseif var_17_1 == "no_exp_or_gold" then
		setTextColor(arg_17_0:findTF("no_exp_or_gold/cost/Text", arg_17_0.townUpgradeTF), Color.NewHex(var_17_2 == "no_gold" and "FF756E" or "FFEBC9"))
	end
end

function var_0_0.FlushTownWithoutLv(arg_20_0)
	arg_20_0:OnExpUpdate()

	local var_20_0 = arg_20_0.activity:GetGoldOutput()

	setText(arg_20_0.goldOutput, string.format("+%s/H", TownActivity.GoldToShow(var_20_0)))

	local var_20_1 = arg_20_0.activity:GetLimitGold()

	setText(arg_20_0.goldLimit, TownActivity.GoldToShow(var_20_1))

	local var_20_2 = TownActivity.GoldToShow(pg.activity_town_level[arg_20_0.townLv].gold)

	setText(arg_20_0:findTF("normal/cost/Text", arg_20_0.townUpgradeTF), var_20_2)
	setText(arg_20_0:findTF("no_exp_or_gold/cost/Text", arg_20_0.townUpgradeTF), var_20_2)
	arg_20_0:UpdateTownStatus()
end

function var_0_0.FlushTownPanel(arg_21_0)
	arg_21_0.townLv = arg_21_0.activity:GetTownLevel()

	local var_21_0 = arg_21_0.activity:IsMaxTownLevel()

	setText(arg_21_0.townLevelNow, "LV." .. (var_21_0 and "MAX" or arg_21_0.townLv))
	setText(arg_21_0.townLevelNext, "LV." .. (var_21_0 and "MAX" or arg_21_0.townLv + 1))
	arg_21_0:FlushTownWithoutLv()
end

function var_0_0.FlushShipPanel(arg_22_0)
	arg_22_0.shipIds = arg_22_0.activity:GetShipIds()
	arg_22_0.unlockCnt = arg_22_0.activity:GetUnlockSlotCnt()

	arg_22_0.shipUIList:align(var_0_0.SLOT_CNT)
	setActive(arg_22_0.shipTip, arg_22_0.activity:HasEmptySlot())
end

function var_0_0.UpdateShip(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_1 + 1
	local var_23_1 = var_23_0 > arg_23_0.unlockCnt

	setActive(arg_23_0:findTF("lock", arg_23_2), var_23_1)

	if var_23_1 then
		setText(arg_23_0:findTF("lock/Text", arg_23_2), i18n("town_lock_level", "LV" .. arg_23_0.slotUnlockLv[var_23_0]))
	end

	local var_23_2 = arg_23_0.shipIds[var_23_0]
	local var_23_3 = not var_23_2 or var_23_2 == 0

	setActive(arg_23_0:findTF("empty", arg_23_2), var_23_3)
	setActive(arg_23_0:findTF("mask", arg_23_2), not var_23_3)

	local var_23_4

	if not var_23_3 then
		local var_23_5 = getProxy(BayProxy):RawGetShipById(var_23_2)

		if var_23_5 then
			local var_23_6 = LoadSprite("qicon/" .. var_23_5:getPainting())

			setImageSprite(arg_23_0:findTF("mask/icon", arg_23_2), var_23_6, true)
		else
			setActive(arg_23_0:findTF("empty", arg_23_2), true)
			setActive(arg_23_0:findTF("mask", arg_23_2), false)
		end
	end

	onButton(arg_23_0, arg_23_2, function()
		if var_23_1 then
			return
		end

		arg_23_0:emit(TownMediator.OPEN_CHUANWU, var_23_0, var_23_4)
	end, SFX_PANEL)
end

function var_0_0.FlushPlacePanel(arg_25_0)
	arg_25_0.placeList = arg_25_0.activity:GetPlaceList()

	table.sort(arg_25_0.placeList, CompareFuncs({
		function(arg_26_0)
			return arg_26_0:GetNextId() and 0 or 1
		end,
		function(arg_27_0)
			return arg_27_0.id
		end
	}))
	arg_25_0.placeUIList:align(#arg_25_0.placeList)
end

function var_0_0.UpdatePlaceStatus(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0:findTF("upgrade_status", arg_28_2)
	local var_28_1 = TownActivity.GoldToShow(arg_28_1:GetCostGold())

	setText(arg_28_0:findTF("normal/cost/Text", var_28_0), var_28_1)
	setText(arg_28_0:findTF("no_gold/cost/Text", var_28_0), var_28_1)

	local var_28_2, var_28_3 = arg_28_0.activity:CanUpgradePlace(arg_28_1.id)

	if var_28_2 then
		arg_28_0.isShowPlaceTip = true
	end

	eachChild(var_28_0, function(arg_29_0)
		setActive(arg_29_0, arg_29_0.name == var_28_3)
	end)
	onButton(arg_28_0, arg_28_0:findTF("normal", var_28_0), function()
		if not var_28_2 or arg_28_0.inPlaceAnim then
			return
		end

		arg_28_0.upgradePlaceName = arg_28_2.name

		arg_28_0:emit(TownMediator.UPGRADE_WORKPLACE, arg_28_1.id)
	end, SFX_PANEL)

	if var_28_3 == "no_level" then
		setText(arg_28_0:findTF("no_level/Text", var_28_0), i18n("town_lock_level", "LV" .. arg_28_1:GetNeedTownLv()))
	end
end

function var_0_0.UpdatePlace(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0.placeList[arg_31_1 + 1]

	arg_31_2.name = arg_31_1 + 1

	setImageSprite(arg_31_0:findTF("info/icon", arg_31_2), GetSpriteFromAtlas("ui/townui_atlas", var_31_0:GetIcon()), true)
	setText(arg_31_0:findTF("info/name", arg_31_2), var_31_0:GetName())
	setText(arg_31_0:findTF("info/gold/Text", arg_31_2), var_31_0:GetEffectStr())
	seriesAsync({
		function(arg_32_0)
			if arg_31_0.upgradePlaceName and arg_31_2.name == arg_31_0.upgradePlaceName then
				local var_32_0 = arg_31_2:GetComponent(typeof(DftAniEvent))

				var_32_0:SetEndEvent(function()
					if arg_31_0.townUpgradeCb then
						arg_31_0.townUpgradeCb()

						arg_31_0.townUpgradeCb = nil
					end

					arg_31_0.inPlaceAnim = false

					var_32_0:SetEndEvent(nil)
				end)
				arg_31_2:GetComponent(typeof(Animation)):Play("anim_cowboy_info_place_lvup")

				arg_31_0.inPlaceAnim = true

				arg_31_0:managedTween(LeanTween.delayedCall, function()
					arg_32_0()
				end, 0.2, nil)

				arg_31_0.upgradePlaceName = nil
			else
				arg_32_0()
			end
		end,
		function(arg_35_0)
			local var_35_0 = var_31_0:GetNextId()
			local var_35_1 = not var_35_0

			setActive(arg_31_0:findTF("next", arg_31_2), not var_35_1)

			if not var_35_1 then
				setText(arg_31_0:findTF("next/infos/exp/value", arg_31_2), "+" .. var_31_0:GetAddExp())

				local var_35_2 = TownWorkplace.New(var_35_0)

				setText(arg_31_0:findTF("next/infos/gold/value", arg_31_2), var_35_2:GetEffectStr())
			end
		end
	}, function()
		return
	end)
	setActive(arg_31_0:findTF("info/gold", arg_31_2), var_31_0:GetGroup() ~= arg_31_0.specialWorkGroup)
	setActive(arg_31_0:findTF("next/infos/gold", arg_31_2), var_31_0:GetGroup() ~= arg_31_0.specialWorkGroup)
	arg_31_0:UpdatePlaceStatus(var_31_0, arg_31_2)
end

function var_0_0.OnUpdateTime(arg_37_0)
	arg_37_0:UpdateTownStatus()

	arg_37_0.isShowPlaceTip = false

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.placeList) do
		arg_37_0:UpdatePlaceStatus(iter_37_1, arg_37_0:findTF(iter_37_0, arg_37_0.placeUIList.container))
	end

	setActive(arg_37_0.placeTip, arg_37_0.isShowPlaceTip)
end

function var_0_0.OnDestroy(arg_38_0)
	return
end

return var_0_0
