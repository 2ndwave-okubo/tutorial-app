class CreateBlogs < ActiveRecord::Migration[5.2]
  
  def change
    create_table :blogs do |t|

      t.timestamps
    end
  end
end
