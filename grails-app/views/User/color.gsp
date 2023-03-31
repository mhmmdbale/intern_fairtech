<%--
  Created by IntelliJ IDEA.
  User: Muhammad Ikbal
  Date: 09/03/2023
  Time: 11:35
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Daftar Warna</title>
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
                                            <button type="button" data-id="${color.id}" data-code="${color.code}" data-name="${color.name}" class="editColor btn mb-1 btn-outline-primary btn-md"><i class="fa fa-edit"></i>
                                            </button>
                                            <button data-toggle="modal" data-target="#deleteModal${color.id}" type="button" class="btn mb-1 btn-outline-danger btn-md"><i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <!-- Modal Delete-->
                                    <div class="modal fade" id="deleteModal${color.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Hapus Warna</h5>
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
                <form>
                <div class="modal-body">
                    <div id="error-message" class="alert alert-danger" style="display: none">
                        <ul></ul>
                    </div>
                    <div class="form-group">
                        <label for="code">Kode</label>
                        <input required type="text" class="form-control" id="code" name="code" placeholder="Masukkan Kode">
                    </div>
                    <div class="form-group">
                        <label for="name">Warna</label>
                        <input required type="text" class="form-control" id="name" name="name" placeholder="Masukkan Warna">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" data-url="${createLink(uri: '/product/saveColor')}" class="btn btn-primary saveColor">Simpan</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Modal Edit-->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Ubah Data Warna</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons">close</i>
                    </button>
                </div>
                    <form>
                    <div class="modal-body">
                        <div id="edit_error-message" class="alert alert-danger" style="display: none">
                            <ul></ul>
                        </div>
                        <div class="form-group">
                            <label for="edit_code">Kode</label>
                            <input required value="" type="text" class="form-control" id="edit_code" name="code" placeholder="Masukkan Kode">
                        </div>
                        <div class="form-group">
                            <label for="edit_name">Warna</label>
                            <input required value="" type="text" class="form-control" id="edit_name" name="name" placeholder="Masukkan Warna">
                        </div>
                        <input type="hidden" class="form-control" id="edit_id" name="edit_id">
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                            <button type="submit" class="updateColor btn btn-danger">Ubah Data</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</g:applyLayout>
</body>
<script>
    $(document).ready(function() {
        $(function() {
            $("input[name='name']").on('input', function(e) {
                // Convert the value to uppercase
                this.value = this.value.toUpperCase();
            });
        });
        $('.saveColor').click(function(e){
            e.preventDefault();
            let url = $(this).data('url');
            let code = $('#code').val();
            let name = $('#name').val();

            $.ajax({
                url:url,
                data:{
                    code:code,
                    name:name,
                },
                method:'POST',
                dataType: 'json',
                success: function() {
                    location.reload();
                },
                error: function(data) {
                    let errors = data.responseJSON.errors;
                    if (errors) {
                        let $errorDiv = $('#error-message');
                        let $errorList = $errorDiv.find('ul');
                        $errorList.empty();
                        $.each(errors, function(key, value) {
                            $errorList.append($('<li>').text(value));
                        });
                        $errorDiv.show();
                    }
                }
            });
        })
        $('.editColor').click(function(e){
            e.preventDefault();
            let $errorDiv = $('#edit_error-message');
            $errorDiv.hide();

            let edit_id = $(this).data('id')
            let edit_code = $(this).data('code')
            let edit_name = $(this).data('name')

            $('#editModal').modal('show');
            document.getElementById("edit_id").value = edit_id;
            document.getElementById("edit_code").value = edit_code;
            document.getElementById("edit_name").value = edit_name;
        })
        $('.updateColor').click(function(e){
            e.preventDefault();
            let update_id = $('#edit_id').val();
            let update_code = $('#edit_code').val();
            let update_name = $('#edit_name').val();

            console.log(update_id)
            console.log(update_code)
            console.log(update_name)

            $.ajax({
                url: "${createLink(uri: '/product/updateColor/')}" + update_id,
                data:{
                    code:update_code,
                    name:update_name,
                },
                method:'PUT',
                dataType: 'json',
                success: function() {
                    location.reload();
                },
                error: function(data) {
                    let errors = data.responseJSON.errors;
                    if (errors) {
                        let $errorDiv = $('#edit_error-message');
                        let $errorList = $errorDiv.find('ul');
                        $errorList.empty();
                        $.each(errors, function(key, value) {
                            $errorList.append($('<li>').text(value));
                        });
                        $errorDiv.show();
                    }
                }
            });
        })
    });
</script>
</html>