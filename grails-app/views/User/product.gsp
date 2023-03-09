<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 09/03/2023
  Time: 10:56
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="g" uri="http://www.grails.org/tags" %>
<html>
<head>
    <title>Product</title>
</head>

<body>
<g:applyLayout name="admin">
    <div class="page-content">
        <div class="page-info">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Pesanan</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Daftar Produk</li>
                </ol>
            </nav>
        </div>
        <div class="main-wrapper">
            <div class="row">
                <div class="col-xl">
                    <div class="card">
                        <div class="card-body">
                            <p>Pilih tombol dibawah untuk menambah data produk atau warna</code>.</p>
                            <button type="button" class="btn btn-primary btn-lg btn-block">PRODUK</button>
                            <button type="button" class="btn btn-secondary btn-lg btn-block">WARNA</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Daftar Product</h5>
                            <table id="zero-conf" class="display" style="width:100%">
                                <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Nama</th>
                                    <th>Tipe</th>
                                    <th>Lengan</th>
                                    <th>Harga</th>
                                    <th>Warna</th>
                                    <th>Gambar</th>
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
</html>