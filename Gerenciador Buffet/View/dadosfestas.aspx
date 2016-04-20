<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dadosfestas.aspx.cs" Inherits="dadosfestas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                    
                    <div class="conteudo-dadosfestas">
                        <asp:GridView ID="TabelaFesta" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="festa_id" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" CellSpacing="4" HorizontalAlign="Center" AllowPaging="True" DataSourceID="sqlFesta" OnSelectedIndexChanged="TabelaFesta_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="festa_id" HeaderText="Código da Festa" ReadOnly="True" SortExpression="festa_id" />
                                <asp:BoundField DataField="tipoFesta" HeaderText="Tipo de Festa" SortExpression="tipoFesta" />
                                <asp:BoundField DataField="numeroConvidados" HeaderText="Convidados" SortExpression="numeroConvidados" />
                                <asp:BoundField DataField="quantidadeCadeiras" HeaderText="Cadeiras" SortExpression="quantidadeCadeiras" />
                                <asp:BoundField DataField="quantidadeMesas" HeaderText="Mesas" SortExpression="quantidadeMesas" />
                                <asp:BoundField DataField="local" HeaderText="Local" SortExpression="local" />
                                <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" />
                                <asp:BoundField DataField="status" HeaderText="Status" />
                                <asp:BoundField DataField="valorTotal" HeaderText="Valor Total" SortExpression="valorTotal" DataFormatString="{0:c2}" />
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/selecionar.png" ShowSelectButton="True" />
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
                        <asp:SqlDataSource ID="sqlFesta" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Festas] "></asp:SqlDataSource>
                        <br />
                        <br />
                     </div>
                    <!--Fim da class menu-cliente-->


                    <div class="conteudo-alimento-central">
                        <h3>Alimentos</h3>
                        <br />
                        <asp:DataList ID="DataList1" runat="server" BackColor="#337ab7" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="White" GridLines="Vertical" Width="980px" DataSourceID="SqlDataSource1" >
                            <AlternatingItemStyle BackColor="#5cb85c" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imagemAlimento", "../img/Alimentos/{0}") %>' Height="98px" Width="89px" />
                                &nbsp;<asp:Label ID="idAlimento" runat="server" Text='<%# Eval("alimento_id") %>' ></asp:Label>
                                <asp:Label ID="nomeAlimento" runat="server" Text='<%# Eval("nome") %>' Height="16px" Width="99px" style="margin-left: 46px; margin-top: 0px"></asp:Label>
                                &nbsp;&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="valorUnitario" runat="server" Text='<%# string.Format("{0:c2}",Eval("valorUnitario")) %>' ></asp:Label>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Alimentos]"></asp:SqlDataSource>
                        <br />
                    </div>
                    <!--Fim da class conteudo-alimento-central-->

                    <div class="conteudo-bebida-central">
                        <h3>Bebidas</h3>
                        <br />
                        <asp:DataList ID="DataList2" runat="server" BackColor="#337ab7" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="White" GridLines="Vertical" Width="980px" DataSourceID="SqlDataSource2">
                            <AlternatingItemStyle BackColor="#5cb85c" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imagemBebida", "../img/Bebidas/{0}") %>' Height="98px" Width="89px" />
                                &nbsp;<asp:Label ID="idBebida" runat="server" Text='<%# Eval("bebida_id") %>' ></asp:Label>
                                <asp:Label ID="nomeBebida" runat="server" Text='<%# Eval("nome") %>' Height="16px" Width="99px" style="margin-left: 46px; margin-top: 0px"></asp:Label>
                                &nbsp;&nbsp;<asp:CheckBox ID="CheckBox2" runat="server" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="valorUnitario" runat="server" Text='<%# string.Format("{0:c2}", Eval("valorUnitario")) %>' ></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Quantidade"></asp:Label>
                                &nbsp;&nbsp;<asp:TextBox ForeColor="Black" ID="campoQuantidade" CssClass="input-lg" runat="server" TextMode="Number" Width="83px"></asp:TextBox>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Bebidas]"></asp:SqlDataSource>
                        <br />
                        <br />

                        <div class="botao-dadosfestas">
                            <asp:Button ID="botaoCalcular" runat="server" Width="250px" CssClass="btn-lg btn-primary " Text="Calcular" OnClick="BotaoCalcular_Click" />
                            <br />
                            <br />
                            <div class="valorTotal">
                                <span>Valor Total: </span>
                            </div>
                            <!--Fim da class valorTotal-->
                            <asp:Label ID="valorTotal" CssClass="valorTotal-Pagamento" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="botaoContratar" runat="server" Width="250px" Text="Contratar" CssClass="btn-lg btn-success" OnClick="botaoContratar_Click" />
                        </div>
                        <!--Fim da class botao-dadosfestas-->
                        <br />
                        <br />
                    </div>

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
