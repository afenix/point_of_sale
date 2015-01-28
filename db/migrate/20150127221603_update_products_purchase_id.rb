class UpdateProductsPurchaseId < ActiveRecord::Migration
  def change
    add_column(:products, :purchase_id, :int)
  end
end
