local var_0_0 = class("IslandSceneMgr")
local var_0_1 = false
local var_0_2 = 1
local var_0_3 = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.scene = arg_1_1
	arg_1_0.capacity = 3
	arg_1_0.stack = {}
	arg_1_0.noStatePages = {}
	arg_1_0.pages = {}
	arg_1_0.subPages = {}
	arg_1_0.state = var_0_2
	arg_1_0.gcCnt = 0
end

function var_0_0.OpenPage(arg_2_0, arg_2_1, arg_2_2, ...)
	local var_2_0

	if arg_2_0:IsSceneType(arg_2_1) then
		arg_2_0:ClosePrevScenePage()

		var_2_0 = arg_2_0:CreateScenePage(arg_2_2)

		arg_2_0:CheckOverflowAndDestory()
		arg_2_0:Record(IslandSceneContext.New(arg_2_2, ...), true)
	else
		var_2_0 = arg_2_0:CreateSubPage(arg_2_1, arg_2_2)

		local var_2_1 = arg_2_0:GetContext(arg_2_1)

		assert(var_2_1, arg_2_1.__cname)
		var_2_1:AddSubPage(arg_2_2, ...)
	end

	arg_2_0:StartPage(var_2_0, ...)
	arg_2_0:Debug()

	return var_2_0
end

function var_0_0.GetContext(arg_3_0, arg_3_1)
	return (_.detect(arg_3_0.stack, function(arg_4_0)
		return arg_4_0.class.__cname == arg_3_1.__cname or #arg_4_0:GetSubPages() > 0 and _.any(arg_4_0:GetSubPages(), function(arg_5_0)
			return arg_5_0.class.__cname == arg_3_1.__cname
		end)
	end))
end

function var_0_0.GetPage(arg_6_0, arg_6_1)
	return _.detect(arg_6_0.pages, function(arg_7_0)
		return arg_7_0.__cname == arg_6_1.__cname
	end) or _.detect(arg_6_0.noStatePages, function(arg_8_0)
		return arg_8_0.__cname == arg_6_1.__cname
	end)
end

function var_0_0.GetSubPage(arg_9_0, arg_9_1)
	return (_.detect(arg_9_0.subPages, function(arg_10_0)
		return arg_10_0.__cname == arg_9_1.__cname
	end))
end

function var_0_0.StartPage(arg_11_0, arg_11_1, ...)
	local var_11_0 = packEx(...)

	seriesAsync({
		function(arg_12_0)
			arg_11_1:Preload(arg_12_0, unpackEx(var_11_0))
		end
	}, function()
		arg_11_1:ExecuteAction("Show", unpackEx(var_11_0))
	end)
end

function var_0_0.CreateScenePage(arg_14_0, arg_14_1)
	local var_14_0 = _.detect(arg_14_0.pages, function(arg_15_0)
		return arg_15_0.__cname == arg_14_1.__cname
	end)

	if var_14_0 then
		table.removebyvalue(arg_14_0.pages, var_14_0)
	end

	local var_14_1 = var_14_0 or arg_14_1.New(arg_14_0.scene, arg_14_0.scene.uiContainer)
	local var_14_2 = var_14_1:NeedCache() and arg_14_0.pages or arg_14_0.noStatePages

	table.insert(var_14_2, var_14_1)

	return var_14_1
end

