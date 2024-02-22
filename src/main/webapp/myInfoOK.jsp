<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

myInfoOK.jsp 입니다.<br>

<%
//	form에 입력된 한글 데이터가 post 방식으로 전송될 때 까지는 현상을 방지한다.
//		=> 톰캣 10.1버전 부터는 post 방식으로 전송될 때 한글이 깨지지 않는다.
//	한글 깨짐을 방지하려면 최초의 request.getParameter() 메소드가 실행되기 전(맨처음)에 아래의
//	내용을 코딩하면 된다.
	request.setCharacterEncoding("UTF-8");

//	get 방식도 톰캣 6.0 버전까지는 한글이 깨졌었었다. => 톰캣 7.0 버전 부터 깨지지 않는다.
//	get 방식에서 한글이 깨지면 서버 환경 설정에서 한글이 깨지지 않도록 설정해야 한다. => server.xml
//	Servers 폴더의 server.xml 파일을 열고 Connector 태그에 URLEncoding="UTF-8" 속성을 추가한다.
//	서버에 추가하기 때문에 프로젝트를 생성할 때 마다 설정할 필요는 없고 이클립스를 다시 세팅할 때
//	해주면 된다.

//	request.getParameter() 메소드로 이전 페이지에서 submit 버튼이 클릭되면 넘어오는 데이터를 받는다.
//	이전 페이지에서 넘어오는 데이터는 무조건 문자열 형태로 넘어온다.
	String name = request.getParameter("name");
	out.println(name + "님 안녕하세요<br>");
	String id = request.getParameter("id");
	out.println(name + "님의 id는 " + id + " 입니다.<br>");
	String password = request.getParameter("password");
	out.println(name + "님의 비밀번호는 " + password + " 입니다.<br>");
	
	try {
		int age = Integer.parseInt(request.getParameter("age"));
		out.println(name + "님은 올해 " + age + "살 입니다.<br>");
		out.println(name + "님은 내년에 " + (age + 1) + "살 입니다.<br>");
	} catch (NumberFormatException e) {
		out.println("잘못된 나이가 입력되었습니다.<br>");
		out.println("<script>");
		out.println("alert('잘못된 나이가 입력되었습니다.')");
		out.println("</script>");
	}
	
	boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
	out.println(name + "님은 " + (gender ? "남자" : "여자") + " 입니다.<br>");
	
//	checkbok는 여러 항목을 선택할 수 있는데 아래와 같이 request.getParameter() 메소드를 
//	이용하면 맨 처음에 선택한 값 1개만 넘겨받는다.
//	데이터가 여러 개 넘어오는 경우 request.getParameter() 메소드를 사용하지 않는다.
//	String hobbies = request.getParameter("hobbies");
//	out.println(name + "님의 취미는 " + hobbies + " 입니다.<br>");

//	checkbox에서 넘어오는 데이터를 받을 때 넘어오는 데이터가 여러 개일 수 있기 때문에 
//	request.getParameterValues() 메소드로 받아서 배열에 저장해서 사용한다.
	String[] hobbies = request.getParameterValues("hobbies");
	out.println(name + "님의 취미는 " + hobbies + " 입니다.<br>");
	out.println(name + "님의 취미는 " + Arrays.toString(hobbies) + " 입니다.<br>");
	out.println(name + "님의 취미는 ");
	try {
		for (int i = 0; i<hobbies.length; i++) {
			out.println(hobbies[i] + " ");
		}
		out.println(" 입니다.<br>");
	} catch (NullPointerException e) {
		out.println("없습니다.<br>");
	}
	
	String trip = request.getParameter("trip");
	out.println(name + "님의 " + trip + "에 가고싶어합니다.<br>");

	String[] travel = request.getParameterValues("travel");
	out.println(name + "님은 ");
	try {
		for (int i = 0; i<travel.length; i++) {
			out.println(travel[i] + " ");
		}
		out.println("에 가고싶어합니다.<br>");
	} catch (NullPointerException e) {
		out.println("가고싶어 하는 곳이 없습니다.<br>");
	}
	
	String content = request.getParameter("content");
//	태그 사용 가능, 줄바꿈 불가능
	out.println(content + "<br>");
//	태그 사용 불가능, 줄바꿈 불가능
	out.println(content.replace("<", "&lt;").replace(">", "&gt;") + "<br>");
//	태그 사용 가능, 줄바꿈 가능
	out.println(content.replace("\r\n", "<br>") + "<br>");
//	태그 사용 불가능, 줄바꿈 가능
	out.println(content.replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>") + "<br>");
%>

</body>
</html>






















