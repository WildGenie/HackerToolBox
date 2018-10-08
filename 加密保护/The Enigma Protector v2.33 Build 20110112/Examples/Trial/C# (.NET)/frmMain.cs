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
		private System.Windows.Forms.Label lbInfo1;
		private System.Windows.Forms.GroupBox gbTrial;
		private System.Windows.Forms.Label lbExecsTotalInfo;
		private System.Windows.Forms.Label lbExecsLeftInfo;
		private System.Windows.Forms.Label lbExecsTotal;
		private System.Windows.Forms.Label lbExecsLeft;
		private System.Windows.Forms.Label lbExpirationInfo;
		private System.Windows.Forms.Label lbDaysLeft;
		private System.Windows.Forms.Label lbDaysTotal;
		private System.Windows.Forms.Label lbDaysLeftInfo;
		private System.Windows.Forms.Label lbDaysTotalInfo;
		private System.Windows.Forms.Label lbExpiration;
		private System.Windows.Forms.Button btnClose;
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
			this.lbInfo1 = new System.Windows.Forms.Label();
			this.gbTrial = new System.Windows.Forms.GroupBox();
			this.lbExecsTotalInfo = new System.Windows.Forms.Label();
			this.lbExecsLeftInfo = new System.Windows.Forms.Label();
			this.lbExecsTotal = new System.Windows.Forms.Label();
			this.lbExecsLeft = new System.Windows.Forms.Label();
			this.lbExpirationInfo = new System.Windows.Forms.Label();
			this.lbDaysLeft = new System.Windows.Forms.Label();
			this.lbDaysTotal = new System.Windows.Forms.Label();
			this.lbDaysLeftInfo = new System.Windows.Forms.Label();
			this.lbDaysTotalInfo = new System.Windows.Forms.Label();
			this.lbExpiration = new System.Windows.Forms.Label();
			this.btnClose = new System.Windows.Forms.Button();
			this.gbTrial.SuspendLayout();
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
			// lbInfo1
			// 
			this.lbInfo1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lbInfo1.Location = new System.Drawing.Point(128, 32);
			this.lbInfo1.Name = "lbInfo1";
			this.lbInfo1.Size = new System.Drawing.Size(128, 23);
			this.lbInfo1.TabIndex = 1;
			this.lbInfo1.Text = "TRIAL   APPLICATION";
			// 
			// gbTrial
			// 
			this.gbTrial.Controls.Add(this.lbExpiration);
			this.gbTrial.Controls.Add(this.lbDaysLeft);
			this.gbTrial.Controls.Add(this.lbDaysTotal);
			this.gbTrial.Controls.Add(this.lbDaysLeftInfo);
			this.gbTrial.Controls.Add(this.lbDaysTotalInfo);
			this.gbTrial.Controls.Add(this.lbExpirationInfo);
			this.gbTrial.Controls.Add(this.lbExecsLeft);
			this.gbTrial.Controls.Add(this.lbExecsTotal);
			this.gbTrial.Controls.Add(this.lbExecsLeftInfo);
			this.gbTrial.Controls.Add(this.lbExecsTotalInfo);
			this.gbTrial.Location = new System.Drawing.Point(8, 56);
			this.gbTrial.Name = "gbTrial";
			this.gbTrial.Size = new System.Drawing.Size(384, 120);
			this.gbTrial.TabIndex = 2;
			this.gbTrial.TabStop = false;
			this.gbTrial.Text = "Trial parameters";
			// 
			// lbExecsTotalInfo
			// 
			this.lbExecsTotalInfo.Location = new System.Drawing.Point(16, 24);
			this.lbExecsTotalInfo.Name = "lbExecsTotalInfo";
			this.lbExecsTotalInfo.Size = new System.Drawing.Size(96, 23);
			this.lbExecsTotalInfo.TabIndex = 0;
			this.lbExecsTotalInfo.Text = "Executions Total:";
			// 
			// lbExecsLeftInfo
			// 
			this.lbExecsLeftInfo.Location = new System.Drawing.Point(16, 48);
			this.lbExecsLeftInfo.Name = "lbExecsLeftInfo";
			this.lbExecsLeftInfo.Size = new System.Drawing.Size(96, 23);
			this.lbExecsLeftInfo.TabIndex = 1;
			this.lbExecsLeftInfo.Text = "Executions Left:";
			// 
			// lbExecsTotal
			// 
			this.lbExecsTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lbExecsTotal.Location = new System.Drawing.Point(112, 24);
			this.lbExecsTotal.Name = "lbExecsTotal";
			this.lbExecsTotal.Size = new System.Drawing.Size(64, 23);
			this.lbExecsTotal.TabIndex = 2;
			this.lbExecsTotal.Text = "XXX";
			// 
			// lbExecsLeft
			// 
			this.lbExecsLeft.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lbExecsLeft.Location = new System.Drawing.Point(112, 48);
			this.lbExecsLeft.Name = "lbExecsLeft";
			this.lbExecsLeft.Size = new System.Drawing.Size(64, 23);
			this.lbExecsLeft.TabIndex = 3;
			this.lbExecsLeft.Text = "XXX";
			// 
			// lbExpirationInfo
			// 
			this.lbExpirationInfo.Location = new System.Drawing.Point(104, 88);
			this.lbExpirationInfo.Name = "lbExpirationInfo";
			this.lbExpirationInfo.Size = new System.Drawing.Size(88, 23);
			this.lbExpirationInfo.TabIndex = 4;
			this.lbExpirationInfo.Text = "Expiration date:";
			// 
			// lbDaysLeft
			// 
			this.lbDaysLeft.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lbDaysLeft.Location = new System.Drawing.Point(272, 48);
			this.lbDaysLeft.Name = "lbDaysLeft";
			this.lbDaysLeft.Size = new System.Drawing.Size(64, 23);
			this.lbDaysLeft.TabIndex = 8;
			this.lbDaysLeft.Text = "XXX";
			// 
			// lbDaysTotal
			// 
			this.lbDaysTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lbDaysTotal.Location = new System.Drawing.Point(272, 24);
			this.lbDaysTotal.Name = "lbDaysTotal";
			this.lbDaysTotal.Size = new System.Drawing.Size(64, 23);
			this.lbDaysTotal.TabIndex = 7;
			this.lbDaysTotal.Text = "XXX";
			// 
			// lbDaysLeftInfo
			// 
			this.lbDaysLeftInfo.Location = new System.Drawing.Point(200, 48);
			this.lbDaysLeftInfo.Name = "lbDaysLeftInfo";
			this.lbDaysLeftInfo.Size = new System.Drawing.Size(64, 23);
			this.lbDaysLeftInfo.TabIndex = 6;
			this.lbDaysLeftInfo.Text = "Days Left:";
			// 
			// lbDaysTotalInfo
			// 
			this.lbDaysTotalInfo.Location = new System.Drawing.Point(200, 24);
			this.lbDaysTotalInfo.Name = "lbDaysTotalInfo";
			this.lbDaysTotalInfo.Size = new System.Drawing.Size(64, 23);
			this.lbDaysTotalInfo.TabIndex = 5;
			this.lbDaysTotalInfo.Text = "Days Total:";
			// 
			// lbExpiration
			// 
			this.lbExpiration.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(204)));
			this.lbExpiration.Location = new System.Drawing.Point(208, 88);
			this.lbExpiration.Name = "lbExpiration";
			this.lbExpiration.TabIndex = 9;
			this.lbExpiration.Text = "XXX";
			// 
			// btnClose
			// 
			this.btnClose.Location = new System.Drawing.Point(160, 184);
			this.btnClose.Name = "btnClose";
			this.btnClose.TabIndex = 3;
			this.btnClose.Text = "Close";
			this.btnClose.Click += new System.EventHandler(this.btnClose_Click_1);
			// 
			// frmMain
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(400, 214);
			this.Controls.Add(this.btnClose);
			this.Controls.Add(this.gbTrial);
			this.Controls.Add(this.lbInfo1);
			this.Controls.Add(this.lbInfo);
			this.Name = "frmMain";
			this.Text = "Test .NET Application";
			this.Load += new System.EventHandler(this.frmMain_Load);
			this.gbTrial.ResumeLayout(false);
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

		private void btnClose_Click_1(object sender, System.EventArgs e)
		{
			this.Close ();
		}

		private void frmMain_Load(object sender, System.EventArgs e)
		{
			Int32 ExecsTotal = 0;
			Int32 ExecsLeft  = 0;
			Int32 DaysTotal  = 0;
			Int32 DaysLeft   = 0;
			Int32 ExpYear    = 0;
			Int32 ExpMonth   = 0;
			Int32 ExpDay     = 0;

			Enigma_IDE.EP_TrialExecutions(ref ExecsTotal, ref ExecsLeft);
			Enigma_IDE.EP_TrialDays(ref DaysTotal , ref DaysLeft);
			Enigma_IDE.EP_TrialExpirationDate(ref ExpYear, ref ExpMonth, ref ExpDay);

			lbExecsTotal.Text = string.Format("{0}", ExecsTotal);
			lbExecsLeft.Text = string.Format("{0}", ExecsLeft);
			lbDaysTotal.Text = string.Format("{0}", DaysTotal);
			lbDaysLeft.Text = string.Format("{0}", DaysLeft);
			lbExpiration.Text = string.Format("{0}/{1}/{2}", ExpDay, ExpMonth, ExpYear);
		}
	}
}
