package intern

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.MultipartFile
import javax.servlet.http.HttpServletRequest
import grails.core.GrailsApplication
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.nio.file.Files
import java.nio.file.Paths

@Transactional
class ProductService {
    GrailsApplication grailsApplication
    def servletContext

    def getAllColor(){
        List<Color> colors = Color.list()
        return colors
    }

    def getAllProduct(){
        List<Product> products = Product.list()
        return products
    }

    def getProductType(GrailsParameterMap params){
        def type = params.type

        if (type == "KAOS") {
            return Product.ProductType.KAOS
        } else if (type == "JAKET") {
            return Product.ProductType.JAKET
        } else if (type == "SWEETER") {
            return Product.ProductType.SWEETER
        }
    }

    def getProductSleeve(GrailsParameterMap params){
        def sleeve = params.sleeve

        if (sleeve == "PENDEK") {
            return Product.ProductSleeve.PENDEK
        } else if (sleeve == "PANJANG") {
            return Product.ProductSleeve.PANJANG
        }
    }

    void deleteImage(String image){
        String assetsPath = grailsApplication.config.myapp.imageUploadPath
        String imagePath = "${assetsPath}/products/${image}"
        if (Files.exists(Paths.get(imagePath))) {
            Files.delete(Paths.get(imagePath))
        }
    }

    String storeImage(MultipartFile imageFile){
        // Save the file to the assets directory
        LocalDateTime now = LocalDateTime.now()
        String formattedDateTime = now.format(DateTimeFormatter.ofPattern('yyyyMMddHHmmssSSS'))
        String originalFilename = imageFile.getOriginalFilename()
        String fileName = "${formattedDateTime}_${originalFilename}"

        String assetsPath = grailsApplication.config.myapp.imageUploadPath
        def productsPath = "${assetsPath}/products"

        def file = new File("${productsPath}/${fileName}")
        imageFile.transferTo(file)

        return fileName
    }

    void addDataProduct(GrailsParameterMap params, Product product, MultipartFile imageFile) {
        product.code = params.code
        product.name = params.name
        product.type = getProductType(params)
        product.sleeve = getProductSleeve(params)
        product.price = params.price.toInteger()

        product.validate()
        if(!product.hasErrors()){
            // Do something with the file
            if (!imageFile?.isEmpty()) {
                String fileName = storeImage(imageFile)
                product.image = fileName
            }
            product.save(flush: true, failOnError: true)
        }
    }

    void updateDataProduct(GrailsParameterMap params, Product product, MultipartFile imageFile){
        product.code = params.code
        product.name = params.name
        product.type = getProductType(params)
        product.sleeve = getProductSleeve(params)
        product.price = params.price.toInteger()

        product.validate()
        if(!product.hasErrors()){
            if(product.image){
                if(params.del_file){
                    deleteImage(product.image)
                    product.image = null
                    if(imageFile?.isEmpty() == false) {
                        String fileName = storeImage(imageFile)

                        product.image = fileName
                    }
                }
            }else {
                if(imageFile?.isEmpty() == false) {
                    String fileName = storeImage(imageFile)

                    product.image = fileName
                }
            }
            product.save(flush: true)
        }
    }

    void deleteDataProduct(long id){
        Product product = Product.findById(id)
        if (product) {
            ProductColor.where { product == product }.deleteAll()
            // Check if the image file exists and delete it
            if (product.image) {
                deleteImage(product.image)
            }
            product.delete()
        }
    }

    void addDataColor(GrailsParameterMap params, Color color) {
        color.code = params.code
        color.name = params.name

        color.validate()
        if(!color.hasErrors()){
            color.save(flush: true, failOnError: true)
        }
    }

    void updateDataColor(GrailsParameterMap params, Color color){
        color.code = params.code
        color.name = params.name

        color.validate()
        if(!color.hasErrors()){
            color.save(flush: true, failOnError: true)
        }
    }

    void deleteDataColor(long id){
        Color color = Color.findById(id)
        if (color) {
            ProductColor.where { color == color }.deleteAll()
            color.delete()
        }
    }
}
