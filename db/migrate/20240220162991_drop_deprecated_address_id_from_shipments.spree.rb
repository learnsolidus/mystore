# This migration comes from spree (originally 20230427095534)
class DropDeprecatedAddressIdFromShipments < ActiveRecord::Migration[5.2]
  def up
    remove_index :spree_shipments, column: [ :deprecated_address_id ], name: :index_spree_shipments_on_deprecated_address_id
    remove_column :spree_shipments, :deprecated_address_id
  end

  def down
    add_column :spree_shipments, :deprecated_address_id, :integer
    add_index :spree_shipments, :deprecated_address_id, name: :index_spree_shipments_on_deprecated_address_id
  end
end
