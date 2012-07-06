# GeoIPJSON - GeoIP information as JSON via a rack app

## Install

### Rails

In `Gemfile`

    gem 'geo-ip-json', :git => 'git@github.com:jordelver/geo-ip-json.git'

In `routes.rb`

    <AppName>::Application.routes.draw do
      match "/geoip.json", :to => GeoIPJson::App.new
    end

Download the GeoIP database file from MaxMind (http://www.maxmind.com/)

* http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz

Put it in the root of your Rails app (configurable location is coming)

## Testing

Run `rake test` to run the tests. A `Guardfile` is present to use with `Guard`.

## Thanks!

Steve England for the idea
* https://github.com/stengland

Ruby GeoIP library which does most of the work!
* http://geoip.rubyforge.org/
