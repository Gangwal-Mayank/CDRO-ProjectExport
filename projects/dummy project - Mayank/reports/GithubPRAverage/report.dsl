
report 'GithubPRAverage', {
  definition = '''{
    "size": 0,
    "query": {
        "bool": {
            "filter": [
                {
                    "bool": {
                        "must": [
                            {
                                "exists": {
                                    "field": "closedTime",
                                    "boost": 1
                                }
                            }
                        ],
                        "adjust_pure_negative": true,
                        "boost": 1
                    }
                }
            ],
            "adjust_pure_negative": true,
            "boost": 1
        }
    },
    "aggregations": {
        "branch": {
            "terms": {
                "field": "branch",
                "size": 10,
                "shard_size": 10,
                "min_doc_count": 1,
                "shard_min_doc_count": 0,
                "show_term_doc_count_error": false,
                "order": [
                    {
                        "_count": "desc"
                    },
                    {
                        "_key": "asc"
                    }
                ]
            },
            "aggregations": {
                "avg_duration": {
                    "avg": {
                        "script": {
                            "source": "doc.closedTime.value.toInstant().toEpochMilli() - doc.createdTime.value.toInstant().toEpochMilli()"
                        }
                    }
                },
                "time_close_max": {
                    "max": {
                        "field": "closedTime",
                        "format": "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"
                    }
                },
                "time_close_min": {
                    "min": {
                        "field": "closedTime",
                        "format": "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"
                    }
                }
            }
        }
    }
}'''
  projectName = 'dummy project - Mayank'
  reportObjectTypeName = 'github_pr_report'
}
