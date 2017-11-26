<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Calendrier
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
        Me.lblMois = New System.Windows.Forms.Label()
        Me.cmdPrecedent = New System.Windows.Forms.Button()
        Me.cmdSuivant = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lblMois
        '
        Me.lblMois.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblMois.Location = New System.Drawing.Point(47, 0)
        Me.lblMois.Name = "lblMois"
        Me.lblMois.Size = New System.Drawing.Size(900, 38)
        Me.lblMois.TabIndex = 0
        Me.lblMois.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'cmdPrecedent
        '
        Me.cmdPrecedent.Location = New System.Drawing.Point(3, 0)
        Me.cmdPrecedent.Name = "cmdPrecedent"
        Me.cmdPrecedent.Size = New System.Drawing.Size(38, 38)
        Me.cmdPrecedent.TabIndex = 1
        Me.cmdPrecedent.Text = "<<"
        Me.cmdPrecedent.UseVisualStyleBackColor = True
        '
        'cmdSuivant
        '
        Me.cmdSuivant.Location = New System.Drawing.Point(953, 0)
        Me.cmdSuivant.Name = "cmdSuivant"
        Me.cmdSuivant.Size = New System.Drawing.Size(38, 38)
        Me.cmdSuivant.TabIndex = 2
        Me.cmdSuivant.Text = ">>"
        Me.cmdSuivant.UseVisualStyleBackColor = True
        '
        'Calendrier
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.cmdSuivant)
        Me.Controls.Add(Me.cmdPrecedent)
        Me.Controls.Add(Me.lblMois)
        Me.Name = "Calendrier"
        Me.Size = New System.Drawing.Size(997, 928)
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents lblMois As Label
    Friend WithEvents cmdPrecedent As Button
    Friend WithEvents cmdSuivant As Button
End Class
