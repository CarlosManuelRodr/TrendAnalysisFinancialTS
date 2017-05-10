samplesdir = Directory[] <> "/Samples/";
If[ ! DirectoryQ[samplesdir],
  CreateDirectory[samplesdir];
  ];

GenSample[market_String, date_List, name_String: ""] := 
  Module[{t1, t2, t3, t4, data},
   data = FinancialData[market, "OHLCV", date];
   t1 = data[[All, 1, 1]];
   t2 = data[[All, 1, 2]];
   t3 = data[[All, 1, 3]];
   t4 = data[[All, 2, 4]];
   t = Transpose[{t1, t2, t3, t4}];
   If[StringLength[name] == 0,
    Export[samplesdir <> StringSplit[market, "^"][[1]] <> ".csv", t],
    Export[samplesdir <> name <> ".csv", t]
    ];
   ];

GenSample["^GSPC", {1960, 1, 1}, "S&P 500"];
GenSample["^IXIC", {1971, 2, 5}, "NASDAQ Composite"];
GenSample["^MXX", {1991, 11, 8}, "IPC"];
GenSample["^FTSE", {1991, 11, 8}, "FTSE 100"];
GenSample["^NYA", {1991, 11, 8}, "NYSE COMPOSITE (DJ)"];
GenSample["^GDAXI", {1991, 11, 8}, "DAX"];
GenSample["^FCHI", {1991, 11, 8}, "CAC 40"];
GenSample["^HSI", {1991, 11, 8}, "HANG SENG INDEX"];
GenSample["^MERV", {1991, 11, 8}, "MERVAL BUENOS AIRES"];
GenSample["^KLSE", {1991, 11, 8}, "FTSE Bursa Malaysia KLCI"];