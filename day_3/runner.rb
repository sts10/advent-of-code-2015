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
    self
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

