package intern

import org.hibernate.Transaction
import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ProductColorController {

    def productService

    def index(long id) {
        Product product = productService.getProductById(id)
        List<Color> colors = productService.getAvaliableColor(product)
        List<ProductColor> productColors = productService.getProductColorbyProduct(product)
        render(view: "/user/detailColor", model: [product: product, colors: colors, productColors: productColors])
    }

    @Transactional
    def saveProductColor(long id){
        Product product = productService.getProductById(id)
        List<Long> selectedColorIds = params.list('colors')
        productService.saveProductColor(product, selectedColorIds)
        flash.message = "Data Berhasil di Tambahkan"
        redirect(action: 'index', id:id)
    }

    @Transactional
    def updateProductColor(long id){
        try {
            ProductColor productColor = productService.getProductColorById(id)
            productService.updateProductColor(params, productColor)
            flash.message = "Status Berhasil di Ubah"
            respond([:], status: 200)
        } catch (Exception e){
            flash.error = "Terjadi Kesalahan Saat Mengubah Status"
            respond([:], status: 400)
        }
    }

    @Transactional
    def deleteProductColor(long id){
        try {
            productService.deleteProductColor(id)
            flash.message = "Data Berhasil di Hapus"
            respond([:], status: 201)
        } catch (Exception e){
            flash.error = "Terjadi Kesalahan Saat Menghapus Data"
            respond([:], status: 400)
        }
    }
}
