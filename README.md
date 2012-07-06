# GeoIPJSON - GeoIP information as JSON via a rack app

A very simple rack app to provide Geo-location Information as JSON.

By default it returns the country code of the current client.

Alternatively, an `?ip=1.2.3.4` parameter can be supplied.

We are using this as a datasource for an AJAX call.

## Install

### Rails

In `Gemfile`

    gem 'geo-ip-json'

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
