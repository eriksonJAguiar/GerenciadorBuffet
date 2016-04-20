<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gerenciargarcons.aspx.cs" Inherits="gerenciargarcons" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
    <script type="text/javascript">$(document).ready(function () { $("#campoCpfGarcons").mask("999.999.999-99"); });</script>
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

                    <div class="conteudo-central-garcons">
                        <div class="navbar-form">
                            <span class="label label-primary">Nome Completo</span>
                            <asp:RequiredFieldValidator ID="campoNomeGarconsRequired" ValidationGroup="Grupo1" runat="server" ControlToValidate="campoNomeGarcons" ErrorMessage="Informe Nome Completo" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoNomeGarcons" CssClass="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Cpf</span>
                            <asp:RequiredFieldValidator ID="campoCpfGarconsRequired" ValidationGroup="Grupo1" runat="server" ErrorMessage="Informe Cpf" ControlToValidate="campoCpfGarcons" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoCpfGarcons" class="input-lg tam-input" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Idade</span>
                            <asp:RequiredFieldValidator ID="campoIdadeGarconsRequired" ValidationGroup="Grupo1" runat="server" ControlToValidate="campoIdadeGarcons" ErrorMessage="Informe Idade" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoIdadeGarcons" CssClass="input-lg tam-input" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Telefone</span>
                            <asp:RequiredFieldValidator ID="campoTelefoneGarconsRequired" ValidationGroup="Grupo1" runat="server" ControlToValidate="campoTelefoneGarcons" ErrorMessage="Informe Telefone" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoTelefoneGarcons" CssClass="input-lg tam-input" runat="server" TextMode="Phone"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Email</span>
                            <asp:RequiredFieldValidator ID="campoEmailGarconsRequired" ValidationGroup="Grupo1" runat="server" ControlToValidate="campoEmailGarcons" ErrorMessage="Informe Email" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoEmailGarcons" CssClass="input-lg tam-input" runat="server" TextMode="Email"></asp:TextBox>
                            <br />
                            <br />
                            <span class="label label-primary">Sexo</span>
                            <asp:RequiredFieldValidator ID="campoSexoGarconsRequired" ValidationGroup="Grupo1" InitialValue="Selecione" runat="server" ControlToValidate="campoSexoGarcons" ErrorMessage="Selecione Sexo" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:DropDownList ID="campoSexoGarcons" Runat="Server" CssClass="input-lg tam-input"><asp:ListItem Text="Selecione" Value="Selecione"/><asp:ListItem Text="Masculino" Value="Masculino"/><asp:ListItem Text="Feminino" Value="Feminino"/><asp:ListItem Text="Indefinido" Value="Indefinido"/></asp:DropDownList>
                            <br />
                            <br />
                            <asp:Button ID="botaoCadastraGarcons" class="tam-botao-garcons btn-lg btn-primary" runat="server" Text="Cadastrar" OnClick="botaoCadastraGarcons_Click" Visible="true" ValidationGroup="Grupo1" />
                            <asp:Button ID="botaoAlterarGarcons" class="tam-botao-garcons btn-lg btn-success" runat="server" Text="Alterar" Visible="false" OnClick="botaoAlterarGarcons_Click" ValidationGroup="Grupo1" />
                            <br />
                            <br />
                        </div>
                        <!--Fim da class navbar-form-->
                    </div>
                    <!--Fim da class conteudo-central-garcons-->

                    <div class="conteudo-central" id="contratar">
                       
                        <asp:GridView ID="TabelaGarcons" runat="server" AutoGenerateColumns="False" DataKeyNames="garcon_id" DataSourceID="DataTable" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" Width="100%"  OnSelectedIndexChanged="TabelaGarcons_SelectedIndexChanged1" AllowSorting="True" OnRowCommand="garcon_id_RowCommand">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="garcon_id" HeaderText="Código Garcons" ReadOnly="True" SortExpression="garcon_id" InsertVisible="False" />
                                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                                <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
                                <asp:BoundField DataField="idade" HeaderText="Idade" SortExpression="idade" />
                                <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo" />
                                <asp:BoundField DataField="telefone" HeaderText="Fone" SortExpression="telefone" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/edicao.png" ShowSelectButton="True" />
                                <asp:ButtonField ButtonType="Image" CommandName="Delete" ImageUrl="~/img/excluir.png" Text="Button" />
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
                        <asp:SqlDataSource ID="DataTable" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Garcons]" DeleteCommand="DELETE FROM [Garcons] WHERE [garcon_id] = @garcon_id" InsertCommand="INSERT INTO [Garcons] ([nome], [cpf], [idade], [sexo], [telefone], [email]) VALUES (@nome, @cpf, @idade, @sexo, @telefone, @email)" UpdateCommand="UPDATE [Garcons] SET [nome] = @nome, [cpf] = @cpf, [idade] = @idade, [sexo] = @sexo, [telefone] = @telefone, [email] = @email WHERE [garcon_id] = @garcon_id">
                            <DeleteParameters>
                                <asp:Parameter Name="garcon_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="nome" Type="String" />
                                <asp:Parameter Name="cpf" Type="String" />
                                <asp:Parameter Name="idade" Type="Int32" />
                                <asp:Parameter Name="sexo" Type="String" />
                                <asp:Parameter Name="telefone" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="nome" Type="String" />
                                <asp:Parameter Name="cpf" Type="String" />
                                <asp:Parameter Name="idade" Type="Int32" />
                                <asp:Parameter Name="sexo" Type="String" />
                                <asp:Parameter Name="telefone" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="garcon_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="contrar-garcons">
                                    <h3>Contratar Garcons</h3>
                                    <div class="contrar-garcons-center">
                                        <span>Código Garcons</span>
                                        <asp:DropDownList ID="DropDownList1" CssClass="input-sm" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="garcon_id" DataValueField="garcon_id" Height="30px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="128px">
                                        </asp:DropDownList>
                                    </div>
                                    <!--Fim da class contrar-garcons-center-->

                                    <div class="contrar-garcons-center">
                                        <span>Nome Garcons</span>
                                        <asp:DropDownList ID="DropDownList2" CssClass="input-sm" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="nome" EnableTheming="True" Height="30px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="128px">
                                        </asp:DropDownList>
                                    </div>
                                    <!--Fim da class contrar-garcons-center-->

                                    <div class="contrar-garcons-center">
                                        <span>Código Festa</span>
                                        <asp:DropDownList ID="DropDownList3" CssClass="input-sm" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="festa_id" DataValueField="festa_id" Height="30px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="128px">
                                        </asp:DropDownList>
                                    </div>
                                    <!--Fim da class contrar-garcons-center-->

                                    <div class="contrar-garcons-center">
                                        <span>Local Festa</span>
                                        <asp:DropDownList ID="DropDownList4" CssClass="input-sm" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="local" DataValueField="local" Height="30px" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" Width="128px">
                                        </asp:DropDownList>
                                    </div>
                                    <!--Fim da class contrar-garcons-center-->

                                    <div class="contrar-garcons-center">
                                        <span>Data Festa</span>
                                        <asp:DropDownList ID="DropDownList5" CssClass="input-sm" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="data" DataValueField="data" Height="30px" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged" Width="128px">
                                        </asp:DropDownList>
                                    </div>
                                    <!--Fim da class contrar-garcons-center-->

                                    <div class="contrar-garcons-center">  
                                        <span>Valor Pago</span>
                                        <asp:RequiredFieldValidator ID="campoValorPagoGarconRequired" runat="server" ControlToValidate="valorPagoGarcon" ValidationGroup="Grupo2" ></asp:RequiredFieldValidator><asp:TextBox ID="valorPagoGarcon" CssClass="input-sm" runat="server" Height="30px" Width="128px"></asp:TextBox>
                                    </div>
                                    <!--Fim da class contrar-garcons-center-->
                                    <br />
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT [garcon_id], [nome] FROM [Garcons]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT festa_id, local, data FROM Festas WHERE (data &gt;= (SELECT CONVERT (varchar(50), (SELECT GETDATE() AS Expr1), 103) AS Expr1))"></asp:SqlDataSource>
                                </div>
                                <!--Fim da class contrar-garcons-->
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <asp:Button ID="botaoContratarGarcons" ValidationGroup="Grupo2" runat="server" class="btn-lg btn-primary" OnClick="botaoContratarGarcons_Click" Text="Contratar" Width="100%" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:GridView ID="TabelaContratados" runat="server" AutoGenerateColumns="False" DataKeyNames="garcon_contratado_id" DataSourceID="SqlDataSource3" Width="980px" CellPadding="4" Height="100%" AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="garcon_contratado_id" HeaderText="Código Contrato" ReadOnly="True" SortExpression="garcon_contratado_id" />
                                <asp:BoundField DataField="idGarcon" HeaderText="Código Garcons" SortExpression="idGarcon" />
                                <asp:BoundField DataField="idFesta" HeaderText="Código Festa" SortExpression="idFesta" />
                                <asp:BoundField DataField="fone" HeaderText="Fone" SortExpression="fone" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" DataFormatString="{0: dd/MM/yyyy}" />
                                <asp:BoundField DataField="valorPago" HeaderText="Valor Pago" SortExpression="valorPago" DataFormatString="{0:c2}" />
                                <asp:ButtonField ButtonType="Image" CommandName="Delete" ImageUrl="~/img/excluir.png" Text="Excluir" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" DeleteCommand="DELETE FROM [GarconsContratados] WHERE [garcon_contratado_id] = @garcon_contratado_id" InsertCommand="INSERT INTO [GarconsContratados] ([idGarcon], [idFesta], [fone], [email], [data], [valorPago], [status]) VALUES (@idGarcon, @idFesta, @fone, @email, @data, @valorPago, @status)" SelectCommand="SELECT garcon_contratado_id, idGarcon, idFesta, fone, email, data, valorPago, status FROM GarconsContratados" UpdateCommand="UPDATE [GarconsContratados] SET [idGarcon] = @idGarcon, [idFesta] = @idFesta, [fone] = @fone, [email] = @email, [data] = @data, [valorPago] = @valorPago, [status] = @status WHERE [garcon_contratado_id] = @garcon_contratado_id">
                            <DeleteParameters>
                                <asp:Parameter Name="garcon_contratado_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="idGarcon" Type="Int32" />
                                <asp:Parameter Name="idFesta" Type="Int32" />
                                <asp:Parameter Name="fone" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter DbType="Date" Name="data" />
                                <asp:Parameter Name="valorPago" Type="Decimal" />
                                <asp:Parameter Name="status" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="idGarcon" Type="Int32" />
                                <asp:Parameter Name="idFesta" Type="Int32" />
                                <asp:Parameter Name="fone" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter DbType="Date" Name="data" />
                                <asp:Parameter Name="valorPago" Type="Decimal" />
                                <asp:Parameter Name="status" Type="String" />
                                <asp:Parameter Name="garcon_contratado_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
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
