<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 14/03/2023
  Time: 11:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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
                            <div style="text-align: left;">
                                <table style="width: 30%;">
                                    <tr>
                                        <td style="width:60%; line-height: 2;">CODE</td>
                                        <td style="width:40%; line-height: 2;">: ${product.code}</td>
                                    </tr>
                                    <tr>
                                        <td style="line-height: 2;">NAMA</td>
                                        <td style="line-height: 2;">: ${product.name}</td>
                                    </tr>
                                    <tr>
                                        <td style="line-height: 2;">TIPE</td>
                                        <td style="line-height: 2;">: ${product.type}</td>
                                    </tr>
                                    <tr>
                                        <td style="line-height: 2;">LENGAN</td>
                                        <td style="line-height: 2;">: ${product.sleeve}</td>
                                    </tr>
                                    <tr>
                                        <td style="line-height: 2;">HARGA</td>
                                        <td style="line-height: 2;">: <g:formatNumber number="${product.price/1000}" format="#,##0.000"/></td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <p>Daftar Warna yang Tersedia.</p>
                            <div>
                                <form action="${createLink(uri: '/product/saveProductColor/'+ product.id)}" method="post">
                                    <select class="js-states form-control" tabindex="-1" style="display: none; width: 30%;" name="colors" multiple="multiple">
                                        <g:each in="${colors}" var="color">
                                            <option value="${color.id}">${color.name}</option>
                                        </g:each>
                                    </select>
                                    <button type="submit" class="btn btn-warning">Tambah</button>
                                </form>
                            </div>
                            <br>
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
                            <br>
                            <table id="zero-conf" class="display" style="width:100%">
                                <thead>
                                <tr>
                                    <th style="vertical-align: middle;text-align: center;">Kode</th>
                                    <th style="vertical-align: middle;text-align: center;">Warna</th>
                                    <th style="vertical-align: middle;text-align: center;">Status</th>
                                    <th style="vertical-align: middle;text-align: center;">Aksi</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${productColors}" var="productColor">
                                    <tr>
                                        <td style="vertical-align: middle;text-align: center;">${productColor.color.code}</td>
                                        <td style="vertical-align: middle;text-align: center;">${productColor.color.name}</td>
                                        <td style="vertical-align: middle;text-align: center;">${productColor.status}</td>
                                        <td style="vertical-align: middle;text-align: center;">
                                            <button type="button"
                                                        data-id="${productColor.id}"
                                                        data-code="${productColor.color.code}"
                                                        data-name="${productColor.color.name}"
                                                        data-status="${productColor.status}"
                                                    class="editData btn mb-1 btn-outline-primary btn-md"><i class="fa fa-edit"></i>
                                            </button>
                                            <button type="button"
                                                        data-id="${productColor.id}"
                                                        data-code="${productColor.color.code}"
                                                        data-name="${productColor.color.name}"
                                                    class="deleteData btn mb-1 btn-outline-danger btn-md"><i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Edit-->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Ubah Status Warna</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="material-icons">close</i>
                        </button>
                    </div>
                    <div class="modal-body" style="text-align:center;">
                        <table style="margin:auto;">
                            <tr>
                                <td style="width:60%; line-height: 2;">CODE</td>
                                <td style="width:40%; line-height: 2;" id="edit_code"></td>
                            </tr>
                            <tr>
                                <td style="line-height: 2;">NAMA</td>
                                <td style="line-height: 2;" id="edit_name"></td>
                            </tr>
                        </table>
                        <div style="margin: 20px auto 0; width: 60%;">
                            <select class="form-control custom-select" name="edit_status" id="edit_status" style="width: 100%;">
                                <option value="READY">Ready</option>
                                <option value="PREORDER">Pre-Order</option>
                                <option value="EMPTY">Empty</option>
                            </select>
                        </div>
                        <input type="hidden" class="form-control" id="edit_id" name="edit_id">
                        <div class="modal-footer" style="display: flex; justify-content: center;">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                            <button type="submit" class="updateData btn btn-info">Ubah Status Warna</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Delete-->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Hapus Warna Produk</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="material-icons">close</i>
                        </button>
                    </div>
                    <form>
                        <div class="modal-body">
                            <b>APA ANDA YAKIN UNTUK MENGHAPUS DATA INI ???</b><br><br>
                            <div>
                                <table>
                                    <tr>
                                        <td style="width:60%; line-height: 2;">KODE</td>
                                        <td style="width:40%; line-height: 2;" id="delete_code"></td>
                                    </tr>
                                    <tr>
                                        <td style="line-height: 2;">NAMA</td>
                                        <td style="line-height: 2;" id="delete_name"></td>
                                    </tr>
                                </table>
                            </div>
                            <input type="hidden" class="form-control" id="delete_id" name="delete_id">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                <button type="submit" class="destroyData btn btn-danger">Hapus</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</g:applyLayout>
</body>
<script>
    $(document).ready(function() {
        $('.editData').click(function(e){
            e.preventDefault();
            let edit_id = $(this).data('id')
            let edit_code = $(this).data('code')
            let edit_name = $(this).data('name')
            let edit_status = $(this).data('status')

            console.log(edit_status)
            $('#editModal').modal('show');
            document.getElementById("edit_id").value = edit_id;
            document.getElementById("edit_code").textContent = ": " + edit_code;
            document.getElementById("edit_name").textContent = ": " + edit_name;
            $('#edit_status').val(edit_status).change();
        })

        $('.updateData').click(function(e){
            e.preventDefault();
            let edit_id = $('#edit_id').val();
            let edit_status = $('#edit_status').val();

            $.ajax({
                url: "${createLink(uri: '/product/updateProductColor/')}" + edit_id,
                data:{
                    id:edit_id,
                    status:edit_status,
                },
                method:'PUT',
                dataType: 'json',
                success: function() {
                    location.reload();
                }
            });
        })

        $('.deleteData').click(function(e){
            e.preventDefault();
            let delete_id = $(this).data('id')
            let delete_code = $(this).data('code')
            let delete_name = $(this).data('name')

            $('#deleteModal').modal('show');
            document.getElementById("delete_id").value = delete_id;
            document.getElementById("delete_code").textContent = ": " + delete_code;
            document.getElementById("delete_name").textContent = ": " + delete_name;
        })

        $('.destroyData').click(function(e){
            e.preventDefault();
            let delete_id = $('#delete_id').val();

            $.ajax({
                url: "${createLink(uri: '/product/deleteProductColor/')}" + delete_id,
                data:{
                    id:delete_id,
                },
                method:'POST',
                dataType: 'json',
                success: function() {
                    location.reload();
                }
            });
        })
    });
</script>
