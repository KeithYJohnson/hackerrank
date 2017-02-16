import random

def bubble_sort(array):
    did_swap = False
    for idx, _ in enumerate(array):
        a = array[idx]
        try:
            b = array[idx + 1]
            if a > b:
                array[idx]     = b
                array[idx + 1] = a
                did_swap = True
        except IndexError:
            if did_swap:
                bubble_sort(array)
            else:
                print('your done heres your sorted array: ', array)


array = list(range(1, 100))
random.shuffle(array)
bubble_sort(array)
