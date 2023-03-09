package main

import (
    "encoding/json"
    "fmt"
    "net/http"
)

func (app *application) showCustomersAllWithChildren(w http.ResponseWriter, r *http.Request) {
    customers, err := app.customers.AllWithChildren()
    if err != nil {
        app.serverError(w, err)
        return
    }

    enc, err := json.Marshal(customers)
    if err != nil {
        app.serverError(w, err)
        return
    }

    fmt.Fprint(w, string(enc))
}
