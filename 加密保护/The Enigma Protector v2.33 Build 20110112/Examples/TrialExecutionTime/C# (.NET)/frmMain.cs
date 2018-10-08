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
		private System.Windows.Forms.FontDialog fontDialog1;
		private System.Windows.Forms.ColorDialog colorDialog1;
		private System.Windows.Forms.PrintDialog printDialog1;
		private System.Windows.Forms.Timer Timer;
		private System.Windows.Forms.Label lbSystemTime;
		private System.Windows.Forms.TextBox tbSystemTime;
		private System.Windows.Forms.TextBox tbExecutionTime;
		private System.Windows.Forms.Label lbExecutionTime;
		private System.Windows.Forms.Button btnClose;
		private System.ComponentModel.IContainer components;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Label lbStatus;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox tbStatus;
		private System.Windows.Forms.TextBox tbTotal;
		private System.Windows.Forms.TextBox tbLeft;

		private Int32 counter = 0;

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
			this.components = new System.ComponentModel.Container();
			this.fontDialog1 = new System.Windows.Forms.FontDialog();
			this.colorDialog1 = new System.Windows.Forms.ColorDialog();
			this.printDialog1 = new System.Windows.Forms.PrintDialog();
			this.Timer = new System.Windows.Forms.Timer(this.components);
			this.lbSystemTime = new System.Windows.Forms.Label();
			this.tbSystemTime = new System.Windows.Forms.TextBox();
			this.tbExecutionTime = new System.Windows.Forms.TextBox();
			this.lbExecutionTime = new System.Windows.Forms.Label();
			this.btnClose = new System.Windows.Forms.Button();
			this.panel1 = new System.Windows.Forms.Panel();
			this.tbStatus = new System.Windows.Forms.TextBox();
			this.tbTotal = new System.Windows.Forms.TextBox();
			this.tbLeft = new System.Windows.Forms.TextBox();
			this.lbStatus = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// Timer
			// 
			this.Timer.Enabled = true;
			this.Timer.Interval = 1000;
			this.Timer.Tick += new System.EventHandler(this.timer1_Tick);
			// 
			// lbSystemTime
			// 
			this.lbSystemTime.Location = new System.Drawing.Point(8, 8);
			this.lbSystemTime.Name = "lbSystemTime";
			this.lbSystemTime.Size = new System.Drawing.Size(100, 16);
			this.lbSystemTime.TabIndex = 0;
			this.lbSystemTime.Text = "System time:";
			// 
			// tbSystemTime
			// 
			this.tbSystemTime.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.tbSystemTime.Location = new System.Drawing.Point(8, 24);
			this.tbSystemTime.Name = "tbSystemTime";
			this.tbSystemTime.Size = new System.Drawing.Size(280, 29);
			this.tbSystemTime.TabIndex = 1;
			this.tbSystemTime.Text = "";
			// 
			// tbExecutionTime
			// 
			this.tbExecutionTime.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.tbExecutionTime.Location = new System.Drawing.Point(8, 80);
			this.tbExecutionTime.Name = "tbExecutionTime";
			this.tbExecutionTime.Size = new System.Drawing.Size(280, 29);
			this.tbExecutionTime.TabIndex = 3;
			this.tbExecutionTime.Text = "";
			// 
			// lbExecutionTime
			// 
			this.lbExecutionTime.Location = new System.Drawing.Point(8, 64);
			this.lbExecutionTime.Name = "lbExecutionTime";
			this.lbExecutionTime.Size = new System.Drawing.Size(100, 16);
			this.lbExecutionTime.TabIndex = 2;
			this.lbExecutionTime.Text = "Execution time:";
			// 
			// btnClose
			// 
			this.btnClose.Location = new System.Drawing.Point(112, 232);
			this.btnClose.Name = "btnClose";
			this.btnClose.TabIndex = 4;
			this.btnClose.Text = "Close";
			this.btnClose.Click += new System.EventHandler(this.button1_Click);
			// 
			// panel1
			// 
			this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.panel1.Location = new System.Drawing.Point(8, 120);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(280, 4);
			this.panel1.TabIndex = 5;
			// 
			// tbStatus
			// 
			this.tbStatus.Location = new System.Drawing.Point(112, 136);
			this.tbStatus.Name = "tbStatus";
			this.tbStatus.Size = new System.Drawing.Size(176, 20);
			this.tbStatus.TabIndex = 6;
			this.tbStatus.Text = "";
			// 
			// tbTotal
			// 
			this.tbTotal.Location = new System.Drawing.Point(112, 168);
			this.tbTotal.Name = "tbTotal";
			this.tbTotal.Size = new System.Drawing.Size(176, 20);
			this.tbTotal.TabIndex = 7;
			this.tbTotal.Text = "";
			// 
			// tbLeft
			// 
			this.tbLeft.Location = new System.Drawing.Point(112, 200);
			this.tbLeft.Name = "tbLeft";
			this.tbLeft.Size = new System.Drawing.Size(176, 20);
			this.tbLeft.TabIndex = 8;
			this.tbLeft.Text = "";
			// 
			// lbStatus
			// 
			this.lbStatus.Location = new System.Drawing.Point(8, 136);
			this.lbStatus.Name = "lbStatus";
			this.lbStatus.Size = new System.Drawing.Size(88, 23);
			this.lbStatus.TabIndex = 9;
			this.lbStatus.Text = "Status";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 168);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(88, 23);
			this.label2.TabIndex = 10;
			this.label2.Text = "Total Minutes";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(8, 200);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(88, 23);
			this.label3.TabIndex = 11;
			this.label3.Text = "Left Minutes";
			// 
			// frmMain
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(296, 262);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.lbStatus);
			this.Controls.Add(this.tbLeft);
			this.Controls.Add(this.tbTotal);
			this.Controls.Add(this.tbStatus);
			this.Controls.Add(this.panel1);
			this.Controls.Add(this.btnClose);
			this.Controls.Add(this.tbExecutionTime);
			this.Controls.Add(this.lbExecutionTime);
			this.Controls.Add(this.tbSystemTime);
			this.Controls.Add(this.lbSystemTime);
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

		private void frmMain_Load(object sender, System.EventArgs e)
		{
		
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			this.Close();
		}

		private void timer1_Tick(object sender, System.EventArgs e)
		{			
			Int32 MinTotal = 0;
			Int32 MinLeft  = 0;

			// Set system time
			tbSystemTime.Text = string.Format("{0:D2}:{1:D2}:{2:D2}", DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
			// Incease local execution counter			
			counter += 1000;
			// Set execution time
			tbExecutionTime.Text = string.Format("{0:D2}:{1:D2}:{2:D2}", counter / (60 * 60 * 1000) % 24, counter / (60 * 1000) % 60, counter / 1000 % 60);
			if (Enigma_IDE.EP_TrialExecutionTime(ref MinTotal, ref MinLeft))
			{
				tbStatus.Text = "OK";
				tbTotal.Text = string.Format ("{0}", MinTotal);
				tbLeft.Text = string.Format ("{0}", MinLeft);
			} 
			else
			{
				tbStatus.Text = "UNUSED";
			}
		}
	}
}
