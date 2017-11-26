Imports System.ComponentModel
Imports System.Data.SqlClient

Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            SqlSelectCommand3.Parameters("@ligue").Value = 1
            daSport.Fill(Ds1.T_Ligue)
            daEquipe.Fill(DsEquipes)
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub cboSport_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSport.SelectedIndexChanged
        Try
            DsEquipes.Clear()
            SqlSelectCommand3.Parameters("@ligue").Value = cboSport.SelectedValue
            daEquipe.Fill(DsEquipes)
            cboEquipe.Items.Clear()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub



End Class
