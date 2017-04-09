package main

import (
	"flag"
	"fmt"
	"strings"
)

type strSliceValue []string

func (c *strSliceValue) Set(val string) error {
	strs := strings.Split(val, ",")
	*c = append(*c, strs...)
	return nil
}

func (c *strSliceValue) String() string {
	return strings.Join(([]string)(*c), ",")
}

func main() {
	spacies := []string{"aiue"}
	flag.Var((*strSliceValue)(&spacies), "spacies", "aaa")
	flag.Parse()

	fmt.Println(spacies)
}
