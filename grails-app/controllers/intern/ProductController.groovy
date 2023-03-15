package intern
import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile

@Secured(['ROLE_ADMIN'])
@Transactional
class ProductController {

    def productService

    def index() {
        List<Product> products = productService.getAllProduct()
        // Pass the image upload path as a model attribute
        def imageUploadPath = grailsApplication.config.myapp.imageUploadPath
        render(view: "/user/product", model: [products: products, imageUploadPath: imageUploadPath])
    }

    def addProduct(){
        render(view: "/user/formProduct")
    }

    def saveProduct(Product product){
        MultipartFile imageFile = request.getFile('file')
        productService.addDataProduct(params, product, imageFile)
        if (product.hasErrors()) {
            // Redirect back to the form
            respond([:], view: "/user/formProduct", model: [productError : product], status: 400)
            return
        }
        flash.message = "Data Berhasil di Simpan"
        redirect(action: "index")
    }

    def editProduct(long id){
        Product product = Product.findById(id)
        render(view: "/user/editProduct", model: [product: product])
    }

    def updateProduct(long id){
        Product product = Product.findById(id)
        MultipartFile imageFile = request.getFile('file')
        productService.updateDataProduct(params, product, imageFile)
        if (product.hasErrors()) {
            // Redirect back to the form
            Product productData = Product.findById(id)
            respond([:], view: "/user/editProduct", model: [product: productData, productError : product], status: 400)
            return
        }
        flash.message = "Data Berhasil di Ubah"
        redirect(action: "index")
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
