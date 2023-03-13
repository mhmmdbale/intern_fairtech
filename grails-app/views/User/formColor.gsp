<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 09/03/2023
  Time: 11:35
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="g" uri="http://www.grails.org/tags" %>
<html>
<head>
    <title>Tambah Warna</title>
</head>

<body>
<g:applyLayout name="admin">
    <div class="page-content">
        <div class="page-info">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Product</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Tambah Warna</li>
                </ol>
            </nav>
        </div>
        <div class="main-wrapper">
            <div class="row">
                <div class="col-xl">
                    <div class="card">
                        <div class="card-body">
                            <button data-toggle="modal" data-target="#addModal" type="button" class="btn btn-primary btn-lg btn-block" style="color: white">TAMBAH</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Daftar Warna</h5>
                            <g:if test="${flash.message}">
                                <div class="alert alert-success">
                                    <li>${flash.message}</li>
                                </div>
                            </g:if>
                            <g:if test="${colorError?.hasErrors()}">
                                <div class="alert alert-danger">
                                    <ul>
                                        <g:eachError bean="${colorError}" var="error">
                                            <li><g:message error="${error}"/></li>
                                        </g:eachError>
                                    </ul>
                                </div>
                            </g:if>
                            <table id="zero-conf" class="display" style="width:100%">
                                <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Nama</th>
                                    <th style="text-align: center;">Aksi</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${colors}" var="color">
                                    <tr>
                                        <td>${color.code}</td>
                                        <td>${color.name}</td>
                                        <td style="vertical-align: middle;text-align: center;">
                                            <button data-toggle="modal" data-target="#editModal${color.id}" type="button" class="btn mb-1 btn-outline-primary btn-md"><i class="fa fa-edit"></i>
                                            </button>
                                            <button data-toggle="modal" data-target="#deleteModal${color.id}" type="button" class="btn mb-1 btn-outline-danger btn-md"><i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <!-- Modal Edit-->
                                    <div class="modal fade" id="editModal${color.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Ubah Data Warna</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <i class="material-icons">close</i>
                                                    </button>
                                                </div>
                                                <form action="${createLink(uri: '/product/editColor/'+ color.id)}" method="post">
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label for="exampleInputCode1">Kode</label>
                                                            <input required value="${color.code}" type="text" class="form-control" id="exampleInputCode1" name="code" placeholder="Masukkan Kode">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleInputColor1">Warna</label>
                                                            <input required value="${color.name}" type="text" class="form-control" id="exampleInputColor1" name="name" placeholder="Masukkan Warna">
                                                        </div>
                                                        <input type="hidden" class="form-control" name="id">
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                            <button type="submit" class="btn btn-danger">Ubah Data</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal Delete-->
                                    <div class="modal fade" id="deleteModal${color.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Hapus Warna</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <i class="material-icons">close</i>
                                                    </button>
                                                </div>
                                                <form action="${createLink(uri: '/product/deleteColor/'+ color.id)}" method="post">
                                                    <div class="modal-body">
                                                        <b>APA ANDA YAKIN UNTUK MENGHAPUS DATA INI ???</b>
                                                        <input type="hidden" class="form-control" name="id">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                        <button type="submit" class="btn btn-danger">Hapus</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tambah Warna</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons">close</i>
                    </button>
                </div>
                <form action="${createLink(uri: '/product/addColor')}" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputCode1">Kode</label>
                        <input required type="text" class="form-control" id="exampleInputCode1" name="code" placeholder="Masukkan Kode">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputColor1">Warna</label>
                        <input required type="text" class="form-control" id="exampleInputColor1" name="name" placeholder="Masukkan Warna">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</g:applyLayout>
</body>
</html>