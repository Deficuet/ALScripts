return {
	id = "ISLAND1001004",
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
			animation = "shakehead",
			characterId = 100600,
			subName = "矿山管理员",
			say = "唉，还差这么多，这该怎么办呢……",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "乔安，是遇到了什么困难吗？",
					flag = 1
				}
			}
		},
		{
			say = "呀！原来是指挥官啊。",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "scare",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "唔，交通线损坏的部分太多了……修复工作需要的煤炭还要很久才能集齐……",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "矿场里没有存货吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "没了，全都加上才勉强够订单上的量，结果正准备运往港口就发生了这种事……",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100600,
			subName = "矿山管理员",
			say = "唉，看来这次是赶不上了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "那我也来帮忙吧。",
					flag = 1
				}
			}
		},
		{
			say = "欸，可是指挥官——",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "没事，交通线瘫痪我也有责任，帮帮忙是应该的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "这样啊……那太好了，现在正缺人手呢!",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
