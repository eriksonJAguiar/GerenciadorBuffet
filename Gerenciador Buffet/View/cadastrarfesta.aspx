<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadastrarfesta.aspx.cs" Inherits="cadastrarfesta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
    <script type="text/javascript">
        $(document).ready(function (){ 
        $("#campoDataEvento").focus(function (){ 

            var aux = Data.Parse($("#campoDataEvento").val());
            
            var dataFesta = new Date(aux);

            var hoje = new Date();

            var dif = dataFesta - hoje;


            if (dif < 557185120) {
                alert("Data Invalida");
                $("#campoDataEvento").val('');
                
            }        
              
            }); 
        }); 

    </script>
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
                    <div class="navbar-form cadastra-festa">
                        <span class="label label-primary">Tipo de Festa</span>
                        <asp:RequiredFieldValidator ID="campoFestaRequired" InitialValue="Selecione" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoFesta" ErrorMessage="Selecione Festa" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:DropDownList ID="campoFesta" Runat="Server" CssClass="input-lg tam-input-festa"><asp:ListItem Text="Selecione" Value="Selecione"/><asp:ListItem Text="Casamento" Value="Casamento"/><asp:ListItem Text="Aniversario" Value="Aniversario"/><asp:ListItem Text="Confraternização" Value="Confraternização"/></asp:DropDownList>
                        <br />
                        <br />
                        <span class="label label-primary">Número Convidados</span>
                        <asp:RequiredFieldValidator ID="campoNumeroConvidadoRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoNumeroConvidado" ErrorMessage="Informe Número Convidados" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoNumeroConvidado" CssClass="input-lg tam-input-festa" runat="server" TextMode="Number"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-primary">Quantidade Cadeiras</span>
                        <asp:RequiredFieldValidator ID="campoNumeroQtdCadeirasRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoQtdCadeiras" ErrorMessage="Informe Quantidade Cadeiras" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoQtdCadeiras" CssClass="input-lg tam-input-festa" runat="server" TextMode="Number"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-primary">Quantidade Mesas</span>
                        <asp:RequiredFieldValidator ID="campoNumeroQtdMesasRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoQtdMesas" ErrorMessage="Informe Quantidade Mesas" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoQtdMesas" CssClass="input-lg tam-input-festa" runat="server" TextMode="Number"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-primary">Local</span>
                        <asp:RequiredFieldValidator ID="campoLocalRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoLocal" ErrorMessage="Informe Local" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoLocal" CssClass="input-lg tam-input-festa" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-primary">Data do Evento</span>
                        <asp:RequiredFieldValidator ID="campoDataEventoRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoDataEvento" ErrorMessage="Informe Data do Evento" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoDataEvento" CssClass="input-lg tam-input-festa" runat="server" TextMode="Date"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="botaoCadastrarFesta" runat="server" Text="Cadastrar Festa" class="tam-input-festa btn-lg btn-primary" OnClick="botaoCadastrarFesta_Click" ValidationGroup="Grupo1" />
                        <br />
                        <br />
                    </div>
                    <!--Fim da class navbar-form cadastra-festa-->

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
