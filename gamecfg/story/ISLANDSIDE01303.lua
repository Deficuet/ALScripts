return {
	id = "ISLANDSIDE01303",
	mode = 10,
	map = {
		{
			101400,
			10050003
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
			say = "拉科尼娅，你的肥料在运送的途中散落了一地……大概是没法用了。",
			animation = "talk",
			face2Face = {
				{
					0,
					101400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 101400,
			subName = "苗圃管理员",
			say = "原来是这样……谢谢你指挥官。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "苗圃管理员",
			characterId = 101400,
			say = "只是没有肥料的话……订单……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "苗圃管理员",
			characterId = 101400,
			say = "已经，没有办法了么……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "不，一定还有办法的",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "或许……可以试着重新去订购一些？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "苗圃管理员",
			characterId = 101400,
			say = "指挥官……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101400,
			subName = "苗圃管理员",
			say = "你说得对……现在还不是放弃的时候！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "苗圃管理员",
			characterId = 101400,
			say = "订购肥料的事，能拜托指挥官去问问帕特莉吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "好，我去帮你问问。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
