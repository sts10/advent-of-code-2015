require 'pry'

class Sleigh
  attr_reader :current_pos, :all_poses
  def initialize
    @current_pos = [0,0]
    @all_poses = [ [0,0] ]
  end
  
  def >
    @current_pos[1] = @current_pos[1] + 1
    self.log_current_pos
  end

  def <
    @current_pos[1] = @current_pos[1] - 1
    self.log_current_pos
  end
  
  def ^
    @current_pos[0] = @current_pos[0] + 1
    self.log_current_pos
  end

  def v
    @current_pos[0] = @current_pos[0] -1
    self.log_current_pos
  end

  def log_current_pos
    @all_poses << @current_pos.dup
    self # returns self so we can string method calls together. FRAT.
  end

  def get_unique_pos
    @all_poses.uniq.count
  end

  def drive(command_string)
    command_string.each_char do |command|
      self.send(command)
    end
  end

  def drive_from_file(file_location)
    File.open(file_location, "r") do |f|
      f.each_line do |line|
        self.drive(line.to_s)
      end
    end
  end
end


def alternate_commands_from_file_to_two_santas(santa0, santa1, file_location)
  file_string = ""
  File.open(file_location, "r") do |f|
    f.each_line do |line|
      file_string = file_string + line.to_s
    end
  end

  i = 0
  file_string.each_char do |command|
    if i.even?
      santa0.drive(command)
    else
      santa1.drive(command)
    end
    i = i + 1
  end
end


def get_robo_santa_count
  santa = Sleigh.new
  robo_santa = Sleigh.new
  alternate_commands_from_file_to_two_santas(santa, robo_santa, './input')
  all = santa.all_poses + robo_santa.all_poses
  all.uniq.count
end


santa = Sleigh.new
santa.drive_from_file('./input')
puts "part 1 is #{santa.get_unique_pos}"

puts "part 2 is #{get_robo_santa_count}"
