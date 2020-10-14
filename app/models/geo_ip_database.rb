class GeoIpDatabase
  BASE_PATH_TO_FILES = "storage/geo_ip_databases/" + ENV["DATABASE_COVERAGE"]

  def self.get_country_and_city(ip)
    # implement on subclass
  end

  def self.get_ipv(ip)
    ip.ipv4? ? 'IPv4' : 'IPv6'
  end
end
