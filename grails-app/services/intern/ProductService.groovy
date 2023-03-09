package intern

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ProductService {

    def getAllColor(){
        List<Color> colors = Color.list()
        return colors
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
        def sleeve = params.type

        if (sleeve == "PENDEK") {
            return Product.ProductSleeve.PENDEK
        } else if (sleeve == "PANJANG") {
            return Product.ProductSleeve.PANJANG
        }
    }

    void addDataProduct(GrailsParameterMap params) {

        Product product = new Product()
        product.code = params.code
        product.name = params.name
        product.type = params.type
        product.sleeve = params.sleeve
        product.price = params.price.toInteger()

        product.save(flush: true)
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
