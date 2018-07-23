class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :uuid
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.bigint :zip
      t.string :country
      t.bigint :phone
      t.string :website

      t.datetime :created_at
    end
  end
end
