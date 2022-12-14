package com.golforyou.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.golforyou.config.auth.PrincipalDetails;
import com.golforyou.repository.UserRepository;
import com.golforyou.service.LoginService;
import com.golforyou.service.MypageService;
import com.golforyou.service.RankingService;
import com.golforyou.vo.RankingVO;
import com.golforyou.util.MailService;
import com.golforyou.vo.AddrVO;
import com.golforyou.vo.MemberVO;


@Controller
public class LoginController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private RankingService rankingService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired(required=false)
	private MailService mailsender;
	
	//@Autowired
	//private PrincipalDetailsService principalDetail;
	@GetMapping("/test/login")
	public String testLogin (HttpServletRequest request, HttpSession session, HttpServletResponse response,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails) throws Exception{
		response.setContentType("text/html;charset=utf-8");
	
		System.out.println("/test/login================");
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
		
		System.out.println("authentication:"+principalDetails.getUsername()); //getUser ??? ?????????????????????..
		System.out.println("userDetails:"+userDetails.getUsername());
		request.getSession().setAttribute("id", principalDetails.getUsername());
		request.getSession().setAttribute("pw", principalDetails.getPassword());
		
		MemberVO m= loginService.getMember(principalDetails.getUsername());
		
		if(m.getNickname()==null || m.getMphone()==null) {
			
			return "redirect:/addjoin";
			
		}else {
			
		
		request.getSession().setAttribute("nickname", m.getNickname());
		request.getSession().setAttribute("rolecheck", m.getMrole());
		request.getSession().setAttribute("mstate", m.getMstate());
		int mstate = (int)session.getAttribute("mstate");
	
		System.out.println(m.getNickname()); 
		
		PrintWriter out=response.getWriter(); 

		if(mstate != 1) {
			out.println("<script>");
			out.println("alert('???????????? ??????????????? ??????????????????')");
			out.println("location='/index'");
			out.println("</script>");
			
			SecurityContextHolder.clearContext();
			session.invalidate();
		}
			
		
		if(principalDetails.getUsername()!=null ) {
			
			
			out.println("<script>");
			out.println("alert('???????????? ???????????????.');");
			out.println("location='/index';");
			out.println("</script>");
			
		}
		
			
		
		return null;
		}
		
	}
//	
//	
//	@GetMapping("/test/oauth/login")
//	public String testOauthLogin(HttpServletRequest request,
//			Authentication authentication,
//			@AuthenticationPrincipal OAuth2User oauth){
//		System.out.println("/test/oauth/login================");
//		OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
//		
//		System.out.println("authentication:"+oauth2User.getAttributes());
//		System.out.println("oauth2user:"+oauth.getAttributes());
//		System.out.println("getname?:"+oauth2User.getName());
//		
//		
//		request.getSession().setAttribute("id", oauth2User.getName());
//		request.getSession().setAttribute("pw", oauth2User.getName()); //????????????
//		request.getSession().setAttribute("nickname", oauth2User.getName()); 
//		//request.getSession().setAttribute("id", oauth2User.getAttribute);
//		//MemberVO m= loginService.getMember(oauth2User.getNickname());
//		//System.out.println(m);
//		//request.getSession().setAttribute("nickname", m.getNickname());
//		
//				
//		return "redirect:/index";
//	}
	
	
	@RequestMapping("/addjoin")
	public ModelAndView OauthJoin(HttpServletRequest request,
			Authentication authentication,
			@AuthenticationPrincipal OAuth2User oauth){
		
		//????????? ??? ??? ???????????? nickname ????????? ?????????, ????????? ?????? ?????? ???????????? ?????? 
		
		List<AddrVO> addrList = mypageService.getAddrList();
		ModelAndView m=new ModelAndView("member/addjoin");
		
		m.addObject("addrList",addrList);
		return m;
	}
	

	@GetMapping({"","/"})
	public String index() {
		return "redirect:/index";	
	}
	
	
//	//OAuth??? ????????? ??????, ?????? ???????????? ?????? PrincipalDetails
//	@GetMapping("/user")
//	public @ResponseBody String user(@AuthenticationPrincipal PrincipalDetails principalDetails) {
//		System.out.println("principalDetails:"+principalDetails.getUsername());
//		return "user";
//	}
	
	
//	 @GetMapping("/user/login")
//	    public String userLoginForm(@ModelAttribute("member") MemberVO member, HttpSession session) {
//	        if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
//	            return "redirect:/";
//	        }
//
//	        return "/member/login";
//	    }
	 
	 
	@RequestMapping("/access_denied")
	public String access_denied(Model model){
		model.addAttribute("loginErrorMsg","????????? ?????? ???????????? ??????????????????");
		return "member/access_denied";
	}
	
	@GetMapping("/manager")
	public @ResponseBody String manager() {
		return "manager";
	}
	

	@RequestMapping("/login")
	public String login(HttpSession session, HttpServletResponse response)  throws Exception{
		
//		if(session==null){
//			return "member/login";
//		
//		}else {
//			return "redirect:/";   //????????? ????????? index??? 
//		}	
		
		return "member/login";
	}
	
	//????????? ??????????????? ?????? ????????? ??????????????? 
	@RequestMapping("/loginOk")
	public String login_ok() {
		return "redirect:/test/login";
	}
	
	@RequestMapping("/index")
	public String loginandSession(HttpServletRequest request, HttpSession session,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails){
		
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
		
		System.out.println("authentication:"+principalDetails.getUsername()); 
		System.out.println("userDetails:"+userDetails.getUsername());
		
		request.getSession().setAttribute("id", principalDetails.getUsername());
	
		return "redirect:/";
	}

	@GetMapping("/join")
	public String join(PrincipalDetails principalDetails, HttpSession session) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
