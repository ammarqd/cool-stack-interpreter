class Main inherits IO {

   stack : StackMachine <- new StackMachine;

   main() : Object {
      {
         out_string(">");
         let input : String <- in_string() in 
            while not input = "x" loop
               {
                  if not input = "e" then
                     if not input = "d" then
                        stack.push(input)
                     else self fi
                  else self fi;
                  
                  if input = "e" then
                     if not stack.isEmpty() then -- stop e command from aborting the program when stack is empty
                        if stack.peek() = "+" then stack.add() else
                        if stack.peek() = "s" then stack.swap() else
                        self fi fi
                     else self fi
                  else if input = "d" then 
                     out_string(stack.display()) -- returns a string object which is printed with IO.out_string
                  else self fi fi;

                  out_string(">");
                  input <- in_string();
               }
            pool;
      }
   };

};


class List {

   isEmpty() : Bool {
      true
   };

   head() : String {{
      abort();
      "";
   }};

   tail() : List {{
      abort();
      self;
   }};

   cons(i : String) : List {
      (new Cons).init(i, self)
   };

};

class Cons inherits List {

   car : String;
   cdr : List;

   isEmpty() : Bool {
      false
   };

   head() : String {
      car
   };

   tail() : List {
      cdr
   };

   init(s : String, rest : List) : List {
      {
         car <- s;
         cdr <- rest;
         self;
      }
   };

};

class Stack {

   l : List <- new List;

   push(s : String) : List {
      l <- l.cons(s)
   };

   pop(): List {
      l <- l.tail()
   };

   peek(): String {
      l.head()
   };

   isEmpty() : Bool {
      l.isEmpty()
   };

};

class StackMachine inherits Stack {

   conv : A2I <- new A2I;

   add() : String {
      {
         self.pop(); -- pop the plus sign
         let a : Int <- conv.a2i(self.peek()) in {
            self.pop(); -- pop first integer
            let b : Int <- conv.a2i(self.peek()) in {
               self.pop(); -- pop second integer
               let c : String <- conv.i2a(a + b) in {
                  self.push(c); -- store the result
                  c; -- return result
               };
            };
         };
      }
   };

   swap() : SELF_TYPE {
      {  
         self.pop(); -- pop s
         let a : String <- self.peek() in {
            self.pop(); -- pop a
            let b : String <- self.peek() in {
               self.pop(); -- pop b
               self.push(a); -- push a
               self.push(b); -- push b
               -- b is now at the top of the stack
               self;
            };
         };
      }
   };

   display() : String {
      {
         let current : List <- l.copy() in { -- copy internal list for iteration
            let s : String <- "" in {
               while not current.isEmpty() loop 
                  {
                     s <- s.concat(current.head().concat("\n"));
                     current <- current.tail();
                  }
               pool;
               s;
            };
         };
      }
   };

};
