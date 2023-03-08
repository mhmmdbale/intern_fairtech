<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 08/03/2023
  Time: 14:50
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
    <title><g:layoutTitle default="Polymorphic"/></title>
    <g:layoutHead/>

    <g:render template="/includes/style" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
<div class='loader'>
    <div class='spinner-grow text-primary' role='status'>
        <span class='sr-only'>Loading...</span>
    </div>
</div>
<div class="connect-container align-content-stretch d-flex flex-wrap">
    <div class="page-sidebar">
        <g:render template="/includes/sidebar" />
    <div class="page-container">
        <g:render template="/includes/navbar" />
        <g:layoutBody/>
        <div class="page-footer">
            <div class="row">
                <div class="col-md-12">
                    <span class="footer-text">2019 © stacks</span>
                </div>
            </div>
        </div>
    </div>
</div>
    <g:render template="/includes/script" />
</body>
</html>