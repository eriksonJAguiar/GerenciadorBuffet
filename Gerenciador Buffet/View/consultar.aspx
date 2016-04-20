<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consultar.aspx.cs" Inherits="consultar" %>
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
                    <asp:Button ID="botaoConsultarAlimento" class="input-consultar btn-lg btn-primary" runat="server" Text="Consultar Alimento" OnClick="botaoConsultarAlimento_Click" Visible="true" />
                    <asp:Button ID="botaoConsultarBebida" class="input-consultar btn-lg btn-warning" runat="server" Text="Consultar Bebida" OnClick="botaoConsultarBebida_Click" Visible="true" />
                    <asp:Button ID="botaoConsultarFesta" class="input-consultar btn-lg btn-danger" runat="server" Text="Consultar Festa" OnClick="botaoConsultarFesta_Click" Visible="true" />
                    <asp:Button ID="botaoConsultarCliente" class="input-consultar btn-lg btn-success" runat="server" Text="Consultar Cliente" OnClick="botaoConsultarCliente_Click" Visible="true" />
                    <asp:Button ID="botaoConsultarGarcon" class="input-consultar btn-lg btn-info" runat="server" Text="Consultar Garcon" OnClick="botaoConsultarGarcon_Click" Visible="true" />
                    <br />
                    <br />

                    <asp:GridView ID="TabelaAlimentos" runat="server" AutoGenerateColumns="False" DataKeyNames="alimento_id" DataSourceID="sqlAlimento" Width="100%" Height="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="alimento_id" HeaderText="Código Alimento" InsertVisible="False" ReadOnly="True" SortExpression="alimento_id" />
                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                            <asp:BoundField DataField="descricao" HeaderText="Descrição" SortExpression="descricao" />
                            <asp:BoundField DataField="imagemAlimento" HeaderText="Imagem" SortExpression="imagemAlimento" />
                            <asp:BoundField DataField="quantidade" HeaderText="Quantidade" SortExpression="quantidade" />
                            <asp:BoundField DataField="valorUnitario" HeaderText="Valor Unitário" SortExpression="valorUnitario" DataFormatString="{0:c2}" />
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
                
                    <asp:SqlDataSource ID="sqlAlimento" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Alimentos]"></asp:SqlDataSource>
                    

                    <asp:GridView ID="TabelaBebidas" runat="server" AutoGenerateColumns="False" DataKeyNames="bebida_id" DataSourceID="sqlBebida" Width="100%" Height="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="bebida_id" HeaderText="Código da Bebida" InsertVisible="False" ReadOnly="True" SortExpression="bebida_id" />
                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                            <asp:BoundField DataField="descricao" HeaderText="Descrição" SortExpression="descricao" />
                            <asp:BoundField DataField="imagemBebida" HeaderText="Imagem" SortExpression="imagemBebida" />
                            <asp:BoundField DataField="quantidade" HeaderText="Quantidade" SortExpression="quantidade" />
                            <asp:BoundField DataField="valorUnitario" HeaderText="Valor Unitário" SortExpression="valorUnitario" DataFormatString="{0:c2}" />
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

                    <asp:SqlDataSource ID="sqlBebida" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Bebidas]"></asp:SqlDataSource>
                    

                    <asp:GridView ID="TabelaClientes" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="usuario_id" DataSourceID="sqlClientes" ForeColor="#333333" GridLines="None" Width="100%" Height="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="usuario_id" HeaderText="Código do Cliente" InsertVisible="False" ReadOnly="True" SortExpression="usuario_id" />
                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                            <asp:BoundField DataField="cpf" HeaderText="Cpf" SortExpression="cpf" />
                            <asp:BoundField DataField="endereco" HeaderText="Endereço" SortExpression="endereco" />
                            <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                            <asp:BoundField DataField="fone" HeaderText="Fone" SortExpression="fone" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
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
                    <asp:SqlDataSource ID="sqlClientes" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT [usuario_id], [nome], [cpf], [endereco], [cidade], [fone], [email] FROM [Usuarios] where login != 'admin' "></asp:SqlDataSource>
                    

                    <asp:GridView ID="TabelaGarcon" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="garcon_id" DataSourceID="sqlGarcon" ForeColor="#333333" GridLines="None" Width="100%" Height="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="garcon_id" HeaderText="Código Garcons" InsertVisible="False" ReadOnly="True" SortExpression="garcon_id" />
                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                            <asp:BoundField DataField="cpf" HeaderText="Cpf" SortExpression="cpf" />
                            <asp:BoundField DataField="idade" HeaderText="Idade" SortExpression="idade" />
                            <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo" />
                            <asp:BoundField DataField="telefone" HeaderText="Fone" SortExpression="telefone" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
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

                    <asp:SqlDataSource ID="sqlGarcon" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Garcons]"></asp:SqlDataSource>
                   

                    <asp:GridView ID="TabelaFestas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="festa_id" DataSourceID="sqlFestas" ForeColor="#333333" GridLines="None" Width="100%" Height="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="festa_id" HeaderText="Código da Festa" InsertVisible="False" ReadOnly="True" SortExpression="festa_id" />
                            <asp:BoundField DataField="idCliente" HeaderText="Código Cliente" SortExpression="idCliente" />
                            <asp:BoundField DataField="tipoFesta" HeaderText="Tipo de Festa" SortExpression="tipoFesta" />
                            <asp:BoundField DataField="numeroConvidados" HeaderText="Convidados" SortExpression="numeroConvidados" />
                            <asp:BoundField DataField="quantidadeCadeiras" HeaderText="Cadeiras" SortExpression="quantidadeCadeiras" />
                            <asp:BoundField DataField="quantidadeMesas" HeaderText="Mesas" SortExpression="quantidadeMesas" />
                            <asp:BoundField DataField="local" HeaderText="Local" SortExpression="local" />
                            <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" />
                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                            <asp:BoundField DataField="valorTotal" HeaderText="Valor Total" SortExpression="valorTotal" DataFormatString="{0:c2}" />
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
                    <asp:SqlDataSource ID="sqlFestas" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Festas]"></asp:SqlDataSource>
                    <br />
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
