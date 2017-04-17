<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage/CRMaster.master" %>
<%@ MasterType VirtualPath="~/MasterPage/CRMaster.master" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
    <script>
        $(function () {
            window.location = "Masters/UserDetails.aspx";
        });
    </script>
</asp:Content>
