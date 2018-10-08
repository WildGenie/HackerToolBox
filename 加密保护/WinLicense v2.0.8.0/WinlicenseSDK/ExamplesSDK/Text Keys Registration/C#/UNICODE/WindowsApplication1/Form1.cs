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
                StringBuilder UserInfo = new StringBuilder(1024);

                Kernel32.GetEnvironmentVariableW("WLRegGetLicenseInfoW", UserInfo, 1024);

                MessageBox.Show("The application is already REGISTERED.\nRegistered to: " + UserInfo, "Text Keys");
                System.Environment.Exit(0);
            }
        }
        
        private void ActivateButton_Click(object sender, EventArgs e)
        {
            StringBuilder TextKeyInfo = new StringBuilder(4000);

            // fill our StringBuilder with the text key inserted by the user

            TextKeyInfo.Append(this.TextKeyEdit.Text);

            // Check if the inserted text key is OK

            Kernel32.GetEnvironmentVariableW("WLRegNormalKeyCheckW", TextKeyInfo, 4000);

            // the return value is in "SmartKeyInfo"!!!

            if (TextKeyInfo.ToString() == "0")
            {
                MessageBox.Show("Inserted key is INVALID", "ERROR");
            }
            else
            {

                // activation data is correct. Now, we are going to install the Text key as File key (via WLRegNormalKeyInstallToFile)
  
                // NOTE: The above call to "Kernel32.GetEnvironmentVariable("WLRegNormalKeyCheck", BufferVarValue, 4000);" DESTROYED the 
                // SmartKeyInfo with the return value from WinLicense in that same buffer. So, we have to set up the SmartKeyInfo again

                TextKeyInfo.Length = 0;
                TextKeyInfo.Append(this.TextKeyEdit.Text);

                Kernel32.GetEnvironmentVariableW("WLRegNormalKeyInstallToFileW", TextKeyInfo, 4000);
                MessageBox.Show("Activation code is CORRECT. Product Registered\nYou must RESTART he application to finish the registration", "Text Keys");
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