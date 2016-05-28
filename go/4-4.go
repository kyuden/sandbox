package main

import (
	"fmt"
)

// func main() {
// 	m := make(map[int]string)
// 	m[1] = "11111"
// 	m[2] = "22222"
// 	fmt.Printf("%#v\n", m)
// }

func main() {
	m := map[int]string{1: "1111111", 2: "222222"}
	fmt.Printf("%#v", m)
}
