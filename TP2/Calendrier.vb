Imports System.Data.SqlClient
Public Class Calendrier
    Dim NomJours(6) As Label
    Dim cal(5, 6) As Jour
    Dim mois As Integer

    Public Event Changer_Mois(dd As Date, df As Date)
    Private Sub Calendrier_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Creer_Calendrier()
        Placer_Jours(Today, "", "")
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
                AddHandler cal(L, C).jour_Choisi, AddressOf Jour_Clic
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

    Public Event Jr_clic(NoJour As Integer, NbPartie As Integer, mois As Integer)

    Private Sub Jour_Clic(sender As Object)
        Dim jr As Jour = sender
        RaiseEvent Jr_clic(CInt(jr.No_Jour), jr.Nbr_Partie, mois)
    End Sub

    Public Sub Placer_Jours(d1 As Date, Ligue As String, team As String)
        Try
            Dim cn As New SqlConnection("Data Source=.;Initial Catalog=p54_Calendrier;Integrated Security=True")
            cn.Open()
            mois = d1.Month
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
                            cal(l, c).Tout_Montrer()
                            cal(l, c).No_Jour = cpt_jour
                            cal(l, c).Nbr_Partie = Obtenir_Nbr_partie(d1.Year, d1.Month, cpt_jour, Ligue, team)
                            cpt_jour += 1
                            cal(l, c).Tag = Premier_Jour
                            Premier_Jour = DateAdd(DateInterval.Day, 1, Premier_Jour)
                            cal(l, c).BorderStyle = BorderStyle.FixedSingle
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

    Public Function Obtenir_Nbr_partie(annee As Integer, mois As Integer, jour As Integer, ligue As String, team As String) As Integer
        PartieJour.Ligue = ligue
        PartieJour.team = team
        Dim dat As String
        dat = annee & "-" & mois & "-" & jour
        'MsgBox(dat)
        Dim cn As New SqlConnection("Data Source=.;integrated security=true;initial catalog=p54_Calendrier")
        cn.Open()
        Dim com As New SqlCommand("SELECT COUNT(p.Par_no) FROM T_Parties p INNER JOIN T_Equipes e  ON e.Equ_no = p.fk_Equ_no_Rec WHERE e.Equ_no LIKE '" & team & "%' and Par_date = '" & dat & "' AND fk_Equ_no_Rec LIKE '" + PartieJour.Ligue + "%'")
        Dim nombre As Integer
        com.Connection = cn
        com.CommandType = CommandType.Text
        nombre = com.ExecuteScalar
        cn.Close()
        Return nombre
    End Function


    Private Sub cmdPrecedent_Click(sender As Object, e As EventArgs) Handles cmdPrecedent.Click
        Placer_Jours(DateAdd(DateInterval.Month, -1, cal(1, 0).Tag), PartieJour.Ligue, PartieJour.team)
    End Sub

    Private Sub cmdSuivant_Click(sender As Object, e As EventArgs) Handles cmdSuivant.Click
        Placer_Jours(DateAdd(DateInterval.Month, 1, cal(1, 0).Tag), PartieJour.Ligue, PartieJour.team)

    End Sub
End Class