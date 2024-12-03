package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"strconv"
)

func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

func check_test(nums []int) int {
	inc := nums[0] < nums[1]
	
	for i := 1; i < len(nums); i++ {
		diff := nums[i-1] - nums[i]

		if((diff > 0 && inc) || (diff < 0 && !inc) || diff == 0 || abs(diff) > 3) {
			return 0
		}
	}
	
	return 1
}

func main() {
	file, err := os.Open("input")
	if err != nil {
		fmt.Println("Error:", err)
        return
    }
	
	defer file.Close()

	corrects := 0
	
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		vals := strings.Split(line, " ")
		
		var nums []int
		
		for _, val := range vals {
			num, err := strconv.Atoi(val)
			
			if err != nil {
				fmt.Println("Error converting:", val, err)
				continue
			}

			nums = append(nums, num)

		}

		corrects += check_test(nums)
	}

	fmt.Println(corrects)
}
