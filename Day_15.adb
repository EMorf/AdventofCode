with Ada.Text_IO; use Ada.Text_IO;
procedure main is


   Score : Long_Integer := 0;
   Cur_Score: Long_Integer := 0;
   F1, F2, F3, F4 : Integer;

begin
     

   for A in Integer range 0 .. 100 loop

      for B in Integer range 0 .. 100 loop
      
         for C in Integer range 0 .. 100 loop
      
            for D in Integer range 0 .. 100 loop
   
               -- Delete the "and then 5*A +1*B +6 *C +8 *D = 500" code in the line below to have 
               -- it do the first part
               if (A + B + C + D = 100) and then 5*A +1*B +6 *C +8 *D = 500 then
                  F1 := A * 5  - 1 * B - D;
                  F2 := -A +3*B -C;
                  F3 := 4*C;
                  F4 := 2*D;
                  
                  if (F1 <= 0 or F2 <= 0 or F3 <= 0 or F4 <= 0) then
                     Cur_Score := 0;
                  else
                     Cur_Score := Long_Integer(F1*F2*F3*F4);
                  end if;
                  
                  if Cur_Score > Score then
                     Score := Cur_Score;
                  end if;
                  
               end if;
      
            end loop;
         end loop;
      end loop;
      
      
   end loop;
   
   Put_Line("Max score is " & Long_Integer'Image(Score));
end main;
