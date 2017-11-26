<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form remplace la méthode Dispose pour nettoyer la liste des composants.
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requise par le Concepteur Windows Form
    Private components As System.ComponentModel.IContainer

    'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
    'Elle peut être modifiée à l'aide du Concepteur Windows Form.  
    'Ne la modifiez pas à l'aide de l'éditeur de code.
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Me.SqlSelectCommand1 = New System.Data.SqlClient.SqlCommand()
        Me.cn = New System.Data.SqlClient.SqlConnection()
        Me.daSport = New System.Data.SqlClient.SqlDataAdapter()
        Me.SportBindingSource1 = New System.Windows.Forms.BindingSource(Me.components)
        Me.Ds1 = New TP2.Ds()
        Me.cboSport = New System.Windows.Forms.ComboBox()
        Me.lblSport = New System.Windows.Forms.Label()
        Me.cboEquipe = New System.Windows.Forms.ComboBox()
        Me.TEquipesBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsEquipes = New TP2.DataSet1()
        Me.lblEquipe = New System.Windows.Forms.Label()
        Me.SqlSelectCommand3 = New System.Data.SqlClient.SqlCommand()
        Me.daEquipe = New System.Data.SqlClient.SqlDataAdapter()
        Me.Calendrier1 = New TP2.Calendrier()
        CType(Me.SportBindingSource1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ds1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.TEquipesBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsEquipes, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'SqlSelectCommand1
        '
        Me.SqlSelectCommand1.CommandText = "SELECT        Lig_no, Lig_Sport" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "FROM            T_Ligue"
        Me.SqlSelectCommand1.Connection = Me.cn
        '
        'cn
        '
        Me.cn.ConnectionString = "Data Source=.;Initial Catalog=p54_Calendrier;Integrated Security=True"
        Me.cn.FireInfoMessageEventOnUserErrors = False
        '
        'daSport
        '
        Me.daSport.SelectCommand = Me.SqlSelectCommand1
        Me.daSport.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "T_Ligue", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Lig_no", "Lig_no"), New System.Data.Common.DataColumnMapping("Lig_Sport", "Lig_Sport")})})
        '
        'SportBindingSource1
        '
        Me.SportBindingSource1.DataMember = "T_Ligue"
        Me.SportBindingSource1.DataSource = Me.Ds1
        '
        'Ds1
        '
        Me.Ds1.DataSetName = "Ds"
        Me.Ds1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'cboSport
        '
        Me.cboSport.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.SportBindingSource1, "Lig_no", True))
        Me.cboSport.DataSource = Me.SportBindingSource1
        Me.cboSport.DisplayMember = "Lig_Sport"
        Me.cboSport.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboSport.FormattingEnabled = True
        Me.cboSport.Location = New System.Drawing.Point(127, 5)
        Me.cboSport.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.cboSport.Name = "cboSport"
        Me.cboSport.Size = New System.Drawing.Size(159, 26)
        Me.cboSport.TabIndex = 0
        Me.cboSport.ValueMember = "Lig_no"
        '
        'lblSport
        '
        Me.lblSport.Location = New System.Drawing.Point(67, 8)
        Me.lblSport.Name = "lblSport"
        Me.lblSport.Size = New System.Drawing.Size(54, 32)
        Me.lblSport.TabIndex = 1
        Me.lblSport.Text = "Sport :"
        '
        'cboEquipe
        '
        Me.cboEquipe.DataSource = Me.TEquipesBindingSource
        Me.cboEquipe.DisplayMember = "Equ_Nom"
        Me.cboEquipe.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboEquipe.FormattingEnabled = True
        Me.cboEquipe.Location = New System.Drawing.Point(564, 5)
        Me.cboEquipe.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.cboEquipe.Name = "cboEquipe"
        Me.cboEquipe.Size = New System.Drawing.Size(159, 26)
        Me.cboEquipe.TabIndex = 2
        '
        'TEquipesBindingSource
        '
        Me.TEquipesBindingSource.DataMember = "T_Equipes"
        Me.TEquipesBindingSource.DataSource = Me.DsEquipes
        '
        'DsEquipes
        '
        Me.DsEquipes.DataSetName = "DataSet1"
        Me.DsEquipes.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'lblEquipe
        '
        Me.lblEquipe.Location = New System.Drawing.Point(492, 8)
        Me.lblEquipe.Name = "lblEquipe"
        Me.lblEquipe.Size = New System.Drawing.Size(66, 32)
        Me.lblEquipe.TabIndex = 3
        Me.lblEquipe.Text = "Equipe :"
        '
        'SqlSelectCommand3
        '
        Me.SqlSelectCommand3.CommandText = "SELECT        Equ_no, Equ_Nom, Equ_Ville, Lig_no, Equ_Logo" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "FROM            T_Equ" &
    "ipes" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "WHERE        (Lig_no = @ligue)"
        Me.SqlSelectCommand3.Connection = Me.cn
        Me.SqlSelectCommand3.Parameters.AddRange(New System.Data.SqlClient.SqlParameter() {New System.Data.SqlClient.SqlParameter("@ligue", System.Data.SqlDbType.Int, 4, "Lig_no")})
        '
        'daEquipe
        '
        Me.daEquipe.SelectCommand = Me.SqlSelectCommand3
        Me.daEquipe.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "T_Equipes", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Equ_no", "Equ_no"), New System.Data.Common.DataColumnMapping("Equ_Nom", "Equ_Nom"), New System.Data.Common.DataColumnMapping("Equ_Ville", "Equ_Ville"), New System.Data.Common.DataColumnMapping("Lig_no", "Lig_no"), New System.Data.Common.DataColumnMapping("Equ_Logo", "Equ_Logo")})})
        '
        'Calendrier1
        '
        Me.Calendrier1.Location = New System.Drawing.Point(4, 44)
        Me.Calendrier1.Margin = New System.Windows.Forms.Padding(4)
        Me.Calendrier1.Name = "Calendrier1"
        Me.Calendrier1.Size = New System.Drawing.Size(1345, 928)
        Me.Calendrier1.TabIndex = 4
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 18.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1379, 787)
        Me.Controls.Add(Me.Calendrier1)
        Me.Controls.Add(Me.lblEquipe)
        Me.Controls.Add(Me.cboEquipe)
        Me.Controls.Add(Me.lblSport)
        Me.Controls.Add(Me.cboSport)
        Me.Font = New System.Drawing.Font("Comic Sans MS", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.SportBindingSource1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ds1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.TEquipesBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsEquipes, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents SqlSelectCommand1 As SqlClient.SqlCommand
    Friend WithEvents cn As SqlClient.SqlConnection
    Friend WithEvents daSport As SqlClient.SqlDataAdapter
    Friend WithEvents SportBindingSource1 As BindingSource
    Friend WithEvents cboSport As ComboBox
    Friend WithEvents lblSport As Label
    Friend WithEvents cboEquipe As ComboBox
    Friend WithEvents lblEquipe As Label
    Friend WithEvents Ds1 As Ds
    Friend WithEvents SqlSelectCommand3 As SqlClient.SqlCommand
    Friend WithEvents daEquipe As SqlClient.SqlDataAdapter
    Friend WithEvents DsEquipes As DataSet1
    Friend WithEvents TEquipesBindingSource As BindingSource
    Friend WithEvents Calendrier1 As Calendrier
End Class
