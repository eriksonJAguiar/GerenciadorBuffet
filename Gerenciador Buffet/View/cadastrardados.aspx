<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadastrardados.aspx.cs" Inherits="cadastrardados" %>

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
        <div class="topo-cadastro col-sm-4">
            <div class="panel panel-primary panel-cadastro">
                <div class="panel-heading">
                    <h3 class="panel-title">Dados Adicionais</h3>
                </div>
                <!--Fim da class panel-heading-->
                <div class="panel-body">
                    <form class="navbar-form" runat="server">
                        <span class="label label-primary">Nome Completo</span>
                        <asp:RequiredFieldValidator ID="campoNomeRequired" runat="server" ControlToValidate="campoNome" ErrorMessage="Informe Seu Nome Completo" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoNome" CssClass="input-lg tam-input" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-primary">Endereço</span>
                        <asp:RequiredFieldValidator ID="campoEnderecoRequired" runat="server" ControlToValidate="campoEndereco" ErrorMessage="Informe Seu Endereço" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoEndereco" class="input-lg tam-input" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-primary">Cidade</span>
                        <asp:RequiredFieldValidator ID="campoCidadesRequired" runat="server" ControlToValidate="campoCidades" ErrorMessage="Informe Sua Cidade" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoCidades" class="input-lg tam-input" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-primary">Telefone</span>
                        <asp:RequiredFieldValidator ID="campoTelefoneRequired" runat="server" ControlToValidate="campoTelefone" ErrorMessage="Informe Seu Telefone" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoTelefone" class="input-lg tam-input" runat="server" TextMode="Phone"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="botaoFinalizarCadastro" class="tam-input btn-lg btn-primary" runat="server" Text="Finalizar Cadastro" OnClick="botaoFinalizarCadastro_Click" />
                    </form>
                    <!--Fim da class navbar-form-->
                </div>
                <!--Fim da class panel-body-->
            </div>
            <!--Fim da class panel panel-primary-->
        </div>
        <!--Fim da class col-sm-3-->
    </div>
    <!--Fim da class center-site-->
</body>
</html>
