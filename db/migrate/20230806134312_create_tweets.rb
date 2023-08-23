class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|

      t.timestamps
      t.references :user
      t.string :title
      # 場所情報
      t.text :text_field
      t.text :text_water_depth
      t.text :text_terrain
      t.text :text_tide
      # タックル情報
      t.text :text_rod
      t.text :text_reel
      t.text :text_line
      t.text :text_leader
      t.text :text_lure
      t.text :text_color
    end
  end
end
