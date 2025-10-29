return {
	id = "ISLANDSIDE01207",
	mode = 10,
	map = {
		{
			101100,
			10050002
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
			subName = "果樹園管理人",
			characterId = 101100,
			animation = "elation",
			say = "綺麗に実ったみかんを見ると、今までの苦労が報われますね…",
			face2Face = {
				{
					0,
					101100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果樹園管理人",
			characterId = 101100,
			say = "指揮官、味見してみませんか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――全部片づけたら、一緒に食べよう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "はい！指揮官にお任せします！",
			characterId = 101100,
			subName = "果樹園管理人",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "あ、そういえばブレーメンが、みかんの在庫がそろそろなくなるって言ってました",
			characterId = 101100,
			subName = "果樹園管理人",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果樹園管理人",
			characterId = 101100,
			say = "彼女に届けてきてくれませんか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
