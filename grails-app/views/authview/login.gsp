<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 07/03/2023
  Time: 14:06
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Admin Dashboard Template">
    <meta name="keywords" content="admin,dashboard">
    <meta name="author" content="stacks">
    <!-- The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Login User</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <asset:stylesheet src="template/plugins/bootstrap/css/bootstrap.min.css" />
    <asset:stylesheet src="template/plugins/font-awesome/css/all.min.css" />

    <!-- Theme Styles -->
    <asset:stylesheet src="template/css/connect.min.css" />
    <asset:stylesheet src="template/css/admin3.css" />
    <asset:stylesheet src="template/css/dark_theme.css" />
    <asset:stylesheet src="template/css/custom.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body class="auth-page sign-in">

<div class='loader'>
    <div class='spinner-grow text-primary' role='status'>
        <span class='sr-only'>Loading...</span>
    </div>
</div>
<div class="connect-container align-content-stretch d-flex flex-wrap">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5">
                <div class="auth-form">
                    <div class="row">
                        <div class="col">
                            <div class="logo-box"><a href="#" class="logo-text" style="color: #2877ed">Polymorphic</a></div>
                            <form action="${createLink(uri: '/authenticate/')}" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="user_username" name="username" placeholder="Masukkan Username">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="user_password" name="password" placeholder="Masukkan Password">
                                </div>
                                <button type="submit" style="background-color: #2877ed; color: white" class="btn btn-block btn-submit">Masuk</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 d-none d-lg-block d-xl-block">
                <div class="auth-image"></div>
            </div>
        </div>
    </div>
</div>

<!-- Javascripts -->
<asset:javascript src="template/plugins/jquery/jquery-3.4.1.min.js" />
<asset:javascript src="template/plugins/bootstrap/popper.min.js" />
<asset:javascript src="template/plugins/bootstrap/js/bootstrap.min.js" />
<asset:javascript src="template/plugins/jquery-slimscroll/jquery.slimscroll.min.js" />
<asset:javascript src="template/js/connect.min.js" />
</body>
</html>