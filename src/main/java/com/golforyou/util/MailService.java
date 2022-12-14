package com.golforyou.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.golforyou.service.LoginService;
import com.golforyou.vo.CustomerVO;
import com.golforyou.vo.MemberVO;

@Service
public class MailService {

	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper helper;
    private static final String setFrom = "jiin724@gmail.com";
    private int authNumber;
    
   
    
    @Autowired
    private LoginService loginService;
    
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
    
    //비밀번호 찾기 메일
	public String findPwdMail(String email) {
		makeRandomNumber();
		
		
		//String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "GolForYou 계정 임시 비밀번호"; // 이메일 제목 
		String content = 
				"안녕하세요, GolForYou를 이용해주셔서 감사합니다. " +
                "<br><br>" + 
			    "임시비밀번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 번호로 로그인 해주세요"; //이메일 내용 삽입
	
		mailSend(setFrom, toMail, title, content); // Cannot invoke "com.golforyou.util.MailService.findPwdMail(String)" because "this.mailsender" is null
		
		String tempPwd=bCryptPasswordEncoder.encode(Integer.toString(authNumber));
		
		MemberVO member=new MemberVO();
		member.setPassword(tempPwd);
		member.setMemail(email);
		loginService.updateTempPwd(member);
		return Integer.toString(authNumber);
	}
    
	
//
//	public String findPwdMail(String email, MemberVO member) {
//		makeRandomNumber();
//		
//        SimpleMailMessage message = new SimpleMailMessage();
//        String toMail = email;
//        
//    	String title = "GolForYou 계정 확인 메일.";
//        String content = "<h2>안녕하세요 당신의 아이디는 "+member.getUsername()+"<br>당신의 비밀번호는 "+member.getPassword()+"입니다.</h2>";
//		
//    	return Integer.toString(authNumber);
//	}
    
	 //회원가입 인증 메일 발송 
	public String insertMemberEmail(MemberVO member) {
		//렌덤 문자열 
		
		makeRandomNumber();
		int mailkey=authNumber;

		String toMail = member.getMemail();
		
		System.out.println("tomail: "+toMail);
		String title = "GolForYou 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"<h1>GolForYou에 가입해주셔서 감사합니다.<h1>" + 	//html 형식으로 작성 ! 
               "<br><br>" + 
			    "<br>아래 [이메일 인증 확인]을 눌러 회원가입을 완료하세요" + 
			    "<br><a href='http://192.168.104.209:8091/join/registerEmail?memail=" + 
			    member.getMemail()+"&mailkey="+mailkey+"' target='_black'>이메일 인증 확인</a>";
		
		
	
		member.setMailkey(mailkey);
		member.setMemail(toMail);
		loginService.updateMailKey(member); //update mailkey in DB
		
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	
	
	 //1:1문의 
	public void OnebyOneFnqEmail(CustomerVO ct) {

		String toMail = "jiin724@gmail.com"; //지정받은 담당자, 보통의 경우 info 메일

		String title = "[고객문의] "+ct.getQuestion_title(); // 이메일 제목 
		String content ="문의 내용 : "+ct.getQuestion_contents()+"<br>"+
						"문의 유형 : "+ct.getConsult_type()+"<br>"+
						"고객 번호 : "+ct.getPhoneNum()+"<br>"+
						"답변할 고객 메일 : "+ct.getQuestion_email()+"<br>";
						
		mailSend(setFrom, toMail, title, content);
		
	}


	public MailService(JavaMailSender jSender)throws MessagingException{
		this.mailSender = jSender;
		message = jSender.createMimeMessage();
		helper = new MimeMessageHelper(message,true,"utf-8");
		
	}
	
	
    
    public void mailSend(String setFrom, String toMail, String title, String content) {
    	        
//        message.setTo(member.getMemail());
//        message.setFrom(MailService.FROM_ADDRESS);
//        message.setSubject(title); //member.getTitle()
//        message.setText(content); //member.getMessage()
//
//        mailSender.send(message);
    	//MimeMessage message = mailSender.createMimeMessage();
        
        try {
        	
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
        
        
    }
    
    
}
