class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :game_title, null: false
      t.string     :platform,   null: false
      t.string     :time_zoon,  null: false
      t.text       :text,       null: false
      t.string     :call,       null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
