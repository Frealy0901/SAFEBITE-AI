Imports System.IO

Public Class Form1

    Dim itemFile As String = "item.txt"
    Dim ruleFile As String = "rule.txt"

    Dim rnd As New Random()

    Dim pilihanUser As String = ""
    Dim pilihanKomputer As String = ""

    ' LOAD ITEM
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        If File.Exists(itemFile) Then

            Dim lines() As String = File.ReadAllLines(itemFile)

            Dim x As Integer = 10
            Dim y As Integer = 10

            For Each row In lines

                Dim parts() As String = row.Split(","c)

                Dim namaItem As String = parts(1)

                Dim btn As New Button

                btn.Width = 100
                btn.Height = 100

                btn.Location = New Point(x, y)

                btn.Text = namaItem
                btn.Tag = namaItem

                AddHandler btn.Click, AddressOf ButtonItem_Click

                Me.Controls.Add(btn)

                x += 110

            Next

        End If

    End Sub


    ' SAAT ITEM DIKLIK
    Private Sub ButtonItem_Click(sender As Object, e As EventArgs)

        Dim btn As Button = sender

        pilihanUser = btn.Tag.ToString()

        RandomKomputer()

    End Sub


    ' RANDOM LAWAN
    Sub RandomKomputer()

        Dim lines() As String = File.ReadAllLines(itemFile)

        Dim i As Integer = rnd.Next(0, lines.Length)

        Dim parts() As String = lines(i).Split(","c)

        pilihanKomputer = parts(1)

        Timer1.Start()

    End Sub


    ' TIMER 3 DETIK
    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick

        Timer1.Stop()

        TentukanPemenang()

    End Sub


    ' LOGIKA PEMENANG
    Sub TentukanPemenang()

        Dim hasil As String = "Seri"

        If File.Exists(ruleFile) Then

            Dim lines() As String = File.ReadAllLines(ruleFile)

            For Each row In lines

                Dim parts() As String = row.Split(","c)

                Dim p1 As String = parts(0)
                Dim p2 As String = parts(1)

                If pilihanUser = p1 And pilihanKomputer = p2 Then

                    hasil = "Kamu Menang"

                ElseIf pilihanUser = p2 And pilihanKomputer = p1 Then

                    hasil = "Kamu Kalah"

                End If

            Next

        End If

        MessageBox.Show(
            "User: " & pilihanUser &
            vbCrLf &
            "Komputer: " & pilihanKomputer &
            vbCrLf &
            hasil
        )

    End Sub


    ' BUKA FORM RULE
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Form2.Show()

    End Sub

End Class


Imports System.IO

Public Class Form2

    Dim ruleFile As String = "rule.txt"

    Private Sub Form2_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        LoadRule()

    End Sub


    Sub LoadRule()

        ListBox1.Items.Clear()

        If File.Exists(ruleFile) Then

            Dim lines() As String = File.ReadAllLines(ruleFile)

            For Each row In lines

                ListBox1.Items.Add(row)

            Next

        End If

    End Sub


    ' TOMBOL TAMBAH RULE
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Form3.Show()

    End Sub

End Class

Imports System.IO

Public Class Form3

    Dim ruleFile As String = "rule.txt"

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If ComboBox1.Text = "" Or ComboBox2.Text = "" Then

            MessageBox.Show("Pilih item dulu")
            Exit Sub

        End If

        Dim rule As String =
            ComboBox1.Text &
            "," &
            ComboBox2.Text

        File.AppendAllText(
            ruleFile,
            Environment.NewLine & rule
        )

        MessageBox.Show("Rule berhasil ditambahkan")

        Me.Close()

    End Sub

End Class



