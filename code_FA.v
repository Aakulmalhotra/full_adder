//design.sv file

module full_adder( a,b,cin,s,cout);
  input a,b,cin;
  output s,cout;
  assign s = a^b^cin;
  assign cout = a&b|(a^b)&cin;
endmodule

//testbench.sv file
module test_bench;
  reg a,b,cin;
  wire s,cout;
  full_adder uut(.a(a) , .b(b) , .cin(cin) , .s(s) ,.cout(cout));
  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars();
    end
  
    
  initial
    begin
      $monitor($time,"a=%b , b=%b , cin=%b , s = %b , cout = %b",a,b,cin,s,cout);
      #0 a=0;b=0;cin=0;
      #10 a=0;b=0;cin=0;
      #20 a=1 ; b=1; cin = 0;
      #30 a=0; b=0; cin =1;
      #40 a=0 ;b =1;cin=1;
      
      #100 $finish;
    end
endmodule
