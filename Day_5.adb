with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;  use Ada.Strings.Fixed;

procedure main is

   Input, Output : File_Type;
   Vowels        : Natural := 0;
   Repeated      : Character; 
   Nice          : Natural := 0;
   At_Least_One  : Boolean := False;
   Skip          : Boolean := False;
   Part_1        : Boolean := False;
   
begin
   Open (File => Input,
         Mode => In_File,
         Name => "input.txt");
   while (not End_Of_File(Input)) loop
      declare
         Cur_Line   : String := Get_Line(Input);
      begin
         
         if Part_1 then 
            Repeated := Cur_Line(1);
            for i in  1 .. Cur_Line'Length loop
            
               if Cur_Line(i) = 'a' or else  Cur_Line(i) = 'e' or else  Cur_Line(i) = 'i' or else  Cur_Line(i) = 'o' or else  Cur_Line(i) = 'u' then
                  Vowels := Vowels + 1;
               end if;
               if Cur_Line(i) = Repeated and then i /= 1 then
                  At_Least_One := True;
               end if;
               if Repeated = 'a' and then Cur_Line(i) = 'b' then
                  Skip := True;
               end if;
               if Repeated = 'c' and then Cur_Line(i) = 'd' then
                  Skip := True;
               end if;
               if Repeated = 'p' and then Cur_Line(i) = 'q' then
                  Skip := True;
               end if;
               if Repeated = 'x' and then Cur_Line(i) = 'y' then
                  Skip := True;
               end if;           
               Repeated := Cur_Line(i);
            end loop;
      
            if (not Skip and then At_Least_One and then Vowels >= 3) then
               Nice := Nice + 1;
               Put_Line("String " & Cur_Line & " is nice");
            end if;
            Skip := False;
            At_Least_One := False;
            Vowels := 0;
            
         else
            Repeated   := Cur_Line(1);
            
            for i in  2 .. Cur_Line'Length loop
               if Repeated = Cur_Line(i) and then i /= 2 then
                  At_Least_One := True;                 
               end if;
               
               if  (Ada.Strings.Fixed.Count (Cur_Line, Cur_Line(i - 1 .. i )) > 1) then
                  Skip := True;
               end if;
               
               if (i /= 2) then
                  Repeated   := Cur_Line(i - 1);
               end if;
    
            end loop;
            if (Skip and then At_Least_One) then
               Nice := Nice + 1;
            end if;
            
            
            Skip := False;
            At_Least_One := False;
         end if;
      
      end;
    
   end loop;

   Put_Line(Integer'Image(Nice));
end main;
