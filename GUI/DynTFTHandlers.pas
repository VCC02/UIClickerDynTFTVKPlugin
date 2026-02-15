{
    Copyright (C) 2026 VCC
    creation date: 15 Feb 2026
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

unit DynTFTHandlers;

{$IFNDEF IsMCU}
  {$DEFINE IsDesktop}
{$ENDIF}

{$IFDEF IsDesktop}
interface
{$ENDIF}

uses
  {$IFDEF UseSmallMM}
    DynTFTSmallMM,
  {$ELSE}
    {$IFDEF IsDesktop}
      MemManager,
    {$ENDIF}  
  {$ENDIF} //this must be the first unit, at least in Delphi, because it exports GetMem.
  
  DynTFTTypes, DynTFTConsts, DynTFTUtils, DynTFTBaseDrawing, DynTFTControls,
  DynTFTGUIObjects,
  

//<DynTFTComponents>
  DynTFTButton,
  //DynTFTArrowButton,
  //DynTFTPanel,
  //DynTFTCheckBox,
  //DynTFTScrollBar,
  //DynTFTItems,
  //DynTFTListBox,
  DynTFTLabel,
  //DynTFTRadioButton,
  //DynTFTRadioGroup,
  //DynTFTTabButton,
  //DynTFTPageControl,
  DynTFTEdit,
  DynTFTKeyButton,
  DynTFTVirtualKeyboard,
  //DynTFTComboBox,
  //DynTFTTrackBar,
  //DynTFTProgressBar,
  DynTFTMessageBox
  //DynTFTVirtualTable,
  //DynTFTVirtualKeyboardX2,
//<EndOfDynTFTComponents> - Do not remove or modify this line!

  {$IFDEF IsDesktop}
    ,SysUtils, Forms
    {$IFDEF DynTFTFontSupport}, DynTFTFonts {$ENDIF}
  {$ENDIF}

  {$IFNDEF UserTFTCommands}
    {$IFDEF IsDesktop} , TFT {$ENDIF}
  {$ELSE}
    , {$I UserDrawingUnits.inc}
  {$ENDIF}

  {$I DynTFTHandlersAdditionalUnits.inc}
  ;

//CodegenSym:GroupsBegin
//CodegenSym:GroupsEnd

procedure VirtualKeyboard_OnCharKey(Sender: PPtrRec; var PressedChar: TVKPressedChar; CurrentShiftState: TPtr); //CodegenSym:header
procedure VirtualKeyboard_OnSpecialKey(Sender: PPtrRec; SpecialKey: Integer; CurrentShiftState: TPtr); //CodegenSym:header

//CodegenSym:AllBinHandlersBegin

{$IFDEF RTTIREG}

      var
        AllBinHandlersStr: array[0..0] of string;  // No handlers found. Using a dummy entry.
        AllBinHandlersAddresses: array[0..0] of TPtr;  // No handlers found. Using a dummy entry.

        AllBinIdentifiersStr: array[0..0] of string;  // No identifiers found. Using a dummy entry.
        AllBinIdentifiersAddresses: array[0..0] of TPtr;  // No identifiers found. Using a dummy entry.

      procedure UpdateAllBinHandlerStrArray;
{$ENDIF} // RTTIREG

//CodegenSym:AllBinHandlersEnd

implementation

//CodegenSym:UpdateBinHandlersProcBegin
{$IFDEF RTTIREG}

      procedure UpdateAllBinHandlerStrArray;
      begin
        // Desktop profile not found. No handler names are available.
      end;
{$ENDIF} // RTTIREG

//CodegenSym:UpdateBinHandlersProcEnd

//CodegenSym:CreationGroups

//CodegenSym:HandlersImplementation

procedure VirtualKeyboard_OnCharKey(Sender: PPtrRec; var PressedChar: TVKPressedChar; CurrentShiftState: TPtr); //CodegenSym:handler
var
  AText: string {$IFNDEF IsDesktop}[CMaxKeyButtonStringLength] {$ENDIF};
begin //CodegenSym:handler:begin
  if PDynTFTVirtualKeyboard(TPtrRec(Sender))^.ShiftState and CDYNTFTSS_CTRL = CDYNTFTSS_CTRL then
    Exit;

  if PDynTFTVirtualKeyboard(TPtrRec(Sender))^.ShiftState and CDYNTFTSS_ALT = CDYNTFTSS_ALT then
    Exit;

  AText := PressedChar;
  DynTFTEditInsertTextAtCaret(edtValue, AText);

  if edtValue^.BaseProps.Focused and CFOCUSED <> CFOCUSED then
    DynTFTFocusComponent(PDynTFTBaseComponent(TPtrRec(edtValue)));
end; //CodegenSym:handler:end


procedure VirtualKeyboard_OnSpecialKey(Sender: PPtrRec; SpecialKey: Integer; CurrentShiftState: TPtr); //CodegenSym:handler
begin //CodegenSym:handler:begin
  case SpecialKey of
    VK_BACK : DynTFTEditBackspaceAtCaret(edtValue);

    VK_DELETE :
    begin
      if CurrentShiftState and CDYNTFTSS_CTRL_ALT = CDYNTFTSS_CTRL_ALT then  
        {$IFNDEF IsDesktop}
          Reset;
        {$ELSE}
          Application.MainForm.Close;
        {$ENDIF}
      DynTFTEditDeleteAtCaret(edtValue);
    end;

    VK_LEFT: DynTFTMoveEditCaretToLeft(edtValue, 1);

    VK_RIGHT: DynTFTMoveEditCaretToRight(edtValue, 1);

    VK_HOME: DynTFTMoveEditCaretToHome(edtValue);

    VK_END: DynTFTMoveEditCaretToEnd(edtValue);

    VK_APPS:
    begin
      edtValue.Text := '';
      DynTFTMoveEditCaretToHome(edtValue);
      DynTFTDrawEdit(edtValue, True);
    end;
  end;
end; //CodegenSym:handler:end


procedure ListBoxItemsGetItemText(AItems: PPtrRec; Index: LongInt; var ItemText: string); //CodegenSym:handler
begin //CodegenSym:handler:begin
  {$IFDEF IsDesktop}
    ItemText := IntToStr(Index);
  {$ELSE}
    IntToStr(Index, ItemText);
  {$ENDIF}
end; //CodegenSym:handler:end

end.
