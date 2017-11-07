unit FastcodeCompareStrDC01;

(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is Fastcode
 *
 * The Initial Developer of the Original Code is Fastcode
 *
 * Portions created by the Initial Developer are Copyright (C) 2002-2004
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

//Version : 0.1
//Only plain function calls supported
//Last update 12/9 2005

//Change log

//12/9 2005: Initial version 0.1 made by Dennis Christensen

interface

function CompareStrFastcodeP4P(const S1, S2: string): Integer;
function CompareStrFastcodeP4N(const S1, S2: string): Integer;
function CompareStrFastcodePMD(const S1, S2: string): Integer;
function CompareStrFastcodePMB(const S1, S2: string): Integer;
function CompareStrFastcodeAMD64(const S1, S2: string): Integer;
function CompareStrFastcodeXP(const S1, S2: string): Integer;
function CompareStrFastcodeBlended(const S1, S2: string): Integer;
function CompareStrFastcodeRTL(const S1, S2: string): Integer;
function CompareStrFastcodePascal(const S1, S2: string): Integer;

implementation

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     Intel P4 Prescott
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_IA32_13

function CompareStrFastcodeP4P(const S1, S2: string): Integer;
asm
  {On entry:
    eax = S1,
    edx = S2}
  cmp eax, edx
  je @SameString
  {Is either of the strings perhaps nil?}
  test eax, edx
  jz @PossibleNilString
  {Compare the first four characters (there has to be a trailing #0). In random
   string compares this can save a lot of CPU time.}
@BothNonNil:
  {Compare the first character}
  mov ecx, [edx]
  cmp cl, [eax]
  je @FirstCharacterSame
  {First character differs}
  movzx eax, byte ptr [eax]
  movzx ecx, cl
  sub eax, ecx
  db $f3
  ret
@FirstCharacterSame:
  {save ebx}
  push ebx
  {Get first four characters}
  mov ebx, [eax]
  cmp ebx, ecx
  je @FirstFourSame
  {Get the string lengths in eax and edx}
  mov eax, [eax - 4]
  mov edx, [edx - 4]
  {Is the second character the same?}
  cmp ch, bh
  je @FirstTwoCharactersMatch
  {Second character differs: Are any of the strings non-nil but zero length?}
  test eax, eax
  jz @ReturnLengthDifference
  test edx, edx
  jz @ReturnLengthDifference
  movzx eax, bh
  movzx edx, ch
@ReturnLengthDifference:
  sub eax, edx
  pop ebx
  db $f3
  ret
@FirstTwoCharactersMatch:
  cmp eax, 2
  jna @ReturnLengthDifference
  cmp edx, 2
  jna @ReturnLengthDifference
  {Swap the bytes into the correct order}
  mov eax, ebx
  bswap eax
  bswap ecx
  sub eax, ecx
  pop ebx
  ret
  {It is the same string}
@SameString:
  xor eax, eax
  db $f3
  ret
  {Good possibility that at least one of the strings are nil}
@PossibleNilString:
  test eax, eax
  jz @FirstStringNil
  test edx, edx
  jnz @BothNonNil
  {Return first string length: second string is nil}
  mov eax, [eax - 4]
  ret
@FirstStringNil:
  {Return 0 - length(S2): first string is nil}
  sub eax, [edx - 4]
  ret
  {The first four characters are identical}
@FirstFourSame:
  {Save edi}
  push edi
  {set edi = length(S1)}
  mov edi, [eax - 4]
  {Save esi}
  push esi
  xor esi, esi
  mov ecx, edi
  {set edi = length(S1) - length(S2)}
  sub edi, [edx - 4]
  {set esi = 0 if length(S1) < length(S2), -1 otherwise}
  adc esi, -1
  {set esi = - min(length(s1), length(s2))}
  and esi, edi
  sub esi, ecx
  {Adjust the pointers to be negative based}
  sub eax, esi
  sub edx, esi
@CompareLoop:
  add esi, 4
  jns @MatchUpToLength
  mov ebx, [eax + esi]
  mov ecx, [edx + esi]
  cmp ebx, ecx
  je @CompareLoop
@Mismatch:
  {There was a mismatch, but we may have compared up to three characters too
   many: Compare the first two characters (there must be a trailing #0)}
  cmp bx, cx
  je @FirstTwoMatches
@ActualMismatch:
  movzx eax, bh
  mov ah, bl
  movzx edx, ch
  mov dh, cl
  sub eax, edx
  pop esi
  pop edi
  pop ebx
  db $f3
  ret
@FirstTwoMatches:
  {Move the high words into view}
  shr ebx, 16
  shr ecx, 16
  {The first two characters are the same. Have we compared two or three characters
   too many?}
  cmp esi, -3
  jng @ActualMismatch
  {All characters match - return the difference in length}
@MatchUpToLength:
  mov eax, edi
  pop esi
  pop edi
  pop ebx
end;

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     Intel P4 Northwood
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_IA32_12

function CompareStrFastcodeP4N(const S1, S2: string): Integer;
asm
  {On entry:
    eax = S1,
    edx = S2}
  cmp eax, edx
  je @SameString
  {Is either of the strings perhaps nil?}
  test eax, edx
  jz @PossibleNilString
  {Compare the first four characters (there has to be a trailing #0). In random
   string compares this can save a lot of CPU time.}
@BothNonNil:
  {Compare the first character}
  mov ecx, [edx]
  cmp cl, [eax]
  je @FirstCharacterSame
  {First character differs}
  movzx eax, byte ptr [eax]
  movzx ecx, cl
  sub eax, ecx
  ret
@FirstCharacterSame:
  {save ebx}
  push ebx
  {Get first four characters}
  mov ebx, [eax]
  cmp ebx, ecx
  je @FirstFourSame
  {Get the string lengths in eax and edx}
  mov eax, [eax - 4]
  mov edx, [edx - 4]
  {Is the second character the same?}
  cmp ch, bh
  je @FirstTwoCharactersMatch
  {Second character differs: Are any of the strings non-nil but zero length?}
  test eax, eax
  jz @ReturnLengthDifference
  test edx, edx
  jz @ReturnLengthDifference
  movzx eax, bh
  movzx edx, ch
@ReturnLengthDifference:
  sub eax, edx
  pop ebx
  ret
@FirstTwoCharactersMatch:
  cmp eax, 2
  jna @ReturnLengthDifference
  cmp edx, 2
  jna @ReturnLengthDifference
  {Swap the bytes in priority order}
  mov eax, ebx
  bswap eax
  bswap ecx
  sub eax, ecx
  pop ebx
  ret
  {It is the same string}
@SameString:
  xor eax, eax
  ret
  {Good possibility that at least one of the strings are nil}
@PossibleNilString:
  test eax, eax
  jz @FirstStringNil
  test edx, edx
  jnz @BothNonNil
  {Return first string length: second string is nil}
  mov eax, [eax - 4]
  ret
@FirstStringNil:
  {Return 0 - length(S2): first string is nil}
  sub eax, [edx - 4]
  ret
  {The first four characters are identical}
@FirstFourSame:
  {Save edi}
  push edi
  {set edi = length(S1)}
  mov edi, [eax - 4]
  {Save esi}
  push esi
  xor esi, esi
  mov ecx, edi
  {set edi = length(S1) - length(S2)}
  sub edi, [edx - 4]
  {set esi = 0 if length(S1) < length(S2), -1 otherwise}
  adc esi, -1
  {set esi = - min(length(s1), length(s2))}
  and esi, edi
  sub esi, ecx
  {Adjust the pointers to be negative based}
  sub eax, esi
  sub edx, esi
@CompareLoop:
  add esi, 4
  jns @MatchUpToLength
  mov ebx, [eax + esi]
  mov ecx, [edx + esi]
  cmp ebx, ecx
  je @CompareLoop
@Mismatch:
  {There was a mismatch, but we may have compared up to three characters too
   many: Compare the first two characters (there must be a trailing #0)}
  cmp bx, cx
  je @FirstTwoMatches
@ActualMismatch:
  movzx eax, bh
  mov ah, bl
  movzx edx, ch
  mov dh, cl
  sub eax, edx
  pop esi
  pop edi
  pop ebx
  ret
@FirstTwoMatches:
  {Move the high words into view}
  shr ebx, 16
  shr ecx, 16
  {The first two characters are the same. Have we compared two or three characters
   too many?}
  cmp esi, -3
  jng @ActualMismatch
  {All characters match - return the difference in length}
@MatchUpToLength:
  mov eax, edi
  pop esi
  pop edi
  pop ebx
end;

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     Intel Pentium M Dothan
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_IA32_12

function CompareStrFastcodePMD(const S1, S2: string): Integer;
asm
  {On entry:
    eax = S1,
    edx = S2}
  cmp eax, edx
  je @SameString
  {Is either of the strings perhaps nil?}
  test eax, edx
  jz @PossibleNilString
  {Compare the first four characters (there has to be a trailing #0). In random
   string compares this can save a lot of CPU time.}
@BothNonNil:
  {Compare the first character}
  mov ecx, [edx]
  cmp cl, [eax]
  je @FirstCharacterSame
  {First character differs}
  movzx eax, byte ptr [eax]
  movzx ecx, cl
  sub eax, ecx
  ret
@FirstCharacterSame:
  {save ebx}
  push ebx
  {Get first four characters}
  mov ebx, [eax]
  cmp ebx, ecx
  je @FirstFourSame
  {Get the string lengths in eax and edx}
  mov eax, [eax - 4]
  mov edx, [edx - 4]
  {Is the second character the same?}
  cmp ch, bh
  je @FirstTwoCharactersMatch
  {Second character differs: Are any of the strings non-nil but zero length?}
  test eax, eax
  jz @ReturnLengthDifference
  test edx, edx
  jz @ReturnLengthDifference
  movzx eax, bh
  movzx edx, ch
@ReturnLengthDifference:
  sub eax, edx
  pop ebx
  ret
@FirstTwoCharactersMatch:
  cmp eax, 2
  jna @ReturnLengthDifference
  cmp edx, 2
  jna @ReturnLengthDifference
  {Swap the bytes in priority order}
  mov eax, ebx
  bswap eax
  bswap ecx
  sub eax, ecx
  pop ebx
  ret
  {It is the same string}
@SameString:
  xor eax, eax
  ret
  {Good possibility that at least one of the strings are nil}
@PossibleNilString:
  test eax, eax
  jz @FirstStringNil
  test edx, edx
  jnz @BothNonNil
  {Return first string length: second string is nil}
  mov eax, [eax - 4]
  ret
@FirstStringNil:
  {Return 0 - length(S2): first string is nil}
  sub eax, [edx - 4]
  ret
  {The first four characters are identical}
@FirstFourSame:
  {Save edi}
  push edi
  {set edi = length(S1)}
  mov edi, [eax - 4]
  {Save esi}
  push esi
  xor esi, esi
  mov ecx, edi
  {set edi = length(S1) - length(S2)}
  sub edi, [edx - 4]
  {set esi = 0 if length(S1) < length(S2), -1 otherwise}
  adc esi, -1
  {set esi = - min(length(s1), length(s2))}
  and esi, edi
  sub esi, ecx
  {Adjust the pointers to be negative based}
  sub eax, esi
  sub edx, esi
@CompareLoop:
  add esi, 4
  jns @MatchUpToLength
  mov ebx, [eax + esi]
  mov ecx, [edx + esi]
  cmp ebx, ecx
  je @CompareLoop
@Mismatch:
  {There was a mismatch, but we may have compared up to three characters too
   many: Compare the first two characters (there must be a trailing #0)}
  cmp bx, cx
  je @FirstTwoMatches
@ActualMismatch:
  movzx eax, bh
  mov ah, bl
  movzx edx, ch
  mov dh, cl
  sub eax, edx
  pop esi
  pop edi
  pop ebx
  ret
@FirstTwoMatches:
  {Move the high words into view}
  shr ebx, 16
  shr ecx, 16
  {The first two characters are the same. Have we compared two or three characters
   too many?}
  cmp esi, -3
  jng @ActualMismatch
  {All characters match - return the difference in length}
@MatchUpToLength:
  mov eax, edi
  pop esi
  pop edi
  pop ebx
end;

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     Intel Pentium M Banias
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_IA32_12

function CompareStrFastcodePMB(const S1, S2: string): Integer;
asm
  {On entry:
    eax = S1,
    edx = S2}
  cmp eax, edx
  je @SameString
  {Is either of the strings perhaps nil?}
  test eax, edx
  jz @PossibleNilString
  {Compare the first four characters (there has to be a trailing #0). In random
   string compares this can save a lot of CPU time.}
@BothNonNil:
  {Compare the first character}
  mov ecx, [edx]
  cmp cl, [eax]
  je @FirstCharacterSame
  {First character differs}
  movzx eax, byte ptr [eax]
  movzx ecx, cl
  sub eax, ecx
  ret
@FirstCharacterSame:
  {save ebx}
  push ebx
  {Get first four characters}
  mov ebx, [eax]
  cmp ebx, ecx
  je @FirstFourSame
  {Get the string lengths in eax and edx}
  mov eax, [eax - 4]
  mov edx, [edx - 4]
  {Is the second character the same?}
  cmp ch, bh
  je @FirstTwoCharactersMatch
  {Second character differs: Are any of the strings non-nil but zero length?}
  test eax, eax
  jz @ReturnLengthDifference
  test edx, edx
  jz @ReturnLengthDifference
  movzx eax, bh
  movzx edx, ch
@ReturnLengthDifference:
  sub eax, edx
  pop ebx
  ret
@FirstTwoCharactersMatch:
  cmp eax, 2
  jna @ReturnLengthDifference
  cmp edx, 2
  jna @ReturnLengthDifference
  {Swap the bytes in priority order}
  mov eax, ebx
  bswap eax
  bswap ecx
  sub eax, ecx
  pop ebx
  ret
  {It is the same string}
@SameString:
  xor eax, eax
  ret
  {Good possibility that at least one of the strings are nil}
@PossibleNilString:
  test eax, eax
  jz @FirstStringNil
  test edx, edx
  jnz @BothNonNil
  {Return first string length: second string is nil}
  mov eax, [eax - 4]
  ret
@FirstStringNil:
  {Return 0 - length(S2): first string is nil}
  sub eax, [edx - 4]
  ret
  {The first four characters are identical}
@FirstFourSame:
  {Save edi}
  push edi
  {set edi = length(S1)}
  mov edi, [eax - 4]
  {Save esi}
  push esi
  xor esi, esi
  mov ecx, edi
  {set edi = length(S1) - length(S2)}
  sub edi, [edx - 4]
  {set esi = 0 if length(S1) < length(S2), -1 otherwise}
  adc esi, -1
  {set esi = - min(length(s1), length(s2))}
  and esi, edi
  sub esi, ecx
  {Adjust the pointers to be negative based}
  sub eax, esi
  sub edx, esi
@CompareLoop:
  add esi, 4
  jns @MatchUpToLength
  mov ebx, [eax + esi]
  mov ecx, [edx + esi]
  cmp ebx, ecx
  je @CompareLoop
@Mismatch:
  {There was a mismatch, but we may have compared up to three characters too
   many: Compare the first two characters (there must be a trailing #0)}
  cmp bx, cx
  je @FirstTwoMatches
@ActualMismatch:
  movzx eax, bh
  mov ah, bl
  movzx edx, ch
  mov dh, cl
  sub eax, edx
  pop esi
  pop edi
  pop ebx
  ret
@FirstTwoMatches:
  {Move the high words into view}
  shr ebx, 16
  shr ecx, 16
  {The first two characters are the same. Have we compared two or three characters
   too many?}
  cmp esi, -3
  jng @ActualMismatch
  {All characters match - return the difference in length}
@MatchUpToLength:
  mov eax, edi
  pop esi
  pop edi
  pop ebx
end;

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     AMD Athlon 64, Opteron, FX
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_IA32_13

function CompareStrFastcodeAMD64(const S1, S2: string): Integer;
asm
  {On entry:
    eax = S1,
    edx = S2}
  cmp eax, edx
  je @SameString
  {Is either of the strings perhaps nil?}
  test eax, edx
  jz @PossibleNilString
  {Compare the first four characters (there has to be a trailing #0). In random
   string compares this can save a lot of CPU time.}
@BothNonNil:
  {Compare the first character}
  mov ecx, [edx]
  cmp cl, [eax]
  je @FirstCharacterSame
  {First character differs}
  movzx eax, byte ptr [eax]
  movzx ecx, cl
  sub eax, ecx
  db $f3
  ret
@FirstCharacterSame:
  {save ebx}
  push ebx
  {Get first four characters}
  mov ebx, [eax]
  cmp ebx, ecx
  je @FirstFourSame
  {Get the string lengths in eax and edx}
  mov eax, [eax - 4]
  mov edx, [edx - 4]
  {Is the second character the same?}
  cmp ch, bh
  je @FirstTwoCharactersMatch
  {Second character differs: Are any of the strings non-nil but zero length?}
  test eax, eax
  jz @ReturnLengthDifference
  test edx, edx
  jz @ReturnLengthDifference
  movzx eax, bh
  movzx edx, ch
@ReturnLengthDifference:
  sub eax, edx
  pop ebx
  db $f3
  ret
@FirstTwoCharactersMatch:
  cmp eax, 2
  jna @ReturnLengthDifference
  cmp edx, 2
  jna @ReturnLengthDifference
  {Swap the bytes into the correct order}
  mov eax, ebx
  bswap eax
  bswap ecx
  sub eax, ecx
  pop ebx
  ret
  {It is the same string}
@SameString:
  xor eax, eax
  db $f3
  ret
  {Good possibility that at least one of the strings are nil}
@PossibleNilString:
  test eax, eax
  jz @FirstStringNil
  test edx, edx
  jnz @BothNonNil
  {Return first string length: second string is nil}
  mov eax, [eax - 4]
  ret
@FirstStringNil:
  {Return 0 - length(S2): first string is nil}
  sub eax, [edx - 4]
  ret
  {The first four characters are identical}
@FirstFourSame:
  {Save edi}
  push edi
  {set edi = length(S1)}
  mov edi, [eax - 4]
  {Save esi}
  push esi
  xor esi, esi
  mov ecx, edi
  {set edi = length(S1) - length(S2)}
  sub edi, [edx - 4]
  {set esi = 0 if length(S1) < length(S2), -1 otherwise}
  adc esi, -1
  {set esi = - min(length(s1), length(s2))}
  and esi, edi
  sub esi, ecx
  {Adjust the pointers to be negative based}
  sub eax, esi
  sub edx, esi
@CompareLoop:
  add esi, 4
  jns @MatchUpToLength
  mov ebx, [eax + esi]
  mov ecx, [edx + esi]
  cmp ebx, ecx
  je @CompareLoop
@Mismatch:
  {There was a mismatch, but we may have compared up to three characters too
   many: Compare the first two characters (there must be a trailing #0)}
  cmp bx, cx
  je @FirstTwoMatches
@ActualMismatch:
  movzx eax, bh
  mov ah, bl
  movzx edx, ch
  mov dh, cl
  sub eax, edx
  pop esi
  pop edi
  pop ebx
  db $f3
  ret
@FirstTwoMatches:
  {Move the high words into view}
  shr ebx, 16
  shr ecx, 16
  {The first two characters are the same. Have we compared two or three characters
   too many?}
  cmp esi, -3
  jng @ActualMismatch
  {All characters match - return the difference in length}
@MatchUpToLength:
  mov eax, edi
  pop esi
  pop edi
  pop ebx
end;

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     AMD Athlon XP
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_IA32_13

function CompareStrFastcodeXP(const S1, S2: string): Integer;
asm
  {On entry:
    eax = S1,
    edx = S2}
  cmp eax, edx
  je @SameString
  {Is either of the strings perhaps nil?}
  test eax, edx
  jz @PossibleNilString
  {Compare the first four characters (there has to be a trailing #0). In random
   string compares this can save a lot of CPU time.}
@BothNonNil:
  {Compare the first character}
  mov ecx, [edx]
  cmp cl, [eax]
  je @FirstCharacterSame
  {First character differs}
  movzx eax, byte ptr [eax]
  movzx ecx, cl
  sub eax, ecx
  db $f3
  ret
@FirstCharacterSame:
  {save ebx}
  push ebx
  {Get first four characters}
  mov ebx, [eax]
  cmp ebx, ecx
  je @FirstFourSame
  {Get the string lengths in eax and edx}
  mov eax, [eax - 4]
  mov edx, [edx - 4]
  {Is the second character the same?}
  cmp ch, bh
  je @FirstTwoCharactersMatch
  {Second character differs: Are any of the strings non-nil but zero length?}
  test eax, eax
  jz @ReturnLengthDifference
  test edx, edx
  jz @ReturnLengthDifference
  movzx eax, bh
  movzx edx, ch
@ReturnLengthDifference:
  sub eax, edx
  pop ebx
  db $f3
  ret
@FirstTwoCharactersMatch:
  cmp eax, 2
  jna @ReturnLengthDifference
  cmp edx, 2
  jna @ReturnLengthDifference
  {Swap the bytes into the correct order}
  mov eax, ebx
  bswap eax
  bswap ecx
  sub eax, ecx
  pop ebx
  ret
  {It is the same string}
@SameString:
  xor eax, eax
  db $f3
  ret
  {Good possibility that at least one of the strings are nil}
@PossibleNilString:
  test eax, eax
  jz @FirstStringNil
  test edx, edx
  jnz @BothNonNil
  {Return first string length: second string is nil}
  mov eax, [eax - 4]
  ret
@FirstStringNil:
  {Return 0 - length(S2): first string is nil}
  sub eax, [edx - 4]
  ret
  {The first four characters are identical}
@FirstFourSame:
  {Save edi}
  push edi
  {set edi = length(S1)}
  mov edi, [eax - 4]
  {Save esi}
  push esi
  xor esi, esi
  mov ecx, edi
  {set edi = length(S1) - length(S2)}
  sub edi, [edx - 4]
  {set esi = 0 if length(S1) < length(S2), -1 otherwise}
  adc esi, -1
  {set esi = - min(length(s1), length(s2))}
  and esi, edi
  sub esi, ecx
  {Adjust the pointers to be negative based}
  sub eax, esi
  sub edx, esi
@CompareLoop:
  add esi, 4
  jns @MatchUpToLength
  mov ebx, [eax + esi]
  mov ecx, [edx + esi]
  cmp ebx, ecx
  je @CompareLoop
@Mismatch:
  {There was a mismatch, but we may have compared up to three characters too
   many: Compare the first two characters (there must be a trailing #0)}
  cmp bx, cx
  je @FirstTwoMatches
@ActualMismatch:
  movzx eax, bh
  mov ah, bl
  movzx edx, ch
  mov dh, cl
  sub eax, edx
  pop esi
  pop edi
  pop ebx
  db $f3
  ret
@FirstTwoMatches:
  {Move the high words into view}
  shr ebx, 16
  shr ecx, 16
  {The first two characters are the same. Have we compared two or three characters
   too many?}
  cmp esi, -3
  jng @ActualMismatch
  {All characters match - return the difference in length}
@MatchUpToLength:
  mov eax, edi
  pop esi
  pop edi
  pop ebx
end;

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     Blended
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_IA32_12

function CompareStrFastcodeBlended(const S1, S2: string): Integer;
asm
  {On entry:
    eax = S1,
    edx = S2}
  cmp eax, edx
  je @SameString
  {Is either of the strings perhaps nil?}
  test eax, edx
  jz @PossibleNilString
  {Compare the first four characters (there has to be a trailing #0). In random
   string compares this can save a lot of CPU time.}
@BothNonNil:
  {Compare the first character}
  mov ecx, [edx]
  cmp cl, [eax]
  je @FirstCharacterSame
  {First character differs}
  movzx eax, byte ptr [eax]
  movzx ecx, cl
  sub eax, ecx
  ret
@FirstCharacterSame:
  {save ebx}
  push ebx
  {Get first four characters}
  mov ebx, [eax]
  cmp ebx, ecx
  je @FirstFourSame
  {Get the string lengths in eax and edx}
  mov eax, [eax - 4]
  mov edx, [edx - 4]
  {Is the second character the same?}
  cmp ch, bh
  je @FirstTwoCharactersMatch
  {Second character differs: Are any of the strings non-nil but zero length?}
  test eax, eax
  jz @ReturnLengthDifference
  test edx, edx
  jz @ReturnLengthDifference
  movzx eax, bh
  movzx edx, ch
@ReturnLengthDifference:
  sub eax, edx
  pop ebx
  ret
@FirstTwoCharactersMatch:
  cmp eax, 2
  jna @ReturnLengthDifference
  cmp edx, 2
  jna @ReturnLengthDifference
  {Swap the bytes in priority order}
  mov eax, ebx
  bswap eax
  bswap ecx
  sub eax, ecx
  pop ebx
  ret
  {It is the same string}
@SameString:
  xor eax, eax
  ret
  {Good possibility that at least one of the strings are nil}
@PossibleNilString:
  test eax, eax
  jz @FirstStringNil
  test edx, edx
  jnz @BothNonNil
  {Return first string length: second string is nil}
  mov eax, [eax - 4]
  ret
@FirstStringNil:
  {Return 0 - length(S2): first string is nil}
  sub eax, [edx - 4]
  ret
  {The first four characters are identical}
@FirstFourSame:
  {Save edi}
  push edi
  {set edi = length(S1)}
  mov edi, [eax - 4]
  {Save esi}
  push esi
  xor esi, esi
  mov ecx, edi
  {set edi = length(S1) - length(S2)}
  sub edi, [edx - 4]
  {set esi = 0 if length(S1) < length(S2), -1 otherwise}
  adc esi, -1
  {set esi = - min(length(s1), length(s2))}
  and esi, edi
  sub esi, ecx
  {Adjust the pointers to be negative based}
  sub eax, esi
  sub edx, esi
@CompareLoop:
  add esi, 4
  jns @MatchUpToLength
  mov ebx, [eax + esi]
  mov ecx, [edx + esi]
  cmp ebx, ecx
  je @CompareLoop
@Mismatch:
  {There was a mismatch, but we may have compared up to three characters too
   many: Compare the first two characters (there must be a trailing #0)}
  cmp bx, cx
  je @FirstTwoMatches
@ActualMismatch:
  movzx eax, bh
  mov ah, bl
  movzx edx, ch
  mov dh, cl
  sub eax, edx
  pop esi
  pop edi
  pop ebx
  ret
@FirstTwoMatches:
  {Move the high words into view}
  shr ebx, 16
  shr ecx, 16
  {The first two characters are the same. Have we compared two or three characters
   too many?}
  cmp esi, -3
  jng @ActualMismatch
  {All characters match - return the difference in length}
@MatchUpToLength:
  mov eax, edi
  pop esi
  pop edi
  pop ebx
end;

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     RTL Replacement
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_IA32_11

function CompareStrFastcodeRTL(const S1, S2: string): Integer;
asm
  {On entry:
    eax = S1,
    edx = S2}
  cmp eax, edx
  je @SameString
  {Is either of the strings perhaps nil?}
  test eax, edx
  jz @PossibleNilString
  {Compare the first character (there has to be a trailing #0). In random
   string compares this can save a lot of CPU time.}
@BothNonNil:
  movzx ecx, byte ptr [edx]
  cmp cl, [eax]
  je @FirstCharacterSame
  {The first character differs}
  movzx eax, byte ptr [eax]
  sub eax, ecx
  ret
@FirstCharacterSame:
  {Save edi}
  push edi
  {set edi = length(S1)}
  mov edi, [eax - 4]
  {Save esi}
  push esi
  xor esi, esi
  mov ecx, edi
  {set edi = length(S1) - length(S2)}
  sub edi, [edx - 4]
  {set esi = 0 if length(S1) < length(S2), -1 otherwise}
  adc esi, -1
  {set esi = - min(length(s1), length(s2))}
  and esi, edi
  sub esi, ecx
  {Save ebx}
  push ebx
  {non-nil zero-length string?}
  jz @MatchUpToLength
  {Adjust the pointers to be negative based}
  sub eax, esi
  sub edx, esi
@CompareLoop:
  mov ebx, [eax + esi]
  mov ecx, [edx + esi]
  cmp ebx, ecx
  jne @Mismatch
  add esi, 4
  js @CompareLoop
  {All characters match - return the difference in length}
@MatchUpToLength:
  mov eax, edi
  pop ebx
  pop esi
  pop edi
  ret
@Mismatch:
  {There was a mismatch, but we may have compared up to three characters too
   many: Compare the first two characters (there must be a trailing #0)}
  cmp bx, cx
  je @FirstTwoMatches
@ActualMismatch:
  movzx eax, bh
  mov ah, bl
  movzx edx, ch
  mov dh, cl
  sub eax, edx
  pop ebx
  pop esi
  pop edi
  ret
@FirstTwoMatches:
  {The first two characters are the same. Have we compared two or three characters
   too many?}
  cmp esi, -3
  jg @MatchUpToLength
  {We've compared 1 or less character too many. There is always a trailing #0,
   so we can compare the rest safely.}
  shr ebx, 16
  shr ecx, 16
  jmp @ActualMismatch
  {It is the same string}
@SameString:
  xor eax, eax
  ret
  {Good possibility that at least one of the strings are nil}
@PossibleNilString:
  test eax, eax
  jz @FirstStringNil
  test edx, edx
  jnz @BothNonNil
  {Return first string length: second string is nil}
  mov eax, [eax - 4]
  ret
@FirstStringNil:
  {Return 0 - length(S2): first string is nil}
  sub eax, [edx - 4]
end;

//Author:            Pierre le Riche
//Date:              unknown
//Optimized for:     Blended / Pascal
//Instructionset(s): IA32
//Original name:     CompareStr_PLR_PAS_1

{$ifopt R+}
  {$define RangeCheckWasOn}
  {$R-}
{$endif}
{$ifopt Q+}
  {$define OverflowCheckWasOn}
  {$Q-}
{$endif}
function CompareStrFastcodePascal(const S1, S2: string): Integer;
type
  {Define types for older Delphi versions}
  PByte = ^Byte;
  TByteArray = array[0..0] of Byte;
  PByteArray = ^TByteArray;
  PInteger = ^Integer;
var
  LStr1, LStr2, LStr1Char1, LStr2Char1, LLength1, LLength2,
    LCompInd, LLengthDif, LChars1, LChars2: Integer;
begin
  {Assign to local variables (hopefully a register)}
  LStr1 := Integer(S1);
  LStr2 := Integer(S2);
  {Different strings?}
  if LStr1 <> LStr2 then
  begin
    {Is S1 = nil?}
    if LStr1 <> 0 then
    begin
      {Is S2 = nil?}
      if LStr2 <> 0 then
      begin
        {Compare the first character}
        LStr1Char1 := PByte(LStr1)^;
        LStr2Char1 := PByte(LStr2)^;
        if LStr1Char1 <> LStr2Char1 then
        begin
          {Mismatch on first character}
          Result := LStr1Char1 - LStr2Char1;
        end
        else
        begin
          {First character is the same: Get the number of characters to compare}
          LLength1 := PInteger(LStr1 - 4)^;
          LLength2 := PInteger(LStr2 - 4)^;
          LLengthDif := LLength1 - LLength2;
          if LLengthDif >= 0 then
            LCompInd := - LLength2
          else
            LCompInd := - LLength1;
          if LCompInd < 0 then
          begin
            Dec(LStr1, LCompInd);
            Dec(LStr2, LCompInd);
            repeat
              LChars1 := PInteger(@PByteArray(LStr1)[LCompInd])^;
              LChars2 := PInteger(@PByteArray(LStr2)[LCompInd])^;
              if LChars1 <> LChars2 then
              begin
                if SmallInt(LChars1) <> SmallInt(LChars2) then
                begin
                  Result := (Byte(LChars1) shl 8) + Byte(LChars1 shr 8)
                    - (Byte(LChars2) shl 8) - Byte(LChars2 shr 8);
                  exit;
                end
                else
                begin
                  {Matched up to length?}
                  if LCompInd > -3 then
                    break;
                  {Actual micmatch}
                  Result := (LChars1 shr 24) + ((LChars1 shr 8) and $ff00)
                    - (LChars2 shr 24) - ((LChars2 shr 8) and $ff00);
                  exit;
                end;
              end;
              Inc(LCompInd, 4);
            until LCompInd >= 0;
          end;
          {All characters match up to the max length - return the difference
           in length}
          Result := LLengthDif;
        end;
      end
      else
      begin
        {S2 = nil, return the length of S1}
        Result := PInteger(LStr1 - 4)^;
      end;
    end
    else
    begin
      {S1 = nil, return the negative length of S2}
      Result := LStr1 - PInteger(LStr2 - 4)^;
    end;
  end
  else
  begin
    {Same string}
    Result := 0;
  end;
end;
{$ifdef RangeCheckWasOn}
  {$R+}
{$endif}
{$ifdef OverflowCheckWasOn}
  {$Q+}
{$endif}

end.
