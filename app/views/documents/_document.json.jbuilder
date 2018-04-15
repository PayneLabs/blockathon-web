json.extract! document, :id, :name, :user_id, :ipfs_url, :ipfs_url_hash, :created_at, :updated_at
json.url document_url(document, format: :json)
