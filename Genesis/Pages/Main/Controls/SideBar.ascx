<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBar.ascx.cs" Inherits="Genesis.Pages.Main.Controls.SideBar" %>

<script src="../../Assets/Js/SideBar.js"></script>
<!-- SideBar -->
<div id="MenuSideBar" class="SideBarDark">
    
    <!-- Options -->
    <a class="SideBarDarkOption" onclick="CloseSideBar()" style="background: #233444; height: 35px; cursor: pointer;">CERRAR</a>

    <table class="TableSideBarDark">


        <%@ Import Namespace="Models" %>
        <%
            //Gets all the active modules in the system, and a new list to avoid duplicated modules in the sidebar
            List<Mod_Modules> ActiveModules = Mod_Modules.Get_All();
            List<Mod_Modules> GrantedModules = new List<Mod_Modules>();

            //Gets the active user and its roles.
            Mod_Users activeUser = Session[Models.ConstantLibrary.Session_Library.USER] as Mod_Users;
            List<Mod_Roles> activeRoles = activeUser.ROLES;
            bool is_SU = false;
            try
            {
                //If the user is a SuperUser, access to all modules must be granted right away.
                foreach (Mod_Roles role in activeRoles) { if (role.ROLE == "SuperUser") { is_SU = true; break; } }
                if (is_SU)
                {
                    foreach (Mod_Modules module in ActiveModules)
                    {
                        Response.Write(
                                    "<tr OnClick='LoadModule(\"" + module.ID + "\")'>" +
                                        "<td style='text-align: center; padding-right: 10px;'> <i class='fas fa-" + module.ICON + "'></i> </td>" +
                                        "<td> " + module.NAME + " </td>" +
                                    "</tr>");
                    }
                }
                //..but if the user isn't a SuperUser, a search for coincidences in the two lists is conducted.
                else
                {
                    foreach (Mod_Modules module in ActiveModules)
                    {
                        List<Mod_Roles> legalRoles = module.Get_Permissions();
                        bool hasPermission = false;
                        if (legalRoles != null && activeRoles != null)
                        {
                            foreach (Mod_Roles activeRole in activeRoles)
                            {
                                foreach (Mod_Roles legalRole in legalRoles)
                                {
                                    if (legalRole.ID == activeRole.ID)
                                    {
                                        hasPermission = true;
                                    }
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<tr><td>" + module.NAME + " no tiene roles</td></tr>");
                        }
                        if (hasPermission)
                        {
                            Response.Write(
                                            "<tr OnClick='LoadModule(\"" + module.ID + "\")'>" +
                                                "<td style='text-align: center; padding-right: 10px;'> <i class='fas fa-" + module.ICON + "'></i> </td>" +
                                                "<td> " + module.NAME + " </td>" +
                                            "</tr>");
                        }
                    }
                }


            }
            catch (Exception E)
            {
                new Mod_Exception(E, Response);
            }

        %>
    </table>
    
</div>
