using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            UsuarioController controller = new UsuarioController();
            int id = Convert.ToInt32(Session["usuario"].ToString());
            Usuario cliente = controller.pesquisar(id);
            nome.Text = "Seja Bem Vindo, " + cliente.nome.ToString();

            sqlFesta.SelectCommand = "select *from Festas where idCliente =" + id;

        }
        
    }
    protected void botaoDeslogar_Click(object sender, EventArgs e)
    {
        Session["usuario"] = null;
        Response.Redirect("login.aspx");
    }

    protected void botaoAlterarFesta_Click(object sender, EventArgs e)
    {
        UsuarioController controller = new UsuarioController();

        Festa festa = controller.pesquisaFesta(Int32.Parse(TabelaFesta.SelectedRow.Cells[0].Text));

        
        festa.tipoFesta = campoFesta.Text;
        festa.numeroConvidados = Int32.Parse(campoNumeroConvidado.Text);
        festa.quantidadeCadeiras = Int32.Parse(campoQtdCadeiras.Text);
        festa.quantidadeMesas = Int32.Parse(campoQtdMesas.Text);
        festa.local = campoLocal.Text;
        festa.data = campoDataEvento.Text;
  

        controller.atualizar(festa);


        Page.RegisterStartupScript("javascript", "<script> ocultar();  </script>");

        TabelaFesta.DataBind();
    }
    protected void TabelaFesta_SelectedIndexChanged(object sender, EventArgs e)
    {
        campoLocal.Text = Server.HtmlDecode(TabelaFesta.SelectedRow.Cells[5].Text);
        campoQtdCadeiras.Text = TabelaFesta.SelectedRow.Cells[3].Text;
        campoQtdMesas.Text = TabelaFesta.SelectedRow.Cells[4].Text;
        campoNumeroConvidado.Text = TabelaFesta.SelectedRow.Cells[2].Text;
        campoFesta.Text = Server.HtmlDecode(TabelaFesta.SelectedRow.Cells[1].Text);
        campoDataEvento.Text = TabelaFesta.SelectedRow.Cells[6].Text;

        Page.RegisterStartupScript("javascript", "<script> mostrar();  </script>");
    }
}