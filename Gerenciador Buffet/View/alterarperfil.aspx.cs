using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class alterarperfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            AlterarPerfilController controller = new AlterarPerfilController();
            int id = Convert.ToInt32(Session["usuario"].ToString());
            Usuario cliente = controller.pesquisar(id);
            nome.Text = "Seja Bem Vindo, " + cliente.nome.ToString();

            if (campoNome.Text == "")
            {
                campoNome.Text = cliente.nome;
            }
            if (campoEndereco.Text == "")
            {
                campoEndereco.Text = cliente.endereco;
            }
            if (campoCidades.Text == "")
            {
                campoCidades.Text = cliente.cidade;
            }
            if (campoTelefone.Text == "")
            {
                campoTelefone.Text = cliente.fone;
            }
            if (campoLogin.Text == "")
            {
                campoLogin.Text = cliente.login;
            }
            if (campoSenha.Text == "")
            {
                campoSenha.Text = cliente.senha;
            }
            if (campoEmail.Text == "")
            {
                campoEmail.Text = cliente.email;
            }
            if (campoCpf.Text == "")
            {
                campoCpf.Text = cliente.cpf;
            }
        }
    }

    protected void botaoDeslogar_Click(object sender, EventArgs e)
    {
        Session["usuario"] = null;
        Response.Redirect("login.aspx");
    }

    protected void botaoAlterarPerfil_Click(object sender, EventArgs e)
    {
        if(Page.IsValid){
            
            try
            {
                AlterarPerfilController controller = new AlterarPerfilController();
                AlterarPerfilController controllerver = new AlterarPerfilController();
                Usuario ver = controllerver.pesquisar(Convert.ToInt32(Session["usuario"].ToString()));
                Usuario cliente = new Usuario();
                cliente.usuario_id = Convert.ToInt32(Session["usuario"].ToString());
                cliente.nome = campoNome.Text.ToString();
                cliente.endereco = campoEndereco.Text.ToString();
                cliente.cidade = campoCidades.Text.ToString();
                cliente.fone = campoTelefone.Text.ToString();
                if (ver.login.Equals(campoLogin.Text.ToString()) || controllerver.pesquisarLogin(campoLogin.Text.ToString()) == null)
                {
                    cliente.login = campoLogin.Text.ToString();

                }
                if (ver.senha.Equals(campoSenha.Text.ToString()) || controllerver.pesquisarSenha(campoSenha.Text.ToString()) == null)
                {
                    cliente.senha = campoSenha.Text.ToString();
                   
                }
                if (ver.email.Equals(campoEmail.Text.ToString()) || controllerver.pesquisarEmail(campoEmail.Text.ToString()) == null)
                {
                    cliente.email = campoEmail.Text.ToString();
                    
                }
                if (ver.cpf.Equals(campoCpf.Text.ToString()) || controllerver.pesquisarCpf(campoCpf.Text.ToString()) == null)
                {
                    cliente.cpf = campoCpf.Text.ToString();
                }
                if (cliente.email != null && cliente.login != null && cliente.senha != null && cliente.cpf != null)
                {
                    cliente.aceitoTermos = "SIM";
                    controller.alterar(cliente);
                    Response.Write("<script language='javascript'> alert('Usuário alterado com Sucesso!'); </script>");
                }else
                {
                    Response.Write("<script language='javascript'> alert('Erro: Usuário não pode ser alterado!'); </script>");
                }
            }
            catch
            {
                Response.Write("<script language='javascript'> alert('Erro: Usuário não pode ser alterado!'); </script>");
            }
        }
    }


}