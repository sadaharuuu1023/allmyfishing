class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|

      t.timestamps
      t.references :user
      t.string :title
      t.text :text_field
      t.text :text_tackle
    end
  end
end
