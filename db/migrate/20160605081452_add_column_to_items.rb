class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :category_name, :string, :after => :category_id, :limit => 8  
  end
end
