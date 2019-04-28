<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicFields.ascx.cs" Inherits="DynamicField.DynamicFields" %>
<%@ Import Namespace="Models" %>
<%
    List<Mod_DynamicField> l = Mod_DynamicField.Get_All();
    if (l != null)
    {
        foreach (Mod_DynamicField df in l)
        {
            Response.Write("<div>");
            Response.Write("<label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>");
            Response.Write("<input style='color: rgba(255,255,255,0.8)' placeholder='' class='InputTextDark FieldInput' type='text' data-FieldId='" + df.ID + "' value='" + df.NAME + "'>");
            Response.Write("<span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>Campo:</span></span>");
            Response.Write("</label>");
            Response.Write("</div>");
        }

        Response.Write("<Input type='button' value='Guardar'>");

    }
    else
    {
        Response.Write("<div>No hay campos dinamicos definidos en el servidor</div>");
    }
%>
