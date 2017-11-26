<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Jour
    Inherits System.Windows.Forms.UserControl

    'UserControl remplace la méthode Dispose pour nettoyer la liste des composants.
    <System.Diagnostics.DebuggerNonUserCode()> _
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
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.lblJour = New System.Windows.Forms.Label()
        Me.lblNbrPartie = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'lblJour
        '
        Me.lblJour.Location = New System.Drawing.Point(6, 20)
        Me.lblJour.Name = "lblJour"
        Me.lblJour.Size = New System.Drawing.Size(53, 23)
        Me.lblJour.TabIndex = 0
        Me.lblJour.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'lblNbrPartie
        '
        Me.lblNbrPartie.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblNbrPartie.Location = New System.Drawing.Point(6, 53)
        Me.lblNbrPartie.Name = "lblNbrPartie"
        Me.lblNbrPartie.Size = New System.Drawing.Size(53, 13)
        Me.lblNbrPartie.TabIndex = 3
        Me.lblNbrPartie.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Jour
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Controls.Add(Me.lblNbrPartie)
        Me.Controls.Add(Me.lblJour)
        Me.Name = "Jour"
        Me.Size = New System.Drawing.Size(68, 76)
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents lblJour As Label
    Friend WithEvents lblNbrPartie As Label
End Class
