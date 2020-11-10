# HOMEWORK
# 0 - Make the store loop! until == 'quit'
# 1 - Ask the user for the quantity of the item
# 2 - Refactor the store to add quantities
# market_items = {
#   'carrots' => { price: 100, quantity: 100 }
# }
# 3 - Update the quantity left in the store


# setup a shopping application
# 0 - welcome message
# 1 - display the items for sale today
# 2 - ask the user what they want to buy
# 3 - put the item in the shopping cart
# 3 + check if we have enough stock
# 3 ++ reduce the stock
# 4 - display the final bill
# 5 - display the campaign contribution amount
# to improve
# 1 - use def cart() to calculate price
# 2 - to make the shopping loop to function if user want to go back to add items after see the bill
# 3 - to allow change quantity for the item that already order.

market_items = {
  'carrots' => { price: 80, stock: 5},
  'apples' => { price: 100, stock: 10},
  'bananas' => { price: 120, stock: 10},
  'kiwis' => { price: 140, stock: 5}
}

shopping_cart = {}

puts "Welcome to Le Wagon Farmer's Market!\n
Buy local fresh produces online and we will contribute ¥1 for every ¥100 spent to Second Harvest's Food for Students facing financial difficulty due to COVID19.\n\n"

puts "TODAY'S ITEMS:"
market_items.each do |name, detail|
  puts "#{name}: ¥#{detail[:price]}"
end

# def cart()
# shopping_cart.each do |item, quantity|
  # price = market_items[item][:price] * quantity
  # puts "#{item} x #{quantity} = ¥#{price}"
  # total_price += price
# end

# start loop here
choice = 'shop'
until choice == 'quit' do
  case choice
    when "shop" 
      print "\nWhat would you like to buy?\n> "
      item = gets.chomp.downcase
      # defaulting at 1 quantity
      if market_items.key?(item)
        # ask user for quantity
        print "How many #{item} would you like to buy?\n> "
        quantity = gets.chomp.to_i
        # check if we have enough stock
        if quantity > market_items[item][:stock]
          print "\nWe have #{market_items[item][:stock]} #{item} left in the stock. Would you like us to add #{market_items[item][:stock]} #{item} in your basket? (y/n):\n> "
          answer = gets.chomp.downcase
          if answer == "y"
            # hash[new_key] = quantity remaining in stock
            shopping_cart[item] = market_items[item][:stock]
            market_items[item][:stock] = 0
          else
            puts "no item added."
          end
        else
        # hash[new_key] = new_value
        shopping_cart[item] = quantity
        # adjust stock quantity
        market_items[item][:stock] -= quantity
        end
      else
        puts "We don't have that item... 😢 \n"
      end
    when "basket"
      # show items in shopping cart
      puts "\n****YOUR BASKET****"
      #cart()
      shopping_cart.each do |item, quantity|
        price = market_items[item][:price] * quantity
        puts "#{item} x #{quantity} = ¥#{price}"
      end
      puts '*******************' 

  end
  print "\nPress enter: to continue shopping\nType 'basket': to view your basket\nType 'quit': to check out.\n> "
  user_choice = gets.chomp.downcase
  if user_choice == ""
    choice = "shop"
  elsif user_choice == "basket"
    choice = user_choice
  elsif user_choice == "quit"
    choice = user_choice
  else
    puts "Your input is incorrect, please input again.\n> "
    choice = "error"
  end
end

# when choice == quit, it comes to this checkout process
total_price = 0
puts "\n********BILL********"
#cart()
shopping_cart.each do |item, quantity|
  price = market_items[item][:price] * quantity
  puts "#{item} x #{quantity} = ¥#{price}"
  total_price += price
end
puts "********************"
puts "Total: ¥#{total_price}"
puts "********************"
puts "\nThank you for shopping with us.\nYou also help contributing ¥#{total_price*0.01} to Second Harvest Japan to rovide food to assit students affected financially by the new Corona virus."

# For developer's purpose to check the stock
puts "\n*****REMAINING STOCK******"
p market_items
