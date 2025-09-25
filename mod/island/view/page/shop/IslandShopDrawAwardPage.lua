local var_0_0 = class("IslandShopDrawAwardPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandDrawAwardPage"
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2)
	var_0_0.super.Ctor(arg_2_0, arg_2_1, arg_2_2.event, arg_2_2.contextData)

	arg_2_0.viewComponent = arg_2_2
end

function var_0_0.OnLoaded(arg_3_0)
	local var_3_0 = arg_3_0._tf:GetComponent(typeof(ItemList)).prefabItem:ToTable()

	for iter_3_0, iter_3_1 in ipairs({
		"rtMiddle",
		"rtTitle",
		"btnAll",
		"btnDraw",
		"btnDrawTen",
		"rtDisplayPanel"
	}) do
		arg_3_0[iter_3_1] = var_3_0[iter_3_0].transform
	end

	setActive(arg_3_0.rtDisplayPanel, false)
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.bannerRectDic = {}

	eachChild(arg_4_0.rtMiddle, function(arg_5_0, arg_5_1)
		setText(arg_5_0:Find("got/Text"), i18n("island_draw_get"))

		local var_5_0 = arg_5_0.name

		switch(var_5_0, {
			S = function()
				setText(arg_5_0:Find("state_sequence/Text"), i18n("选择"))
				setText(arg_5_0:Find("finish/Text"), i18n("island_draw_null"))
				onButton(arg_4_0, arg_5_0:Find("state_sequence"), function()
					arg_4_0:OpenChangeListWindow()
				end, SFX_PANEL)
				onButton(arg_4_0, arg_5_0:Find("btn_sequence"), function()
					arg_4_0:OpenChangeListWindow()
				end, SFX_PANEL)

				arg_4_0.bannerRectDic[var_5_0] = BannerScrollRect4IslandDrawAward.New(arg_5_0:Find("mask/view/container"), arg_5_0:Find("dots"))
			end,
			A = function()
				arg_4_0.bannerRectDic[var_5_0] = BannerScrollRect4IslandDrawAward.New(arg_5_0:Find("mask/view/container"), arg_5_0:Find("dots"))
			end,
			select = function()
				setText(arg_5_0:Find("count_word/Text"), i18n("island_draw_num"))
				setText(arg_5_0:Find("btn_select/Text"), i18n("island_draw_pick"))
				onButton(arg_4_0, arg_5_0:Find("btn_select"), function()
					arg_4_0:OpenSelectAwardWindow()
				end, SFX_PANEL)

				arg_4_0.bannerRectDic[var_5_0] = BannerScrollRect4IslandDrawAward.New(arg_5_0:Find("mask/view/container"), arg_5_0:Find("dots"))
			end
		})
	end)
	setText(arg_4_0.rtTitle:Find("Text"), i18n("island_draw_time"))
	setText(arg_4_0.btnAll:Find("Text"), i18n("island_draw_reward"))
	onButton(arg_4_0, arg_4_0.btnAll, function()
		arg_4_0:OpenAllAwardWindow()
	end, SFX_PANEL)
	setText(arg_4_0.btnDraw:Find("Text"), i18n("island_draw_lottery"))
	onButton(arg_4_0, arg_4_0.btnDraw, function()
		if arg_4_0.activity:GetTimesLeft() < 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_draw_float"))

			return
		end

		arg_4_0:TryDraw(1)
	end, SFX_PANEL)
	setText(arg_4_0.btnDrawTen:Find("Text"), i18n("island_draw_lottery"))
	onButton(arg_4_0, arg_4_0.btnDrawTen, function()
		if arg_4_0.activity:GetTimesLeft() < 10 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_draw_float"))

			return
		end

		arg_4_0:TryDraw(10)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.rtDisplayPanel:Find("bg"), function()
		if arg_4_0.inAnim then
			return
		end

		arg_4_0:HideDrawAwardWindow()
	end, SFX_CANCEL)
end

