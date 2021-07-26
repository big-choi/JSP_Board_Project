<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="comm.CommDAO"%>
<%@ page import="comm.Comm"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELETE</title>
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
	}
	int commID = 0;

	if (request.getParameter("commID") != null) {
		commID = Integer.parseInt(request.getParameter("commID"));
	}
	if (commID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'comm.jsp'");
		script.println("</script>");
	}
	Comm comm = new CommDAO().getComm(commID);
	if (!userID.equals(comm.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'comm.jsp'");
		script.println("</script>");
	} else {
		CommDAO commDAO = new CommDAO();
		int result = commDAO.delete(commID);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'comm.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>