package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
)

func main() {
	var listenPort int

	flag.IntVar(&listenPort, "port", 8080, "listen port")

	flag.Parse()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Accessed path %s", r.URL.Path[1:])
	})

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", listenPort), nil))
}
