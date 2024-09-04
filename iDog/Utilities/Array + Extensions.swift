//
//  Array + Extensions.swift
//  iDog
//
//  Created by Kevin Malkic on 04/09/2024.
//

import Foundation

extension Array {
    
    func splitByEvenOddIndices() -> ([Element], [Element]) {
        
        var evenIndexArray: [Element] = []
        var oddIndexArray: [Element] = []
        
        for (index, element) in self.enumerated() {
            if index % 2 == 0 {
                evenIndexArray.append(element) // Even index
            } else {
                oddIndexArray.append(element) // Odd index
            }
        }
        
        return (evenIndexArray, oddIndexArray)
    }
}

// Example usage:
// let originalArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
// let (array1, array2) = originalArray.splitByEvenOddIndices()
//
// print("Even index array:", array1) // Output: [1, 3, 5, 7, 9]
// print("Odd index array:", array2)  // Output: [2, 4, 6, 8]
