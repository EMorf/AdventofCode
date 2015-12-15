with Ada.Text_IO; use Ada.Text_IO;
with GNAT.String_Split;   use GNAT;

procedure Day_2 is

   Input, Output     : File_Type;
   Square_Feet       : Integer    := 0;

   function GetWrap (dim1 : Integer; dim2 : Integer; dim3: Integer) return Integer is
      area1    : Integer := dim1*dim2;
      area2    : Integer := dim2*dim3;
      area3    : Integer := dim3*dim1;
      min_side : Integer := area1;
   begin
      if area2 <= area1  and then area2 <= area3 then
         min_side := area2;
      elsif area3 <= area1  and then area3 <= area2 then
         min_side := area3;
      end if;


      return 2 * (area1+ area2 +area3) + min_side;
   end GetWrap;


begin
   Open (File => Input,
         Mode => In_File,
         Name => "day_2_input");
   while (not End_Of_File(Input)) loop
      declare
         Cur_Line   : String := Get_Line(Input);
         SubStrings : String_Split.Slice_Set;
         Separator  : String := "x";
      begin
         String_Split.Create(SubStrings, Cur_Line, Separator, String_Split.Multiple);
         Square_Feet := Square_Feet + GetWrap(Integer'Value(String_Split.Slice (SubStrings, 1)), Integer'Value(String_Split.Slice (SubStrings, 2)), Integer'Value(String_Split.Slice (SubStrings, 3)));
         Put_Line(Integer'Image(Square_Feet));
      end;
   end loop;

end Day_2;
