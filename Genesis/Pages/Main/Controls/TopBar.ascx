<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBar.ascx.cs" Inherits="Genesis.Pages.Main.Controls.TopBar" %>

<!-- TopBar -->
<div class="TopBarDark">

    <img class="ProfilePic" src="../../Assets/Images/Images/photo_2018-09-28_20-11-18.jpg" />

    <!-- Dropdown de opciones -->
    <div class="DropDown">

        <i class="DropDownMark fas fa-chevron-down"></i>

        <!-- Opciones -->
        <div class="DropDownContent">
            <a class="DropDownOption"><%=USERNAME%></a>
            <a class="DropDownOption">Perfil</a>
            <a class="DropDownOption">Opciones</a>
            <a class="DropDownSeparator"></a>
            <a class="DropDownOption"><asp:Button Text="Salir" ID="ExitButton" runat="server" OnClick="ExitButton_Click" /></a>
        </div>
    </div>

    <i onclick="OpenSideBar()" style="cursor: pointer;" class="OpenSideBar fas fa-bars"></i>
</div>
