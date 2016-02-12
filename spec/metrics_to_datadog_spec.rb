require 'metrics_to_datadog'
require 'fakes/datadog'

RSpec.describe MetricsToDatadog do

  context "when created with no params" do
    it "should raise an exception" do
      expect{MetricsToDatadog.new}.to raise_error(RuntimeError)
    end
  end

  context "#set_dashboard" do
    let! (:app_key) { "some_app_key" }
    let! (:api_key) { "some_api_key" }
    let (:metrics) { MetricsToDatadog.new(app_key, api_key) }

    it "should validate the dashboard config file passed in exists" do
      expect{metrics.set_dashboard("/path/to/invalid")}.to raise_error(RuntimeError)
    end

    it "should make a POST request" do
      mock_datadog = MockDataDogApi::V1::ScreenboardService.new
      metrics.set_datadog(mock_datadog)
      expect(mock_datadog).to receive(:create_screenboard).with("{\"name\":\"redis\"}")
      metrics.set_dashboard("./spec/fakes/redis.json")
    end

  end

end
