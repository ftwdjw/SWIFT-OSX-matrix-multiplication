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

print("A=\(A)")

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

print("B=\(B)")



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
    
//    x Pointer to r1 by c1 input matrix.
//    r1 Number of rows in x.
//    c1 Number of columns in x. Also number of rows in y. y Pointer to c1 by c2 input matrix.
//    c2 Number of columns in y.
//    r Pointer to r1 by c2 output matrix.
    
    //var i :Int = 0
    //var j :Int = 0
    //var k :Int = 0
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
print("C= \(C)")


//func transpose (m1: Matrix) -> Matrix {
//    
//    let myRows1=m1.rows
//    let myColumns1=m1.columns
//  
//    var out = Matrix(rows:myColumns1, columns:myRows1)
//    
//    /*
//    guard myRows1 == myColumns2 else {
//        //rows of matrix have to equal columns for matrix multiplication
//        print("rows of matrix have to equal columns for matrix multiplication")
//        return out
//    }
//    */
//    
//    //    x Pointer to r1 by c1 input matrix.
//    //    r1 Number of rows in x.
//    //    c1 Number of columns in x. Also number of rows in y. y Pointer to c1 by c2 input matrix.
//    //    c2 Number of columns in y.
//    //    r Pointer to r1 by c2 output matrix.
//    
//
//    
//    //multiply the rows of the first matrix by the columns of the second
//    for i in 0..<myRows1 {
//        for j in 0..<myColumns1{
//            
//            out[i,j] = m1[j,i]
//            
//        }}
//    return out
//}



//var C = A * B
//print("\n")
//print("C=A*B\n")
//print("C= \(C)")
//let AT = transpose(A)
//print("AT=\(AT)")
//
//let BT = transpose(B)
//print("BT=\(BT)")
//
//var D = BT * AT
//print("\n")
//print("D=BT*AT \n")
//print("D= \(D)")
//
//let DT = transpose(D)
//print("\n")
//print("C=A*B D=BT*AT C=DT\n")
//print("C= \(C)")
//print("DT= \(DT)")
//
////(AB)T=BT*AT
//print("\n")
//print("(AB)T=BT*AT\n")
//
//let CT = transpose(C)
//print("CT=\(CT)")
//print("D= \(D)")