function var_0_0.TryDraw(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.activity:GetDrawTimes()

	if var_16_0 < arg_16_1 then
		local var_16_1 = Goods.Create({
			id = arg_16_0.activity:GetDrawConfig("shop")
		}, Goods.TYPE_SHOPSTREET)
		local var_16_2 = var_16_1:GetConsume()

		arg_16_0.rawIconDic.diamond = arg_16_0.rawIconDic.diamond or GetSpriteFromAtlas(var_16_2:getIcon(), "")

		arg_16_0.viewComponent:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_draw_tip3", string.format("<icon name=diamond w=0.76 h=0.76/>×%d", var_16_2.count * (arg_16_1 - var_16_0)), string.format("<icon name=ticket w=0.76 h=0.76/>×%d", arg_16_1 - var_16_0)),
			onYes = function()
				if var_16_2:getOwnedCount() < var_16_2.count * (arg_16_1 - var_16_0) then
					arg_16_0:ShowChargeWindow()
				else
					arg_16_0:emit(IslandMediator.SHOPPING, var_16_1.id, arg_16_1 - var_16_0)
				end
			end,
			rawIconDic = arg_16_0.rawIconDic
		})
	else
		arg_16_0.viewComponent:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_draw_ready"),
			onYes = function()
				arg_16_0:emit(IslandMediator.DRAW_AWARD_OPERATION, {
					op = "do_draw",
					activity_id = arg_16_0.activity.id,
					count = arg_16_1
				})
			end
		})
	end
end

function var_0_0.ShowChargeWindow(arg_19_0)
	arg_19_0.viewComponent:ShowMsgBox({
		type = IslandMsgBox.TYPE_COMMON,
		content = i18n("island_draw_tip4"),
		onYes = function()
			arg_19_0.viewComponent:emit(IslandMediator.CHANGE_SCENE, SCENE.CHARGE, {
				wrap = ChargeScene.TYPE_DIAMOND
			})
		end
	})
end

