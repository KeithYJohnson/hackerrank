# Found in discusssion forum here - https://www.hackerrank.com/challenges/game-of-two-stacks/forum
for _ in range(input()):
    s1,s2,max_sum=map(int,raw_input().split())
    stack_1=list(map(int,raw_input().split()))
    stack_2=list(map(int,raw_input().split()))
    i,j,temp_sum,ans=0,0,0,0

    # Reduce sum A until you hit the limit.
    # Set the answer to the number of elements added before the limit.
    while(i<s1 and temp_sum + stack_1[i]<=max_sum):
        temp_sum+=stack_1[i]
        i+=1
    ans=i

    #Iterate through J
    while(j<s2 and i>=0):

        #Add each element to the temp_sum
        temp_sum+=stack_2[j]
        j+=1

        # until you exceed the limit
        while(temp_sum > max_sum and i > 0):
            #Remove the last item from A
            i-=1
            temp_sum-=stack_1[i]
        if(temp_sum<=max_sum and i+j > ans):
            ans=i+j
    print ans
