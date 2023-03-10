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
        if (!product.validate()) {
            // If validation fails, add errors to the flash scope
            flash.message = "Kode telah ada sebelumnya"
            // Redirect back to the form
            redirect(action: "addProduct")
            return
        }
        productService.addDataProduct(params, request)

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
