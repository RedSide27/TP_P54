Public Class Jour
    Public Property No_Jour As String
        Get
            Return lblJour.Text
        End Get
        Set(value As String)
            lblJour.Text = value
        End Set
    End Property

    Public Property Nbr_Partie As String
        Get
            Return lblNbrPartie.Text
        End Get
        Set(value As String)
            lblNbrPartie.Text = value
        End Set
    End Property

    Public Sub Tout_Cacher()
        lblNbrPartie.Hide()
        lblJour.Hide()
    End Sub

    Public Sub Cacher()
        lblNbrPartie.Hide()
    End Sub

    Public Sub Tout_Montrer()
        lblNbrPartie.Show()
        lblJour.Show()
    End Sub

    Public Sub Montrer()
        lblJour.Show()
    End Sub

    Public Sub Initialiser_Match(logo As String, heure As String)
        lblNbrPartie.Text = heure
    End Sub

    Public Event jour_Choisi(sender As Object)

    Private Sub Jour_Clic(sender As Object, e As EventArgs) Handles lblJour.Click, lblNbrPartie.Click
        RaiseEvent jour_Choisi(Me)
    End Sub

End Class
