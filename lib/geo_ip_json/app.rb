require 'json'
require 'geoip'

module GeoIPJson
  class App
    attr_writer :geo_ip

    def call(env)
      request = Rack::Request.new(env)

      geo_data = lookup(ip_or_hostname(request))

      json = {
        country: geo_data[:country_code2].downcase.gsub(/--/, '')
      }.to_json

      [200, {'Content-Type' => 'application/json'}, [json]]
    end

    def geo_ip
      @geo_ip ||= GeoIP.new('GeoIP.dat')
    end

    private

    def ip_or_hostname(request)
      if request.params['ip'].nil?
        ip = request.ip
      else
        ip = request.params['ip']
      end
    end

    def lookup(ip_or_hostname)
      geo_ip.country(ip_or_hostname).to_hash
    rescue SocketError
      { country_code2: "" }
    end
  end
end

