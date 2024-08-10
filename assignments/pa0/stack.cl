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
                     if stack.peek() = "+" then out_string(stack.add().concat("\n")) else
                     if stack.peek() = "s" then stack.swap() else
                     if stack.peek() = "d" then stack.display() else 
                     self fi fi fi
                  else self fi;
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

};

class StackMachine inherits Stack {

   z : A2I <- new A2I;
   io : IO <- new IO;

   add() : String {
      {
         self.pop(); -- pop the plus sign
         let a : Int <- z.a2i(self.peek()) in {
            self.pop(); -- pop first integer
            let b : Int <- z.a2i(self.peek()) in {
               self.pop(); -- pop second integer
               let c : String <- z.i2a(a + b) in {
                  self.push(c); -- store the result
                  c;
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
      ""
   };

};
