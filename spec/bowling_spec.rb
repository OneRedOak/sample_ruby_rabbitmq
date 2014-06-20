require './spec/spec_helper'
require './bowling'

describe Bowling, "#score" do
  it "returns pre for all gutter game" do
    bowling = Bowling.new
    puts "--------111111---------"
    bowling.hit
    puts "--------222222--------- " + bowling.score
    bowling.score.should eq("Hello World!")
  end
end
