return {
	id = "ISLANDSIDE01001",
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
			animation = "doubt",
			characterId = 100200,
			subName = "依頼管理人",
			say = "母港に入ってくる輸送船団が渋滞してるようですね……ちょっと誘導してくる！",
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
			subName = "依頼管理人",
			characterId = 100200,
			say = "委託がいっぱい……これはいいこと！残業して片付けちゃおう〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "依頼管理人",
			say = "よ～し、依頼を整理してから振り返りを……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "もっと大きく、もっと速く！業績をぐんぐん伸ばそう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "（パトリックはやる気満々だな。本当にこの仕事が好きなんだな）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "（港での大小さまざまな業務を完璧にこなしている）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "（とはいえ、こういう頭を使う労働がずっとだと大変だろう）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "（どうにかもっと楽に仕事に打ち込めるようにしてあげたいが、どうすればいいんだろう……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "（よし……オリンピックに相談してみるか）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
