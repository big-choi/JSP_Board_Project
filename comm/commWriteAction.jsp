<!-- 커뮤니티 게시글 작성 Action -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="comm.CommDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="comm" class="comm.Comm" scope="page" />
<jsp:setProperty name="comm" property="commTitle" />
<jsp:setProperty name="comm" property="commContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비회원은 작성할수 없습니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {
		if (comm.getCommTitle() == null || comm.getCommContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			CommDAO commDAO = new CommDAO();
			int result = commDAO.write(comm.getCommTitle(), userID, comm.getCommContent());
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'comm.jsp'");
		script.println("</script>");
			}
		}
	}
	%>
</body>
</html>