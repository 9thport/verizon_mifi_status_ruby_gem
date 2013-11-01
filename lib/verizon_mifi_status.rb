class VerizonMifiStatus
  
  VERSION = "0.0.1"

  def onOsX?
    return true if RUBY_PLATFORM =~ /darwin/
  end

  def onMifi?
    begin
      case onOsX?
      when true
        results = `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep -c "Verizon MIFI"`
      when false
        results = 0
      end
      
      case results
      when /0/
        return false
      when /1/
        return true
      end      
    rescue Exception => e
      puts "err: #{e}"
      return true
    end

  end

  def status
    results = Hash.new
    data = `curl -s http://192.168.1.1/getStatus.cgi?dataType=TEXT`.split("\e")
    data.collect { |item| k,v = item.split("="); results[k] = v }
    return results unless onMifi? == false
  end

  def battery
    self.status["BaBattStat"]
  end

  def signal
    self.status["WwRssi"]
  end

  def tx
    self.status["WwSessionTxMb"]
  end

  def rx
    self.status["WwSessionRxMb"]
  end

  def signal
    self.status["WwRssi"]
  end

  def network_name
    self.status["WwNetwkName"]
  end

  def network_tech
    self.status["WwNetwkTech"]
  end

  def roaming
    self.status["WwRoaming"]
  end

  def connection_status
    self.status["WwConnStatus"]
  end

  def battery_status
    self.status["BaBattStat"]
  end

  def battery_charging
    self.status["BaBattChg"]
  end

  def battery_voltage
    self.status["BaBattVolt"]
  end

  def wifi_connected_clients
    self.status["WiConnClients"]  
  end

  def dns
    self.status["WwDNS1"]
  end

  def ip_address
    self.status["WwIpAddr"]
  end

  def mask
    self.status["mask"]
  end

  def gateway
    self.status["WwGateway"]
  end
end

# a = VerizonMifiStatus.new
# puts a.onMifi?