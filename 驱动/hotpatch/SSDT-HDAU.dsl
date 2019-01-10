/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-HDAU.aml, Thu Jan 10 01:27:19 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000142 (322)
 *     Revision         0x02
 *     Checksum         0x36
 *     OEM ID           "hack"
 *     OEM Table ID     "_HDAU"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "_HDAU", 0x00000000)
{
    External (RMCF.AUDL, IntObj)    // (from opcode)
    External (RMCF.DAUD, IntObj)    // (from opcode)
    External (RMDA, IntObj)    // (from opcode)

    Method (_SB.PCI0.HDAU._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (CondRefOf (\RMCF.AUDL))
        {
            If (LEqual (Ones, \RMCF.AUDL))
            {
                Return (Zero)
            }
        }

        If (LNot (Arg2))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Store (Package (0x06)
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
                }
            }, Local0)
        If (CondRefOf (\RMCF.AUDL))
        {
            CreateDWordField (DerefOf (Index (Local0, One)), Zero, AUDL)
            Store (\RMCF.AUDL, AUDL)
        }

        Store (Zero, Local1)
        If (CondRefOf (\RMDA))
        {
            Store (One, Local1)
        }

        If (CondRefOf (\RMCF.DAUD))
        {
            If (LEqual (Zero, \RMCF.DAUD))
            {
                Store (One, Local1)
            }
        }

        If (Local1)
        {
            Store ("#hda-gfx", Index (Local0, 0x02))
        }

        Return (Local0)
    }
}

