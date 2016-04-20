using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dadosfestas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            DadosFestasController controller = new DadosFestasController();
            int id = Convert.ToInt32(Session["usuario"].ToString());
            Usuario cliente = controller.pesquisarUsuario(id);
            nome.Text = "Seja Bem Vindo, " + cliente.nome.ToString();


            sqlFesta.SelectCommand = "select *from Festas where idCliente = " + id; 
           
        }

    }
    protected void botaoDeslogar_Click(object sender, EventArgs e)
    {
        Session["usuario"] = null;
        Response.Redirect("login.aspx");
    }
    protected void BotaoCalcular_Click(object sender, EventArgs e)
    {
        if (TabelaFesta.SelectedIndex > -1)
        {
            if (Page.IsValid)
            {

                List<Alimento> listaAlimentos = new List<Alimento>();
                List<Bebida> listaBebidas = new List<Bebida>();

                DadosFestasController controller = new DadosFestasController();


                foreach (Control ctr in DataList1.Controls)
                {
                    CheckBox ch = (CheckBox)ctr.FindControl("CheckBox1");




                    if (ch != null)
                    {
                        if (ch.Checked)
                        {
                            Label id = (Label)ctr.FindControl("idAlimento");
                            Alimento alimento = controller.pesquisarAlimento(Int32.Parse(id.Text));
                            listaAlimentos.Add(alimento);
                        }
                    }
                }
                decimal valor = 0;

                foreach (Alimento alimento in listaAlimentos)
                {
                    valor += (decimal)alimento.valorUnitario * Int32.Parse(TabelaFesta.SelectedRow.Cells[2].Text);
                    
                }

                //inicia as bebidas

                List<int> quant = new List<int>();

                foreach (Control ctr in DataList2.Controls)
                {
                    CheckBox ch = (CheckBox)ctr.FindControl("CheckBox2");

                    

                    if (ch != null)
                    {
                        if (ch.Checked)
                        {
                            Label id = (Label)ctr.FindControl("idBebida");
                            TextBox quantidade = (TextBox)ctr.FindControl("campoQuantidade");
                            quant.Add(Int32.Parse(quantidade.Text));
                            Bebida bebida = new Bebida();
                            bebida = controller.pesquisarBebida(Int32.Parse(id.Text));
                            listaBebidas.Add(bebida);
                        }
                    }
                }
                int i = 0;
                foreach (Bebida bebida in listaBebidas)
                {

                    valor += (decimal)bebida.valorUnitario * quant[i] * Int32.Parse(TabelaFesta.SelectedRow.Cells[2].Text);
                    i++;
                }

                valorTotal.Text = Convert.ToString(Math.Round(valor, 2));
            }
        }
        else
        {
            Response.Write("<script language='javascript'> alert('Erro: Selecione uma festa!'); window.location=('dadosfestas.aspx'); </script>");
        }

    }


    protected void botaoContratar_Click(object sender, EventArgs e)
    {
        if (TabelaFesta.SelectedIndex > -1 && valorTotal != null)
        {
            List<Alimento> listaAlimentos = new List<Alimento>();
            List<Bebida> listaBebidas = new List<Bebida>();

            DadosFestasController controller = new DadosFestasController();

            foreach (Control ctr in DataList1.Controls)
            {
                CheckBox ch = (CheckBox)ctr.FindControl("CheckBox1");



                if (ch != null)
                {
                    if (ch.Checked)
                    {
                        Label id = (Label)ctr.FindControl("idAlimento");
                        Alimento alimento = controller.pesquisarAlimento(Int32.Parse(id.Text));
                        listaAlimentos.Add(alimento);
                    }
                }
            }

            List<int> quant = new List<int>();

            foreach (Control ctr in DataList2.Controls)
            {
                CheckBox ch = (CheckBox)ctr.FindControl("CheckBox2");

                if (ch != null)
                {
                    if (ch.Checked)
                    {
                        Label id = (Label)ctr.FindControl("idBebida");
                        TextBox quantidade = (TextBox)ctr.FindControl("campoQuantidade");
                        quant.Add(Int32.Parse(quantidade.Text));
                        Bebida bebida = controller.pesquisarBebida(Int32.Parse(id.Text));
                        listaBebidas.Add(bebida);
                    }
                }
            }

            int i = 0;
            foreach(Bebida bebida in listaBebidas)
            {
                Iten item = new Iten();

                item.idBebidas = bebida.bebida_id;
                item.idFesta = Int32.Parse(TabelaFesta.SelectedRow.Cells[0].Text);
                item.quantidade = quant[i];

                controller.cadastrar(item);

                i++; 
            }
            foreach(Alimento alimento in listaAlimentos)
            {
                Iten item = new Iten();

                item.idAlimentos = alimento.alimento_id;
                item.idFesta = Int32.Parse(TabelaFesta.SelectedRow.Cells[0].Text);

                controller.cadastrar(item);
            }

            Festa festa = new Festa();

            festa.festa_id = Int32.Parse(TabelaFesta.SelectedRow.Cells[0].Text);
            festa.tipoFesta = Server.HtmlDecode(TabelaFesta.SelectedRow.Cells[1].Text);
            festa.numeroConvidados = Int32.Parse(TabelaFesta.SelectedRow.Cells[2].Text);
            festa.quantidadeCadeiras = Int32.Parse(TabelaFesta.SelectedRow.Cells[3].Text);
            festa.quantidadeMesas = Int32.Parse(TabelaFesta.SelectedRow.Cells[4].Text);
            festa.local = Server.HtmlDecode(TabelaFesta.SelectedRow.Cells[5].Text);
            festa.data = TabelaFesta.SelectedRow.Cells[6].Text;
            festa.status = Server.HtmlDecode(TabelaFesta.SelectedRow.Cells[7].Text);

            festa.idCliente = Convert.ToInt32(Session["usuario"].ToString());

            


            string valor = TabelaFesta.SelectedRow.Cells[8].Text;

            if (valor.Equals("&nbsp;"))
            {
                festa.valorTotal = Decimal.Parse(valorTotal.Text);
            }
            else
            {
                festa.valorTotal = Decimal.Parse(TabelaFesta.SelectedRow.Cells[8].Text) + Decimal.Parse(valorTotal.Text);
            }

            controller.alterar(festa);

            Response.Write("<script language='javascript'> alert('Intes Cadastrados com Sucesso!'); window.location=('dadosfestas.aspx'); </script>");

        }
        else
        {
            Response.Write("<script language='javascript'> alert('Erro: Selecione uma linha da tabela ou Calcule o Valor!'); window.location=('dadosfestas.aspx'); </script>");
        }
    }

    
}