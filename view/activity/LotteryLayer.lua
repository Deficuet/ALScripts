local var_0_0 = class("LotteryLayer", import("..base.BaseUI"))
local var_0_1 = pg.activity_random_award_template

function var_0_0.getUIName(arg_1_0)
	return "LotteryUI"
end

function var_0_0.setPlayerVO(arg_2_0, arg_2_1)
	arg_2_0.playerVO = arg_2_1

	arg_2_0:updateResource()
end

function var_0_0.updateResource(arg_3_0)
	arg_3_0.resCount = arg_3_0.playerVO[id2res(arg_3_0.resId)]

	setText(arg_3_0.resource:Find("Text"), arg_3_0.resCount)
end

function var_0_0.setActivity(arg_4_0, arg_4_1)
	arg_4_0.activityVO = arg_4_1
	arg_4_0.resId = arg_4_0.activityVO:getConfig("config_client").resId
	arg_4_0.awardInfos = arg_4_1:getAwardInfos()

	arg_4_0:initActivityPools()
end

function var_0_0.initActivityPools(arg_5_0)
	arg_5_0.activityPools = {}

	local var_5_0 = arg_5_0.activityVO:getConfig("config_data")
	local var_5_1 = _.select(var_0_1.all, function(arg_6_0)
		return table.contains(var_5_0, arg_6_0)
	end)
	local var_5_2

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		local var_5_3 = ActivityItemPool.New({
			id = iter_5_1,
			awards = arg_5_0.awardInfos[iter_5_1],
			prevId = var_5_2,
			index = iter_5_0
		})

		var_5_2 = iter_5_1
		arg_5_0.activityPools[var_5_3.id] = var_5_3
	end

	local var_5_4 = arg_5_0.activityVO.data1 or var_5_0[1]

	arg_5_0.activityPool = arg_5_0.activityPools[var_5_4]
end

function var_0_0.init(arg_7_0)
	arg_7_0.lotteryPoolContainer = arg_7_0._tf:Find("left_panel/pool_list/content")
	arg_7_0.attrs = arg_7_0._tf:Find("left_panel/pool_list/arrs")
	arg_7_0.mainItenContainer = arg_7_0._tf:Find("right_panel/main_item_list/content")
	arg_7_0.mainItenTpl = arg_7_0.mainItenContainer:Find("equipmenttpl")
	arg_7_0.resource = arg_7_0._tf:Find("left_panel/resource")
	arg_7_0.launchOneBtn = arg_7_0._tf:Find("left_panel/launch_one_btn")
	arg_7_0.launchOneBtnTxt = arg_7_0.launchOneBtn:Find("res/Text"):GetComponent(typeof(Text))
	arg_7_0.launchTenBtn = arg_7_0._tf:Find("left_panel/launch_ten_btn")
	arg_7_0.launchTenBtnTxt = arg_7_0.launchTenBtn:Find("res/Text"):GetComponent(typeof(Text))
	arg_7_0.launchMaxBtn = arg_7_0._tf:Find("left_panel/launch_max_btn")
	arg_7_0.launchMaxBtnTxt = arg_7_0.launchMaxBtn:Find("res/Text"):GetComponent(typeof(Text))
	arg_7_0.awardsCounttxt = arg_7_0._tf:Find("right_panel/count_container/Text"):GetComponent(typeof(Text))
	arg_7_0.bgTF = arg_7_0._tf:Find("right_panel"):GetComponent(typeof(Image))
	arg_7_0.descBtn = arg_7_0._tf:Find("right_panel/desc_btn")
	arg_7_0.bonusWindow = arg_7_0._tf:Find("Msgbox")

	setActive(arg_7_0.bonusWindow, false)

	arg_7_0.topPanel = arg_7_0._tf:Find("top")
end

