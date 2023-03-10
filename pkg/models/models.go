package models

import (
    "errors"
    "time"
)

var ErrNoRecord = errors.New("models: no matching record found")

type Customer struct {
    ID   int    `json:"id"`
    Name string `json:"name"`

    Costs            []*Cost            `json:"costs"`
    ComplianceScores []*ComplianceScore `json:"complianceScores"`

    Created time.Time `json:"created"`
    Updated time.Time `json:"updated"`
}

type Cost struct {
    ID         int       `json:"id"`
    CustomerID int       `json:"customerId"`
    MonthCode  int       `json:"monthCode"`
    Amount     float32   `json:"amount"`
    Created    time.Time `json:"created"`
    Updated    time.Time `json:"updated"`
}

type ComplianceScore struct {
    ID          int       `json:"id"`
    CustomerID  int       `json:"customerId"`
    TotalChecks int       `json:"totalChecks"`
    Completed   int       `json:"completed"`
    Created     time.Time `json:"created"`
    Updated     time.Time `json:"updated"`
}
