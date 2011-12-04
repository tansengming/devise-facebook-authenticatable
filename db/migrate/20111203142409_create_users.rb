class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_token, :name, :username, :email, :first_name, :last_name, :sex, :avatar_url, :facebook_id
      t.timestamps
    end
  end
end
