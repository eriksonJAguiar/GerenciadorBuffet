using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class gerenciarbebida : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            GerenciarBebidaController controller = new GerenciarBebidaController();
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

    protected void botaoCadastraBebida_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            if (campoImagemBebida.HasFile)
            {
                String filename = Path.GetFileName(campoImagemBebida.FileName);
                int cont = 0;
                while (File.Exists(Server.MapPath("~/img/Bebidas/") + filename))
                {
                    filename = cont.ToString() + Path.GetFileName(campoImagemBebida.FileName);
                    cont++;
                }
                campoImagemBebida.SaveAs(Server.MapPath("~/img/Bebidas/") + filename);

                Bebida bebida = new Bebida();

                GerenciarBebidaController controller = new GerenciarBebidaController();

                bebida.nome = campoNomeBebida.Text;
                bebida.quantidade = Int32.Parse(campoQtdBebida.Text);
                bebida.imagemBebida = filename;
                bebida.valorUnitario = Decimal.Parse(campoValorUnitarioBebida.Text);
                bebida.descricao = campoDescricaoBebida.Text;

                controller.cadastrar(bebida);


                campoNomeBebida.Text = "";
                campoQtdBebida.Text = "";
                campoValorUnitarioBebida.Text = "";
                campoDescricaoBebida.Text = "";
                campoImagemBebida = null;

                TabelaBebidas.DataBind();

                Response.Write("<script language='javascript'> alert('Bebida Cadastrada com Sucesso!'); window.location=('gerenciarbebida.aspx'); </script>");

            }
        }
    }


    protected void botaoAlterarBebida_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            GerenciarBebidaController controller = new GerenciarBebidaController();
            Bebida bebida = new Bebida();
            bebida.bebida_id = Int32.Parse(TabelaBebidas.SelectedRow.Cells[0].Text);
            bebida.descricao = campoDescricaoBebida.Text;
            bebida.nome = campoNomeBebida.Text;
            bebida.quantidade = Int32.Parse(campoQtdBebida.Text);
            bebida.valorUnitario = Decimal.Parse(campoValorUnitarioBebida.Text.Replace("R$", ""));
            bebida.imagemBebida = TabelaBebidas.SelectedRow.Cells[3].Text;

            if (campoImagemBebida.HasFile)
            {
                String filename = Path.GetFileName(campoImagemBebida.FileName);
                int cont = 0;
                while (File.Exists(Server.MapPath("~/img/Bebidas/") + filename))
                {
                    filename = cont.ToString() + Path.GetFileName(campoImagemBebida.FileName);
                    cont++;
                }
                campoImagemBebida.SaveAs(Server.MapPath("~/img/Bebidas/") + filename);

                FileInfo file = new FileInfo(Server.MapPath("~/img/Bebidas/") + bebida.imagemBebida);

                file.Delete();

                bebida.imagemBebida = campoImagemBebida.FileName;
            }
            else
            {
                bebida.imagemBebida = TabelaBebidas.SelectedRow.Cells[3].Text;
            }

            controller.atualizar(bebida);


            campoNomeBebida.Text = "";
            campoQtdBebida.Text = "";
            campoValorUnitarioBebida.Text = "";
            campoDescricaoBebida.Text = "";

            botaoAlterarBebida.Visible = false;
            botaoCadastraBebida.Visible = true;
            campoImagemBebidaRequired.Visible = true;

            Response.Write("<script language='javascript'> alert('Bebida Atualizado com Sucesso!'); window.location=('gerenciarbebida.aspx'); </script>");
        }
    }



    protected void TabelaBebidas_SelectedIndexChanged(object sender, EventArgs e)
    {

        

        campoNomeBebida.Text = Server.HtmlDecode(TabelaBebidas.SelectedRow.Cells[1].Text);
        campoDescricaoBebida.Text = Server.HtmlDecode(TabelaBebidas.SelectedRow.Cells[2].Text);


        campoQtdBebida.Text = TabelaBebidas.SelectedRow.Cells[4].Text;

        campoValorUnitarioBebida.Text = TabelaBebidas.SelectedRow.Cells[5].Text;


        botaoAlterarBebida.Visible = true;
        botaoCadastraBebida.Visible = false;
        campoImagemBebidaRequired.Visible = false;


    }
    protected void TabelaBebidas_DeleteRow(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            GerenciarBebidaController controller = new GerenciarBebidaController();

            int index = Int32.Parse((string)e.CommandArgument);
            int id = Int32.Parse(TabelaBebidas.Rows[index].Cells[0].Text);

            Bebida bebida = (Bebida)controller.pesquisarBebida(id, "Bebidas");
            controller.deletar(bebida);
            TabelaBebidas.DeleteRow(index);
            TabelaBebidas.DataBind();



            FileInfo file = new FileInfo(Server.MapPath("~/img/Bebidas/") + bebida.imagemBebida);

            file.Delete();

            Response.Write("<script language='javascript'> alert('Bebida Removido com Sucesso!'); window.location=('gerenciarbebida.aspx'); </script>");
        }
        
    }

    
}