<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_page.aspx.cs" Inherits="COVID_19_Self_Assessment_System.admin_page" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Welcome Admin</title>
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!-- Font-->
    <link rel="stylesheet" type="text/css" href="css/opensans-font.css" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
    <link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css" />
    <!-- Main Style Css -->
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <form class="form-register" id="form1" runat="server">
        <asp:Button ID="homepage" CssClass="logbutton" runat="server" Text="Home Page" OnClick="homepage_Click" />
        <div class="page-content">
            <div class="wizard-heading" style="text-align: center;">COVID-19 Self Assessment System Admin view</div>
            <div class="wizard-v6-content">
                <div class="wizard-form">
                    <div id="finalstepdiv">
                        <div class="inner">

                            <div class="button" style="padding:1px;">
                                <h4 style="text-align: center;">All User Records</h4>
                            </div>
                            <div class="button" style="overflow-x:auto;background:#908ccf">
                                <asp:GridView ID="GridView1" runat="server" CaptionAlign="Top" CellPadding="5" CellSpacing="5" HorizontalAlign="Center" ForeColor="Black">
                                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