function var_0_0.CreateSubPage(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = _.detect(arg_16_0.subPages, function(arg_17_0)
		return arg_17_0.__cname == arg_16_2.__cname
	end)

	if var_16_0 then
		table.removebyvalue(arg_16_0.subPages, var_16_0)
	end

	local var_16_1 = var_16_0 or arg_16_2.New(arg_16_0.scene, arg_16_0.scene.pageContainer)

	table.insert(arg_16_0.subPages, var_16_1)

	return var_16_1
end

function var_0_0.ClosePrevScenePage(arg_18_0)
	local var_18_0 = arg_18_0.stack[#arg_18_0.stack]

	if var_18_0 then
		local var_18_1 = arg_18_0:GetPage(var_18_0.class)

		if var_18_1 and var_18_1:GetLoaded() and var_18_1:isShowing() then
			var_18_1:Disable()

			for iter_18_0, iter_18_1 in ipairs(var_18_0:GetSubPages()) do
				local var_18_2 = arg_18_0:GetSubPage(iter_18_1.class)

				if var_18_2:GetLoaded() then
					var_18_2:Disable()
				end
			end
		end
	end
end

function var_0_0.CheckOverflowAndDestory(arg_19_0)
	if #arg_19_0.pages > arg_19_0.capacity then
		local var_19_0 = arg_19_0.pages[1]

		arg_19_0:DestroyPage(var_19_0)

		arg_19_0.gcCnt = arg_19_0.gcCnt + 1

		if arg_19_0.gcCnt % 3 == 0 then
			gcAll(false)

			arg_19_0.gcCnt = 0
		end
	end
end

function var_0_0.ClosePage(arg_20_0, arg_20_1)
	if not (arg_20_0:CheckAndCloseSubPage(arg_20_1) or arg_20_0:CheckAndCloseNoStatePage(arg_20_1)) then
		arg_20_0:CheckAndCloseScenePage(arg_20_1)
	end

	arg_20_0:Debug()
end

function var_0_0.CheckAndCloseScenePage(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:GetContext(arg_21_1)

	if var_21_0 then
		local var_21_1 = arg_21_0:GetPage(var_21_0.class)

		if var_21_1 and var_21_1:GetLoaded() and var_21_1:isShowing() then
			arg_21_0:DelRecord(var_21_0)
			var_21_1:Disable()

			for iter_21_0, iter_21_1 in ipairs(var_21_0:GetSubPages()) do
				local var_21_2 = arg_21_0:GetSubPage(iter_21_1.class)

				if var_21_2:GetLoaded() then
					var_21_2:Destroy()
					table.removebyvalue(arg_21_0.subPages, var_21_2)
				end
			end

			arg_21_0:OpenPrevScenePage()
		end

		return var_21_1 ~= nil
	end

	return false
end

function var_0_0.OpenPrevScenePage(arg_22_0)
	if arg_22_0:IsDestroyed() then
		return
	end

	local var_22_0 = arg_22_0.stack[#arg_22_0.stack]

	if var_22_0 then
		local var_22_1 = arg_22_0:GetPage(var_22_0.class)

		if var_22_1 and var_22_1:GetLoaded() and var_22_1:isShowing() then
			var_22_1:Enable()

			for iter_22_0, iter_22_1 in ipairs(var_22_0:GetSubPages()) do
				if iter_22_1.__visible then
					local var_22_2 = arg_22_0:GetSubPage(iter_22_1.class)

					if var_22_2:GetLoaded() then
						var_22_2:Disable()
					end
				end
			end
		else
			arg_22_0:DelRecord(var_22_0)

			local var_22_3 = arg_22_0:OpenPage(arg_22_0.scene, var_22_0.class, unpackEx(var_22_0:GetData()))

			for iter_22_2, iter_22_3 in ipairs(var_22_0:GetSubPages()) do
				if iter_22_3.__visible then
					arg_22_0:OpenPage(var_22_3, iter_22_3.class, unpackEx(iter_22_3:GetData()))
				end
			end
		end
	end
end

function var_0_0.CheckAndCloseSubPage(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:GetContext(arg_23_1)

	if var_23_0 then
		for iter_23_0, iter_23_1 in ipairs(var_23_0:GetSubPages()) do
			if iter_23_1.class.__cname == arg_23_1.__cname then
				local var_23_1 = arg_23_0:GetSubPage(iter_23_1.class)

				if var_23_1:GetLoaded() then
					iter_23_1.__visible = false

					var_23_1:Disable()
				end

				return true
			end
		end
	end

	return false
end

function var_0_0.CheckAndCloseNoStatePage(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:GetContext(arg_24_1)
	local var_24_1 = false

	if var_24_0 then
		local var_24_2 = _.detect(arg_24_0.noStatePages, function(arg_25_0)
			return arg_25_0.__cname == arg_24_1.__cname
		end)

		if var_24_2 then
			arg_24_0:DelRecord(var_24_0)
			arg_24_0:DestroyPage(var_24_2, var_24_0)
			arg_24_0:OpenPrevScenePage()

			var_24_1 = true
		end
	end

	return var_24_1
end

function var_0_0.DestroyPage(arg_26_0, arg_26_1, arg_26_2)
	arg_26_2 = arg_26_2 or arg_26_0:GetContext(arg_26_1.class)

	if arg_26_2 then
		for iter_26_0, iter_26_1 in ipairs(arg_26_2:GetSubPages()) do
			local var_26_0 = arg_26_0:GetSubPage(iter_26_1.class)

			if var_26_0:GetLoaded() then
				var_26_0:Destroy()
				table.removebyvalue(arg_26_0.subPages, arg_26_1)
			end
		end
	end

	if arg_26_1:GetLoaded() then
		arg_26_1:Destroy()

		if arg_26_1:NeedCache() then
			table.removebyvalue(arg_26_0.pages, arg_26_1)
		else
			table.removebyvalue(arg_26_0.noStatePages, arg_26_1)
		end
	end
end

function var_0_0.Record(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_0:IsDestroyed() then
		return
	end

	if _.any(arg_27_0.stack, function(arg_28_0)
		return arg_28_0.class == arg_27_1.class
	end) then
		return
	end

	table.insert(arg_27_0.stack, arg_27_1)

	if #arg_27_0.stack == 1 then
		arg_27_0:OnAnyPageOpen(arg_27_1.class)
	end
end

function var_0_0.DelRecord(arg_29_0, arg_29_1)
	if arg_29_0:IsDestroyed() then
		return
	end

	table.removebyvalue(arg_29_0.stack, arg_29_1)

	if #arg_29_0.stack == 0 then
		arg_29_0:OnAllPageClose()
	end
end

function var_0_0.OnAnyPageOpen(arg_30_0, arg_30_1)
	arg_30_0.scene:emitCore(ISLAND_EVT.ANY_PAGE_OPENED, arg_30_1)
	arg_30_0.scene:TryDisVisible()
end

function var_0_0.OnAllPageClose(arg_31_0)
	arg_31_0.scene:emitCore(ISLAND_EVT.ALL_PAGE_CLOSED)
	arg_31_0.scene:TryVisible()
end

function var_0_0.IsSceneType(arg_32_0, arg_32_1)
	return arg_32_1.__cname == arg_32_0.scene.__cname
end

function var_0_0.OnBackPressed(arg_33_0)
	for iter_33_0 = #arg_33_0.noStatePages, 1, -1 do
		local var_33_0 = arg_33_0.noStatePages[iter_33_0]

		arg_33_0:ClosePage(var_33_0.class)

		return true
	end

	for iter_33_1 = #arg_33_0.pages, 1, -1 do
		local var_33_1 = arg_33_0.pages[iter_33_1]

		arg_33_0:ClosePage(var_33_1.class)

		return true
	end

	return false
end

function var_0_0.IsDestroyed(arg_34_0)
	return arg_34_0.state == var_0_3
end

function var_0_0.Dispose(arg_35_0)
	arg_35_0.state = var_0_3

	for iter_35_0 = #arg_35_0.pages, 1, -1 do
		local var_35_0 = arg_35_0.pages[iter_35_0]

		arg_35_0:DestroyPage(var_35_0)
	end

	for iter_35_1 = #arg_35_0.noStatePages, 1, -1 do
		local var_35_1 = arg_35_0.noStatePages[iter_35_1]

		arg_35_0:DestroyPage(var_35_1)
	end

	arg_35_0.stack = nil
	arg_35_0.noStatePages = nil
	arg_35_0.pages = nil
	arg_35_0.subPages = nil
end

function var_0_0.Debug(arg_36_0)
	if not var_0_1 then
		return
	end

	local function var_36_0(arg_37_0)
		local var_37_0 = _.map(arg_37_0:GetSubPages(), function(arg_38_0)
			return arg_38_0.class.__cname
		end)

		return table.concat(var_37_0, ",")
	end

	local var_36_1 = _.map(arg_36_0.stack, function(arg_39_0)
		return arg_39_0.class.__cname .. ":[" .. var_36_0(arg_39_0) .. "]"
	end)
	local var_36_2 = table.concat(var_36_1, "\n")

	print("\n" .. var_36_2)
end

return var_0_0
