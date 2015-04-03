// Playground - noun: a place where people can play

import UIKit


func findMinimumCoinsTotalSum(totalSum : Int, coinsValue : [Int]) -> Int {
    var coins = coinsValue
    var minNumberOfCoins : [Int] = [];
    // initialize the minNumberOfCoins, set all solutions to 0
    for sum in 0...totalSum {
        minNumberOfCoins += [0];
    }
    // sort the coins value to be descending
    coins.sort({ $0 > $1 });
    
    for sum in 1...totalSum {
        for coin in coins {
            if (coin <= sum){
                let remaining = sum - coin;
                let previousSolution = minNumberOfCoins[remaining];
                minNumberOfCoins[sum] = previousSolution + 1;
                break;
            }
        }
    }
    
    
    return minNumberOfCoins[totalSum];
}


let totalSums = 10;
let coins = [1,3,5,7,9];

findMinimumCoinsTotalSum(totalSums, coins);


