// SYNTAX TEST "Packages/ASL-Syntax-Highlight/ASL.sublime-syntax"

// Comments
// <- comment.line.double-slash
/* block comment */
// <- comment.block
/* = Banner = */
// <- comment.block.banner
*/
// <- invalid.illegal.stray-comment-end
'
// <- invalid.illegal.character

// Strings
Name (STR0,
"http://example.com/*not a comment*/")
// <- string.quoted.double
// <- - comment
//      ^ - comment

Name (STR1,
"line\n")
// <- string.quoted.double
//   ^ constant.character.escape
Name (STR2,
"bad\q")
// <- string.quoted.double
//  ^ invalid.illegal.unknown-escape
Name (STR3,
  "\x41\101")
// ^ constant.character.escape
//     ^ constant.character.escape
Name (STR4,
"quote\'")
// <- string.quoted.double
//    ^ constant.character.escape

// Numbers
Name (NUM0,
123)
// <- constant.numeric.integer.decimal
Name (NUM1,
0x1A)
// <- constant.numeric.integer.hexadecimal
Name (NUM2,
077)
// <- constant.numeric.integer.octal
Name (CON0,
Zero)
// <- constant.language
Name (CON1,
Ones)
// <- constant.language

// Case-insensitive keywords
definitionblock ("", "DSDT", 2, "ASL", "TEST", 0x00000001)
// <- storage.type keyword.declaration
mEtHoD (MTHD, 0, NotSerialized)
// <- storage.type.function keyword.declaration.function
Name (FLG0,
notserialized)
// <- keyword.other

// Declarations and names
Method (
MTH2, 0, NotSerialized)
// <- entity.name.function
Device (
DEV0)
// <- entity.name.type
OperationRegion (
REG0, SystemMemory, 0xDEAD0000, 0x1000)
// <- entity.name.type
Name (
FOO, 0)
// <- entity.name.constant
Function (
FUNC, 0, NotSerialized)
// <- entity.name.function
Mutex (
MUTX, 0)
// <- entity.name.constant
Event (
EVT0)
// <- entity.name.constant
External (
EXT0, DeviceObj, 0, NotSerialized)
// <- entity.name.constant
Processor (
CPU0, 0, 0)
// <- entity.name.type
PowerResource (
PWR0, 0, 0)
// <- entity.name.type
ThermalZone (
TZ00)
// <- entity.name.type
DataTableRegion (
DTBL, "SSDT", "OEM", "TABLE")
// <- entity.name.type
Scope (\_SB)
//     ^ punctuation.definition.namespace
//      ^ entity.name.namespace
MTH2 ()
// <- variable.function

// Variables
Store (
Arg0, Local0)
// <- variable.language
//    ^ variable.language
Store (
Arg7, Local8)
// <- - variable.language
//    ^ - variable.language

// Predefined names
Store (
_HID, Local0)
// <- support.constant
Store (
_L01, Local0)
// <- support.constant
Store (
_SB.GNVS, Local0)
// <- support.constant
Store (
_SB_, Local0)
// <- support.constant
Store (
_hid, Local0)
// <- support.constant
Store (
_L0A, Local0)
// <- support.constant

// Flags and resource macros
Name (FLG1,
AnyAcc)
// <- keyword.other
Name (FLG2,
ResourceConsumer)
// <- keyword.other
ResourceTemplate ()
// <- support.function.resource
I2cSerialBusV2 (
// <- support.function.resource
1)
Memory32Fixed (
// <- support.function.resource
1)
GpioInt (
// <- support.function.resource
1)
RawDataBuffer (
// <- support.function.resource
1)
Register (
// <- support.function.resource
1)
Name (FLG3,
anyacc)
// <- keyword.other
Field (
// <- storage.type keyword.declaration.type
REG0, AnyAcc, NoLock, Preserve)

// Operators
Local0
= 1
// <- keyword.operator.assignment
Local0
<= 1
// <- keyword.operator.comparison
Local0
== 1
// <- keyword.operator.comparison
Local0
!= 1
// <- keyword.operator.comparison
Local0
+= 1
// <- keyword.operator.assignment
Local0
<<= 1
// <- keyword.operator.assignment
Local0
&& 1
// <- keyword.operator.logical
Local0
|| 1
// <- keyword.operator.logical
Local0
++
// <- keyword.operator.arithmetic
Local0
--
// <- keyword.operator.arithmetic
Local0
& 1
// <- keyword.operator.bitwise
Local0
<< 1
// <- keyword.operator.bitwise
Local0
>> 1
// <- keyword.operator.bitwise
Local0
>>= 1
// <- keyword.operator.assignment
Local0
>= 1
// <- keyword.operator.comparison
Local0
|= 1
// <- keyword.operator.assignment
Local0
^= 1
// <- keyword.operator.assignment
Local0
~1
// <- keyword.operator.bitwise
Local0
!1
// <- keyword.operator.logical

// Preprocessor
  #include "include.asi"
// <- meta.preprocessor
// ^ keyword.control.import
  #define TEST 1
// <- meta.preprocessor
// ^ keyword.control.directive
//             ^ constant.numeric.integer.decimal
  #include <include.asi>
// <- meta.preprocessor
// ^ keyword.control.import
//          ^ string.quoted.other
  #includebuffer <data.bin> BUFF
// ^ keyword.control.import
  #pragma disable (1234)
// ^ keyword.control.directive
  #if __LINE__
// ^ keyword.control.directive
//    ^ support.constant.preprocessor
  #define LONG_MACRO \
    1
// <- meta.preprocessor
//  ^ constant.numeric.integer.decimal
__FILE__
// <- support.constant.preprocessor
