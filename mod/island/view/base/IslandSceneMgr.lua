local var_0_0 = class("IslandSceneMgr")
local var_0_1 = false
local var_0_2 = 1
local var_0_3 = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.scene = arg_1_1
	arg_1_0.capacity = 2
	arg_1_0.stack = {}
	arg_1_0.noStatePages = {}
	arg_1_0.pages = {}
	arg_1_0.subPages = {}
	arg_1_0.state = var_0_2
	arg_1_0.gcCnt = 0
end

function var_0_0.OpenPage(arg_2_0, arg_2_1, arg_2_2, ...)
	local var_2_0 = packEx(...)

	if arg_2_0:IsSceneType(arg_2_1) then
		local var_2_1 = arg_2_0:CreateScenePage(arg_2_2)

		arg_2_0:CheckOverflowAndDestory(var_2_1)
		arg_2_0:ClosePrevScenePage(function()
			arg_2_0:Record(IslandSceneContext.New(arg_2_2, unpackEx(var_2_0)), true)
			arg_2_0:StartPage(var_2_1, var_2_0)
		end)

		return var_2_1
	else
		local var_2_2 = arg_2_0:CreateSubPage(arg_2_1, arg_2_2)
		local var_2_3 = arg_2_0:GetContext(arg_2_1)

		assert(var_2_3, arg_2_1.__cname)
		var_2_3:AddSubPage(arg_2_2, ...)
		arg_2_0:StartPage(var_2_2, var_2_0)

		return var_2_2
	end
end

function var_0_0.GetContext(arg_4_0, arg_4_1)
	return (_.detect(arg_4_0.stack, function(arg_5_0)
		return arg_5_0.class.__cname == arg_4_1.__cname or #arg_5_0:GetSubPages() > 0 and _.any(arg_5_0:GetSubPages(), function(arg_6_0)
			return arg_6_0.class.__cname == arg_4_1.__cname
		end)
	end))
end

function var_0_0.GetPage(arg_7_0, arg_7_1)
	return _.detect(arg_7_0.pages, function(arg_8_0)
		return arg_8_0.__cname == arg_7_1.__cname
	end) or _.detect(arg_7_0.noStatePages, function(arg_9_0)
		return arg_9_0.__cname == arg_7_1.__cname
	end)
end

function var_0_0.GetSubPage(arg_10_0, arg_10_1)
	return (_.detect(arg_10_0.subPages, function(arg_11_0)
		return arg_11_0.__cname == arg_10_1.__cname
	end))
end

function var_0_0.StartPage(arg_12_0, arg_12_1, arg_12_2)
	seriesAsync({
		function(arg_13_0)
			arg_12_1:Preload(arg_13_0, unpackEx(arg_12_2))
		end
	}, function()
		arg_12_1:ExecuteAction("Show", unpackEx(arg_12_2))
	end)
end

function var_0_0.CreateScenePage(arg_15_0, arg_15_1)
	local var_15_0 = _.detect(arg_15_0.pages, function(arg_16_0)
		return arg_16_0.__cname == arg_15_1.__cname
	end)

	if var_15_0 then
		table.removebyvalue(arg_15_0.pages, var_15_0)
	end

	local var_15_1 = var_15_0 or arg_15_1.New(arg_15_0.scene, arg_15_0.scene.uiContainer)
	local var_15_2 = var_15_1:NeedCache() and arg_15_0.pages or arg_15_0.noStatePages

	table.insert(var_15_2, var_15_1)

	return var_15_1
end

