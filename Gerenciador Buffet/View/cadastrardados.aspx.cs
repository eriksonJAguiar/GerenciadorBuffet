using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class cadastrardados : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Session["cCpf"].ToString();
            Session["cEmail"].ToString();
            Session["cLogin"].ToString();
            Session["cSenha"].ToString();
        }
        catch (Exception){
            Response.Redirect("login.aspx");
        }
    }
    protected void botaoFinalizarCadastro_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Usuario cliente = new Usuario();
            cliente.nome = campoNome.Text;
            cliente.cidade = campoCidades.Text;
            cliente.cpf = Session["cCpf"].ToString();
            cliente.email = Session["cEmail"].ToString();
            cliente.endereco = campoEndereco.Text;
            cliente.aceitoTermos = "SIM";
            cliente.fone = campoTelefone.Text;
            cliente.login = Session["cLogin"].ToString();
            cliente.senha = Session["cSenha"].ToString();
            try
            {
                CadastrarDadosController controller = new CadastrarDadosController();

                controller.cadastrar(cliente);

                Response.Write("<script language='javascript'>alert('Usuário Cadastrado com Sucesso.');</script>");
                Response.Redirect("login.aspx");
            }
            catch
            {
                Response.Write("<script language='javascript'>alert('Erro: Usuário não pode ser Cadastrado.');</script>");
            }
        }
    }
}