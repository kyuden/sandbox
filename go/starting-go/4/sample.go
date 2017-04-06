package main

import (
	"fmt"
)

func main() {
	a := [3]int{1, 2, 3}
	s := a[:]
	s = append(s, 9)
	s[0] = 32
	fmt.Println(a)
	fmt.Println(len(a))
	fmt.Println(cap(a))
	fmt.Println(s)
	fmt.Println(len(s))
	fmt.Println(cap(s))

}
