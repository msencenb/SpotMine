class AddDefaultToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :gem_balance, 0
  end
end