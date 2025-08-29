return {
	id = "ISLANDSIDESTORY2003003_2",
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
			say = "我找到零件了。",
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
			animation = "nod",
			characterId = 100600,
			subName = "矿山管理员",
			say = "太好了，维修需要的材料集齐了……！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "我这就完成最后的组装工作！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
