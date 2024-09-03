
report 'GithubPRLead copy', {
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
        "url": {
            "terms": {
                "field": "url",
                "size": 10,
                "shard_size": 10,
                "min_doc_count": 1,
                "shard_min_doc_count": 0,
                "show_term_doc_count_error": false,
                "order": {
                    "avg_duration": "desc"
                }
            },
            "aggregations": {
                "avg_duration": {
                    "avg": {
                        "script": {
                            "source": "doc.closedTime.value.toInstant().toEpochMilli() - doc.createdTime.value.toInstant().toEpochMilli()"
                        }
                    }
                },
                "include_source": {
                    "top_hits": {
                        "size": 1,
                        "_source": {
                            "include": [
                                "url",
                                "repoName",
                                "branch",
                                "commitId",
                                "title"
                            ]
                        }
                    }
                },
                "time_closed_max": {
                    "max": {
                        "field": "closedTime",
                        "format": "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"
                    }
                },
                "time_closed_min": {
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
