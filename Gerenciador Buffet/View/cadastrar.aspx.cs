using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class cadastrar : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void botaoCadastrar_Click(object sender, EventArgs e)
    {
        if(Page.IsValid){

        
        Session["cCpf"] = campoCpf.Text;
        Session["cEmail"] = campoEmail.Text;
        Session["cLogin"] = campoLogin.Text;
        Session["cSenha"] = campoSenha.Text;


        CadastrarController controller = new CadastrarController();
        

        Usuario cpf = controller.pesquisarCpf(campoCpf.Text);
        Usuario login = controller.pesquisarLogin(campoLogin.Text);
        Usuario email = controller.pesquisarEmail(campoEmail.Text);
        Usuario senha = controller.pesquisarSenha(campoSenha.Text);
        String mensagem = null;

        if (login != null)
        {
            mensagem = "Já existe uma conta com este login! \\n";
        }
        if(senha != null){
            mensagem += "Já existe uma conta com esta senha! \\n";
        }
        if(email != null){
            mensagem += "Já existe uma conta com este email! \\n";
        }
        if(cpf != null){
            mensagem += "Já existe uma conta com este cpf! \\n";
        }
        if(mensagem != null){
            Response.Write("<script language='javascript'> alert('" + mensagem + "'); </script>");
        }else{
            Response.Redirect("termos.aspx");
        }

        }
    }
}