using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;



public partial class gerenciaralimentacao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            GerenciarAlimentacaoController controller = new GerenciarAlimentacaoController();
            int id = Convert.ToInt32(Session["admin"].ToString());
            Usuario cliente = (Usuario)controller.pesquisarUsuario(id);
            nome.Text = "Seja Bem Vindo, " + cliente.nome.ToString();
        }
    }

    protected void botaoDeslogar_Click(object sender, EventArgs e)
    {
        Session["admin"] = null;
        Response.Redirect("login.aspx");
    }

    protected void botaoCadastraAlimento_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            if (campoImagemAlimento.HasFile)
            {
                String filename = Path.GetFileName(campoImagemAlimento.FileName);
                int cont = 0;
                while(File.Exists(Server.MapPath("~/img/Alimentos/") + filename))
                {
                    filename = cont.ToString() + Path.GetFileName(campoImagemAlimento.FileName);
                    cont++;
                }
                campoImagemAlimento.SaveAs(Server.MapPath("~/img/Alimentos/") + filename);

                Alimento alimento = new Alimento();

                GerenciarAlimentacaoController controller = new GerenciarAlimentacaoController();

                alimento.nome = campoNomeAlimento.Text;
                alimento.quantidade = Int32.Parse(campoQtdAlimento.Text);
                alimento.imagemAlimento = filename;
                alimento.valorUnitario = Decimal.Parse(campoValorUnitarioAlimento.Text);
                alimento.descricao = campoDescricaoAlimento.Text;

                controller.cadastrar(alimento);

                campoNomeAlimento.Text = "";
                campoQtdAlimento.Text = "";
                campoValorUnitarioAlimento.Text = "";
                campoDescricaoAlimento.Text = "";
                campoImagemAlimento = null;

                TabelaAlimentos.DataBind();

                Response.Write("<script language='javascript'> alert('Alimento Cadastrado com Sucesso!'); window.location=('gerenciaralimentacao.aspx'); </script>");

            }
        }
    }


    protected void botaoAlterarAlimentoo_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            GerenciarAlimentacaoController controller = new GerenciarAlimentacaoController();
            Alimento alimento = new Alimento();
            alimento.alimento_id = Int32.Parse(TabelaAlimentos.SelectedRow.Cells[0].Text);
            alimento.descricao = campoDescricaoAlimento.Text;
            alimento.nome = campoNomeAlimento.Text;
            alimento.quantidade = Int32.Parse(campoQtdAlimento.Text);
            alimento.valorUnitario = Decimal.Parse(campoValorUnitarioAlimento.Text.Replace("R$", ""));
            alimento.imagemAlimento = TabelaAlimentos.SelectedRow.Cells[3].Text;

            if (campoImagemAlimento.HasFile)
            {
                String filename = Path.GetFileName(campoImagemAlimento.FileName);
                int cont = 0;
                while (File.Exists(Server.MapPath("~/img/Alimentos/") + filename))
                {
                    filename = cont.ToString() + Path.GetFileName(campoImagemAlimento.FileName);
                    cont++;
                }
                campoImagemAlimento.SaveAs(Server.MapPath("~/img/Alimentos/") + filename);

                FileInfo file = new FileInfo(Server.MapPath("~/img/Alimentos/") + alimento.imagemAlimento);

                file.Delete();

                alimento.imagemAlimento = campoImagemAlimento.FileName;
            }
            else
            {
                alimento.imagemAlimento = TabelaAlimentos.SelectedRow.Cells[3].Text;
            }

            controller.atualizar(alimento);
            

            campoNomeAlimento.Text = "";
            campoQtdAlimento.Text = "";
            campoValorUnitarioAlimento.Text = "";
            campoDescricaoAlimento.Text = "";

            botaoAlterarAlimento.Visible = false;
            botaoCadastraAlimento.Visible = true;
            campoImagemAlimentoRequired.Visible = true;

            Response.Write("<script language='javascript'> alert('Alimento Atualizado com Sucesso!'); window.location=('gerenciaralimentacao.aspx'); </script>");
        }
    }



    protected void TabelaAlimentos_SelectedIndexChanged(object sender, EventArgs e)
    {
        campoNomeAlimento.Text = Server.HtmlDecode(TabelaAlimentos.SelectedRow.Cells[1].Text);
        campoDescricaoAlimento.Text = Server.HtmlDecode(TabelaAlimentos.SelectedRow.Cells[2].Text);


        campoQtdAlimento.Text = TabelaAlimentos.SelectedRow.Cells[4].Text;

        campoValorUnitarioAlimento.Text = TabelaAlimentos.SelectedRow.Cells[5].Text;


        botaoAlterarAlimento.Visible = true;
        botaoCadastraAlimento.Visible = false;
        campoImagemAlimentoRequired.Visible = false;


    }

    protected void TabelaAlimentos_DeleteRow(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "Delete")
        {
            GerenciarAlimentacaoController controller = new GerenciarAlimentacaoController();

            int index = Int32.Parse((string)e.CommandArgument);
            int id = Int32.Parse(TabelaAlimentos.Rows[index].Cells[0].Text);

            Alimento alimento = (Alimento)controller.pesquisarAlimento(id);
            controller.deletar(alimento);
           
           

            FileInfo file = new FileInfo(Server.MapPath("~/img/Alimentos/") + alimento.imagemAlimento);

            file.Delete();

           

            Response.Write("<script language='javascript'> alert('Alimento Removido com Sucesso!'); window.location=('gerenciaralimentacao.aspx'); </script>");
            
            
        }
    }
}