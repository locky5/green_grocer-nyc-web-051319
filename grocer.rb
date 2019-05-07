def consolidate_cart(cart)
  new_cart = {} # new hash
  count = 0
  cart.each do |element| #element is entire array
    element.each do |fruit, hash| 
      new_cart[fruit] ||= hash # new_cart[fruit] || new_cart[fruit] = hash
      new_cart[fruit][:count] ||= 0 # initialize the count
      new_cart[fruit][:count] += 1 # increase the count by one 
      end
    end
  return new_cart 
end

def apply_coupons(cart, coupons)
 
end

def apply_clearance(cart)
  cart.each do |item, item_hash|
    if item_hash[:clearance] # if clearance = true
      new_price = item_hash[:price] * 0.80
      item_hash[:price] = new_price.round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart) 
  cart_total = 0
  final_cart.each do |item, properties|
    cart_total += properties[:price] * properties[:count]          
  end
  cart_total = cart_total * 0.90 if cart_total > 100
  cart_total
end