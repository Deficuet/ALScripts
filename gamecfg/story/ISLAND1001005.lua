return {
	fadeOut = 1,
	mode = 10,
	id = "ISLAND1001005",
	map = {
		{
			100600,
			10040022
		},
		{
			100700,
			10040045
		}
	},
	look_weight = {
		{
			0,
			0
		},
		{
			0.3,
			0
		},
		{
			0.7,
			0
		}
	},
	scripts = {
		{
			characterId = 0,
			camera = "StoryCamera2",
			say = "乔安，这些够了么？",
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
			say = "喔哦！指挥官您太厉害了！效率真高！",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			speed = 3.5,
			style = 4,
			hide = false,
			characterId = 100700,
			delay = 0,
			wait_until_done = false,
			position = {
				71.59,
				3.98,
				70.66
			}
		},
		{
			characterId = 100600,
			subName = "矿山管理员",
			say = "加上您采的这些，修复用的煤炭终于凑齐啦！这下有希望了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "这样就能修复好站台了？",
					flag = 1
				}
			}
		},
		{
			say = "还差一点点！要想完全修好，还需要一些木材加固顶棚呢！",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "啊……木、木材吗？我之前没准备到这部分……",
			characterId = 100700,
			subName = "林场管理员",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "乔安，现在去还来得及么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "来得及！绝对来得及！",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "我会在你们去准备木材的同时，先把这些煤炭用上，做基础的地面修复工作！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "两边一起干，肯定能赶上！奥布莱恩，你带指挥官去林区怎么样？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "嗯……好、好的。",
			characterId = 100700,
			subName = "林场管理员",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100700,
			subName = "林场管理员",
			say = "指挥官……我们得快点采集到木材才行。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "好，我这就去。",
					flag = 1
				},
				{
					content = "包在我身上！",
					flag = 2
				}
			}
		}
	}
}
