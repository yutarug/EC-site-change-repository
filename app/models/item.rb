class Item < ApplicationRecord
	attachment :image
	enum status:{
		製作不可: 0,製作待ち:1,製作中:2, 製作完了:3
	}
end
