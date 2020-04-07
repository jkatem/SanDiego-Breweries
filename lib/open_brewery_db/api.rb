
class API
    def self.get_breweries 
        response = HTTParty.get('https://api.openbrewerydb.org/breweries?per_page=50&&by_city=san_diego')
    end 
end


