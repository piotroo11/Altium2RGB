{..............................................................................}
{ Created by Piotr Czapnik 2020                                                }
{..............................................................................}

uses System.Net.HttpClient;

function GetURL(const AURL: string): string;
var
  HttpClient: THttpClient;
  HttpResponse: IHttpResponse;
begin
  HttpClient := THTTPClient.Create;
  try
    HttpResponse := HttpClient.Get(AURL);
    Result := HttpResponse.ContentAsString();
  finally
    HttpClient.Free;
  end;
end;

function getR(RGB: Integer): Byte;
var
  R: Byte;
begin
  R      := (RGB mod $100);
  Result := R;
end;

function getG(RGB: Integer): Byte;
var
  G: Byte;
begin
  G      := ((RGB mod $10000) div $100);
  Result := G;
end;

function getB(RGB: Integer): Byte;
var
  B: Byte;
begin
  B      := RGB div $10000;
  Result := B;
end;


Procedure Altium2RGB;
Var
    PCBBoard     : IPCB_Board;
    color        : TColorRef;
    R            : Byte;
    G            : Byte;
    B            : Byte;
    RRGGBB       : String;
    url          : String;

Begin
    PCBBoard := PCBServer.GetCurrentPCBBoard;
    If PCBBoard = Nil Then Exit;

    color := PCBBoard.LayerColor[PCBBoard.CurrentLayer];
    R     := getR(color);
    G     := getG(color);
    B     := getB(color);
    RRGGBB:= IntToHex(R, 2)+IntToHex(G, 2)+IntToHex(B, 2);
    //url   := 'http://192.168.2.13/cm?cmnd=Color%20' + RRGGBB + '00'; //H801
    url   := 'http://192.168.2.13/json.htm?type=command&param=setcolbrightnessvalue&idx=32&hex=' + RRGGBB; //DOMOTICZ UPDATE DEVICE 32
    //ShowInfo(url);
    GetURL(url);


End;


{..............................................................................}

{..............................................................................}
