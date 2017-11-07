unit Ceil32JOHUnit;

{$R-,Q-}                               

interface

function Ceil32_JOH_Pas_1 (const X: Single  ): Integer; overload;
function Ceil32_JOH_Pas_1 (const X: Double  ): Integer; overload;
function Ceil32_JOH_Pas_1 (const X: Extended): Integer; overload;
function Ceil32_JOH_IA32_1(const X: Single  ): Integer; overload;
function Ceil32_JOH_IA32_1(const X: Double  ): Integer; overload;
function Ceil32_JOH_IA32_1(const X: Extended): Integer; overload;

implementation

uses
  SysUtils;

function Ceil32_JOH_Pas_1(const X: Single): Integer; overload;
type
  ResultType = packed record
    case Integer of
      0: (Value  : Int64);
      1: (Lo, Hi : Integer);
    end;
var
  I: ResultType;
  Y: array[1..SizeOf(X)] of Byte absolute X;
begin
  I.Value := Trunc(X);
  if I.Hi = 0 then
    begin
      if I.Lo < 0 then
        Error(reRangeError);
    end
  else
    if I.Hi = -1 then
      begin
        if I.Lo >= 0 then
          Error(reRangeError);
      end
    else
      Error(reRangeError);
  Result := I.Lo;
  if (Y[High(Y)] and $80) = 0 then {X>=0}
    if X <> Result then
      Inc(Result);
end;

function Ceil32_JOH_Pas_1(const X: Double): Integer; overload;
type
  ResultType = packed record
    case boolean of
      True  : (Value  : Int64);
      False : (Lo, Hi : Integer);
    end;
var
  I : ResultType;
  Y : array[1..SizeOf(X)] of Byte absolute X;
begin
  I.Value := Trunc(X);
  if I.Hi = 0 then
    begin
      if I.Lo < 0 then
        Error(reRangeError);
    end
  else
    if I.Hi = -1 then
      begin
        if I.Lo >= 0 then
          Error(reRangeError);
      end
    else
      Error(reRangeError);
  Result := I.Lo;
  if (Y[High(Y)] and $80) = 0 then {X>=0}
    if X <> Result then
      Inc(Result);
end;

function Ceil32_JOH_Pas_1(const X: Extended): Integer; overload;
type
  ResultType = packed record
    case boolean of
      True  : (Value  : Int64);
      False : (Lo, Hi : Integer);
    end;
var
  I : ResultType;
  Y : array[1..SizeOf(X)] of Byte absolute X;
begin
  I.Value := Trunc(X);
  if I.Hi = 0 then
    begin
      if I.Lo < 0 then
        Error(reRangeError);
    end
  else
    if I.Hi = -1 then
      begin
        if I.Lo >= 0 then
          Error(reRangeError);
      end
    else
      Error(reRangeError);
  Result := I.Lo;
  if (Y[High(Y)] and $80) = 0 then {X>=0}
    if X <> Result then
      Inc(Result);
end;

function Ceil32_JOH_IA32_1(const X : Single) : Integer; overload;
asm
 sub    esp, 8
 fnstcw word ptr [esp]    {Save Original Control Word}
 mov    ax, [esp]         {Original Control Word}
 and    ax, $FBFF         {Clear Bit 10}
 or     ax, $0B00         {Set Bits 8, 9 and 11}
 mov    [esp+4], ax       {Bits 8/9 = Precision, Bits 10/11 = Rounding Mode}
 fldcw  word ptr [esp+4]  {Set Required Control Word}
 fld    X                 {Load Value}
 fistp  dword ptr [esp+4] {Save Result}
 mov    eax, [esp+4]      {Set Result}
 fldcw  word ptr [esp]    {Restore Original Control Word}
 add    esp, 8
end;

function Ceil32_JOH_IA32_1(const X : Double) : Integer; overload;
asm
 sub    esp, 8
 fnstcw word ptr [esp]    {Save Original Control Word}
 mov    ax, [esp]         {Original Control Word}
 and    ax, $FBFF         {Clear Bit 10}
 or     ax, $0B00         {Set Bits 8, 9 and 11}
 mov    [esp+4], ax       {Bits 8/9 = Precision, Bits 10/11 = Rounding Mode}
 fldcw  word ptr [esp+4]  {Set Required Control Word}
 fld    X                 {Load Value}
 fistp  dword ptr [esp+4] {Save Result}
 mov    eax, [esp+4]      {Set Result}
 fldcw  word ptr [esp]    {Restore Original Control Word}
 add    esp, 8
end;

function Ceil32_JOH_IA32_1(const X : Extended) : Integer; overload;
asm
 sub    esp, 8
 fnstcw word ptr [esp]    {Save Original Control Word}
 mov    ax, [esp]         {Original Control Word}
 and    ax, $FBFF         {Clear Bit 10}
 or     ax, $0B00         {Set Bits 8, 9 and 11}
 mov    [esp+4], ax       {Bits 8/9 = Precision, Bits 10/11 = Rounding Mode}
 fldcw  word ptr [esp+4]  {Set Requires Control Word}
 fld    X                 {Load Value}
 fistp  dword ptr [esp+4] {Save Result}
 mov    eax, [esp+4]      {Set Result}
 fldcw  word ptr [esp]    {Restore Original Control Word}
 add    esp, 8
end;

end.
