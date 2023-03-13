package intern
import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional
class ProductController {

    def productService

    def index() {
        List<Color> products = productService.getAllProduct()
        // Pass the image upload path as a model attribute
        def imageUploadPath = grailsApplication.config.myapp.imageUploadPath
        render(view: "/user/product", model: [products: products, imageUploadPath: imageUploadPath])
    }

    def addProduct(){
        render(view: "/user/formProduct")
    }

    def saveProduct(){
        def product = new Product(params)
        product.validate()
        if (product.hasErrors()) {
            // Redirect back to the form
            render(view: "/user/formProduct", model: [productError : product])
            return
        }
        productService.addDataProduct(params, request)
        flash.message = "Data Berhasil di Simpan"

        redirect(action: "index")
    }

    def editProduct(long id){
        Product product = Product.findById(id)
        render(view: "/user/editProduct", model: [product: product])
    }

    def deleteProduct(long id){
        try {
            productService.deleteDataProduct(id)
            flash.message = "Data Berhasil di Hapus"
        } catch (Exception e) {
            flash.error = "Terjadi Kesalahan Saat Menghapus Data"
        }

        redirect(action: "index")
    }
}
