package main

import (
	"fmt"
)

func main() {
	ary := [...]int{1, 2, 3}
	for i, v := range ary {
		fmt.Printf("%d is index, %d is value\n", i, v)
	}
}
