using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.IO;


namespace WindowsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            StringBuilder BufferVarValue = new StringBuilder(100);

            InitializeComponent();

            // We make the following call to allow testing in an unprotected state.
            // "LoadWinlicenseDll" will set up the environment variables with your custom valued in WinlicenseSDK.ini
            // NOTE: In your release version, before protecting, you have to REMOVE this call!!!

            // #if _DEBUG_MODE_
            //     WinlicenseSDK.WLLoadWinlicenseDll();
            // #endif  

             // Check if application is Registered
    
            Kernel32.GetEnvironmentVariable("WLRegGetStatus", BufferVarValue, 100);

            if (System.Convert.ToInt32(BufferVarValue.ToString()) == 1)
            {
                StringBuilder UserInformation = new StringBuilder(1024);

                Kernel32.GetEnvironmentVariableW("WLRegGetLicenseInfoW", UserInformation, 1024);
                MessageBox.Show("The application is already REGISTERED.\nRegistered to: " + UserInformation, "SmartKeys");
                System.Environment.Exit(0);
            }
        }
        
        private void ActivateButton_Click(object sender, EventArgs e)
        {
            StringBuilder SmartKeyInfo = new StringBuilder(500);

            // fill our StringBuilder with the smart key information (Name + Company + Custom + SmartKey)
            // NOTE: if you are going to pass an empty buffer for some of the parameters, you must pass NULL instead.

            SmartKeyInfo.Append(this.NameEdit.Text + "," + this.CompanyEdit.Text + "," + this.CustomEdit.Text + "," + this.SmartKeyEdit.Text); 

            // Check if the smart key information is OK

            Kernel32.GetEnvironmentVariableW("WLRegSmartKeyCheckW", SmartKeyInfo, 500);

            // the return value is in "SmartKeyInfo"!!!

            if (SmartKeyInfo.ToString() == "0")
            {
                MessageBox.Show("Activation code is INVALID", "ERROR");
            }
            else
            {

                // activation data is correct. Now, we are going to install the smart key as File key (via WLRegSmartKeyInstallToFile)
  
                // NOTE: The above call to "Kernel32.GetEnvironmentVariable("WLRegSmartKeyCheck", BufferVarValue, 500);" DESTROYED the 
                // SmartKeyInfo with the return value from WinLicense in that same buffer. So, we have to set up the SmartKeyInfo again

                SmartKeyInfo.Length = 0;
                SmartKeyInfo.Append(this.NameEdit.Text + "," + this.CompanyEdit.Text + "," + this.CustomEdit.Text + "," + this.SmartKeyEdit.Text);

                Kernel32.GetEnvironmentVariableW("WLRegSmartKeyInstallToFileW", SmartKeyInfo, 500);
                MessageBox.Show("Activation code is CORRECT. Product Registered\nYou must RESTART he application to finish the registration", "SmartKeys");
            }
        }
    }
    
    /****************************************************************************** 
    /* Class: Kernel32
    /*
    /* Description: Wrapper for Kernel32 Dll
    /*
    /******************************************************************************/

    class Kernel32
    {
        [DllImport("Kernel32.dll", EntryPoint = "GetEnvironmentVariable", CallingConvention = CallingConvention.StdCall)]
        public static extern int GetEnvironmentVariable(string lpName, StringBuilder lpBuffer, int nSize);

        [DllImport("Kernel32.dll", CharSet = CharSet.Unicode, EntryPoint = "GetEnvironmentVariableW", CallingConvention = CallingConvention.StdCall)]
        public static extern int GetEnvironmentVariableW(string lpName, StringBuilder lpBuffer, int nSize);

    }

    /****************************************************************************** 
    /* Class: WinlicenseSDK
    /*
    /* Description: Wrapper for the Winlicense SDK APIs
    /*
    /******************************************************************************/

    class WinlicenseSDK
    {
        [DllImport("WinlicenseSDK.dll", EntryPoint = "WLLoadWinlicenseDll", CallingConvention = CallingConvention.StdCall)]
        public static extern void WLLoadWinlicenseDll();
    }

}