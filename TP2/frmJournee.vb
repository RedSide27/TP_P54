Public Class frmJournee
    Private Sub frmJournee_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        MsgBox(PartieJour.NoJour & "  " & PartieJour.NbPartie & "  " & PartieJour.mois)
    End Sub
End Class