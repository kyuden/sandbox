package main

import (
	"fmt"
)

func sum(s ...int) int {
	n := 0
	for _, v := range s {
		n += v
	}

	return n
}

func main() {
	s := []int{1, 2, 3}
	fmt.Println(sum(s...))
}
