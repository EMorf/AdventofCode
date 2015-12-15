with Ada.Sequential_IO;
with Ada.Text_IO;
with Ada.Containers.Ordered_Sets;
with Ada.Containers.Vectors;
with Ada.Containers;

procedure Day_3 is

   type Coordinate is
      record
         x : Integer;
         y : Integer;
      end record;

   function Is_Equal (C1, C2 : Coordinate) return Boolean is
   begin
      return C1.x = C2.x and then C1.y = C2.y;
   end Is_Equal;

   function Is_Less (C1, C2 : Coordinate) return Boolean is
   begin
      return (C1.x * C1.x + C1.y * C1.y < C2.x * C2.x + C2.y * C2.y);
   end Is_Less;

   package Character_IO is new Ada.Sequential_IO(Character);
   package Integer_Sets is new Ada.Containers.Ordered_Sets(Element_Type => Coordinate,
                                                           "<"          => Is_Less  ,
                                                           "="          => Is_Equal);
   use Character_IO;
   use Integer_Sets;

   My_Coords         : Coordinate;
   Loc               : Set;
   Input, Output     : File_Type;
   Current_Character : Character;




begin
   My_Coords.x := 0;
   My_Coords.y := 0;
   Open (File => Input,
         Mode => In_File,
         Name => "day_3_input");
   Loc.Insert(My_Coords);

   while (not End_Of_File (Input)) loop
      Read (Input, Current_Character);
      if Current_Character = '^' then
         My_Coords.y := My_Coords.y + 1;
      elsif Current_Character = 'v'  then
         My_Coords.y := My_Coords.y - 1;
      elsif Current_Character = '>'  then
         My_Coords.x := My_Coords.x + 1;
      elsif Current_Character = '<'  then
         My_Coords.x := My_Coords.x - 1;
      end if;


      Ada.Text_IO.Put_Line("After " & Character'Image(Current_Character) & " we are at x:" & Integer'Image(My_Coords.x) & " y:" & Integer'Image(My_Coords.y));
      if Contains(Container => Loc,
                  Item      => My_Coords) then
         Ada.Text_IO.Put_Line("Already here");
      else
         Insert(Loc,My_Coords);

      end if;


   end loop;
   Ada.Text_IO.Put_Line(Ada.Containers.Count_Type'Image(Loc.Length));

end Day_3;
