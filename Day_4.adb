with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with GNAT.MD5;

procedure Main is
   x : Long_Integer := 0;

begin

   while (GNAT.MD5.Digest("bgvyzdsv" & Trim(Long_Integer'Image(x), Both)) (1 .. 6) /= "000000") loop
      x := x + 1;
   end loop;
   Put_Line (GNAT.MD5.Digest("bgvyzdsv" & Trim(Long_Integer'Image(x), Left)));
   Put_Line(Trim(Long_Integer'Image(x), Left));
end Main;
