using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cadastrarfesta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            CadastrarFestaController controller = new CadastrarFestaController();
            int id = Convert.ToInt32(Session["usuario"].ToString());
            Usuario cliente = (Usuario)controller.pesquisar(id);
            nome.Text = "Seja Bem Vindo, " + cliente.nome.ToString();
        }

    }
    protected void botaoDeslogar_Click(object sender, EventArgs e)
    {
        Session["usuario"] = null;
        Response.Redirect("login.aspx");
    }
    protected void botaoCadastrarFesta_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            try
            {
                CadastrarFestaController controller = new CadastrarFestaController();

                int idCliente = Convert.ToInt32(Session["usuario"].ToString());

                Festa festa = new Festa();

                DateTime atual = DateTime.Now.Date;
                DateTime data = DateTime.Parse(campoDataEvento.Text);

                if(atual != data){
                    festa.idCliente = idCliente;
                    festa.tipoFesta = campoFesta.SelectedValue;
                    festa.numeroConvidados = Int32.Parse(campoNumeroConvidado.Text);
                    festa.quantidadeCadeiras = Int32.Parse(campoQtdCadeiras.Text);
                    festa.quantidadeMesas = Int32.Parse(campoQtdMesas.Text);
                    festa.local = campoLocal.Text.ToString();
                    festa.data = data.ToString("dd/MM/yyyy");
                    festa.status = "Não Pago";
                    controller.cadastrar(festa);
                    Response.Write("<script language='javascript'> alert('Festa Cadastrada com Sucesso!'); </script>");
                    Response.Redirect("dadosfestas.aspx");
                }
                else
                {
                    Response.Write("<script language='javascript'> alert('Erro: Não foi possível cadastrar a festa!'); </script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'> alert('Erro: Não foi possível cadastrar a festa!'); </script>");
            }

            campoDataEvento.Text = "";
            campoFesta.Text = "Selecione";
            campoLocal.Text = "";
            campoNumeroConvidado.Text = "";
            campoQtdCadeiras.Text = "";
            campoQtdMesas.Text = "";
        }
    }
}