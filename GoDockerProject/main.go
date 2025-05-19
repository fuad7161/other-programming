package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request){
	fmt.Fprintf(w, "Hello from Dockerized go App!")
}

func main(){
	http.HandleFunc("/", handler)
	fmt.Println("Server running on port 8080")
	http.ListenAndServe(":8080", nil)
}