local var_0_0 = class("WorldAutoFightRewardLayer", BaseUI)

function var_0_0.getUIName(arg_1_0)
	return "WorldAutoFightRewardUI"
end

local var_0_1 = 0.1

function var_0_0.init(arg_2_0)
	arg_2_0.window = arg_2_0._tf:Find("Window")
	arg_2_0.boxView = arg_2_0.window:Find("Layout/Box/ScrollView")
	arg_2_0.emptyTip = arg_2_0.window:Find("Layout/Box/EmptyTip")
	arg_2_0.itemList = arg_2_0.boxView:Find("Content/ItemGrid")

	local var_2_0 = Instantiate(arg_2_0.itemList:GetComponent(typeof(ItemList)).prefabItem[0])

	var_2_0.name = "Icon"

	setParent(var_2_0, arg_2_0.itemList:Find("GridItem/Shell"))
	setText(arg_2_0.emptyTip, i18n("autofight_rewards_none"))
	setText(arg_2_0.window:Find("Fixed/top/bg/obtain/title"), i18n("autofight_rewards"))
	setText(arg_2_0.boxView:Find("Content/Title/Text"), i18n("battle_end_subtitle1"))
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
	arg_3_0:UpdateView()

	local var_3_0 = getProxy(MetaCharacterProxy):getMetaTacticsInfoOnEnd()

	if var_3_0 and #var_3_0 > 0 then
		arg_3_0.metaExpView = MetaExpView.New(arg_3_0.window:Find("Layout"), arg_3_0.event, arg_3_0.contextData)

		local var_3_1 = arg_3_0.metaExpView

		var_3_1:setData(var_3_0)
		var_3_1:Reset()
		var_3_1:Load()
		var_3_1:ActionInvoke("Show")
	end
end

function var_0_0.willExit(arg_4_0)
	arg_4_0:SkipAnim()

	if arg_4_0.metaExpView then
		arg_4_0.metaExpView:Destroy()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
end

