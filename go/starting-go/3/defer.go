package main

import (
	"fmt"
)

func CallDefer(x func() int) {
	defer fmt.Println(x())
	fmt.Println("1")
}

func main() {
	CallDefer(func() int {
		return 3
	})
}
