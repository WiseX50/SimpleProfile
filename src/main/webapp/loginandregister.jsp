<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(‘https://fonts.googleapis.com/css?family=Poppins’);

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	min-height: 100vh;
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
}

h3 {
	text-align: center;
	color: green;
	font-size: 20px;
}

span {
	position: absolute;
	top: 0;
	font-weight: 700;
	font-size: 20px;
	color: red;
}

.main {
	width: 350px;
	height: 500px;
	background-color: red;
	overflow: hidden;
	background: url("1.jpg") no-repeat center/cover;
	border-radius: 10px;
	box-shadow: 5px 20px 50px #000;
}

#chk {
	display: none;
}

.signup {
	position: relative;
	width: 100%;
	height: 100%;
}

label {
	color: #fff;
	font-size: 2.3em;
	justify-content: center;
	display: flex;
	margin: 60px;
	font-weight: bold;
	cursor: pointer;
	transition: .5s ease-in-out;
}

input {
	width: 60%;
	height: 35px;
	background: #e0dede;
	display: flex;
	justify-content: center;
	margin: 5px auto;
	padding: 10px;
	border: none;
	outline: none;
	border-radius: 7px;
}

input:focus {
	background-color: #302b63;
	color: white;
}

button {
	width: 40%;
	height: 40px;
	margin: 10px auto;
	justify-content: center;
	display: block;
	outline-color: #fff;
	background: #573b8a;
	font-size: 1em;
	font-weight: bold;
	margin-top: 30px;
	outline: none;
	border: none;
	border-radius: 5px;
	transition: .2s ease-in;
	cursor: pointer;
}

button:hover {
	background: #0f0c29;
	color: #fff;
	box-shadow: 0 0 10px 1px #24243e;
}

.login {
	height: 460px;
	background: #eee;
	border-radius: 60%/10%;
	transform: translateY(-180px);
	transition: .8s ease-in-out;
}

.login label {
	color: #573b8a;
	transform: scale(.6);
}

.login input {
	box-shadow: 0 0 10px 1px #24243e;
}

#chk:checked ~ .login {
	transform: translateY(-500px);
}

#chk:checked ~ .login label {
	transform: scale(1);
}

#chk:checked ~ .signup label {
	transform: scale(.6);
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("registered") != null) {
		String s = (String) session.getAttribute("registered");
		if (s.equals("registered"))
	%><h3>Registered Successfully Please Login</h3>
	<%
	}
	%>
	<%
	if (session.getAttribute("lgnFailed") != null || session.getAttribute("userNotFound") != null) {
		String s = (String) session.getAttribute("lgnFailed");
		if (s.equals("loginFailed"))
	%>
	<h3 style="color: red">Invalid Details...</h3>
	<%
	}
	%>
	<div class="main">
		<input type="checkbox" id="chk" aria-hidden="true">
		<div class="signup">
			<form action="register" method="post">
				<label for="chk" aria-hidden="true">Sign Up</label> <input
					type="text" name="name" placeholder="User Name"> <input
					type="number" name="age" placeholder="Age"> <input
					type="number" name="number" placeholder="Phone Number"> <input
					type="email" name="email" placeholder="Email"> <input
					type="password" name="password" placeholder="Password">
				<button>Sign Up</button>
			</form>
		</div>
		<div class="login">
			<form action="login" method="post">
				<label for="chk" aria-hidden="true">Sign In</label> <input
					type="email" name="email" placeholder="User Email" required>
				<input type="password" name="password" placeholder="User Password"
					required>
				<button>Sign In</button>
			</form>
		</div>
	</div>
</body>
</html>