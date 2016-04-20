<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gerenciaralimentacao.aspx.cs" Inherits="gerenciaralimentacao" %>

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
                   <a class="btn btn-success" href="admin.aspx">Home</a>
                </div>
                <!--Fim da class home-usuario-->

            </div>
            <!--Fim da class top-cliente-->

            <div class="conteudo-cliente">
                <div class="menu-cliente">
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation"><a class="btn-success" href="gerenciaralimentacao.aspx">Gerenciar Alimentação</a></li>
                        <li role="presentation"><a class="btn-success" href="gerenciargarcons.aspx">Gerenciar Garçons</a></li>
                        <li role="presentation"><a class="btn-success" href="gerenciarbebida.aspx">Gerenciar Bebidas</a></li>
                        <li role="presentation"><a class="btn-success" href="consultar.aspx">Consultar</a></li>
                    </ul>
                </div>
                <!--Fim da class menu-cliente-->

                <div class="conteudo">
                    <div class="navbar-form cadastra-alimento">
                            <span class="label label-primary">Nome do Alimento</span>
                            <asp:RequiredFieldValidator ID="campoNomeAlimentoRequired" ValidationGroup="Gropo1" runat="server" ControlToValidate="campoNomeAlimento" ErrorMessage="Informe Nome do Alimento" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoNomeAlimento" CssClass="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Descrição</span>
                            <asp:RequiredFieldValidator ID="campoDescricaoAlimentoRequired" ValidationGroup="Gropo1" runat="server" ControlToValidate="campoDescricaoAlimento" ErrorMessage="Informe Descrição" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoDescricaoAlimento" CssClass="input-lg tam-input input-fix" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Quantidade</span>
                            <asp:RequiredFieldValidator ID="campoQtdAlimentoRequired" ValidationGroup="Gropo1" runat="server" ControlToValidate="campoQtdAlimento" ErrorMessage="Informe Quantidade" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoQtdAlimento"  CssClass="input-lg tam-input" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Valor Unitário</span>
                            <asp:RequiredFieldValidator ID="campoValorUnitarioAlimentoRequired" ValidationGroup="Gropo1" runat="server" ControlToValidate="campoValorUnitarioAlimento" ErrorMessage="Informe Valor Unitário" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoValorUnitarioAlimento" CssClass="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Imagem</span>
                            <asp:RequiredFieldValidator ID="campoImagemAlimentoRequired" ValidationGroup="Gropo1" runat="server" ControlToValidate="campoImagemAlimento" ErrorMessage="Upload Imagem" CssClass="info alert-danger" Visible="true"></asp:RequiredFieldValidator><asp:FileUpload ID="campoImagemAlimento" runat="server" CssClass="input btn-primary btn-sm"/>
                            <br />
                            <br />
                            <asp:Button ID="botaoCadastraAlimento" class="tam-input btn-lg btn-primary" runat="server" Text="Cadastrar" OnClick="botaoCadastraAlimento_Click" Visible="true" ValidationGroup="Gropo1" />
                            <asp:Button ID="botaoAlterarAlimento" class="tam-input btn-lg  btn-success" runat="server" Text="Alterar" OnClick="botaoAlterarAlimentoo_Click" Visible="false" ValidationGroup="Gropo1" />
                            <br />
                            <br />
                    </div>
                    <!--Fim da class navbar-form-->
                </div>
                <!--Fim da class conteudo-->

                <div class="conteudo-central-alimento">
                    <asp:GridView ID="TabelaAlimentos" runat="server" AutoGenerateColumns="False" DataKeyNames="alimento_id" DataSourceID="SqlDataSource2" CellPadding="5" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="TabelaAlimentos_SelectedIndexChanged" OnRowCommand="TabelaAlimentos_DeleteRow" CellSpacing="5" HorizontalAlign="Center">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="alimento_id" HeaderText="Código Alimento" ReadOnly="True" SortExpression="alimento_id" InsertVisible="False" />
                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                            <asp:BoundField DataField="descricao" HeaderText="Descrição" SortExpression="descricao" />
                            <asp:BoundField DataField="imagemAlimento" HeaderText="Imagem" SortExpression="imagemAlimento" />
                            <asp:BoundField DataField="quantidade" HeaderText="Quantidade" SortExpression="quantidade" />
                            <asp:BoundField DataField="valorUnitario" HeaderText="Valor Unitário" SortExpression="valorUnitario" DataFormatString="{0:c2}" />
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/edicao.png" ShowSelectButton="True" />
                            <asp:ButtonField ButtonType="Image" CommandName="Delete" ImageUrl="~/img/excluir.png" Text="Button" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" Wrap="True" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT [alimento_id], [nome], [descricao], [imagemAlimento], [quantidade], [valorUnitario] FROM [Alimentos]" DeleteCommand="DELETE FROM [Alimentos] WHERE [alimento_id] = @original_alimento_id" InsertCommand="INSERT INTO [Alimentos] ([nome], [descricao], [imagemAlimento], [quantidade], [valorUnitario]) VALUES (@nome, @descricao, @imagemAlimento, @quantidade, @valorUnitario)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Alimentos] SET [nome] = @nome, [descricao] = @descricao, [imagemAlimento] = @imagemAlimento, [quantidade] = @quantidade, [valorUnitario] = @valorUnitario WHERE [alimento_id] = @original_alimento_id">
                        <DeleteParameters>
                            <asp:Parameter Name="original_alimento_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nome" Type="String" />
                            <asp:Parameter Name="descricao" Type="String" />
                            <asp:Parameter Name="imagemAlimento" Type="String" />
                            <asp:Parameter Name="quantidade" Type="Int32" />
                            <asp:Parameter Name="valorUnitario" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nome" Type="String" />
                            <asp:Parameter Name="descricao" Type="String" />
                            <asp:Parameter Name="imagemAlimento" Type="String" />
                            <asp:Parameter Name="quantidade" Type="Int32" />
                            <asp:Parameter Name="valorUnitario" Type="Decimal" />
                            <asp:Parameter Name="original_alimento_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                </div>
                <!--Fim da class conteudo-central-alimento-->

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