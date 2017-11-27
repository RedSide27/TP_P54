﻿Imports System.ComponentModel
Imports System.Data.SqlClient
Imports TP2

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
            Dim Ligue As String
            DsEquipes.Clear()
            SqlSelectCommand3.Parameters("@ligue").Value = cboSport.SelectedValue
            Select Case cboSport.SelectedValue
                Case 1
                    Ligue = "LNH"
                Case 2
                    Ligue = "MLB"
                Case 3
                    Ligue = "NFL"
                Case Else
                    Ligue = "LNH"
            End Select
            Calendrier1.Placer_Jours(Date.Now, Ligue)
            daEquipe.Fill(DsEquipes)
            cboEquipe.Items.Clear()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Calendrier1_Jr_clic(NoJour As Integer, NbPartie As Integer, mois As Integer) Handles Calendrier1.Jr_clic
        PartieJour.NoJour = NoJour
        PartieJour.NbPartie = NbPartie
        PartieJour.mois = mois
        Dim frm As New frmJournee
        frm.Show()
    End Sub
End Class
