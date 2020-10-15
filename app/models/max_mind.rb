class MaxMind < GeoIpDatabase
  require 'csv'

  PATH_TO_FILES = BASE_PATH_TO_FILES + "/max_mind"

  def self.get_country_and_city(ip)
    geoname_id = self.get_geoname_id(ip)

    self.get_geo_details(geoname_id)
  end

  private

  def self.get_geoname_id(ip)
    csv = CSV.table("#{PATH_TO_FILES}/ip2geoname-#{self.get_ipv(ip)}.csv")
    ip_row = csv.find{|row| IPAddr.new(row[:network]).include?(ip)}

    ip_row[:geoname_id] if ip_row
  end

  def self.get_geo_details(geoname_id)
    if geoname_id.present?
      geo_csv = CSV.table("#{PATH_TO_FILES}/geoname2city_and_country.csv")
      details_row = geo_csv.find {|row| row[:geoname_id] == geoname_id }
      
      if details_row.present?
        city, country = details_row[:city_name], details_row[:country_name]
      end
    end

    { "city": city, "country": country }
  end
end
