// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C
#define ST_GROUP_BOX       96
#define ST_GROUP_BOX2      112
#define ST_ROUNDED_CORNER  ST_GROUP_BOX + ST_CENTER
#define ST_ROUNDED_CORNER2 ST_GROUP_BOX2 + ST_CENTER

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4


////////////////
//Base Classes//
////////////////

class RscText
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_MULTI;
    linespacing = 1;
    colorBackground[] = {0,0,0,1};
    colorText[] = {1,1,1,.7};
    text = "";
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = 0.02300;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
};

class RscTitle : RscText {
    style = 0;
    font = "PuristaMedium";
    sizeEx = 0.036;
    colorText[] = {0.95, 0.95, 0.95, 1};
};

class RscFlagBox : RscText {
    font = "PuristaMedium";
    sizeEx = 0.03;
    colorBackground[] = {1,1,1,0.5};
    colorText[] = {0,0,0,0.7};
    style = ST_CENTER;
    shadow = 0;
};

class RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "Bitstream";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};

class RscButton
{
    access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,1};
    colorText2[] = {1,1,1,1};

    colorFocused[] = { 0, 0, 0, 0 };
    colorDisabled[] = { 1, 1, 1, 0.3 };
    colorBackground[] = { 1, 1, 1, 0.1 };
    colorBackground2[] = { 1, 1, 1, 0.1 };
    colorBackgroundDisabled[] = { 1, 1, 1, 0.05 };
    colorBackgroundActive[] = { 1, 1, 1, 0.2 };

    colorShadow[] = {0,0,0,0};
    colorBorder[] = {0,0,0,0};
    soundEnter[] = {"",0.1,1};
    soundPush[] = {"",0.1,1};
    soundClick[] = {"",0.1,1};
    soundEscape[] = {"",0.1,1};
    style = ST_LEFT;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = 0.035;
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    borderSize = 0;
};

class RscButtonDark : RscButton
{
    colorFocused[] = { 0, 0, 0, 0 };
    colorDisabled[] = { 1, 1, 1, 0.5 };
    colorBackground[] = { 0, 0, 0, 0.7 };
    colorBackground2[] = { 0, 0, 0, 0.7 };
    colorBackgroundDisabled[] = { 0, 0, 0, 0.4 };
    colorBackgroundActive[] = { 0, 0, 0, 0.75 };
};

class RscListBox
{
    idc = -1;
    type = CT_LISTBOX;
    style = ST_MULTI;
    w = 0.4;
    h = 0.4;
    rowHeight = 0;
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorScrollbar[] = {1, 0, 0, 0};
    colorSelect[] = {0, 0, 0, 1};
    colorSelect2[] = {0, 0, 0, 1};
    colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    colorBackground[] = {0, 0, 0, 0.3};
    soundSelect[] = {"",0.1,1};
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictudeDisabled[] = {1, 1, 1, 0.25};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    font = "PuristaMedium";
    sizeEx = 0.035;
    shadow = 0;
    colorShadow[] = {0, 0, 0, 0.5};
    period = 0.8;
    maxHistoryDelay = 1;
    colorPictureDisabled[] = {1, 1, 1, 1};
    class ListScrollBar
    {
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
    };
};

class RscListNBox {
    style = 16;
    type = CT_LISTNBOX;
    shadow = 0;
    font = "PuristaMedium";
    sizeEx = 0.035;
    color[] = {0.95,0.95,0.95,1};
    colorText[] = {1,1,1,1.0};
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = {0.95,0.95,0.95,1};
    colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
    colorSelectBackground[] = {0.8,0.8,0.8,1};
    colorSelectBackground2[] = {1,1,1,0.5};
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,1};
    soundSelect[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundCollapse[] = {"",0.1,1};
    period = 1.2;
    maxHistoryDelay = 0.5;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    class ListScrollBar
    {
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
    };
};

class RscCombo {
    style = ST_CENTER;
    type = CT_COMBO;
    x = 0;
    y = 0;
    w = 0.12;
    h = 0.035;
    shadow = 0;
    colorSelect[] = {0, 0, 0, 1};
    colorText[] = {0.95, 0.95, 0.95, 1};
    maxHistoryDelay = 1;
    colorBackground[] = {0.4,0.4,0.4,0.4};
    colorSelectBackground[] = {1, 1, 1, 0.5};
    soundCollapse[] = {"",0.1,1};
    soundExpand[] = {"",0.1,1};
    soundSelect[] = {"",0.1,1};
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    wholeHeight = 0.45;
    color[] = {1, 1, 1, 1};
    colorActive[] = {1, 0, 0, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    font = "PuristaMedium";
    sizeEx = 0.035;
    class ComboScrollBar {
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
    };
};

class RscFrame
{
    type = CT_STATIC;
    idc = -1;
    style = ST_FRAME;
    shadow = 2;
    colorBackground[] = {1,1,1,1};
    colorText[] = {1,1,1,0.9};
    font = "Bitstream";
    sizeEx = 0.03;
    text = "";
};

class RscBackground
{
    idc = -1;
    type = CT_STATIC;
    style = ST_CENTER;
    font = "PuristaMedium";
    sizeEx = 0.03;
    colorBackground[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    text = "";
};

class RscProgress
{
    type = CT_PROGRESS;
    style = 0;
    colorFrame[] = {0,0,0,0.5};
    colorBar[] = {1,1,1,1};
    texture = "#(argb,8,8,3)color(1,1,1,1)";
    w = 1;
    h = 0.03;
};

class RscStructuredText
{
    idc = -1;
    type = CT_STRUCTURED_TEXT;
    style = ST_LEFT;
    colorBackground[] = {0,0,0,0};
    size = 0.03;
    text = "";
    class Attributes {
        font = "PuristaMedium";
        color = "#ffffff";
        align = "left";
        valign = "middle";
        shadow = false;
        shadowColor = "#000000";
        size = "1";
    };
};

class RscEdit
{
    access = 0;
    type = CT_EDIT;
    style = ST_PICTURE;
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorBackground[] = {1,1,1,0.1};
    colorDisabled[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    colorSelection[] = {1,1,1,0.25};
    font = "PuristaMedium";
    sizeEx = 0.04;
    autocomplete = "";
    text = "";
    size = 0.2;
    shadow = 0;
};

class RscMapControl
{
    type = CT_MAP_MAIN;
    style = ST_PICTURE;

