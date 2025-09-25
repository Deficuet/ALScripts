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

function var_0_0.ActiveSeedSelect(arg_4_0, arg_4_1)
	if arg_4_1 then
		local var_4_0 = arg_4_0:GetView():GetSubView(IslandOpView):GetSeedBtnWorldPos()
		local var_4_1 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
		local var_4_2 = var_4_1:WorldToScreenPoint(var_4_0)
		local var_4_3 = LuaHelper.ScreenToLocal(arg_4_0._tf, var_4_2, var_4_1)

		arg_4_0.seedSelectPlane.localPosition = var_4_3

		arg_4_0._tf:SetAsLastSibling()
	end

	setActive(arg_4_0.seedSelectPlane, arg_4_1)
	setActive(arg_4_0._tf, arg_4_1)
end

function var_0_0.RefreshSeedPlane(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:GetDataVO().slotData.configId
	local var_5_1 = pg.island_production_slot[var_5_0].place
	local var_5_2 = pg.island_production_place[var_5_1].seed_list
	local var_5_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_5_4 = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_2) do
		local var_5_5 = pg.island_farm_seed[iter_5_1].itemid

		if var_5_3:GetItemById(var_5_5) then
			table.insert(var_5_4, iter_5_1)
		end
	end

	local var_5_6 = #var_5_4
	local var_5_7 = 30
	local var_5_8 = 40
	local var_5_9 = arg_5_0.seedSelectPlane:Find("content"):GetComponent(typeof(GridLayoutGroup))
	local var_5_10 = var_5_9.cellSize.x
	local var_5_11 = var_5_9.cellSize.y
	local var_5_12 = math.min(var_5_6, 7)
	local var_5_13 = math.ceil(var_5_6 / 7)
	local var_5_14 = var_5_10 * var_5_12 + var_5_9.spacing.x * (var_5_12 - 1) + var_5_9.padding.right + var_5_8
	local var_5_15 = var_5_11 * var_5_13 + var_5_9.spacing.y * (var_5_13 - 1) + var_5_9.padding.bottom + var_5_7

	arg_5_0.seedSelectPlane:Find("content").sizeDelta = Vector2(var_5_14, var_5_15)

	arg_5_0.uiSeedItemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = var_5_4[arg_6_1 + 1]

			setActive(arg_6_2:Find("select"), arg_5_0.selectseedItemId == var_6_0)

			local var_6_1 = pg.island_farm_seed[var_6_0].itemid
			local var_6_2 = var_5_3:GetItemById(var_6_1)

			updateCustomDrop(arg_6_2, Drop.New({
				type = DROP_TYPE_ISLAND_ITEM,
				id = var_6_2.id,
				count = var_6_2:GetCount()
			}))

			local var_6_3

			onButton(arg_5_0, arg_6_2, function()
				if var_6_3 then
					var_6_3 = false

					return
				end

				arg_5_0.selectseedItemId = var_6_0

				PlayerPrefs.SetInt("island_last_selectItemId" .. var_5_1, arg_5_0.selectseedItemId)
				arg_5_0.uiSeedItemList:align(var_5_6)
				arg_5_0:GetView():GetSubView(IslandOpView):RefreshCurrentSlectSeed()
				arg_5_0:ActiveSeedSelect(false)
				setActive(arg_5_0.seed_detals, false)
			end, SFX_PANEL)
			GetOrAddComponent(arg_6_2, typeof(UILongPressTrigger)).onLongPressed:AddListener(function()
				var_6_3 = true

				setActive(arg_5_0.seed_detals, true)

				arg_5_0.seed_detals.position = arg_6_2.position

				setText(arg_5_0.seed_detals:Find("bg/itemSeed/icon_bg/count_bg/count"), var_6_2:GetCount())

				local var_8_0 = var_6_2:GetIcon()

				GetImageSpriteFromAtlasAsync(var_8_0, "", arg_5_0.seed_detals:Find("bg/itemSeed/icon_bg/icon"))

				local var_8_1 = arg_5_0.seed_detals:Find("bg/detaiView/Viewport/detaiViewText")

				setText(var_8_1, var_6_2:GetDesc())
				setText(arg_5_0.seed_detals:Find("bg/seedName"), var_6_2:GetName())
			end)
		end
	end)
	arg_5_0.uiSeedItemList:align(var_5_6)
end

function var_0_0.CheckSeedEmpty(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:GetDataVO().slotData.configId
	local var_9_1 = pg.island_production_slot[var_9_0].place
	local var_9_2 = pg.island_production_place[var_9_1].seed_list
	local var_9_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	arg_9_0.selectseedItemId = nil

	local var_9_4 = PlayerPrefs.GetInt("island_last_selectItemId" .. var_9_1, 0)

	if var_9_4 ~= 0 then
		local var_9_5 = pg.island_farm_seed[var_9_4].itemid

		if var_9_3:GetOwnCount(var_9_5) > 0 then
			arg_9_0.selectseedItemId = var_9_4

			return false
		end
	end

	for iter_9_0, iter_9_1 in ipairs(var_9_2) do
		local var_9_6 = pg.island_farm_seed[iter_9_1].itemid
		local var_9_7 = var_9_3:GetItemById(var_9_6)

		if var_9_7 and var_9_7:GetCount() ~= 0 then
			arg_9_0.selectseedItemId = iter_9_1

			return false
		end
	end

	return true
end

return var_0_0
