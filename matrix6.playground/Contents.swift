//: This OSX playground shows how to perform matrix mutiplication and matrix transposes.

//: Prove:C=A*B D=BT*AT C=DT
//: where A,B,C and D are matrices and AT,BT and DT are the transposes of A,B, and D

import Cocoa


//: ### This struct stores a matrix.

//This struct stores a matrix
public struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 1 && row <= rows && column >= 1 && column <= columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row,column: column), "get Index out of range")
            return grid[((row-1) * columns) + column - 1]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "set Index out of range")
            grid[((row-1) * columns) + column - 1] = newValue
        }
    }
}

//: ### function printMatrix prints out the matrix in row form

func printMatrix(a:Matrix){
    //to provide a printout similar to algebra texts start index at 1 instead of 0
    //for printout
    let rows=a.rows
    let columns=a.columns
    for j in 1...rows{
        for i in 1...columns{
            print("[\(j),\(i)]=\(a[j,i])  ", terminator:"")
        }
        print("\n")
    }
}


//C=A*B D=BT*AT C=DT
var A = Matrix(rows: 3,columns: 3)

A[1, 1] = 1.0
A[1, 2] = 2.0
A[1, 3] = 3.0
A[2, 1] = 3.0
A[2, 2] = 2.0
A[2, 3] = 1.0
A[3, 1] = 2.0
A[3, 2] = 1.0
A[3, 3] = 3.0

print("A matrix")
printMatrix(A)

var B = Matrix(rows: 3,columns: 3)

B[1, 1] = 4.0
B[1, 2] = 5.0
B[1, 3] = 6.0
B[2, 1] = 6.0
B[2, 2] = 5.0
B[2, 3] = 4.0
B[3, 1] = 4.0
B[3, 2] = 6.0
B[3, 3] = 5.0

print("B matrix")
printMatrix(B)

//: ### This function multiplies 2 matices.

func * (m1: Matrix, m2: Matrix) -> Matrix {
    
    let myRows1=m1.rows
    let myColumns1=m1.columns
    //let myRows2=m2.rows
    let myColumns2=m2.columns
    var out = Matrix(rows:myRows1, columns:myColumns2)

guard myRows1 == myColumns2 else {
         //rows of matrix1 have to equal columns of matrix2 for matrix multiplication
         print("rows of matrix1 have to equal columns of matrix2  for matrix multiplication")
             return out
            }
    

    var sum :Double = 0.0
    
    //multiply the rows of the first matrix by the columns of the second
    for i in 1...myRows1 {
        for j in 1...myColumns2{
            
            sum = 0.0;
            for k in 1...myColumns1{
                sum += m1[i,k] * m2[k,j]}
            out[i,j] = sum
           
        }}
    return out
}


var C = A * B
print("\n")
print("C=A*B\n")
    
print("C matrix")
printMatrix(C)


func transpose (m1: Matrix) -> Matrix {
    
    let myRows1=m1.rows
    let myColumns1=m1.columns
  
    var out = Matrix(rows:myColumns1, columns:myRows1)
    
    //multiply the rows of the first matrix by the columns of the second
    for i in 1...myRows1 {
        for j in 1...myColumns1{
            
            out[i,j] = m1[j,i]
            
        }}
    return out
}



let AT = transpose(A)
print("A transpose matrix")
printMatrix(AT)

let ATT = transpose(AT)
print("A transpose transpose matrix equals A")
printMatrix(ATT)


func areMatricesEqual (a: Matrix, b: Matrix) -> Bool {
    //This function returns true is 2 input vectors are equal
    
    assert(a.rows == b.rows, "Expected matrices of the same size, instead got matrices of two different sizes")
    
    var result = false
    for i in 1...a.rows {
        for j in 1...a.columns {
            if a[i,j]==b[i,j]{result=true}
            else{result=false
                return result
            }}
    }
    return result
}

if areMatricesEqual(A, b: ATT){
    print("A and ATT transpose matrices are equal\n A transpose transpose=A")
}
else{print("solution does not check/n")}


let BT = transpose(B)
print("\nB transpose matrix")
printMatrix(BT)


var D = BT * AT
print("\n")
print("D=BT*AT \n")
print("D matrix")
printMatrix(D)

let DT = transpose(D)
print("D transpose matrix")
printMatrix(DT)

//C=A*B D=BT*AT C=DT
//
print("\n")
print("C=A*B D=BT*AT C=DT\n")



if areMatricesEqual(C, b: DT){
    print("C and D transpose matrices are equal\n C=A*B D=BT*AT C=DT or (AB)T=AT*BT")
}
else{print("solution does not check/n")}

//
////(AB)T=BT*AT
//print("\n")
//print("(AB)T=BT*AT\n")
//
//let CT = transpose(C)
//print("CT=\(CT)")
//print("D= \(D)")


