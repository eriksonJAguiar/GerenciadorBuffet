using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e){
     
    }

    protected void botaoLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                LoginController controller = new LoginController();

                Usuario cliente = controller.pesquisar(campoLogin.Text);

                Usuario admin = controller.pesquisar("admin");

                Administrador adm = null;

                if (admin != null)
                {
                    adm = Administrador.getInstance();

                    //carrega os campos padrão para o adm
                    adm.nome = admin.nome;
                    adm.login = admin.login;
                    adm.senha = admin.senha;
                    adm.email = admin.email;

                    if (campoLogin.Text.Equals(adm.login) && campoSenha.Text.Equals(adm.senha))
                    {
                        Session["admin"] = cliente.usuario_id;
                        Response.Redirect("admin.aspx");
                    }
                }

                if (cliente.login == campoLogin.Text && cliente.senha == campoSenha.Text)
                {
                    Session["usuario"] = cliente.usuario_id;
                    Response.Redirect("usuario.aspx");
                }

                Response.Write("<script language='javascript'>alert('Login ou Senha Incorretos!');</script>");
            }
            catch
            {
                Response.Write("<script language='javascript'>alert('Login ou Senha Incorretos!');</script>");
            }
            
        }
    }
   
}