# GeoIPJSON - GeoIP information as JSON via a rack app

## Install

In `Gemfile`

  gem 'geo-ip-json', :git => 'git@github.com:jordelver/geo-ip-json.git'

In `routes.rb`

  require 'geo_ip_json'

  <AppName>::Application.routes.draw do
    match "/geoip.json", :to => GeoIPJson::App.new
  end