function var_0_0.UpdateActivity(arg_21_0, arg_21_1)
	arg_21_0.activity = arg_21_1

	local var_21_0 = arg_21_0.activity:GetList()

	eachChild(arg_21_0.rtMiddle, function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0.name

		switch(var_22_0, {
			S = function()
				setActive(arg_22_0:Find("mask"), var_21_0)
				setActive(arg_22_0:Find("btn_sequence"), var_21_0)
				setActive(arg_22_0:Find("state_sequence"), not var_21_0)

				if var_21_0 then
					local var_23_0 = arg_21_0.activity:GetShowRankList(var_22_0)

					arg_21_0.bannerRectDic[var_22_0]:Reset()

					for iter_23_0, iter_23_1 in ipairs(var_23_0) do
						local var_23_1 = arg_21_0.bannerRectDic[var_22_0]:AddChild()
						local var_23_2 = pg.island_draw_reward[iter_23_1]

						GetImageSpriteFromAtlasAsync("island/IslandDrawAwardIcon/" .. var_23_2.show, "", var_23_1:Find("Image"), true)
					end

					arg_21_0.bannerRectDic[var_22_0]:SetTriggerDotCall(function(arg_24_0)
						local var_24_0 = var_23_0[arg_24_0]

						setActive(arg_22_0:Find("got"), arg_21_0.activity:GetLastItemCount(var_24_0) == 0)
					end)
					arg_21_0.bannerRectDic[var_22_0]:SetUp()
				else
					setActive(arg_22_0:Find("got"), false)
				end

				local var_23_3 = arg_21_0.activity:GetTimesLeft(var_22_0)

				setText(arg_22_0:Find("times_left/Text"), var_23_3 > 0 and i18n("island_draw_last") or i18n("island_draw_null"))
				setText(arg_22_0:Find("times_left/times"), var_23_3 > 0 and var_23_3 or "")
			end,
			A = function()
				setActive(arg_22_0:Find("got"), false)

				local var_25_0 = arg_21_0.activity:GetTimesLeft(var_22_0)

				setText(arg_22_0:Find("times_left/Text"), var_25_0 > 0 and i18n("island_draw_last") or i18n("island_draw_null"))
				setText(arg_22_0:Find("times_left/times"), var_25_0 > 0 and var_25_0 or "")

				local var_25_1 = arg_21_0.activity:GetShowRankList(var_22_0)

				arg_21_0.bannerRectDic[var_22_0]:Reset()

				for iter_25_0, iter_25_1 in ipairs(var_25_1) do
					local var_25_2 = arg_21_0.bannerRectDic[var_22_0]:AddChild()
					local var_25_3 = pg.island_draw_reward[iter_25_1]

					GetImageSpriteFromAtlasAsync("island/IslandDrawAwardIcon/" .. var_25_3.show, "", var_25_2:Find("Image"), true)
				end

				arg_21_0.bannerRectDic[var_22_0]:SetTriggerDotCall(function(arg_26_0)
					local var_26_0 = var_25_1[arg_26_0]

					setActive(arg_22_0:Find("got"), arg_21_0.activity:GetLastItemCount(var_26_0) == 0)
				end)
				arg_21_0.bannerRectDic[var_22_0]:SetUp(1)
			end,
			select = function()
				setActive(arg_22_0:Find("got"), false)

				local var_27_0 = arg_21_0.activity:GetDrawCount()
				local var_27_1 = arg_21_0.activity:GetNextCountAwardTimes() or 0

				setText(arg_22_0:Find("count_word"), string.format("%d/%d", var_27_0, var_27_1))
				setActive(arg_22_0:Find("btn_select/on"), var_27_1 > 0 and var_27_1 <= var_27_0)

				local var_27_2 = arg_21_0.activity:GetCountAwards()

				arg_21_0.bannerRectDic[var_22_0]:Reset()

				for iter_27_0, iter_27_1 in ipairs(var_27_2) do
					local var_27_3, var_27_4 = unpack(iter_27_1)
					local var_27_5 = arg_21_0.bannerRectDic[var_22_0]:AddChild()
					local var_27_6 = pg.island_draw_reward[var_27_3]

					GetImageSpriteFromAtlasAsync("island/IslandDrawAwardIcon/" .. var_27_6.show, "", var_27_5:Find("Image"), true)
				end

				arg_21_0.bannerRectDic[var_22_0]:SetTriggerDotCall(function(arg_28_0)
					local var_28_0, var_28_1 = unpack(var_27_2[arg_28_0])

					setActive(arg_22_0:Find("got"), not var_28_1)
				end)
				arg_21_0.bannerRectDic[var_22_0]:SetUp(2)
			end
		}, function()
			setActive(arg_22_0:Find("got"), false)

			local var_29_0 = arg_21_0.activity:GetTimesLeft(var_22_0)

			setText(arg_22_0:Find("times_left/Text"), var_29_0 > 0 and i18n("island_draw_last") or i18n("island_draw_null"))
			setText(arg_22_0:Find("times_left/times"), var_29_0 > 0 and var_29_0 or "")

			local var_29_1 = arg_21_0.activity:GetShowRankList(var_22_0)[1]

			if var_29_1 then
				local var_29_2 = pg.island_draw_reward[var_29_1]

				GetImageSpriteFromAtlasAsync("island/IslandDrawAwardIcon/" .. var_29_2.show, "", arg_22_0:Find("mask/Image"), true)
				setActive(arg_22_0:Find("got"), false)
			end
		end)
	end)

	local var_21_1 = pg.TimeMgr.GetInstance()
	local var_21_2 = underscore.map({
		arg_21_0.activity:getStartTime(),
		arg_21_0.activity.stopTime
	}, function(arg_30_0)
		return i18n("trade_card_tips4", unpack(string.split(var_21_1:STimeDescS(arg_30_0, "%Y/%m/%d"), "/")))
	end)

	setText(arg_21_0.rtTitle:Find("Text_1"), string.format("%s\n-%s", unpack(var_21_2)) .. i18n("island_draw_time_1"))

	local var_21_3 = arg_21_0.activity:GetTimesLeft()

	setActive(arg_21_0.btnDraw:Find("bg/on"), var_21_3 >= 1)
	setActive(arg_21_0.btnDraw:Find("bg/off"), var_21_3 < 1)
	setActive(arg_21_0.btnDrawTen:Find("bg/on"), var_21_3 >= 10)
	setActive(arg_21_0.btnDrawTen:Find("bg/off"), var_21_3 < 10)

	local var_21_4 = Drop.New({
		type = DROP_TYPE_VITEM,
		id = arg_21_0.activity:GetDrawConfig("cost_free")
	})

	arg_21_0.rawIconDic = {
		ticket = GetSpriteFromAtlas(var_21_4:getIcon(), "")
	}

	GetImageSpriteFromAtlasAsync(var_21_4:getIcon(), "", arg_21_0.btnDraw:Find("cost/icon"))
	GetImageSpriteFromAtlasAsync(var_21_4:getIcon(), "", arg_21_0.btnDrawTen:Find("cost/icon"))
end

function var_0_0.OpenChangeListWindow(arg_31_0)
	arg_31_0.viewComponent:ShowMsgBox({
		type = IslandMsgBox.TYPE_DRAW_AWARD_LIST,
		activity = arg_31_0.activity
	})
end

function var_0_0.OpenAllAwardWindow(arg_32_0)
	arg_32_0.viewComponent:ShowMsgBox({
		type = IslandMsgBox.TYPE_DRAW_AWARD_ALL,
		activity = arg_32_0.activity
	})
end

function var_0_0.OpenSelectAwardWindow(arg_33_0)
	arg_33_0.viewComponent:ShowMsgBox({
		type = IslandMsgBox.TYPE_DRAW_AWARD_COUNT,
		activity = arg_33_0.activity
	})
end

