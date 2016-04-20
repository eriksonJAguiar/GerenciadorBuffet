<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

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
    <script src="../js/slide.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="../img/icon.png" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
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
           
            <div class="conteudo-slide">
               <div class="slide">
                   <figure>
		                <span class="trs next"></span>
		                <span class="trs prev"></span>
		                <div id="slider">
			            <a href="#" class="trs"><img src="../img/01.jpg" alt="Formatura" /></a>
			            <a href="#" class="trs"><img src="../img/02.jpg" alt="Aniversário" /></a>
                        <a href="#" class="trs"><img src="../img/03.jpg" alt="Casamento" /></a>		
		                </div>
		                <figcaption></figcaption>
	                </figure>
               </div>
                <!--Fim da class slide-->
            </div>
            <!--Fim da class conteudo-slide-->

            <div class="conteudo-geral-quemsomos">
                <h3>Serviços Prestados</h3>
                <p>
                A 10 anos de historia, nosso buffet apresenta uma estrutura de eventos que pode oferecer serviços de otima qualidade de nossos produtos. Oferecemos serviço de buffet e decoração em geral. Possuímos todos os utensílios para festas e eventos desde rechos, pratos, talheres, copos, bandejas, etc.; E com atendimento personalizado.
                </p>
                <h3>Visão</h3>
                <p>
                Ser reconhecida pelos clientes, fornecedores, colaboradores como uma das melhores no ramo de alimentação.
                </p>
                <h3>Missão</h3>
                <p>
                Promover lucro e a satisfação dos clientes, colaboradores e sócios com honestidade, responsabilidade e qualidade.
                </p>
                <br />
                <br />
            </div>
            <!--Fim da class conteudo-geral-quemsomos-->

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
</body>
</html>
