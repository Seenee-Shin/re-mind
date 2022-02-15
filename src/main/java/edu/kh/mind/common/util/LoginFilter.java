//package edu.kh.mind.common.util;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Arrays;
//import java.util.Collection;
//import java.util.Map;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import edu.kh.mind.HomeController;
//import edu.kh.mind.member.model.vo.Member;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.ui.Model;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//
//@WebFilter(   filterName = "loginFilter" ,
//        urlPatterns = { "/my/*", "/chat/*", "/adminPro/*" , "/board/*", "/free/*", "/selftest/*"} )
//// member/* , 글쓰기,수정,삭제,북마크 등등   chat/*
//// main/* , admin/* 추가 예정
//public class LoginFilter implements Filter{
//
//    public void init(FilterConfig filterConfig) throws ServletException {
//        System.out.println("필터 실행");
//    }
//
//
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//
//
//        HttpServletRequest req = (HttpServletRequest)request;
//        HttpServletResponse resp = (HttpServletResponse)response;
//        response.setContentType("text/html;charset=utf-8");
//
//        PrintWriter out = response.getWriter();
//
//
//        String uri = req.getRequestURI();
//        String contextPath = req.getContextPath();
//
//        String[] arr = uri.substring( (contextPath +"/").length()).split("/");
//
//        HttpSession session = req.getSession();
//        Member loginMember = (Member)session.getAttribute("loginMember");
//
//
//        // 주소 값이 fin/ * / * 인 경우
//        if(arr.length > 1) {
//
//            // ---------------- 비로그인  ----------------
//            if(loginMember == null) {
//
//                // 비회원 + /member/* 인 경우
//                if(arr[0].equals("my")) {
//
//                    // 회원만 이용 가능한 주소 값
//                    if(      arr[1].equals("appointment") ||
//                            arr[1].equals("appointmentCancel") ||
//                            arr[1].equals("emotionRecord") ||
//                            arr[1].equals("emotionRecordData") ||
//                            arr[1].equals("emotionDiary") ||
//                            arr[1].equals("reviewInsert") ||
//                            arr[1].equals("enquiry") ||
//                            arr[1].equals("map") ||
//                            arr[1].equals("muteMember") ||
//                            arr[1].equals("clearMember")
//                    ) {
//                        System.out.println("[필터] : 잘못된 접근입니다. 로그인 후 이용해주시기 바랍니다.");
//
//                        out.println("<script>");
//
//                        out.println("alert('로그인 후 이용해주시기 바랍니다.');");
//
//                        out.println("location.href='/mind';");
//
//                        out.println("</script>");
//
//                        out.close();
//                        resp.sendRedirect(req.getContextPath() + "/");
//
//                    }else {
//                        chain.doFilter(request, response);
//                    }
//
//                }
//                // 비회원 + /chat/* 인 경우
//                else if(arr[0].equals("chat")) {
//
//                    System.out.println("[필터] : 잘못된 접근입니다. 로그인페이지로 이동합니다.");
//                    resp.sendRedirect(req.getContextPath() + "/");
//
//                }
//                // 비회원 + 나머지 페이지
//                else {
//                    chain.doFilter(request, response);
//                }
//
//
//
//                // ---------------- 로그인 ----------------
//            }
//
//        }else {
//            chain.doFilter(request, response);
//        }
//
//
//    }
//
//    public void destroy() {
//    }
//
//}