    colorBackground[] = {0.969, 0.957, 0.949, 1};
    colorOutside[] = {0, 0, 0, 1};
    colorText[] = {0, 0, 0, 1};
    colorSea[] = {0.467, 0.631, 0.851, 0.5};
    colorForest[] = {0.624, 0.78, 0.388, 0.5};
    colorRocks[] = {0, 0, 0, 0.3};
    colorCountlines[] = {0.572, 0.354, 0.188, 0.25};
    colorMainCountlines[] = {0.572, 0.354, 0.188, 0.5};
    colorCountlinesWater[] = {0.491, 0.577, 0.702, 0.3};
    colorMainCountlinesWater[] = {0.491, 0.577, 0.702, 0.6};
    colorForestBorder[] = {0, 0, 0, 0};
    colorRocksBorder[] = {0, 0, 0, 0};
    colorPowerLines[] = {0.1, 0.1, 0.1, 1};
    colorRailWay[] = {0.8, 0.2, 0, 1};
    colorNames[] = {0.1, 0.1, 0.1, 0.9};
    colorInactive[] = {1, 1, 1, 0.5};
    colorLevels[] = {0.286, 0.177, 0.094, 0.5};
    colorTracks[] = {0.84, 0.76, 0.65, 0.15};
    colorRoads[] = {0.7, 0.7, 0.7, 1};
    colorMainRoads[] = {0.9, 0.5, 0.3, 1};
    colorTracksFill[] = {0.84, 0.76, 0.65, 1};
    colorRoadsFill[] = {1, 1, 1, 1};
    colorMainRoadsFill[] = {1, 0.6, 0.4, 1};
    colorGrid[] = {0.1, 0.1, 0.1, 0.6};
    colorGridMap[] = {0.1, 0.1, 0.1, 0.6};

    stickX[] = {0.2, {"Gamma", 1, 1.5}};
    stickY[] = {0.2, {"Gamma", 1, 1.5}};
    moveOnEdges = 0;

    x = 0;
    y = 0;
    w = 1;
    h = 1;

    shadow = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;

    ptsPerSquareSea = 5;
    ptsPerSquareTxt = 20;
    ptsPerSquareCLn = 10;
    ptsPerSquareExp = 10;
    ptsPerSquareCost = 10;
    ptsPerSquareFor = 9;
    ptsPerSquareForEdge = 9;
    ptsPerSquareRoad = 6;
    ptsPerSquareObj = 9;

    showCountourInterval = 0;
    scaleMin = 0.001;
    scaleMax = 1;
    scaleDefault = 0.16;
    maxSatelliteAlpha = 0.85;
    alphaFadeStartScale = 2;
    alphaFadeEndScale = 2;
    fontLabel = "PuristaMedium";
    sizeExLabel = 0.02;
    fontGrid = "PuristaMedium";
    sizeExGrid = 0.02;
    fontUnits = "PuristaMedium";
    sizeExUnits = 0.02;
    fontNames = "PuristaMedium";
    sizeExNames = 0.02;
    fontInfo = "PuristaMedium";
    sizeExInfo = 0.02;
    fontLevel = "PuristaMedium";
    sizeExLevel = 0.02;

    text = "#(argb,8,8,3)color(1,1,1,1)";

    class Legend {
        colorBackground[] = {1, 1, 1, 0.5};
        color[] = {0, 0, 0, 1};
        x = "SafeZoneX + (((safezoneW / safezoneH) min 1.2) / 40)";
        y = "SafeZoneY + safezoneH - 4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
        h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        font = "PuristaMedium";
        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    };
    class ActiveMarker {
        color[] = {0.3, 0.1, 0.9, 1};
        size = 50;
    };
    class Command {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Task {
        colorCreated[] = {1, 1, 1, 1};
        colorCanceled[] = {0.7, 0.7, 0.7, 1};
        colorDone[] = {0.7, 1, 0.3, 1};
        colorFailed[] = {1, 0.3, 0.2, 1};
        color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
        icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class CustomMark {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Tree {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class SmallTree {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bush {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = "14/2";
        importance = "0.2 * 14 * 0.05 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Church {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Chapel {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Cross {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Rock {
        color[] = {0.1, 0.1, 0.1, 0.8};
        icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bunker {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fortress {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fountain {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size = 11;
        importance = "1 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class ViewTower {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
    };
    class Lighthouse {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Quay {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Fuelstation {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Hospital {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class BusStop {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Transmitter {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Stack {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size = 20;
        importance = "2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
    };
    class Ruin {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size = 16;
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
    };
    class Tourism {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.7;
        coefMax = 4;
    };
    class Watertower {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Waypoint {
        color[] = {0, 0, 0, 1};
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
    };
    class WaypointCompleted {
        color[] = {0, 0, 0, 1};
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
    };
    class power {
        icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1, 1, 1, 1};
    };
    class powersolar {
        icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1, 1, 1, 1};
    };
    class powerwave {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1, 1, 1, 1};
    };
    class powerwind {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1, 1, 1, 1};
    };
    class Shipwreck {
        icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {0, 0, 0, 1};
    };
};
