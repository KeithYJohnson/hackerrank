class ParseMake
  attr_accessor :file, :parsed, :target

  def initialize(input_file, target=nil)
    self.file = File.readlines(input_file)
    self.parsed = {}
    self.target = target
  end

  def build_data_struct
    last_dependency = nil
    file.each_with_index do |line, idx|
      if is_dependency?(line)
        dependency, subdepends = line.split(":").map(&:strip)
        parsed[dependency.to_sym] = { subdepends: subdepends.split(" ").map(&:strip) }
        last_dependency = dependency.to_sym
      else
        if parsed[last_dependency][:outputs]
          parsed[last_dependency][:outputs] << line.strip
        else
          parsed[last_dependency][:outputs] = [line.strip]
        end
      end
    end
  end

  def is_dependency?(line)
    line.include?(":")
  end

  def perform
    deps = extract_depends(target)
    deps.reverse_each do  |dep|
      parsed[dep.to_sym][:outputs].each do |line|
        puts line
      end
    end
  end

  def extract_depends(target, depends=[])
    depends << target if depends.empty?
    return depends    if parsed[target.to_sym][:subdepends].empty?

    parsed[target.to_sym][:subdepends].each do |sd|
      depends << sd
      return extract_depends(sd, depends)
    end
  end
end
