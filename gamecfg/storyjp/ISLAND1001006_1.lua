return {
	id = "ISLAND1001006_1",
	mode = 10,
	map = {
		{
			100600,
			10040032
		},
		{
			100700,
			10040031
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
			say = "――戻ったよ",
			animation = "hi",
			face2Face = {
				{
					0,
					100600
				}
			},
			turnto = {
				{
					100700,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "木材もちゃんと持ってきました",
			characterId = 100700,
			subName = "森の管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "お見事！二人ともお疲れさま！これで材料は揃ったね",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "やっと復旧できる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "私たちも手伝います……",
			characterId = 100700,
			subName = "森の管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――ああ、力を合わせれば早く直せるはずだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
