class CreateUserOauths < ActiveRecord::Migration
  def change
    create_table(:user_oauths) do |t|
      t.references :user, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.text :params, null: false

      t.timestamps
    end

    add_index :user_oauths, [:user_id, :provider], unique: true
    add_index :user_oauths, [:provider, :uid], unique: true
  end
end
