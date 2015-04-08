// Playground - noun: a place where people can play

import UIKit

// Method with parameters : total sum (problem) and an array of coint type
// Return value : minimum coins to have the sum of value
func findMinimumCoinsForTotalSum(totalSum : Int, coinsValue : [Int]) -> Int {
    // make the array of coins mutable
    var coins = coinsValue
    
    // an array of int to store our solutions
    var minNumberOfCoins : [Int] = Array<Int>();
    
    // initialise the minNumberOfCoins
    minNumberOfCoins += [0];
    
    // sort the coins value to be descending
    coins.sort({ $0 > $1 });
    
    // loop trough the sub problems until the given problem
    for sum in 1...totalSum {
        // loop trough the coin type available in the array
        for coin in coins {
            // make sure we getting the highest posible coin
            if (coin <= sum){
                // get the remaining
                let remaining = sum - coin;
                // get the previous solution
                let previousSolution = minNumberOfCoins[remaining];
                // save it for new solution
                minNumberOfCoins += [previousSolution + 1];
                break;
            }
        }
    }
    
    
    return minNumberOfCoins[totalSum];
}


let totalSum = 13;
let coins = [1,3,5];

var minCoins : Int = findMinimumCoinsForTotalSum(totalSum,coins);

println("Minimum coins to have sum of \(totalSum) is \(minCoins)");


