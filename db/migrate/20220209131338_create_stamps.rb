class CreateStamps < ActiveRecord::Migration[6.0]
  def change
    create_table :stamps do |t|
      t.string :title
      t.text :prefecture
      t.text :place  
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
