class CreateExceps < ActiveRecord::Migration[5.1]
  def change
    create_table :exceps do |t|
      t.string :part

      t.timestamps
    end
  end
end
