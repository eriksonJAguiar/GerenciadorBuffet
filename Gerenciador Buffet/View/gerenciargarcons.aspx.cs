using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gerenciargarcons : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {

            GerenciarGarconsController controller = new GerenciarGarconsController();
            int id = Convert.ToInt32(Session["admin"].ToString());
            Usuario cliente = controller.pesquisarUsuario(id);
            //Usuario cliente = (Usuario)controller.pesquisar_rotulo(id, "Usuarios");
            nome.Text = "Seja Bem Vindo, " + cliente.nome.ToString();


        }
    }

    protected void botaoDeslogar_Click(object sender, EventArgs e)
    {
        Session["admin"] = null;
        Response.Redirect("login.aspx");
    }

    protected void botaoAlterarGarcons_Click(object sender, EventArgs e)
    {
        botaoAlterarGarcons.Visible = false;
        botaoCadastraGarcons.Visible = true;
        if(Page.IsValid){

            GerenciarGarconsController controller = new GerenciarGarconsController();
            Garcon garcon = new Garcon();
            garcon.garcon_id = Int32.Parse(TabelaGarcons.SelectedRow.Cells[0].Text);
            garcon.nome = campoNomeGarcons.Text;
            garcon.idade = Int32.Parse(campoIdadeGarcons.Text);
            garcon.telefone = campoTelefoneGarcons.Text;
            garcon.sexo = campoSexoGarcons.Text;

            if (TabelaGarcons.SelectedRow.Cells[2].Text.Equals(campoCpfGarcons.Text))
            {
                garcon.cpf = campoCpfGarcons.Text;
            }else {
                if(controller.pesquisarGarconCpf(campoCpfGarcons.Text) == null){
                    garcon.cpf = campoCpfGarcons.Text;
                }
            }

            if (TabelaGarcons.SelectedRow.Cells[6].Text.Equals(campoEmailGarcons.Text)){
                garcon.email = campoEmailGarcons.Text;
            }else {
                if (controller.pesquisarGarcon(campoEmailGarcons.Text) == null)
                {
                    garcon.email = campoEmailGarcons.Text;
                }
            }

            if(garcon.cpf != null && garcon.email != null){
                controller.atualizar(garcon);
                Response.Write("<script language='javascript'> alert('Garcon alterado com Sucesso!'); window.location=('gerenciargarcons.aspx'); </script>");
            }
            else
            {
                Response.Write("<script language='javascript'> alert('Erro: Garcon não pode ser alterado!'); window.location=('gerenciargarcons.aspx'); </script>");
            }
        }
    }

    protected void botaoCadastraGarcons_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            GerenciarGarconsController controller = new GerenciarGarconsController();
            Garcon garcon = new Garcon();
            garcon.nome = campoNomeGarcons.Text;
            garcon.idade = Int32.Parse(campoIdadeGarcons.Text);
            garcon.cpf = campoCpfGarcons.Text;
            garcon.email = campoEmailGarcons.Text;
            garcon.telefone = campoTelefoneGarcons.Text;
            garcon.sexo = campoSexoGarcons.Text;
            String mensagem = null;

            if (controller.pesquisarGarconCpf(garcon.cpf) != null){
                mensagem = "Já existe um garçon com este cpf! \\n";
            } 
            
            if (controller.pesquisarGarcon(garcon.email) != null){
                mensagem += "Já existe um garçon com este email! \\n";
            }
            
            if(mensagem != null){
                Response.Write("<script language='javascript'> alert('" + mensagem + "'); window.location=('gerenciargarcons.aspx'); </script>");
            }
            else
            {
                controller.cadastrar(garcon);
                Response.Write("<script language='javascript'> alert('Garcon cadastrado com Sucesso!'); window.location=('gerenciargarcons.aspx'); </script>");
            }
        }
    }

    protected void TabelaGarcons_SelectedIndexChanged1(object sender, EventArgs e)
    {
        
            campoNomeGarcons.Text = TabelaGarcons.SelectedRow.Cells[1].Text;
            campoCpfGarcons.Text = TabelaGarcons.SelectedRow.Cells[2].Text;
            campoIdadeGarcons.Text = TabelaGarcons.SelectedRow.Cells[3].Text;
            campoSexoGarcons.Text = TabelaGarcons.SelectedRow.Cells[4].Text;
            campoTelefoneGarcons.Text = TabelaGarcons.SelectedRow.Cells[5].Text;
            campoEmailGarcons.Text = TabelaGarcons.SelectedRow.Cells[6].Text;
            botaoAlterarGarcons.Visible = true;
            botaoCadastraGarcons.Visible = false;
        
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dDown = sender as DropDownList;

        if (dDown.SelectedIndex != -1)
        {
            DropDownList1.SelectedIndex = dDown.SelectedIndex;
            DropDownList2.SelectedIndex = dDown.SelectedIndex;
        }

    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dDown = sender as DropDownList;

        if (dDown.SelectedIndex != -1)
        {
            DropDownList1.SelectedIndex = dDown.SelectedIndex;
            DropDownList2.SelectedIndex = dDown.SelectedIndex;
        }
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dDown = sender as DropDownList;

        if (dDown.SelectedIndex != -1)
        {
            DropDownList3.SelectedIndex = dDown.SelectedIndex;
            DropDownList4.SelectedIndex = dDown.SelectedIndex;
            DropDownList5.SelectedIndex = dDown.SelectedIndex;
        }
    }

    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dDown = sender as DropDownList;

        if (dDown.SelectedIndex != -1)
        {
            DropDownList3.SelectedIndex = dDown.SelectedIndex;
            DropDownList4.SelectedIndex = dDown.SelectedIndex;
            DropDownList5.SelectedIndex = dDown.SelectedIndex;
        }
    }

    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dDown = sender as DropDownList;

        if (dDown.SelectedIndex != -1)
        {
            DropDownList3.SelectedIndex = dDown.SelectedIndex;
            DropDownList4.SelectedIndex = dDown.SelectedIndex;
            DropDownList5.SelectedIndex = dDown.SelectedIndex;
        }
    }

    protected void botaoContratarGarcons_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            GerenciarGarconsController controller = new GerenciarGarconsController();


            GarconsContratado garconContratados = controller.pesquisarContratado(Int32.Parse(DropDownList1.SelectedItem.Text), Int32.Parse(DropDownList3.SelectedItem.Text));

            if (garconContratados == null)
            {
                Garcon garcon = controller.pesquisarGarcon(Int32.Parse(DropDownList1.SelectedItem.Text));

                Festa festa = (Festa)controller.pesquisarFesta(Int32.Parse(DropDownList3.SelectedItem.Text));

                GarconsContratado contratado = new GarconsContratado();

                contratado.idGarcon = garcon.garcon_id;
                contratado.idFesta = festa.festa_id;
                //contratado.status = "Não Confirmado";
                contratado.valorPago = Decimal.Parse(valorPagoGarcon.Text);
                contratado.fone = garcon.telefone;
                contratado.email = garcon.email;
                contratado.data = DateTime.Parse(festa.data);

                controller.contrartar(contratado);

                string mensagem = controller.enviarEmail(contratado);

                

                Response.Write("<script language='javascript'> alert('" + mensagem + "'); window.location=('gerenciargarcons.aspx'); </script>");

            }
            else
            {
                Response.Write("<script language='javascript'> alert('Garçon já foi contratado'); window.location=('gerenciargarcons.aspx'); </script>");
            }
        }

    }
    protected void garcon_id_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            GerenciarGarconsController controller = new GerenciarGarconsController();

            int index = Int32.Parse((string)e.CommandArgument);
            int id = Int32.Parse(TabelaGarcons.Rows[index].Cells[0].Text);

            Garcon garcon = (Garcon)controller.pesquisarGarcon(id);
            controller.deletar(garcon);
           
            

            Response.Write("<script language='javascript'> alert('Garcon Removido com Sucesso!'); window.location=('gerenciargarcons.aspx'); </script>");
        }
    }
    protected void TabelaGarconContrados_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "Delete")
        {
            GerenciarGarconsController controller = new GerenciarGarconsController();

            int index = Int32.Parse((string)e.CommandArgument);
            int id = Int32.Parse(TabelaContratados.Rows[index].Cells[0].Text);

            GarconsContratado contratado = controller.pesquisarContratado(id);
            controller.deletar(contratado);
            
            TabelaContratados.DataBind();

            Response.Write("<script language='javascript'> alert('Garçon Contratado Removido com Sucesso!'); window.location=('gerenciargarcons.aspx'); </script>");
        }
    }
}