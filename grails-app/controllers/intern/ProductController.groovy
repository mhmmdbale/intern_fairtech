package intern
import org.springframework.transaction.annotation.Transactional

@Transactional
class ProductController {

    def productService

    def index() {
        render(view: "/user/product")
    }

    def addProduct(){
        render(view: "/user/formProduct")
    }

    def saveProduct(){
        def product = new Product(params)
        if (!product.validate()) {
            // If validation fails, add errors to the flash scope
            flash.errors = product.errors
            // Redirect back to the form
            redirect(action: "addProduct")
            return
        }
        productService.addDataProduct(params)

        redirect(action: "index")
    }
}
