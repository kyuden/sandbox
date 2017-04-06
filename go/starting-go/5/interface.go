package main

import (
	"fmt"
)

type Stringfy interface {
	ToString() string
}

type Point struct {
	Code  string
	Money int
}

type Human struct {
	First string
	Last  string
}

func (p *Point) ToString() string {
	return fmt.Sprintf("%s:%d", p.Code, p.Money)
}

func (h *Human) ToString() string {
	return fmt.Sprintf("%s-%s", h.First, h.Last)
}

func main() {
	sg := []Stringfy{&Point{Code: "x3421", Money: 100}, &Human{First: "Masa", Last: "Hisada"}}

	for _, v := range sg {
		fmt.Println(v.ToString())
	}
}
