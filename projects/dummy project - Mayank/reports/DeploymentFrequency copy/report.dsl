
report 'DeploymentFrequency copy', {
  definition = '''{
    "size": 0,
    "query": {
        "bool": {
            "filter": [
                {
                    "term": {
                        "reportEventType": "ef_pipeline_run_completed"
                    }
                },
                {
                    "range": {
                        "flowRuntimeFinish": {
                            "gte": "$[showAsOfDate]||-$[timeSlice]d-$[timeSlice]d+1d/d",
                            "lte": "$[showAsOfDate]||/d",
                            "format": "yyyy-MM-dd",
                            "time_zone": "$[timezoneID]"
                        }
                    }
                }
            ]
        }
    },
    "aggregations": {
        "single_metric_bucket": {
            "terms": {
                "script": "_doc"
            },
            "aggregations": {
                "past_interval": {
                    "date_range": {
                        "field": "flowRuntimeFinish",
                        "format": "yyyy-MM-dd",
                        "time_zone": "$[timezoneID]",
                        "ranges": [
                            {
                                "from": "$[showAsOfDate]||-$[timeSlice]d-$[timeSlice]d+1d/d",
                                "to": "$[showAsOfDate]||-$[timeSlice]d+1d/d"
                            }
                        ]
                    },
                    "aggregations": {
                        "total_deployments": {
                            "value_count": {
                                "field": "pipelineRunOutcome"
                            }
                        },
                        "successful_deployments": {
                            "sum": {
                                "script": "doc.containsKey(\'pipelineRunOutcome\') && doc[\'pipelineRunOutcome\'].value == \'success\' ? 1 : 0"
                            }
                        }
                    }
                },
                "current_interval": {
                    "date_range": {
                        "field": "flowRuntimeFinish",
                        "format": "yyyy-MM-dd",
                        "time_zone": "$[timezoneID]",
                        "ranges": [
                            {
                                "from": "$[showAsOfDate]||-$[timeSlice]d+1d/d"
                            }
                        ]
                    },
                    "aggregations": {
                        "total_deployments": {
                            "value_count": {
                                "field": "pipelineRunOutcome"
                            }
                        },
                        "successful_deployments": {
                            "sum": {
                                "script": "doc.containsKey(\'pipelineRunOutcome\') && doc[\'pipelineRunOutcome\'].value == \'success\' ? 1 : 0"
                            }
                        }
                    }
                },
                "output_metric_current_successful_deployments": {
                    "sum_bucket": {
                        "buckets_path": "current_interval>successful_deployments"
                    }
                },
                "output_metric_past_successful_deployments": {
                    "sum_bucket": {
                        "buckets_path": "past_interval>successful_deployments"
                    }
                },
                "output_metric_current_total_deployments": {
                    "sum_bucket": {
                        "buckets_path": "current_interval>total_deployments"
                    }
                },
                "output_metric_past_total_deployments": {
                    "sum_bucket": {
                        "buckets_path": "past_interval>total_deployments"
                    }
                },
                "output_metric_current_percent": {
                    "bucket_script": {
                        "buckets_path": {
                            "successfulCount": "output_metric_current_successful_deployments",
                            "totalCount": "output_metric_current_total_deployments"
                        },
                        "script": "params.successfulCount / params.totalCount * 100",
                        "gap_policy": "insert_zeros"
                    }
                },
                "output_metric_past_percent": {
                    "bucket_script": {
                        "buckets_path": {
                            "successfulCount": "output_metric_past_successful_deployments",
                            "totalCount": "output_metric_past_total_deployments"
                        },
                        "script": "params.successfulCount / params.totalCount * 100",
                        "gap_policy": "insert_zeros"
                    }
                },
                "output_metric_trend": {
                    "bucket_script": {
                        "buckets_path": {
                            "currentPercent": "output_metric_current_percent",
                            "priorPercent": "output_metric_past_percent"
                        },
                        "script": "params.currentPercent - params.priorPercent",
                        "gap_policy": "insert_zeros"
                    }
                }
            }
        }
    }
}'''
  projectName = 'dummy project - Mayank'
  reportObjectTypeName = 'pipelinerun'

  formalParameter 'showAsOfDate', defaultValue: '$[/javascript var date = new Date(); var d = \'\' + date.getDate(); var m = \'\' + (date.getMonth() + 1); \'\' + date.getFullYear() + \'-\' + (m<=9 ? \'0\' + m : m) + \'-\' + (d <= 9 ? \'0\' + d : d);]', {
    description = 'Effective date used to report the metrics. Defaults to today\'s date.'
    expansionDeferred = '0'
    label = 'Show as of'
    orderIndex = '1'
    required = '1'
    type = 'date'
  }

  formalParameter 'timeSlice', defaultValue: '30', {
    description = 'Number of days relative to the \'Show as of\' date used to calculate the relative date range used by the report.'
    expansionDeferred = '0'
    label = 'Time Slice (days)'
    orderIndex = '2'
    required = '1'
    type = 'integer'
  }
}
