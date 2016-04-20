using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Diagnostics;
using System.Net;
using System.Net.Mail;



public class EsqueceuSenhaController
{
    private ConnectData conexao;
    private Usuario cliente;
    private MailMessage emailEnviar;
    private SmtpClient clienteEmail;
    
    public EsqueceuSenhaController()
    {
        conexao = new ConnectData();
        cliente = new Usuario();
        clienteEmail = new SmtpClient();
        emailEnviar = new MailMessage();
    }

    public String enviarEmail(string email)
    {
        cliente = conexao.pesquisa<Usuario>(p => p.email == email);
        if (cliente != null)
        {
            emailEnviar.To.Add(new MailAddress(email));
            emailEnviar.From = new MailAddress("buffetgerenciador@hotmail.com");
            emailEnviar.Subject = "Buffet - Dados da Conta";
            emailEnviar.Body = "Login: " + cliente.login + "<br />Senha: " + cliente.senha;
            emailEnviar.IsBodyHtml = true;
            emailEnviar.Priority = MailPriority.High;
            using (clienteEmail)
            {
                clienteEmail.Host = "smtp.live.com";
                clienteEmail.Port = 587;
                clienteEmail.Credentials = new System.Net.NetworkCredential("buffetgerenciador@hotmail.com", "buffet123");
                clienteEmail.EnableSsl = true;
                try
                {
                    clienteEmail.Send(emailEnviar);
                    return "<script language='javascript'>alert('Recuperação da senha com sucesso.');</script>";

                }
                catch
                {
                    return "<script language='javascript'>alert('Erro: Não foi possível enviar o email.');</script>";
                }
            }
        }
        else
        {
            return "<script language='javascript'>alert('Erro: Email não cadastrado.');</script>";
        }
    }

}