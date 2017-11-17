require 'socket'
require 'timeout'
require 'uri'

@services = [
  "DATABASE_URL",
  "REDIS_SESSION_URL",
  "REDIS_CACHE_URL"
].map do |service|
  URI.parse(ENV[service])
end

@services.each do |service|
  puts "INFO: ====> Checking #{service.host}:#{service.port}"
  begin
    Timeout.timeout(30) do
      begin
        Socket.tcp(service.host, service.port, connect_timeout: 5)
      rescue TimeoutError
        puts "ERROR: ====> #{service.host}:#{service.port} Net unreachable!"
        sleep 5
        retry
      rescue StandardError
        puts "ERROR: ====> #{service.host}:#{service.port} An error occurred!"
        sleep 5
        retry
      end
    end
  rescue Timeout::TimeoutError
    puts "ERROR: ====> All operations timed out!"
    exit 255
  end
end