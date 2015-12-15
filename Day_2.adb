with Ada.Text_IO; use Ada.Text_IO;
with GNAT.String_Split;   use GNAT;

procedure Day_2 is

   Input, Output     : File_Type;
   Wrap, Ribbon      : Integer    := 0;


   function GetWrap (dim1 : Integer; dim2 : Integer; dim3 : Integer) return Integer is
      area1    : Integer := dim1 * dim2;
      area2    : Integer := dim2 * dim3;
      area3    : Integer := dim3 * dim1;
      min_side : Integer := area1;

   begin
      if area2 <= area1  and then area2 <= area3 then
         min_side := area2;
      elsif area3 <= area1  and then area3 <= area2 then
         min_side := area3;
      end if;

      return 2 * (area1+ area2 +area3) + min_side;
   end GetWrap;

   function GetRibbon(dim1 : Integer; dim2 : Integer; dim3 : Integer) return Integer is
      per1     : Integer  := 2*(dim1 + dim2);
      per2     : Integer  := 2*(dim3 + dim2);
      per3     : Integer  := 2*(dim1 + dim3);
      min_per  : Integer  := per1;
   begin
      if per2 <= per1  and then per2 <= per3 then
         min_per := per2;
      elsif per3 <= per1  and then per3 <= per2 then
         min_per := per3;
      end if;
      return dim1 * dim2 * dim3 + min_per;
   end GetRibbon;

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
         Wrap := Wrap + GetWrap(Integer'Value(String_Split.Slice (SubStrings, 1)), Integer'Value(String_Split.Slice (SubStrings, 2)), Integer'Value(String_Split.Slice (SubStrings, 3)));

         Ribbon := Ribbon + GetRibbon(Integer'Value(String_Split.Slice (SubStrings, 1)), Integer'Value(String_Split.Slice (SubStrings, 2)), Integer'Value(String_Split.Slice (SubStrings, 3)));

      end;
   end loop;

   Put_Line("Wrap amount is" & Integer'Image(Wrap));
   Put_Line("Ribbon amount is" & Integer'Image(Ribbon));
end Day_2;
