using System;
using System.Collections.Generic;
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

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void Form1_Shown(object sender, EventArgs e)
        {
            Int32 len = Enigma_IDE.EP_ProtectedStringByKey("fyi6z02Y", null, 0);
            if (len > 0)
            {
                StringBuilder str = new StringBuilder(len);
                if (Enigma_IDE.EP_ProtectedStringByKey("fyi6z02Y", str, len) > 0)
                {
                    textBox1.Text = str.ToString();
                }
            }

            len = Enigma_IDE.EP_ProtectedStringByID(1, null, 0);
            if (len > 0)
            {
                StringBuilder str = new StringBuilder(len);
                if (Enigma_IDE.EP_ProtectedStringByID(1, str, len) > 0)
                {
                    textBox2.Text = str.ToString();
                }
            }

            len = Enigma_IDE.EP_ProtectedStringByKey("26Lu66Er", null, 0);
            if (len > 0)
            {
                StringBuilder str = new StringBuilder(len);
                if (Enigma_IDE.EP_ProtectedStringByKey("26Lu66Er", str, len) > 0)
                {
                    textBox3.Text = str.ToString();
                }
            }
        }
    }
}