package com.edc.util;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

public class Tes {
	public static void main(String[] args) throws AddressException, MessagingException {
		int code = EmailUtil.sendEmailCode("sunbiyu0319@163.com");
		System.out.println(code);
	}
}
