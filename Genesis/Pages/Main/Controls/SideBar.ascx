<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBar.ascx.cs" Inherits="Genesis.Pages.Main.Controls.SideBar" %>

<script src="../../Assets/Js/SideBar.js"></script>
<!-- SideBar -->
<div id="MenuSideBar" class="SideBarDark">
    
    <!-- Options -->
    <a class="SideBarDarkOption" onclick="CloseSideBar()" style="background: #233444; height: 35px; cursor: pointer;">CERRAR</a>

    <%@ Import Namespace="Models" %>
    <%
        List<Mod_Modules> ActiveModules = Mod_Modules.GetModules();
        try {
            foreach (Mod_Modules module in ActiveModules)
            {
                Response.Write("<a class=\"SideBarDarkOption\" OnClick=\"LoadModule('" + module.Id + "')\"><i class=\"fas fa-address-card\"></i> "+ module.Name +"</a>");
            }
        } catch (Exception E)
        {
            new Mod_Exception(E, Response);
        }

    %>
    
    
    <!--
    <a class="SideBarDarkOption"><i class="fas fa-address-card"></i>PACIENTES</a>
    <a class="SideBarDarkOption"><i class="fas fa-book"></i>HISTORIA CLÍNICA</a>
    <a class="SideBarOptionSeparator" style="cursor: default;"></a>
    <a class="SideBarDarkOption">OPCION 3</a>
    -->
</div>
