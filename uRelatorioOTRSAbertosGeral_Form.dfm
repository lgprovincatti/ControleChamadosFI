object frmRelatorioOTRSAbertosGeral_Form: TfrmRelatorioOTRSAbertosGeral_Form
  Left = 184
  Top = 211
  Width = 1173
  Height = 480
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = 'FI Sistemas - Relat'#243'rio OTRS Abertos [ Geral ]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 8
    Top = 8
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = dmDados.cdsRelatorioOTRS_AbertosGeral
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 984
        Top = 16
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2603.500000000000000000
          42.333333333333330000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Transparent = False
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 928
        Top = 16
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2455.333333333333000000
          42.333333333333330000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 78
      Width = 1047
      Height = 99
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        261.937500000000000000
        2770.187500000000000000)
      BandType = rbTitle
      object QRImage1: TQRImage
        Left = 8
        Top = 8
        Width = 81
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          21.166666666666670000
          21.166666666666670000
          214.312500000000000000)
        Picture.Data = {
          0A544A504547496D616765E5100000FFD8FFE000104A46494600010101009600
          960000FFDB0043000302020302020303030304030304050805050404050A0707
          06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
          1816141812141514FFDB00430103040405040509050509140D0B0D1414141414
          1414141414141414141414141414141414141414141414141414141414141414
          14141414141414141414141414FFC000110800BE00AC03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD53
          A28A2800A28A2800A28A2800A28A2800A28A2800A2B07C6DE37D1BE1EF876E75
          AD76F16CEC611D4F2CEDD9147763E9FD2BE2FF0088BFB6E78AF5EBB961F0B431
          787F4E048491D165B871EA4B0C2FE0323D4D7998CCC30F82FE2BD7B2DCFA4CA3
          87F1F9D36F0D1B456F27A2FF0083F247DDD457E66DB7ED31F132D6EBCF4F16DE
          BB673B65DAE9FF007C918AF73F843FB6F4971790699E3CB68A38E42106AF689B
          429F5910718F75C63D0D7050CF70B5A5CB2BC7D763DFC770366984A6EAD3E5A9
          6E91BDFEE695FE5AF91F5FD1515ADD437D6D15C5BCA93C12A878E58D832B2919
          0411D454B5F447E7AD34ECC28A28A04145145001451450014514500145145001
          4514500145145001451585E3CD51B45F04EBD7E8487B7B19A4523B108707F3A9
          94B962E4FA1A5383A938C16EDD8F80BF6A5F8BB71F133E225D59DBCEC741D224
          6B6B5894FCAEE0E1E4FA9231F402BC668323CC4C9236E91CEE663DC9E49A2BF1
          DAF5A588A92AB3DD9FD7D81C1D2CBF0D0C2D1568C55BFE0FCF70A28A2B03B8FB
          17F620F8B97179F6AF026A53B4A218CDCE9ACE725541F9E31EC3391F535F5DD7
          E607ECFBAC49A1FC69F08DCC6C46EBE58580EEAE0A91FAFE95FA7F5FA4645889
          56C2F24B78BB7CBA1FCE9C7380A783CCD55A4ACAA2E67EB7B3FBF7F50A28A2BE
          8CFCE828A28A0028A28A0028A28A0028A28A0028A28A0028A28A002B1BC65A49
          D7BC25ACE9CA373DD59CB0A8F525081FAD6CD15328A9269F52E9CDD39A9C775A
          9F90335BC9673496F2AED962631BAFA303823F314DAFA03F6BAF82F71E03F1A4
          FE24B0B763E1FD625321745F960B83CB21C7407961F88ED5F3FD7E3F89C3CF0B
          5654A7BA3FAEF2EC7D2CCB0B0C5517A497DCFAAF930A28A2B98F48F48FD9C741
          97C45F1B3C296F1A96586EBED5211FC29182D9FCC0FCEBF4E2BE5EFD8BBE0BDC
          785F4A9FC67AC5BB417DA94423B18641864B73C9723B6FE31EC3DEBEA1AFD2B2
          3C34B0F85E69AD64EFF2E87F37F1B6654F1F99F252778D35CB7F3BDDFF0097C8
          28A28AFA13F3F0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
          9934D1DBC6D24AEB1C6A32CEE7000F735C66AFF193C27A3C8D1BEA6B71229C15
          B652FF00AF4FD6B8F118CC360D73622A282F3691D3470D5B10ED460E5E8AE74F
          AEE83A7F89B49BAD2F55B48AFB4FB94D92DBCCBB9587F9EFDABE4AF88BFB08CC
          D792DD782B5889607391A7EA858797ECB2A8248F40467DEBDE1BF684F0A0FF00
          9FE3F4807FF154C3FB43F857FB9A81FF00B603FF008AAF9CC5667916315AB578
          3B75BEA7D66573CFB289378484927BA6AE9FCBF5DCF91ED7F629F89571742278
          74BB74CFFAE92F3E5FD149FD2BDCBE117EC5BA2783EF20D57C55749E22D42221
          E3B458F6DAC6C3B9079931EF81FECD7A37FC3447857FE79EA1FF007E07FF0015
          49FF000D11E15FF9E7A87FDF85FF00E2AB82862387684B9FDBC5BF367B78DCEB
          89F1D49D274DC13DF96366FE7ABFBAC7A780140006052D7987FC3447857FE79E
          A1FF007E07FF001547FC3447857FB9A87FDF81FF00C557BBFEB0E53FF4131FBC
          F88FEC7CC3FE7CCBEE3D3E8AF32FF8686F0A7A5FFF00DF81FF00C552FF00C342
          7853FE9FBFEFC0FF00E2A9FF00AC194FFD04C7EF17F63E61FF003E65F71E9945
          721E10F8A3A278DB5196CB4D371E7C71199BCE8F68DA081EBEA4575F5EB61B15
          43194FDAE1E6A51EE8F3AB50AB869FB3AD1717D98514515D4601451450014514
          50014514500158BE2DF16D87837479350D424DA8388E35FBD2376502B5AE2E23
          B4B792799C2451A97763D000324D7C93F123C753F8EBC432DC9665B18894B58B
          3C2A7F7BEA7AD7C9711E791C970C9C35A92F857E6DF92FC59F4392E54F33AF69
          6908EFFE5F317C71F12F58F1C5D31B899ADEC41FDDD9C470A07BFA9AE4A8A2BF
          9D71189AD8CAAEB5793949F567ECD46853C3C153A31B45760A28A2B98D828A28
          A0028A28A0028A28A00F5DFD9B6DD9BC57A9CD8F952CB613EE5D48FE46BE89AF
          21FD9C7436B3F0E5FEA922E0DECC11323AA203CFFDF4CC3F0AF5EAFE90E12C3C
          B0F93D2E6DE5797DEF4FC2C7E2DC435956CC6A72F4B2FB96BF88514515F607CD
          8514514005145140051451401E63F1F3C51FD8BE10FECF89F6DCEA4DE571D446
          3963FC87E35F33D775F19BC51FF09378E2EBCB7DD6965FE8B160F0769F99BF16
          CFE00570B5FCD7C4F98FF68E6752517EEC3DD5F2DDFCDDCFDB722C1FD4F0308B
          5EF4B57F3FF2560A28A2BE4CFA00A28A2800A28A2800A28A2800AD3F0DF87EEF
          C53AD5AE99669BA69DB1BB1C22F763EC0549E1BF0A6A9E2DBE169A5DA3DC3E7E
          67C61231EACDD00AFA6FE1B7C33B3F005813B96EB53987EFEE71C7FBABE8BFCE
          BEBB20E1FAF9C5652926A92DE5DFC9777F91F3D9BE714B2DA6D277A8F65FABF2
          FCCE9741D1EDFC3FA3D9E9D6ABB60B68C46BEF8EA4FB93CFE357E8A2BFA3E108
          D38A841592D11F8ACA529C9CA4EED851451564851451400514514005731F123C
          4E3C23E0FD42FD5B6DC6CF2A0F5F31B807F0E4FE15D3D7CD9FB5078F520D4AD3
          4689B7FD997CD78C1EB2374CFD07F3AF9DCFF1EF2ECBEA5587C6FDD8FABFF2DF
          E47BB92601E638EA7452BADDFA2FEAC795CB32A02F23851D4B31C5509BC41610
          920CFBCFFB009AE3EF2FA7BE90BCD2173D8761F4155EBF9D23845F699FD194F2
          F8DBDF7F71D7378B2CC74495BF003FAD467C5D0768243F88AE568AD7EAB4CE8F
          A8D1EC751FF09845FF003ECDFF007D0FF0A3FE12F8BFE7D9BFEFA1FE15CBD14F
          EAD4BB0FEA543B1D57FC25D0F7B793FEFA15E8DF0BBE1FDF7C54B0BDBCB1963B
          382D651096B8C9DCC4678C7A023F3AF10552CC0282CC4E001D49F4AFBC7E08F8
          2DBC0BF0EB4CB19936DECABF69B9F5F31F9C7E0303F0AFA8E1EC8A86678A71AD
          17C91577AFDDFD791F1BC518B86518352A1A5493B2EBA757FA7CCF3FB4FD99EE
          D9BFD275C8631E915B96FE6C2BABD0FF0067BF0E69ACB25EC973A9B8FE191F62
          7E4B83F99AF51A2BF54C3F0B64F877CD1A09BF36DFE0DDBF03F1FAD9F663595A
          556CBCACBF2D4ABA6E9767A3DAADB58DAC5696EBD238502AFE42AD51457D4C63
          182518AB2478329393BC9DD8514515448514514005145140051451401475BD5E
          DF41D1EF752BB7F2EDAD2169A463D95464D7E7BF8B3C4B73E2EF115FEAD744F9
          B752B49B7FBA09E07E0315F4F7ED65E36FEC8F09DA787A093173AA3EF9803C88
          50E71F8B63FEF935F24D7E41C5F8DF6D898E162F482BBF57FE4BF367EE3C0D96
          FB1C2CB1D35EF4F45FE15FE6FF0020A28A2BE04FD3C28A28A0028A9ACECEE350
          B84B7B5824B89DCE163894B313F415F417C27FD976EAFA68753F17A1B5B55219
          34D07F7927FD743FC23DBAD7A581CBB1398D4F67878DFBBE8BD59E4E639AE132
          AA5ED7133B765D5FA2FE9199FB377C1D97C4BAB43E26D5A02BA45A3EEB68DC7F
          C7C483A1FF00757F535F5CD4369690D85AC56D6D1241044A11238C61540E800A
          9ABF72CAB2CA795E1D5186AF76FBBFEB63F9CF3ACDEAE738A75EA6896915D97F
          9F70A28A2BD93C10A28A2800A28A2800A28A2800A28A2800A4660A092700724D
          2D79DFC7AF1B7FC213F0E3519A37DB7B783EC96FEBB9C609FC1726B9B1388861
          68CEBCF68A6CEBC261A78CC4430F4F7934BEF3E4EF8D1E343E3AF889A9DFA396
          B485BECD6C3B08D38CFE2727F1AE1A9B248B0C6CF236D45192CC6B8DD63C5335
          DB3476AC6183A6E1C337F857F3DCBDAE615E7565BC9DDBF53FABF09858E1E8C3
          0F497BB1497DC75971A85B5A7FAE9E38CFA330CD5293C51A6C7FF2F1B8FF00B2
          84FF004AE08B162493927A9A2BBA397C3ED367A1EC9753B39BC67689FEAE2964
          3F40057A2FECEBE187F8C3F1116C2EADCC7A2D9C2D7378C8DF311D1541ED9623
          F0CD783D7E82FEC6BF0EBFE10DF8589ABDCC5B350D79C5D1DC39100C8887E232
          DF4715F4193E5343118A8A946E96AEE7C9714E60B29CB27529BB4E5EEC7D5EEF
          E4AFF3B1EB7E17F00F87BC19104D1B49B7B138C19157321FAB1C9FD6BA0A28AF
          D6E9D38528A8538A49745A1FCCF56AD4AD273AB2726FAB776145145686414514
          5001451450014514500145145001451450015F1FFED55E35FEDEF1BC3A24126E
          B5D2530E01E0CCE016FC86D1F89AFB02BF377C4BAB3EA3AB6A9A9CC499279E5B
          87CFA962DFD6BE078C3152A785861E3F6DEBE8ADFAB47E99C09828D7C6D4C4CB
          FE5DAD3D657D7EE4FEF386F17EAA5E61651B7C8BCC98EE7D3F0AE6A9F34CD713
          3CAC72CEC58FE34CAF8CA34D52828A3FA0A31E5560A28A2B628EAFE15F81E6F8
          91F10344F0F441B65DCE3CF65FE0857E691BDBE507F122BF53ECECE1D3ECE0B5
          B78D62821458E38D4602A818007E02BE48FD847E1DEC8758F1A5D45CC87EC166
          CC3F8460C8C3F1DA3F0AFAF6BF46C870DEC70FED5EF3FCBA1FCF1C75997D6F30
          58583F7692B7FDBCF7FD17C98514515F4A7E6C14514500145145001451450014
          514500145145001451450015F9D7F16FC353785FC51E25D25D0A793349E5FBC6
          4EE43F8A915FA295E31FB427C136F88562BAC6928BFDB96B1EC68BA0B98FAEDF
          F78738FAE2BE478932EA98EC346A51579D377B775D7E67DDF0866F4F2BC6B857
          7685456BF66B66FCB75F33F39A8AD6F1368173E1DD5A7B4B982481958FC92295
          61EC47A8AC9AF818C9495D1FD2719292525B30AB1A6E9D71AC6A36B63691B4D7
          5732AC3146A3259988000FC4D57AFAF7F63FFD9E6EADEFA0F1DF892D5A058C6E
          D2ACE65C31247FAF607A0C7DDFAE7D2BBF07859E32B2A50F9F923C6CE335A393
          E12589AAF5E8BBBE8BFCFB23E9DF86BE0B83E1EF81746F0FDB85C595BAA3B2FF
          001C9D5DBF1626BA6A28AFD6A1154E2A11D91FC9F56ACEB54955A8EF2936DFAB
          0A28A2ACC828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          00E1BE227C15F08FC5180AEBBA5ABDC630B796E7CB997DF70EBF8835E3179FB0
          4F85E4B82D6BE21D4EDE0CF11C889237FDF5C7F2AFA828AF3EAE5F85AF2E6A94
          D37FD763DEC1E7D99E021ECF0F5E518F6DD7C93BD8F18F87FF00B26F807C0579
          15EFD8E6D6AFE321925D49848A8DEAA8001F9E6BD9871C0E052D15D346852C3C
          79694525E479F8BC76271F3F698AA8E6FCDFE5D828A28ADCE10A28A2800A28A2
          800A28A2800A28A2800A28A2800A28A2803FFFD9}
        Stretch = True
      end
      object QRLabel6: TQRLabel
        Left = 96
        Top = 8
        Width = 490
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          254.000000000000000000
          21.166666666666670000
          1296.458333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELAT'#211'RIO OTRS | CHAMADOS ABERTOS [ GERAL ]'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLabel8: TQRLabel
        Left = 96
        Top = 40
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          105.833333333333300000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Relat'#243'rio Impresso:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRSysData2: TQRSysData
        Left = 216
        Top = 40
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          105.833333333333300000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Transparent = False
        FontSize = 10
      end
      object QRSysData3: TQRSysData
        Left = 216
        Top = 64
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          169.333333333333300000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDetailCount
        Transparent = False
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 96
        Top = 64
        Width = 96
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          169.333333333333300000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Qtde. Registros:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 177
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      BandType = rbColumnHeader
      object QRLabel5: TQRLabel
        Left = 8
        Top = 21
        Width = 951
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          55.562500000000000000
          2516.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------------------------------------------------------------'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 14
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          37.041666666666670000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TIPO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 168
        Top = 14
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          37.041666666666670000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FILA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 328
        Top = 14
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          867.833333333333300000
          37.041666666666670000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CLIENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 736
        Top = 14
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1947.333333333333000000
          37.041666666666670000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TICKET'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 38
      Top = 217
      Width = 1047
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 8
        Top = 1
        Width = 150
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          2.645833333333333000
          396.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmDados.cdsRelatorioOTRS_AbertosGeral
        DataField = 'TIPOCHAMADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 168
        Top = 1
        Width = 150
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          2.645833333333333000
          396.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmDados.cdsRelatorioOTRS_AbertosGeral
        DataField = 'FILA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 328
        Top = 1
        Width = 400
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          867.833333333333300000
          2.645833333333333000
          1058.333333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmDados.cdsRelatorioOTRS_AbertosGeral
        DataField = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 736
        Top = 1
        Width = 150
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1947.333333333333000000
          2.645833333333333000
          396.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmDados.cdsRelatorioOTRS_AbertosGeral
        DataField = 'TICKET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
end
