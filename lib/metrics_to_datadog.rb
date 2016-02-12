require 'dogapi'

class MetricsToDatadog

  def initialize(app_key = nil, api_key = nil)
    if api_key.nil? || app_key.nil? then
      raise RuntimeError, "Please provide your datadog app and api keys"
    end
    @dogclient = Dogapi::Client.new(app_key, api_key)
  end

  def set_datadog(datadog)
    @dogclient = datadog
  end

  def set_dashboard(dashboard_config)
    if !File.exist?(dashboard_config) then
      raise RuntimeError, "The dashboard config does not exist."
    end

    File.open(dashboard_config) do |file|
      @dogclient.create_screenboard(file.read.strip)
    end

  end

end
