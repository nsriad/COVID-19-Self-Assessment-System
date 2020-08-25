<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="COVID_19_Self_Assessment_System.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Welcome</title>
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!-- Font-->
    <link rel="stylesheet" type="text/css" href="css/opensans-font.css" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css" />
    <!-- Main Style Css -->
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <form class="form-register" id="form1" runat="server">
        <asp:Button ID="login" CssClass="logbutton" runat="server" Text="Login" OnClick="login_Click" />
        <div class="page-content">
            <div class="wizard-heading" style="text-align:center;">COVID-19 Self Assessment System</div>
            <div class="wizard-v6-content">
                <div class="wizard-form newfooter" style="background:none;">

                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="step1" runat="server">
                            <div id="form-total">
                                <div class="inner">
                                    <div class="form-row">
                                        <h4 class="button">Step 1</h4>
                                        <h2 style="color: white; padding-left: 10px;">Personal Information</h2>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-holder">
                                            <label class="form-row-inner">
                                                <asp:TextBox ID="age" TextMode="Number" placeholder="Enter Your Age" CssClass="textbox" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                            </label>
                                        </div>
                                        <div class="form-holder">
                                            <label class="form-row-inner">
                                                <asp:TextBox ID="temperature" placeholder="Enter body temperature in Ferenheit" CssClass="textbox" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-holder form-holder-2">
                                            <label class="form-row-inner">
                                                <asp:DropDownList ID="sex" CssClass="drop textbox" runat="server">
                                                    <asp:ListItem Value="0">--Select Gender--</asp:ListItem>
                                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                                    <asp:ListItem Value="3">Others</asp:ListItem>
                                                </asp:DropDownList>

                                            </label>
                                        </div>
                                    </div>

                                    <asp:Label ID="message" runat="server" Style="margin-left: 20px; padding: 20px;" Text="*Please fill up all the field!" Visible="False" ForeColor="Yellow" Font-Underline="True" Font-Bold="True"></asp:Label>
                                    <asp:Button ID="step1next" runat="server" CssClass="next" Text="Next" OnClientClick="return confirm('Are you sure to proceed next step?');" OnClick="step1next_Click" />
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="step2" runat="server">
                            <div id="step2div">
                                <div class="inner">

                                    <div class="form-row">
                                        <h4 class="button">Step 2</h4>
                                        <h2 style="color: white">Select Symptoms</h2>
                                    </div>
                                    <div class="form-row">
                                        <asp:CheckBoxList CssClass="CheckBoxList" ID="symptom_checkbox" Style="color: white; margin-left: 35%;margin-right:35%;" runat="server">
                                            <asp:ListItem Value="1">Breath problem</asp:ListItem>
                                            <asp:ListItem Value="2">Dry cough</asp:ListItem>
                                            <asp:ListItem Value="3">Sore throat</asp:ListItem>
                                            <asp:ListItem Value="4">Weakness</asp:ListItem>
                                            <asp:ListItem Value="5">Runny nose</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                    <asp:Button ID="step2prev" runat="server" CssClass="prev" Text="Previous" OnClick="step2prev_Click" Visible="False" />
                                    <asp:Button ID="step2next" runat="server" CssClass="next" Text="Next" OnClientClick="return confirm('Are you sure to proceed next step?');" OnClick="step2next_Click" />
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="step3" runat="server">
                            <div id="step3div">
                                <div class="inner">

                                    <div class="form-row">
                                        <h4 class="button">Step 3</h4>
                                        <h2 style="color: white">Additional Symptoms Information</h2>
                                    </div>
                                    <div class="form-row">
                                        <asp:CheckBoxList ID="add_symptom_checkbox" CssClass="CheckBoxList" Style="color: white; margin-left: 25%;margin-right:25%;" runat="server">
                                            <asp:ListItem Value="1">Abdominal pain</asp:ListItem>
                                            <asp:ListItem Value="2">Vomiting</asp:ListItem>
                                            <asp:ListItem Value="3">Diarrhoea</asp:ListItem>
                                            <asp:ListItem Value="4">Chest pain or pressure</asp:ListItem>
                                            <asp:ListItem Value="5">Muscle pain</asp:ListItem>
                                            <asp:ListItem Value="6">Loss of taste or smell</asp:ListItem>
                                            <asp:ListItem Value="7">Rash on skin, or discoloration of fingers or toes</asp:ListItem>
                                            <asp:ListItem Value="8">Loss of speech or movement</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                    <asp:Button ID="step3prev" runat="server" CssClass="prev" Text="Previous" OnClick="step3prev_Click" Visible="False" />
                                    <asp:Button ID="submit" runat="server" CssClass="next" Text="Submit" OnClientClick="return confirm('Are you sure to proceed next step?');" OnClick="submit_Click" />
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="finalstep" runat="server">
                            <div id="finalstepdiv">
                                <div class="inner">

                                    <div class="form-row">
                                        <h4 class="button">Reports</h4>
                                        <h2 style="color: white">Final Result Based on your information</h2>
                                    </div>
                                    <div class="form-row">
                                        <asp:Table ID="resultTable" CssClass="tbl" runat="server" Caption="COVID-19 Result" CaptionAlign="Top" GridLines="Both" CellPadding="10" CellSpacing="10" HorizontalAlign="Center" BorderColor="Black" BorderWidth="2px">
                                            <asp:TableRow>
                                                <asp:TableCell>Age</asp:TableCell><asp:TableCell>
                                                    <asp:Literal ID="ageLiteral" runat="server"></asp:Literal>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>Gender</asp:TableCell><asp:TableCell>
                                                    <asp:Literal ID="sexLiteral" runat="server"></asp:Literal>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>Temperature</asp:TableCell><asp:TableCell>
                                                    <asp:Literal ID="tempLiteral" runat="server"></asp:Literal>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>COVID-19 Result</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Literal ID="resultLiteral" runat="server"></asp:Literal>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                    <div class="form-row">
                                        <asp:Table ID="advicetbl" CssClass="tbl" runat="server" HorizontalAlign="Center">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="advicelbl" runat="server" Style="padding: 20px;" BorderColor="White" BorderWidth="2" Font-Bold="True">

                                                    </asp:Label>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                    <div class="form-row">
                                        <asp:Table ID="contactnumber" CssClass="tbl" runat="server" Style="padding: 15px;" Visible="False" HorizontalAlign="Center" GridLines="Horizontal" BorderColor="Black" BorderWidth="2px">
                                            <asp:TableHeaderRow>
                                                <asp:TableCell HorizontalAlign="Center" Style="padding: 20px;" VerticalAlign="Middle" Wrap="False" ForeColor="green" Font-Bold="True">
                                                    Emergency Hotlines:
                                                </asp:TableCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow HorizontalAlign="Center" VerticalAlign="Middle">
                                                <asp:TableCell>+8801937000011</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow HorizontalAlign="Center" VerticalAlign="Middle">
                                                <asp:TableCell>+8801937003311</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow HorizontalAlign="Center" VerticalAlign="Middle">
                                                <asp:TableCell>+8801937000231</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow HorizontalAlign="Center" VerticalAlign="Middle">
                                                <asp:TableCell>+8801937000212</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow HorizontalAlign="Center" VerticalAlign="Middle">
                                                <asp:TableCell>+8801937000334</asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                    <asp:Button ID="finalprevious" runat="server" CssClass="prev" Text="Previous" OnClick="finalprevious_Click" Visible="False" />
                                    <asp:Button ID="done" runat="server" CssClass="next" Text="Done" OnClick="done_Click" />
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>


                </div>
            </div>
        </div>
        <div class="newfooter">
            <asp:Label ID="footerlabel" runat="server">
            <p style="margin:5px;">This COVID 19 Self Assessment System is only for software development purpose and may not yield actual result. Any information given by users of this system will not be disclosed or store to anywhere.</p>
            </asp:Label>
        </div>
    </form>
</body>
</html>
