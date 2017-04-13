
Consider an unsorted array, , of distinct integers from  to . We can swap two adjacent elements in  any number of times as long as the absolute difference between these elements is .

For example, the diagram below depicts an array where we can swap adjacent elements  and  or  and , but we cannot swap adjacent elements  and  or  and :

image

Answer  queries, where each query consists of some array . For each query, print Yes on a new line if it's possible to sort the array in ascending order by performing the swap operation defined above; otherwise, print No instead.

Input Format

The first line contains a single integer denoting . The subsequent lines describe each of the  queries in the following format:

The first line contains an integer denoting .
The second line contains  space-separated integers describing the respective values of .
Constraints

The sum of  over all queries doesn't exceed .
Output Format

For each query, print Yes on a new line if it's possible to sort the array; otherwise, print No instead.

Sample Input 0

2
4
1 0 3 2
3
2 1 0
Sample Output 0

Yes
No
Explanation 0

We perform the following  queries:

The following sequence of swaps will sort the array in ascending order:


Because  is now sorted, we print Yes on a new line.

Initially, we can perform two possible swaps:


After performing this swap, no number of additional swaps can move  to the front of the array.

After performing this swap, no number of additional swaps can move  to the back of the array.
Because there's no way for us to sort the array, we print No on a new line.
