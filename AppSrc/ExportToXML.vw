Use Windows.pkg
Use DFClient.pkg
Use cTextEdit.pkg
Use CrystalReporter.bp

Deferred_View Activate_oExportToXML for ;
Object oExportToXML is a dbView

    Set Border_Style to Border_Thick
    Set Size to 283 443
    Set Location to 2 2
    Set Label to "Export .RPT Files as .XML"

    Object oGroup1 is a Group
        Set Size to 51 433
        Set Location to 6 5
        Set Label to "Initial Folder:"

        Object frmDirectory is a Form
            Set Size to 13 215
            Set Location to 13 88
            Set Label to "Report Folder : "
        End_Object

        Object btnConvert is a Button
            Set Size to 14 141
            Set Location to 30 88
            Set Label to "Save .RPT File Format as .XML"
        
            Procedure OnClick
                Set phProgressNotifier of oCrystalReporter to (grpInformation(Self)) 
                Set psFolderName of oCrystalReporter to (Value(frmDirectory))
                Send DoProcess to oCrystalReporter 
            End_Procedure
        
        End_Object
    End_Object

    Object grpInformation is a Group
        Set Size to 158 432
        Set Location to 66 6
        Set Label to "Information:"

        Object txtProgress is a cTextEdit
            Set Size to 137 417
            Set Location to 14 9
        End_Object
        
        Procedure updateProgress String sValue 
            Send AppendText of txtProgress (sValue+(character(10)))
        End_Procedure
        
    End_Object

    Object btnClose is a Button
        Set Size to 14 88
        Set Location to 231 336
        Set Label to "Close"
    
        // fires when the button is clicked
        Procedure OnClick
            Send Close_Panel
        End_Procedure
    
    End_Object

Cd_End_Object
