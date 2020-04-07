class CLI

    def welcome  
        puts 'Welcome!'
    
        Brewery.breweries_in_sd
        Brewery.build_name_list
        Brewery.build_brewery_type_list 
    
        user_input = 0
        until user_input == 'q'
            user_input = show_brewery
        end
    end

    def show_brewery
        puts ''
        puts 'Please select from the list below which brewery in San Diego you would like more information about:'
        puts ''
        puts 'Enter 1: search brewery by name'
        puts 'Enter 2: search brewery by brewery type'
        puts 'Enter q to Quit'
        puts 'type your choice (1, 2, or q)'
        puts ''

        user_option = gets.strip.downcase
        if user_option == 'q'
            puts 'Thank you for visiting! Please come back soon.'
        elsif user_option == '1'
            get_brewery_by_name
        elsif user_option == '2'
            get_brewery_by_type
        else
            puts '---------------------------------'  
            puts 'Invalid option'
            puts 'Valid options are: 1,2 or q'
            puts 'Please try again'
            puts '---------------------------------'  
        end
        user_option     
    end

    def get_brewery_by_name
        puts Brewery.get_name_list
        puts "Please choose a number between 1 and 50"
        input_num = gets.strip.to_i
        if input_num.between?(1, 50)
            Brewery.get_brewery_by_number(input_num) 
        else
            puts '---------------------------------'  
            puts 'Invalid option. Please try again.'
            puts '---------------------------------'  
            get_brewery_by_name 
        end
    end

    def get_brewery_by_type
        type_list = Brewery.get_brewery_type_list
        puts ''
        puts 'Brewery Types:'
        puts type_list
        puts '-------------------'
        puts "Pleae enter a brewery type"
        puts ''
        type = gets.strip.downcase
        puts ''
        if type_list.include?(type)
            Brewery.get_brewery_by_type(type)
        else
            puts ''
            puts 'Invalid entry. Please try again.'            
            puts ''
            get_brewery_by_type
        end
    end    
end


