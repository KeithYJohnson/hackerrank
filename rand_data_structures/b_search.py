import math

def binary_search(input_array, value):
    starting_idx = 0
    end_idx      = len(input_array)

    # Second arg is the base
    max_iters_needed = int(math.log(len(input_array),2) + 1)

    for i in range(0, max_iters_needed):
        middle_idx   = int((starting_idx + end_idx) / 2)
        middle_val = input_array[middle_idx]
        if middle_val > value:
            end_idx = middle_idx
        elif middle_val < value:
            starting_idx = middle_idx + 1
        else: #
            return middle_idx


    return -1

test_list = [1,3,9,11,15,19,29]
test_val1 = 25
test_val2 = 15
print(binary_search(test_list, test_val1))
print(binary_search(test_list, test_val2))
