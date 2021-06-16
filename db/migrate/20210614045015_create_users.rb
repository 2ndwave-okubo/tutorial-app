class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
  User.create(name: "sampleTarou", email: "test@test", password: "test", password_confirmation: "test")
  User.create(name: "sampleTarou", email: "tarou@example.com", password: "hogehoge", password_confirmation: "hogehoge")
end
