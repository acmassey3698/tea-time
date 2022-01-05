class DefaultValues < ActiveRecord::Migration[6.1]
  def change
    change_column :subscriptions, :status, :integer, default: 1
    change_column :subscriptions, :price, :float, default: 10.00
  end
end