function var_0_0.DrawOperation(arg_34_0, arg_34_1)
	switch(arg_34_1.op, {
		set_list = function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_draw_sort"))
		end
	}, function()
		if #arg_34_1.awards > 0 then
			arg_34_0:ShowDrawAwardWindow(arg_34_1.awards)
		end
	end)
end

function var_0_0.ShowDrawAwardWindow(arg_37_0, arg_37_1)
	local var_37_0 = #arg_37_1 > 1 and "ten" or "one"
	local var_37_1

	eachChild(arg_37_0.rtDisplayPanel:Find("window"), function(arg_38_0, arg_38_1)
		setActive(arg_38_0, arg_38_0.name == var_37_0)

		if arg_38_0.name == var_37_0 then
			var_37_1 = arg_38_0
		end
	end)

	local var_37_2 = {}

	UIItemList.StaticAlign(var_37_1:Find("container"), var_37_1:Find("container/tpl"), #arg_37_1, function(arg_39_0, arg_39_1, arg_39_2)
		if var_37_0 == "ten" then
			arg_39_1 = arg_39_1 % 2 * 5 + 5 - math.floor(arg_39_1 / 2)
		else
			arg_39_1 = arg_39_1 + 1
		end

		if arg_39_0 == UIItemList.EventUpdate then
			local var_39_0 = arg_39_2:Find("card")
			local var_39_1 = arg_37_1[arg_39_1]
			local var_39_2 = pg.island_draw_reward[var_39_1]
			local var_39_3 = Drop.New({
				type = var_39_2.drop_type,
				id = var_39_2.drop_id
			})

			var_0_0.ShowDropInfo(var_39_3, var_39_0:Find("mask/Image"))

			local var_39_4 = switch(var_39_2.rarity, {
				function()
					return "C"
				end,
				function()
					return "B"
				end,
				function()
					return "A"
				end,
				function()
					return "S"
				end
			})
			local var_39_5 = var_39_0:Find("mask/Image")

			if var_39_4 == "S" then
				setLocalScale(var_39_0:Find("mask/Image"), Vector3(1.2, 1.2, 1))
				setLocalPosition(var_39_0:Find("mask/Image"), {
					x = -17.5,
					y = -20
				})
			else
				setLocalScale(var_39_0:Find("mask/Image"), Vector3(1.7, 1.7, 1))
				setLocalPosition(var_39_0:Find("mask/Image"), Vector3.zero)
			end

			eachChild(var_39_0:Find("bg"), function(arg_44_0, arg_44_1)
				setActive(arg_44_0, arg_44_0.name == var_39_4)
			end)
			eachChild(var_39_0:Find("word"), function(arg_45_0, arg_45_1)
				setActive(arg_45_0, arg_45_0.name == var_39_4)
			end)
			eachChild(var_39_0:Find("front"), function(arg_46_0, arg_46_1)
				setActive(arg_46_0, arg_46_0.name == var_39_4)
			end)
			var_39_0:Find("Book"):GetComponent("Book"):SetCurrentPage(2)
			setCanvasGroupAlpha(var_39_0, 0)
			setCanvasGroupAlpha(var_39_0:Find("Book"), 1)

			var_37_2[arg_39_1] = arg_39_2
		end
	end)
	setCanvasGroupAlpha(arg_37_0.rtDisplayPanel:Find("page"), 0)

	local var_37_3 = {}

	table.insert(var_37_3, function(arg_47_0)
		arg_37_0.inAnim = true

		pg.UIMgr.GetInstance():BlurPanel(arg_37_0.rtDisplayPanel, {
			staticBlur = true
		})
		setActive(arg_37_0.rtDisplayPanel, true)
		arg_37_0.rtDisplayPanel:GetComponent(typeof(DftAniEvent)):SetTriggerEvent(arg_47_0)
	end)
	table.insert(var_37_3, function(arg_48_0)
		local var_48_0 = {}

		for iter_48_0, iter_48_1 in ipairs(var_37_2) do
			local var_48_1 = iter_48_1:Find("card")

			table.insert(var_48_0, function(arg_49_0)
				local var_49_0 = {}
				local var_49_1 = (iter_48_0 - 1) % 5 * 2 + (iter_48_0 > 5 and 1 or 0)

				if var_37_0 == "ten" and var_49_1 > 0 then
					table.insert(var_49_0, function(arg_50_0)
						LeanTween.delayedCall(iter_48_1.gameObject, 0.03 * var_49_1, System.Action(arg_50_0))
					end)
				end

				table.insert(var_49_0, function(arg_51_0)
					var_48_1:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_52_0)
						arg_51_0()
					end)
					switch(var_37_0, {
						one = function()
							quickPlayAnimation(var_48_1, "anim_IslandDrawAwardPage_onetpl_In")
						end,
						ten = function()
							quickPlayAnimation(var_48_1, var_49_1 % 2 == 0 and "anim_IslandDrawAwardPage_ten" or "anim_IslandDrawAwardPage_ten02")
						end
					})
				end)
				seriesAsync(var_49_0, arg_49_0)
			end)
		end

		parallelAsync(var_48_0, function()
			LeanTween.delayedCall(0.6, System.Action(function()
				arg_48_0()
			end))
		end)
	end)
	table.insert(var_37_3, function(arg_57_0)
		local var_57_0 = {}

		for iter_57_0, iter_57_1 in ipairs(var_37_2) do
			local var_57_1 = iter_57_1:Find("card")

			table.insert(var_57_0, function(arg_58_0)
				local var_58_0 = {}
				local var_58_1 = iter_57_0 - 1

				if var_58_1 > 0 then
					table.insert(var_58_0, function(arg_59_0)
						LeanTween.delayedCall(iter_57_1.gameObject, 0.1 * var_58_1, System.Action(arg_59_0))
					end)
				end

				table.insert(var_58_0, function(arg_60_0)
					local var_60_0 = var_57_1:Find("Book"):GetComponent("AutoFlip")

					var_60_0:StartControl()
					var_57_1:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
						var_60_0:StopControl()
						arg_60_0()
					end)
					quickPlayAnimation(var_57_1, "anim_IslandDrawAwardPage_uncover")
				end)
				seriesAsync(var_58_0, arg_58_0)
			end)
		end

		quickPlayAnimation(arg_37_0.rtDisplayPanel:Find("page"), "anim_IslandDrawAwardPage_page_in")
		parallelAsync(var_57_0, arg_57_0)
	end)
	seriesAsync(var_37_3, function()
		if arg_37_0._state == var_0_0.STATES.DESTROY then
			return
		end

		quickPlayAnimation(arg_37_0.rtDisplayPanel:Find("page"), "anim_IslandDrawAwardPage_page_out")

		arg_37_0.inAnim = false
	end)