//		System.out.println("auth"+auth);
//		if(auth==null){
//			return "member/join";
//		
//		}else {
//			return "redirect:/";   //????????? ????????? index??? 
//		}
		return "member/join";
	}
	 @ResponseBody
	@RequestMapping("/idcheck")
    public int idcheck(String username, HttpServletRequest request) {
        System.out.println("?????????");
        int count = 0;
        //Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = this.loginService.idCheck(username);
        System.out.println(count);
        
        if(count==1) {
        	request.setAttribute("username", username);
        }
        //map.put("cnt", count);
        //System.out.println(map);

        return count;
    }
	
	@PostMapping("/join_ok")
	public String joinOk(MemberVO member,RedirectAttributes Redirect) {
		

		System.out.println(member);
		member.setMrole("ROLE_USER");
		member.setMstate(0); //default;
		
		String rawPassword = member.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encPassword);
		MemberVO m = userRepository.save(member);//???????????? ??????
		RankingVO r = new RankingVO();
		rankingService.createRank(r); //??????????????? ????????? ???????????? ??????
		
		
		mailsender.insertMemberEmail(m);
		
		
		return "redirect:/";
	}
		
	@GetMapping("/join/registerEmail")
	public String emailConfirm(MemberVO member) {
		
		loginService.updateMailAuth(member);
		
		return "/member/emailAuthSuccess";
	}
	
	//???????????? ??????
	@GetMapping("findPwd")
	public String findPwd() {
		return "member/findPwd"; 
			
	}//findPwd()
		
//			@RequestMapping("/findPwdValidate")
//		    public ModelAndView findPwd_ok(String email, HttpServletRequest request) {
//		        System.out.println("?????????");
//		        int count = 0;
//		        //Map<Object, Object> map = new HashMap<Object, Object>();
//		 
//		        count = this.loginService.emailCheck(email);
//		        System.out.println(count);
//		        
//		        if(count==1) {
//		        	request.setAttribute("email", email);
//		        	
//		        }
//		        //map.put("cnt", count);
//		        //System.out.println(map);
//		        
//		        return count;
//		        ModelAndView m=new ModelAndView("findPwd_ok");
//		     
//		    }
	
		
		//???????????? ?????? ???????????? ??????
		@RequestMapping("findPwd_ok")
		public String MailSender(MemberVO m, HttpServletRequest request) {
			
			
			String email=request.getParameter("email");
		
			m=this.loginService.getPassword(email);
			System.out.println("m"+m);
			String mEmail=m.getMemail(); //?????? email ??? ??? 
			int mstate=m.getMstate();
			
			System.out.println(mEmail); //null
			
			if(email.equals(mEmail) && mstate!=2) {
				
				System.out.println("?????? ????????? ???");
				System.out.println(email);
				mailsender.findPwdMail(email);
				//????????? ????????? authnumber??? ???????????? ??????
				
			}
			
			return "member/findPwd_ok";
		
		}
		
	//@Secured("ROLE_ADMIN") ????????? ????????? 
	//@PreAuthorize("hasRole('ROLE_MANAGER') or hasRole()")  _ ??? ??? ?????? ?????? ?????? ??? ????????? ?????? : ?????? ?????? ???, 
	@Secured("ROLE_ADMIN")
	@GetMapping("/info")
	public @ResponseBody String info() {
		return "????????????";
	}
	
	//@SuppressWarnings("null")
		@RequestMapping("addjoin_ok")
		public ModelAndView profileEdit_ok(MemberVO m, HttpServletRequest request, HttpServletResponse response, HttpSession session, Authentication authentication,
				@AuthenticationPrincipal PrincipalDetails userDetails) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
	
			PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
	     	System.out.println(principalDetails);
			
	     		String username=principalDetails.getUsername();
				String nickname=request.getParameter("nickname"); 
				String mphone=request.getParameter("mphone"); 
				String memail=request.getParameter("memail");
				String maddr=request.getParameter("maddr");
			
			
			m.setUsername(username);
			m.setNickname(nickname); 
			m.setMphone(mphone); 
			m.setMemail(memail);
			m.setMaddr(maddr);
			
			//System.out.println(m);
			loginService.updateMember(m);//username ???????????? ?????????, ?????????, maddr update
			
		
			return new ModelAndView("redirect:/test/login");
			
		}//profileEdit_ok()

	
	

}


