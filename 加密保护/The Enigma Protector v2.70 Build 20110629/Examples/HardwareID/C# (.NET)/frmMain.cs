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
		private System.Windows.Forms.Label lbInfo;
		private System.Windows.Forms.Label lbHardware;
		private System.Windows.Forms.TextBox tbHardware;
		private System.Windows.Forms.Button btnCopy;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox tbUserInfo;
		private System.Windows.Forms.Label lbKey;
		private System.Windows.Forms.TextBox tbKey;
		private System.Windows.Forms.Button btnRegister;
		private System.Windows.Forms.Button btnClose;
		private System.Windows.Forms.Label lbRegInfo;
		private System.Windows.Forms.Label lbRegName;
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
			this.lbInfo = new System.Windows.Forms.Label();
			this.lbHardware = new System.Windows.Forms.Label();
			this.tbHardware = new System.Windows.Forms.TextBox();
			this.btnCopy = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.tbUserInfo = new System.Windows.Forms.TextBox();
			this.lbKey = new System.Windows.Forms.Label();
			this.tbKey = new System.Windows.Forms.TextBox();
			this.btnRegister = new System.Windows.Forms.Button();
			this.btnClose = new System.Windows.Forms.Button();
			this.lbRegInfo = new System.Windows.Forms.Label();
			this.lbRegName = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// lbInfo
			// 
			this.lbInfo.Location = new System.Drawing.Point(8, 8);
			this.lbInfo.Name = "lbInfo";
			this.lbInfo.Size = new System.Drawing.Size(400, 16);
			this.lbInfo.TabIndex = 0;
			this.lbInfo.Text = "This example shows you how to work with Enigma API under .NET application.";
			// 
			// lbHardware
			// 
			this.lbHardware.Location = new System.Drawing.Point(8, 32);
			this.lbHardware.Name = "lbHardware";
			this.lbHardware.Size = new System.Drawing.Size(88, 16);
			this.lbHardware.TabIndex = 1;
			this.lbHardware.Text = "PC Hardware ID";
			this.lbHardware.Click += new System.EventHandler(this.lbHardware_Click);
			// 
			// tbHardware
			// 
			this.tbHardware.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.tbHardware.Location = new System.Drawing.Point(8, 48);
			this.tbHardware.Name = "tbHardware";
			this.tbHardware.ReadOnly = true;
			this.tbHardware.Size = new System.Drawing.Size(264, 20);
			this.tbHardware.TabIndex = 2;
			this.tbHardware.Text = "";
			// 
			// btnCopy
			// 
			this.btnCopy.Location = new System.Drawing.Point(288, 48);
			this.btnCopy.Name = "btnCopy";
			this.btnCopy.Size = new System.Drawing.Size(104, 20);
			this.btnCopy.TabIndex = 3;
			this.btnCopy.Text = "Copy to clipboard";
			this.btnCopy.Click += new System.EventHandler(this.btnCopy_Click);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 80);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(112, 16);
			this.label1.TabIndex = 4;
			this.label1.Text = "User information";
			// 
			// tbUserInfo
			// 
			this.tbUserInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.tbUserInfo.Location = new System.Drawing.Point(8, 96);
			this.tbUserInfo.Name = "tbUserInfo";
			this.tbUserInfo.Size = new System.Drawing.Size(384, 20);
			this.tbUserInfo.TabIndex = 5;
			this.tbUserInfo.Text = "";
			// 
			// lbKey
			// 
			this.lbKey.Location = new System.Drawing.Point(8, 128);
			this.lbKey.Name = "lbKey";
			this.lbKey.Size = new System.Drawing.Size(88, 16);
			this.lbKey.TabIndex = 6;
			this.lbKey.Text = "Registration key";
			// 
			// tbKey
			// 
			this.tbKey.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.tbKey.Location = new System.Drawing.Point(8, 144);
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
			// lbRegInfo
			// 
			this.lbRegInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lbRegInfo.Location = new System.Drawing.Point(16, 240);
			this.lbRegInfo.Name = "lbRegInfo";
			this.lbRegInfo.Size = new System.Drawing.Size(160, 16);
			this.lbRegInfo.TabIndex = 10;
			this.lbRegInfo.Text = "This copy is registered to:";
			// 
			// lbRegName
			// 
			this.lbRegName.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lbRegName.ForeColor = System.Drawing.Color.Red;
			this.lbRegName.Location = new System.Drawing.Point(16, 256);
			this.lbRegName.Name = "lbRegName";
			this.lbRegName.Size = new System.Drawing.Size(376, 16);
			this.lbRegName.TabIndex = 11;
			this.lbRegName.Text = "UNREGISTERED";
			this.lbRegName.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			// 
			// frmMain
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(400, 278);
			this.Controls.Add(this.lbRegName);
			this.Controls.Add(this.lbRegInfo);
			this.Controls.Add(this.btnClose);
			this.Controls.Add(this.btnRegister);
			this.Controls.Add(this.tbKey);
			this.Controls.Add(this.lbKey);
			this.Controls.Add(this.tbUserInfo);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.btnCopy);
			this.Controls.Add(this.tbHardware);
			this.Controls.Add(this.lbHardware);
			this.Controls.Add(this.lbInfo);
			this.Name = "frmMain";
			this.Text = "Test .NET Application";
			this.Load += new System.EventHandler(this.frmMain_Load);
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

		private void OnRegistration(bool registered)
		{
			if (registered) 
			{
				string sName = ""; // Create variable for registration name
				string sKey  = ""; // Create variable for registration key
				Enigma_IDE.EP_RegLoadKey (ref sName, ref sKey); // Load registration information
				lbRegName.Text = sName; // Set control text to registred user information
			} 
			else
			{
				lbRegName.Text = "UNREGISTERED"; // Unregistered text
			}
		}

		private void lbHardware_Click(object sender, System.EventArgs e)
		{
		
		}

		private void btnClose_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void btnCopy_Click(object sender, System.EventArgs e)
		{
			tbHardware.Copy();
		}

		private void frmMain_Load(object sender, System.EventArgs e)
		{
			tbHardware.Text = Enigma_IDE.EP_RegHardwareID();
			OnRegistration(Enigma_IDE.EP_RegLoadAndCheckKey());
		}

		private void btnRegister_Click(object sender, System.EventArgs e)
		{
			if (Enigma_IDE.EP_RegCheckAndSaveKey(tbUserInfo.Text , tbKey.Text ))
			{
				OnRegistration(true);
				MessageBox.Show("Registration key is valid!\nThanks you for registration!!!", "Registration completed");
			} 
			else
			{
				OnRegistration(false);
				MessageBox.Show("Registration key is invalid!\nPlease, try again!!!", "Registration incompleted");
			}
		}
	}
}
