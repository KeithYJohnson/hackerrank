def hash_string(keyword, num_buckets = 12)
  ord_sum = 0
  keyword.each_char { |char| ord_sum += char.ord }
  ord_sum % (num_buckets)
end

def make_hashtable(num_buckets=12)
  hash_table = []
  num_buckets.times { hash_table << [] }
  hash_table
end


table = [[['Francis', 13], ['Ellis', 11]], [], [['Bill', 17],
['Zoe', 14]], [['Coach', 4]], [['Louis', 29], ['Rochelle', 4], ['Nick', 2]]]

def hashtable_get_bucket(table, keyword)
  table[hash_string(keyword, table.length)]
end

def hashtable_add(htable, key, value)
    bucket = hashtable_get_bucket(htable, key)
    bucket << [key, value]
    htable
end

def hashtable_lookup(htable, key)
   bucket = hashtable_get_bucket(htable, key)
   match = nil
   bucket.map { |entry| match = entry[-1] if entry[0] == key }
   match
end

def hashtable_update(htable, key, value)
  bucket = hashtable_get_bucket(htable, key)
  did_update = false
  bucket.each do |entry|
    if entry[0] == key
      entry[-1] = value
      did_update = true
    end
  end

  unless did_update
    hashtable_add(htable, key, value)
  end
end

table = [[['Ellis', 11], ['Francis', 13]], [], [['Bill', 17], ['Zoe', 14]],
[['Coach', 4]], [['Louis', 29], ['Nick', 2], ['Rochelle', 4]]]

hashtable_update(table, 'Bill', 42)
hashtable_update(table, 'Rochelle', 94)
hashtable_update(table, 'Zed', 68)
expected = [[['Ellis', 11], ['Francis', 13]], [['Zed', 68]], [['Bill', 42],
             ['Zoe', 14]], [['Coach', 4]], [['Louis', 29], ['Nick', 2],
             ['Rochelle', 94]]]

p table

puts expected == table
