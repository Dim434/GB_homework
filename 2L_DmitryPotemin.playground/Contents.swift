func isOdd(_ number: Int) -> Bool{
    return number % 2 == 0
}
func isDividedByThree(_ number : Int) -> Bool {
    return number % 3 == 0
}
func fibbonaci(_ array : inout [Double]) -> Void{
    if array.count < 2 {
        array.append(1)
        return
    }
    array.append(array[array.count - 1] + array[array.count - 2])
    return
}
var arr : [Int] = [];
for i in (1...100){
    arr.append(i)
}
var  i : Int = 0
while i < arr.count{
    if arr[i] % 2 == 0 || arr[i] % 3 != 0{
        arr.remove(at: i)
        i -= 1
    }
    i += 1
}

var fibb : [Double] = []
for _ in (1...100){
    fibbonaci(&fibb)
    print(fibb.last!, " ")
}

var prime : [Bool] = []
for _  in (0...10000){
    prime.append(true);
}
for i in (2...10000){
    if(prime[i]){
        if(i*i <= 10000){
            for j in stride(from: i*i, to: 10000, by: +i){
                prime[j] = false;
            }
        }
    }
}
var first100primes : [Int] = []
for i in (2...10000){
    if(first100primes.count == 100){
        break
    }
    if prime[i] == true{
        first100primes.append(i)
        print(i)
    }
}
print(first100primes.count)

