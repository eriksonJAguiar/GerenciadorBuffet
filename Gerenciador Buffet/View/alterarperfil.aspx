<%@ Page Language="C#" AutoEventWireup="true" CodeFile="alterarperfil.aspx.cs" Inherits="alterarperfil" %>

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
    <script type="text/javascript" src="../js/jquery.maskedinput-1.1.4.pack.js"></script>
    <script type="text/javascript">$(document).ready(function () { $("#campoCpf").mask("999.999.999-99"); });</script>
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

            <div class="top-cliente">
                <div class="usuario-nome">
                    <asp:Label ID="nome" runat="server" Text=""></asp:Label>
                </div>
                <!--Fim da class usuario-nome-->
                

                <div class="deslogar">
                    <asp:Button ID="botaoDeslogar" runat="server" Text="Deslogar" class="btn btn-success" OnClick="botaoDeslogar_Click" />
                </div>
                <!--Fim da class deslogar-->

                <div class="home-usuario">
                   <a class="btn btn-success" href="usuario.aspx">Home</a>
                </div>
                <!--Fim da class home-usuario-->

            </div>
            <!--Fim da class top-cliente-->

            <div class="conteudo-cliente">
                <div class="menu-cliente">
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation"><a class="btn-success" href="cadastrarfesta.aspx">Cadastrar Festa</a></li>
                        <li role="presentation"><a class="btn-success" href="dadosfestas.aspx">Dados da Festas</a></li>
                        <li role="presentation"><a class="btn-success" href="alterarperfil.aspx">Alterar Perfil</a></li>
                    </ul>
                </div>
                <!--Fim da class menu-cliente-->

                <div class="conteudo">
                    <div class="conteudo-left">
                        <div class="navbar-form">
                            <span class="label label-primary">Nome Completo</span>
                            <asp:RequiredFieldValidator ID="campoNomeRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoNome" ErrorMessage="Informe Seu Nome Completo" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoNome" CssClass="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Endereço</span>
                            <asp:RequiredFieldValidator ID="campoEnderecoRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoEndereco" ErrorMessage="Informe Seu Endereço" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoEndereco" class="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Cidade</span>
                            <asp:RequiredFieldValidator ID="campoCidadesRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoCidades" ErrorMessage="Informe Sua Cidade" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoCidades" class="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Telefone</span>
                            <asp:RequiredFieldValidator ID="campoTelefoneRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoTelefone" ErrorMessage="Informe Seu Telefone" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoTelefone" class="input-lg tam-input" runat="server" TextMode="Phone"></asp:TextBox>
                            <br />
                            <br />
                        </div>
                    </div>
                    <!--Fim da class conteudo-left-->

                    <div class="conteudo-right">
                        <div class="navbar-form mov-right-conteudo">
                            <span class="label label-primary">Login</span>
                            <asp:RequiredFieldValidator ID="campoLoginRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoLogin" ErrorMessage="Informe Seu Login" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoLogin" class="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Senha</span>
                            <asp:RequiredFieldValidator ID="campoSenhaRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoSenha" ErrorMessage="Informe Sua Senha" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoSenha" class="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">E-mail</span>
                            <asp:RequiredFieldValidator ID="campoEmailRequired" runat="server" ErrorMessage="Informe Seu E-mail" ValidationGroup="Grupo1" ControlToValidate="campoEmail" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoEmail" class="input-lg tam-input" runat="server" TextMode="Email"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Cpf</span>
                            <asp:RequiredFieldValidator ID="campoCpfRequired" runat="server" ErrorMessage="Informe Seu Cpf" ValidationGroup="Grupo1" ControlToValidate="campoCpf" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoCpf" class="input-lg tam-input" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <!--Fim da class conteudo-right-->

                    <asp:Button ID="botaoAlterarPerfil" Width="100%" class="btn-lg btn-primary" runat="server" Text="Alterar" OnClick="botaoAlterarPerfil_Click" ValidationGroup="Grupo1" />
                    <br />
                    <br />

                </div>
                <!--Fim da class conteudo-->

            </div>
            <!--Fim da class conteudo-cliente-->

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