function var_0_0.UpdateView(arg_5_0)
	local var_5_0 = arg_5_0.contextData

	onButton(arg_5_0, arg_5_0._tf:Find("BG"), function()
		if arg_5_0.isRewardAnimating then
			arg_5_0:SkipAnim()

			return
		end

		existCall(var_5_0.onClose)
		arg_5_0:closeView()
	end)
	setText(arg_5_0.window:Find("Fixed/ButtonExit/pic"), i18n("autofight_leave"))
	onButton(arg_5_0, arg_5_0.window:Find("Fixed/ButtonExit"), function()
		existCall(var_5_0.onClose)
		arg_5_0:closeView()
	end, SFX_CANCEL)

	local var_5_1 = nowWorld()
	local var_5_2 = var_5_1.autoInfos

	var_5_1:InitAutoInfos()
	DropResultIntegration(var_5_2.drops)

	local var_5_3 = underscore.map(var_5_2.drops, function(arg_8_0)
		if arg_8_0.type == DROP_TYPE_WORLD_COLLECTION then
			assert(WorldCollectionProxy.GetCollectionType(arg_8_0.id) == WorldCollectionProxy.WorldCollectionType.FILE, string.format("collection drop type error#%d", arg_8_0.id))
			table.insert(var_5_2.message, i18n("autofight_file", WorldCollectionProxy.GetCollectionTemplate(arg_8_0.id).name))
		else
			return {
				drop = arg_8_0
			}
		end
	end)

	for iter_5_0, iter_5_1 in ipairs(var_5_2.salvage) do
		DropResultIntegration(iter_5_1)
		underscore.each(iter_5_1, function(arg_9_0)
			table.insert(var_5_3, {
				drop = arg_9_0,
				salvage = iter_5_0
			})
		end)
	end

	local var_5_4 = true
	local var_5_5 = {}

	setActive(arg_5_0.boxView:Find("Content/Title"), false)
	setActive(arg_5_0.itemList, false)

	arg_5_0.hasRewards = #var_5_3 > 0

	if arg_5_0.hasRewards then
		var_5_4 = false

		table.insert(var_5_5, function(arg_10_0)
			setActive(arg_5_0.boxView:Find("Content/Title"), true)
			setActive(arg_5_0.itemList, true)
			arg_10_0()
		end)

		local var_5_6 = CustomIndexLayer.Clone2Full(arg_5_0.itemList, #var_5_3)

		for iter_5_2, iter_5_3 in ipairs(var_5_3) do
			local var_5_7 = iter_5_3.drop
			local var_5_8 = var_5_6[iter_5_2]

			updateDrop(var_5_8:Find("Shell/Icon"), var_5_7)
			onButton(arg_5_0, var_5_8:Find("Shell/Icon"), function()
				arg_5_0:emit(BaseUI.ON_DROP, var_5_7)
			end, SFX_PANEL)
			setActive(var_5_8:Find("salvage"), iter_5_3.salvage)

			if iter_5_3.salvage then
				eachChild(var_5_8:Find("salvage"), function(arg_12_0)
					setActive(arg_12_0, arg_12_0.name == tostring(iter_5_3.salvage))
				end)
			end
		end

		arg_5_0.isRewardAnimating = true

		local var_5_9 = {}

		for iter_5_4 = 1, #var_5_3 do
			local var_5_10 = var_5_6[iter_5_4]

			setActive(var_5_10, false)
			table.insert(var_5_5, function(arg_13_0)
				if arg_5_0.exited then
					return
				end

				setActive(var_5_10, true)
				scrollTo(arg_5_0.boxView:Find("Content"), {
					y = 0
				})

				arg_5_0.LTid = LeanTween.delayedCall(var_0_1, System.Action(arg_13_0)).uniqueId
			end)
		end
	end

	setActive(arg_5_0.boxView:Find("Content/TextArea"), false)

	local var_5_11 = {}

	for iter_5_5, iter_5_6 in ipairs(var_5_2.buffs) do
		if var_5_11[iter_5_6.id] then
			-- block empty
		else
			var_5_11[iter_5_6.id] = iter_5_6.before
		end
	end

	local var_5_12 = pg.gameset.world_mapbuff_list.description
	local var_5_13 = underscore.map(var_5_12, function(arg_14_0)
		if not var_5_11[arg_14_0] then
			return 0
		else
			return var_5_1:GetGlobalBuff(arg_14_0):GetFloor() - var_5_11[arg_14_0]
		end
	end)

	if underscore.any(var_5_13, function(arg_15_0)
		return arg_15_0 ~= 0
	end) then
		table.insert(var_5_2.message, i18n("autofight_effect", unpack(var_5_13)))
	end

	arg_5_0.hasEventMsg = #var_5_2.message > 0

	if arg_5_0.hasEventMsg then
		var_5_4 = false

		setText(arg_5_0.boxView:Find("Content/TextArea/Text"), table.concat(var_5_2.message, "\n"))
		table.insert(var_5_5, function(arg_16_0)
			setActive(arg_5_0.boxView:Find("Content/TextArea"), true)
			arg_16_0()
		end)
	end

	setActive(arg_5_0.boxView, not var_5_4)
	setActive(arg_5_0.emptyTip, var_5_4)
	seriesAsync(var_5_5, function()
		arg_5_0:SkipAnim()
	end)
end

function var_0_0.CloneIconTpl(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0:GetComponent(typeof(ItemList))

	assert(var_18_0, "Need a Itemlist Component for " .. (arg_18_0 and arg_18_0.name or "NIL"))

	local var_18_1 = Instantiate(var_18_0.prefabItem[0])

	if arg_18_1 then
		var_18_1.name = arg_18_1
	end

	setParent(var_18_1, arg_18_0)

	return var_18_1
end

function var_0_0.SkipAnim(arg_19_0)
	if not arg_19_0.isRewardAnimating then
		return
	end

	arg_19_0.isRewardAnimating = nil

	if arg_19_0.LTid then
		LeanTween.cancel(arg_19_0.LTid)

		arg_19_0.LTid = nil
	end

	eachChild(arg_19_0.itemList, function(arg_20_0)
		setActive(arg_20_0, true)
	end)
	setActive(arg_19_0.boxView:Find("Content/Title"), arg_19_0.hasRewards)
	setActive(arg_19_0.itemList, arg_19_0.hasRewards)
	setActive(arg_19_0.boxView:Find("Content/TextArea"), arg_19_0.hasEventMsg)
end

return var_0_0
