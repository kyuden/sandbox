package main

import (
	"fmt"
)

func main() {
	b := []int{1, 2, 3, 4, 5}
	s := b[0:2]
	fmt.Printf("%v\n", s)
	fmt.Printf("%#v\n", s)
	fmt.Printf("%T\n", s)
}
