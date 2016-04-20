using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Diagnostics;
using System.Net;
using System.Net.Mail;




public class ContatoController
{
    private MailMessage emailEnviar;
    private SmtpClient clienteEmail;
	public ContatoController()
	{
        emailEnviar = new MailMessage();
        clienteEmail = new SmtpClient();
	}

    public String enviarEmail(String email, String assunto, String mensagem, String nome)
    {
        emailEnviar.To.Add(new MailAddress("buffetgerenciador@hotmail.com"));
        emailEnviar.From = new MailAddress(email);
        emailEnviar.Subject = assunto;
        emailEnviar.Body = "Nome: " + nome + "<br />Email: " + email + "<br />Assunto: " + assunto + "<br />Mensagem: " + mensagem;
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
                return "<script language='javascript'>alert('Email Enviado Com Sucesso.');</script>";

            }
            catch
            {
                return "<script language='javascript'>alert('Erro: Não Foi Possível Enviar o Email.');</script>";
            }
        }
    }
}