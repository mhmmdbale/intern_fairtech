package intern

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.MultipartFile
import grails.core.GrailsApplication
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.nio.file.Files
import java.nio.file.Paths
import intern.ProductColor.ColorStatus
import intern.Product.ProductType
import intern.Product.ProductSleeve

@Transactional
class ProductService {
    GrailsApplication grailsApplication

    List<Color> getAllColor(){
        List<Color> colors = Color.createCriteria().list {} as List<Color>
        return colors
    }

    List<Product> getAllProduct(){
        List<Product> products = Product.createCriteria().list {} as List<Product>
        return products
    }

    Product getProductById(long id){
        Product product = Product.createCriteria().get {
            idEq(id)
        } as Product
        return product
    }

    ProductColor getProductColorById(long id){
        ProductColor productColor = ProductColor.createCriteria().get {
            idEq(id)
        } as ProductColor
        return productColor
    }

    ProductType getProductType(GrailsParameterMap params){
        String type = params.type

        if (type == "KAOS") {
            return ProductType.KAOS
        } else if (type == "JAKET") {
            return ProductType.JAKET
        } else if (type == "SWEETER") {
            return ProductType.SWEETER
        }
        return null
    }

    ProductSleeve getProductSleeve(GrailsParameterMap params){
        String sleeve = params.sleeve

        if (sleeve == "PENDEK") {
            return ProductSleeve.PENDEK
        } else if (sleeve == "PANJANG") {
            return ProductSleeve.PANJANG
        }
        return null
    }

    ColorStatus getProductColorStatus(GrailsParameterMap params){
        String status = params.status

        if (status == "READY"){
            return ColorStatus.READY
        } else if (status == "PREORDER"){
            return ColorStatus.PREORDER
        } else if (status == "EMPTY"){
            return ColorStatus.EMPTY
        }
        return null
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
        def product = getProductById(id)
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
        def color = Color.createCriteria().get {
            idEq(id)
        }
        if (color) {
            ProductColor.where { color == color }.deleteAll()
            color.delete()
        }
    }

    List<Color> getAvaliableColor(Product product){
        List<ProductColor> productColors = ProductColor.findAllByProduct(product)
        List<Color> colors
        if (productColors) {
            colors = Color.createCriteria().list {
                not {
                    'in'('id', productColors.collect { it.color.id })
                }
                order("name", "asc")
            } as List<Color>
        } else {
            colors = Color.list().sort { it.name }
        }
        return colors
    }

    List<ProductColor> getProductColorbyProduct(Product product){
        List<ProductColor> productColors = ProductColor.createCriteria().list {
            eq("product", product)
        } as List<ProductColor>
        return productColors
    }

    void saveProductColor(Product product, List<Long> selectedColorIds){
        selectedColorIds.each { colorId ->
            ProductColor.create(product, Color.findById(colorId as Long))
        }
    }

    void updateProductColor(GrailsParameterMap params, ProductColor productColor){
        productColor.status = getProductColorStatus(params)
        productColor.save(flush: true)
    }

    void deleteProductColor(long id){
        ProductColor productColor = getProductColorById(id)
        productColor.delete()
    }
}