function var_0_0.didEnter(arg_8_0)
	onButton(arg_8_0, arg_8_0._tf:Find("top/back_btn"), function()
		arg_8_0:emit(var_0_0.ON_CLOSE)
	end, SOUND_BACK)

	local var_8_0 = {
		arg_8_0.launchOneBtn,
		arg_8_0.launchTenBtn,
		arg_8_0.launchMaxBtn
	}
	local var_8_1 = {
		1,
		10,
		"max"
	}

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = arg_8_0.resId
		}):getIcon(), "", iter_8_1:Find("res/icon"), true)
		onButton(arg_8_0, iter_8_1, function()
			if not arg_8_0.activityPool then
				return
			end

			if arg_8_0.activityPool ~= arg_8_0.showActivityPool then
				pg.TipsMgr.GetInstance():ShowTips(i18n("amercian_notice_5"))

				return
			end

			local var_10_0 = arg_8_0.activityPool:getleftItemCount()

			if var_10_0 == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("activity_pool_awards_empty"))

				return
			end

			local var_10_1 = arg_8_0.activityPool:getComsume()

			if var_8_1[iter_8_0] == "max" then
				var_10_0 = math.min(var_10_0, math.max(math.floor(arg_8_0.resCount / var_10_1.count), 1))
			else
				var_10_0 = math.min(var_10_0, var_8_1[iter_8_0])
			end

			if not arg_8_0.activityPool:enoughResForUsage(var_10_0) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return
			end

			local function var_10_2()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("amercian_notice_1", var_10_0 * var_10_1.count, var_10_0),
					onYes = function()
						arg_8_0:emit(LotteryMediator.ON_LAUNCH, arg_8_0.activityVO.id, arg_8_0.activityPool.id, var_10_0, var_8_1[iter_8_0] == "max")
					end
				})
			end

			if arg_8_0.playerVO:OilMax(1) or arg_8_0.playerVO:GoldMax(1) then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("amercian_notice_6"),
					onYes = function()
						var_10_2()
					end
				})
			else
				var_10_2()
			end
		end, SFX_PANEL)
	end

	onButton(arg_8_0, arg_8_0.descBtn, function()
		if not arg_8_0.showActivityPool then
			return
		end

		local var_14_0, var_14_1 = arg_8_0.showActivityPool:getItems()

		arg_8_0:showBonus(var_14_0, var_14_1)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.bonusWindow:Find("window/top/btnBack"), function()
		setActive(arg_8_0.bonusWindow, false)
	end)
	onButton(arg_8_0, arg_8_0.bonusWindow:Find("window/button"), function()
		setActive(arg_8_0.bonusWindow, false)
	end)
	onButton(arg_8_0, arg_8_0.bonusWindow, function()
		setActive(arg_8_0.bonusWindow, false)
	end)

	arg_8_0.bgs = {}
	arg_8_0.attrTFs = {}

	for iter_8_2 = 1, table.getCount(arg_8_0.activityPools) do
		local var_8_2 = arg_8_0.attrs:Find("arr_" .. iter_8_2)

		if not IsNil(var_8_2) then
			table.insert(arg_8_0.attrTFs, var_8_2)
		end
	end

	arg_8_0:updateResource()
	arg_8_0:initPoolTFs()
	arg_8_0:updateActivityPoolState()
	triggerToggle(arg_8_0.activityPoolTFs[arg_8_0.activityPool.id], true)
end

function var_0_0.onActivityUpdated(arg_18_0, arg_18_1)
	arg_18_0:setActivity(arg_18_1)
	arg_18_0:updateActivityPoolState()
	arg_18_0:switchToPool(arg_18_1.data1)
end

function var_0_0.initPoolTFs(arg_19_0)
	arg_19_0.activityPoolTFs = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_0.activityPools) do
		local var_19_0 = arg_19_0.lotteryPoolContainer:GetChild(iter_19_1.index - 1)

		arg_19_0.activityPoolTFs[iter_19_1.id] = var_19_0

		onToggle(arg_19_0, var_19_0, function(arg_20_0)
			if arg_20_0 then
				if not iter_19_1.prevId or arg_19_0.activityPools[iter_19_1.prevId]:canOpenNext() then
					arg_19_0:emit(LotteryMediator.ON_SWITCH, arg_19_0.activityVO.id, iter_19_1.id)
				else
					arg_19_0:switchToPool(iter_19_1.id)
				end
			end
		end)
	end
end

function var_0_0.updateActivityPoolState(arg_21_0)
	for iter_21_0, iter_21_1 in pairs(arg_21_0.activityPools) do
		local var_21_0 = arg_21_0.activityPoolTFs[iter_21_0]
		local var_21_1 = not iter_21_1.prevId or arg_21_0.activityPools[iter_21_1.prevId]:canOpenNext()

		setActive(var_21_0:Find("bg/unlock"), var_21_1)
		setActive(var_21_0:Find("bg/lock"), not var_21_1)
		setActive(var_21_0:Find("selected/unlock"), var_21_1)
		setActive(var_21_0:Find("selected/lock"), not var_21_1)

		local var_21_2 = iter_21_1:getleftItemCount()

		setActive(var_21_0:Find("finish"), var_21_2 == 0)

		if arg_21_0.attrTFs[iter_21_1.index - 1] then
			triggerToggle(arg_21_0.attrTFs[iter_21_1.index - 1], var_21_1)
		end
	end
end

