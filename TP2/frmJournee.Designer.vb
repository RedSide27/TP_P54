<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class frmJournee
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
        Me.lvPartie = New System.Windows.Forms.ListView()
        Me.colDate = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colHeure = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colVisiteur = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colReceveur = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colptsVis = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colptsReceveur = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.PicVis = New System.Windows.Forms.PictureBox()
        Me.PicRec = New System.Windows.Forms.PictureBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.lblVis = New System.Windows.Forms.Label()
        Me.lblRec = New System.Windows.Forms.Label()
        Me.lblHeure = New System.Windows.Forms.Label()
        Me.colImgVis = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.colImgRec = CType(New System.Windows.Forms.ColumnHeader(), System.Windows.Forms.ColumnHeader)
        Me.lblPtsVisLBL = New System.Windows.Forms.Label()
        Me.lblPointRecLBL = New System.Windows.Forms.Label()
        Me.lblPointVis = New System.Windows.Forms.Label()
        Me.lblPointRec = New System.Windows.Forms.Label()
        CType(Me.PicVis, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PicRec, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'lvPartie
        '
        Me.lvPartie.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.colDate, Me.colHeure, Me.colVisiteur, Me.colptsVis, Me.colReceveur, Me.colptsReceveur, Me.colImgVis, Me.colImgRec})
        Me.lvPartie.FullRowSelect = True
        Me.lvPartie.GridLines = True
        Me.lvPartie.Location = New System.Drawing.Point(12, 12)
        Me.lvPartie.MultiSelect = False
        Me.lvPartie.Name = "lvPartie"
        Me.lvPartie.Size = New System.Drawing.Size(1044, 324)
        Me.lvPartie.TabIndex = 0
        Me.lvPartie.UseCompatibleStateImageBehavior = False
        Me.lvPartie.View = System.Windows.Forms.View.Details
        '
        'colDate
        '
        Me.colDate.Text = "Date Partie"
        Me.colDate.Width = 150
        '
        'colHeure
        '
        Me.colHeure.Text = "Heure Partie"
        Me.colHeure.Width = 150
        '
        'colVisiteur
        '
        Me.colVisiteur.Text = "Visiteur"
        Me.colVisiteur.Width = 150
        '
        'colReceveur
        '
        Me.colReceveur.Text = "Receveur"
        Me.colReceveur.Width = 150
        '
        'colptsVis
        '
        Me.colptsVis.Text = "Point Visiteur"
        Me.colptsVis.Width = 175
        '
        'colptsReceveur
        '
        Me.colptsReceveur.Text = "Point Receveur"
        Me.colptsReceveur.Width = 175
        '
        'PicVis
        '
        Me.PicVis.Location = New System.Drawing.Point(122, 377)
        Me.PicVis.Name = "PicVis"
        Me.PicVis.Size = New System.Drawing.Size(238, 251)
        Me.PicVis.TabIndex = 1
        Me.PicVis.TabStop = False
        '
        'PicRec
        '
        Me.PicRec.Location = New System.Drawing.Point(655, 377)
        Me.PicRec.Name = "PicRec"
        Me.PicRec.Size = New System.Drawing.Size(238, 251)
        Me.PicRec.TabIndex = 2
        Me.PicRec.TabStop = False
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Arial Rounded MT Bold", 48.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(448, 462)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(123, 75)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "VS"
        '
        'lblVis
        '
        Me.lblVis.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblVis.Location = New System.Drawing.Point(158, 352)
        Me.lblVis.Name = "lblVis"
        Me.lblVis.Size = New System.Drawing.Size(162, 22)
        Me.lblVis.TabIndex = 4
        Me.lblVis.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'lblRec
        '
        Me.lblRec.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblRec.Location = New System.Drawing.Point(699, 352)
        Me.lblRec.Name = "lblRec"
        Me.lblRec.Size = New System.Drawing.Size(162, 22)
        Me.lblRec.TabIndex = 5
        Me.lblRec.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'lblHeure
        '
        Me.lblHeure.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.lblHeure.Font = New System.Drawing.Font("Arial Rounded MT Bold", 24.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblHeure.Location = New System.Drawing.Point(448, 537)
        Me.lblHeure.Name = "lblHeure"
        Me.lblHeure.Size = New System.Drawing.Size(123, 40)
        Me.lblHeure.TabIndex = 6
        Me.lblHeure.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'colImgVis
        '
        Me.colImgVis.Width = 0
        '
        'colImgRec
        '
        Me.colImgRec.Width = 0
        '
        'lblPtsVisLBL
        '
        Me.lblPtsVisLBL.AutoSize = True
        Me.lblPtsVisLBL.Location = New System.Drawing.Point(50, 643)
        Me.lblPtsVisLBL.Name = "lblPtsVisLBL"
        Me.lblPtsVisLBL.Size = New System.Drawing.Size(68, 22)
        Me.lblPtsVisLBL.TabIndex = 7
        Me.lblPtsVisLBL.Text = "Point :"
        '
        'lblPointRecLBL
        '
        Me.lblPointRecLBL.AutoSize = True
        Me.lblPointRecLBL.Location = New System.Drawing.Point(576, 643)
        Me.lblPointRecLBL.Name = "lblPointRecLBL"
        Me.lblPointRecLBL.Size = New System.Drawing.Size(68, 22)
        Me.lblPointRecLBL.TabIndex = 8
        Me.lblPointRecLBL.Text = "Point :"
        '
        'lblPointVis
        '
        Me.lblPointVis.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblPointVis.Location = New System.Drawing.Point(124, 643)
        Me.lblPointVis.Name = "lblPointVis"
        Me.lblPointVis.Size = New System.Drawing.Size(90, 24)
        Me.lblPointVis.TabIndex = 9
        Me.lblPointVis.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'lblPointRec
        '
        Me.lblPointRec.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblPointRec.Location = New System.Drawing.Point(650, 641)
        Me.lblPointRec.Name = "lblPointRec"
        Me.lblPointRec.Size = New System.Drawing.Size(90, 24)
        Me.lblPointRec.TabIndex = 10
        Me.lblPointRec.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'frmJournee
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(12.0!, 22.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1068, 710)
        Me.Controls.Add(Me.lblPointRec)
        Me.Controls.Add(Me.lblPointVis)
        Me.Controls.Add(Me.lblPointRecLBL)
        Me.Controls.Add(Me.lblPtsVisLBL)
        Me.Controls.Add(Me.lblHeure)
        Me.Controls.Add(Me.lblRec)
        Me.Controls.Add(Me.lblVis)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.PicRec)
        Me.Controls.Add(Me.PicVis)
        Me.Controls.Add(Me.lvPartie)
        Me.Font = New System.Drawing.Font("Arial Rounded MT Bold", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Margin = New System.Windows.Forms.Padding(6, 5, 6, 5)
        Me.Name = "frmJournee"
        Me.Text = "frmJournee"
        CType(Me.PicVis, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PicRec, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents lvPartie As ListView
    Friend WithEvents colDate As ColumnHeader
    Friend WithEvents colHeure As ColumnHeader
    Friend WithEvents colVisiteur As ColumnHeader
    Friend WithEvents colReceveur As ColumnHeader
    Friend WithEvents colptsVis As ColumnHeader
    Friend WithEvents colptsReceveur As ColumnHeader
    Friend WithEvents PicVis As PictureBox
    Friend WithEvents PicRec As PictureBox
    Friend WithEvents Label1 As Label
    Friend WithEvents lblVis As Label
    Friend WithEvents lblRec As Label
    Friend WithEvents lblHeure As Label
    Friend WithEvents colImgVis As ColumnHeader
    Friend WithEvents colImgRec As ColumnHeader
    Friend WithEvents lblPtsVisLBL As Label
    Friend WithEvents lblPointRecLBL As Label
    Friend WithEvents lblPointVis As Label
    Friend WithEvents lblPointRec As Label
End Class
