package main

import (
	"fmt"
)

func main() {
L:
	for i := 1; i <= 3; i++ {
		for j := 1; j <= 3; j++ {
			if j > 1 {
				continue L
			}

			fmt.Printf("%d * %d = %d\n", i, j, i*j)
		}
		fmt.Println("実行されない")
	}
}
