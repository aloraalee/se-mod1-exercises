# Finish writing the test to make the assertion pass.
# Use the sort and sort_by methods.

describe "#sort/#sort_by" do 
  it "sorts the numbers" do 
    numbers = [8, 23, 7, 29, 9, 10]

    sorted_numbers = numbers.sort

    expect(sorted_numbers).to eq([7, 8, 9, 10, 23, 29])
  end

  it "sorts the names alphabetically" do 
    names = ["Leonardo", "Donatello", "Michaelangelo", "Raphael"]

    sorted_names = names.sort

    expect(sorted_names).to eq(["Donatello", "Leonardo", "Michaelangelo", "Raphael"])
  end

  it "sorts the names by name length" do 
    names = ["Leonardo", "Donatello", "Michaelangelo", "Raphael"]

    sorted_names = names.sort_by do |name|
      name.length
    end

    expect(sorted_names).to eq(["Raphael", "Leonardo", "Donatello", "Michaelangelo", ])
  end

  it "sorts the names by corresponding value" do 
    # This one is spicy! You might need to use multiple enumerables and 
    # do it in multiple steps.
    people = [
        ["Sofie", 4],
        ["Scarlett", 9],
        ["Stella", 8]
      ]
  
      people_in_order = people.sort_by do |person|
       person[1]
        # require 'pry' ; binding.pry
        # In pry, the first time tyoe person to see what happens. We then learn we want the second element in the array so we use [1]
        # In pry again, we type people_in_order to see what this looks like. we get ["Sofie", 4], ["Stella", 8], ["Scarlett", 9]. 
        #This is close, but it still includes the corresponding value. 
      end

    sorted_names = people_in_order.map do |person|
     # require 'pry' ; binding.pry
     person[0]
    end

      # We want to return names in an array, in order of the second value of the subarrays. 
      # Let's solve this in two steps. 
      # 1. Lets sort the srray by values
      # 2. Iterate again, using map just return the names only for each element


      
    expect(sorted_names).to eq(["Sofie", "Stella", "Scarlett"])
  end
end