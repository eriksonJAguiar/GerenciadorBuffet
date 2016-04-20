<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
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
                    <asp:Button ID="botaoAlterarAdmin" runat="server" Text="Alterar Admin" class="btn btn-danger" />
                    <asp:Button ID="botaoDeslogar" runat="server" Text="Deslogar" class="btn btn-success" OnClick="botaoDeslogar_Click" />
                </div>

                <!--Fim da class deslogar-->

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
                    <br />
                    <div class="alert alert-success">
                        <strong>Festas Ativas</strong>
                    </div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="festa_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" CellSpacing="4" HorizontalAlign="Center" AllowPaging="True" AllowSorting="True" OnRowCommand="GridView1_CommandRow">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="festa_id" HeaderText="Código da Festa" ReadOnly="True" SortExpression="festa_id" InsertVisible="False" />
                            <asp:BoundField DataField="idCliente" HeaderText="Código Cliente" SortExpression="idCliente" />
                            <asp:BoundField DataField="tipoFesta" HeaderText="Tipo de Festa" SortExpression="tipoFesta" />
                            <asp:BoundField DataField="numeroConvidados" HeaderText="Convidados" SortExpression="numeroConvidados" />
                            <asp:BoundField DataField="quantidadeCadeiras" HeaderText="Cadeiras" SortExpression="quantidadeCadeiras" />
                            <asp:BoundField DataField="quantidadeMesas" HeaderText="Mesas" SortExpression="quantidadeMesas" />
                            <asp:BoundField DataField="local" HeaderText="Local" SortExpression="local" />
                            <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                            <asp:BoundField DataField="valorTotal" HeaderText="Valor Total" SortExpression="valorTotal" DataFormatString="{0:c2}" />
                            <asp:ButtonField ButtonType="Image" CommandName="pagar" ImageUrl="~/img/pagar.png" Text="Button" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" DeleteCommand="DELETE FROM [Festas] WHERE [festa_id] = @festa_id" InsertCommand="INSERT INTO [Festas] ([idCliente], [tipoFesta], [numeroConvidados], [quantidadeCadeiras], [quantidadeMesas], [local], [data], [status], [valorTotal]) VALUES (@idCliente, @tipoFesta, @numeroConvidados, @quantidadeCadeiras, @quantidadeMesas, @local, @data, @status, @valorTotal)" SelectCommand="SELECT festa_id, idCliente, tipoFesta, numeroConvidados, quantidadeCadeiras, quantidadeMesas, local, data, status, valorTotal FROM Festas WHERE (data &gt;= (SELECT CONVERT (varchar(50), (SELECT GETDATE() AS Expr1), 103) AS Expr1))" UpdateCommand="UPDATE [Festas] SET [idCliente] = @idCliente, [tipoFesta] = @tipoFesta, [numeroConvidados] = @numeroConvidados, [quantidadeCadeiras] = @quantidadeCadeiras, [quantidadeMesas] = @quantidadeMesas, [local] = @local, [data] = @data, [status] = @status, [valorTotal] = @valorTotal WHERE [festa_id] = @festa_id">
                        <DeleteParameters>
                            <asp:Parameter Name="festa_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="idCliente" Type="Int32" />
                            <asp:Parameter Name="tipoFesta" Type="String" />
                            <asp:Parameter Name="numeroConvidados" Type="Int32" />
                            <asp:Parameter Name="quantidadeCadeiras" Type="Int32" />
                            <asp:Parameter Name="quantidadeMesas" Type="Int32" />
                            <asp:Parameter Name="local" Type="String" />
                            <asp:Parameter Name="data" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="valorTotal" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idCliente" Type="Int32" />
                            <asp:Parameter Name="tipoFesta" Type="String" />
                            <asp:Parameter Name="numeroConvidados" Type="Int32" />
                            <asp:Parameter Name="quantidadeCadeiras" Type="Int32" />
                            <asp:Parameter Name="quantidadeMesas" Type="Int32" />
                            <asp:Parameter Name="local" Type="String" />
                            <asp:Parameter Name="data" Type="String" />
                            <asp:Parameter Name="status" Type="String" />
                            <asp:Parameter Name="valorTotal" Type="Decimal" />
                            <asp:Parameter Name="festa_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <div class="alert alert-danger">
                        <strong>Aviso!</strong> O campo abaixo indica as festas que estão próximas.
                    </div>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="festa_id" DataSourceID="SqlDataSource2" RepeatColumns="3" BorderStyle="None" CellPadding="3" Width="100%">


                        <ItemTemplate>

                            <div class="conteudo-admin-aviso">


                                <span>Código: <%# Eval("festa_id") %></span>

                                <br />

                                <span>Id Cliente: <%# Eval("idCliente") %></span>

                                <br />

                                <span>Tipo de Festa: <%# Eval("tipoFesta") %></span>

                                <br />

                                <span>Convidados: <%# Eval("numeroConvidados") %></span>

                                <br />

                                <span>Cadeiras: <%# Eval("quantidadeCadeiras") %></span>

                                <br />

                                <span>Mesas: <%# Eval("quantidadeMesas") %></span>

                                <br />

                                <span>Local: <%# Eval("local") %></span>

                                <br />

                                <span>Data: <%# Eval("data") %></span>

                                <br />

                                <span>Valor Total: <%# String.Format("{0:c2}", Eval("valorTotal"))  %></span>


                            </div>
                            <!--Fim da class conteudo-admin-aviso-->

                        </ItemTemplate>

                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT [festa_id], [idCliente], [tipoFesta], [numeroConvidados], [quantidadeCadeiras], [quantidadeMesas], [local], [data], [valorTotal] FROM [Festas] where data <= (select CONVERT(varchar(50),(select getdate()+3),103)) and (data >= (select CONVERT(varchar(50),(select getdate()),103))) and (status != 'Não Pago')"></asp:SqlDataSource>
                    <br />
                    <br />
                    <%--<div id="dialog" style="display: none">
                        <p>Olá mundo</p>
                    </div>
                    <asp:Button ID="botao" CssClass="btn bg-primary " runat="server" Text="Button" />--%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
                    <asp:Panel ID="Panel1" CssClass="ModalWindow" runat="server" BorderStyle="None">
                        <div class="center-site">     
                            <div class="topo-login col-sm-4">
                                <asp:Label ID="alert" runat="server" Text="Cadastro Realizado" CssClass="alert  alert-success" Visible="false" Width="300" Height="50"></asp:Label>
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Editar Administrador</h3>
                                    </div>
                                    <div class="panel-body center-box">
                                        <span class="label label-primary">Nome</span>
                                        <asp:RequiredFieldValidator ID="campoNomeRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoNome" ErrorMessage="Informe o Nome" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoNome" class="input-lg tam-input-login" runat="server"></asp:TextBox>
                                        <br />
                                        <br />
                                        <span class="label label-primary">Nova Senha</span>
                                        <asp:RequiredFieldValidator ID="campoSenhaRequired" runat="server" ValidationGroup="Grupo1" ControlToValidate="campoSenha" ErrorMessage="Informe a Senha" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoSenha" class="input-lg tam-input-login" runat="server" TextMode="Password"></asp:TextBox>
                                        <br />
                                        <br />
                                        <span class="label label-primary">Novo Email</span>
                                        <asp:RequiredFieldValidator ID="campoEmailRequired" runat="server" ErrorMessage="Informe o Email" ValidationGroup="Grupo1" ControlToValidate="campoEmail" CssClass="alert alert-danger"></asp:RequiredFieldValidator><asp:TextBox ID="campoEmail" class="input-lg tam-input-login" runat="server" TextMode="Email"></asp:TextBox>
                                        <br />
                                        <br />
                                        <asp:Button ID="botaoAlterar" ValidationGroup="Grupo1" class="tam-input-login btn-lg btn-primary" runat="server" Text="Alterar" OnClick="botaoAlterar_Click" />
                                        <br />
                                        <br />
                                        <asp:Button ID="voltar" runat="server" Text="Voltar" class="tam-input-login btn-lg btn-success" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" OnOkScript="voltar" BackgroundCssClass="modalBackground" TargetControlID="botaoAlterarAdmin" OnLoad="ModalPopupExtender1_Load">
                    </ajaxToolkit:ModalPopupExtender>
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
