local var_0_0 = class("VoteScheduleScene", import("view.base.BaseUI"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5 = 5
local var_0_6 = 6
local var_0_7 = 1
local var_0_8 = 2
local var_0_9 = 3

function var_0_0.getUIName(arg_1_0)
	return "VoteScheduleUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("blur_panel/adapt/top/back_btn")
	arg_2_0.raceTpl = arg_2_0._tf:Find("res/raceTpl")
	arg_2_0.layoutTpl = arg_2_0._tf:Find("res/layoutTpl")
	arg_2_0.raceTpl1 = arg_2_0._tf:Find("res/raceTpl1")
	arg_2_0.layoutTpl1 = arg_2_0._tf:Find("res/layoutTpl1")
	arg_2_0.container = arg_2_0._tf:Find("scrollrect/content")
	arg_2_0.verLeftTpl = arg_2_0._tf:Find("res/ver_left")
	arg_2_0.verLeftTplClose = arg_2_0._tf:Find("res/ver_left_close")
	arg_2_0.verRightTpl = arg_2_0._tf:Find("res/ver_right")
	arg_2_0.verRightTplClose = arg_2_0._tf:Find("res/ver_right_close")
	arg_2_0.centTpl = arg_2_0._tf:Find("res/cen")
	arg_2_0.centTplClose = arg_2_0._tf:Find("res/cen_close")
	arg_2_0.hrzRightTpl = arg_2_0._tf:Find("res/hrz_rigth")
	arg_2_0.hrzRightTplClose = arg_2_0._tf:Find("res/hrz_rigth_close")
	arg_2_0.hrzLeftTpl = arg_2_0._tf:Find("res/hrz_left")
	arg_2_0.hrzLeftTplClose = arg_2_0._tf:Find("res/hrz_left_close")
	arg_2_0.lineContainer = arg_2_0._tf:Find("scrollrect/content/line")
	arg_2_0.lineTpls = {}

	setText(arg_2_0.raceTpl:Find("open/Text"), i18n("vote_lable_voting"))
	setText(arg_2_0.raceTpl:Find("close/Text"), i18n("vote_lable_not_start"))
	setText(arg_2_0.raceTpl1:Find("open/Text"), i18n("vote_lable_voting"))
	setText(arg_2_0.raceTpl1:Find("close/Text"), i18n("vote_lable_not_start"))
	setText(arg_2_0._tf:Find("title/Text"), i18n("vote_lable_title"))

	arg_2_0.LayoutHeight = arg_2_0.layoutTpl:GetComponent(typeof(LayoutElement)).preferredHeight
	arg_2_0.spacing = arg_2_0.container:GetComponent(typeof(VerticalLayoutGroup)).spacing
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:closeView()
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():LoadingOn(false)
	seriesAsync({
		function(arg_5_0)
			arg_3_0:RequestFinishedVoteGroup(arg_5_0)
		end,
		function(arg_6_0)
			pg.UIMgr.GetInstance():LoadingOff()
			arg_3_0:SetUp(arg_6_0)
		end
	}, function()
		return
	end)
end

function var_0_0.RequestFinishedVoteGroup(arg_8_0, arg_8_1)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in ipairs(pg.activity_vote.all) do
		if pg.TimeMgr.GetInstance():parseTimeFromConfig(pg.activity_vote[iter_8_1].time_vote[2]) <= pg.TimeMgr.GetInstance():GetServerTime() then
			table.insert(var_8_0, function(arg_9_0)
				arg_8_0:emit(VoteScheduleMediator.FETCH_RANK, iter_8_1, arg_9_0)
			end)
		end
	end

	seriesAsync(var_8_0, arg_8_1)
end

function var_0_0.SetUp(arg_10_0, arg_10_1)
	arg_10_0.voteIdList = arg_10_0:GetVoteIdList()
	arg_10_0.displayList = arg_10_0:GenDisplayList(arg_10_0.voteIdList)

	arg_10_0:ClearLines()

	local var_10_0 = arg_10_0:InitScheduleList()

	arg_10_0.lineContainer:SetAsLastSibling()
	seriesAsync({
		function(arg_11_0)
			Canvas.ForceUpdateCanvases()
			onNextTick(arg_11_0)
		end,
		function(arg_12_0)
			arg_10_0:UpdateLinesPosition()
			arg_10_0:ScrollTo(var_10_0)
			onNextTick(arg_12_0)
		end,
		function(arg_13_0)
			arg_10_0:PlayAnimation(arg_13_0)
		end
	}, arg_10_1)
end

function var_0_0.PlayAnimation(arg_14_0, arg_14_1)
	local var_14_0 = 1

	local function var_14_1(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0 = arg_15_0:GetComponent(typeof(CanvasGroup))

		LeanTween.value(arg_15_0.gameObject, 0, 1, 0.333):setOnUpdate(System.Action_float(function(arg_16_0)
			var_15_0.alpha = arg_16_0
		end)):setOnComplete(System.Action(arg_15_2)):setDelay(arg_15_1 * var_14_0)

		var_14_0 = var_14_0 + 1
	end

	local var_14_2 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_0.voteIdList or {}) do
		local var_14_3 = arg_14_0:GetRaceState(iter_14_1)
		local var_14_4 = arg_14_0.animationNodes[iter_14_1]
		local var_14_5 = var_14_3 == var_0_9

		for iter_14_2, iter_14_3 in ipairs(var_14_4) do
			if var_14_5 then
				table.insert(var_14_2, function(arg_17_0)
					var_14_1(iter_14_3, 0.066, arg_17_0)
				end)
			else
				iter_14_3:GetComponent(typeof(CanvasGroup)).alpha = 1
			end
		end
	end

	parallelAsync(var_14_2, function()
		arg_14_0.animationNodes = {}

		arg_14_1()
	end)
end

function var_0_0.ScrollTo(arg_19_0, arg_19_1)
	local var_19_0 = (arg_19_0.LayoutHeight + arg_19_0.spacing) * (arg_19_1 - 1) - 170

	setAnchoredPosition(arg_19_0.container, {
		y = var_19_0
	})
end

function var_0_0.ClearLines(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.lineTpls) do
		local var_20_0 = iter_20_1[1]

		Object.Destroy(var_20_0.gameObject)
	end

	arg_20_0.lineTpls = {}
end

local function var_0_10(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0 == arg_21_1 then
		return arg_21_2
	else
		local var_21_0 = arg_21_0:TransformPoint(arg_21_2)
		local var_21_1 = arg_21_1:InverseTransformPoint(var_21_0)

		return Vector3(var_21_1.x, var_21_1.y, 0)
	end
end

function var_0_0.UpdateLinesPosition(arg_22_0)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.lineTpls) do
		local var_22_0 = var_0_10(iter_22_1[2], arg_22_0.lineContainer, iter_22_1[3])

		setAnchoredPosition(iter_22_1[1], var_22_0)
	end
end

function var_0_0.GetVoteIdList(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in ipairs(pg.activity_vote.all) do
		table.insert(var_23_0, iter_23_1)
	end

	table.sort(var_23_0, function(arg_24_0, arg_24_1)
		local var_24_0 = pg.activity_vote[arg_24_0]
		local var_24_1 = pg.activity_vote[arg_24_1]

		return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_24_0.time_vote[1]) < pg.TimeMgr.GetInstance():parseTimeFromConfig(var_24_1.time_vote[1])
	end)

	return var_23_0
end

function var_0_0.GenDisplayList(arg_25_0, arg_25_1)
	local var_25_0 = {}

	if #arg_25_1 <= 4 then
		for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
			local var_25_1 = var_0_3

			if iter_25_0 == #arg_25_1 then
				var_25_1 = var_0_6
			end

			table.insert(var_25_0, {
				{
					id = iter_25_1,
					dir = var_25_1
				}
			})
		end

		return var_25_0
	end

	table.insert(var_25_0, {
		{
			id = arg_25_1[1],
			dir = var_0_1
		}
	})

	local var_25_2 = 0
	local var_25_3 = #arg_25_1 - 3

	for iter_25_2 = 2, var_25_3, 2 do
		var_25_2 = var_25_2 + 1

		local var_25_4 = iter_25_2 == var_25_3 or var_25_3 < iter_25_2 + 2

		if var_25_2 % 2 == 0 then
			table.insert(var_25_0, {
				{
					id = arg_25_1[iter_25_2 + 1],
					dir = var_25_4 and var_0_2 or var_0_3
				},
				{
					id = arg_25_1[iter_25_2],
					dir = var_0_5
				}
			})
		else
			table.insert(var_25_0, {
				{
					id = arg_25_1[iter_25_2],
					dir = var_0_4
				},
				{
					id = arg_25_1[iter_25_2 + 1],
					dir = var_25_4 and var_0_1 or var_0_3
				}
			})
		end
	end

	if #arg_25_1 % 2 == 0 then
		table.insert(var_25_0, {
			{
				id = arg_25_1[#arg_25_1 - 2],
				dir = var_0_3
			}
		})
	end

	table.insert(var_25_0, {
		{
			id = arg_25_1[#arg_25_1 - 1],
			dir = var_0_3
		}
	})
	table.insert(var_25_0, {
		{
			id = arg_25_1[#arg_25_1],
			dir = var_0_6
		}
	})

	return var_25_0
end

function var_0_0.InitScheduleList(arg_26_0)
	arg_26_0.animationNodes = {}

	local var_26_0 = {}

	for iter_26_0 = 1, arg_26_0.container.childCount do
		local var_26_1 = arg_26_0.container:GetChild(iter_26_0 - 1)

		if var_26_1.name ~= "line" then
			table.insert(var_26_0, var_26_1.gameObject)
		end
	end

	if #var_26_0 > 0 then
		for iter_26_1, iter_26_2 in ipairs(var_26_0) do
			Object.Destroy(iter_26_2)
		end
	end

	local var_26_2 = {}

	for iter_26_3, iter_26_4 in ipairs(arg_26_0.voteIdList) do
		var_26_2[iter_26_4] = arg_26_0:GetRaceState(iter_26_4)
	end

	local var_26_3 = 1

	for iter_26_5, iter_26_6 in ipairs(arg_26_0.displayList) do
		local var_26_4
		local var_26_5 = iter_26_5 == #arg_26_0.displayList

		if var_26_5 then
			var_26_4 = cloneTplTo(arg_26_0.layoutTpl1, arg_26_0.container)
		else
			var_26_4 = cloneTplTo(arg_26_0.layoutTpl, arg_26_0.container)
		end

		if arg_26_0:GenRaceList(var_26_4, iter_26_6, var_26_2, var_26_5) then
			var_26_3 = iter_26_5
		end
	end

	local var_26_6 = false

	for iter_26_7, iter_26_8 in pairs(var_26_2) do
		if pg.activity_vote[iter_26_7].type == VoteConst.RACE_TYPE_FINAL and iter_26_8 == var_0_8 then
			var_26_6 = true

			break
		end
	end

	if var_26_6 then
		cloneTplTo(arg_26_0.layoutTpl, arg_26_0.container)
	end

	return var_26_3
end

function var_0_0.GenRaceList(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	local var_27_0 = false
	local var_27_1

	if arg_27_4 then
		var_27_1 = UIItemList.New(arg_27_1:Find("content"), arg_27_0.raceTpl1)
	else
		var_27_1 = UIItemList.New(arg_27_1:Find("content"), arg_27_0.raceTpl)
	end

	var_27_1:make(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == UIItemList.EventUpdate then
			local var_28_0 = arg_27_2[arg_28_1 + 1]
			local var_28_1 = table.indexof(arg_27_0.voteIdList, var_28_0.id)
			local var_28_2

			if var_28_1 and var_28_1 > 0 then
				local var_28_3 = arg_27_0.voteIdList[var_28_1 + 1]

				var_28_2 = arg_27_3[var_28_3]
			end

			local var_28_4 = arg_27_3[var_28_0.id]

			arg_27_0:UpdateRace(arg_28_2, var_28_0, var_28_4, var_28_2)

			if not var_27_0 and var_28_4 == var_0_8 then
				var_27_0 = true
			end
		end
	end)
	var_27_1:align(#arg_27_2)

	return var_27_0
end

function var_0_0.GetRaceState(arg_29_0, arg_29_1)
	local var_29_0 = pg.activity_vote[arg_29_1]

	if pg.TimeMgr.GetInstance():inTime(var_29_0.time_vote) then
		return var_0_8
	elseif pg.TimeMgr.GetInstance():parseTimeFromConfig(var_29_0.time_vote[2]) <= pg.TimeMgr.GetInstance():GetServerTime() then
		return var_0_7
	else
		return var_0_9
	end
end

function var_0_0.UpdateRace(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
	local var_30_0 = pg.activity_vote[arg_30_2.id]
	local var_30_1 = arg_30_0:UpdateRaceLink(arg_30_1, arg_30_2, arg_30_4 and arg_30_4 ~= var_0_9)

	arg_30_0:UpdateRaceState(arg_30_1, var_30_0, arg_30_3)

	arg_30_0.animationNodes[arg_30_2.id] = {
		arg_30_1,
		var_30_1
	}
end

local function var_0_11(arg_31_0, arg_31_1)
	if arg_31_1 == var_0_9 then
		return "border_close"
	elseif arg_31_0.type == VoteConst.RACE_TYPE_FINAL then
		return "border_finals"
	else
		return "border_open"
	end
end

local function var_0_12(arg_32_0, arg_32_1)
	if arg_32_1 == var_0_9 then
		return "frame_title_close"
	elseif arg_32_0.type == VoteConst.RACE_TYPE_FINAL then
		return "frame_title_finals"
	elseif arg_32_0.type == VoteConst.RACE_TYPE_RESURGENCE then
		return "frame_title_rec"
	elseif arg_32_0.type == VoteConst.RACE_TYPE_FUN then
		if arg_32_0.sub_type == VoteConst.RACE_SUBTYPE_SIRE then
			return "frame_title_sire"
		elseif arg_32_0.sub_type == VoteConst.RACE_SUBTYPE_META then
			return "frame_title_META"
		elseif arg_32_0.sub_type == VoteConst.RACE_SUBTYPE_KID then
			return "frame_title_kid"
		end
	else
		return "frame_title"
	end
end

local function var_0_13(arg_33_0, arg_33_1)
	if arg_33_0.type == VoteConst.RACE_TYPE_FUN then
		if arg_33_0.sub_type == VoteConst.RACE_SUBTYPE_SIRE then
			return "icon_sire"
		elseif arg_33_0.sub_type == VoteConst.RACE_SUBTYPE_META then
			return "icon_META"
		elseif arg_33_0.sub_type == VoteConst.RACE_SUBTYPE_KID then
			return "icon_kid"
		end
	end

	return nil
end

function var_0_0.UpdateRaceState(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	arg_34_1:Find("border"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/VoteScheduleUI_atlas", var_0_11(arg_34_2, arg_34_3))
	arg_34_1:Find("title"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/VoteScheduleUI_atlas", var_0_12(arg_34_2, arg_34_3))

	local var_34_0 = var_0_13(arg_34_2, arg_34_3)

	setActive(arg_34_1:Find("title/content/icon"), var_34_0)

	if var_34_0 then
		arg_34_1:Find("title/content/icon"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/VoteScheduleUI_atlas", var_34_0)
	end

	local var_34_1 = arg_34_3 ~= var_0_9 and arg_34_2.type == VoteConst.RACE_TYPE_RESURGENCE and "#074e51" or COLOR_WHITE

	setText(arg_34_1:Find("title/content/Text"), setColorStr(arg_34_2.name, var_34_1))

	local var_34_2 = VoteGroup.GetTimeDesc2(arg_34_2.time_vote, arg_34_2.type)

	setText(arg_34_1:Find("title/content/Text/Text"), setColorStr(var_34_2, var_34_1))
	setActive(arg_34_1:Find("open"), arg_34_3 == var_0_8)
	setActive(arg_34_1:Find("close"), arg_34_3 == var_0_9)
	setActive(arg_34_1:Find("list"), arg_34_3 == var_0_7)

	local var_34_3 = getProxy(VoteProxy):RawGetTempVoteGroup(arg_34_2.id)
	local var_34_4 = UIItemList.New(arg_34_1:Find("list"), arg_34_1:Find("list/ship_tpl"))

	var_34_4:make(function(arg_35_0, arg_35_1, arg_35_2)
		if arg_35_0 == UIItemList.EventUpdate then
			arg_34_0:UpdateRaceRank(var_34_3, arg_35_1 + 1, arg_35_2)
		end
	end)

	local var_34_5 = arg_34_3 == var_0_7 and var_34_3 and #var_34_3:getList() >= 3 and 3 or 0

	var_34_4:align(var_34_5)
	onButton(arg_34_0, arg_34_1, function()
		local var_36_0 = getProxy(VoteProxy):GetOpeningNonFunVoteGroup() or getProxy(VoteProxy):GetOpeningFunVoteGroup()

		if getProxy(VoteProxy):RawGetVoteGroupByConfigId(arg_34_2.id) and var_36_0 and var_36_0.id == arg_34_2.id then
			local var_36_1 = getProxy(ContextProxy):getCurrentContext()

			if var_36_1 and var_36_1.mediator == VoteMediator then
				arg_34_0:emit(var_0_0.ON_CLOSE)
			else
				arg_34_0:emit(VoteScheduleMediator.ON_VOTE)
			end
		elseif var_34_3 then
			arg_34_0:emit(VoteScheduleMediator.GO_RANK, var_34_3)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateRaceRank(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	if not arg_37_1 then
		setActive(arg_37_3, false)

		return
	end

	local var_37_0 = arg_37_1:getList()[arg_37_2]
	local var_37_1 = VoteShipItem.New(arg_37_3.gameObject)
	local var_37_2 = arg_37_1:GetRank(var_37_0)

	var_37_1:update(var_37_0, {
		rank = var_37_2
	})
end

function var_0_0.UpdateRaceLink(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	local var_38_0 = arg_38_2.dir
	local var_38_1

	if var_38_0 == var_0_1 and arg_38_3 then
		var_38_1 = cloneTplTo(arg_38_0.verLeftTpl, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(-224.42, -203.2)
		})
	elseif var_38_0 == var_0_1 then
		var_38_1 = cloneTplTo(arg_38_0.verLeftTplClose, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(-224.42, -203.2)
		})
	elseif var_38_0 == var_0_2 and arg_38_3 then
		var_38_1 = cloneTplTo(arg_38_0.verRightTpl, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(224.42, -203.2)
		})
	elseif var_38_0 == var_0_2 then
		var_38_1 = cloneTplTo(arg_38_0.verRightTplClose, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(224.42, -203.2)
		})
	elseif var_38_0 == var_0_3 and arg_38_3 then
		var_38_1 = cloneTplTo(arg_38_0.centTpl, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(0, -203.2)
		})
	elseif var_38_0 == var_0_3 then
		var_38_1 = cloneTplTo(arg_38_0.centTplClose, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(0, -203.2)
		})
	elseif var_38_0 == var_0_4 and arg_38_3 then
		var_38_1 = cloneTplTo(arg_38_0.hrzRightTpl, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(447.2, 0)
		})
	elseif var_38_0 == var_0_4 then
		var_38_1 = cloneTplTo(arg_38_0.hrzRightTplClose, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(447.2, 0)
		})
	elseif var_38_0 == var_0_5 and arg_38_3 then
		var_38_1 = cloneTplTo(arg_38_0.hrzLeftTpl, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(-447.2, 0)
		})
	elseif var_38_0 == var_0_5 then
		var_38_1 = cloneTplTo(arg_38_0.hrzLeftTplClose, arg_38_0.lineContainer)

		table.insert(arg_38_0.lineTpls, {
			var_38_1,
			arg_38_1,
			Vector2(-447.2, 0)
		})
	end

	return var_38_1
end

function var_0_0.onBackPressed(arg_39_0)
	var_0_0.super.onBackPressed(arg_39_0)
end

function var_0_0.willExit(arg_40_0)
	return
end

return var_0_0
