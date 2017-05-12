require "./spec_helper"

include ALSA

describe ALSA do
  it "works" do
    true.should eq(true)

    s = sizeof(Void*)
    puts "size of Void* = #{s}"
  end
end
