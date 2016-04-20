<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usuario.aspx.cs" Inherits="usuario" %>

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
    <script type="text/javascript" src="../js/jquery-1.2.6.pack.js"></script>
    <script src="../js/ScriptResourceMapping.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.maskedinput-1.1.4.pack.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".editar-Festa").hide(1);
        });
    </script>
    <script type="text/javascript">
        function mostrar() {
            $(document).ready(function () {
                $(".editar-Festa").show(1);
                $("#campoDataEvento").mask("99/99/9999");
            });
        }

        function ocultar() {
            $(document).ready(function () {
                $(".editar-Festa").hide(1);
            });
        }
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
                <br />
                <asp:GridView ID="TabelaFesta" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="festa_id" DataSourceID="sqlFesta" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="TabelaFesta_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="festa_id" HeaderText="Código da Festa" InsertVisible="False" ReadOnly="True" SortExpression="festa_id" />
                        <asp:BoundField DataField="tipoFesta" HeaderText="Tipo de Festa" SortExpression="tipoFesta" />
                        <asp:BoundField DataField="numeroConvidados" HeaderText="Convidados" SortExpression="numeroConvidados" />
                        <asp:BoundField DataField="quantidadeCadeiras" HeaderText="Cadeiras" SortExpression="quantidadeCadeiras" />
                        <asp:BoundField DataField="quantidadeMesas" HeaderText="Mesas" SortExpression="quantidadeMesas" />
                        <asp:BoundField DataField="local" HeaderText="Local" SortExpression="local" />
                        <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" />
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                        <asp:BoundField DataField="valorTotal" HeaderText="ValorTotal" SortExpression="valorTotal" DataFormatString="{0:c2}" />
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/edicao.png" ShowSelectButton="True"/>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>

                <asp:SqlDataSource ID="sqlFesta" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT [festa_id], [tipoFesta], [numeroConvidados], [quantidadeCadeiras], [quantidadeMesas], [local], [data], [status], [valorTotal] FROM [Festas]"></asp:SqlDataSource>
                <br />
                <br />
                <div class="editar-Festa">
                        <span class="label label-success">Tipo de Festa</span>
                        <asp:RequiredFieldValidator ID="campoFestaRequired" InitialValue="Selecione" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoFesta" ErrorMessage="Selecione Festa" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:DropDownList ID="campoFesta" Runat="Server" CssClass="input-lg tam-input-festa"><asp:ListItem Text="Selecione" Value="Selecione"/><asp:ListItem Text="Casamento" Value="Casamento"/><asp:ListItem Text="Aniversario" Value="Aniversario"/><asp:ListItem Text="Confraternização" Value="Confraternização"/></asp:DropDownList>
                        <br />
                        <br />
                        <span class="label label-success">Número Convidados</span>
                        <asp:RequiredFieldValidator ID="campoNumeroConvidadoRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoNumeroConvidado" ErrorMessage="Informe Número Convidados" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoNumeroConvidado" CssClass="input-lg tam-input-festa" runat="server" TextMode="Number"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-success">Quantidade Cadeiras</span>
                        <asp:RequiredFieldValidator ID="campoNumeroQtdCadeirasRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoQtdCadeiras" ErrorMessage="Informe Quantidade Cadeiras" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoQtdCadeiras" CssClass="input-lg tam-input-festa" runat="server" TextMode="Number"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-success">Quantidade Mesas</span>
                        <asp:RequiredFieldValidator ID="campoNumeroQtdMesasRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoQtdMesas" ErrorMessage="Informe Quantidade Mesas" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoQtdMesas" CssClass="input-lg tam-input-festa" runat="server" TextMode="Number"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-success">Local</span>
                        <asp:RequiredFieldValidator ID="campoLocalRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoLocal" ErrorMessage="Informe Local" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoLocal" CssClass="input-lg tam-input-festa" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <span class="label label-success">Data do Evento</span>
                        <asp:RequiredFieldValidator ID="campoDataEventoRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoDataEvento" ErrorMessage="Informe Data do Evento" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoDataEvento" CssClass="input-lg tam-input-festa" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="botaoAlterarFesta" runat="server" Text="Alterar Festa" class="tam-input-festa btn-lg btn-success" OnClick="botaoAlterarFesta_Click" ValidationGroup="Grupo1" />
                        <br />
                        <br />
                </div>
                <!--Fim da class editar-Festa-->

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
