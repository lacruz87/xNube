class CreateInventarios < ActiveRecord::Migration[5.1]
  def change
    create_table :inventarios do |t|
      t.string :ln
      t.string :part
      t.string :site
      t.string :site_desc
      t.string :loc
      t.string :lot
      t.string :ref
      t.string :loc_des
      t.string :create
      t.string :expire
      t.string :qty_oh
      t.string :qty_all
      t.string :status

      t.timestamps
    end
  end
end
