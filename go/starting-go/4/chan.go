package main

import (
	"fmt"
	"time"
)

func receiver(name string, ch <-chan int) {
	for {
		i, ok := <-ch
		if !ok {
			break
		}

		fmt.Println(name, i)
	}
	fmt.Println(name + "is done.")
}

func main() {
	ch := make(chan int, 3)

	go receiver("goroutine1", ch)
	go receiver("goroutine2", ch)
	go receiver("goroutine3", ch)

	for i := 0; i < 100; i++ {
		ch <- i
	}

	close(ch)

	time.Sleep(3 * time.Second)
}
