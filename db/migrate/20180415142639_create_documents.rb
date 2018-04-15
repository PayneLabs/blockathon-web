class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :ipfs_url
      t.string :ipfs_url_hash

      t.timestamps
    end
  end
end
