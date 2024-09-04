
report 'MeanTimeToRecover', {
  description = 'Average time taken to resolve an incident in Service Now.'
  definition = '''{
    "size": 0,
    "query": {
        "bool": {
            "filter": [
                {
                    "exists": {
                        "field": "incidentId"
                    }
                },
                {
                    "range": {
                        "modifiedOn": {
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
                "current": {
                    "terms": {
                        "field": "incidentId",
                        "size": 1000,
                        "collect_mode": "breadth_first"
                    },
                    "aggregations": {
                        "latest_date": {
                            "max": {
                                "field": "modifiedOn"
                            }
                        },
                        "filter_resolved": {
                            "filter": {
                                "script": {
                                    "script": "(doc.containsKey(\'status\') && doc[\'status\'].size() > 0) && (doc[\'status\'].value == \'Resolved\' || doc[\'status\'].value == \'Closed\')"
                                }
                            },
                            "aggregations": {
                                "latest_resolved_date": {
                                    "max": {
                                        "field": "modifiedOn"
                                    }
                                },
                                "duration": {
                                    "max": {
                                        "script": {
                                            "source": "doc.resolvedOn.value.toInstant().toEpochMilli() - doc.createdOn.value.toInstant().toEpochMilli()"
                                        }
                                    }
                                }
                            }
                        },
                        "resolved_incident": {
                            "bucket_script": {
                                "buckets_path": {
                                    "latestDate": "latest_date",
                                    "resolvedDate": "filter_resolved>latest_resolved_date"
                                },
                                "script": "params.latestDate == params.resolvedDate ? 1 : 0",
                                "gap_policy": "insert_zeros"
                            }
                        },
                        "resolved_duration": {
                            "bucket_script": {
                                "buckets_path": {
                                    "latestDate": "latest_date",
                                    "resolvedDate": "filter_resolved>latest_resolved_date",
                                    "duration": "filter_resolved>duration"
                                },
                                "script": "params.latestDate == params.resolvedDate ? params.duration : 0",
                                "gap_policy": "insert_zeros"
                            }
                        }
                    }
                },
                "drilldown_target_source": {
                    "terms": {
                        "field": "source",
                        "exclude": "null",
                        "size": 5
                    },
                    "aggregations": {
                        "drilldown_base_url": {
                            "terms": {
                                "field": "baseDrilldownUrl",
                                "min_doc_count": 1,
                                "exclude": "null",
                                "size": 5,
                                "order": {
                                    "max_date": "desc"
                                }
                            },
                            "aggregations": {
                                "max_date": {
                                    "max": {
                                        "field": "modifiedOn"
                                    }
                                },
                                "drilldown_release_uri": {
                                    "terms": {
                                        "field": "releaseUri",
                                        "missing": "",
                                        "min_doc_count": 1,
                                        "exclude": "null",
                                        "size": 5
                                    }
                                }
                            }
                        }
                    }
                },
                "output_metric_current_resolved_incidents": {
                    "sum_bucket": {
                        "buckets_path": "current>resolved_incident"
                    }
                },
                "output_metric_sum_total_resolved_incident_duration": {
                    "sum_bucket": {
                        "buckets_path": "current>resolved_duration"
                    }
                },
                "output_metric_average_incident_resolution_duration": {
                    "bucket_script": {
                        "buckets_path": {
                            "duration": "output_metric_sum_total_resolved_incident_duration",
                            "uniqueCount": "output_metric_current_resolved_incidents"
                        },
                        "script": "params.duration/params.uniqueCount",
                        "gap_policy": "insert_zeros"
                    }
                }
            }
        }
    }
}'''
  projectName = 'dummy project - Mayank2'
  reportObjectTypeName = 'incident'
  title = 'Average Resolution Time'
  uri = 'ef-incident-*/_search?filter_path=**.drilldown_*,**.output_metric_*&pretty'

  formalParameter 'showAsOfDate', defaultValue: '$[/javascript var date = new Date(); var d = \'\' + date.getDate(); var m = \'\' + (date.getMonth() + 1); \'\' + date.getFullYear() + \'-\' + (m<=9 ? \'0\' + m : m) + \'-\' + (d <= 9 ? \'0\' + d : d);]', {
    description = 'Effective date used to report the metrics. Defaults to today\'s date.'
    expansionDeferred = '0'
    label = 'Show as of'
    required = '1'
    type = 'date'
  }
}
