# https://www.interviewcake.com/question/python/product-of-other-numbers
# Write a function get_products_of_all_ints_except_at_index() that takes a list of integers and returns a list of the products.
#
# For example, given:
#
#   [1, 7, 3, 4]
#
# your function would return:
#
#   [84, 12, 28, 21]
#
# by calculating:
#
#   [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]
def solution(a)
  products    = Array.new(a.length) { 1 }
  products[0] = a[0]

  before_idx_product = 1

  a[0...-1].each_with_index do |e, idx|
    before_idx_product *= e
    products[idx + 1]   = before_idx_product
  end

  after_idx_product  = 1
  (a.length - 1).downto(1) do |idx|
    elem = a[idx]
    after_idx_product *= elem
    products[idx - 1] *= after_idx_product
  end

  products
end

a = [1, 7, 3, 4]
p solution(a)
