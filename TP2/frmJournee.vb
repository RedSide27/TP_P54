Imports System.Data.SqlClient
Public Class frmJournee

    Dim cn As SqlConnection
    Dim com As SqlCommand
    Dim DR As SqlDataReader

    Private Sub frmJournee_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Remplir_DGV()
    End Sub

    Public Sub Remplir_DGV()
        cn = New SqlConnection("Data Source=.;Initial Catalog=p54_Calendrier;Integrated Security=True")
        cn.Open()
        com = New SqlCommand()
        With com
            .Connection = cn
            .CommandType = CommandType.Text
            .CommandText = "  SELECT p.Par_date, p.Par_Heure, eV.Equ_Nom as 'VisEqu', p.Par_pts_vis,eR.Equ_Nom as 'RecEqu',p.Par_pts_rec,eV.Equ_Logo as 'logoVis',eR.Equ_Logo as 'logoRec' FROM T_Parties p INNER JOIN T_Equipes eR ON eR.Equ_no = p.fk_Equ_no_Rec INNER JOIN T_Equipes eV ON eV.Equ_no = p.fk_Equ_no_Vis WHERE Par_date = '2017-" & PartieJour.mois & "-" & PartieJour.NoJour & "' and fk_Equ_no_Rec LIKE '" & PartieJour.Ligue & "%' and eR.Equ_No LIKE '" & PartieJour.team & "%'"
        End With
        DR = com.ExecuteReader
        Dim row As ListViewItem
        Do While DR.Read
            Dim d As Date = DR("Par_date")
            row = New ListViewItem(d)
            row.SubItems.Add(DR("Par_Heure").ToString)
            row.SubItems.Add(DR("VisEqu").ToString)
            row.SubItems.Add(DR("Par_pts_vis").ToString)
            row.SubItems.Add(DR("RecEqu").ToString)
            row.SubItems.Add(DR("Par_pts_rec").ToString)
            row.SubItems.Add(DR("logoVis").ToString)
            row.SubItems.Add(DR("logoRec").ToString)
            lvPartie.Items.Add(row)
        Loop


    End Sub

    Private Sub lvPartie_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lvPartie.SelectedIndexChanged
        Try
            If lvPartie.SelectedIndices.Count > 0 Then
                lblHeure.Text = lvPartie.SelectedItems(0).SubItems(1).Text
                lblVis.Text = lvPartie.SelectedItems(0).SubItems(2).Text
                lblPointVis.Text = lvPartie.SelectedItems(0).SubItems(3).Text
                lblRec.Text = lvPartie.SelectedItems(0).SubItems(4).Text
                lblPointRec.Text = lvPartie.SelectedItems(0).SubItems(5).Text
                PicVis.ImageLocation = "\img\" & lvPartie.SelectedItems(0).SubItems(6).Text
                PicRec.ImageLocation = "\img\" & lvPartie.SelectedItems(0).SubItems(7).Text
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub
End Class