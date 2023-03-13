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
import grails.util.Holders
import org.springframework.core.io.Resource

@Transactional
class ProductService {

    def assetResourceLocator
    def assetProcessorService
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

    void addDataProduct(GrailsParameterMap params, HttpServletRequest request) {
        // Get the uploaded file from the request
        MultipartFile imageFile = request.getFile('file')

        Product product = new Product()
        product.code = params.code
        product.name = params.name
        product.type = getProductType(params)
        product.sleeve = getProductSleeve(params)
        product.price = params.price.toInteger()

        // Do something with the file
        if (imageFile?.isEmpty() == false) {
            // Save the file to the assets directory
            LocalDateTime now = LocalDateTime.now()
            String formattedDateTime = now.format(DateTimeFormatter.ofPattern('yyyyMMddHHmmssSSS'))
            String originalFilename = imageFile.getOriginalFilename()
            String fileName = "${formattedDateTime}_${originalFilename}"

            String assetsPath = grailsApplication.config.myapp.imageUploadPath
//            String assetsPath = grailsApplication.mainContext.servletContext.getRealPath('/assets')
            def productsPath = "${assetsPath}/products"

            def file = new File("${productsPath}/${fileName}")
            imageFile.transferTo(file)

            // Set the image filename in the Product object
            product.image = fileName
        }

        product.save(flush: true)
    }

    void deleteDataProduct(long id){
        Product product = Product.findById(id)
        if (product) {
            ProductColor.where { product == product }.deleteAll()
            // Check if the image file exists and delete it
            if (product.image) {
                String assetsPath = grailsApplication.config.myapp.imageUploadPath
                String imagePath = "${assetsPath}/products/${product.image}"
                if (Files.exists(Paths.get(imagePath))) {
                    Files.delete(Paths.get(imagePath))
                }
            }
            product.delete()
        }
    }

    void addDataColor(GrailsParameterMap params) {

        Color color = new Color()
        color.code = params.code
        color.name = params.name

        color.save(flush: true)
    }

    void updateDataColor(long id, GrailsParameterMap params){
        Color color = Color.findById(id)
        color.code = params.code
        color.name = params.name

        color.save(flush: true)
    }

    void deleteDataColor(long id){
        Color color = Color.findById(id)
        if (color) {
            ProductColor.where { color == color }.deleteAll()
            color.delete()
        }
    }
}
