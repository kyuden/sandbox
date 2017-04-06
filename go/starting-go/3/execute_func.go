package main

import (
	ft "fmt"
)

func ExecuteFunc(f func(int) int) int {
	return f(20)
}

func main() {
	ft.Print(ExecuteFunc(func(x int) (y int) {
		y = x * 2
		return
	}))
}
