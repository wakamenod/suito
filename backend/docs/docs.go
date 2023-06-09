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
        "/expense": {
            "post": {
                "description": "支出情報を登録します",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "suito.expense"
                ],
                "summary": "Register expense",
                "operationId": "registerExpense",
                "parameters": [
                    {
                        "description": "register expense req",
                        "name": "request",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "$ref": "#/definitions/RegisterExpenseReq"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/definitions/RegisterExpenseRes"
                        }
                    },
                    "500": {
                        "description": "Unknown Error",
                        "schema": {
                            "$ref": "#/definitions/SuitoError"
                        }
                    }
                }
            }
        },
        "/expense/categories": {
            "get": {
                "description": "購入カテゴリー一覧を返却します.",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "suito.expense"
                ],
                "summary": "List expense categories",
                "operationId": "listExpenseCategories",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/definitions/ListExpenseCategoriesRes"
                        }
                    },
                    "500": {
                        "description": "Unknown Error",
                        "schema": {
                            "$ref": "#/definitions/SuitoError"
                        }
                    }
                }
            }
        },
        "/expense/detail": {
            "post": {
                "description": "購入詳細情報を取得します.",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "suito.expense"
                ],
                "summary": "Get expense detail",
                "operationId": "expenseDetail",
                "parameters": [
                    {
                        "description": "expense detail req",
                        "name": "request",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "$ref": "#/definitions/ExpenseDetailReq"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/definitions/ExpenseDetailRes"
                        }
                    },
                    "500": {
                        "description": "Unknown Error",
                        "schema": {
                            "$ref": "#/definitions/SuitoError"
                        }
                    }
                }
            }
        },
        "/expense/locations": {
            "get": {
                "description": "購入場所ー一覧を返却します.",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "suito.expense"
                ],
                "summary": "List expense locations",
                "operationId": "listExpenseLocations",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/definitions/ListExpenseLocationsRes"
                        }
                    },
                    "500": {
                        "description": "Unknown Error",
                        "schema": {
                            "$ref": "#/definitions/SuitoError"
                        }
                    }
                }
            }
        },
        "/income": {
            "post": {
                "description": "収入情報を登録します",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "suito.income"
                ],
                "summary": "Register income",
                "operationId": "registerIncome",
                "parameters": [
                    {
                        "description": "register income req",
                        "name": "request",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "$ref": "#/definitions/RegisterIncomeReq"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/definitions/RegisterIncomeRes"
                        }
                    },
                    "500": {
                        "description": "Unknown Error",
                        "schema": {
                            "$ref": "#/definitions/SuitoError"
                        }
                    }
                }
            }
        },
        "/income/detail": {
            "post": {
                "description": "収入詳細情報を取得します.",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "suito.income"
                ],
                "summary": "Get income detail",
                "operationId": "incomeDetail",
                "parameters": [
                    {
                        "description": "income detail req",
                        "name": "request",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "$ref": "#/definitions/IncomeDetailReq"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/definitions/IncomeDetailRes"
                        }
                    },
                    "500": {
                        "description": "Unknown Error",
                        "schema": {
                            "$ref": "#/definitions/SuitoError"
                        }
                    }
                }
            }
        },
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
                            "$ref": "#/definitions/SuitoError"
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
                            "$ref": "#/definitions/SuitoError"
                        }
                    }
                }
            }
        }
    },
    "definitions": {
        "ExpenseDetailReq": {
            "type": "object",
            "required": [
                "id"
            ],
            "properties": {
                "id": {
                    "type": "string"
                }
            }
        },
        "ExpenseDetailRes": {
            "type": "object",
            "required": [
                "expense"
            ],
            "properties": {
                "expense": {
                    "$ref": "#/definitions/model.Expense"
                }
            }
        },
        "IncomeDetailReq": {
            "type": "object",
            "required": [
                "id"
            ],
            "properties": {
                "id": {
                    "type": "string"
                }
            }
        },
        "IncomeDetailRes": {
            "type": "object",
            "required": [
                "income"
            ],
            "properties": {
                "income": {
                    "$ref": "#/definitions/model.Income"
                }
            }
        },
        "ListExpenseCategoriesRes": {
            "type": "object",
            "required": [
                "expenseCategories"
            ],
            "properties": {
                "expenseCategories": {
                    "type": "array",
                    "items": {
                        "$ref": "#/definitions/model.ExpenseCategory"
                    }
                }
            }
        },
        "ListExpenseLocationsRes": {
            "type": "object",
            "required": [
                "expenseLocations"
            ],
            "properties": {
                "expenseLocations": {
                    "type": "array",
                    "items": {
                        "$ref": "#/definitions/model.ExpenseLocation"
                    }
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
        "RegisterExpenseReq": {
            "type": "object",
            "required": [
                "expense"
            ],
            "properties": {
                "expense": {
                    "$ref": "#/definitions/model.Expense"
                }
            }
        },
        "RegisterExpenseRes": {
            "type": "object",
            "required": [
                "newExpense"
            ],
            "properties": {
                "newExpense": {
                    "$ref": "#/definitions/model.Expense"
                }
            }
        },
        "RegisterIncomeReq": {
            "type": "object",
            "required": [
                "income"
            ],
            "properties": {
                "income": {
                    "$ref": "#/definitions/model.Income"
                }
            }
        },
        "RegisterIncomeRes": {
            "type": "object",
            "required": [
                "newIncome"
            ],
            "properties": {
                "newIncome": {
                    "$ref": "#/definitions/model.Income"
                }
            }
        },
        "SuitoError": {
            "type": "object",
            "properties": {
                "ErrCode": {
                    "type": "string"
                },
                "message": {
                    "type": "string"
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
        },
        "model.Expense": {
            "type": "object",
            "required": [
                "amount",
                "expense_category_id",
                "expense_location_id",
                "id",
                "local_date",
                "memo",
                "title"
            ],
            "properties": {
                "amount": {
                    "type": "integer"
                },
                "expense_category_id": {
                    "type": "string"
                },
                "expense_location_id": {
                    "type": "string"
                },
                "id": {
                    "type": "string"
                },
                "local_date": {
                    "type": "string"
                },
                "memo": {
                    "type": "string"
                },
                "title": {
                    "type": "string"
                }
            }
        },
        "model.ExpenseCategory": {
            "type": "object",
            "required": [
                "id",
                "name"
            ],
            "properties": {
                "id": {
                    "type": "string"
                },
                "name": {
                    "type": "string"
                }
            }
        },
        "model.ExpenseLocation": {
            "type": "object",
            "required": [
                "id",
                "name"
            ],
            "properties": {
                "id": {
                    "type": "string"
                },
                "name": {
                    "type": "string"
                }
            }
        },
        "model.Income": {
            "type": "object",
            "required": [
                "amount",
                "id",
                "local_date",
                "memo",
                "title"
            ],
            "properties": {
                "amount": {
                    "type": "integer"
                },
                "id": {
                    "type": "string"
                },
                "local_date": {
                    "type": "string"
                },
                "memo": {
                    "type": "string"
                },
                "title": {
                    "type": "string"
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
