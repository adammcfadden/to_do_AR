class AddListTable < ActiveRecord::Migration
  def change
    create_table(:lists) do |t|
      t.column(:name, :string)
    end
  end
end
