#include "include.asi"

DefinitionBlock ("", "SSDT", 2, "ASL", "EXAMPLE", 0x00000001)
{
    Scope (\_SB)
    {
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
            Name (INCL, ASL_INCLUDE_TEST)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x00000000, 0x00100000)
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared) { 16 }
                I2cSerialBusV2 (0x50, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.I2C0", 0x00,
                    ResourceConsumer, , Exclusive)
            })

            OperationRegion (GNVS, SystemMemory, 0xDEAD0000, 0x1000)
            Field (GNVS, AnyAcc, Lock, Preserve)
            {
                OSYS, 16,
                Offset (0x10),
                FLD0, 8
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Method (TEST, 2, Serialized)
            {
                If ((Arg0 == Zero))
                {
                    Return (One)
                }
                ElseIf ((Arg0 == One))
                {
                    Return (Ones)
                }
                Else
                {
                    Local0 = Zero
                    While (Local0 < 10)
                    {
                        Local0++
                    }
                    Return (Local0)
                }
            }
        }
    }
}
