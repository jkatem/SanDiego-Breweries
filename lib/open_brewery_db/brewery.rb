#class Brewery 
require 'pry'
class Brewery

    attr_accessor :id, :name, :brewery_type, :phone, :street, :zip_code, :website_url

    @@all = []
    @@name_list = []
    @@type_list = []

    def initialize(brewery_info)
        brewery_info.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.breweries_in_sd
        API.get_breweries.each do |b|
            Brewery.new(b)
        end
    end

    def self.build_name_list     
        @@name_list << self.all.map.with_index(1) do |brewery, index|     
        "#{index}. #{brewery.name}"
        end 
    end

    def self.get_name_list
        @@name_list
    end

    def self.build_brewery_type_list
        list = []
        list << self.all.map do |b|
            b.brewery_type
        end
        @@type_list = list.flatten.uniq
    end
    
    def self.get_brewery_type_list
        @@type_list
    end

    def self.get_brewery_by_number(num) 
        Brewery.print_brewery(@@all[num-1])
    end 

    def self.get_brewery_by_type(type)
        breweries = @@all.select {|b| b.brewery_type == type }
        breweries.each do |b| 
            Brewery.print_brewery(b)
        end 
    end

    def self.print_brewery(brewery)
        
        puts "---------- Brewery: #{brewery.name} ----------"
        puts "id: #{brewery.id}"
        puts "brewery_type: #{brewery.brewery_type}"
        puts "phone: #{brewery.phone}"
        puts "street: #{brewery.street}, #{brewery.zip_code}"
        puts "website_url: #{brewery.website_url}"
        puts ""
    end
end