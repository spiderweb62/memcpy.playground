//: Playground - noun: a place where people can play

import Foundation
import UIKit

/*
Playground to confirm memcpy utilisation to copy n last entries
of a memory block
For comprehension sake I first create a standard array before
copying it to a defined pointed of the same size
*/
var testArray:[Float32] = [-0.000185883, -0.000161945, -0.000202837, -0.0000767291, -0.0000640512, -0.000215005, -0.000287149, -0.000291301, -0.000211374, -0.000145715, -0.000190241, -0.000182283]

let number = testArray.count

// Create a memory block equal to number of entries
let arrayPointer = UnsafeMutablePointer<Float32>.allocate(capacity: testArray.count)

// Add all entries to the previously created memory block
for i in 0..<number {
    arrayPointer[i] = testArray[i]
}

// How many bytes per value for Float32
let memBlockSize = MemoryLayout<Float32>.size

// How many blocks we want to create
let numberofBlocks = 2

print("----------------Whats in the last \(numberofBlocks) blocks------------------")
for i in testArray.count - numberofBlocks..<testArray.count {
    print("Block \(i) Result \(arrayPointer[i])")
}
let testPointer = UnsafeMutablePointer<Float32>.allocate(capacity: numberofBlocks)

// memcpy to move data from one pointer to another
memcpy(testPointer, &(arrayPointer[number - numberofBlocks]), numberofBlocks * memBlockSize)

// Result
print("----------------Whats in the dest \(numberofBlocks) blocks------------------")
for i in 0..<numberofBlocks {
    print("Block \(i) Result \(testPointer[i])")
}

