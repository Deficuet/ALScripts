return {
	id = "ISLANDSIDE00303",
	mode = 10,
	map = {
		{
			100600,
			10040022
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			characterId = 0,
			say = "乔安——",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "hi",
			characterId = 100600,
			subName = "矿山管理员",
			say = "是指挥官……你是来采购矿石的吗……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 100600,
			subName = "矿山管理员",
			say = "可我现在真的有些抽不出手……布莱梅说基地的服务器又坏了，那边都快急死了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "不，我是来送材料的，修复服务器需要的铝矿，都在这里了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100600,
			subName = "矿山管理员",
			say = "哇！真的吗？！一个，两个，三个……铝矿的数量和纯度，正好足够呢！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "指挥官能来帮忙，真是太好了……不过虽然铝矿有了，但我之前订购的零件还放在港口上呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100600,
			subName = "矿山管理员",
			say = "指挥官，现在只有你能帮我去找找看了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "没问题，我这就去货运中心看看，你安心准备修复用元件就好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
