object dmConexao: TdmConexao
  Height = 448
  Width = 674
  object con1: TFDConnection
    Params.Strings = (
      'Database=wktechnology'
      'User_Name=root'
      'Password=P@ul0450430'
      'Server=localhost'
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 50000
    TxOptions.Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 112
  end
  object fdphysmysqldrvrlnk1: TFDPhysMySQLDriverLink
    VendorHome = 'C:\TesteExcellent\EXE'
    VendorLib = 'libmysql.dll'
    Left = 200
    Top = 112
  end
end
