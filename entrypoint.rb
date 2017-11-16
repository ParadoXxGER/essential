require 'socket'
require 'timeout'

@services = [
  {
    host: "postgres",
    port: 5432
  },
  {
    host: "redis",
    port: 6379
  }
]

def check_services
  @services.each do |service|
    puts "INFO: ====> Checking #{service[:host]} #{service[:port]}"
    begin
      Socket.tcp(service[:host], service[:port], connect_timeout: 5)
    rescue Errno::ENETUNREACH
      puts "ERROR: ====> Net unreachable"
      sleep 5
      check_services
    rescue Errno::EADDRNOTAVAIL
      puts "ERROR: ====> Address not available"
      sleep 5
      check_services
    end
  end
end

if ENV['RAILS_ENV'] == 'test'
  check_services
  puts "INFO: ====> Starting integration tests"
  begin
    system 'rails test:integration'
  rescue SystemCallError
    puts "ERROR: ====> Integration tests failed!"
    exit(255)
  end
  exit(0)
else
  begin
    system 'rails db:migrate'
    system 'rails s'
  rescue SystemCallError
    puts "ERROR: ====> Migration failed!"
    exit(255)
  end
end