end

function var_0_0.HideDrawAwardWindow(arg_63_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_63_0.rtDisplayPanel, arg_63_0._tf)
	setActive(arg_63_0.rtDisplayPanel, false)
	eachChild(arg_63_0.rtDisplayPanel:Find("window"), function(arg_64_0, arg_64_1)
		eachChild(arg_64_0:Find("container"), function(arg_65_0, arg_65_1)
			LeanTween.cancel(arg_65_0.gameObject)

			local var_65_0 = arg_65_0:Find("card")

			setActive(var_65_0:Find("IslandDrawAwardPage_bomb01"), false)
			setActive(var_65_0:Find("SCardLoopVX"), false)
			setActive(var_65_0:Find("IslandDrawAwardPage_bomb02"), false)
			setActive(var_65_0:Find("ACardLoopVX"), false)
		end)
	end)
end

function var_0_0.Hide(arg_66_0)
	if isActive(arg_66_0.rtDisplayPanel) then
		arg_66_0:HideDrawAwardWindow()
	end

	var_0_0.super.Hide(arg_66_0)
end

function var_0_0.OnDestroy(arg_67_0)
	arg_67_0:Hide()

	for iter_67_0, iter_67_1 in pairs(arg_67_0.bannerRectDic) do
		iter_67_1:Dispose()
	end

	arg_67_0.bannerRectDic = nil
end

function var_0_0.ShowDropInfo(arg_68_0, arg_68_1)
	switch(arg_68_0.type, {
		[DROP_TYPE_ISLAND_INVITATION] = function()
			GetImageSpriteFromAtlasAsync("island/IslandCharIcon/" .. arg_68_0:getConfig("chara_pic"), "", arg_68_1, true)
		end,
		[DROP_TYPE_ISLAND_FURNITURE] = function()
			GetImageSpriteFromAtlasAsync("Island/IslandFurnitureIcon/" .. arg_68_0:getConfig("icon"), "", arg_68_1, true)
		end,
		[DROP_TYPE_ISLAND_DRESS] = function()
			GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. arg_68_0:getConfig("icon"), "", arg_68_1, true)
		end,
		[DROP_TYPE_ISLAND_SKIN] = function()
			GetImageSpriteFromAtlasAsync("island/IslandDressIcon/" .. arg_68_0:getConfig("icon"), "", arg_68_1, true)
		end,
		[DROP_TYPE_ISLAND_ACTION] = function()
			GetImageSpriteFromAtlasAsync("Island/IslandActionIcon/" .. arg_68_0:getConfig("resource"), "", arg_68_1, true)
		end
	})
end

return var_0_0
