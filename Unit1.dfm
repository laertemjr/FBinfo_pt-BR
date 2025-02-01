object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 
    'FBINFO - Identifica o banco de dados Firebird (compat'#237'vel com as' +
    ' vers'#245'es 1.x - 4.x)'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 70
    Width = 90
    Height = 15
    Caption = 'Banco de dados :'
  end
  object Label2: TLabel
    Left = 16
    Top = 135
    Width = 348
    Height = 15
    Caption = 
      'Vers'#227'o do servidor Firebird que o banco de dados est'#225' conectado ' +
      ':'
  end
  object lblFBserver: TLabel
    Left = 16
    Top = 156
    Width = 63
    Height = 15
    Caption = 'lblFBserver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 191
    Width = 173
    Height = 15
    Caption = 'Vers'#227'o ODS do  banco de dados :'
  end
  object lblODS: TLabel
    Left = 16
    Top = 211
    Width = 38
    Height = 15
    Caption = 'lblODS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 247
    Width = 190
    Height = 15
    Caption = 'Vers'#227'o do  banco de dados Firebird :'
  end
  object lblFBv: TLabel
    Left = 16
    Top = 268
    Width = 34
    Height = 15
    Caption = 'lblFBv'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPort: TLabel
    Left = 488
    Top = 191
    Width = 37
    Height = 15
    Caption = 'lblPort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPS: TLabel
    Left = 488
    Top = 223
    Width = 27
    Height = 15
    Caption = 'lblPS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 488
    Top = 156
    Width = 110
    Height = 15
    Caption = 'Outras informa'#231#245'es :'
  end
  object lblSqlDialect: TLabel
    Left = 488
    Top = 255
    Width = 69
    Height = 15
    Caption = 'lblSqlDialect'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 8
    Width = 196
    Height = 15
    Caption = 'Selecione o banco de dados Firebird :'
  end
  object Label7: TLabel
    Left = 0
    Top = 426
    Width = 624
    Height = 15
    Align = alBottom
    Alignment = taCenter
    Caption = 'Desenvolvido em Delphi 12.1, componentes IBX, vers'#227'o 0.2 (2025)'
    ExplicitWidth = 344
  end
  object btnBrowse: TButton
    Left = 16
    Top = 29
    Width = 145
    Height = 25
    Caption = '&Procurar'
    TabOrder = 0
    OnClick = btnBrowseClick
  end
  object edtBD: TEdit
    Left = 16
    Top = 91
    Width = 593
    Height = 23
    ReadOnly = True
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 624
    Height = 106
    Align = alBottom
    TabOrder = 2
    object Label8: TLabel
      Left = 187
      Top = 8
      Width = 256
      Height = 15
      Caption = 'Configura'#231#227'o das portas dos servidores Firebird :'
    end
    object Label9: TLabel
      Left = 117
      Top = 40
      Width = 58
      Height = 15
      Caption = 'Firebird 1.5'
    end
    object Label10: TLabel
      Left = 117
      Top = 69
      Width = 58
      Height = 15
      Caption = 'Firebird 2.5'
    end
    object Label11: TLabel
      Left = 321
      Top = 40
      Width = 58
      Height = 15
      Caption = 'Firebird 3.0'
    end
    object Label12: TLabel
      Left = 321
      Top = 69
      Width = 58
      Height = 15
      Caption = 'Firebird 4.0'
    end
    object edtFB15: TEdit
      Left = 187
      Top = 32
      Width = 48
      Height = 23
      Alignment = taCenter
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 0
    end
    object edtFB25: TEdit
      Left = 187
      Top = 61
      Width = 48
      Height = 23
      Alignment = taCenter
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 1
    end
    object btnEdit: TButton
      Left = 488
      Top = 32
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 4
      OnClick = btnEditClick
    end
    object btnCancel: TButton
      Left = 488
      Top = 61
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      Enabled = False
      TabOrder = 5
      OnClick = btnCancelClick
    end
    object edtFB30: TEdit
      Left = 390
      Top = 32
      Width = 48
      Height = 23
      Alignment = taCenter
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 2
    end
    object edtFB40: TEdit
      Left = 390
      Top = 61
      Width = 48
      Height = 23
      Alignment = taCenter
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 3
    end
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Left = 400
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    Left = 568
    Top = 8
  end
  object IBDatabase1: TIBDatabase
    ServerType = 'IBServer'
    Left = 488
    Top = 8
  end
end
