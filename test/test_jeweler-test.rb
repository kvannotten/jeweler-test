require 'helper'
require 'jeweler-test'
require 'stringio'
 
module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end

class TestJewelerTest < Test::Unit::TestCase
  should "have a version file" do
    assert File.exist?('VERSION'), "There should be a version file"
  end
  
  should "puts 'doing something'" do
    out = capture_stdout do
       JewelerTest.do_something
     end

     assert_equal "doing something\n", out.string
  end
end
