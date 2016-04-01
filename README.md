# CF Redis example dashboard

To upload a dashboard to Datadog:

1. Set your DATADOG_APP_KEY and DATADOG_API_KEY in your environment (you can find them under Integrations > APIs)

    ```
    export DATADOG_API_KEY=theapikey
    export DATADOG_APP_KEY=theappkey
    ```

1. Replace occurences of `<< MetricPrefix >>` with the `MetricPrefix` defined in your [firehose nozzle config](https://github.com/cloudfoundry-incubator/datadog-firehose-nozzle).
1. Run `import_dashboard [FILENAME]`, passing in the name of the file that contains your dashboard configuration. See `dashboards/redis.json` for an example.

To get a JSON representation of an existing dashboard, run `get_screenboard [screenboard_id]` or `get_all_screenboards` if you don't know the screenboard_id.
