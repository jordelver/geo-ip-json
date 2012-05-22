require 'rubygems'
gem 'minitest'

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require_relative '../lib/geo-ip-json'

include Rack::Test::Methods

MOCK = MiniTest::Mock.new

# Setup our rack app as we would with a config.ru file
def app
  Rack::Builder.new do
    map '/geoip.json' do
      app = GeoIPJson::App.new
      app.geo_ip = MOCK
      run app
    end
  end
end

describe "GeoIP" do

  describe "valid IP address" do
    it "must return the country code" do
      MOCK.expect :country, { country_code2: 'us' }, ["1.2.3.4"]

      get '/geoip.json?ip=1.2.3.4'

      assert_equal 200, last_response.status

      json = JSON.parse(last_response.body)
      json['country'].must_equal 'us'
    end

    it "must use the request IP if the ip parameter is missing" do
      MOCK.expect :country, { country_code2: 'gb' }, ["4.5.6.7"]

      get '/geoip.json', nil, { 'REMOTE_ADDR' => '4.5.6.7' }

      assert_equal 200, last_response.status

      json = JSON.parse(last_response.body)
      json['country'].must_equal 'gb'
    end
  end

  describe "invalid IP address" do
    it "must return return an empty string if the ip is bogus" do
      MOCK.expect :country, { country_code2: '' }, ["not-an-ip-address"]

      get '/geoip.json?ip=not-an-ip-address'

      assert_equal 200, last_response.status

      json = JSON.parse(last_response.body)
      json['country'].must_equal ''
    end
  end
end
