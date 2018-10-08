using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace test
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
        }
        
        private void ShowOurMessage(string AMessage)
        {
            lbMessages.Items.Add(string.Format("[{0}] {1} ", DateTime.Now.ToLongTimeString(), AMessage));
            lbMessages.SelectedIndex = lbMessages.Items.Count - 1;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            if (Enigma_IDE.EP_RegCheckAndSaveKey(tbName.Text, tbKey.Text))
            {
                MessageBox.Show("New license is valid and installed!");
            } else {
                MessageBox.Show("License is invalid!");
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (Enigma_IDE.EP_RegLoadAndCheckKey())
            {
                int Total = 0;
                int Left = 0;
                if (Enigma_IDE.EP_RegKeyRuntime(ref Total, ref Left)) 
                {
                    ShowOurMessage(string.Format("Valid license, total runtime minute(s) {0}, left {1}", Total, Left));
                } else {
                    ShowOurMessage("License is valid, but not runtime limited!");
                }
            } else {
                ShowOurMessage("License is invalid!");
            }
        }
    }
}