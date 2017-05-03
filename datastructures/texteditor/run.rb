# https://www.hackerrank.com/challenges/simple-text-editor
def append(w, current_s, prev_ss)
  duped      = current_s.dup
  prev_ss   << duped
  current_s << w
  return current_s.dup, prev_ss
end

def delete(k, current_s = "", prev_ss=[])
  duped = current_s.dup
  prev_ss << duped

  current_s = current_s[0...(k.to_i*-1)]
  return current_s.dup, prev_ss
end

def undo(prev_ss=[])
  current_s = prev_ss.pop
  return current_s, prev_ss
end

def solution(operation, args=nil, current_s="", prev_ss=[])
  case operation
  when "1"
    current_s, prev_ss = append(args, current_s, prev_ss)
  when "2"
    current_s, prev_ss = delete(args, current_s, prev_ss)
  when "4"
    current_s, prev_ss = undo(prev_ss)
  else
    puts current_s[args.to_i - 1]
    return current_s, prev_ss
  end
end


## Below isnt exactly what I submitted to Hackerrank but its close
input = File.readlines('testcase3.txt')
num_operations = input.shift.strip.to_i

current_s = ""
prev_ss   = []

NUM_TO_OPS = {
  "1": "append",
  "2": "delete",
  "3": "print",
  "4": "undo"
}

num_operations.times do |i|

  operation, args    = input.shift.split(' ').map(&:strip)
  # p "#{i}th operation: #{NUM_TO_OPS[operation.to_sym]}, args: #{args}, current_s: #{current_s}, prev_ss: #{prev_ss}"
  current_s, prev_ss = solution(operation, args, current_s, prev_ss)
end
