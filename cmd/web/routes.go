package main

import "net/http"

func (app *application) routes() *http.ServeMux {
    mux := http.NewServeMux()

    mux.HandleFunc("/api/v1/customers/all-with-children", app.showCustomersAllWithChildren)

    fileServer := http.FileServer(http.Dir("./ui/build/"))
    mux.Handle("/", fileServer)

    return mux
}
