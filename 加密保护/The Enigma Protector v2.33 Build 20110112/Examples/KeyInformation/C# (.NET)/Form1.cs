using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace test
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Enigma_IDE.TKeyInformation ki = new Enigma_IDE.TKeyInformation();
            if (Enigma_IDE.EP_RegKeyInformation(tbName.Text, tbKey.Text, ref ki))
            {
                string res = string.Format("\rCreation date: {0}", (new DateTime(ki.CreationYear, ki.CreationMonth, ki.CreationDay)).ToLongDateString());
                if (ki.UseKeyExpiration)
                {
                    res += string.Format("\rExpiration date: {0}", (new DateTime(ki.ExpirationYear, ki.ExpirationMonth, ki.ExpirationDay)).ToLongDateString());
                }
                if (ki.UseHardwareLocking)
                {
                    res += "\rKey is Hardware Locked";
                }
                if (ki.UseExecutionsLimit)
                {
                    res += string.Format("\rExecutions number: {0}", ki.ExecutionsCount);
                }
                if (ki.UseDaysLimit)
                {
                    res += string.Format("\rDays number: {0}", ki.DaysCount);
                }
                if (ki.UseRunTimeLimit)
                {
                    res += string.Format("\rRun-time minutes: {0}", ki.RunTimeMinutes);
                }
                if (ki.UseGlobalTimeLimit)
                {
                    res += string.Format("\rGlobal time minutes: {0}", ki.GlobalTimeMinutes);
                }
                if (ki.UseCountyLimit)
                {
                    foreach (Enigma_IDE.TKeyCountries kc in Enigma_IDE.KEY_COUNTRIES)
                    {
                        if (kc.Code == ki.CountryCode)
                        {
                            res += string.Format("\rCountry lock: {0}", kc.Name);
                            break;
                        }
                    }
                }

                if (ki.UseRegisterAfter)
                {
                    res += string.Format("\rRegister After date: {0}", (new DateTime(ki.RegisterAfterYear, ki.RegisterAfterMonth, ki.RegisterAfterDay)).ToLongDateString());
                }
                if (ki.UseRegisterBefore)
                {
                    res += string.Format("\rRegister Before date: {0}", (new DateTime(ki.RegisterBeforeYear, ki.RegisterBeforeMonth, ki.RegisterBeforeDay)).ToLongDateString());
                }
                for (int i = 0; i < ki.EncryptedSections.Length; i++)
                {
                    if (ki.EncryptedSections[i])
                    {
                        res += string.Format("\rDecrypts section #{0}", i + 1);
                    }
                }
                MessageBox.Show("Registration Information is valid and contains the following information:" + res);
            } else
            {
                MessageBox.Show("Registration Information is invalid");
            }
        }
    }
}