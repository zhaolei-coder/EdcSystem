package com.edc.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
	public static int sendEmailCode(String userEmail) throws AddressException, MessagingException {
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.163.com");
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.setProperty("mail.smtp.socketFactory.fallback", "false");
		properties.setProperty("mail.smtp.socketFactory.port", "465");
		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("zhaolei981101@163.com", "MIIEWRCNOIMGZCRB");
			}
		});
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("zhaolei981101@163.com"));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
		message.setSubject("易点餐");
		int code = (int) ((Math.random() * 9 + 1) * 1000);
		message.setContent(
				"<p>尊敬的易点餐用户您好!</p><p>您本次的验证码为: <h1 style='color:red'>" + code + "</h1></p><p>请勿讲验证码泄露给其他人！</p>",
				"text/html; charset=UTF-8");
		Transport.send(message);
		return code;
	}

}
