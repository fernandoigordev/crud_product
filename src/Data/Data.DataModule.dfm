object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 249
  Width = 396
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\crud_product\database.sqlite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 64
    Top = 40
  end
end
