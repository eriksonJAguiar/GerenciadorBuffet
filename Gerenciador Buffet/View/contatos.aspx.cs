using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_contatos : System.Web.UI.Page
{
    private ContatoController controller;
    protected void Page_Load(object sender, EventArgs e)
    {
        controller = new ContatoController();
    }

    protected void botaoEnviar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Response.Write(controller.enviarEmail(campoEmailContato.Text,campoAssuntoContato.Text,campoMensagemContato.Text,campoNomeContato.Text));
        }
    }
}