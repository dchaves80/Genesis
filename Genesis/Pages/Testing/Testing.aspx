<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Testing.aspx.cs" Inherits="Genesis.Pages.Testing.Testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                if (Request["iduser"]!=null && Request["idrole"] != null)
                {
                    int iduser = int.Parse(Request["iduser"].ToString());
                    int idrole = int.Parse(Request["idrole"].ToString());
                    Connection.Con_UsersRoles.Delete_UsersRoles(null, iduser, idrole);
                }

                %>
        </div>
    </form>
</body>
</html>
