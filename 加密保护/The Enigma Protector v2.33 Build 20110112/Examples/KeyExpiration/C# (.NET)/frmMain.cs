using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;

namespace Test
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class frmMain : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox tbUserInfo;
		private System.Windows.Forms.Label lbKey;
		private System.Windows.Forms.TextBox tbKey;
		private System.Windows.Forms.Button btnRegister;
		private System.Windows.Forms.Button btnClose;
		private System.Windows.Forms.FontDialog fontDialog1;
		private System.Windows.Forms.ColorDialog colorDialog1;
		private System.Windows.Forms.PrintDialog printDialog1;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Panel panel2;
		private System.Windows.Forms.Panel panel3;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox tbStatus;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public frmMain()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.label1 = new System.Windows.Forms.Label();
			this.tbUserInfo = new System.Windows.Forms.TextBox();
			this.lbKey = new System.Windows.Forms.Label();
			this.tbKey = new System.Windows.Forms.TextBox();
			this.btnRegister = new System.Windows.Forms.Button();
			this.btnClose = new System.Windows.Forms.Button();
			this.fontDialog1 = new System.Windows.Forms.FontDialog();
			this.colorDialog1 = new System.Windows.Forms.ColorDialog();
			this.printDialog1 = new System.Windows.Forms.PrintDialog();
			this.panel1 = new System.Windows.Forms.Panel();
			this.panel2 = new System.Windows.Forms.Panel();
			this.panel3 = new System.Windows.Forms.Panel();
			this.label2 = new System.Windows.Forms.Label();
			this.tbStatus = new System.Windows.Forms.TextBox();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(112, 16);
			this.label1.TabIndex = 4;
			this.label1.Text = "User information";
			// 
			// tbUserInfo
			// 
			this.tbUserInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.tbUserInfo.Location = new System.Drawing.Point(8, 24);
			this.tbUserInfo.Name = "tbUserInfo";
			this.tbUserInfo.Size = new System.Drawing.Size(384, 20);
			this.tbUserInfo.TabIndex = 5;
			this.tbUserInfo.Text = "";
			// 
			// lbKey
			// 
			this.lbKey.Location = new System.Drawing.Point(8, 56);
			this.lbKey.Name = "lbKey";
			this.lbKey.Size = new System.Drawing.Size(88, 16);
			this.lbKey.TabIndex = 6;
			this.lbKey.Text = "Registration key";
			// 
			// tbKey
			// 
			this.tbKey.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.tbKey.Location = new System.Drawing.Point(8, 72);
			this.tbKey.Multiline = true;
			this.tbKey.Name = "tbKey";
			this.tbKey.Size = new System.Drawing.Size(384, 56);
			this.tbKey.TabIndex = 7;
			this.tbKey.Text = "";
			// 
			// btnRegister
			// 
			this.btnRegister.Location = new System.Drawing.Point(192, 208);
			this.btnRegister.Name = "btnRegister";
			this.btnRegister.Size = new System.Drawing.Size(96, 20);
			this.btnRegister.TabIndex = 8;
			this.btnRegister.Text = "Register";
			this.btnRegister.Click += new System.EventHandler(this.btnRegister_Click);
			// 
			// btnClose
			// 
			this.btnClose.Location = new System.Drawing.Point(296, 208);
			this.btnClose.Name = "btnClose";
			this.btnClose.Size = new System.Drawing.Size(96, 20);
			this.btnClose.TabIndex = 9;
			this.btnClose.Text = "Close";
			this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
			// 
			// panel1
			// 
			this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.panel1.Controls.Add(this.panel2);
			this.panel1.Location = new System.Drawing.Point(8, 136);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(384, 4);
			this.panel1.TabIndex = 12;
			// 
			// panel2
			// 
			this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.panel2.Location = new System.Drawing.Point(-2, -2);
			this.panel2.Name = "panel2";
			this.panel2.Size = new System.Drawing.Size(376, 4);
			this.panel2.TabIndex = 13;
			// 
			// panel3
			// 
			this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.panel3.Location = new System.Drawing.Point(8, 192);
			this.panel3.Name = "panel3";
			this.panel3.Size = new System.Drawing.Size(384, 4);
			this.panel3.TabIndex = 13;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 144);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(120, 23);
			this.label2.TabIndex = 14;
			this.label2.Text = "Key expiration status";
			// 
			// tbStatus
			// 
			this.tbStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.tbStatus.ForeColor = System.Drawing.Color.Red;
			this.tbStatus.Location = new System.Drawing.Point(8, 160);
			this.tbStatus.Name = "tbStatus";
			this.tbStatus.Size = new System.Drawing.Size(384, 20);
			this.tbStatus.TabIndex = 15;
			this.tbStatus.Text = "APPLICATION IS UNREGISTERED";
			// 
			// frmMain
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(400, 238);
			this.Controls.Add(this.tbStatus);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.panel3);
			this.Controls.Add(this.panel1);
			this.Controls.Add(this.btnClose);
			this.Controls.Add(this.btnRegister);
			this.Controls.Add(this.tbKey);
			this.Controls.Add(this.lbKey);
			this.Controls.Add(this.tbUserInfo);
			this.Controls.Add(this.label1);
			this.Name = "frmMain";
			this.Text = "Test .NET Application";
			this.Load += new System.EventHandler(this.frmMain_Load);
			this.panel1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new frmMain());
		}

		private void ProcessRegistration()
		{
			Int32 ExpYear  = 0;
			Int32 ExpMonth = 0;
			Int32 ExpDay   = 0;

			if (Enigma_IDE.EP_RegLoadAndCheckKey())
			{
				if (Enigma_IDE.EP_RegKeyExpirationDate(ref ExpYear, ref ExpMonth, ref ExpDay))
				{
					tbStatus.Text = string.Format("REGISTERED. Expiration date: {0}/{1}/{2}", ExpDay, ExpMonth, ExpYear);
				}
				else
				{
					tbStatus.Text = "REGISTERED. Key has not expiration!";
				}
			} 
			else
			{
				tbStatus.Text = "APPLICATION IS UNREGISTERED";
			}
		}


		private void btnClose_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void frmMain_Load(object sender, System.EventArgs e)
		{
			ProcessRegistration();
		}

		private void btnRegister_Click(object sender, System.EventArgs e)
		{			
			if (Enigma_IDE.EP_RegCheckAndSaveKey(tbUserInfo.Text , tbKey.Text ))
			{				
				MessageBox.Show("Registration key is valid!\nThanks you for registration!!!", "Registration completed");
			} 
			else
			{
				MessageBox.Show("Registration key is invalid!\nPlease, try again!!!", "Registration incompleted");
			};
			ProcessRegistration();
		}
	}
}
