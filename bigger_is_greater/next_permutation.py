# Credit - https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
# I made some slight changes to the python implementation there^^
def next_permutation(s):
    # Find non-increasing suffix
    arr = list(s)
    i = len(arr) - 1
    while i > 0 and arr[i - 1] >= arr[i]:
        i -= 1
    if i <= 0:
        return 'no answer'

    # Find successor to pivot
    j = len(arr) - 1
    while arr[j] <= arr[i - 1]:
        j -= 1
    arr[i - 1], arr[j] = arr[j], arr[i - 1]

    # Reverse suffix
    arr[i : ] = arr[len(arr) - 1 : i - 1 : -1]
    return ''.join(arr)

print(next_permutation('ab') == 'ba')
print(next_permutation('bb') == 'no answer')
print(next_permutation('hefg') == 'hegf')
print(next_permutation('dhck') == 'dhkc')
print(next_permutation('dkhc') == 'hcdk')
