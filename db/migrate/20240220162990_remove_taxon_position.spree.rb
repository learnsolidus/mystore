# This migration comes from spree (originally 20230425103509)
class RemoveTaxonPosition < ActiveRecord::Migration[5.2]
  def change
    remove_column :spree_taxons, :position, :integer, default: 0
  end
end
