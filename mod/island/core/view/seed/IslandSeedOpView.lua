local var_0_0 = class("IslandSeedOpView", import("..IslandBaseOpView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandSeedOpUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0.seedSelectPlane = arg_2_0._tf:Find("seed_select")
	arg_2_0.seed_detals = arg_2_0._tf:Find("seed_detals")
	arg_2_0.uiSeedItemList = UIItemList.New(arg_2_0.seedSelectPlane:Find("content"), arg_2_0.seedSelectPlane:Find("content/itemSeed"))

	onButton(arg_2_0, arg_2_0._tf, function()
		setActive(arg_2_0.seed_detals, false)
		arg_2_0:ActiveSeedSelect(false)
	end, SFX_PANEL)
	setActive(arg_2_0.seed_detals, false)
	arg_2_0:ActiveSeedSelect(false)
end

function var_0_0.ActiveSeedDetals(arg_4_0, arg_4_1)
	setActive(arg_4_0.seed_detals, arg_4_1)
end

function var_0_0.ActiveSeedSelect(arg_5_0, arg_5_1)
	if arg_5_1 then
		local var_5_0 = arg_5_0:GetView():GetSubView(IslandOpView):GetSeedBtnWorldPos()
		local var_5_1 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
		local var_5_2 = var_5_1:WorldToScreenPoint(var_5_0)
		local var_5_3 = LuaHelper.ScreenToLocal(arg_5_0._tf, var_5_2, var_5_1)

		arg_5_0.seedSelectPlane.localPosition = var_5_3

		arg_5_0._tf:SetAsLastSibling()
	end

	setActive(arg_5_0.seedSelectPlane, arg_5_1)
	setActive(arg_5_0._tf, arg_5_1)
end

function var_0_0.RefreshSeedPlane(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1:GetDataVO().slotData.configId
	local var_6_1 = pg.island_production_slot[var_6_0].place
	local var_6_2 = pg.island_production_place[var_6_1].seed_list
	local var_6_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_6_4 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_2) do
		local var_6_5 = pg.island_farm_seed[iter_6_1].itemid

		if var_6_3:GetItemById(var_6_5) then
			table.insert(var_6_4, iter_6_1)
		end
	end

	local var_6_6 = #var_6_4
	local var_6_7 = 30
	local var_6_8 = 40
	local var_6_9 = arg_6_0.seedSelectPlane:Find("content"):GetComponent(typeof(GridLayoutGroup))
	local var_6_10 = var_6_9.cellSize.x
	local var_6_11 = var_6_9.cellSize.y
	local var_6_12 = math.min(var_6_6, 7)
	local var_6_13 = math.ceil(var_6_6 / 7)
	local var_6_14 = var_6_10 * var_6_12 + var_6_9.spacing.x * (var_6_12 - 1) + var_6_9.padding.right + var_6_8
	local var_6_15 = var_6_11 * var_6_13 + var_6_9.spacing.y * (var_6_13 - 1) + var_6_9.padding.bottom + var_6_7

	arg_6_0.seedSelectPlane:Find("content").sizeDelta = Vector2(var_6_14, var_6_15)

	arg_6_0.uiSeedItemList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = var_6_4[arg_7_1 + 1]

			setActive(arg_7_2:Find("select"), arg_6_0.selectseedItemId == var_7_0)

			local var_7_1 = pg.island_farm_seed[var_7_0].itemid
			local var_7_2 = var_6_3:GetItemById(var_7_1)

			updateCustomDrop(arg_7_2, Drop.New({
				type = DROP_TYPE_ISLAND_ITEM,
				id = var_7_2.id,
				count = var_7_2:GetCount()
			}))

			local var_7_3

			onButton(arg_6_0, arg_7_2, function()
				if var_7_3 then
					var_7_3 = false

					return
				end

				arg_6_0.selectseedItemId = var_7_0

				PlayerPrefs.SetInt("island_last_selectItemId" .. var_6_1, arg_6_0.selectseedItemId)
				arg_6_0.uiSeedItemList:align(var_6_6)
				arg_6_0:GetView():GetSubView(IslandOpView):RefreshCurrentSlectSeed()
				arg_6_0:ActiveSeedSelect(false)
				setActive(arg_6_0.seed_detals, false)
			end, SFX_PANEL)
			GetOrAddComponent(arg_7_2, typeof(UILongPressTrigger)).onLongPressed:AddListener(function()
				var_7_3 = true

				setActive(arg_6_0.seed_detals, true)

				arg_6_0.seed_detals.position = arg_7_2.position

				setText(arg_6_0.seed_detals:Find("bg/itemSeed/icon_bg/count_bg/count"), var_7_2:GetCount())

				local var_9_0 = var_7_2:GetIcon()

				GetImageSpriteFromAtlasAsync("island/" .. var_9_0, "", arg_6_0.seed_detals:Find("bg/itemSeed/icon_bg/icon"))

				local var_9_1 = arg_6_0.seed_detals:Find("bg/detaiView/Viewport/detaiViewText")

				setText(var_9_1, var_7_2:GetDesc())
				setText(arg_6_0.seed_detals:Find("bg/seedName"), var_7_2:GetName())
			end)
		end
	end)
	arg_6_0.uiSeedItemList:align(var_6_6)
end

function var_0_0.CheckSeedEmpty(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:GetDataVO().slotData.configId
	local var_10_1 = pg.island_production_slot[var_10_0].place
	local var_10_2 = pg.island_production_place[var_10_1].seed_list
	local var_10_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	arg_10_0.selectseedItemId = nil

	local var_10_4 = PlayerPrefs.GetInt("island_last_selectItemId" .. var_10_1, 0)

	if var_10_4 ~= 0 then
		local var_10_5 = pg.island_farm_seed[var_10_4].itemid

		if var_10_3:GetOwnCount(var_10_5) > 0 then
			arg_10_0.selectseedItemId = var_10_4

			return false
		end
	end

	for iter_10_0, iter_10_1 in ipairs(var_10_2) do
		local var_10_6 = pg.island_farm_seed[iter_10_1].itemid
		local var_10_7 = var_10_3:GetItemById(var_10_6)

		if var_10_7 and var_10_7:GetCount() ~= 0 then
			arg_10_0.selectseedItemId = iter_10_1

			return false
		end
	end

	return true
end

return var_0_0
