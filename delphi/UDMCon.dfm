object DMCon: TDMCon
  OldCreateOrder = False
  Height = 74
  Width = 202
  object FDDriver: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 31
    Top = 14
  end
  object FDConnect: TFDConnection
    Params.Strings = (
      'Password=root'
      'User_Name=root'
      'UseSSL=True'
      'Database=wk'
      'Server=localhost'
      'Port=3366'
      'DriverID=MySQL')
    UpdateOptions.AssignedValues = [uvLockMode]
    UpdateOptions.LockMode = lmPessimistic
    Connected = True
    LoginPrompt = False
    Left = 79
    Top = 14
  end
  object ExecSQL: TFDScript
    SQLScripts = <>
    Connection = FDConnect
    Params = <>
    Macros = <>
    Left = 136
    Top = 16
  end
end
