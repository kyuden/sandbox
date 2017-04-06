package main

import (
	"fmt"
)

func main() {
	var x interface{} = 2

	a := x.(int)
	fmt.Println(a)

	switch x.(type) {
	case string:
		fmt.Println("x is string")
	case bool:
		fmt.Println("x is bool")
	case int:
		fmt.Println("x is int")
	}
}
