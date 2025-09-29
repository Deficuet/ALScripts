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
			animation = "sad",
			characterId = 100600,
			subName = "矿山管理员",
			say = "天啊！还差这么多！这该怎么办！",
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
					content = "乔安，是遇到了什么困难了么？",
					flag = 1
				}
			}
		},
		{
			say = "哇！是指挥官！太好了！",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "scare",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "你看！那边的站台被完全砸坏了，修复需要的煤炭需求还很大！靠我自己挖根本来不及！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "嗯？这里不就是矿山么？没有存货？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "全都没啦！所有库存加上才勉强够订单的量！结果正要运去港口站台就炸了……",
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
			say = "唉，看来这次是赶不上了……",
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
			say = "欸？！真的吗指挥官？！太棒了！",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "没事，交通线瘫痪我也有责任，帮帮忙是应该的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "太好啦！现在正缺人手呢，指挥官能来帮忙真是帮大忙了！",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "我们抓紧时间吧！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
