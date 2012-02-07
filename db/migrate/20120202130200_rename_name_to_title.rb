class RenameNameToTitle < ActiveRecord::Migration
  def up
    change_table :books do |t|
      t.rename :name, :title
    end
  end

  def down
    change_table :books do |t|
      t.rename :title, :name
    end
  end
end
