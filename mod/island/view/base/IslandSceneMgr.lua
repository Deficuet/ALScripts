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

		arg_2_0:CheckOverflowAndDestory()
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

function var_0_0.CheckOverflowAndDestory(arg_20_0)
	if #arg_20_0.pages > arg_20_0.capacity then
		local var_20_0 = arg_20_0.pages[1]
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

function var_0_0.ClosePage(arg_21_0, arg_21_1)
	if not (arg_21_0:CheckAndCloseSubPage(arg_21_1) or arg_21_0:CheckAndCloseNoStatePage(arg_21_1)) then
		arg_21_0:CheckAndCloseScenePage(arg_21_1)
	end

	arg_21_0:Debug()
end

function var_0_0.CheckAndCloseScenePage(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetContext(arg_22_1)

	if var_22_0 then
		local var_22_1 = arg_22_0:GetPage(var_22_0.class)

		if var_22_1 and var_22_1:GetLoaded() and var_22_1:isShowing() then
			local var_22_2 = var_22_0:GetOpenPrevWhenClose()

			if var_22_0:GetDelRecordWhenClose() then
				arg_22_0:DelRecord(var_22_0)
			end

			var_22_1:Disable()

			for iter_22_0, iter_22_1 in ipairs(var_22_0:GetSubPages()) do
				local var_22_3 = arg_22_0:GetSubPage(iter_22_1.class)

				if var_22_3:GetLoaded() then
					var_22_3:Destroy()
					table.removebyvalue(arg_22_0.subPages, var_22_3)
				end
			end

			if var_22_2 then
				arg_22_0:OpenPrevScenePage()
			end
		end

		return var_22_1 ~= nil
	end

	return false
end

function var_0_0.OpenPrevScenePage(arg_23_0)
	if arg_23_0:IsDestroyed() then
		return
	end

	local var_23_0 = arg_23_0.stack[#arg_23_0.stack]

	if var_23_0 then
		local var_23_1 = arg_23_0:GetPage(var_23_0.class)

		if var_23_1 and var_23_1:GetLoaded() and var_23_1:isShowing() then
			var_23_1:Enable()

			for iter_23_0, iter_23_1 in ipairs(var_23_0:GetSubPages()) do
				if iter_23_1.__visible then
					local var_23_2 = arg_23_0:GetSubPage(iter_23_1.class)

					if var_23_2:GetLoaded() then
						var_23_2:Disable()
					end
				end
			end
		else
			arg_23_0:DelRecord(var_23_0)

			local var_23_3 = arg_23_0:OpenPage(arg_23_0.scene, var_23_0.class, unpackEx(var_23_0:GetData()))

			for iter_23_2, iter_23_3 in ipairs(var_23_0:GetSubPages()) do
				if iter_23_3.__visible then
					arg_23_0:OpenPage(var_23_3, iter_23_3.class, unpackEx(iter_23_3:GetData()))
				end
			end
		end
	end
end

function var_0_0.CheckAndCloseSubPage(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:GetContext(arg_24_1)

	if var_24_0 then
		for iter_24_0, iter_24_1 in ipairs(var_24_0:GetSubPages()) do
			if iter_24_1.class.__cname == arg_24_1.__cname then
				local var_24_1 = arg_24_0:GetSubPage(iter_24_1.class)

				if var_24_1:GetLoaded() then
					iter_24_1.__visible = false

					var_24_1:Disable()
				end

				return true
			end
		end
	end

	return false
end

function var_0_0.CheckAndCloseNoStatePage(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0:GetContext(arg_25_1)
	local var_25_1 = false

	if var_25_0 then
		local var_25_2 = _.detect(arg_25_0.noStatePages, function(arg_26_0)
			return arg_26_0.__cname == arg_25_1.__cname
		end)

		if var_25_2 then
			arg_25_0:DelRecord(var_25_0)
			arg_25_0:DestroyPage(var_25_2, var_25_0)
			arg_25_0:OpenPrevScenePage()

			var_25_1 = true
		end
	end

	return var_25_1
end

function var_0_0.DestroyPage(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	arg_27_2 = arg_27_2 or arg_27_0:GetContext(arg_27_1.class)

	if arg_27_2 then
		arg_27_2:DisabelOpenPrevWhenClose()

		for iter_27_0, iter_27_1 in ipairs(arg_27_2:GetSubPages()) do
			local var_27_0 = arg_27_0:GetSubPage(iter_27_1.class)

			if var_27_0:GetLoaded() then
				var_27_0:Destroy()
				table.removebyvalue(arg_27_0.subPages, arg_27_1)
			end
		end
	end

	if arg_27_1:GetLoaded() then
		arg_27_1:Destroy(arg_27_3)

		if arg_27_1:NeedCache() then
			table.removebyvalue(arg_27_0.pages, arg_27_1)
		else
			table.removebyvalue(arg_27_0.noStatePages, arg_27_1)
		end
	end
end

function var_0_0.Record(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_0:IsDestroyed() then
		return
	end

	if _.any(arg_28_0.stack, function(arg_29_0)
		return arg_29_0.class == arg_28_1.class
	end) then
		return
	end

	table.insert(arg_28_0.stack, arg_28_1)

	if #arg_28_0.stack == 1 then
		arg_28_0:OnAnyPageOpen(arg_28_1.class)
	end
end

function var_0_0.DelRecord(arg_30_0, arg_30_1)
	if arg_30_0:IsDestroyed() then
		return
	end

	table.removebyvalue(arg_30_0.stack, arg_30_1)

	if #arg_30_0.stack == 0 then
		arg_30_0:OnAllPageClose()
	end
end

function var_0_0.OnAnyPageOpen(arg_31_0, arg_31_1)
	arg_31_0.scene:emitCore(ISLAND_EVT.ANY_PAGE_OPENED, arg_31_1)
	arg_31_0.scene:TryDisVisible()
end

function var_0_0.OnAllPageClose(arg_32_0)
	arg_32_0.scene:emitCore(ISLAND_EVT.ALL_PAGE_CLOSED)
	arg_32_0.scene:TryVisible()
end

function var_0_0.IsSceneType(arg_33_0, arg_33_1)
	return arg_33_1.__cname == arg_33_0.scene.__cname
end

function var_0_0.OnBackPressed(arg_34_0)
	for iter_34_0 = #arg_34_0.noStatePages, 1, -1 do
		local var_34_0 = arg_34_0.noStatePages[iter_34_0]

		arg_34_0:ClosePage(var_34_0.class)

		return true
	end

	for iter_34_1 = #arg_34_0.pages, 1, -1 do
		local var_34_1 = arg_34_0.pages[iter_34_1]

		if var_34_1:CanEsc() then
			arg_34_0:ClosePage(var_34_1.class)
		end

		return true
	end

	return false
end

function var_0_0.IsDestroyed(arg_35_0)
	return arg_35_0.state == var_0_3
end

function var_0_0.Dispose(arg_36_0)
	arg_36_0.state = var_0_3

	for iter_36_0 = #arg_36_0.pages, 1, -1 do
		local var_36_0 = arg_36_0.pages[iter_36_0]

		var_36_0:ActiveOrDisactive(false)
		arg_36_0:DestroyPage(var_36_0)
	end

	for iter_36_1 = #arg_36_0.noStatePages, 1, -1 do
		local var_36_1 = arg_36_0.noStatePages[iter_36_1]

		var_36_1:ActiveOrDisactive(false)
		arg_36_0:DestroyPage(var_36_1)
	end

	arg_36_0.stack = nil
	arg_36_0.noStatePages = nil
	arg_36_0.pages = nil
	arg_36_0.subPages = nil
end

function var_0_0.Debug(arg_37_0)
	if not var_0_1 then
		return
	end

	local function var_37_0(arg_38_0)
		local var_38_0 = _.map(arg_38_0:GetSubPages(), function(arg_39_0)
			return arg_39_0.class.__cname
		end)

		return table.concat(var_38_0, ",")
	end

	local var_37_1 = _.map(arg_37_0.stack, function(arg_40_0)
		return arg_40_0.class.__cname .. ":[" .. var_37_0(arg_40_0) .. "]"
	end)
	local var_37_2 = table.concat(var_37_1, "\n")

	print("\n" .. var_37_2)
end

return var_0_0
