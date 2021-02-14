class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title, null: false
      t.text   :describe, null: false
      t.references   :user, null: false  
      t.timestamps
    end
  end
end
