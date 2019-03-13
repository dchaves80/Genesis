<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Genesis.Pages.Main.Main" %>

<%@ Register Src="~/Pages/Main/Controls/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Pages/Main/Controls/SideBar.ascx" TagPrefix="uc1" TagName="SideBar" %>



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
    <script src="../../Modules/Usuarios/Usuarios.js"></script>

</head>
<body class="BackgroundDark" style="font-family: 'Roboto'; color: white;">
    <form id="form1" runat="server">
        <%
            if (Session["misesion"] != null)
            {
                Response.Write("Existe,");
            }
            %>
        <!-- USER CONTROL -->
        <div id="UserControl">            

            <uc1:TopBar runat="server" id="TopBar" />
            <uc1:SideBar runat="server" ID="SideBar" />
            
        </div>

        <!-- MODULE CONTAINER -->
        <div style="padding: 50px;" runat="server" id="ModuleContainer">
            

        </div>

    </form>
</body>
</html>
