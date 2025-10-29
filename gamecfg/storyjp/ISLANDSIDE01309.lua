return {
	id = "ISLANDSIDE01309",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			say = "――繁茂農園の注文に必要なものを持ってきたよ",
			animation = "talk",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "note",
			characterId = 100200,
			subName = "依頼管理人",
			say = "今確認するね……うん、数はピッタリ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "あと少しで間に合わないところだったけれど……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "依頼管理人",
			say = "よかったよかった。お疲れさま～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