function var_0_0.switchToPool(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.activityPools[arg_22_1]
	local var_22_1 = arg_22_0.activityPoolTFs[arg_22_1]

	arg_22_0:updateMainItems(var_22_0)
	arg_22_0:updateAwardsFetchedCount(var_22_0)

	local var_22_2 = arg_22_0.bgs[arg_22_1]

	if not var_22_2 then
		var_22_2 = LoadSprite("lotterybg/kr_re_" .. var_22_0.index)
		arg_22_0.bgs[arg_22_1] = var_22_2
	end

	arg_22_0.bgTF.sprite = var_22_2

	local var_22_3 = var_22_0:getComsume()
	local var_22_4 = math.min(var_22_0:getleftItemCount(), 10)
	local var_22_5 = math.min(var_22_0:getleftItemCount(), math.max(math.floor(arg_22_0.resCount / var_22_3.count), 1))

	arg_22_0.launchOneBtnTxt.text = var_22_3.count
	arg_22_0.launchTenBtnTxt.text = var_22_3.count * var_22_4
	arg_22_0.launchMaxBtnTxt.text = var_22_3.count * var_22_5
	arg_22_0.showActivityPool = arg_22_0.activityPools[var_22_0.id]
end

function var_0_0.updateAwardsFetchedCount(arg_23_0, arg_23_1)
	if arg_23_0.awardsCounttxt then
		local var_23_0 = arg_23_1:getFetchCount()
		local var_23_1 = arg_23_1:getItemCount()

		arg_23_0.awardsCounttxt.text = setColorStr(var_23_1 - var_23_0, var_23_0 < var_23_1 and COLOR_GREEN or COLOR_RED) .. "/" .. var_23_1
	end
end

function var_0_0.updateMainItems(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1:getMainItems()

	for iter_24_0 = arg_24_0.mainItenContainer.childCount, #var_24_0 do
		cloneTplTo(arg_24_0.mainItenTpl, arg_24_0.mainItenContainer)
	end

	local var_24_1 = arg_24_0.mainItenContainer.childCount

	for iter_24_1 = 1, var_24_1 do
		local var_24_2 = arg_24_0.mainItenContainer:GetChild(iter_24_1 - 1)
		local var_24_3 = iter_24_1 <= #var_24_0

		setActive(var_24_2, var_24_3)

		if var_24_3 then
			local var_24_4 = var_24_0[iter_24_1]

			updateDrop(var_24_2, var_24_4)
			setActive(var_24_2:Find("mask"), var_24_4.surplus <= 0)
			setText(var_24_2:Find("icon_bg/surplus"), "X" .. (var_24_4.surplus or ""))
			onButton(arg_24_0, var_24_2, function()
				arg_24_0:emit(var_0_0.ON_DROP, var_24_4)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.showBonus(arg_26_0, arg_26_1, arg_26_2)
	setActive(arg_26_0.bonusWindow, true)

	arg_26_0.awardMain = arg_26_1
	arg_26_0.awardNormal = arg_26_2
	arg_26_0.trDropTpl = arg_26_0._tf:Find("Msgbox/window/items/scrollview/item")
	arg_26_0.trDrops = arg_26_0._tf:Find("Msgbox/window/items/scrollview/list/list_main")
	arg_26_0.dropList = UIItemList.New(arg_26_0.trDrops, arg_26_0.trDropTpl)

	arg_26_0.dropList:make(function(arg_27_0, arg_27_1, arg_27_2)
		arg_26_0:updateDrop(arg_27_0, arg_27_1, arg_27_2, arg_26_0.awardMain)
	end)
	arg_26_0.dropList:align(#arg_26_0.awardMain)

	arg_26_0.trDropsN = arg_26_0._tf:Find("Msgbox/window/items/scrollview/list/list_normal")
	arg_26_0.dropListN = UIItemList.New(arg_26_0.trDropsN, arg_26_0.trDropTpl)

	arg_26_0.dropListN:make(function(arg_28_0, arg_28_1, arg_28_2)
		arg_26_0:updateDrop(arg_28_0, arg_28_1, arg_28_2, arg_26_0.awardNormal)
	end)
	arg_26_0.dropListN:align(#arg_26_0.awardNormal)
end

function var_0_0.updateDrop(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4)
	if arg_29_1 == UIItemList.EventUpdate then
		local var_29_0 = arg_29_4[arg_29_2 + 1]

		updateDrop(arg_29_3, var_29_0)
		setText(arg_29_3:Find("count"), var_29_0.surplus .. "/" .. var_29_0.total)
		setActive(arg_29_3:Find("mask"), var_29_0.surplus <= 0)
		setScrollText(findTF(arg_29_3, "name_mask/name"), var_29_0.name or var_29_0:getConfig("name"))
	end
end

function var_0_0.willExit(arg_30_0)
	arg_30_0.bgs = nil
end

return var_0_0
