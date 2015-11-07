package main

import (
	"flag"
	"fmt"
	"net/http"
)

func main() {
	var port int

	flag.IntVar(&port, "port", 8080, "port to listen on")

	flag.Parse()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Accessed path %s", r.URL.Path[1:])
	})

	http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
}
