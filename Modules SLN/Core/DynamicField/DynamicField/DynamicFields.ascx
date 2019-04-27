<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicFields.ascx.cs" Inherits="DynamicField.DynamicFields" %>
<%@ Import Namespace="Models" %>
<%
    List<Mod_DynamicField> l = Mod_DynamicField.Get_All();
    if (l != null)
    {
        foreach (Mod_DynamicField df in l)
        {
            Response.Write("<div>");

            Response.Write("</div>");
        }
    }
    else
    {
        Response.Write("<div>No hay campos dinamicos definidos en el servidor</div>");
    }
%>
