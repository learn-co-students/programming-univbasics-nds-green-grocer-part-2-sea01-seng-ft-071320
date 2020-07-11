require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
 coupons.each do |coupon|
   coupon.each do |attributes, value|
     name = coupon[:item]
 
 if cart[name] && cart[name][:count]
   
   if cart["#{name} W/COUPON"]
     cart["#{name} W/COUPON"][:count] += 1 
   else 
     cart["#{name} W?COUPON"] = {:price => coupon[:cost], :clearance => cart[name][:clearance], :count => 1}
   end
      cart[name[:count] -= coupon[:num]
    end 
  end
end
  cart
end
 
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
