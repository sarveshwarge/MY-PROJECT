VERSION 5.00
Begin VB.Form modifyActor 
   Caption         =   "Modify Actor"
   ClientHeight    =   5160
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7995
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5160
   ScaleWidth      =   7995
   Begin VB.Frame Frame1 
      Height          =   2895
      Left            =   600
      TabIndex        =   2
      Top             =   1440
      Width           =   6495
      Begin VB.CommandButton Command1 
         Caption         =   "Update"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   4320
         TabIndex        =   7
         Top             =   2040
         Width           =   1695
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   1
         Left            =   3000
         TabIndex        =   6
         Top             =   1200
         Width           =   3015
      End
      Begin VB.TextBox Text1 
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   0
         Left            =   3000
         TabIndex        =   5
         Top             =   360
         Width           =   3015
      End
      Begin VB.Label Label3 
         Caption         =   "Actor Name"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   4
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label Label2 
         Caption         =   "Actor Id"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.ComboBox Combo1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   3120
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   600
      Width           =   3975
   End
   Begin VB.Label Label1 
      Caption         =   "Select Actor"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   600
      TabIndex        =   0
      Top             =   600
      Width           =   2415
   End
End
Attribute VB_Name = "modifyActor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset
Dim i As Integer

Private Sub populateCombo()
    Combo1.Clear
    
    rs.MoveFirst
    Do While Not rs.EOF
        Combo1.AddItem rs.Fields(0)
        rs.MoveNext
    Loop
    
    Combo1.ListIndex = 0
End Sub

Private Sub Combo1_Click()
    Dim x As String
    x = "aid=" & Combo1.List(Combo1.ListIndex)
    
    rs.MoveFirst
    rs.Find x
    
    For i = Text1.LBound To Text1.UBound
        Text1(i).Text = rs.Fields(i)
    Next
    
End Sub

Private Sub Command1_Click()
    For i = Text1.LBound To Text1.UBound
        rs.Fields(i) = Text1(i).Text
    Next
    rs.Update
    MsgBox "Actor Modified"
End Sub

Private Sub Form_Load()
    rs.Open "select * from Actor", conn, adOpenDynamic, adLockOptimistic
    populateCombo
End Sub

Private Sub Form_Unload(Cancel As Integer)
    rs.Close
End Sub
