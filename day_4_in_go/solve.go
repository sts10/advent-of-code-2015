package main

import (
	"crypto/md5"
	"fmt"
	"io"
)

func main() {
	number_to_add := 1
	for {
		this_input := "bgvyzdsv" + fmt.Sprint(number_to_add)
		this_hash := get_md5(this_input)
		if this_hash[0:5] == "00000" {
			fmt.Println("this input", this_input)
			fmt.Println("created this hash", this_hash)
			fmt.Println("so answer to part one is", number_to_add)
			break
		}
		number_to_add = number_to_add + 1
	}
	// reset counter for part 2
	number_to_add = 1
	for {
		this_input := "bgvyzdsv" + fmt.Sprint(number_to_add)
		this_hash := get_md5(this_input)
		if this_hash[0:6] == "000000" {
			fmt.Println("this input", this_input)
			fmt.Println("created this hash", this_hash)
			fmt.Println("so answer to part two is", number_to_add)
			break
		}
		number_to_add = number_to_add + 1
	}
}

func get_md5(str string) string {
	h := md5.New()
	io.WriteString(h, str)
	hash := fmt.Sprintf("%x", h.Sum(nil))
	return hash
}
