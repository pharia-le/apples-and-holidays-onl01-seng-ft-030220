require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |holiday, supplies|
    supplies.push(supply)
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash[:winter].each do |season, supplies|
    supplies.each do |supply, i|
      winter_supplies << supply
    end
  end
  winter_supplies
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].map do |holiday, supplies|
    supplies
  end.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday_hashes|
    puts season.to_s.capitalize! + ":"
    
    holiday_hashes.each do |holiday, supplies|
      if holiday.to_s.include?("_")
        arr = holiday.to_s.split("_")
        new_arr = arr.each { |word| word.capitalize! }
        holiday_str = "  " + new_arr.join(" ") + ": "
      else
        holiday_str = "  " + holiday.to_s.capitalize! + ": "
      end

      supplies.each_with_index do |supply, i|
        if supply == supply.upcase
          holiday_str << supply
        elsif supplies.length > 1
          if i != supplies.length-1
            holiday_str << "#{supply}, "
          else
            holiday_str << "#{supply}"
          end
        else
          holiday_str << supply
        end
      end
      puts holiday_str
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  arr = []
  holiday_hash.each do |seasons, holiday_hashes|
    holiday_hashes.each do |holiday, supplies|
      if supplies.include?("BBQ")
        arr << holiday
        break
      end
    end
  end
  arr
end






