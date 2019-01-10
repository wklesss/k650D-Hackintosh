// ACPI Error: Found unknown opcode 0x15 at AML address 0x7ff47c502937 offset 0x3, ignoring (20100331/psloop-230)
// ACPI Error: Found unknown opcode 0x15 at AML address 0x7ff47c502944 offset 0x10, ignoring (20100331/psloop-230)
// ACPI Error: Found unknown opcode 0x15 at AML address 0x7ff47c50294c offset 0x18, ignoring (20100331/psloop-230)
// ACPI Error: Argument count mismatch for method \RMCF.AUDL 7 0 (20100331/dmextern-385)
// ACPI Error: Found unknown opcode 0x15 at AML address 0x7ff47c502937 offset 0x3, ignoring (20100331/psloop-230)
// ACPI Error: Found unknown opcode 0x15 at AML address 0x7ff47c502944 offset 0x10, ignoring (20100331/psloop-230)
// ACPI Error: Found unknown opcode 0x15 at AML address 0x7ff47c50294c offset 0x18, ignoring (20100331/psloop-230)
/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20100331
 *
 * Disassembly of iASLHIgJZT.aml, Thu Jan 10 18:33:13 2019
 *
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000158 (344)
 *     Revision         0x02
 *     Checksum         0x23
 *     OEM ID           "hack"
 *     OEM Table ID     "_HDEF"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("iASLHIgJZT.aml", "SSDT", 2, "hack", "_HDEF", 0x00000000)
{
    External (\RMDA, MethodObj)    // 5 Arguments
    External (\RMCF.DAUD, MethodObj)    // 2 Arguments
    External (\RMCF.AUDL, MethodObj)    // 7 Arguments

    If (Zero)
    {
        \RMCF.AUDL (One, Zero, \RMDA (One, Zero, \RMCF.DAUD (One, Zero), Method (_SB.PCI0.HDEF._DSM, 4, NotSerialized)
                {
                    If (CondRefOf (\RMCF.AUDL))
                    {
                        If (LEqual (Ones, \RMCF.AUDL (Return (Zero), If (LNot (Arg2))
                                    {
                                        Return (Buffer (One)
                                        {
                                            0x03
                                        })
                                    }, Store (Package (0x08)
                                        {
                                            "layout-id", 
                                            Buffer (0x04)
                                            {
                                                0x21, 0x00, 0x00, 0x00
                                            }, 

                                            "hda-gfx", 
                                            Buffer (0x0A)
                                            {
                                                "onboard-1"
                                            }, 

                                            "no-controller-patch", 
                                            Buffer (0x04)
                                            {
                                                0x01, 0x00, 0x00, 0x00
                                            }, 

                                            "PinConfigurations", 
                                            Buffer (Zero) {}
                                        }, Local0), If (CondRefOf (\RMCF.AUDL))
                                    {
                                        CreateDWordField (DerefOf (Index (Local0, One)), Zero, AUDL)
                                        Store (\RMCF.AUDL (AUDL, Store (Zero, Local1), If (CondRefOf (\RMDA))
                                                {
                                                    Store (One, Local1)
                                                }, If (CondRefOf (\RMCF.DAUD))
                                                {
                                                    If (LEqual (Zero, \RMCF.DAUD (Store (One, Local1), If (Local1)
                                                                {
                                                                    Store ("#hda-gfx", Index (Local0, 0x02))
                                                                }))) {}
                                                }, Return (Local0)))
                                    }))) {}
                    }
                }))
    }
}

