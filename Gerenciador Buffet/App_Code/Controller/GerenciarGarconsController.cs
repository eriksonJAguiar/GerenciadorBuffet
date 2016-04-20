using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Linq;
using System.Linq;
using System.Net.Mail;
using System.Web;


public class GerenciarGarconsController
{
    private ConnectData banco;
    
    private Usuario cliente;
    private MailMessage emailEnviar;
    private SmtpClient garconEmail;
       

    public GerenciarGarconsController()
    {
        banco = new ConnectData();
        garconEmail = new SmtpClient();
        emailEnviar = new MailMessage();
    }

    public Garcon pesquisarGarconCpf(string cpf)
    {
        return banco.pesquisa<Garcon>(p => p.cpf == cpf);
    }

    public Garcon pesquisarGarcon(string email)
    {
        return banco.pesquisa<Garcon>(p => p.email == email);
    }

    public Garcon pesquisarGarcon(int id)
    {
        return banco.pesquisa<Garcon>(p => p.garcon_id == id);
    }

    public Festa pesquisarFesta(int id)
    {
        return banco.pesquisa<Festa>(p => p.festa_id == id);
    }

    public Usuario pesquisarUsuario(int id)
    {
        return banco.pesquisa<Usuario>(p => p.usuario_id == id);
    }

    public GarconsContratado pesquisarContratado(int idGarcon, int idFesta)
    {
        return banco.pesquisa<GarconsContratado>(p => (p.idGarcon == idGarcon) && (p.idFesta == idFesta));
    }

    public GarconsContratado pesquisarContratado(int id)
    {
        return banco.pesquisa<GarconsContratado>(p => p.garcon_contratado_id == id);
    }

    public void contrartar(GarconsContratado garcon)
    {
        banco.cadastrar<GarconsContratado>(garcon);
    }

    public void cadastrar(Garcon garcon)
    {
        banco.cadastrar<Garcon>(garcon);

    }

    public void deletar(Garcon garcon)
    {
        banco.deletar<Garcon>(garcon);
    }

    public void deletar(GarconsContratado garconContratado)
    {
        banco.deletar<GarconsContratado>(garconContratado);
    }

    public void atualizar(Garcon garcon)
    {
        banco.atualiza<Garcon>(garcon);
    }


    public String enviarEmail(GarconsContratado garcon)
    {
        

        if (garcon != null)
        { 
            emailEnviar.To.Add(new MailAddress(garcon.email));
            emailEnviar.From = new MailAddress("buffetgerenciador@hotmail.com");
            emailEnviar.Subject = "Buffet - Trabalha na Festa";
            emailEnviar.Body = "Óla "+garcon.email+" estamos solicitando seus serviços para a uma festa" 
                                                  +" no dia: "+garcon.data+", local: "+garcon.Festa.local+"."
                                                  +" Aguardamos sua confirmação, por email ou pelo fone(XX)XXXX-XXXX";
            emailEnviar.IsBodyHtml = true;
            emailEnviar.Priority = MailPriority.High;
            using (garconEmail)
            {
                garconEmail.Host = "smtp.live.com";
                garconEmail.Port = 587;
                garconEmail.Credentials = new System.Net.NetworkCredential("buffetgerenciador@hotmail.com", "buffet123");
                garconEmail.EnableSsl = true;
                try
                {
                    garconEmail.Send(emailEnviar);
                    return "Enviado com sucesso!";

                }
                catch
                {
                    return "Erro: Não foi possível enviar o email!";
                }
            }
        }
        else
        {
            return "Erro: Email não cadastrado!";
        }
    }

}
   
