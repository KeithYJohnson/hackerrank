#https://www.hackerrank.com/challenges/circular-array-rotation


n,k,q = "3 2 3".strip.split(' ')
n = n.to_i
k = k.to_i
puts "#{k} rotations"
q = q.to_i
puts "#{q} queries"
a = "1 2 3".strip
a = a.split(' ').map(&:to_i)

a.rotate!((-1 * k))

for a0 in (0..q-1)
  new_a = a
  m = [0,1,2][a0]
  puts a[m]
end
