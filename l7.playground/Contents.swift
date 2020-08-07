import Cocoa
enum StackError : Error{
    case emptyStack
    case wrongType
}

class Stack<T>{
    var elements : [T]
    init(){
        elements = []
    }
    func push(_ element : Any) throws{
        do{
            guard let t = element as? T else {throw StackError.wrongType}
            elements.append(t)
        }
        
    }
    @discardableResult
    func top() throws -> (T?){
        if elements.count == 0
        {
            throw StackError.emptyStack
        }
        return elements.last
    }
    @discardableResult
    func pop() throws -> (T?) {
        if elements.count == 0
        {
            throw StackError.emptyStack
        }
        return elements.removeLast()
    }
}

var st : Stack<Int> = Stack<Int>()
do{
    try st.push("" as AnyObject)
}
catch(StackError.wrongType){
    print("Wrong Type")
}
do{
    try st.push(1)
    try st.push(2)
    try st.pop()
    try st.pop()
}
do{
    try st.pop()
    try st.top()
}
catch(StackError.emptyStack){
    print("stack is empty")
}
