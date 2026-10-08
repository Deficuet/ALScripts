local var_0_0 = class("PrayPoolSelectPoolView", import("..base.BaseSubView"))

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"ui/prayselectpoolpage_atlas"
	}

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.getUIName(arg_2_0)
	return "PrayPoolSelectPoolView"
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:initData()
	arg_3_0:initUI()
	arg_3_0:updateUI()
end

function var_0_0.OnDestroy(arg_4_0)
	return
end

function var_0_0.OnBackPress(arg_5_0)
	return
end

function var_0_0.initData(arg_6_0)
	arg_6_0.prayProxy = getProxy(PrayProxy)
	arg_6_0.poolToggleList = {}
	arg_6_0.selectedPoolType = nil
end

function var_0_0.initUI(arg_7_0)
	arg_7_0.poolListContainer = arg_7_0._tf:Find("PoolList")
	arg_7_0.poolTpl = arg_7_0._tf:Find("PoolTpl")
	arg_7_0.preBtn = arg_7_0._tf:Find("PreBtn")
	arg_7_0.nextBtn = arg_7_0._tf:Find("NextBtn")
	arg_7_0.nextBtnCom = GetComponent(arg_7_0.nextBtn, "Button")
	arg_7_0.poolList = UIItemList.New(arg_7_0.poolListContainer, arg_7_0.poolTpl)

	arg_7_0.poolList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = arg_8_1 + 1
			local var_8_1 = arg_8_2:Find("PoolImg")

			setImageSprite(var_8_1, GetSpriteFromAtlas("ui/prayselectpoolpage_atlas", "pool" .. var_8_0))
			onToggle(arg_7_0, arg_8_2, function(arg_9_0)
				if arg_9_0 then
					arg_7_0.nextBtnCom.interactable = true
					arg_7_0.selectedPoolType = var_8_0

					arg_7_0.prayProxy:setSelectedPoolNum(var_8_0)
				else
					arg_7_0.nextBtnCom.interactable = false
					arg_7_0.selectedPoolType = nil

					arg_7_0.prayProxy:setSelectedPoolNum(nil)
				end
			end, SFX_PANEL)

			arg_7_0.poolToggleList[var_8_0] = arg_8_2
		end
	end)
	arg_7_0.poolList:align(#pg.activity_ship_create.all)

	arg_7_0.nextBtnCom.interactable = false

	onButton(arg_7_0, arg_7_0.preBtn, function()
		arg_7_0.prayProxy:updatePageState(PrayProxy.STATE_HOME)
		arg_7_0:emit(PrayPoolConst.SWITCH_TO_HOME_PAGE, PrayProxy.STATE_HOME)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.nextBtn, function()
		arg_7_0.prayProxy:updateSelectedPool(arg_7_0.selectedPoolType)
		arg_7_0.prayProxy:updatePageState(PrayProxy.STAGE_SELECT_SHIP)
		arg_7_0:emit(PrayPoolConst.SWITCH_TO_SELECT_SHIP_PAGE, PrayProxy.STAGE_SELECT_SHIP)
	end, SFX_PANEL)
	arg_7_0:Show()
end

function var_0_0.updateUI(arg_12_0)
	local var_12_0 = arg_12_0.prayProxy:getSelectedPoolType()

	if var_12_0 then
		triggerToggle(arg_12_0.poolToggleList[var_12_0], true)
	else
		return
	end
end

return var_0_0
