class Main inherits IO {

   stack : Stack <- new Stack;

   main() : Object {
      {
         out_string(">");
         let input : String <- in_string() in
         while not input = ""
         loop
            {
               out_string(input);
               out_string("\n");
               stack.push(input);
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

   init(i : String, rest : List) : List {
      {
         car <- i;
         cdr <- rest;
         self;
      }
   };

};

class Stack {

   l : List <- new List;

   push(s : String) : List {{
      l <- l.cons(s);
   }};

   pop(): List {
      l <- l.tail()
   };

   peek(): String {
      l.head()
   };

};
