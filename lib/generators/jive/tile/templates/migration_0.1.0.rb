class AddJiveTiles010Migration < ActiveRecord::Migration
	def self.up
		create_table :jive_tiles do |t|
			t.integer :jive_add_on_id

			t.integer :tile_id
			t.string :code
			t.text :config
			t.string :guid
			t.string :jive_url
			t.string :name
			t.string :parent
			t.string :place_uri
			t.string :tenant_id
			t.string :url

			t.string :remote_id
			t.string :push_url

			t.integer :jive_tiles_oauth_token_id
			t.boolean :uninstalled

			t.timestamps null: false
		end

		create_table :jive_tiles_oauth_tokens do |t|
			t.string :scope
			t.string :token_type
			t.integer :expires_in
			t.timestamp :expires_at
			t.string :refresh_token
			t.string :access_token

			t.timestamps null: false
		end
	end

	def self.down
		drop_table :jive_tiles
		drop_table :jive_tiles_oauth_tokens
	end
end