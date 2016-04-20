<%@ Page Language="C#" AutoEventWireup="true" CodeFile="esqueceusenha.aspx.cs" Inherits="esqueceusenha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Buffet</title>
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <link rel="stylesheet" href="../css/Style.css" />
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/ScriptResourceMapping.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="../img/icon.png" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="center-site">
        <div class="topo-recuperar col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Recuperar Senha</h3>
                </div>
                <!--Fim da class panel-heading-->
                <div class="panel-body">
                    <form class="navbar-form" runat="server">
                        <span class="label label-primary">Email</span>
                        <asp:RequiredFieldValidator ID="campoEmailRequired" runat="server" ErrorMessage="Informe Seu Email" ControlToValidate="campoEmail" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoEmail" class="input-lg btn-tam" runat="server" TextMode="Email"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="botaoEnviar" class="btn-tam btn-lg btn-primary" runat="server" Text="Enviar" onclick="botaoEnviar_Click"/>
                        <br />
                        <br />
                        <a href="login.aspx" target="_parent"><input type="button" value="Voltar" class="btn-tam btn-lg btn-success"></a>
                    </form>
                    <!--Fim da class navbar-form-->
                </div>
                <!--Fim da class panel-body-->
            </div>
            <!--Fim da class panel panel-primary-->
        </div>
        <!--Fim da class panel topo-login col-sm-4-->
    </div>
    <!--Fim da class center-site-->
</body>
</html>
