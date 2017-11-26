Imports System.Data.SqlClient
Public Class Calendrier
    Dim NomJours(6) As Label
    Dim cal(5, 6) As Jour
    Dim lig As String
    Public Event Changer_Mois(dd As Date, df As Date)
    Private Sub Calendrier_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Creer_Calendrier()
        Placer_Jours(Today)
    End Sub

    Private Sub Creer_Calendrier()
        Dim i As Integer
        Dim texte_Jours() As String = {"Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"}
        'Boucle pour creer nos label
        For i = 0 To NomJours.GetUpperBound(0)
            NomJours(i) = New Label
            With NomJours(i)
                .Visible = True
                .Width = 89
                .Height = 36
                .BorderStyle = BorderStyle.FixedSingle
                .Text = texte_Jours(i)
                .TextAlign = ContentAlignment.MiddleCenter
                .Top = 55
                .Left = i * 200
            End With
            'Ne pas oublier d'ajouter le controle a votre controle
            Me.Controls.Add(NomJours(i))
        Next

        'Creation de jours
        Dim L, C As Integer
        For L = 0 To cal.GetUpperBound(0)
            For C = 0 To cal.GetUpperBound(1)
                cal(L, C) = New Jour
                With cal(L, C)
                    .Visible = True
                    .Top = 70 + L * 86
                    .Left = C * 150
                End With
                'AddHandler cal(L, C).jour_Choisi, AddressOf Jour_Clic
                Me.Controls.Add(cal(L, C))
            Next
        Next
    End Sub

    Private Sub Effacer_Parties()
        Dim l, c As Integer
        For l = 0 To cal.GetUpperBound(0)
            For c = 0 To cal.GetUpperBound(1)
                If cal(l, c).Nbr_Partie <> "" Then
                    cal(l, c).Nbr_Partie = ""
                End If
            Next
        Next
    End Sub

    Public Event Jr_clic(sender As Object, logo As String, heure As String)

    'Private Sub Jour_Clic(sender As Object)
    '    Dim jr As Jour = sender
    '    RaiseEvent Jr_clic(CInt(jr.No_Jour), jr.Image_Equipe, jr.Heure_Partie)
    'End Sub

    Private Sub Placer_Jours(d1 As Date)
        Try
            Dim cn As New SqlConnection("Data Source=.;Initial Catalog=p54_Calendrier;Integrated Security=True")
            cn.Open()
            Dim mois As String = d1.Month
            Dim jour As Integer = d1.Day
            Dim Premier_Jour As Date = DateAdd(DateInterval.Day, -1 * (jour - 1), d1)
            Dim DD As Date = Premier_Jour
            Dim DF As Date = DateAdd(DateInterval.Day, Date.DaysInMonth(d1.Year, d1.Month) - 1, DD)
            Dim journee As Integer = Premier_Jour.DayOfWeek
            Dim cpt_jour As Integer = 1
            lblMois.Text = UCase(Format(d1, "MMMM")) & " " & d1.Year
            Dim l, c As Integer
            For l = 0 To cal.GetUpperBound(0)
                For c = 0 To cal.GetUpperBound(1)
                    If l = 0 And c < journee Then
                        cal(l, c).Tout_Cacher()
                        cal(l, c).BorderStyle = BorderStyle.None
                    Else
                        If cpt_jour <= Date.DaysInMonth(d1.Year, d1.Month) Then
                            cal(l, c).Montrer()
                            cal(l, c).No_Jour = cpt_jour
                            cal(l, c).Nbr_Partie = Obtenir_Nbr_partie(d1.Year, d1.Month, cpt_jour)
                            cpt_jour += 1
                            cal(l, c).Tag = Premier_Jour
                            Premier_Jour = DateAdd(DateInterval.Day, 1, Premier_Jour)
                        Else
                            cal(l, c).No_Jour = ""
                            cal(l, c).Tout_Cacher()
                            cal(l, c).BorderStyle = BorderStyle.None

                        End If
                    End If
                Next
            Next
            RaiseEvent Changer_Mois(DD, DF)
        Catch ex As SqlException
            MsgBox(ex.Number & " " & ex.Message)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Public Function Obtenir_Nbr_partie(annee As Integer, mois As Integer, jour As Integer) As Integer
        Dim dat As String
        dat = annee & "-" & mois & "-" & jour
        'MsgBox(dat)
        Dim cn As New SqlConnection("Data Source=.;integrated security=true;initial catalog=p54_Calendrier")
        cn.Open()
        Dim com As New SqlCommand(" SELECT COUNT(Par_no) FROM T_Parties WHERE Par_date = @dat AND fk_Equ_no_Rec LIKE 'LNH%'")
        'com.Parameters.Add("@lig", SqlDbType.VarChar, 50).Value = lig
        com.Parameters.Add("@dat", SqlDbType.VarChar, 50).Value = dat
        Dim nombre As Integer
        com.Connection = cn
        com.CommandType = CommandType.Text
        nombre = com.ExecuteScalar
        cn.Close()
        Return nombre
    End Function


    Private Sub cmdPrecedent_Click(sender As Object, e As EventArgs) Handles cmdPrecedent.Click
        Placer_Jours(DateAdd(DateInterval.Month, -1, cal(1, 0).Tag))
    End Sub

    Private Sub cmdSuivant_Click(sender As Object, e As EventArgs) Handles cmdSuivant.Click
        Placer_Jours(DateAdd(DateInterval.Month, 1, cal(1, 0).Tag))

    End Sub
End Class