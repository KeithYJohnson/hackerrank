def hash_string(keyword, num_buckets=12):
    ord_sum = 0
    for char in keyword:
        ord_sum += ord(char)

    return ord_sum % num_buckets

def make_hashtable(nbuckets=12):
    h = []
    for i  in range(0, nbuckets):
         h.append([])

    return h

table = [[['Francis', 13], ['Ellis', 11]], [], [['Bill', 17],
['Zoe', 14]], [['Coach', 4]], [['Louis', 29], ['Rochelle', 4], ['Nick', 2]]]

def hashtable_get_bucket(table, keyword):
    return table[hash_string(keyword, len(table))]


def hashtable_add(htable,key,value):
    bucket = hashtable_get_bucket(htable, key)
    bucket.append([key, value])
    return htable

def hashtable_lookup(htable, key):
    bucket = hashtable_get_bucket(htable, key)
    match = None
    for entry in bucket:
        if entry[0] == key:
            match = entry[-1]

    return match

table = [[['Ellis', 11], ['Francis', 13]], [], [['Bill', 17], ['Zoe', 14]],
[['Coach', 4]], [['Louis', 29], ['Nick', 2], ['Rochelle', 4]]]

print(hashtable_lookup(table, 'Francis'))
#>>> 13

print(hashtable_lookup(table, 'Louis'))
#>>> 29

print(hashtable_lookup(table, 'Zoe'))
#>>> 14
#>>> [[['Ellis', 11], ['Francis', 13]], [], [['Bill', 17], ['Zoe', 14]],
#>>> [['Coach', 4]], [['Louis', 29], ['Nick', 2], ['Rochelle', 4]]]
