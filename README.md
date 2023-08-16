# README

# README

## usersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| email   | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| name| string | null: false |

### Association
has_many :tweets
has_many :follows

## tweetsテーブル
| title | string | null: false |
| text_field | text | null: false |
| text_tackle | text | null: false |

### Association
belongs_to :users


## followsテーブル
| follower_id | references | null: false, foreign_key: true |
| followed_id | references | null: false, foreign_key: true |

### Association
belongs_to :users

