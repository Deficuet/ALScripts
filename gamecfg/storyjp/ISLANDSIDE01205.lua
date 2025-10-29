return {
	id = "ISLANDSIDE01205",
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
			animation = "embarrass",
			characterId = 101100,
			subName = "果樹園管理人",
			say = "あはは……そういえば、確かにそうですね…",
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
			say = "仕事が一旦落ち着いたら、ちゃんと払いに行ってきます！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――まだ仕事が残ってるの？手伝うよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101100,
			subName = "果樹園管理人",
			say = "いいんですか！今日はなんて幸運なんでしょう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果樹園管理人",
			characterId = 101100,
			say = "お礼として最高級のフルーツをご用意しますね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "でも美味しいフルーツを育てるには、まず肥料を撒かないといけません。それをお願いできますか？",
			characterId = 101100,
			subName = "果樹園管理人",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
