package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"strings"
)

func main() {
	var listenPort int
	var peerAddrsStr string

	flag.IntVar(&listenPort, "port", 8080, "listen port")
	flag.StringVar(&peerAddrsStr, "peers", "", "peer addressess")

	flag.Parse()

	peerAddrs := []string{}

	if len(peerAddrsStr) > 0 {
		peerAddrs = append(peerAddrs, strings.Split(peerAddrsStr, ",")...)
	}

	kv := map[string]string{}

	http.HandleFunc("/get", func(w http.ResponseWriter, r *http.Request) {
		val := r.URL.Query().Get("key")
		if len(val) == 0 {
			w.WriteHeader(400)
			return
		}

		if foundVal, ok := kv[val]; ok {
			w.WriteHeader(200)
			w.Write([]byte(foundVal))
		}

		w.WriteHeader(404)
	})

	http.HandleFunc("/set", func(w http.ResponseWriter, r *http.Request) {
		key := r.URL.Query().Get("key")
		if len(key) == 0 {
			w.WriteHeader(400)
			return
		}

		val := r.URL.Query().Get("value")
		if len(val) == 0 {
			w.WriteHeader(400)
			return
		}

		once := r.URL.Query().Get("once")
		if len(once) == 0 {
			for _, addr := range peerAddrs {
				resp, err := http.Get(fmt.Sprintf("http://%s/values?key=%s&once=true", addr, key))
				if err != nil {
					w.WriteHeader(500)
					return
				}

				resp.Body.Close()

				if resp.StatusCode != 200 {
					w.WriteHeader(500)
					return
				}
			}
		}

		kv[key] = val

		w.WriteHeader(200)
	})

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", listenPort), nil))
}
