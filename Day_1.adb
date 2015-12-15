with Ada.Sequential_IO;
with Ada.Text_IO;

procedure Day_1 is

   package Character_IO is new Ada.Sequential_IO(Character);
   use Character_IO;

   Input, Output     : File_Type;
   Current_Character : Character;
   Current_Floor     : Integer  := 0;
   Counter           : Integer  := 0;
   Counter_Set       : Boolean  := True;
   Position          : Integer;

begin
   Open (File => Input,
         Mode => In_File,
         Name => "day_1_input");

   while (not End_Of_File (Input)) loop

      Read (Input, Current_Character);

      if Current_Character = '(' then
         Current_Floor := Current_Floor + 1;
      elsif Current_Character = ')' then
         Current_Floor  := Current_Floor - 1;
      else
         exit;
      end if;
      Counter := Counter + 1;
      if Counter_Set and then Current_Floor = -1 then
         Counter_Set := False;
         Position := Counter;
      end if;

   end loop;


   Ada.Text_IO.Put_Line("In the end, he will reach floor #" & Integer'Image(Current_Floor));
   Ada.Text_IO.Put_Line("Basement is reached in position #" & Integer'Image(Position));
end Day_1;
