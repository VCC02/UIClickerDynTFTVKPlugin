{
    Copyright (C) 2026 VCC
    creation date: 14 Feb 2026
    initial release date: 15 Feb 2026

    author: VCC
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
    DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
    OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}


unit DynTFTVKPluginProperties;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ClickerUtils, ClickerActionPlugins;


type
  TBackgroundFileLocation = (bflDisk, bflMem, bflDiskToMem);

const
  CPropertiesCount = 1;

  CKeyboardTypePropertyIndex = 0;

  CKeyboardTypePropertyName = 'KeyboardType';

  CRequiredPropertyNames: array[0..CPropertiesCount - 1] of string = (  //these are the expected property names, configured in plugin properties
    CKeyboardTypePropertyName
  );

  //property details: (e.g. enum options, hints, icons, menus, min..max spin intervals etc)

  //See TOIEditorType datatype from ObjectInspectorFrame.pas, for valid values
  CRequiredPropertyTypes: array[0..CPropertiesCount - 1] of string = (
    'EnumCombo' //KeyboardType
  );

  CRequiredPropertyDataTypes: array[0..CPropertiesCount - 1] of string = (
    CDTEnum //KeyboardType
  );

  CPluginEnumCounts: array[0..CPropertiesCount - 1] of Integer = (
    2  //KeyboardType
  );

  CPluginEnumStrings: array[0..CPropertiesCount - 1] of string = (
    '1x' + #4#5 + '2x' + #4#5 //KeyboardType
  );

  CPluginHints: array[0..CPropertiesCount - 1] of string = (
    'Normal keyboard or oversized keyboard.'  //KeyboardType
  );

  CPropertyEnabled: array[0..CPropertiesCount - 1] of string = (  // The 'PropertyValue[<index>]' replacement uses indexes from the following array only. It doesn't count fixed properties.
    '' //KeyboardType                        // If empty string, the property is unconditionally enabled. For available operators, see CComp constans in ClickerUtils.pas.
  );

  CPluginDefaultValues: array[0..CPropertiesCount - 1] of string = (
    '1x' //KeyboardType
  );


function FillInPropertyDetails: string;


implementation


function FillInPropertyDetails: string;
var
  i: Integer;
begin
  Result := '';

  for i := 0 to CPropertiesCount - 1 do
    Result := Result + CRequiredPropertyNames[i] + '=' + CRequiredPropertyTypes[i] + #8#7 +
                       CPluginPropertyAttr_DataType + '=' + CRequiredPropertyDataTypes[i] + #8#7 +
                       CPluginPropertyAttr_EnumCounts + '=' + IntToStr(CPluginEnumCounts[i]) + #8#7 +
                       CPluginPropertyAttr_EnumStrings + '=' + CPluginEnumStrings[i] + #8#7 +
                       CPluginPropertyAttr_Hint + '=' + CPluginHints[i] + #8#7 +
                       CPluginPropertyAttr_Enabled + '=' + CPropertyEnabled[i] + #8#7 +
                       CPluginPropertyAttr_DefaultValue + '=' + CPluginDefaultValues[i] + #8#7 +
                       #13#10;
end;

end.

