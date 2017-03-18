package main

import (
	"fmt"
)

func integers() func() int {
	i := 0

	return func() int {
		i += 1
		return i
	}
}

func main() {
	ints := integers()
	fmt.Printf("%v\n", ints())
	fmt.Printf("%v\n", ints())
	fmt.Printf("%v\n", ints())

	ints2 := integers()
	fmt.Printf("%v\n", ints2())
}
