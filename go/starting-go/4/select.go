package main

import (
	"fmt"
	"time"
)

func main() {
	ch1 := make(chan int, 1)
	ch2 := make(chan int, 1)
	ch3 := make(chan int, 1)

	go func() {
		for {
			i := <-ch1
			ch2 <- (i * 2)
		}
	}()

	go func() {
		for {
			i := <-ch2
			ch3 <- (i - 1)
		}
	}()

	n := 1

LOOP:
	for {
		select {
		case ch1 <- n:
			n++
		case i := <-ch3:
			fmt.Println("receive", i)
		default:
			if n > 100 {
				break LOOP
			}
		}
	}

	time.Sleep(1 * time.Second)
}
