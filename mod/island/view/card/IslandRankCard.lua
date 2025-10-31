local var_0_0 = class("IslandRankCard")

var_0_0.TYPE_SELF = 1
var_0_0.TYPE_OTHER = 2

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0._type = arg_1_2
	arg_1_0.parent = arg_1_3
	arg_1_0.bgTF = arg_1_0._tf:Find("bg")
	arg_1_0.rankText = arg_1_0._tf:Find("rank"):GetComponent(typeof(Text))
	arg_1_0.notOnTF = arg_1_0._tf:Find("not_on")
	arg_1_0.iconTF = arg_1_0._tf:Find("icon_bg/icon")
	arg_1_0.nameText = arg_1_0._tf:Find("name"):GetComponent(typeof(Text))
	arg_1_0.levelText = arg_1_0._tf:Find("level"):GetComponent(typeof(Text))
	arg_1_0.ptText = arg_1_0._tf:Find("pt"):GetComponent(typeof(Text))

	setText(arg_1_0._tf:Find("island"), i18n("island_season_charts_level"))

	arg_1_0.awardsTF = arg_1_0._tf:Find("awards")
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.rankVO = arg_2_1
	arg_2_0.rankText.text = arg_2_1.rank > 9 and arg_2_1.rank or "0" .. arg_2_1.rank
	arg_2_0.nameText.text = arg_2_1.name
	arg_2_0.levelText.text = "Lv." .. arg_2_1.arenaRank
	arg_2_0.ptText.text = arg_2_1.power

	local var_2_0 = arg_2_1.rank < 4 and arg_2_1.rank or 0

	GetImageSpriteFromAtlasAsync("ui/islandseasonrankui_atlas", "bg" .. var_2_0, arg_2_0.bgTF)

	local var_2_1 = arg_2_0._type ~= var_0_0.TYPE_SELF or arg_2_1.rank > 0

	setActive(arg_2_0.rankText, var_2_1 and arg_2_1.rank > 3)
	setActive(arg_2_0.notOnTF, not var_2_1)

	local var_2_2 = "qicon/" .. pg.ship_skin_template[arg_2_1.skinId].prefab

	GetImageSpriteFromAtlasAsync(var_2_2, "", arg_2_0.iconTF)

	local var_2_3 = IslandSeason.GetAwardsByRank(arg_2_2, arg_2_1.rank)

	UIItemList.StaticAlign(arg_2_0.awardsTF, arg_2_0.awardsTF:Find("tpl"), #var_2_3, function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			updateCustomDrop(arg_3_2, var_2_3[arg_3_1 + 1])
			onButton(arg_2_0.parent, arg_3_2, function()
				arg_2_0.parent.contextData:ShowMsgBox({
					title = i18n("island_word_desc"),
					type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
					dropData = var_2_3[arg_3_1 + 1]
				})
			end)
		end
	end)
end

function var_0_0.Dispose(arg_5_0)
	return
end

return var_0_0
