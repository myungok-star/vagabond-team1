class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.string :user_profile_image
      t.string :content

      t.timestamps
    end
  end
end
