using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class consultar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            ConsultarController controller = new ConsultarController();
            int id = Convert.ToInt32(Session["admin"].ToString());
            Usuario admin = (Usuario)controller.pesquisar(id);
            nome.Text = "Seja Bem Vindo, " + admin.nome.ToString();
            TabelaAlimentos.Visible = false;
            TabelaBebidas.Visible = false;
            TabelaClientes.Visible = false;
            TabelaFestas.Visible = false;
            TabelaGarcon.Visible = false;
        }
    }

    protected void botaoDeslogar_Click(object sender, EventArgs e)
    {
        Session["admin"] = null;
        Response.Redirect("login.aspx");
    }

    protected void botaoConsultarAlimento_Click(object sender, EventArgs e)
    {
        TabelaAlimentos.Visible = true;
        TabelaBebidas.Visible = false;
        TabelaClientes.Visible = false;
        TabelaFestas.Visible = false;
        TabelaGarcon.Visible = false;
    }

    protected void botaoConsultarBebida_Click(object sender, EventArgs e)
    {
        TabelaAlimentos.Visible = false;
        TabelaBebidas.Visible = true;
        TabelaClientes.Visible = false;
        TabelaFestas.Visible = false;
        TabelaGarcon.Visible = false;
    }

    protected void botaoConsultarFesta_Click(object sender, EventArgs e)
    {
        TabelaAlimentos.Visible = false;
        TabelaBebidas.Visible = false;
        TabelaClientes.Visible = false;
        TabelaFestas.Visible = true;
        TabelaGarcon.Visible = false;
    }

    protected void botaoConsultarCliente_Click(object sender, EventArgs e)
    {
        TabelaAlimentos.Visible = false;
        TabelaBebidas.Visible = false;
        TabelaClientes.Visible = true;
        TabelaFestas.Visible = false;
        TabelaGarcon.Visible = false;
    }

    protected void botaoConsultarGarcon_Click(object sender, EventArgs e)
    {
        TabelaAlimentos.Visible = false;
        TabelaBebidas.Visible = false;
        TabelaClientes.Visible = false;
        TabelaFestas.Visible = false;
        TabelaGarcon.Visible = true;
    }


}