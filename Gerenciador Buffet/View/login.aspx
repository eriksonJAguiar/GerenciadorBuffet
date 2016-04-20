<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
        <div class="topo-login col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Painel de Login</h3>
                </div>
                <div class="panel-body">
                    <form class="navbar-form" runat="server">
                        <span class="label label-primary">Login</span>
                        <asp:RequiredFieldValidator ID="campoLoginRequired" runat="server" ErrorMessage="Informe Seu Login" ControlToValidate="campoLogin" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoLogin" class="input-lg tam-input-login" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-primary">Senha</span>
                        <asp:RequiredFieldValidator ID="campoSenhaRequired" runat="server" ErrorMessage="Informe Sua Senha" ControlToValidate="campoSenha" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoSenha" class="input-lg tam-input-login" runat="server" TextMode="Password"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="botaoEntrar" class="tam-input-login btn-lg btn-primary" runat="server" Text="Entrar" onclick="botaoLogin_Click"/>
                    </form>
                    <!--Fim da class navbar-form-->
                    <br />
                    <div class="text-senha">
                        <a href="esqueceusenha.aspx" target="_parent">
                            <p>Esqueceu sua senha?</p>
                        </a>
                    </div>
                    <!--Fim da class text-senha-->
                </div>
                <!--Fim da class panel-body-->
            </div>
            <!--Fim da class panel panel-primary-->
            <a href="cadastrar.aspx" target="_parent">
                <input class="tam-input-login-geral btn-lg btn-success" type="submit" value="Cadastre-se" />
            </a>
            <br />
            <br />
            <a href="index.aspx" target="_parent">
                <input class="tam-input-login-geral btn-lg btn-danger" type="submit" value="Voltar" />
            </a>
        </div>
        <!--Fim da class col-sm-3-->
    </div>
    <!--Fim da class center-site-->
</body>
</html>
