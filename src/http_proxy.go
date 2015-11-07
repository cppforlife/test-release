package main

import (
	"flag"
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"time"
)

func main() {
	var listenPort int
	var backendAdrr string

	flag.IntVar(&listenPort, "port", 8080, "listen port")
	flag.StringVar(&backendAdrr, "backend-addr", "127.0.0.1:8080", "backend addr")

	flag.Parse()

	var src, dst string

	flag.Parse()

	u, err := url.Parse(dst)
	if err != nil {
		log.Fatal("Bad destination.")
	}

	srv := &http.Server{
		Addr:           fmt.Sprintf(":%d", listenPort),
		Handler:        httputil.NewSingleHostReverseProxy(backendAdrr),
		ReadTimeout:    10 * time.Second,
		WriteTimeout:   10 * time.Second,
		MaxHeaderBytes: 1 << 20,
	}

	log.Fatal(srv.ListenAndServe())
}