function var_0_0.CreateSubPage(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = _.detect(arg_17_0.subPages, function(arg_18_0)
		return arg_18_0.__cname == arg_17_2.__cname
	end)

	if var_17_0 then
		table.removebyvalue(arg_17_0.subPages, var_17_0)
	end

	local var_17_1 = var_17_0 or arg_17_2.New(arg_17_0.scene, arg_17_0.scene.pageContainer)

	table.insert(arg_17_0.subPages, var_17_1)

	return var_17_1
end

function var_0_0.ClosePrevScenePage(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.stack[#arg_19_0.stack]

	if var_19_0 then
		local var_19_1 = arg_19_0:GetPage(var_19_0.class)

		if var_19_1 and var_19_1:GetLoaded() and var_19_1:isShowing() then
			var_19_1:Disable(arg_19_1)

			for iter_19_0, iter_19_1 in ipairs(var_19_0:GetSubPages()) do
				local var_19_2 = arg_19_0:GetSubPage(iter_19_1.class)

				if var_19_2:GetLoaded() then
					var_19_2:Disable()
				end
			end
		else
			arg_19_1()
		end
	else
		arg_19_1()
	end
end

function var_0_0.CheckOverflowAndDestory(arg_20_0, arg_20_1)
	if #arg_20_0.pages > arg_20_0.capacity then
		local var_20_0 = arg_20_0:GetLongestNoUsePage(arg_20_1)
		local var_20_1 = arg_20_0:GetContext(var_20_0.class)

		if var_20_1 then
			var_20_1:DisabelDelRecordWhenClose()
		end

		arg_20_0:DestroyPage(var_20_0, nil, true)

		arg_20_0.gcCnt = arg_20_0.gcCnt + 1

		if arg_20_0.gcCnt % 5 == 0 then
			gcAll(false)

			arg_20_0.gcCnt = 0
		end
	end
end

function var_0_0.GetLongestNoUsePage(arg_21_0, arg_21_1)
	local function var_21_0(arg_22_0)
		return arg_21_0:GetContext(arg_22_0.class) ~= nil
	end

	local var_21_1 = 0

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.pages) do
		if arg_21_1 ~= iter_21_1 and not var_21_0(iter_21_1) then
			var_21_1 = iter_21_0

			break
		end
	end

	local var_21_2 = math.max(var_21_1, 1)

	return arg_21_0.pages[var_21_2]
end

function var_0_0.ClosePage(arg_23_0, arg_23_1)
	if not (arg_23_0:CheckAndCloseSubPage(arg_23_1) or arg_23_0:CheckAndCloseNoStatePage(arg_23_1)) then
		arg_23_0:CheckAndCloseScenePage(arg_23_1)
	end

	arg_23_0:Debug()
end

function var_0_0.CheckAndCloseScenePage(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:GetContext(arg_24_1)

	if var_24_0 then
		local var_24_1 = arg_24_0:GetPage(var_24_0.class)

		if var_24_1 and var_24_1:GetLoaded() and var_24_1:isShowing() then
			local var_24_2 = var_24_0:GetOpenPrevWhenClose()

			if var_24_0:GetDelRecordWhenClose() then
				arg_24_0:DelRecord(var_24_0)
			end

			var_24_1:Disable()

			for iter_24_0, iter_24_1 in ipairs(var_24_0:GetSubPages()) do
				local var_24_3 = arg_24_0:GetSubPage(iter_24_1.class)

				if var_24_3:GetLoaded() then
					var_24_3:Destroy()
					table.removebyvalue(arg_24_0.subPages, var_24_3)
				end
			end

			if var_24_2 then
				arg_24_0:OpenPrevScenePage()
			end
		end

		return var_24_1 ~= nil
	end

	return false
end

function var_0_0.OpenPrevScenePage(arg_25_0)
	if arg_25_0:IsDestroyed() then
		return
	end

	local var_25_0 = arg_25_0.stack[#arg_25_0.stack]

	if var_25_0 then
		local var_25_1 = arg_25_0:GetPage(var_25_0.class)

		if var_25_1 and var_25_1:GetLoaded() and var_25_1:isShowing() then
			arg_25_0:Record(var_25_0)
			var_25_1:Enable()

			for iter_25_0, iter_25_1 in ipairs(var_25_0:GetSubPages()) do
				if iter_25_1.__visible then
					local var_25_2 = arg_25_0:GetSubPage(iter_25_1.class)

					if var_25_2:GetLoaded() then
						var_25_2:Disable()
					end
				end
			end
		else
			arg_25_0:DelRecord(var_25_0)

			local var_25_3 = arg_25_0:OpenPage(arg_25_0.scene, var_25_0.class, unpackEx(var_25_0:GetData()))

			for iter_25_2, iter_25_3 in ipairs(var_25_0:GetSubPages()) do
				if iter_25_3.__visible then
					arg_25_0:OpenPage(var_25_3, iter_25_3.class, unpackEx(iter_25_3:GetData()))
				end
			end
		end
	end
end

function var_0_0.CheckAndCloseSubPage(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0:GetContext(arg_26_1)

	if var_26_0 then
		for iter_26_0, iter_26_1 in ipairs(var_26_0:GetSubPages()) do
			if iter_26_1.class.__cname == arg_26_1.__cname then
				local var_26_1 = arg_26_0:GetSubPage(iter_26_1.class)

				if var_26_1:GetLoaded() then
					iter_26_1.__visible = false

					var_26_1:Disable()
				end

				return true
			end
		end
	end

	return false
end

function var_0_0.CheckAndCloseNoStatePage(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0:GetContext(arg_27_1)
	local var_27_1 = false

	if var_27_0 then
		local var_27_2 = _.detect(arg_27_0.noStatePages, function(arg_28_0)
			return arg_28_0.__cname == arg_27_1.__cname
		end)

		if var_27_2 then
			arg_27_0:DelRecord(var_27_0)
			arg_27_0:DestroyPage(var_27_2, var_27_0)
			arg_27_0:OpenPrevScenePage()

			var_27_1 = true
		end
	end

	return var_27_1
end

function var_0_0.DestroyPage(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	arg_29_2 = arg_29_2 or arg_29_0:GetContext(arg_29_1.class)

	if arg_29_2 then
		arg_29_2:DisabelOpenPrevWhenClose()

		for iter_29_0, iter_29_1 in ipairs(arg_29_2:GetSubPages()) do
			local var_29_0 = arg_29_0:GetSubPage(iter_29_1.class)

			if var_29_0:GetLoaded() then
				var_29_0:Destroy()
				table.removebyvalue(arg_29_0.subPages, arg_29_1)
			end
		end
	end

	if arg_29_1:GetLoaded() then
		arg_29_1:Destroy(arg_29_3)

		if arg_29_1:NeedCache() then
			table.removebyvalue(arg_29_0.pages, arg_29_1)
		else
			table.removebyvalue(arg_29_0.noStatePages, arg_29_1)
		end
	end
end

function var_0_0.Record(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_0:IsDestroyed() then
		return
	end

	local var_30_0 = _.detect(arg_30_0.stack, function(arg_31_0)
		return arg_31_0.class == arg_30_1.class
	end)

	if var_30_0 then
		table.removebyvalue(arg_30_0.stack, var_30_0)
		table.insert(arg_30_0.stack, arg_30_1)

		return
	end

	table.insert(arg_30_0.stack, arg_30_1)

	if #arg_30_0.stack == 1 then
		arg_30_0:OnAnyPageOpen(arg_30_1.class)
	end
end

function var_0_0.DelRecord(arg_32_0, arg_32_1)
	if arg_32_0:IsDestroyed() then
		return
	end

	table.removebyvalue(arg_32_0.stack, arg_32_1)

	if #arg_32_0.stack == 0 then
		arg_32_0:OnAllPageClose()
	end
end

function var_0_0.OnAnyPageOpen(arg_33_0, arg_33_1)
	arg_33_0.scene:emitCore(ISLAND_EVT.ANY_PAGE_OPENED, arg_33_1)
	arg_33_0.scene:TryDisVisible()
end

function var_0_0.OnAllPageClose(arg_34_0)
	arg_34_0.scene:emitCore(ISLAND_EVT.ALL_PAGE_CLOSED)
	arg_34_0.scene:TryVisible()
end

function var_0_0.IsSceneType(arg_35_0, arg_35_1)
	return arg_35_1.__cname == arg_35_0.scene.__cname
end

function var_0_0.OnBackPressed(arg_36_0)
	local var_36_0 = arg_36_0.stack[#arg_36_0.stack]

	if var_36_0 then
		local var_36_1 = arg_36_0:GetPage(var_36_0.class)

		if var_36_1 and var_36_1:CanEsc() then
			var_36_1:Hide()
		end

		return true
	end

	return false
end

function var_0_0.IsDestroyed(arg_37_0)
	return arg_37_0.state == var_0_3
end

function var_0_0.Dispose(arg_38_0)
	arg_38_0.state = var_0_3

	for iter_38_0 = #arg_38_0.pages, 1, -1 do
		local var_38_0 = arg_38_0.pages[iter_38_0]

		var_38_0:ActiveOrDisactive(false)
		arg_38_0:DestroyPage(var_38_0)
	end

	for iter_38_1 = #arg_38_0.noStatePages, 1, -1 do
		local var_38_1 = arg_38_0.noStatePages[iter_38_1]

		var_38_1:ActiveOrDisactive(false)
		arg_38_0:DestroyPage(var_38_1)
	end

	arg_38_0.stack = nil
	arg_38_0.noStatePages = nil
	arg_38_0.pages = nil
	arg_38_0.subPages = nil
end

function var_0_0.Debug(arg_39_0)
	if not var_0_1 then
		return
	end

	local function var_39_0(arg_40_0)
		local var_40_0 = _.map(arg_40_0:GetSubPages(), function(arg_41_0)
			return arg_41_0.class.__cname
		end)

		return table.concat(var_40_0, ",")
	end

	local var_39_1 = _.map(arg_39_0.stack, function(arg_42_0)
		return arg_42_0.class.__cname .. ":[" .. var_39_0(arg_42_0) .. "]"
	end)
	local var_39_2 = table.concat(var_39_1, "\n")

	print("\n" .. var_39_2)
end

return var_0_0
