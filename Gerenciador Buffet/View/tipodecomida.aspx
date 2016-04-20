<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tipodecomida.aspx.cs" Inherits="View_tipodecomida" %>

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
                <div class="conteudo-comida">
           
                    <asp:ListView DataSourceID="bd_alimentos" runat="server" >
                        <ItemTemplate>
                            <div class="exibir-comida">
                                <h3><%# Eval("nome") %></h3>
                                    <img src='<%# Eval("imagemAlimento", "../img/Alimentos/{0}") %>' />
                                <p>Descrição: <%# Eval("descricao") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="bd_alimentos" runat="server" ConnectionString="<%$ ConnectionStrings:BDbuffet %>" SelectCommand="SELECT * FROM [Alimentos]"></asp:SqlDataSource>
                    <br />
                    <br />
                </div>
                <!--Fim da class conteudo-comida-->
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

