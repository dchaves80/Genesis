<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBar.ascx.cs" Inherits="Genesis.Pages.Main.Controls.SideBar" %>

<script src="../../Assets/Js/SideBar.js"></script>
<!-- SideBar -->
<div id="MenuSideBar" class="SideBarDark">
    
    <!-- Options -->
    <a class="SideBarDarkOption" onclick="CloseSideBar()" style="background: #233444; height: 35px; cursor: pointer;">CERRAR</a>

    <table class="TableSideBarDark">


        <%@ Import Namespace="Models" %>
        <%
            List<Mod_Modules> ActiveModules = Mod_Modules.Get_All();
            try
            {
                foreach (Mod_Modules module in ActiveModules)
                {
                    List<Mod_Roles> legalRoles = module.Get_Permissions();
                    Mod_Users activeUser = Session[Models.ConstantLibrary.Session_Library.USER] as Mod_Users;
                    List<Mod_Roles> activeRoles = activeUser.ROLES;

                    if (legalRoles != null && activeRoles != null)
                    {
                        foreach (Mod_Roles legalRole in legalRoles)
                        {
                            foreach (Mod_Roles activeRole in activeRoles)
                            {
                                if (legalRole.ID == activeRole.ID)
                                {
                                    Response.Write(
                                        "<tr OnClick='LoadModule(\"" + module.Id + "\")'>" +
                                            "<td style='text-align: center; padding-right: 10px;'> <i class='fas fa-" + module.Icon + "'></i> </td>" +
                                            "<td> " + module.Name + " </td>" +
                                        "</tr>");
                                    //Response.Write("<a class=\"SideBarDarkOption\" OnClick=\"LoadModule('" + module.Id + "')\">");
                                    //Response.Write("<i class=\"fas fa-" + module.Icon + "\"></i> ");
                                    //Response.Write(module.Name + "</a>");
                                }
                            }
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
