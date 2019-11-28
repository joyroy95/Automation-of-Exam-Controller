class CreatePersonalInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_infos do |t|
      t.string :fathers_name, null: false, limit: 60
      t.string :mothers_name, null: false, limit: 60
      t.string :date_of_birth, null: false
      t.string :phone_number, null: false
      t.text :address
      t.timestamps
    end
    add_reference :personal_infos, :halls
    add_reference :personal_infos, :genders
    add_reference :personal_infos, :users
    add_reference :personal_infos, :batches

  end
end
