def iter_fibo(position):
    if position == 0:
        return 0
    if position == 1:
        return 1

    i = 2
    first  = 0
    second = 1
    next_num   = first + second
    while i < position:
        first    = second
        second   = next_num

        next_num = first + second
        i += 1

    return next_num


print(iter_fibo(0) == 0)
print(iter_fibo(1) == 1)
print(iter_fibo(2) == 1)
print(iter_fibo(3) == 2)
print(iter_fibo(4) == 3)
print(iter_fibo(5) == 5)

def recursive_fib(position):
    if position == 0:
        return 0
    if position == 1:
        return 1

    return recursive_fib(position - 1) + recursive_fib(position - 2)

print(recursive_fib(0) == 0)
print(recursive_fib(1) == 1)
print(recursive_fib(2) == 1)
print(recursive_fib(3) == 2)
print(recursive_fib(4) == 3)
print(recursive_fib(5) == 5)
