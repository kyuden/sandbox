package main

import (
	"fmt"
)

func main() {
	m := map[int]int{1: 0}
	i, ok := m[7]
	fmt.Println(m)
	fmt.Println(i, ok)
	// fmt.Println(b)
}
