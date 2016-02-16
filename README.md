# CF Redis example dashboard

To upload a dashboard to Datadog:

1. set your DATADOG_APP_KEY and DATADOG_API_KEY in your environment (you can find them under Integrations > APIs)

```
export DATADOG_API_KEY=theapikey
export DATADOG_API_KEY=theappkey
```

2. run `import_dashboard [FILENAME]`, passing in the name of the file that contains your dashboard configuration. See `dashboards/redis.json` for an example.

To get a JSON representation of an existing dashboard, run `get_screenboard [screenboard_id]` or `get_all_screenboards` if you don't know the screenboard_id.
