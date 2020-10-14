class MainController < ApplicationController
  require 'ipaddr'

  def find_geo_by_ip    
    ip = IPAddr.new params["ip"]
    country_and_city = ENV["DATABASE_NAME"].constantize.get_country_and_city(ip)

    render json: country_and_city
  rescue IPAddr::InvalidAddressError => ex

    render json: {"error": 'Invalid IP Adress'}, status: 400
  rescue => ex

    render json: {"error": "Internal Server Error" }, status: 500
  end
end
