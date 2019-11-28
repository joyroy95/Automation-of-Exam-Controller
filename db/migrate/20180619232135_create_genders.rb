class CreateGenders < ActiveRecord::Migration[5.1]
  def up
    create_table :genders do |t|
      t.string "gender", limit: 12, null: false
    end

    # add unique lower-case index
    execute <<-SQL
      CREATE UNIQUE INDEX unique_gender_lower on
        genders(lower(gender));
    SQL
  end

  def down
    drop_table :genders
  end
end
