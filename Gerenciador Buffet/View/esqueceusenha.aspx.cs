using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;
using System.Net;
using System.Net.Mail;
public partial class esqueceusenha : System.Web.UI.Page
{
   
    private EsqueceuSenhaController controller;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        controller = new EsqueceuSenhaController();
        
    }

    protected void botaoEnviar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Response.Write(controller.enviarEmail(campoEmail.Text));
        }
    }

}