<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 14/03/2023
  Time: 11:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="g" uri="http://www.grails.org/tags" %>
<html>
<head>
    <title>Dashboard</title>
</head>

<body>
<g:applyLayout name="admin">
    <div class="page-content">
        <div class="page-info">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Produk</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Detail Warna</li>
                </ol>
            </nav>
        </div>
        <div class="main-wrapper">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Detail Warna</h5>
                            <g:if test="${flash.message}">
                                <div class="alert alert-success">
                                    <li>${flash.message}</li>
                                </div>
                            </g:if>
                            <g:if test="${flash.error}">
                                <div class="alert alert-danger">
                                    <li>${flash.error}</li>
                                </div>
                            </g:if>
                            <table id="zero-conf" class="display" style="width:100%">
                                <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Warna</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:applyLayout>
</body>
