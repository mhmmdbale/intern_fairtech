<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 09/03/2023
  Time: 15:23
--%>

<%@ page import="intern.Product" contentType="text/html;charset=UTF-8" %>
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
                            <g:if test="${productError?.hasErrors()}">
                                <div class="alert alert-danger">
                                    <g:eachError bean="${productError}" var="error">
                                        <li><g:message error="${error}"/></li>
                                    </g:eachError>
                                </div>
                            </g:if>
                            <form action="${createLink(uri: '/product/saveProduct')}" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputCode1">Kode: </label>
                                    <input required type="text" class="form-control" name="code" id="exampleInputCode1" value="${productError?.code}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName1">Nama: </label>
                                    <input required type="text" class="form-control" name="name" id="exampleInputName1" value="${productError?.name}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlType1">Tipe: </label>
                                    <select class="form-control custom-select" name="type" id="exampleFormControlType1">
                                        <option value="KAOS" ${productError?.type == Product.ProductType.KAOS ? 'selected' : ''}>Kaos</option>
                                        <option value="JAKET" ${productError?.type == Product.ProductType.JAKET ? 'selected' : ''}>Jaket</option>
                                        <option value="SWEETER" ${productError?.type == Product.ProductType.SWEETER ? 'selected' : ''}>Sweeter</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSleeve1">Lengan: </label>
                                    <select class="form-control custom-select" name="sleeve" id="exampleFormControlSleeve1">
                                        <option value="PENDEK" ${productError?.sleeve == Product.ProductSleeve.PENDEK ? 'selected' : ''}>Pendek</option>
                                        <option value="PANJANG" ${productError?.sleeve == Product.ProductSleeve.PANJANG ? 'selected' : ''}>Panjang</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPrice1">Harga: </label>
                                    <input required type="text" class="form-control" name="price" id="exampleInputPrice1" onkeypress="return isNumberKey(event)" value="${productError?.price}">
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
</g:applyLayout>
</body>
<script>
    function isNumberKey(evt) {
        let charCode = (evt.which) ? evt.which : evt.keyCode;
        return !(charCode > 31 && (charCode < 48 || charCode > 57));

    }
    $(document).ready(function() {
        $(function() {
            $("input[name='name']").on('input', function(e) {
                // Convert the value to uppercase
                this.value = this.value.toUpperCase();
            });
        });
    });
</script>
</html>
