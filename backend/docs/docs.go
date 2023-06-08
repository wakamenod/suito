// Package docs GENERATED BY SWAG; DO NOT EDIT
// This file was generated by swaggo/swag
package docs

import "github.com/swaggo/swag"

const docTemplate = `{
    "schemes": {{ marshal .Schemes }},
    "swagger": "2.0",
    "info": {
        "description": "{{escape .Description}}",
        "title": "{{.Title}}",
        "contact": {},
        "version": "{{.Version}}"
    },
    "host": "{{.Host}}",
    "basePath": "{{.BasePath}}",
    "paths": {
        "/ping": {
            "get": {
                "description": "Ping",
                "produces": [
                    "text/plain"
                ],
                "tags": [
                    "suito.default"
                ],
                "summary": "Ping",
                "operationId": "ping",
                "responses": {
                    "200": {
                        "description": "pong",
                        "schema": {
                            "type": "string"
                        }
                    }
                }
            }
        },
        "/transactions": {
            "get": {
                "description": "List transactions.",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "suito.transactions"
                ],
                "summary": "List transactions",
                "operationId": "listTransactions",
                "parameters": [
                    {
                        "type": "string",
                        "description": "yearMonth",
                        "name": "yearMonth",
                        "in": "query",
                        "required": true
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/definitions/ListTransactionsRes"
                        }
                    },
                    "500": {
                        "description": "Unknown Error",
                        "schema": {
                            "$ref": "#/definitions/APIErrorRes"
                        }
                    }
                }
            }
        },
        "/transactions/months": {
            "get": {
                "description": "トランザクションが発生した月(YYYY-MM)の一覧を取得します.",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "suito.transactions"
                ],
                "summary": "List transaction months",
                "operationId": "transactionMonths",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/definitions/TransactionMonthsRes"
                        }
                    },
                    "500": {
                        "description": "Unknown Error",
                        "schema": {
                            "$ref": "#/definitions/APIErrorRes"
                        }
                    }
                }
            }
        }
    },
    "definitions": {
        "APIErrorInfo": {
            "type": "object",
            "required": [
                "code",
                "data",
                "message"
            ],
            "properties": {
                "code": {
                    "type": "string"
                },
                "data": {
                    "type": "string"
                },
                "message": {
                    "type": "string"
                }
            }
        },
        "APIErrorRes": {
            "type": "object",
            "required": [
                "errorInfo"
            ],
            "properties": {
                "errorInfo": {
                    "$ref": "#/definitions/APIErrorInfo"
                }
            }
        },
        "ListTransactionsRes": {
            "type": "object",
            "required": [
                "transactions"
            ],
            "properties": {
                "transactions": {
                    "type": "array",
                    "items": {
                        "$ref": "#/definitions/Transaction"
                    }
                }
            }
        },
        "Transaction": {
            "type": "object",
            "required": [
                "amount",
                "id",
                "localDate",
                "title",
                "type"
            ],
            "properties": {
                "amount": {
                    "type": "integer"
                },
                "id": {
                    "type": "string"
                },
                "localDate": {
                    "type": "string"
                },
                "title": {
                    "type": "string"
                },
                "type": {
                    "type": "integer",
                    "enum": [
                        1,
                        2
                    ]
                }
            }
        },
        "TransactionMonthsRes": {
            "type": "object",
            "required": [
                "yearMonths"
            ],
            "properties": {
                "yearMonths": {
                    "type": "array",
                    "items": {
                        "type": "string"
                    }
                }
            }
        }
    }
}`

// SwaggerInfo holds exported Swagger Info so clients can modify it
var SwaggerInfo = &swag.Spec{
	Version:          "1.0",
	Host:             "localhost:8009",
	BasePath:         "/api/v1",
	Schemes:          []string{},
	Title:            "suito",
	Description:      "",
	InfoInstanceName: "swagger",
	SwaggerTemplate:  docTemplate,
}

func init() {
	swag.Register(SwaggerInfo.InstanceName(), SwaggerInfo)
}