require 'spec_helper'

describe Jive::Tile do
	it 'has a version number' do
		expect(Jive::Tile::VERSION).not_to be nil
	end

	before(:each) do
		stub_request(:post, "https://market.apps.jivesoftware.com/appsmarket/services/rest/jive/instance/validation/8ce5c231-fab8-46b1-b8b2-fc65deccbb5d").
		with(:body => "clientId:2zm4rzr9aiuvd4zhhg8kyfep229p2gce.i\nclientSecret:09da4b6f11102012b476a686fabb37a61240ba89477f0fec4d0f974b428dd141\njiveSignatureURL:https://market.apps.jivesoftware.com/appsmarket/services/rest/jive/instance/validation/8ce5c231-fab8-46b1-b8b2-fc65deccbb5d\njiveUrl:https://sandbox.jiveon.com\ntenantId:b22e3911-28ef-480c-ae3b-ca791ba86952\ntimestamp:2015-11-20T16:04:55.895+0000\n",
			 :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby', 'X-Jive-Mac'=>'0YqbK1nW+L+j3ppE7PHo3CvM/pNyHIDbNwYYvkKJGXU='}).
		to_return(:status => 204, :body => "", :headers => {})

		@add_on = ::Jive::AddOn::Model.create({
			client_id: '2zm4rzr9aiuvd4zhhg8kyfep229p2gce.i',
			tenant_id: 'b22e3911-28ef-480c-ae3b-ca791ba86952',
			jive_signature_url: 'https://market.apps.jivesoftware.com/appsmarket/services/rest/jive/instance/validation/8ce5c231-fab8-46b1-b8b2-fc65deccbb5d',
			client_secret: 'evaqjrbfyu70jlvnap8fhnj2h5mr4vus.s',
			jive_signature: '0YqbK1nW+L+j3ppE7PHo3CvM/pNyHIDbNwYYvkKJGXU=',
			jive_url: 'https://sandbox.jiveon.com',
			timestamp: '2015-11-20T16:04:55.895+0000',
		})

		@tile_params = {
			guid: 'community:localhost%3A8080/tile:1070',
			remote_id: 1070,
			config: {
				parent: 'http://mock.local/api/core/v3/places/1037',
				startSequence: '55'
			},
			name: 'sampletile-list',
			jive_url: 'http://mock.local',
			tenant_id: 'a5247fb8-1f60-4649-b59b-930475588bbf-dev',
			push_url: 'http://localhost:8080/api/jivelinks/v1/tiles/1070/data',
			code: 'o33xm85tfxe4n4vk4lw5gwvcjwkdcp4d.c'
		}
	end

	describe "#create", :focus => true do
		it 'should exchange code for oauth token' do
			stub_request(:post, "http://mock.local/oauth2/token").with(
				:body => "client_id=i5j15eikcd5u2xntgk5zu4lt93zkgx6z.i&code=o33xm85tfxe4n4vk4lw5gwvcjwkdcp4d.c&grant_type=authorization_code",
				:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}
			).to_return(:status => 200, :body => "", :headers => {})

			tile = Jive::Tile::Model.create(@tile_params)
			tile.add_on = @add_on
			tile.save
		end
	end
end
