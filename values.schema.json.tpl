{
    "properties": {
        "images": {
            "description": "Define the images used by the {brandname} cluster.",
            "properties": {
                "server": {
                    "description": "The {brandname} server image.",
                    "type": [
                        "string",
                        "null"
                    ]
                },
                "initContainer": {
                    "description": "The image to use as a base for initContainers.",
                    "type": [
                        "string",
                        "null"
                    ]
                }
            },
            "type": [
                "object",
                "null"
            ]
        },
        "deploy": {
            "description": "{brandname} cluster configuration.",
            "properties": {
                "replicas": {
                    "description": "The number of {brandname} pods in the cluster.",
                    "type": "integer"
                },
                "container": {
                    "description": "JVM, CPU, and memory resources for {brandname} pods.",
                    "properties": {
                        "extraJvmOpts": {
                            "description": "JVM options passed to the {brandname} server.",
                            "type": [
                                "string",
                                "null"
                            ]
                        },
                        "storage": {
                            "description": "Storage resources for {brandname} pods.",
                            "properties": {
                                "ephemeral": {
                                    "description": "Whether storage is ephemeral or permanent. When set to true all persisted data is deleted when clusters shut down or restart.",
                                    "type": "boolean"
                                },
                                "size": {
                                    "description": "The amount of storage for {brandname} pods.",
                                    "type": "string"
                                },
                                "storageClassName": {
                                    "description": "The name of a StorageClass object to use for the persistent volume claim (PVC). If you include this field, you must specify an existing storage class as the value. If you do not include this field, the persistent volume claim uses the storage class that has the storageclass.kubernetes.io/is-default-class annotation set to true.",
                                    "type": [
                                        "string",
                                        "null"
                                    ]
                                }
                            },
                            "type": [
                                "object",
                                "null"
                            ]
                        },
                        "resources": {
                            "description": "{brandname} Pod CPU and Memory resources",
                            "properties": {
                                "limits": {
                                    "properties": {
                                        "cpu": {
                                            "description": "{brandname} pod's CPU limit (measured in CPU units).",
                                            "type": "string"
                                        },
                                        "memory": {
                                            "description": "{brandname} pod's memory limit (measured in bytes).",
                                            "type": "string"
                                        }
                                    },
                                    "type": [
                                        "object",
                                        "null"
                                    ]
                                },
                                "requests": {
                                    "properties": {
                                        "cpu": {
                                            "description": "{brandname} pod's CPU requests (measured in CPU units).",
                                            "type": "string"
                                        },
                                        "memory": {
                                            "description": "{brandname} pod's memory requests (measured in bytes).",
                                            "type": "string"
                                        }
                                    },
                                    "type": [
                                        "object",
                                        "null"
                                    ]
                                }
                            },
                            "type": [
                                "object",
                                "null"
                            ]
                        }
                    },
                    "type": [
                        "object",
                        "null"
                    ]
                },
                "security": {
                    "description": "Cluster security",
                    "properties": {
                        "authentication": {
                            "description": "If false authentication is disabled for {brandname}'s single-port endpoint.",
                            "type": "boolean"
                        },
                        "secretName": {
                            "description": "Specifies a secret that contains all required security data.",
                            "type": [
                                "string",
                                "null"
                            ]
                        },
                        "batch": {
                            "description": "A {brandname} CLI batch file that can be used to create users, roles etc before server startup.",
                            "type": [
                                "string",
                                "null"
                            ]
                        }
                    },
                    "type": [
                        "object",
                        "null"
                    ]
                },
                "expose": {
                    "description": "How {brandname} is exposed to external networks",
                    "properties": {
                        "type": {
                            "description": "How to expose the {brandname} single-port externally. Set to empty if external access is not desired.",
                            "enum": [
                                "",
                                "Route"
                            ],
                            "type": [
                                "string",
                                "null"
                            ],
                            "default": ""
                        },
                        "nodeport": {
                            "description": "A node port to which the load balancer forwards traffic.",
                            "type": "integer"
                        },
                        "host": {
                            "description": "Optional hostname to be exposed.",
                            "type": [
                                "string",
                                "null"
                            ]
                        },
                        "annotations": {
                            "description": "Annotations added to the created network resource, e.g. a Route.",
                            "items": {
                                "properties": {
                                    "key": {
                                        "type": "string"
                                    },
                                    "value": {
                                        "type": "string"
                                    }
                                },
                                "required": [
                                    "key",
                                    "value"
                                ]
                            },
                            "type": [
                                "array",
                                "null"
                            ]
                        }
                    },
                    "type": [
                        "object",
                        "null"
                    ]
                },
                "logging": {
                    "description": "{brandname} server logging",
                    "properties": {
                        "categories": {
                            "description": "Defines log levels for provided categories.",
                            "items": {
                                "properties": {
                                    "category": {
                                        "description": "The fqn of the package to configure logging for.",
                                        "type": "string"
                                    },
                                    "level": {
                                        "description": "The logging level for this package.",
                                        "default": "info",
                                        "enum": [
                                            "trace",
                                            "debug",
                                            "info",
                                            "warn",
                                            "error"
                                        ],
                                        "type": "string"
                                    }
                                },
                                "required": [
                                    "category",
                                    "level"
                                ]
                            },
                            "title": "Category",
                            "type": [
                                "array",
                                "null"
                            ]
                        }
                    }
                },
                "resourceLabels": {
                    "description": "Labels that are added to the created {brandname} resources, e.g. Pods and Services.",
                    "items": {
                        "properties": {
                            "key": {
                                "type": "string"
                            },
                            "value": {
                                "type": "string"
                            }
                        },
                        "required": [
                            "key",
                            "value"
                        ]
                    },
                    "type": [
                        "array",
                        "null"
                    ]
                }
            },
            "type": [
                "object",
                "null"
            ]
        }
    },
    "$schema": "http://json-schema.org/schema#",
    "type": "object"
}
