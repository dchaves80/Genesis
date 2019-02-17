<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Genesis.Pages.Main.Main" %>

<!DOCTYPE html>

<html style="height: 100%;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Genesis</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous" />    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link href="../../Assets/CSS/General.css" rel="stylesheet" />
    <link href="../../Assets/CSS/Main.css" rel="stylesheet" />

    <script src="../../Assets/Js/Main.js"></script>

</head>
<body class="BackgroundDark" style="font-family: 'Roboto'; color: white;">
    <form id="form1" runat="server">

        <!-- USER CONTROL -->
        <div id="UserControl">

            <!-- TopBar -->
            <div class="TopBarDark">

                <img class="ProfilePic" src="../../Assets/Images/Images/photo_2018-09-28_20-11-18.jpg" />

                <!-- Dropdown de opciones -->
                <div class="DropDown">

                    <i class="DropDownMark fas fa-chevron-down"></i>

                    <!-- Opciones -->
                    <div class="DropDownContent">
                        <a class="DropDownOption">Perfil</a>
                        <a class="DropDownOption">Opciones</a>
                        <a class="DropDownSeparator"></a>
                        <a class="DropDownOption">Salir</a>
                    </div>
                </div>

                <i onclick="OpenSideBar()" style="cursor: pointer;" class="OpenSideBar fas fa-bars"></i>
            </div>

            <!-- SideBar -->
            <div id="MenuSideBar" class="SideBarDark">

                <!-- Options -->
                <a class="SideBarDarkOption" onclick="CloseSideBar()" style="background: #233444; height: 35px; cursor: pointer;">CERRAR</a>                                        
                <a class="SideBarDarkOption"><i class="fas fa-address-card"></i> PACIENTES</a>                    
                <a class="SideBarDarkOption"><i class="fas fa-book"></i> HISTORIA CLÍNICA</a>
                <a class="SideBarOptionSeparator" style="cursor: default;"></a>
                <a class="SideBarDarkOption">OPCION 3</a>
            </div>
        </div>

        <!-- MODULE CONTAINER -->
        <div runat="server" id="ModuleContainer">

        </div>

    </form>
</body>
</html>
