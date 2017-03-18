package main

import (
	"fmt"
)

func main() {
	fruits := [...]string{"banana", "apple", "peach"}
	for i, s := range fruits {
		fmt.Printf("fruits[%d]=%s\n", i, s)
	}
}
