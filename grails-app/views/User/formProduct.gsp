<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 09/03/2023
  Time: 15:23
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="g" uri="http://www.grails.org/tags" %>
<html>
<head>
    <title>Tambah Produk</title>
</head>

<body>
<g:applyLayout name="admin">
    <div class="page-content">
        <div class="page-info">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Produk</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Tambah Produk</li>
                </ol>
            </nav>
        </div>
        <div class="main-wrapper">
            <div class="row">
                <div class="col-xl">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Tambah Data Produk</h5>
                            <g:if test="${flash.message}">
                                <div class="alert alert-danger">
                                    <li>${flash.message}</li>
                                </div>
                            </g:if>
                            <form action="${createLink(uri: '/product/saveProduct')}" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputCode1">Kode: </label>
                                    <input required type="text" class="form-control" name="code" id="exampleInputCode1">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName1">Nama: </label>
                                    <input required type="text" class="form-control" name="name" id="exampleInputName1">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlType1">Tipe: </label>
                                    <select class="form-control custom-select" name="type" id="exampleFormControlType1">
                                        <option value="KAOS">Kaos</option>
                                        <option value="JAKET">Jaket</option>
                                        <option value="SWEETER">Sweeter</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSleeve1">Lengan: </label>
                                    <select class="form-control custom-select" name="sleeve" id="exampleFormControlSleeve1">
                                        <option value="PENDEK">Pendek</option>
                                        <option value="PANJANG">Panjang</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPrice1">Harga: </label>
                                    <input required type="text" class="form-control" name="price" id="exampleInputPrice1" onkeypress="return isNumberKey(event)">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputImage1">Gambar: </label>
                                    <input type="file" class="form-control" name="file" id="exampleInputImage1">
                                </div>
                                <button type="submit" class="btn btn-primary">Tambah</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>
</g:applyLayout>
</body>
</html>