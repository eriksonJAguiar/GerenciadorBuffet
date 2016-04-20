using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["admin"] == null){
            Response.Redirect("login.aspx");
        }
        else
        {
            //AdminController controller = new AdminController();
            //int id = Convert.ToInt32(Session["admin"].ToString());
            //Usuario admin = controller.pesquisar(id);

            Administrador admin = Administrador.getInstance();

            nome.Text = "Seja Bem Vindo, " + admin.nome.ToString();
        }
    }

    protected void botaoDeslogar_Click(object sender, EventArgs e)
    {
        Session["admin"] = null;
        Response.Redirect("login.aspx");
    }
    protected void GridView1_CommandRow(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "pagar")
        {
            AdminController controller = new AdminController();

            int index = Int32.Parse((string)e.CommandArgument);
            string status = Server.HtmlDecode(GridView1.Rows[index].Cells[8].Text);
            int id = Int32.Parse(GridView1.Rows[index].Cells[0].Text);

            if (status.Equals("Não Pago"))
            {
                Festa festa = new Festa();

                festa = controller.pesquisarFesta(id);

                festa.status = "Pago";

                controller.atualizar(festa);

                GridView1.DataBind();

            }
            else if (status.Equals("Pago"))
            {
                Festa festa = new Festa();

                festa = controller.pesquisarFesta(id);

                festa.status = "Não Pago";


                controller.atualizar(festa);
                GridView1.DataBind();
                
            }
        }

    }


    protected void botaoAlterar_Click(object sender, EventArgs e)
    {
        if(Page.IsValid){

            AdminController controller = new AdminController();

            Administrador admin = Administrador.getInstance();

            Usuario user = new Usuario();

            user = controller.pesquisarLogin(admin.login);

            String mensagem = null;

            if(campoSenha.Text != user.senha)
            {
                if(controller.pesquisarSenha(campoSenha.Text) != null)
                {
                    mensagem = "Já existe conta com está Senha! \\n";
                }
            }

            if (campoEmail.Text != user.email)
            {
                if (controller.pesquisarEmail(campoEmail.Text) != null)
                {
                    mensagem += "Já existe conta com este Email! \\n";
                }
            }

            if(mensagem != null){
                Response.Write("<script language='javascript'> alert('" + mensagem + "'); window.location=('admin.aspx'); </script>");
            }
            else
            {
                user.email = campoEmail.Text;
                user.senha = campoSenha.Text;
                controller.atualizar(user);
                Response.Write("<script language='javascript'> alert('Alterado com Sucesso!'); window.location=('admin.aspx'); </script>");
            }

        }
    }

    protected void ModalPopupExtender1_Load(object sender, EventArgs e)
    {
        Administrador admin = Administrador.getInstance();
        campoNome.Text = admin.nome;
    }
}