using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Text;

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
		private System.Windows.Forms.GroupBox gbSections;
		private System.Windows.Forms.CheckBox cbSection13;
		private System.Windows.Forms.CheckBox cbSection12;
		private System.Windows.Forms.CheckBox cbSection11;
		private System.Windows.Forms.CheckBox cbSection10;
		private System.Windows.Forms.CheckBox cbSection9;
		private System.Windows.Forms.CheckBox cbSection8;
		private System.Windows.Forms.CheckBox cbSection7;
		private System.Windows.Forms.CheckBox cbSection6;
		private System.Windows.Forms.CheckBox cbSection5;
		private System.Windows.Forms.CheckBox cbSection4;
		private System.Windows.Forms.CheckBox cbSection3;
		private System.Windows.Forms.CheckBox cbSection2;
		private System.Windows.Forms.CheckBox cbSection1;
		private System.Windows.Forms.Label lbUserInfo;
		private System.Windows.Forms.TextBox tbUserInfo;
		private System.Windows.Forms.CheckBox cbHardware;
		private System.Windows.Forms.TextBox tbHardware;
		private System.Windows.Forms.CheckBox cbExpiration;
		private System.Windows.Forms.CheckBox cbSection16;
		private System.Windows.Forms.CheckBox cbSection15;
		private System.Windows.Forms.CheckBox cbSection14;
		private System.Windows.Forms.Button btnGenerate;
		private System.Windows.Forms.Button btnGenerateFP;
		private System.Windows.Forms.Button btnClose;
		private System.Windows.Forms.TextBox tbKey;
		private System.Windows.Forms.DateTimePicker dtpExpiration;
        private GroupBox groupBox1;
        private Button btnVerify;
        private ComboBox cbKeyMode;
        private Label label1;
        private Button btnVerifyFP;
        private CheckBox cbHyphens;
        private ComboBox cbKeyBase;
        private Label label2;
        private GroupBox groupBox2;
        private CheckBox cbRegisterBefore;
        private DateTimePicker dtpRegisterBefore;
        private CheckBox cbRegisterAfter;
        private DateTimePicker dtpRegisterAfter;
        private ComboBox comCountries;
        private CheckBox cbCountry;
        private NumericUpDown udGlobalTime;
        private NumericUpDown udRuntime;
        private NumericUpDown udDays;
        private NumericUpDown udExecutions;
        private CheckBox cbGlobalTime;
        private CheckBox cbRuntime;
        private CheckBox cbDays;
        private CheckBox cbExecutions;
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
            this.fontDialog1 = new System.Windows.Forms.FontDialog();
            this.colorDialog1 = new System.Windows.Forms.ColorDialog();
            this.printDialog1 = new System.Windows.Forms.PrintDialog();
            this.gbSections = new System.Windows.Forms.GroupBox();
            this.cbSection16 = new System.Windows.Forms.CheckBox();
            this.cbSection15 = new System.Windows.Forms.CheckBox();
            this.cbSection14 = new System.Windows.Forms.CheckBox();
            this.cbSection13 = new System.Windows.Forms.CheckBox();
            this.cbSection12 = new System.Windows.Forms.CheckBox();
            this.cbSection11 = new System.Windows.Forms.CheckBox();
            this.cbSection10 = new System.Windows.Forms.CheckBox();
            this.cbSection9 = new System.Windows.Forms.CheckBox();
            this.cbSection8 = new System.Windows.Forms.CheckBox();
            this.cbSection7 = new System.Windows.Forms.CheckBox();
            this.cbSection6 = new System.Windows.Forms.CheckBox();
            this.cbSection5 = new System.Windows.Forms.CheckBox();
            this.cbSection4 = new System.Windows.Forms.CheckBox();
            this.cbSection3 = new System.Windows.Forms.CheckBox();
            this.cbSection2 = new System.Windows.Forms.CheckBox();
            this.cbSection1 = new System.Windows.Forms.CheckBox();
            this.lbUserInfo = new System.Windows.Forms.Label();
            this.tbUserInfo = new System.Windows.Forms.TextBox();
            this.cbHardware = new System.Windows.Forms.CheckBox();
            this.tbHardware = new System.Windows.Forms.TextBox();
            this.cbExpiration = new System.Windows.Forms.CheckBox();
            this.btnGenerate = new System.Windows.Forms.Button();
            this.btnGenerateFP = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.tbKey = new System.Windows.Forms.TextBox();
            this.dtpExpiration = new System.Windows.Forms.DateTimePicker();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbKeyBase = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cbHyphens = new System.Windows.Forms.CheckBox();
            this.cbKeyMode = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnVerify = new System.Windows.Forms.Button();
            this.btnVerifyFP = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.comCountries = new System.Windows.Forms.ComboBox();
            this.cbCountry = new System.Windows.Forms.CheckBox();
            this.udGlobalTime = new System.Windows.Forms.NumericUpDown();
            this.udRuntime = new System.Windows.Forms.NumericUpDown();
            this.udDays = new System.Windows.Forms.NumericUpDown();
            this.udExecutions = new System.Windows.Forms.NumericUpDown();
            this.cbGlobalTime = new System.Windows.Forms.CheckBox();
            this.cbRuntime = new System.Windows.Forms.CheckBox();
            this.cbDays = new System.Windows.Forms.CheckBox();
            this.cbExecutions = new System.Windows.Forms.CheckBox();
            this.cbRegisterBefore = new System.Windows.Forms.CheckBox();
            this.dtpRegisterBefore = new System.Windows.Forms.DateTimePicker();
            this.cbRegisterAfter = new System.Windows.Forms.CheckBox();
            this.dtpRegisterAfter = new System.Windows.Forms.DateTimePicker();
            this.gbSections.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.udGlobalTime)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.udRuntime)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.udDays)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.udExecutions)).BeginInit();
            this.SuspendLayout();
            // 
            // gbSections
            // 
            this.gbSections.Controls.Add(this.cbSection16);
            this.gbSections.Controls.Add(this.cbSection15);
            this.gbSections.Controls.Add(this.cbSection14);
            this.gbSections.Controls.Add(this.cbSection13);
            this.gbSections.Controls.Add(this.cbSection12);
            this.gbSections.Controls.Add(this.cbSection11);
            this.gbSections.Controls.Add(this.cbSection10);
            this.gbSections.Controls.Add(this.cbSection9);
            this.gbSections.Controls.Add(this.cbSection8);
            this.gbSections.Controls.Add(this.cbSection7);
            this.gbSections.Controls.Add(this.cbSection6);
            this.gbSections.Controls.Add(this.cbSection5);
            this.gbSections.Controls.Add(this.cbSection4);
            this.gbSections.Controls.Add(this.cbSection3);
            this.gbSections.Controls.Add(this.cbSection2);
            this.gbSections.Controls.Add(this.cbSection1);
            this.gbSections.Location = new System.Drawing.Point(430, 24);
            this.gbSections.Name = "gbSections";
            this.gbSections.Size = new System.Drawing.Size(170, 233);
            this.gbSections.TabIndex = 0;
            this.gbSections.TabStop = false;
            this.gbSections.Text = "Crypt Sections";
            // 
            // cbSection16
            // 
            this.cbSection16.AutoSize = true;
            this.cbSection16.Location = new System.Drawing.Point(85, 191);
            this.cbSection16.Name = "cbSection16";
            this.cbSection16.Size = new System.Drawing.Size(77, 17);
            this.cbSection16.TabIndex = 15;
            this.cbSection16.Text = "Section 16";
            // 
            // cbSection15
            // 
            this.cbSection15.AutoSize = true;
            this.cbSection15.Location = new System.Drawing.Point(85, 167);
            this.cbSection15.Name = "cbSection15";
            this.cbSection15.Size = new System.Drawing.Size(77, 17);
            this.cbSection15.TabIndex = 14;
            this.cbSection15.Text = "Section 15";
            // 
            // cbSection14
            // 
            this.cbSection14.AutoSize = true;
            this.cbSection14.Location = new System.Drawing.Point(85, 143);
            this.cbSection14.Name = "cbSection14";
            this.cbSection14.Size = new System.Drawing.Size(77, 17);
            this.cbSection14.TabIndex = 13;
            this.cbSection14.Text = "Section 14";
            // 
            // cbSection13
            // 
            this.cbSection13.AutoSize = true;
            this.cbSection13.Location = new System.Drawing.Point(85, 119);
            this.cbSection13.Name = "cbSection13";
            this.cbSection13.Size = new System.Drawing.Size(77, 17);
            this.cbSection13.TabIndex = 12;
            this.cbSection13.Text = "Section 13";
            // 
            // cbSection12
            // 
            this.cbSection12.AutoSize = true;
            this.cbSection12.Location = new System.Drawing.Point(85, 96);
            this.cbSection12.Name = "cbSection12";
            this.cbSection12.Size = new System.Drawing.Size(77, 17);
            this.cbSection12.TabIndex = 11;
            this.cbSection12.Text = "Section 12";
            // 
            // cbSection11
            // 
            this.cbSection11.AutoSize = true;
            this.cbSection11.Location = new System.Drawing.Point(85, 72);
            this.cbSection11.Name = "cbSection11";
            this.cbSection11.Size = new System.Drawing.Size(77, 17);
            this.cbSection11.TabIndex = 10;
            this.cbSection11.Text = "Section 11";
            // 
            // cbSection10
            // 
            this.cbSection10.AutoSize = true;
            this.cbSection10.Location = new System.Drawing.Point(85, 48);
            this.cbSection10.Name = "cbSection10";
            this.cbSection10.Size = new System.Drawing.Size(77, 17);
            this.cbSection10.TabIndex = 9;
            this.cbSection10.Text = "Section 10";
            // 
            // cbSection9
            // 
            this.cbSection9.AutoSize = true;
            this.cbSection9.Location = new System.Drawing.Point(85, 24);
            this.cbSection9.Name = "cbSection9";
            this.cbSection9.Size = new System.Drawing.Size(71, 17);
            this.cbSection9.TabIndex = 8;
            this.cbSection9.Text = "Section 9";
            // 
            // cbSection8
            // 
            this.cbSection8.AutoSize = true;
            this.cbSection8.Location = new System.Drawing.Point(8, 191);
            this.cbSection8.Name = "cbSection8";
            this.cbSection8.Size = new System.Drawing.Size(71, 17);
            this.cbSection8.TabIndex = 7;
            this.cbSection8.Text = "Section 8";
            // 
            // cbSection7
            // 
            this.cbSection7.AutoSize = true;
            this.cbSection7.Location = new System.Drawing.Point(8, 167);
            this.cbSection7.Name = "cbSection7";
            this.cbSection7.Size = new System.Drawing.Size(71, 17);
            this.cbSection7.TabIndex = 6;
            this.cbSection7.Text = "Section 7";
            // 
            // cbSection6
            // 
            this.cbSection6.AutoSize = true;
            this.cbSection6.Location = new System.Drawing.Point(8, 143);
            this.cbSection6.Name = "cbSection6";
            this.cbSection6.Size = new System.Drawing.Size(71, 17);
            this.cbSection6.TabIndex = 5;
            this.cbSection6.Text = "Section 6";
            // 
            // cbSection5
            // 
            this.cbSection5.AutoSize = true;
            this.cbSection5.Location = new System.Drawing.Point(8, 119);
            this.cbSection5.Name = "cbSection5";
            this.cbSection5.Size = new System.Drawing.Size(71, 17);
            this.cbSection5.TabIndex = 4;
            this.cbSection5.Text = "Section 5";
            // 
            // cbSection4
            // 
            this.cbSection4.AutoSize = true;
            this.cbSection4.Location = new System.Drawing.Point(8, 96);
            this.cbSection4.Name = "cbSection4";
            this.cbSection4.Size = new System.Drawing.Size(71, 17);
            this.cbSection4.TabIndex = 3;
            this.cbSection4.Text = "Section 4";
            // 
            // cbSection3
            // 
            this.cbSection3.AutoSize = true;
            this.cbSection3.Location = new System.Drawing.Point(8, 72);
            this.cbSection3.Name = "cbSection3";
            this.cbSection3.Size = new System.Drawing.Size(71, 17);
            this.cbSection3.TabIndex = 2;
            this.cbSection3.Text = "Section 3";
            // 
            // cbSection2
            // 
            this.cbSection2.AutoSize = true;
            this.cbSection2.Location = new System.Drawing.Point(8, 48);
            this.cbSection2.Name = "cbSection2";
            this.cbSection2.Size = new System.Drawing.Size(71, 17);
            this.cbSection2.TabIndex = 1;
            this.cbSection2.Text = "Section 2";
            // 
            // cbSection1
            // 
            this.cbSection1.AutoSize = true;
            this.cbSection1.Location = new System.Drawing.Point(8, 24);
            this.cbSection1.Name = "cbSection1";
            this.cbSection1.Size = new System.Drawing.Size(71, 17);
            this.cbSection1.TabIndex = 0;
            this.cbSection1.Text = "Section 1";
            // 
            // lbUserInfo
            // 
            this.lbUserInfo.Location = new System.Drawing.Point(8, 8);
            this.lbUserInfo.Name = "lbUserInfo";
            this.lbUserInfo.Size = new System.Drawing.Size(100, 16);
            this.lbUserInfo.TabIndex = 1;
            this.lbUserInfo.Text = "User information";
            // 
            // tbUserInfo
            // 
            this.tbUserInfo.Location = new System.Drawing.Point(8, 24);
            this.tbUserInfo.Name = "tbUserInfo";
            this.tbUserInfo.Size = new System.Drawing.Size(416, 20);
            this.tbUserInfo.TabIndex = 2;
            // 
            // cbHardware
            // 
            this.cbHardware.AutoSize = true;
            this.cbHardware.Location = new System.Drawing.Point(10, 112);
            this.cbHardware.Name = "cbHardware";
            this.cbHardware.Size = new System.Drawing.Size(86, 17);
            this.cbHardware.TabIndex = 3;
            this.cbHardware.Text = "Hardware ID";
            this.cbHardware.CheckedChanged += new System.EventHandler(this.cbHardware_CheckedChanged);
            // 
            // tbHardware
            // 
            this.tbHardware.Enabled = false;
            this.tbHardware.Location = new System.Drawing.Point(114, 110);
            this.tbHardware.Name = "tbHardware";
            this.tbHardware.Size = new System.Drawing.Size(289, 20);
            this.tbHardware.TabIndex = 4;
            // 
            // cbExpiration
            // 
            this.cbExpiration.AutoSize = true;
            this.cbExpiration.Location = new System.Drawing.Point(10, 19);
            this.cbExpiration.Name = "cbExpiration";
            this.cbExpiration.Size = new System.Drawing.Size(98, 17);
            this.cbExpiration.TabIndex = 5;
            this.cbExpiration.Text = "Expiration Date";
            this.cbExpiration.CheckedChanged += new System.EventHandler(this.cbExpiration_CheckedChanged);
            // 
            // btnGenerate
            // 
            this.btnGenerate.Location = new System.Drawing.Point(8, 263);
            this.btnGenerate.Name = "btnGenerate";
            this.btnGenerate.Size = new System.Drawing.Size(109, 23);
            this.btnGenerate.TabIndex = 7;
            this.btnGenerate.Text = "Generate";
            this.btnGenerate.Click += new System.EventHandler(this.btnGenerate_Click);
            // 
            // btnGenerateFP
            // 
            this.btnGenerateFP.Location = new System.Drawing.Point(123, 263);
            this.btnGenerateFP.Name = "btnGenerateFP";
            this.btnGenerateFP.Size = new System.Drawing.Size(134, 23);
            this.btnGenerateFP.TabIndex = 8;
            this.btnGenerateFP.Text = "Generate from project";
            this.btnGenerateFP.Click += new System.EventHandler(this.btnGenerateFP_Click);
            // 
            // btnClose
            // 
            this.btnClose.Location = new System.Drawing.Point(491, 293);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(109, 87);
            this.btnClose.TabIndex = 9;
            this.btnClose.Text = "Close";
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click_1);
            // 
            // tbKey
            // 
            this.tbKey.Location = new System.Drawing.Point(8, 292);
            this.tbKey.Multiline = true;
            this.tbKey.Name = "tbKey";
            this.tbKey.Size = new System.Drawing.Size(477, 88);
            this.tbKey.TabIndex = 10;
            // 
            // dtpExpiration
            // 
            this.dtpExpiration.CustomFormat = "";
            this.dtpExpiration.Enabled = false;
            this.dtpExpiration.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpExpiration.Location = new System.Drawing.Point(114, 16);
            this.dtpExpiration.Name = "dtpExpiration";
            this.dtpExpiration.Size = new System.Drawing.Size(147, 20);
            this.dtpExpiration.TabIndex = 11;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.cbKeyBase);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.cbHyphens);
            this.groupBox1.Controls.Add(this.cbKeyMode);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(8, 50);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(416, 65);
            this.groupBox1.TabIndex = 12;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Key type";
            // 
            // cbKeyBase
            // 
            this.cbKeyBase.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbKeyBase.FormattingEnabled = true;
            this.cbKeyBase.Items.AddRange(new object[] {
            "Base 2",
            "Base 8",
            "Base 16",
            "Base 32",
            "Base 64"});
            this.cbKeyBase.Location = new System.Drawing.Point(285, 36);
            this.cbKeyBase.Name = "cbKeyBase";
            this.cbKeyBase.Size = new System.Drawing.Size(118, 21);
            this.cbKeyBase.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(282, 20);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(52, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Key Base";
            // 
            // cbHyphens
            // 
            this.cbHyphens.AutoSize = true;
            this.cbHyphens.Location = new System.Drawing.Point(31, 38);
            this.cbHyphens.Name = "cbHyphens";
            this.cbHyphens.Size = new System.Drawing.Size(88, 17);
            this.cbHyphens.TabIndex = 2;
            this.cbHyphens.Text = "Add hyphens";
            this.cbHyphens.UseVisualStyleBackColor = true;
            // 
            // cbKeyMode
            // 
            this.cbKeyMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbKeyMode.FormattingEnabled = true;
            this.cbKeyMode.Items.AddRange(new object[] {
            "~ RSA 512",
            "~ RSA 768",
            "~ RSA 1024",
            "~ RSA 2048",
            "~ RSA 3072",
            "~ RSA 4096"});
            this.cbKeyMode.Location = new System.Drawing.Point(159, 36);
            this.cbKeyMode.Name = "cbKeyMode";
            this.cbKeyMode.Size = new System.Drawing.Size(120, 21);
            this.cbKeyMode.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(156, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Key Mode";
            // 
            // btnVerify
            // 
            this.btnVerify.Location = new System.Drawing.Point(376, 265);
            this.btnVerify.Name = "btnVerify";
            this.btnVerify.Size = new System.Drawing.Size(109, 22);
            this.btnVerify.TabIndex = 13;
            this.btnVerify.Text = "Verify";
            this.btnVerify.UseVisualStyleBackColor = true;
            this.btnVerify.Click += new System.EventHandler(this.btnVerify_Click);
            // 
            // btnVerifyFP
            // 
            this.btnVerifyFP.Location = new System.Drawing.Point(491, 264);
            this.btnVerifyFP.Name = "btnVerifyFP";
            this.btnVerifyFP.Size = new System.Drawing.Size(109, 23);
            this.btnVerifyFP.TabIndex = 14;
            this.btnVerifyFP.Text = "Verify from project";
            this.btnVerifyFP.UseVisualStyleBackColor = true;
            this.btnVerifyFP.Click += new System.EventHandler(this.btnVerifyFP_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.comCountries);
            this.groupBox2.Controls.Add(this.cbCountry);
            this.groupBox2.Controls.Add(this.udGlobalTime);
            this.groupBox2.Controls.Add(this.udRuntime);
            this.groupBox2.Controls.Add(this.udDays);
            this.groupBox2.Controls.Add(this.udExecutions);
            this.groupBox2.Controls.Add(this.cbGlobalTime);
            this.groupBox2.Controls.Add(this.cbRuntime);
            this.groupBox2.Controls.Add(this.cbDays);
            this.groupBox2.Controls.Add(this.cbExecutions);
            this.groupBox2.Controls.Add(this.cbHardware);
            this.groupBox2.Controls.Add(this.tbHardware);
            this.groupBox2.Controls.Add(this.cbRegisterBefore);
            this.groupBox2.Controls.Add(this.dtpRegisterBefore);
            this.groupBox2.Controls.Add(this.cbRegisterAfter);
            this.groupBox2.Controls.Add(this.dtpRegisterAfter);
            this.groupBox2.Controls.Add(this.cbExpiration);
            this.groupBox2.Controls.Add(this.dtpExpiration);
            this.groupBox2.Location = new System.Drawing.Point(8, 121);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(416, 136);
            this.groupBox2.TabIndex = 15;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Key Restrictions";
            // 
            // comCountries
            // 
            this.comCountries.Enabled = false;
            this.comCountries.FormattingEnabled = true;
            this.comCountries.Location = new System.Drawing.Point(114, 86);
            this.comCountries.Name = "comCountries";
            this.comCountries.Size = new System.Drawing.Size(147, 21);
            this.comCountries.TabIndex = 25;
            // 
            // cbCountry
            // 
            this.cbCountry.AutoSize = true;
            this.cbCountry.Location = new System.Drawing.Point(10, 88);
            this.cbCountry.Name = "cbCountry";
            this.cbCountry.Size = new System.Drawing.Size(89, 17);
            this.cbCountry.TabIndex = 24;
            this.cbCountry.Text = "Country Lock";
            this.cbCountry.UseVisualStyleBackColor = true;
            this.cbCountry.CheckedChanged += new System.EventHandler(this.cbCountry_CheckedChanged);
            // 
            // udGlobalTime
            // 
            this.udGlobalTime.Enabled = false;
            this.udGlobalTime.Location = new System.Drawing.Point(351, 87);
            this.udGlobalTime.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.udGlobalTime.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.udGlobalTime.Name = "udGlobalTime";
            this.udGlobalTime.Size = new System.Drawing.Size(52, 20);
            this.udGlobalTime.TabIndex = 23;
            this.udGlobalTime.Value = new decimal(new int[] {
            60,
            0,
            0,
            0});
            // 
            // udRuntime
            // 
            this.udRuntime.Enabled = false;
            this.udRuntime.Location = new System.Drawing.Point(351, 64);
            this.udRuntime.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.udRuntime.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.udRuntime.Name = "udRuntime";
            this.udRuntime.Size = new System.Drawing.Size(52, 20);
            this.udRuntime.TabIndex = 22;
            this.udRuntime.Value = new decimal(new int[] {
            10,
            0,
            0,
            0});
            // 
            // udDays
            // 
            this.udDays.Enabled = false;
            this.udDays.Location = new System.Drawing.Point(351, 41);
            this.udDays.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.udDays.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.udDays.Name = "udDays";
            this.udDays.Size = new System.Drawing.Size(52, 20);
            this.udDays.TabIndex = 21;
            this.udDays.Value = new decimal(new int[] {
            30,
            0,
            0,
            0});
            // 
            // udExecutions
            // 
            this.udExecutions.Enabled = false;
            this.udExecutions.Location = new System.Drawing.Point(351, 18);
            this.udExecutions.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.udExecutions.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.udExecutions.Name = "udExecutions";
            this.udExecutions.Size = new System.Drawing.Size(52, 20);
            this.udExecutions.TabIndex = 20;
            this.udExecutions.Value = new decimal(new int[] {
            100,
            0,
            0,
            0});
            // 
            // cbGlobalTime
            // 
            this.cbGlobalTime.AutoSize = true;
            this.cbGlobalTime.Location = new System.Drawing.Point(267, 90);
            this.cbGlobalTime.Name = "cbGlobalTime";
            this.cbGlobalTime.Size = new System.Drawing.Size(82, 17);
            this.cbGlobalTime.TabIndex = 19;
            this.cbGlobalTime.Text = "Global Time";
            this.cbGlobalTime.UseVisualStyleBackColor = true;
            this.cbGlobalTime.CheckedChanged += new System.EventHandler(this.cbGlobalTime_CheckedChanged);
            // 
            // cbRuntime
            // 
            this.cbRuntime.AutoSize = true;
            this.cbRuntime.Location = new System.Drawing.Point(267, 67);
            this.cbRuntime.Name = "cbRuntime";
            this.cbRuntime.Size = new System.Drawing.Size(65, 17);
            this.cbRuntime.TabIndex = 18;
            this.cbRuntime.Text = "Runtime";
            this.cbRuntime.UseVisualStyleBackColor = true;
            this.cbRuntime.CheckedChanged += new System.EventHandler(this.cbRuntime_CheckedChanged);
            // 
            // cbDays
            // 
            this.cbDays.AutoSize = true;
            this.cbDays.Location = new System.Drawing.Point(267, 44);
            this.cbDays.Name = "cbDays";
            this.cbDays.Size = new System.Drawing.Size(50, 17);
            this.cbDays.TabIndex = 17;
            this.cbDays.Text = "Days";
            this.cbDays.UseVisualStyleBackColor = true;
            this.cbDays.CheckedChanged += new System.EventHandler(this.cbDays_CheckedChanged);
            // 
            // cbExecutions
            // 
            this.cbExecutions.AutoSize = true;
            this.cbExecutions.Location = new System.Drawing.Point(267, 19);
            this.cbExecutions.Name = "cbExecutions";
            this.cbExecutions.Size = new System.Drawing.Size(78, 17);
            this.cbExecutions.TabIndex = 16;
            this.cbExecutions.Text = "Executions";
            this.cbExecutions.UseVisualStyleBackColor = true;
            this.cbExecutions.CheckedChanged += new System.EventHandler(this.cbExecutions_CheckedChanged);
            // 
            // cbRegisterBefore
            // 
            this.cbRegisterBefore.AutoSize = true;
            this.cbRegisterBefore.Location = new System.Drawing.Point(10, 65);
            this.cbRegisterBefore.Name = "cbRegisterBefore";
            this.cbRegisterBefore.Size = new System.Drawing.Size(99, 17);
            this.cbRegisterBefore.TabIndex = 14;
            this.cbRegisterBefore.Text = "Register Before";
            this.cbRegisterBefore.CheckedChanged += new System.EventHandler(this.cbRegisterBefore_CheckedChanged);
            // 
            // dtpRegisterBefore
            // 
            this.dtpRegisterBefore.CustomFormat = "";
            this.dtpRegisterBefore.Enabled = false;
            this.dtpRegisterBefore.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpRegisterBefore.Location = new System.Drawing.Point(114, 62);
            this.dtpRegisterBefore.Name = "dtpRegisterBefore";
            this.dtpRegisterBefore.Size = new System.Drawing.Size(147, 20);
            this.dtpRegisterBefore.TabIndex = 15;
            // 
            // cbRegisterAfter
            // 
            this.cbRegisterAfter.AutoSize = true;
            this.cbRegisterAfter.Location = new System.Drawing.Point(10, 42);
            this.cbRegisterAfter.Name = "cbRegisterAfter";
            this.cbRegisterAfter.Size = new System.Drawing.Size(90, 17);
            this.cbRegisterAfter.TabIndex = 12;
            this.cbRegisterAfter.Text = "Register After";
            this.cbRegisterAfter.CheckedChanged += new System.EventHandler(this.cbRegisterAfter_CheckedChanged);
            // 
            // dtpRegisterAfter
            // 
            this.dtpRegisterAfter.CustomFormat = "";
            this.dtpRegisterAfter.Enabled = false;
            this.dtpRegisterAfter.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpRegisterAfter.Location = new System.Drawing.Point(114, 39);
            this.dtpRegisterAfter.Name = "dtpRegisterAfter";
            this.dtpRegisterAfter.Size = new System.Drawing.Size(147, 20);
            this.dtpRegisterAfter.TabIndex = 13;
            // 
            // frmMain
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(612, 387);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.btnVerifyFP);
            this.Controls.Add(this.btnVerify);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.tbKey);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.btnGenerateFP);
            this.Controls.Add(this.btnGenerate);
            this.Controls.Add(this.tbUserInfo);
            this.Controls.Add(this.lbUserInfo);
            this.Controls.Add(this.gbSections);
            this.Name = "frmMain";
            this.Text = "KeyGen .NET Application";
            this.Load += new System.EventHandler(this.frmMain_Load);
            this.gbSections.ResumeLayout(false);
            this.gbSections.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.udGlobalTime)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.udRuntime)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.udDays)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.udExecutions)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

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

		private void btnClose_Click(object sender, System.EventArgs e)
		{
			this.Close ();
		}

        private void btnGenerate_Click(object sender, System.EventArgs e)
        {
            tbKey.Clear();
            if (tbUserInfo.Text == string.Empty)
            {
                MessageBox.Show("User info field is empty!");
                return;
            }
            Enigma_KeyGen_IDE64.TKeyGenParams kg = new Enigma_KeyGen_IDE64.TKeyGenParams();
            kg.KeyMode = cbKeyMode.SelectedIndex;
            kg.KeyBase = cbKeyBase.SelectedIndex;
            kg.KeyWithHyphens = cbHyphens.Checked;
            switch (kg.KeyMode)
            {
                case Enigma_KeyGen_IDE64.RM_512:
                    {
                        kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC" +
                                       "P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC" +
                                       "WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH" +
                                       "CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8" +
                                       "HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP" +
                                       "SRGDQ742B4742XF4MACRR747YDP5FZZ9D";
                        kg.PrivateKey = "00C98B2SF9UBJA605AJX53GJFXJV8UH4A6PY2L6CV4MAMV7V3ERRVY99Y" +
                                        "72V2P77Z2J3KBPGWR3WXKG5GF9Z6CKXJHY5VUMBTQ66H2MRZPCU00DLFJ" +
                                        "675JTTTNEK00DLFJ675JTTTNEK";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_768:
                    {
                        kg.PublicKey = "0201B810DA4A1ADD4351378790A9813853309AEHRR66KMK99UEPX8C54WQFDZQ5Y96WUCVZYMXBC32SJV7T5SBPR54E" +
                                       "2DBH8UD9RNHTJ9BLJV6NHX52W7PZDDTTJDDGF3YFVL7PJFL8RS8THTFDF" +
                                       "4RY7K3QXLTMXMC8DDSRVRWBVMMP3UYKCDDC7KGL9PG509ACPTRQ4MMUKG" +
                                       "DAUJFFFGSCBFLYK9X9E74M58PW5FG9B9RTLXJQ4STPVCHJTEH8BP557VZ" +
                                       "PQYDBUZJXXJNGVZELFL4UL3LHHE8A645CK593DVWCQBSX4ZCCQ3ST8GCZ" +
                                       "LW2729XK3NT7GST3LMQGXSHLDWCXE09AENVX2QTX3VLT6FWB4JND875XZ" +
                                       "WQ26GW76TV3KVVHK7U489LLPBQ39HUWKMA65U3HKWBDHKBZEB525PHEH2" +
                                       "YQHRZGNJAAYZXMWN8RNZ9T7VMZAJMP2V3S9NXZ9RHL96F7AT3NTMN36V4" +
                                       "ACSFEN4DR6TJR95";
                        kg.PrivateKey = "019VRB95TKY456YC48LBS9FK34YN080VVPDJPPKU6XA9EPLX7HTVN3VST" +
                                        "TNJZFPH4HQAFY58R593KFKSNZ7WEZBA9AZ6PGN735EWEFUAEM3G8XVUFN" +
                                        "L2ZFRPXA4V8KVXE4M8GACUJAT7H3TTWZT9ZDE43ZF46HC01AHFR85MVR2" +
                                        "UP7K3N53M8MTNWBUP01AHFR85MVR2UP7K3N53M8MTNWBUP";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_1024:
                    {
                        kg.PublicKey = "0201B810DA4A1ADD4351378790A981385330CDG9YQSEUK2HT546KWW46NHSCHMD2TNCSPVNSKGQC6CHDUSU9CC4LDPL" +
                                       "TD3NLRVD3TFV9BU2SYBUBU9TXKLQ3CTKZE5GN9VFG37R9YNK2FE58K7ZY" +
                                       "WTUJYFSJTBMDLLGA9GJ2LJXGHSS9CESGC2K69H65YQGAC7CRGF5T3CPLA" +
                                       "5BDJZKVCUWPZRNA2DN7L956LZVZBQUDPX6PF30CDBH26Z82VE4QQ8N85L" +
                                       "QHYJYYCJ6WQ89H9K9VVQX925SG5FJ79AGVZB6M8TTFKCJ56FAREP8GSTC" +
                                       "NKWCXEALDP9Y2ZLS9QKZV8JRNDHG9D8BRDSCTMDQK9NLAPZ9TGYFS9G7U" +
                                       "LXHYJF7F9A89HPXGTU2N4FQQJL98WZ5QND2KTEMMUUZFAX953HCGNSWUW" +
                                       "U2M7LBEWZSH9GW5SC0CDJDY2HC4HJYUSVTAVXZ7MYVJWF3CU9WC3SVPSL" +
                                       "29WF46DVS2SYKSSAMATPPYGJDE3PBFMGS34CXWQSXKCEAE63L2EXTS9NE" +
                                       "2G597XASY3S34XMYST5YZF4THUTYT5DY9UKKXU6PH8MLXRPZMPMMR83JU" +
                                       "X2WGNEW8ZGL4SKUCUB8CEAB6UZ4FB66WTP3B64VMX7XG75T4Y35479";
                        kg.PrivateKey = "020MLJ7XTRVLBDNUVMKGUFHCU8XBGMHHVRA0ADSHPBC7NVSZ82AM867XC" +
                                        "BELNKMR7CZ56C4SW8KKRD9WZLE5X992GZVSZXS5J6JG9SLDW3Y696TU4D" +
                                        "QZP778LVFKVRKANQD6FUGN2ACWUJM9ZK6ME7WXWDZ88LTWHME52RKUDKX" +
                                        "STT7RGWP7HFUJDGWEUG4ZHQ25DCQJ644CLEXRR3G020SAAREJB4WXZ4H2" +
                                        "JEH4AB4U8FGFTA4CAF020SAAREJB4WXZ4H2JEH4AB4U8FGFTA4CAF";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_2048:
                    {
                        kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533199H9KZC4CQ5ZKPEGYDW2EHN5AKZA5G5KP4HU8USWJR8XWW7MCH7244RV" +
                                       "PSXFHVU6YQRK4LPUHM497XJYPLLA3DHUZWXK3CB5SUYF75NPYLTNPRUAP" +
                                       "CTVDHAKYWTRQ97HES2E59WDN2LJKFYA2K8BGFSBHP4A6BF5FSDTS8NWLL" +
                                       "C5NEQ76NJ9BAMWXG55UPFFMRQZTU5KV2G6LSPQUJJWA9U4LJ5SCJ9M9ZQ" +
                                       "Z6K7LZA9UAMJ533UQ5J3JPNQAUWJGZFRFCTGAGSBWPWRRF9HRGF9MCX55" +
                                       "QRYGPYMRE6DBJ65SJDX34FVPYWWKWQ48MCKXYXPHQ23BJ42U8ZMDD8CG5" +
                                       "DPHZQ5XTXUKA277XK6PKSTLJ88ZZ9EBXH62REMRZZRGNPKHYM34RW722S" +
                                       "SZHMPFKY7X8UZ19ADGX3UQ7X444XH7MZXEZYW2YLFHR8YL3PTCXVSYX89" +
                                       "ZXN7KW2XNBE8XS3TQRGZVF6KA5USH56NEZYH5RNWBBPVE9LD6H42RQWR5" +
                                       "YVQMT5EQYQTK6YM9V8DA5BJCLGGZ2UGD6NPA2X3SNUS47F7HJBNBCWHRA" +
                                       "YPPCQ5HWCJNPDHUDQMRN2P6PWJFWJ6CLVNK8HXEFLE4ENPXAFN89CRS43" +
                                       "RUMVGDJQCSRB535XYCS6BZYLA9Q6HJV425F26XXHRGA7C8R8BVMELAPEH" +
                                       "5DSA9KXTCV4H2RNVDFHG3YJSERZVFPWHYA823LUBENBL5U3J4LJX2KQLW" +
                                       "L5XGGESPSE2FQWKSQ4NUCDLBEJPQAT2A2477DYS2XEXKLYEAKUN22622C" +
                                       "RLBCAHPFNEV2FJ2H8N3JQGXJRGP19AFHGRW6SS2ZSFYK8EZAPVYL4MCP4" +
                                       "6UMR64Y9T89FHWEPXBRHKWJCSNNNGPU984J5XW4BWTU6PDWPN24W8RU55" +
                                       "A9C3U9H7VHS5PFURASHBT4JAEE5ZKJBSYMCMDVBLU973R72RVPA6U96A2" +
                                       "LX8HMASVST9RVJ7W66V4DYWRDZZQ3673W7C7LVF68TWPLNMYEUQ8FDZRN" +
                                       "P38D9BX5YA3VENETDUUUMR9U7FFP4NZM7G4Y6J6EASK5SAXXTRMZ8F3AH" +
                                       "5FC54E543N739BY5KVZQM7JZWD2P2HPE7BDRMM9JFCGPBWWASTZ7UDNRV" +
                                       "6AFHVMBR9AGAERE9M6W6S2ZT8PBTABPDCKBPPPV6QW9DRXZUGAHDDRRSY" +
                                       "XM4YXQ2QJX6CL33N7RV8846LK8A3DFLDXWZ2NKF8V";
                        kg.PrivateKey = "02DB825DUDFYHA88AG49NMM742HCQEJDKQQGDR6G3GL7MCED16DU9KTVE" +
                                        "47XQ3M92FFKX8FU9ZXT7AK7VTGGJSYQERCZBR8J2DE2CFE3VUU4W7JEQJ" +
                                        "L49HDUXBW7SNPCV8MHXM7EQHYPQK3GSPQYV5VWESQE4AYWFZHXN2UX7Z3" +
                                        "T3CV52XURB3YFKLUCY6CJTRACRVVDD568F6F28U74ABWCZ2ZMC32E83V3" +
                                        "4JZZPDBF3KEYQWREETGKQT6NANCMAD4XDEXW5LCYBJ3GMDJBM3E7FNK98" +
                                        "7JEUYEV7QNKGKNTDVMRG3G5L8NC9CNHQS8AVDMDBEGCG3DHGJUGPG2244" +
                                        "2C9LCD8FJ2LSDMQXLHCGCLP7ZSYQT2UJ4QFGU2CH3BTT3UADZMQSBAV33" +
                                        "B3Z2Y8Y8RRD9J754G02DJ372LR8APP7HXKB2GNPHP6T65C3RR48Q8BHGP" +
                                        "KEZ6PX2D02DJ372LR8APP7HXKB2GNPHP6T65C3RR48Q8BHGPKEZ6PX2D";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_3072:
                    {
                        kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533267BJBN6W8SY33Y47RWJHWS385XWRV9TSVSB5EM7ECZYNSJ44ZKSD8KV4" +
                                       "6Y9T6TNC6QMDW4V6DBMADU3YUKLP88TCLEUD9FTEUHGXM6T57AQ2EMB59" +
                                       "UPQVNSUT7Z4EHAMDQ6N77VK2A6P847MMWJH9E7C5XX6FNF6MHGWERPWQV" +
                                       "9ZLVR9Z7X5D5Z2XQL6MBM7BDCT2DEDVRBFNDDBLG6LHZ9APM48LS5TKTJ" +
                                       "AGDYFDRVHEGTDH47PCLL8YJ4ZAWCB59F8BN5PZL3NQACP32G3YNBX5E3J" +
                                       "7S28XLRGAX55ZML5XE6Q68EUAL38VUBJ2MZ2UGCCHM7CE6S99N44X9RMV" +
                                       "7B55HULJ4KHPFYSBDUSPQTCWGS76BEQST2QCZDZ2T4FBA4YUJFF47AACE" +
                                       "A4EEFESEYWN48UZCSDZAMGSU5VB9UJKR2XQUSDFS3TNG9QKURQWS7N5Q3" +
                                       "VPYT4QAGGQ5GW2MMXHDJYW55FQPHSS255GVJ7WLLP85JHS8K6DVTJWB4W" +
                                       "4Y8ZEFF7KP6W74PAA8FVPZVDW4RKGMQ8V56Q6R4V34XFE5HR4FZS8GZ6R" +
                                       "36RKW6WN34S2AHR9LCGF8LULB7ZN6NC2AA5RPDZYGWSPPME6267CGLZCP" +
                                       "GG98W557RXCDWAETJHDCRPUXX7AD3E8SL9WMGBV9QFHMSV9UFV7H9NTX3" +
                                       "QYV95CN9P9DSYQWL35R2BWB4GKW6CTWVB2X6WH3P2WFBE6X55KBLAMDB3" +
                                       "SRDSDVY37GKH78MUHY7KDJDC8SJU5FUQRYZ49ULX3YSZL7E284GFVZSGD" +
                                       "FTTQNR6VMBM3LLR78SUSVMJW88XT2K4UHEATRU3V9MMR2VGNGCY9S6R7M" +
                                       "4ELNPEBBMQP2HVPLY5M5VPA92V7NU8ZZ58YYTW5QK9USZ5LV59UZGB2CF" +
                                       "DPZ6HFYU5WB7UU3UYWVNSNKM3W7GBYKJP8TMFW2YN6GNSSE4ZKFVZRLUT" +
                                       "8QPZBBEQT5H9H5Z53D7QV4AJTKTX4EMW62TDWXQVK24JZPSG2VXKCMYZL" +
                                       "BUASE25R3EEK9KBLJ8VX83ZXGTBL5CCDBY33HJ6FKX8AW3WPRX3XTCS9G" +
                                       "2B9SVK2XFFKNSPGFG6FZNS8P2HERFGFL79DKUZZFWHFH4H9UZ7F7F6W3Z" +
                                       "WN84JRRA7SU8T89EQMRBEPVYMMGLGSUMFWWMEDLJM5EGP5WEX9LDUAQXS" +
                                       "55LKDQVRKX4R8NNBHSYBHSNMFYA2C6KGQQFK3TN267DPSZT3PTKHTLNMU" +
                                       "V2YYZZRX3953LPWAKYF8LJUVMEQT3ZC4F9SWMYGUHG6XX66PJFQWSRUW2" +
                                       "C79YLGZ6ZAFS7HLXBTH55UD3EGFBZQ5CLNJDZTEJACDVBCM5FQBTX4DKK" +
                                       "UDGNSMWWLC5UMQRHW89CTU5636WYDXVZZDAUZ529458LDN2DAR9QADWRZ" +
                                       "UTU8MCKN8ACH3R36YKE52DDF67SM5UDUH7PTATHXE65UCGFRCV49UTF29" +
                                       "BGDSUWGRMC839HUZYQVAG985YUF5KJCAVGKRD8E4YMPJ38KR6HD2KHDGY" +
                                       "PJDMJMN4Y3DTJW5MYX3VUPF32637LMAWFM4QCU7BMP74SCF4N5QXZZVBE" +
                                       "LAQMPYMJC2ZWJ9XFV33YXTTPH3SG9KMUABLL83P7L3UBVM763XJPR5UEH" +
                                       "DZ73XJUGR9QP6299K5PU46XGVWKWFAKWYMRXUSLCFJ3WQTEC6QJH6E5V8" +
                                       "X2RMA5TXGSBEWLGSMNQ2SH6G9MLKK4S486DN4M4QVDTYTM4JQETAJQGP7" +
                                       "6NUR4UNDXR4W4JQSNWDTUGX69SEDC3AL8ZF4TJBQQRXSX2A86UUWCDCFH" +
                                       "JE94A8EP3Q6A2QTYKEE62MV4VJB2AB";
                        kg.PrivateKey = "04DMQBFL5GKK4RXWEZYPEY8QB5GHBBGW3EY766DFF2Q6PLFLR4SSRWXBN" +
                                        "W5CFGFC84UJ8PKRDQQYWN9921AH8AGZAQRWJYZ7C3QUJJCJAAGGT5P5GG" +
                                        "LY6K5W4JZJDW7Y8EWS6SSYCS2MCR93MY9DG6VXLBRYVZWDX6XNFU286HM" +
                                        "AM9E82KJVZNYGC8RXRW43SFFWDLR8C96R58A42F3TGLXPVWLGMNPPAWS4" +
                                        "S2SSMNQLUPBAQMP7AUKAGV5CKL342W6UKQY3TUPXKGFXFES725PEX93UX" +
                                        "X4K8JRY3MPQ5S94VNPBXQ5N6LDBLWB67LBLDCGNQS3JEKW667UF8LA8Q6" +
                                        "B3AF4XGZKYB7BVVHF49DJUHSFJZRD63S4GMMAPQ8Q87HKN9G3J3575JEL" +
                                        "5C29NZLWQW6MSYWJ7S3NKLKPWGU75ZJXKEL6Z9V97HAMDYHM6ARCH58EP" +
                                        "WRPZUXN8RRWGCDFM6BH6XUTRTFE3VMAAZAUUKHKL6AFC2PCPXFRDWLVYP" +
                                        "ZKUGY8QDEZNECK9K5Y5MET9SRWQ36JF77XJ6NUKSMZ6DKUPEH4W43YQAE" +
                                        "CV7XVFWJ7ZTRVFQJZFU5BS8AL77YLCXDCR5VPFFZ9NP7EBBQ2AA04DP3S" +
                                        "86B3YD8AFXQ3KPPNTPHBTQSM8PUHJHG87RUM4EV63GKPBRGSN3VX63FCS" +
                                        "646DLWSH86B542U3F04DP3S86B3YD8AFXQ3KPPNTPHBTQSM8PUHJHG87R" +
                                        "UM4EV63GKPBRGSN3VX63FCS646DLWSH86B542U3F";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_4096:
                    {
                        kg.PublicKey = "0201B810DA4A1ADD4351378790A98138533334BN75EUD4LFWYFVNFGBRCEMKKXG62QRBXL8GMHQ975B68FJVEMNXQQ7" +
                                       "RKR7RCZMWDVP86QPB3LR49G9BM7EUUZXNCRZBXRF4PEY3RX6UXT4X286K" +
                                       "WMR7AMEE6QNP9AEHGWJT9AVU3F62F37B5GVX2BQF73QWHRFQSQ6XMRP6M" +
                                       "ZDRQ8JT89UF3YRK5UL34MM3L8HLDTWAJF5YY7MRWJUFDQRK9JNCJ6C9KJ" +
                                       "WRE5ACQSNS24NEAHDYKS3AK75HBCTKP9NR2CSL7Q9PPXM4TF7L37USP77" +
                                       "Z7WER6JY67F7YGKTP6MFRMKK9H8XFPZ9XWKK97XCFXK7AW4TB96WGEH4B" +
                                       "YPF9QRF2DGC3LCHW8VTD2EMHVRDR6EEBUG8R4XYKJPLBPRCJP445DU2BW" +
                                       "JWELKAY45GKDU5HLTTDTWRH2JFKJ7AVAKLPEELN29YHX5JR773P9ERW7N" +
                                       "UFMWDKD4UL4YPU5QW2L4A7ZN3E8ZDQVEZUR6ZRDQXRLQRLUNHVB4XGBWD" +
                                       "HM79NGJARHDBQJCD8NWZCWPBY26QARP7A5S48DCV29F7MUTHU3YAHYVS7" +
                                       "ZPGXJZZA5HBBY4K5BQPUG6MVCBG8H3C7VL8KH9EH58NUVCE6F2CGMSM94" +
                                       "4CQDKNVGWWWRNK4DG26UT88Y9ULUPJ25G9KLTQPK3TBXZEK43X8KPMJT8" +
                                       "DF6MTQ5RB94XR2BT9H9NYYTXL29GF8KZY9QNHAW4LTT2RDQTD2ELWPSV4" +
                                       "4AND9K8G5VKLQ287UBEVHA82CMSMGQQBMNQZVAZ9G8T5TD6G9F7XQHMJT" +
                                       "HCL6PFEDUW5MN9JASF2EKPT2H33325A3SFGGM5C3RYKZSYSSQC5FLHNX9" +
                                       "VHN4HQVWD66YECY4R97JZHQALRTCHXUWH85LSJCCTQZT8JF52FHG6FV9J" +
                                       "UJWEU24K9Z7SKYTYA9NH7GW29FSNKUK3DMFXY48VEYZVDRTTMLFYSJH8B" +
                                       "RQXV72REYGSM6SLX89EVQ52CN9N8YDLWHAWCDDNM89YN2FCRTLE8688XN" +
                                       "F4MZMFE6GP9JK2JTFJVUKBLES2ZVWSBCJE9N3D7DG9LL9Z3U42QFJJPE2" +
                                       "HE5XCRY25UND96R9D7655ZBSCPF796FJZ4GPLY7AMZLGLR77GRP467ELK" +
                                       "PXSZ9ZF8MUYFDHV4EFACPZ79CDFTYW56NE9JDWDVUMNLY9EXDSF8ZNABE" +
                                       "MDQU6T9RVLTNRMZJJ8EJSUM9TV8YA6MNWF2Y66MD3VQ9L662F5X6VE9ZC" +
                                       "PPRTNMEV2DG9BUMFMSL7PUR9H5QG6VVBDBMEU3PLABL57HMSQ5C83E9X8" +
                                       "RTPY4QSEH2H7R2QDJHT5LQSFNQJL2NZ24GLNTFXG468WC5UUTDD68G8HM" +
                                       "477Z8P4F9ZZHUGZ6VPFF32A2MPWY8LPXNECCKM9EEVLDDPUJ8LXN2AE6K" +
                                       "Y2Q42FVBCJM9GQTXNRHBED735KCFD4YGV4U5U3LJD6NJ886W6XQLWH3G7" +
                                       "3VZ6T5YDUQP6DA5ZHLKQSGATDJHUWC2ELTE7QJFXH8H9EAQYZPPMW76JG" +
                                       "Z48UBND9VXFXZMSGBNWQPNQG7E4TCBDMVKUSA9TTVSNLN3DXEZNXH787R" +
                                       "N7XHFBJNZ5W74DUMNBYVHEQDYMZBQCFMS8LGSDUAU6QE9DD5Q334BX62T" +
                                       "JP5WQQDS2ZEWW76XW7VMLX3L7V9UVD7RL297VDBVRFPQ5MYA3YFVBVNVA" +
                                       "R5TJXMQ4X2U2PW6UWSKBXT58HG3QPZM2RVEX2PDMCVJDFTJMXR9NPLW4C" +
                                       "6AE4Q9A8TTAQ68BSN9WWTFFTSX68ECVARFPDBBH5DMP4KYFARTFVCSWNF" +
                                       "FGAPBYYGFJA4MGHEDWTNE54MPGER7EPCZEV2ESJRMM6XDMFGABG97HECN" +
                                       "3SZFUBRKCNDZ2TE9F6EERULRCDAV5EMY6KVY9NY9MYNPP2FQ5WFWLMRYD" +
                                       "4TNYYHE6EDMQ6KK79HH5Q5KBW6DDQYYNUR365W2454CHEZWZAPU82SX4H" +
                                       "KHNZXBRVWAT7G9CJBKHNBPSVEL67X8UJHBFHZH8ZD4NSEVFZM4Y768TJ6" +
                                       "QP3BGEKLTY4UZUWHG63QMKVWAQW9E7WRFNJCH4XRD97JHNKMFUTRFVH68" +
                                       "G5CKSMGC725AZ9CBSL2JX43P4EY44CMF56AJ6BEXVCJP2ZDWCT9G55K4D" +
                                       "F24J7TTJMFXTQH95CBNX67CBPNWEKHCWQV6VD73Y9KCZHNBFUFS8TCYNN" +
                                       "WXRGFKNVRDFUKWHDWDDTSPEW8YCKLPMX2GUV3N4JFJMUE6TSJR6Z53C9F" +
                                       "SKZAY3EN7G66JPBF5E9S6Y7RQHPWZHSRDQ7XH87PHUJFLJFGD7WNE3Q9P" +
                                       "EXMW33LVJBFEUXKNUB6SU7ZYCEX96XT8G27FLUV7XPV4JK64DWDJCX9WV" +
                                       "4VL8CK23FQJ28UG9JUZTQJ3DRL32BTJVRD4LVQ6MK9LCE7ZZP925JK7ZD" +
                                       "92SCV4DDJJ5EXMVBF";
                        kg.PrivateKey = "067DN6F8YFBTWF5QH8MHJB39Z7VNN2P56HS8RPBURAWB8KPL8FQWX4HSP" +
                                        "RTY4HWFMFXAVX2YUY99G2U2KKK56CBE4BCPZWS3KJ98XRW4PY2CDQ3ALF" +
                                        "Y3HGJG42NRY9ZVGZZB59TE29KGC825BYBX3FRFMYBVN2VTHM8YM2KULXM" +
                                        "H24XSHNVK4HEQ9L5264844DMBFUUXSBA9PT9LEXT6449TMAMF7RL6KU6C" +
                                        "GP6FU9DNMJCNTUREF2U9WUMJBMXMMHWKWDG4VU5JQNFFNNWCP2YE2DGFD" +
                                        "N3H27NTNR58GBNTTZBRK66BKWNVMF8H59KALB6K93Y8UWDUWV5HJZGV8X" +
                                        "3AS5EG982DYV4W9CQ3GRRFRR8NABQC98FTAG465SXQ3JPN7X7VULQZX4X" +
                                        "UK68URBFPGCW2UPBYH6CRG6C7YBRAURM2KMGN5L8XH4AUQN8WM4P454WN" +
                                        "NWRE5SQEC78FK3LHHQU5VLXLYYN8F2NXGG7CCQ92EEC63ZE6S7CC7RTML" +
                                        "UMM3PAXPL5CJZFL26JNNYPVLAHM75NDL8AS8JR48PFXK49D4A6TY2ZU9Y" +
                                        "XX2Y2TLA3J8T56EPY236FEDGZEHTQR73NE2Y7LKL7423FFKGGPWYL8PB5" +
                                        "VWD54PG328ACE6V8VLSGVP9VJMMWS2VDVU459C8K5XK869Z5KM4JWHAVE" +
                                        "G56ZESC6HHJ423N6SAH2DW2UQZDQHSMKWUCHPUKZZPJXCQXF55Q3BJW6Z" +
                                        "QYK4HM4Q8XWU8NT844E8YM96EGHSYEUKAJ3QDXANN2DELSGARH7LR2XH9" +
                                        "UQBQNXGPZGB6JTEQP8HAQK5ZZYJE067DWX6C2JJ7L2HE4NGVXZV5XH9RD" +
                                        "P9SNG4WZTC9KEMGXDX7JTQX8RPJJRT4YTA83L8GXDNDDHB7C79CN8UWGL" +
                                        "U5EMNMBREQN5MYTYHGYK067DWX6C2JJ7L2HE4NGVXZV5XH9RDP9SNG4WZ" +
                                        "TC9KEMGXDX7JTQX8RPJJRT4YTA83L8GXDNDDHB7C79CN8UWGLU5EMNMBR" +
                                        "EQN5MYTYHGYK";
                        break;
                    }
            }
            char[] keybuffer = new char[2048];
            keybuffer.Initialize();
            kg.Key = keybuffer.ToString();
            kg.KeyLen = keybuffer.Length;

            kg.RegInfo = tbUserInfo.Text;
            kg.RegInfoLen = kg.RegInfo.Length;

            kg.UseKeyExpiration = cbExpiration.Checked;
            if (kg.UseKeyExpiration)
            {
                kg.ExpirationYear = dtpExpiration.Value.Year;
                kg.ExpirationMonth = dtpExpiration.Value.Month;
                kg.ExpirationDay = dtpExpiration.Value.Day;
            }
            // Hardware ID            
            kg.UseHardwareLocking = cbHardware.Checked;
            if (kg.UseHardwareLocking)
            {
                kg.HardwareID = tbHardware.Text;
            }
            // Register After
            kg.UseRegisterAfter = cbRegisterAfter.Checked;
            if (kg.UseRegisterAfter)
            {
                kg.RegisterAfterYear = dtpRegisterAfter.Value.Year;
                kg.RegisterAfterMonth = dtpRegisterAfter.Value.Month;
                kg.RegisterAfterDay = dtpRegisterAfter.Value.Day;
            }
            // Register Before
            kg.UseRegisterBefore = cbRegisterBefore.Checked;
            if (kg.UseRegisterBefore)
            {
                kg.RegisterBeforeYear = dtpRegisterBefore.Value.Year;
                kg.RegisterBeforeMonth = dtpRegisterBefore.Value.Month;
                kg.RegisterBeforeDay = dtpRegisterBefore.Value.Day;
            }
            // Executions
            kg.UseExecutionsLimit = cbExecutions.Checked;
            if (kg.UseExecutionsLimit)
            {
                kg.ExecutionsCount = (int)udExecutions.Value;
            }
            // Days
            kg.UseDaysLimit = cbDays.Checked;
            if (kg.UseDaysLimit)
            {
                kg.DaysCount = (int)udDays.Value;
            }
            // Runtime
            kg.UseRunTimeLimit = cbRuntime.Checked;
            if (kg.UseRunTimeLimit)
            {
                kg.RunTimeMinutes = (int)udRuntime.Value;
            }
            // Global Time
            kg.UseGlobalTimeLimit = cbGlobalTime.Checked;
            if (kg.UseGlobalTimeLimit)
            {
                kg.GlobalTimeMinutes = (int)udGlobalTime.Value;
            }
            // Country
            kg.UseCountyLimit = cbCountry.Checked;
            if (kg.UseCountyLimit)
            {
                Enigma_KeyGen_IDE64 ide = new Enigma_KeyGen_IDE64();
                kg.CountryCode = ide.KEY_COUNTRIES[comCountries.SelectedIndex].Code;
            }

            kg.EncryptedSections = new byte[Enigma_KeyGen_IDE64.NUMBER_OF_CRYPTED_SECTIONS];
            kg.EncryptedSections[0] = Convert.ToByte(cbSection1.Checked);
            kg.EncryptedSections[1] = Convert.ToByte(cbSection2.Checked);
            kg.EncryptedSections[2] = Convert.ToByte(cbSection3.Checked);
            kg.EncryptedSections[3] = Convert.ToByte(cbSection4.Checked);
            kg.EncryptedSections[4] = Convert.ToByte(cbSection5.Checked);
            kg.EncryptedSections[5] = Convert.ToByte(cbSection6.Checked);
            kg.EncryptedSections[6] = Convert.ToByte(cbSection7.Checked);
            kg.EncryptedSections[7] = Convert.ToByte(cbSection8.Checked);
            kg.EncryptedSections[8] = Convert.ToByte(cbSection9.Checked);
            kg.EncryptedSections[9] = Convert.ToByte(cbSection10.Checked);
            kg.EncryptedSections[10] = Convert.ToByte(cbSection11.Checked);
            kg.EncryptedSections[11] = Convert.ToByte(cbSection12.Checked);
            kg.EncryptedSections[12] = Convert.ToByte(cbSection13.Checked);
            kg.EncryptedSections[13] = Convert.ToByte(cbSection14.Checked);
            kg.EncryptedSections[14] = Convert.ToByte(cbSection15.Checked);
            kg.EncryptedSections[15] = Convert.ToByte(cbSection16.Checked);


            // Secure constant (get it from project file)!
            kg.EncryptedConstant = 2113444489;

            // Generate reg. key

            uint dwResult = Enigma_KeyGen_IDE64.KG_GenerateRegistrationKey(ref kg);
            if (dwResult == Enigma_KeyGen_IDE64.EP_NO_ERROR)
            {
                tbKey.Text = kg.Key;
            }
            else
            {
                switch (dwResult)
                {
                    case Enigma_KeyGen_IDE64.EP_ERROR_UNKNOWN:
                        tbKey.Text = "EP_ERROR_UNKNOWN";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBUFFEREMPTY:
                        tbKey.Text = "EP_ERROR_KEYBUFFEREMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBUFFERISLESS:
                        tbKey.Text = "EP_ERROR_KEYBUFFERISLESS";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_REGINFOEMPTY:
                        tbKey.Text = "EP_ERROR_REGINFOEMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_REGINFOTOOLARGE:
                        tbKey.Text = "EP_ERROR_REGINFOTOOLARGE";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PRIVATEKEYISNOTSET:
                        tbKey.Text = "EP_ERROR_PRIVATEKEYISNOTSET";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PUBLICKEYISNOTSET:
                        tbKey.Text = "EP_ERROR_PUBLICKEYISNOTSET";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PRIVATEKEYISINVALID:
                        tbKey.Text = "EP_ERROR_PRIVATEKEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PUBLICKEYISINVALID:
                        tbKey.Text = "EP_ERROR_PUBLICKEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYMODEISINVALID:
                        tbKey.Text = "EP_ERROR_KEYMODEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBASEISINVALID:
                        tbKey.Text = "EP_ERROR_KEYBASEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_CURRENTDATEISINVALID:
                        tbKey.Text = "EP_ERROR_CURRENTDATEISINVALID";
                        break;

                    case Enigma_KeyGen_IDE64.EP_ERROR_EXPIRATIONDATEISINVALID:
                        tbKey.Text = "EP_ERROR_EXPIRATIONDATEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYISINVALID:
                        tbKey.Text = "EP_ERROR_KEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREID:
                        tbKey.Text = "EP_ERROR_HARDWAREID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREBUFFEREMPTY:
                        tbKey.Text = "EP_ERROR_HARDWAREBUFFEREMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREIDINVALIDFORKEY:
                        tbKey.Text = "EP_ERROR_HARDWAREIDINVALIDFORKEY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PROJECTFILENOTFOUND:
                        tbKey.Text = "EP_ERROR_PROJECTFILENOTFOUND";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INVALIDPROJECTFILE:
                        tbKey.Text = "EP_ERROR_INVALIDPROJECTFILE";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_EXECUTIONSNUMBERINVALID:
                        tbKey.Text = "EP_ERROR_EXECUTIONSNUMBERINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_DAYSNUMBERINVALID:
                        tbKey.Text = "EP_ERROR_DAYSNUMBERINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_COUNTRYCODEINVALID:
                        tbKey.Text = "EP_ERROR_COUNTRYCODEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_RUNTIMEINVALID:
                        tbKey.Text = "EP_ERROR_RUNTIMEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_GLOBALTIMEINVALID:
                        tbKey.Text = "EP_ERROR_GLOBALTIMEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INSTALLBEFOREINVALID:
                        tbKey.Text = "EP_ERROR_INSTALLBEFOREINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INSTALLAFTERINVALID:
                        tbKey.Text = "EP_ERROR_INSTALLAFTERINVALID";
                        break;
                    default:
                        tbKey.Text = "Unknown error";
                        break;
                }
            }
        }

		private void cbHardware_CheckedChanged(object sender, System.EventArgs e)
		{
			tbHardware.Enabled = cbHardware.Checked;
		}

		private void cbExpiration_CheckedChanged(object sender, System.EventArgs e)
		{
			dtpExpiration.Enabled = cbExpiration.Checked;
		}

        private void btnClose_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnGenerateFP_Click(object sender, EventArgs e)
        {
            tbKey.Clear();
            if (tbUserInfo.Text == string.Empty)
            {
                MessageBox.Show("User info field is empty!");
                return;
            }
            Enigma_KeyGen_IDE64.TKeyGenParams kg = new Enigma_KeyGen_IDE64.TKeyGenParams();
            kg.KeyWithHyphens = cbHyphens.Checked;

            char[] keybuffer = new char[2048];
            keybuffer.Initialize();
            kg.Key = keybuffer.ToString();
            kg.KeyLen = keybuffer.Length;

            kg.RegInfo = tbUserInfo.Text;
            kg.RegInfoLen = kg.RegInfo.Length;


            kg.UseKeyExpiration = cbExpiration.Checked;
            if (kg.UseKeyExpiration)
            {
                kg.ExpirationYear = dtpExpiration.Value.Year;
                kg.ExpirationMonth = dtpExpiration.Value.Month;
                kg.ExpirationDay = dtpExpiration.Value.Day;
            }
            // Hardware ID            
            kg.UseHardwareLocking = cbHardware.Checked;
            if (kg.UseHardwareLocking)
            {
                kg.HardwareID = tbHardware.Text;
            }
            // Register After
            kg.UseRegisterAfter = cbRegisterAfter.Checked;
            if (kg.UseRegisterAfter)
            {
                kg.RegisterAfterYear = dtpRegisterAfter.Value.Year;
                kg.RegisterAfterMonth = dtpRegisterAfter.Value.Month;
                kg.RegisterAfterDay = dtpRegisterAfter.Value.Day;
            }
            // Register Before
            kg.UseRegisterBefore = cbRegisterBefore.Checked;
            if (kg.UseRegisterBefore)
            {
                kg.RegisterBeforeYear = dtpRegisterBefore.Value.Year;
                kg.RegisterBeforeMonth = dtpRegisterBefore.Value.Month;
                kg.RegisterBeforeDay = dtpRegisterBefore.Value.Day;
            }
            // Executions
            kg.UseExecutionsLimit = cbExecutions.Checked;
            if (kg.UseExecutionsLimit)
            {
                kg.ExecutionsCount = (int)udExecutions.Value;
            }
            // Days
            kg.UseDaysLimit = cbDays.Checked;
            if (kg.UseDaysLimit)
            {
                kg.DaysCount = (int)udDays.Value;
            }
            // Runtime
            kg.UseRunTimeLimit = cbRuntime.Checked;
            if (kg.UseRunTimeLimit)
            {
                kg.RunTimeMinutes = (int)udRuntime.Value;
            }
            // Global Time
            kg.UseGlobalTimeLimit = cbGlobalTime.Checked;
            if (kg.UseGlobalTimeLimit)
            {
                kg.GlobalTimeMinutes = (int)udGlobalTime.Value;
            }
            // Country
            kg.UseCountyLimit = cbCountry.Checked;
            if (kg.UseCountyLimit)
            {
                Enigma_KeyGen_IDE64 ide = new Enigma_KeyGen_IDE64();
                kg.CountryCode = ide.KEY_COUNTRIES[comCountries.SelectedIndex].Code;
            }

            kg.EncryptedSections = new byte[Enigma_KeyGen_IDE64.NUMBER_OF_CRYPTED_SECTIONS];
            kg.EncryptedSections[0] = Convert.ToByte(cbSection1.Checked);
            kg.EncryptedSections[1] = Convert.ToByte(cbSection2.Checked);
            kg.EncryptedSections[2] = Convert.ToByte(cbSection3.Checked);
            kg.EncryptedSections[3] = Convert.ToByte(cbSection4.Checked);
            kg.EncryptedSections[4] = Convert.ToByte(cbSection5.Checked);
            kg.EncryptedSections[5] = Convert.ToByte(cbSection6.Checked);
            kg.EncryptedSections[6] = Convert.ToByte(cbSection7.Checked);
            kg.EncryptedSections[7] = Convert.ToByte(cbSection8.Checked);
            kg.EncryptedSections[8] = Convert.ToByte(cbSection9.Checked);
            kg.EncryptedSections[9] = Convert.ToByte(cbSection10.Checked);
            kg.EncryptedSections[10] = Convert.ToByte(cbSection11.Checked);
            kg.EncryptedSections[11] = Convert.ToByte(cbSection12.Checked);
            kg.EncryptedSections[12] = Convert.ToByte(cbSection13.Checked);
            kg.EncryptedSections[13] = Convert.ToByte(cbSection14.Checked);
            kg.EncryptedSections[14] = Convert.ToByte(cbSection15.Checked);
            kg.EncryptedSections[15] = Convert.ToByte(cbSection16.Checked);

            // Generate reg. key

            uint dwResult = Enigma_KeyGen_IDE64.KG_GenerateRegistrationKeyFromProject("default.enigma", ref kg);
            if (dwResult == Enigma_KeyGen_IDE64.EP_NO_ERROR)
            {
                tbKey.Text = kg.Key;
            }
            else
            {
                switch (dwResult)
                {
                    case Enigma_KeyGen_IDE64.EP_ERROR_UNKNOWN:
                        tbKey.Text = "EP_ERROR_UNKNOWN";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBUFFEREMPTY:
                        tbKey.Text = "EP_ERROR_KEYBUFFEREMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBUFFERISLESS:
                        tbKey.Text = "EP_ERROR_KEYBUFFERISLESS";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_REGINFOEMPTY:
                        tbKey.Text = "EP_ERROR_REGINFOEMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_REGINFOTOOLARGE:
                        tbKey.Text = "EP_ERROR_REGINFOTOOLARGE";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PRIVATEKEYISNOTSET:
                        tbKey.Text = "EP_ERROR_PRIVATEKEYISNOTSET";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PUBLICKEYISNOTSET:
                        tbKey.Text = "EP_ERROR_PUBLICKEYISNOTSET";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PRIVATEKEYISINVALID:
                        tbKey.Text = "EP_ERROR_PRIVATEKEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PUBLICKEYISINVALID:
                        tbKey.Text = "EP_ERROR_PUBLICKEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYMODEISINVALID:
                        tbKey.Text = "EP_ERROR_KEYMODEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBASEISINVALID:
                        tbKey.Text = "EP_ERROR_KEYBASEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_CURRENTDATEISINVALID:
                        tbKey.Text = "EP_ERROR_CURRENTDATEISINVALID";
                        break;

                    case Enigma_KeyGen_IDE64.EP_ERROR_EXPIRATIONDATEISINVALID:
                        tbKey.Text = "EP_ERROR_EXPIRATIONDATEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYISINVALID:
                        tbKey.Text = "EP_ERROR_KEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREID:
                        tbKey.Text = "EP_ERROR_HARDWAREID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREBUFFEREMPTY:
                        tbKey.Text = "EP_ERROR_HARDWAREBUFFEREMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREIDINVALIDFORKEY:
                        tbKey.Text = "EP_ERROR_HARDWAREIDINVALIDFORKEY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PROJECTFILENOTFOUND:
                        tbKey.Text = "EP_ERROR_PROJECTFILENOTFOUND";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INVALIDPROJECTFILE:
                        tbKey.Text = "EP_ERROR_INVALIDPROJECTFILE";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_EXECUTIONSNUMBERINVALID:
                        tbKey.Text = "EP_ERROR_EXECUTIONSNUMBERINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_DAYSNUMBERINVALID:
                        tbKey.Text = "EP_ERROR_DAYSNUMBERINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_COUNTRYCODEINVALID:
                        tbKey.Text = "EP_ERROR_COUNTRYCODEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_RUNTIMEINVALID:
                        tbKey.Text = "EP_ERROR_RUNTIMEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_GLOBALTIMEINVALID:
                        tbKey.Text = "EP_ERROR_GLOBALTIMEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INSTALLBEFOREINVALID:
                        tbKey.Text = "EP_ERROR_INSTALLBEFOREINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INSTALLAFTERINVALID:
                        tbKey.Text = "EP_ERROR_INSTALLAFTERINVALID";
                        break;
                    default:
                        tbKey.Text = "Unknown error";
                        break;
                }
            }
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            cbKeyMode.SelectedIndex = 0;
            cbKeyBase.SelectedIndex = 3;
            /// Fill out countries combobox
            Enigma_KeyGen_IDE64 ide = new Enigma_KeyGen_IDE64();
            foreach (Enigma_KeyGen_IDE64.TKeyCountries country in ide.KEY_COUNTRIES)
            {
                comCountries.Items.Add(country.Name);
            }
            comCountries.SelectedIndex = 0;
        }

        private void btnVerify_Click(object sender, EventArgs e)
        {
            if (tbUserInfo.Text == string.Empty)
            {
                MessageBox.Show("User info field is empty!");
                return;
            }
            if (tbUserInfo.Text == string.Empty)
            {
                MessageBox.Show("Registration key field is empty!");
                return;
            }
            Enigma_KeyGen_IDE64.TKeyVerifyParams kv = new Enigma_KeyGen_IDE64.TKeyVerifyParams();
            kv.KeyMode = cbKeyMode.SelectedIndex;
            kv.KeyBase = cbKeyBase.SelectedIndex;
            switch (kv.KeyMode)
            {
                case Enigma_KeyGen_IDE64.RM_512:
                    {
                        kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533067CP4S86R7D8THS45GBCVUM635EPRQRMYRP3DAA5DUPZ6ABDSFP7F5AC" +
                                       "P7ERGH4A7Y6B6NW6NMMBZF83WVER9Y4MMBNLBQDKR7KFVLGLV067CFDQC" +
                                       "WCHGQVVRN24DECEPBL96YJQJTVDCRTNQG3E4WW4GK4GQ5X5L5H88D3XYH" +
                                       "CBRBNASPD3P5CNYFKFHBCSDHHD6WPTCC4XVSM5S88067C2JSTCMVT48C8" +
                                       "HC7SHKGTFJBM28P6XTBCNWHMV6J6KN6W5Q9TQLVR285U6GVCAAUTZLRTP" +
                                       "SRGDQ742B4742XF4MACRR747YDP5FZZ9D";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_768:
                    {
                        kv.PublicKey = "0201B810DA4A1ADD4351378790A9813853309AEHRR66KMK99UEPX8C54WQFDZQ5Y96WUCVZYMXBC32SJV7T5SBPR54E" +
                                       "2DBH8UD9RNHTJ9BLJV6NHX52W7PZDDTTJDDGF3YFVL7PJFL8RS8THTFDF" +
                                       "4RY7K3QXLTMXMC8DDSRVRWBVMMP3UYKCDDC7KGL9PG509ACPTRQ4MMUKG" +
                                       "DAUJFFFGSCBFLYK9X9E74M58PW5FG9B9RTLXJQ4STPVCHJTEH8BP557VZ" +
                                       "PQYDBUZJXXJNGVZELFL4UL3LHHE8A645CK593DVWCQBSX4ZCCQ3ST8GCZ" +
                                       "LW2729XK3NT7GST3LMQGXSHLDWCXE09AENVX2QTX3VLT6FWB4JND875XZ" +
                                       "WQ26GW76TV3KVVHK7U489LLPBQ39HUWKMA65U3HKWBDHKBZEB525PHEH2" +
                                       "YQHRZGNJAAYZXMWN8RNZ9T7VMZAJMP2V3S9NXZ9RHL96F7AT3NTMN36V4" +
                                       "ACSFEN4DR6TJR95";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_1024:
                    {
                        kv.PublicKey = "0201B810DA4A1ADD4351378790A981385330CDG9YQSEUK2HT546KWW46NHSCHMD2TNCSPVNSKGQC6CHDUSU9CC4LDPL" +
                                       "TD3NLRVD3TFV9BU2SYBUBU9TXKLQ3CTKZE5GN9VFG37R9YNK2FE58K7ZY" +
                                       "WTUJYFSJTBMDLLGA9GJ2LJXGHSS9CESGC2K69H65YQGAC7CRGF5T3CPLA" +
                                       "5BDJZKVCUWPZRNA2DN7L956LZVZBQUDPX6PF30CDBH26Z82VE4QQ8N85L" +
                                       "QHYJYYCJ6WQ89H9K9VVQX925SG5FJ79AGVZB6M8TTFKCJ56FAREP8GSTC" +
                                       "NKWCXEALDP9Y2ZLS9QKZV8JRNDHG9D8BRDSCTMDQK9NLAPZ9TGYFS9G7U" +
                                       "LXHYJF7F9A89HPXGTU2N4FQQJL98WZ5QND2KTEMMUUZFAX953HCGNSWUW" +
                                       "U2M7LBEWZSH9GW5SC0CDJDY2HC4HJYUSVTAVXZ7MYVJWF3CU9WC3SVPSL" +
                                       "29WF46DVS2SYKSSAMATPPYGJDE3PBFMGS34CXWQSXKCEAE63L2EXTS9NE" +
                                       "2G597XASY3S34XMYST5YZF4THUTYT5DY9UKKXU6PH8MLXRPZMPMMR83JU" +
                                       "X2WGNEW8ZGL4SKUCUB8CEAB6UZ4FB66WTP3B64VMX7XG75T4Y35479";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_2048:
                    {
                        kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533199H9KZC4CQ5ZKPEGYDW2EHN5AKZA5G5KP4HU8USWJR8XWW7MCH7244RV" +
                                       "PSXFHVU6YQRK4LPUHM497XJYPLLA3DHUZWXK3CB5SUYF75NPYLTNPRUAP" +
                                       "CTVDHAKYWTRQ97HES2E59WDN2LJKFYA2K8BGFSBHP4A6BF5FSDTS8NWLL" +
                                       "C5NEQ76NJ9BAMWXG55UPFFMRQZTU5KV2G6LSPQUJJWA9U4LJ5SCJ9M9ZQ" +
                                       "Z6K7LZA9UAMJ533UQ5J3JPNQAUWJGZFRFCTGAGSBWPWRRF9HRGF9MCX55" +
                                       "QRYGPYMRE6DBJ65SJDX34FVPYWWKWQ48MCKXYXPHQ23BJ42U8ZMDD8CG5" +
                                       "DPHZQ5XTXUKA277XK6PKSTLJ88ZZ9EBXH62REMRZZRGNPKHYM34RW722S" +
                                       "SZHMPFKY7X8UZ19ADGX3UQ7X444XH7MZXEZYW2YLFHR8YL3PTCXVSYX89" +
                                       "ZXN7KW2XNBE8XS3TQRGZVF6KA5USH56NEZYH5RNWBBPVE9LD6H42RQWR5" +
                                       "YVQMT5EQYQTK6YM9V8DA5BJCLGGZ2UGD6NPA2X3SNUS47F7HJBNBCWHRA" +
                                       "YPPCQ5HWCJNPDHUDQMRN2P6PWJFWJ6CLVNK8HXEFLE4ENPXAFN89CRS43" +
                                       "RUMVGDJQCSRB535XYCS6BZYLA9Q6HJV425F26XXHRGA7C8R8BVMELAPEH" +
                                       "5DSA9KXTCV4H2RNVDFHG3YJSERZVFPWHYA823LUBENBL5U3J4LJX2KQLW" +
                                       "L5XGGESPSE2FQWKSQ4NUCDLBEJPQAT2A2477DYS2XEXKLYEAKUN22622C" +
                                       "RLBCAHPFNEV2FJ2H8N3JQGXJRGP19AFHGRW6SS2ZSFYK8EZAPVYL4MCP4" +
                                       "6UMR64Y9T89FHWEPXBRHKWJCSNNNGPU984J5XW4BWTU6PDWPN24W8RU55" +
                                       "A9C3U9H7VHS5PFURASHBT4JAEE5ZKJBSYMCMDVBLU973R72RVPA6U96A2" +
                                       "LX8HMASVST9RVJ7W66V4DYWRDZZQ3673W7C7LVF68TWPLNMYEUQ8FDZRN" +
                                       "P38D9BX5YA3VENETDUUUMR9U7FFP4NZM7G4Y6J6EASK5SAXXTRMZ8F3AH" +
                                       "5FC54E543N739BY5KVZQM7JZWD2P2HPE7BDRMM9JFCGPBWWASTZ7UDNRV" +
                                       "6AFHVMBR9AGAERE9M6W6S2ZT8PBTABPDCKBPPPV6QW9DRXZUGAHDDRRSY" +
                                       "XM4YXQ2QJX6CL33N7RV8846LK8A3DFLDXWZ2NKF8V";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_3072:
                    {
                        kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533267BJBN6W8SY33Y47RWJHWS385XWRV9TSVSB5EM7ECZYNSJ44ZKSD8KV4" +
                                       "6Y9T6TNC6QMDW4V6DBMADU3YUKLP88TCLEUD9FTEUHGXM6T57AQ2EMB59" +
                                       "UPQVNSUT7Z4EHAMDQ6N77VK2A6P847MMWJH9E7C5XX6FNF6MHGWERPWQV" +
                                       "9ZLVR9Z7X5D5Z2XQL6MBM7BDCT2DEDVRBFNDDBLG6LHZ9APM48LS5TKTJ" +
                                       "AGDYFDRVHEGTDH47PCLL8YJ4ZAWCB59F8BN5PZL3NQACP32G3YNBX5E3J" +
                                       "7S28XLRGAX55ZML5XE6Q68EUAL38VUBJ2MZ2UGCCHM7CE6S99N44X9RMV" +
                                       "7B55HULJ4KHPFYSBDUSPQTCWGS76BEQST2QCZDZ2T4FBA4YUJFF47AACE" +
                                       "A4EEFESEYWN48UZCSDZAMGSU5VB9UJKR2XQUSDFS3TNG9QKURQWS7N5Q3" +
                                       "VPYT4QAGGQ5GW2MMXHDJYW55FQPHSS255GVJ7WLLP85JHS8K6DVTJWB4W" +
                                       "4Y8ZEFF7KP6W74PAA8FVPZVDW4RKGMQ8V56Q6R4V34XFE5HR4FZS8GZ6R" +
                                       "36RKW6WN34S2AHR9LCGF8LULB7ZN6NC2AA5RPDZYGWSPPME6267CGLZCP" +
                                       "GG98W557RXCDWAETJHDCRPUXX7AD3E8SL9WMGBV9QFHMSV9UFV7H9NTX3" +
                                       "QYV95CN9P9DSYQWL35R2BWB4GKW6CTWVB2X6WH3P2WFBE6X55KBLAMDB3" +
                                       "SRDSDVY37GKH78MUHY7KDJDC8SJU5FUQRYZ49ULX3YSZL7E284GFVZSGD" +
                                       "FTTQNR6VMBM3LLR78SUSVMJW88XT2K4UHEATRU3V9MMR2VGNGCY9S6R7M" +
                                       "4ELNPEBBMQP2HVPLY5M5VPA92V7NU8ZZ58YYTW5QK9USZ5LV59UZGB2CF" +
                                       "DPZ6HFYU5WB7UU3UYWVNSNKM3W7GBYKJP8TMFW2YN6GNSSE4ZKFVZRLUT" +
                                       "8QPZBBEQT5H9H5Z53D7QV4AJTKTX4EMW62TDWXQVK24JZPSG2VXKCMYZL" +
                                       "BUASE25R3EEK9KBLJ8VX83ZXGTBL5CCDBY33HJ6FKX8AW3WPRX3XTCS9G" +
                                       "2B9SVK2XFFKNSPGFG6FZNS8P2HERFGFL79DKUZZFWHFH4H9UZ7F7F6W3Z" +
                                       "WN84JRRA7SU8T89EQMRBEPVYMMGLGSUMFWWMEDLJM5EGP5WEX9LDUAQXS" +
                                       "55LKDQVRKX4R8NNBHSYBHSNMFYA2C6KGQQFK3TN267DPSZT3PTKHTLNMU" +
                                       "V2YYZZRX3953LPWAKYF8LJUVMEQT3ZC4F9SWMYGUHG6XX66PJFQWSRUW2" +
                                       "C79YLGZ6ZAFS7HLXBTH55UD3EGFBZQ5CLNJDZTEJACDVBCM5FQBTX4DKK" +
                                       "UDGNSMWWLC5UMQRHW89CTU5636WYDXVZZDAUZ529458LDN2DAR9QADWRZ" +
                                       "UTU8MCKN8ACH3R36YKE52DDF67SM5UDUH7PTATHXE65UCGFRCV49UTF29" +
                                       "BGDSUWGRMC839HUZYQVAG985YUF5KJCAVGKRD8E4YMPJ38KR6HD2KHDGY" +
                                       "PJDMJMN4Y3DTJW5MYX3VUPF32637LMAWFM4QCU7BMP74SCF4N5QXZZVBE" +
                                       "LAQMPYMJC2ZWJ9XFV33YXTTPH3SG9KMUABLL83P7L3UBVM763XJPR5UEH" +
                                       "DZ73XJUGR9QP6299K5PU46XGVWKWFAKWYMRXUSLCFJ3WQTEC6QJH6E5V8" +
                                       "X2RMA5TXGSBEWLGSMNQ2SH6G9MLKK4S486DN4M4QVDTYTM4JQETAJQGP7" +
                                       "6NUR4UNDXR4W4JQSNWDTUGX69SEDC3AL8ZF4TJBQQRXSX2A86UUWCDCFH" +
                                       "JE94A8EP3Q6A2QTYKEE62MV4VJB2AB";
                        break;
                    }
                case Enigma_KeyGen_IDE64.RM_4096:
                    {
                        kv.PublicKey = "0201B810DA4A1ADD4351378790A98138533334BN75EUD4LFWYFVNFGBRCEMKKXG62QRBXL8GMHQ975B68FJVEMNXQQ7" +
                                       "RKR7RCZMWDVP86QPB3LR49G9BM7EUUZXNCRZBXRF4PEY3RX6UXT4X286K" +
                                       "WMR7AMEE6QNP9AEHGWJT9AVU3F62F37B5GVX2BQF73QWHRFQSQ6XMRP6M" +
                                       "ZDRQ8JT89UF3YRK5UL34MM3L8HLDTWAJF5YY7MRWJUFDQRK9JNCJ6C9KJ" +
                                       "WRE5ACQSNS24NEAHDYKS3AK75HBCTKP9NR2CSL7Q9PPXM4TF7L37USP77" +
                                       "Z7WER6JY67F7YGKTP6MFRMKK9H8XFPZ9XWKK97XCFXK7AW4TB96WGEH4B" +
                                       "YPF9QRF2DGC3LCHW8VTD2EMHVRDR6EEBUG8R4XYKJPLBPRCJP445DU2BW" +
                                       "JWELKAY45GKDU5HLTTDTWRH2JFKJ7AVAKLPEELN29YHX5JR773P9ERW7N" +
                                       "UFMWDKD4UL4YPU5QW2L4A7ZN3E8ZDQVEZUR6ZRDQXRLQRLUNHVB4XGBWD" +
                                       "HM79NGJARHDBQJCD8NWZCWPBY26QARP7A5S48DCV29F7MUTHU3YAHYVS7" +
                                       "ZPGXJZZA5HBBY4K5BQPUG6MVCBG8H3C7VL8KH9EH58NUVCE6F2CGMSM94" +
                                       "4CQDKNVGWWWRNK4DG26UT88Y9ULUPJ25G9KLTQPK3TBXZEK43X8KPMJT8" +
                                       "DF6MTQ5RB94XR2BT9H9NYYTXL29GF8KZY9QNHAW4LTT2RDQTD2ELWPSV4" +
                                       "4AND9K8G5VKLQ287UBEVHA82CMSMGQQBMNQZVAZ9G8T5TD6G9F7XQHMJT" +
                                       "HCL6PFEDUW5MN9JASF2EKPT2H33325A3SFGGM5C3RYKZSYSSQC5FLHNX9" +
                                       "VHN4HQVWD66YECY4R97JZHQALRTCHXUWH85LSJCCTQZT8JF52FHG6FV9J" +
                                       "UJWEU24K9Z7SKYTYA9NH7GW29FSNKUK3DMFXY48VEYZVDRTTMLFYSJH8B" +
                                       "RQXV72REYGSM6SLX89EVQ52CN9N8YDLWHAWCDDNM89YN2FCRTLE8688XN" +
                                       "F4MZMFE6GP9JK2JTFJVUKBLES2ZVWSBCJE9N3D7DG9LL9Z3U42QFJJPE2" +
                                       "HE5XCRY25UND96R9D7655ZBSCPF796FJZ4GPLY7AMZLGLR77GRP467ELK" +
                                       "PXSZ9ZF8MUYFDHV4EFACPZ79CDFTYW56NE9JDWDVUMNLY9EXDSF8ZNABE" +
                                       "MDQU6T9RVLTNRMZJJ8EJSUM9TV8YA6MNWF2Y66MD3VQ9L662F5X6VE9ZC" +
                                       "PPRTNMEV2DG9BUMFMSL7PUR9H5QG6VVBDBMEU3PLABL57HMSQ5C83E9X8" +
                                       "RTPY4QSEH2H7R2QDJHT5LQSFNQJL2NZ24GLNTFXG468WC5UUTDD68G8HM" +
                                       "477Z8P4F9ZZHUGZ6VPFF32A2MPWY8LPXNECCKM9EEVLDDPUJ8LXN2AE6K" +
                                       "Y2Q42FVBCJM9GQTXNRHBED735KCFD4YGV4U5U3LJD6NJ886W6XQLWH3G7" +
                                       "3VZ6T5YDUQP6DA5ZHLKQSGATDJHUWC2ELTE7QJFXH8H9EAQYZPPMW76JG" +
                                       "Z48UBND9VXFXZMSGBNWQPNQG7E4TCBDMVKUSA9TTVSNLN3DXEZNXH787R" +
                                       "N7XHFBJNZ5W74DUMNBYVHEQDYMZBQCFMS8LGSDUAU6QE9DD5Q334BX62T" +
                                       "JP5WQQDS2ZEWW76XW7VMLX3L7V9UVD7RL297VDBVRFPQ5MYA3YFVBVNVA" +
                                       "R5TJXMQ4X2U2PW6UWSKBXT58HG3QPZM2RVEX2PDMCVJDFTJMXR9NPLW4C" +
                                       "6AE4Q9A8TTAQ68BSN9WWTFFTSX68ECVARFPDBBH5DMP4KYFARTFVCSWNF" +
                                       "FGAPBYYGFJA4MGHEDWTNE54MPGER7EPCZEV2ESJRMM6XDMFGABG97HECN" +
                                       "3SZFUBRKCNDZ2TE9F6EERULRCDAV5EMY6KVY9NY9MYNPP2FQ5WFWLMRYD" +
                                       "4TNYYHE6EDMQ6KK79HH5Q5KBW6DDQYYNUR365W2454CHEZWZAPU82SX4H" +
                                       "KHNZXBRVWAT7G9CJBKHNBPSVEL67X8UJHBFHZH8ZD4NSEVFZM4Y768TJ6" +
                                       "QP3BGEKLTY4UZUWHG63QMKVWAQW9E7WRFNJCH4XRD97JHNKMFUTRFVH68" +
                                       "G5CKSMGC725AZ9CBSL2JX43P4EY44CMF56AJ6BEXVCJP2ZDWCT9G55K4D" +
                                       "F24J7TTJMFXTQH95CBNX67CBPNWEKHCWQV6VD73Y9KCZHNBFUFS8TCYNN" +
                                       "WXRGFKNVRDFUKWHDWDDTSPEW8YCKLPMX2GUV3N4JFJMUE6TSJR6Z53C9F" +
                                       "SKZAY3EN7G66JPBF5E9S6Y7RQHPWZHSRDQ7XH87PHUJFLJFGD7WNE3Q9P" +
                                       "EXMW33LVJBFEUXKNUB6SU7ZYCEX96XT8G27FLUV7XPV4JK64DWDJCX9WV" +
                                       "4VL8CK23FQJ28UG9JUZTQJ3DRL32BTJVRD4LVQ6MK9LCE7ZZP925JK7ZD" +
                                       "92SCV4DDJJ5EXMVBF";
                        break;
                    }
            }

            kv.Key = tbKey.Text;
            kv.KeyLen = tbKey.Text.Length;

            kv.RegInfo = tbUserInfo.Text;
            kv.RegInfoLen = tbUserInfo.Text.Length;

            // Hardware ID            
            kv.UseHardwareLocking = cbHardware.Checked;
            if (kv.UseHardwareLocking)
            {
                kv.HardwareID = tbHardware.Text;
            }

            // Secure constant (get it from project file)!
            kv.EncryptedConstant = 2113444489;

            // Generate reg. key
            uint dwResult = Enigma_KeyGen_IDE64.KG_VerifyRegistrationInfo(ref kv);

            string sout = string.Empty;
            if (dwResult == Enigma_KeyGen_IDE64.EP_NO_ERROR)
            {
                //
                sout = "Valid key!\n";
                sout = string.Format(sout + "Creation Date: {0}/{1}/{2}\n", kv.CreationDay, kv.CreationMonth, kv.CreationYear);
                if (kv.UseKeyExpiration)
                {
                    sout += string.Format("Expiration Date: {0}/{1}/{2}\n", kv.ExpirationDay, kv.ExpirationMonth, kv.ExpirationYear);
                }
                if (kv.UseRegisterAfter)
                {
                    sout += string.Format("Register After: {0}/{1}/{2}\n", kv.RegisterAfterDay, kv.RegisterAfterMonth, kv.RegisterAfterYear);
                }
                if (kv.UseRegisterBefore)
                {
                    sout += string.Format("Register Before: {0}/{1}/{2}\n", kv.RegisterBeforeDay, kv.RegisterBeforeMonth, kv.RegisterBeforeYear);
                }
                if (kv.UseCountyLimit)
                {
                    Enigma_KeyGen_IDE64 ide = new Enigma_KeyGen_IDE64();
                    foreach (Enigma_KeyGen_IDE64.TKeyCountries country in ide.KEY_COUNTRIES)
                    {
                        if (country.Code == kv.CountryCode)
                        {
                            sout += string.Format("Country Lock: {0}\n", country.Name);
                            break;
                        }
                    }
                }
                if (kv.UseExecutionsLimit)
                {
                    sout += string.Format("Executions: {0}\n", kv.ExecutionsCount);
                }
                if (kv.UseDaysLimit)
                {
                    sout += string.Format("Days: {0}\n", kv.DaysCount);
                }
                if (kv.UseRunTimeLimit)
                {
                    sout += string.Format("Runtime: {0}\n", kv.RunTimeMinutes);
                }
                if (kv.UseGlobalTimeLimit)
                {
                    sout += string.Format("Global Time: {0}\n", kv.GlobalTimeMinutes);
                }
                for (int i = 0; i < Enigma_KeyGen_IDE64.NUMBER_OF_CRYPTED_SECTIONS; i++)
                {
                    if (Convert.ToBoolean(kv.EncryptedSections[i]))
                    {
                        sout += string.Format("Unlock section: #{0}\n", i + 1);
                    }
                }
            }
            else
            {
                switch (dwResult)
                {
                    case Enigma_KeyGen_IDE64.EP_ERROR_UNKNOWN:
                        sout = "EP_ERROR_UNKNOWN";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBUFFEREMPTY:
                        sout = "EP_ERROR_KEYBUFFEREMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBUFFERISLESS:
                        sout = "EP_ERROR_KEYBUFFERISLESS";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_REGINFOEMPTY:
                        sout = "EP_ERROR_REGINFOEMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_REGINFOTOOLARGE:
                        sout = "EP_ERROR_REGINFOTOOLARGE";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PRIVATEKEYISNOTSET:
                        sout = "EP_ERROR_PRIVATEKEYISNOTSET";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PUBLICKEYISNOTSET:
                        sout = "EP_ERROR_PUBLICKEYISNOTSET";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PRIVATEKEYISINVALID:
                        sout = "EP_ERROR_PRIVATEKEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PUBLICKEYISINVALID:
                        sout = "EP_ERROR_PUBLICKEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYMODEISINVALID:
                        sout = "EP_ERROR_KEYMODEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBASEISINVALID:
                        sout = "EP_ERROR_KEYBASEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_CURRENTDATEISINVALID:
                        sout = "EP_ERROR_CURRENTDATEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_EXPIRATIONDATEISINVALID:
                        sout = "EP_ERROR_EXPIRATIONDATEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYISINVALID:
                        sout = "EP_ERROR_KEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREID:
                        sout = "EP_ERROR_HARDWAREID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREBUFFEREMPTY:
                        sout = "EP_ERROR_HARDWAREBUFFEREMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREIDINVALIDFORKEY:
                        sout = "EP_ERROR_HARDWAREIDINVALIDFORKEY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PROJECTFILENOTFOUND:
                        sout = "EP_ERROR_PROJECTFILENOTFOUND";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INVALIDPROJECTFILE:
                        sout = "EP_ERROR_INVALIDPROJECTFILE";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_EXECUTIONSNUMBERINVALID:
                        tbKey.Text = "EP_ERROR_EXECUTIONSNUMBERINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_DAYSNUMBERINVALID:
                        tbKey.Text = "EP_ERROR_DAYSNUMBERINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_COUNTRYCODEINVALID:
                        tbKey.Text = "EP_ERROR_COUNTRYCODEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_RUNTIMEINVALID:
                        tbKey.Text = "EP_ERROR_RUNTIMEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_GLOBALTIMEINVALID:
                        tbKey.Text = "EP_ERROR_GLOBALTIMEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INSTALLBEFOREINVALID:
                        tbKey.Text = "EP_ERROR_INSTALLBEFOREINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INSTALLAFTERINVALID:
                        tbKey.Text = "EP_ERROR_INSTALLAFTERINVALID";
                        break;
                    default:
                        sout = "Unknown error";
                        break;
                }
            }
            MessageBox.Show(sout);            
        }

        private void btnVerifyFP_Click(object sender, EventArgs e)
        {
            if (tbUserInfo.Text == string.Empty)
            {
                MessageBox.Show("User info field is empty!");
                return;
            }
            if (tbUserInfo.Text == string.Empty)
            {
                MessageBox.Show("Registration key field is empty!");
                return;
            }
            Enigma_KeyGen_IDE64.TKeyVerifyParams kv = new Enigma_KeyGen_IDE64.TKeyVerifyParams();

            kv.Key = tbKey.Text;
            kv.KeyLen = tbKey.Text.Length;

            kv.RegInfo = tbUserInfo.Text;
            kv.RegInfoLen = tbUserInfo.Text.Length;

            // Hardware ID            
            kv.UseHardwareLocking = cbHardware.Checked;
            if (kv.UseHardwareLocking)
            {
                kv.HardwareID = tbHardware.Text;
            }

            // Generate reg. key
            uint dwResult = Enigma_KeyGen_IDE64.KG_VerifyRegistrationInfoFromProject("default.enigma", ref kv);

            string sout = string.Empty;
            if (dwResult == Enigma_KeyGen_IDE64.EP_NO_ERROR)
            {
                //
                sout = "Valid key!\n";
                sout = string.Format(sout + "Creation Date: {0}/{1}/{2}\n", kv.CreationDay, kv.CreationMonth, kv.CreationYear);
                if (kv.UseKeyExpiration)
                {
                    sout = string.Format(sout + "Expiration Date: {0}/{1}/{2}\n", kv.ExpirationDay, kv.ExpirationMonth, kv.ExpirationYear);
                }
                if (kv.UseRegisterAfter)
                {
                    sout += string.Format("Register After: {0}/{1}/{2}\n", kv.RegisterAfterDay, kv.RegisterAfterMonth, kv.RegisterAfterYear);
                }
                if (kv.UseRegisterBefore)
                {
                    sout += string.Format("Register Before: {0}/{1}/{2}\n", kv.RegisterBeforeDay, kv.RegisterBeforeMonth, kv.RegisterBeforeYear);
                }
                if (kv.UseCountyLimit)
                {
                    Enigma_KeyGen_IDE64 ide = new Enigma_KeyGen_IDE64();
                    foreach (Enigma_KeyGen_IDE64.TKeyCountries country in ide.KEY_COUNTRIES)
                    {
                        if (country.Code == kv.CountryCode)
                        {
                            sout += string.Format("Country Lock: {0}\n", country.Name);
                            break;
                        }
                    }
                }
                if (kv.UseExecutionsLimit)
                {
                    sout += string.Format("Executions: {0}\n", kv.ExecutionsCount);
                }
                if (kv.UseDaysLimit)
                {
                    sout += string.Format("Days: {0}\n", kv.DaysCount);
                }
                if (kv.UseRunTimeLimit)
                {
                    sout += string.Format("Runtime: {0}\n", kv.RunTimeMinutes);
                }
                if (kv.UseGlobalTimeLimit)
                {
                    sout += string.Format("Global Time: {0}\n", kv.GlobalTimeMinutes);
                }
                for (int i = 0; i < Enigma_KeyGen_IDE64.NUMBER_OF_CRYPTED_SECTIONS; i++)
                {
                    if (Convert.ToBoolean(kv.EncryptedSections[i]))
                    {
                        sout = string.Format(sout + "Unlock section: #{0}\n", i + 1);
                    }
                }
            }
            else
            {
                switch (dwResult)
                {
                    case Enigma_KeyGen_IDE64.EP_ERROR_UNKNOWN:
                        sout = "EP_ERROR_UNKNOWN";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBUFFEREMPTY:
                        sout = "EP_ERROR_KEYBUFFEREMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBUFFERISLESS:
                        sout = "EP_ERROR_KEYBUFFERISLESS";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_REGINFOEMPTY:
                        sout = "EP_ERROR_REGINFOEMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_REGINFOTOOLARGE:
                        sout = "EP_ERROR_REGINFOTOOLARGE";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PRIVATEKEYISNOTSET:
                        sout = "EP_ERROR_PRIVATEKEYISNOTSET";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PUBLICKEYISNOTSET:
                        sout = "EP_ERROR_PUBLICKEYISNOTSET";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PRIVATEKEYISINVALID:
                        sout = "EP_ERROR_PRIVATEKEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PUBLICKEYISINVALID:
                        sout = "EP_ERROR_PUBLICKEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYMODEISINVALID:
                        sout = "EP_ERROR_KEYMODEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYBASEISINVALID:
                        sout = "EP_ERROR_KEYBASEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_CURRENTDATEISINVALID:
                        sout = "EP_ERROR_CURRENTDATEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_EXPIRATIONDATEISINVALID:
                        sout = "EP_ERROR_EXPIRATIONDATEISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_KEYISINVALID:
                        sout = "EP_ERROR_KEYISINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREID:
                        sout = "EP_ERROR_HARDWAREID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREBUFFEREMPTY:
                        sout = "EP_ERROR_HARDWAREBUFFEREMPTY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_HARDWAREIDINVALIDFORKEY:
                        sout = "EP_ERROR_HARDWAREIDINVALIDFORKEY";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_PROJECTFILENOTFOUND:
                        sout = "EP_ERROR_PROJECTFILENOTFOUND";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INVALIDPROJECTFILE:
                        sout = "EP_ERROR_INVALIDPROJECTFILE";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_EXECUTIONSNUMBERINVALID:
                        tbKey.Text = "EP_ERROR_EXECUTIONSNUMBERINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_DAYSNUMBERINVALID:
                        tbKey.Text = "EP_ERROR_DAYSNUMBERINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_COUNTRYCODEINVALID:
                        tbKey.Text = "EP_ERROR_COUNTRYCODEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_RUNTIMEINVALID:
                        tbKey.Text = "EP_ERROR_RUNTIMEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_GLOBALTIMEINVALID:
                        tbKey.Text = "EP_ERROR_GLOBALTIMEINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INSTALLBEFOREINVALID:
                        tbKey.Text = "EP_ERROR_INSTALLBEFOREINVALID";
                        break;
                    case Enigma_KeyGen_IDE64.EP_ERROR_INSTALLAFTERINVALID:
                        tbKey.Text = "EP_ERROR_INSTALLAFTERINVALID";
                        break;
                    default:
                        sout = "Unknown error";
                        break;
                }
            }
            MessageBox.Show(sout);
        }

        private void cbRegisterAfter_CheckedChanged(object sender, EventArgs e)
        {
            dtpRegisterAfter.Enabled = cbRegisterAfter.Checked;
        }

        private void cbRegisterBefore_CheckedChanged(object sender, EventArgs e)
        {
            dtpRegisterBefore.Enabled = cbRegisterBefore.Checked;
        }

        private void cbCountry_CheckedChanged(object sender, EventArgs e)
        {
            comCountries.Enabled = cbCountry.Checked;
        }

        private void cbExecutions_CheckedChanged(object sender, EventArgs e)
        {
            udExecutions.Enabled = cbExecutions.Checked;
        }

        private void cbDays_CheckedChanged(object sender, EventArgs e)
        {
            udDays.Enabled = cbDays.Checked;
        }

        private void cbRuntime_CheckedChanged(object sender, EventArgs e)
        {
            udRuntime.Enabled = cbRuntime.Checked;
        }

        private void cbGlobalTime_CheckedChanged(object sender, EventArgs e)
        {
            udGlobalTime.Enabled = cbGlobalTime.Checked;
        }
	}
}
