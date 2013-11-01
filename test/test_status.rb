require 'test/unit'
require 'verizon_mifi_status'

class VerizonMifiStatusTest < Test::Unit::TestCase

  def test_onOsX?
    @test = VerizonMifiStatus.new
    assert @test.onOsX?
  end

  def test_status?
    @test = VerizonMifiStatus.new
    assert @test.status
  end
end