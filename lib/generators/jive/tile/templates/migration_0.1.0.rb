class AddJiveTiles010Migration < ActiveRecord::Migration
	def self.up
		create_table :jive_tiles do |t|
			t.integer :jive_add_on_id
			t.string :guid
			t.string :remote_id
			t.text :config
			t.string :name
			t.string :jive_url
			t.string :tenant_id
			t.string :push_url
			t.string :code
			t.integer :jive_tiles_oauth_token_id

			t.timestamps null: false
		end

		create_table :jive_tiles_oauth_tokens do |t|
			t.string :scope
			t.string :token_type
			t.string :expires_in
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