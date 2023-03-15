<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 10/03/2023
  Time: 16:27
--%>

<%@ page import="intern.Product" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ubah Data Produk</title>
</head>

<body>
<g:applyLayout name="admin">
    <div class="page-content">
        <div class="page-info">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Produk</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Ubah Data Produk</li>
                </ol>
            </nav>
        </div>
        <div class="main-wrapper">
            <div class="row">
                <div class="col-xl">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Ubah Data Produk</h5>
                            <g:if test="${productError?.hasErrors()}">
                                <div class="alert alert-danger">
                                    <g:eachError bean="${productError}" var="error">
                                        <li><g:message error="${error}"/></li>
                                    </g:eachError>
                                </div>
                            </g:if>
                            <form action="${createLink(uri: '/product/updateProduct/'+ product.id)}" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputCode1">Kode: </label>
                                    <input required value="${product.code}" type="text" class="form-control" name="code" id="exampleInputCode1">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName1">Nama: </label>
                                    <input required value="${product.name}" type="text" class="form-control" name="name" id="exampleInputName1">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlType1">Tipe: </label>
                                    <select class="form-control custom-select" name="type" id="exampleFormControlType1">
                                        <option value="KAOS" ${product.type == Product.ProductType.KAOS ? 'selected' : ''}>Kaos</option>
                                        <option value="JAKET" ${product.type == Product.ProductType.JAKET ? 'selected' : ''}>Jaket</option>
                                        <option value="SWEETER" ${product.type == Product.ProductType.SWEETER ? 'selected' : ''}>Sweeter</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSleeve1">Lengan: </label>
                                    <select class="form-control custom-select" name="sleeve" id="exampleFormControlSleeve1">
                                        <option value="PENDEK" ${product.sleeve == Product.ProductSleeve.PENDEK ? 'selected' : ''}>Pendek</option>
                                        <option value="PANJANG" ${product.sleeve == Product.ProductSleeve.PANJANG ? 'selected' : ''}>Panjang</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPrice1">Harga: </label>
                                    <input required value="${product.price}" type="text" class="form-control" name="price" id="exampleInputPrice1" onkeypress="return isNumberKey(event)">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputImage1" class="form-label">File</label>
                                    <g:if test="${product.image}">
                                        <br><asset:image src="products/${product.image}" width="200" height="100"></asset:image>
                                    </g:if>
                                    <input type="hidden" value="${product.image}" id="checkFile">
                                    <div class="custom-control custom-switch" id="switchFile">
                                        <input type="checkbox" onchange="del()" class="custom-control-input" name="del_file" id="switchDelete">
                                        <label class="custom-control-label" for="switchDelete">Hapus Foto ?</label>
                                    </div>
                                    <input type="file" class="form-control" name="file" id="exampleInputImage1">
                                </div>
                                <button type="submit" class="btn btn-primary">Ubah</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function initialize() {
            var i = document.getElementById("switchFile");
            var j = document.getElementById("exampleInputImage1");
            var k = document.getElementById("checkFile");
            if(k.value === ''){
                i.style.display = "none";
            }else {
                j.style.display = "none";
            }
        }
        initialize();

        function del(){
            event.preventDefault();
            var d = document.getElementById("exampleInputImage1");
            if(document.getElementById("switchDelete").checked){
                d.style.display = "block";
            }else{
                d.style.display = "none";
                d.value = '';
            }
            console.log(document.getElementById("switchDelete").value)
            console.log(document.getElementById("checkFile").value)
        }
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