/*Created by Piotr Czapnik 2020*/
// TODO:
// * ADD HTML REQUEST
// * ADD function event handler if color change

function BGR_to_RRGGBB(BGR) {
var R;
var G;
var B;

    R = Number(BGR&255).toString(16);
    if (R.length < 2) {
       R = "0" + R;
    }

    G = Number((BGR&65280)>>>8).toString(16);
    if (G.length < 2) {
       G = "0" + G;
    }

    B = Number((BGR&16711680)>>>16).toString(16);
    if (B.length < 2) {
       B = "0" + B;
    }

    return R + G + B;
}

function Altium2RGB() {
var Board;            //IPCB_Board;
var RRGGBB;           //hex representation od actual layer color;
var color;
var IP = "192.168.2.13";
var url = "http://" + IP + "/cm?cmnd=Color%20";

    Board = PCBServer.GetCurrentPCBBoard;
    if (Board != Null)
    {
       color = BGR_to_RRGGBB(Board.LayerColor(Board.CurrentLayer));
       url = url + color + "00";

    }
}
