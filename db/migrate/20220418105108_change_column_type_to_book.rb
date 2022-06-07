class ChangeColumnTypeToBook < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :published_at, :date
  end
end
