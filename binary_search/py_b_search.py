import math

def bsearch(array, target, offset=0):
    not_found = True
    mid_idx   = math.floor(len(array) / 2)
    try:
        mid_value = array[mid_idx]
    except IndexError:
        print("Could not find target value of: {}".format(target))
        raise


    if mid_value == target:
        print("found target: {} at idx: {}".format(target, (offset + mid_idx)))
        not_found = False

    if not_found:
        first_half  = array[0:mid_idx]
        second_half = array[mid_idx + 1:]

        if mid_value > target:
            bsearch(first_half, target, offset)
        else:
            bsearch(second_half, target, offset + len(first_half) + 1)


array = list(range(1,100))
bsearch(array, 0)
