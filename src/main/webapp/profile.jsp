<%@page import="com.org.Entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<style type="text/css">
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}
/****************************************************************
    NavBar Css-----
*****************************************************************/
nav {
	position: sticky;
	background-color: #101820;
	height: 75px;
	width: 100%;
}

nav .logo {
	color: #FEE715;
	font-size: 25px;
	line-height: 80px;
	padding: 0 100px;
	font-weight: bold;
	text-decoration: none;
}

nav ul {
	float: right;
	margin-right: 20px;
}

nav ul li {
	display: inline-block;
	line-height: 80px;
	margin: 0 5px;
}

nav ul li .neonBtn {
	color: white;
	font-size: 17px;
	padding: 7px 13px;
	border-radius: 3px;
	font-weight: 400;
	transition: .2s;
}

.neonBtn {
	text-decoration: none;
}

.neonBtn:hover {
	color: #fff;
	border-bottom: 3px solid #FEE715;
}

#check {
	display: none;
}

@media ( max-width : 1050px) {
	label.logo {
		padding-left: 30px;
	}
	nav ul li a {
		font-size: 16px;
	}
}

/*body {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px;
	background-color: #fff;
}*/

.container {
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%, -50%);
	max-width: 400px;
	width: 100%;
	background-color: #101820;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.container header {
	font-size: 1.5rem;
	color: #fff;
	font-weight: 500;
	text-align: center;
}

.container .form {
	margin-top: 30px;
}

.form .input-box {
	width: 100%;
	margin-top: 20px;
}

.input-box label {
	color: #fff;
}

.form :where(.input-box input, .select-box) {
	position: relative;
	height: 50px;
	width: 100%;
	outline: none;
	font-size: 1rem;
	color: black;
	margin-top: 8px;
	border: 1px solid #ddd;
	border-radius: 6px;
	padding: 0 15px;
	background-color: #707070;
}

input::placeholder {
	color: #fff;
}

.input-box input:focus {
	box-shadow: 5px 5px 12px 3px #030106;
}

.form .column {
	display: flex;
	column-gap: 15px;
}

.address :where(input, .select-box) {
	margin-top: 15px;
}

.select-box select {
	height: 100%;
	width: 100%;
	outline: none;
	border: none;
	color: #707070;
	font-size: 1rem;
}

.select-box select {
	background-color: #707070;
	color: #fff;
}

.form button {
	height: 55px;
	width: 100%;
	color: #101820;
	font-size: 1.1rem;
	font-weight: 400;
	margin-top: 30px;
	border: none;
	cursor: pointer;
	transition: all 0.2s ease;
	background: #FEE715;
	border-radius: 9px;
	font-weight: bold;
}

.form button:hover {
	color: #fff;
	background-color: #4d0000
}
/*Responsive*/
@media screen and (max-width: 500px) {
	.form .column {
		flex-wrap: wrap;
	}
	.form :where(.gender-option, .gender) {
		row-gap: 15px;
	}
}
</style>
</head>
<body>

	<%
	if (session.getAttribute("user") != null) {
		User user = (User) session.getAttribute("user");
	%>
	<!-- NavBar Html -->
	<nav>
		<label class="logo">SimProfile</label>
		<ul>
			<li><a href="logout" class="neonBtn">Sign Out</a></li>
		</ul>
	</nav>
	<section class="container">
		<header>Profile</header>
		<form action="update" class="form" method="post">
			<div class="input-box">
				<label>Name</label> <input type="text" name="name"
					placeholder="Enter Your Name" value=<%=user.getName()%> required />
			</div>
			<div class="input-box">
				<label>Age</label> <input type="number" name="age"
					placeholder="Enter Your Age" value=<%=user.getAge()%> required />
			</div>
			<div class="column">
				<div class="input-box">
					<label>Email Address</label> <input type="email" name="email"
						placeholder="Enter email address" value=<%=user.getEmail()%>
						required />
				</div>
				<div class="input-box">
					<label>Phone Number</label> <input type="number" name="mobile"
						placeholder="Enter Your Number" value=<%=user.getNumber()%>
						required />
				</div>
			</div>
			<button>Update</button>
		</form>
	</section>
	<%
	} else {
	session.setAttribute("userNotFound", "userNotFound");
	response.sendRedirect("loginandregister.jsp");
	}
	%>
</body>
</html>