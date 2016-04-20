<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contatos.aspx.cs" Inherits="View_contatos" %>

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
    <link rel="shortcut icon" href="../img/icon.png" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="../js/jquery-1.2.6.pack.js"></script>
    <script src="../js/ScriptResourceMapping.js" type="text/javascript"></script>
</head>
<body>
    <form runat="server">
    <div class="center-site">
        <div class="banner">
            <div class="logo">
            </div>
            <!--Fim da class logo-->
        </div>
        <!--Fim da class banner-->

        <div class="menu navbar-default">
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="index.aspx">Home</a></li>
                <li role="presentation"><a href="login.aspx">Login</a></li>
                <li role="presentation"><a href="cadastrar.aspx">Cadastra-se</a></li>
                <li role="presentation"><a href="contatos.aspx">Contatos</a></li>
                <li role="presentation"><a href="decoracao.aspx">Decoração</a></li>
                <li role="presentation"><a href="tipodecomida.aspx">Tipos de Comidas</a></li>
                <li role="presentation"><a href="tipodefesta.aspx">Tipos de Festas</a></li>
            </ul>
        </div>
        <!--Fim da class menu-->

        <div class="conteudo-geral">
            <div class="conteudo-contato">
                <div class="navbar-form conteudo-contato-form">
                    <span class="label label-success">Nome</span>
                    <asp:RequiredFieldValidator ID="campoNomeContatoRequired" runat="server" ControlToValidate="campoNomeContato" ErrorMessage="Informe Seu Nome" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoNomeContato" CssClass="input-lg tam-input" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <span class="label label-success">Email</span>
                    <asp:RequiredFieldValidator ID="campoEmailContatoRequired" runat="server" ControlToValidate="campoEmailContato" ErrorMessage="Informe Seu Email" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoEmailContato" CssClass="input-lg tam-input" runat="server" TextMode="Email"></asp:TextBox>
                    <br />
                    <br />
                    <span class="label label-success">Assunto</span>
                    <asp:RequiredFieldValidator ID="campoAssuntoContatoRequired" runat="server" ControlToValidate="campoAssuntoContato" ErrorMessage="Informe o Assunto" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoAssuntoContato" CssClass="input-lg tam-input" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <span class="label label-success">Mensagem</span>
                    <asp:RequiredFieldValidator ID="campoMensagemContatoRequired" runat="server" ControlToValidate="campoMensagemContato" ErrorMessage="Informe a Mensagem" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoMensagemContato" CssClass="input-lg tam-input input-fix" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="botaoEnviar" class="tam-input btn-lg btn-success" runat="server" Text="Enviar" onclick="botaoEnviar_Click"/>
                    <br />
                    <br />
                </div>
                <!--Fim da class navbar-form-->
            </div>
            <!--Fim da class conteudo-contato-->
        </div>
        <!--Fim da class conteudo-geral-->

        <div class="rodape navbar-default">
            <p>Copyright © 2015 Sistema de Buffet. Todos os direitos reservados.</p>
            <br />
            <br />
        </div>
        <!--Fim da class rodape-->

    </div>
    <!--Fim da class center-site-->
    </form>
</body>
</html>
