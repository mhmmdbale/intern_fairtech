<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 09/03/2023
  Time: 10:56
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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
                            <a href="/product/formAdd" type="button" class="btn btn-primary btn-lg btn-block" style="color: white">PRODUK</a>
                            <a href="/product/color" type="button" class="btn btn-secondary btn-lg btn-block">WARNA</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Daftar Product</h5>
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
                                <g:each in="${products}" var="product">
                                    <tr>
                                        <td>${product.code}</td>
                                        <td>${product.name}</td>
                                        <td>${product.type}</td>
                                        <td>${product.sleeve}</td>
                                        <td><g:formatNumber number="${product.price/1000}" format="#,##0.000"/></td>
                                        <td style="vertical-align: middle;text-align: center;">
                                            <a href="/product/detailColor/${product.id}" type="button" class="btn mb-1 btn-outline-info btn-md"><i class="material-icons-outlined">palette</i>
                                            </a>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center;">
                                            <button data-toggle="modal" data-target="#imageModalCenter${product.id}" type="button" class="btn mb-1 btn-outline-secondary btn-md"><i class="material-icons-outlined">image</i>
                                            </button>
                                        </td>
                                        <td style="vertical-align: middle;text-align: center;">
                                            <a href="/product/editProduct/${product.id}" type="button" class="btn mb-1 btn-outline-primary btn-md"><i class="fa fa-edit"></i>
                                            </a>
                                            <button data-toggle="modal" data-target="#deleteModal${product.id}" type="button" class="btn mb-1 btn-outline-danger btn-md"><i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <!-- Modal Image-->
                                    <div class="modal fade" id="imageModalCenter${product.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle">${product.code} - ${product.name}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <i class="material-icons">close</i>
                                                    </button>
                                                </div>
                                                <div class="modal-body" style="display: flex; justify-content: center;">
                                                    <g:if test="${product.image}">
                                                        <asset:image src="products/${product.image}" width="250" height="300"></asset:image>
                                                    </g:if>
                                                    <g:else>
                                                        Tidak Ada Gambar.
                                                    </g:else>

                                                </div>
                                                <div class="modal-footer" style="display: flex; justify-content: center;">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal Delete-->
                                    <div class="modal fade" id="deleteModal${product.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Hapus Produk</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <i class="material-icons">close</i>
                                                    </button>
                                                </div>
                                                <form action="${createLink(uri: '/product/deleteProduct/'+ product.id)}" method="post">
                                                    <div class="modal-body">
                                                        <b>APA ANDA YAKIN UNTUK MENGHAPUS DATA INI ???</b>
                                                        <input type="hidden" class="form-control" name="id">
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                            <button type="submit" class="btn btn-danger">Hapus</button>
                                                        </div>
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
</g:applyLayout>
</body>
</html>