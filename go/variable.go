package main

import (
	"fmt"
)

func plus(x, y int) int {
	return x + y
}

func div(a, b int) (int, int) {
	q := a / b
	r := a % b
	return q, r
}

func callFunction(f func()) {
	f()
}

func runDeffer() {
	defer fmt.Println("aaaaa")
	fmt.Println("bbbbbb")
}

func main() {
	runDeffer()
	r := 3
	ary := [...]string{"a", "b", "c"}

	for i, v := range ary {
		fmt.Printf("%d %s\n", i, v)
	}

	fmt.Printf("%v\n", r)
	fmt.Printf("%#v\n", r)
	fmt.Printf("%T\n", r)
}
